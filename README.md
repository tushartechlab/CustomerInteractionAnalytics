# CustomerInteractionAnalytics
Hello Folks!
This document outlines the step by step process as to how to go about the setup and running of the code committed to this repository.
We will go Task Wise.

# Task 1 - Data Ingestion & ETL
Prerequisites in the system:
1. Any database engine ( I have used MS SQL Server, since that was already available on my laptop)
2. Python 3.10 or higher on your system
3. VSCode or any IDE to code Python.

Here are the steps for setup of task 1:
1. Open any code editor for the database (SQL Server Management Studio in my case) and run the code in the file : "1. create_database.sql". This will create the database.
2. Run the file "2. create_ingestion_table.sql" which will create the landing or bronze & silver zone for the raw data.
3. Run the file "3. create_fact_table.sql" which will create the fact table (rudimentary design for now due to lack of time). This will host the data for the fact data of customer interaction which is similar to data warehouse or gold zone.
4. Download the "CustomerInteractionData.csv" file and keep it in a folder. I am keeping all of this in the dags directory for now since I need to get airlfow workers to access this file since I didn't have time to setup permissions on other directories for docker. But for this task 1 purpose you can create a folder and keep this file there.
5. Also add the "etl_csv_ingestion.py" and "etl_data_transformation.py" file in the same directory. Also add the "config.ini" file there.
6. Update the config.ini file with the database credentials, servername, databasename, table name and filepath of the rawdata csv file which we added in this folder in step 4.
7. You can now open VSCode terminal, point it to the directory where the files are and run the first 2 files by using command
   python "etl_csv_ingestion.py"
   python "etl_data_transformation.py"
9. This will load data into the 2 tables we have created in the database and also create the "etl_ingestion.log" and "data_transformation.log" log files. I have removed logs from there to keep them small for quicker uploads.
10. I am uploading the file "5. sql_loaded_data.sql" which contains the data which is loaded into the tables using the ETL.
11. In case you want to run this pipeline again, to avoid data duplication please clean the tables with the following commands:
  truncate table [customer_interactions].[dbo].[tbl_customer_interactions]
  truncate table [customer_interactions].[dbo].[fact_customer_interactions]
I wanted to create an incremental datawarehouse but that would take a bit more longer but the time provided for the task is a bit short to achieve that.


# Task 2 - Data Pipeline with Apache Airflow

1. Follow the "Airflow Docker Windows Setup Manual.pdf" document to install docker and airflow on your system and get it running.
2. Go to the dags directory on your system and copy and paste the DAG file named "daily-interactiondata-load.py" which will take care of the orchestration and execution of the ETL system.
3. It is important that airflow workers are able to access all the files involved in the ETL but for that it is important to provide permissions for source file directories. In the interest of time we are putting everything in the dag directory (which is not a great practice) for it to execute. So copy the "CustomerInteractionData.csv" file to the dags directory.
4. To run the ETL file we will be importing them in our airlfow, hence we need to place those 2 files in our dags directory aswell. Copy the "etl_csv_ingestion.py" and "etl_data_transformation.py" files and paste them in the dags directory.
5. Go to the localhost:8080 webserver of airflow and find the dag "daily-interactiondata-load" in the list of dags and enable/unpause it. Once you unpause it, it will run directly.
6. If you want to run again, run the commands in Task 1, step 11 to clean the tables and load data again.
7. That's your airflow setup.

# Task 3 - Data Storage & Retrieval

1. The fact table is a rudimentary design of the datawarehouse which falls in gold layer in the data lakehouse paradigm or the data warehouse itself in traditional terms. The sql scripts for creating the table is "3. create_fact_table.sql". This will create the fact table.
2. Run the second part of the "5. sql_loaded_data.sql" which will load data into the table. Otherwise you can create the source table using "2. create_ingestion_table.sql" and run the entire script. This will populate some data in the fact table.
3. Run the queries in the file "4. data_retrieval_scripts.sql" to get the desired data for this task.
4. The "Optimization Ideas for Queries.pdf" file contains the ideas and tips that came to my mind for optimizing the data retrieval for the data retrieval queries.
