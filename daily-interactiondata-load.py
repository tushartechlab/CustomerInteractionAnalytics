from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.models import Variable
from datetime import datetime
from etl_csv_ingestion import ingest
from etl_data_transformation import transform_and_load
import logging

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
    'email_on_failure': True,
    'email': ['tushar.techlab@gmail.com'],
    'email_on_failure': True,
    'email_on_retry': False,
    'retries': 1
}


# Perform activities in case of DAG failure
def failure(context):
    logging.error(f"Your DAG has failed. Task {context['task_instance_key_str']} failed")
    logging.error(context)


daily_intercationdata_load = DAG(
    'daily-intercationdata-load',
    default_args=default_args,
    description='This DAG is responsible for ETL for customer interaction data',
    schedule_interval="0 1 * * *",
    catchup=False,
    on_failure_callback=failure
)

csv_ingestion = PythonOperator(
    task_id="csv_ingestion",
    python_callable=ingest,
    dag=daily_intercationdata_load
)

transformation_and_loading = PythonOperator(
    task_id="transformation_and_loading",
    python_callable=transform_and_load,
    dag=daily_intercationdata_load
)

csv_ingestion >> transformation_and_loading