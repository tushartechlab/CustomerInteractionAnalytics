import configparser
import pandas as pd
import pyodbc
import sqlalchemy
import logging
from datetime import datetime

# Configuring logging
logging.basicConfig(level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s',
                    handlers=[logging.FileHandler("data_transformation.log"),
                              logging.StreamHandler()])


# Reading configuration file (config.ini)
def read_config(file_path):
    config = configparser.ConfigParser()
    config.read(file_path)
    return config


# Establishing SQL Server Connection
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


# Reading the cleaned interaction data from the table
def fetch_data_from_sql_server(conn, table_name):
    try:
        logging.info(f"Fetching data from {table_name}")
        query = f"SELECT [user_id],[product_id],cast([timestamp] as date) as [interaction_date] FROM {table_name};"
        df = pd.read_sql(query, conn)
        logging.info(f"Fetched {df.shape[0]} rows from {table_name}")
        return df
    except Exception as e:
        logging.error(f"Error fetching data from SQL Server: {e}")
        raise


# Transforming the data
def transform_data(df):
    try:
        logging.info("Transforming data and adding new calculated columns")

        # Calculating total interactions per user and per product
        interaction_count_df = df.groupby(
            ['user_id', 'product_id', 'interaction_date']
            ).size().reset_index(name='interaction_count')
        logging.info("Data transformation completed")
        return interaction_count_df

    except Exception as e:
        logging.error(f"Error transforming data: {e}")
        raise

# Loading the transformed data to fact table.
def update_data_to_sql_server(conn, table_name, df):
    try:
        logging.info(f"Loading transformed data to {table_name}")
        cursor = conn.cursor()
        for index, row in df.iterrows():
            insert_sql = f"""
            INSERT INTO dbo.{table_name} (user_id, product_id, interaction_date, interaction_count)
            VALUES ({row['user_id']}, {row['product_id']}, '{row['interaction_date']}', {row['interaction_count']});
            """.format(table_name=table_name)
            cursor.execute(insert_sql)

        conn.commit()

        logging.info(f"Transformed data loaded to {table_name}")
    except Exception as e:
        logging.error(f"Error loading transformed data to SQL Server: {e}")
        raise

# Main function
def transform_and_load():
    config_file_path = "config.ini"  # Path to your config file

    try:
        config = read_config(config_file_path)
        server = config['sql_server']['server']
        database = config['sql_server']['database']
        username = config['sql_server']['username']
        password = config['sql_server']['password']
        table_name = config['sql_server']['table_name']
        fact_table_name = config['sql_server']['fact_table_name']

        conn = create_db_connection(server, database, username, password)
        df = fetch_data_from_sql_server(conn, table_name)
        transformed_df = transform_data(df)
        update_data_to_sql_server(conn, fact_table_name, transformed_df)

    except Exception as e:
        logging.error(f"Data transformation failed: {e}")
    finally:
        if 'conn' in locals() and conn:
            conn.close()
            logging.info("SQL Server connection closed")

if __name__ == "__main__":
    transform_and_load()
