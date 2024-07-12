import pandas as pd
import pyodbc
import logging
import io
import configparser

# Configure logging
logging.basicConfig(level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    handlers=[logging.FileHandler("etl_ingestion.log"),
                              logging.StreamHandler()])


# Function to read configuration file
def read_config(file_path):
    config = configparser.ConfigParser()
    config.read(file_path)
    return config


# Function to read CSV file
def read_csv(file_path):
    try:
        logging.info(f"Reading CSV file from {file_path}")
        df = pd.read_csv(file_path, encoding='utf-8')
        logging.info(f"CSV file read successfully with {df.shape[0]} rows and {df.shape[1]} columns")
        return df
    except Exception as e:
        logging.error(f"Error reading CSV file: {e}")
        raise


# Function to connect to SQL Server
def create_db_connection(server, database, username, password):
    try:
        logging.info("Connecting to SQL Server")
        conn_str = (
            f"DRIVER={{ODBC Driver 17 for SQL Server}};"
            f"SERVER={server};"
            f"DATABASE={database};"
            f"UID={username};"
            f"PWD={password}"
        )
        conn = pyodbc.connect(conn_str)
        logging.info("Connected to SQL Server successfully")
        return conn
    except Exception as e:
        logging.error(f"Error connecting to SQL Server: {e}")
        raise


# Function to insert data into SQL Server using bulk insert
def bulk_insert_data(conn, table_name, df):
    try:
        cursor = conn.cursor()
        logging.info(f"Inserting data into {table_name}")

        # Handle missing values: fill with default values or remove rows
        df.fillna({
            'user_id': -1,
            'product_id': -1,
            'action': 'unknown',
            'timestamp': pd.Timestamp('1900-01-01')
        }, inplace=True)

        # Update the timestamp varchar from CSV to timestamp data type
        df['timestamp'] = pd.to_datetime(df['timestamp'])
        
        # Generate a list of tuples for bulk insert
        data = [tuple(row) for row in df.values]
        placeholders = ", ".join(["?"] * len(df.columns))
        columns = ", ".join(df.columns)
        sql = f"INSERT INTO {table_name} ({columns}) VALUES ({placeholders})"
        
        cursor.fast_executemany = True
        cursor.executemany(sql, data)

        conn.commit()
        logging.info(f"Inserted {df.shape[0]} rows into {table_name}")
    except Exception as e:
        conn.rollback()
        logging.error(f"Error inserting data into SQL Server: {e}")
        raise

# Main function
def ingest():
    config_file_path = "config.ini"
        
    config = read_config(config_file_path)
    server = config['sql_server']['server']
    database = config['sql_server']['database']
    username = config['sql_server']['username']
    password = config['sql_server']['password']
    table_name = config['sql_server']['table_name']
    csv_file_path = config['csv']['file_Path']

    try:
        df = read_csv(csv_file_path)
        conn = create_db_connection(server, database, username, password)
        bulk_insert_data(conn, table_name, df)
    except Exception as e:
        logging.error(f"Data ingestion failed: {e}")
    finally:
        if 'conn' in locals() and conn:
            conn.close()
            logging.info("SQL Server connection closed")

if __name__ == "__main__":
    ingest()
