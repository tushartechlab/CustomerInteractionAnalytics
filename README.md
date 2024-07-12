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
10. After you run the scripts, the data will be populated. Incase you want to run the python scripts multiple times, the data might get duplicated and there would be errors too. Hence please use the following commands to clean the tables before running the script multiple times :
truncate table [customer_interactions].[dbo].[tbl_customer_interactions]
truncate table [customer_interactions].[dbo].[fact_customer_interactions]


# Task 2 - Data Pipeline with Apache Airflow
1. Setup Docker and Airflow using the document "Airflow Docker Windows Setup Manual" available in the "Documents" folder of the repository.
2. Place the file "daily-interactiondata-load.py" available in the "Airflow" folder of the repository.
3. Since we want the airlfow workers to access the related files to process them, we might need to provide permissions to files which reside in your local directory. In the interest of time I put all the ETL and source files in the dags directory (not a good practice) of Airflow since I was short of time to deal with permissions. This way all files can be accessed by the workers. This includes the "CustomerInteractionData.csv" file from the Source folder of the repository, the "etl_csv_ingestion.py", "etl_data_transformation.py" & "config.ini" files from the ETL folder of the repository. Logs files will be created automatically.
4. Adjust the config.ini file to adjust the CSV path of source file to the dags folder directory if it doesn't work.
5. Run the DAG and that will populate the data in the 2 tables that we have created.
6. In case you want to run the DAG multiple times please run the commands in step 10 of Task 1 to clean the tables and reload data to avoid data duplication.

# Task 3 - Data Storage and Retrieval
1. The "2. create_ingestion_table.sql" & "3. create_fact_table.sql" files found under the "SQL Scripts" repository will create the tables in the database which will be used for running the data retrieval queries. I have created a very rudimentary fact table for data analysis in the interest of time, but we can add more dimension tables for more sophisticated design. This fact table will be our gold layer in our data lakehouse paradigm or simply the data warehouse component when we talk in terms of data lake or data warehouse.
2. Running the "5. sql_loaded_data.sql" script under the "SQL Scripts" folder will load the data in the two tables.
3. Run the "4. data_retrieval_scripts.sql" to get the data which are queries for the questions in the "2. Data Retrieval" section of Task 3.
4. The "Optimization Ideas for Queries.pdf" file in the "Documents" folder of the repository contains the ideas for optimizing the queries in the "4. data_retrieval_scripts.sql" file.

This what I tried to do best in the time we had. We can make more frameworks and extend designs to make a better data lakehouse project here.
