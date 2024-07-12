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
1. Open any code editor for the database (SQL Server Management Studio in my case) and run the code in the file : "1. create_database.sql" available in the "SQL Scripts" folder. This will create the database.
2. Run the file "2. create_ingestion_table.sql" available in the "SQL Scripts" folder, which will create the landing or bronze & silver zone for the raw data.
3. Run the file "3. create_fact_table.sql" available in the "SQL Scripts" folder, which will create the fact table (rudimentary design for now due to lack of time). This will host the data for the fact data of customer interaction which is similar to data warehouse or gold zone.
4. Download the "CustomerInteractionData.csv" file available in the "Source" folder and keep it in a folder on your system. I am keeping all of this in the dags directory on my local system for now since I need to get airlfow workers to access this file since I didn't have time to setup permissions on other directories for docker. But for this task 1 purpose you can create a folder and keep this file there.
5. Also add the "etl_csv_ingestion.py" (available in the "ETL" folder) and "etl_data_transformation.py" (available in the "ETL" folder) file in the same directory. Also add the "config.ini" (available in the "ETL" folder) file there.
6. Update the config.ini file with the database credentials, servername, databasename, table name and filepath of the rawdata csv file which we added in this folder in step 4.
7. You can now open VSCode terminal, point it to the directory where the files are and run the first 2 files by using command
   python "etl_csv_ingestion.py"
   python "etl_data_transformation.py"
8. This will load data into the 2 tables we have created in the database and also create the "etl_ingestion.log" and "data_transformation.log" log files. I have removed logs from there to keep them small for quicker uploads.
9. I am uploading the file "5. sql_loaded_data.sql" which contains the data which is loaded into the tables using the ETL.
