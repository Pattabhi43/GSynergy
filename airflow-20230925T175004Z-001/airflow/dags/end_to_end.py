from airflow import DAG
from airflow.models import Variable
from airflow.sensors.s3_key_sensor import S3KeySensor
from datetime import datetime, timedelta
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.email_operator import EmailOperator
from airflow.hooks.postgres_hook import PostgresHook
from airflow.utils.email import send_email_smtp

from pathlib import Path
import os, csv, re, subprocess, json


emailstart = """
      <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      <html xmlns="http://www.w3.org/1999/xhtml" style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;">
      <head>
      <meta name="viewport" content="width=device-width" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Batch Alert</title>


      <style type="text/css">
      img {
      max-width: 100%;
      }
      body {
      -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; height: 100%; line-height: 1.6em;
      }
      body {
      background-color: #f6f6f6;
      }
      @media only screen and (max-width: 640px) {
        body {
          padding: 0 !important;
        }
        h1 {
          font-weight: 800 !important; margin: 20px 0 5px !important;
        }
        h2 {
          font-weight: 800 !important; margin: 20px 0 5px !important;
        }
        h3 {
          font-weight: 800 !important; margin: 20px 0 5px !important;
        }
        h4 {
          font-weight: 800 !important; margin: 20px 0 5px !important;
        }
        h1 {
          font-size: 22px !important;
        }
        h2 {
          font-size: 18px !important;
        }
        h3 {
          font-size: 16px !important;
        }
        .container {
          padding: 0 !important; width: 100% !important;
        }
        .content {
          padding: 0 !important;
        }
        .content-wrap {
          padding: 10px !important;
        }
        .invoice {
          width: 100% !important;
        }
      }
      </style>
      </head>

      <body itemscope itemtype="http://schema.org/EmailMessage" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; width: 100% !important; height: 100%; line-height: 1.6em; background-color: #f6f6f6; margin: 0;" bgcolor="#f6f6f6">
      """

def run_sql_files_in_dir(**kwargs):
  pg_hook = PostgresHook('redshift_conn')
  dir = kwargs.get('directory')
  for file in os.listdir(dir):
    sql = open(f'{dir}/{file}','r').read()
    if '__REDSHIFT_COPY_ARN__' in sql:
      sql = sql.replace('__REDSHIFT_COPY_ARN__',Variable.get("REDSHIFTCOPYARN"))
    if '__CLIENT_S3_BUCKET__' in sql:
      sql = sql.replace('__CLIENT_S3_BUCKET__',Variable.get("S3BUCKET"))
    pg_hook.run(sql)

def run_metrics(**kwargs):
  data_dir = kwargs.get('data_directory')
  spec_dir = kwargs.get('spec_directory')
  metric_dir = kwargs.get('metric_directory')
  scope = kwargs.get('scope')
  stage = kwargs.get('stage')
  runtype = kwargs.get('runtype')

  os.makedirs(metric_dir, exist_ok=True)
  metricfile = open(f'{metric_dir}/allmetrics.dlm','a')
  varre = re.compile('\$\w+')
  fd = csv.DictReader(open(f'{spec_dir}/metrics.tsv'), delimiter='\t', quotechar='"')
  for row in fd:
    if row[stage] == 'Y':
      if runtype == 'bash':
        if '$file' in varre.findall(row[f'{stage} Script']):
          for f in os.listdir(data_dir):
            if f.startswith(f'{row["File Name"]}.'):
              if f.endswith('.gz'):
                out = subprocess.run(f'gunzip {data_dir}/{f}', shell=True, capture_output=True)
                f = f.replace('.gz','')
              fullname = f'{data_dir}/{f}'
              run = row[f'{stage} Script'].replace('$filename', row['File Name']).replace('$file',fullname)
              out = subprocess.run(run, shell=True, capture_output=True)
              print('|'.join([scope,stage,row['Metric ID'],out.stdout.decode('ascii').strip()]), file=metricfile)
        else:
          run = row[f'{stage} Script'].replace('$filename', f'{data_dir}/{row["File Name"]}')
          out = subprocess.run(run, shell=True, capture_output=True)
          print('|'.join([scope,stage,row['Metric ID'],out.stdout.decode('ascii').strip()]), file=metricfile)
      elif runtype == 'sql':
        pg_hook = PostgresHook('redshift_conn')
        row = pg_hook.get_first(row[f'{stage} Query'])
        print('|'.join(map(str,[scope,stage,row[0],row[1]])), file=metricfile)

  metricfile.close()

def run_alerts(**kwargs):
  batch_dir = kwargs.get('batch_directory')
  stage = kwargs.get('stage')
  out = subprocess.run(f'check-elt-alerts -m {batch_dir}/alertmetricspecs/metrics.tsv -a {batch_dir}/alertmetricspecs/alerts.tsv -s {stage} -v {batch_dir}/metrics/allmetrics.dlm', shell=True, capture_output=True)
  if out.stderr.decode('ascii').strip():
    outjson = json.loads(out.stderr.decode('ascii').strip())
    outjson['stage'] = stage
    raise ValueError(json.dumps(outjson))
  else:
    if out.stdout.decode('ascii').strip():
      outjson = json.loads(out.stdout.decode('ascii').strip())
      outjson['stage'] = stage
      if outjson['status'] != 'success' or len(outjson['data']) > 0:
        raise ValueError(json.dumps(outjson))


def notify_email(contextDict, **kwargs):
    """Send custom email alerts."""
    exceptionJson = json.loads(str(contextDict['exception']))
    headerText = ''
    if exceptionJson['stage'] == 'FILE':
      headerText = 'One or more files failed validation tests.'
    else:
      headerText = 'Data in Warehouse does not match source data.'
    

    # email title.
    title = f"Batch alert: {headerText} ({contextDict['ts']})"

    # email contents
    body = emailstart
    body +=  f"""
      <table class="body-wrap" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;" bgcolor="#f6f6f6"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;" valign="top"></td>
          <td class="container" width="800" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 800px !important; clear: both !important; margin: 0 auto;" valign="top">
            <div class="content" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 800px; display: block; margin: 0 auto; padding: 20px;">
              <table class="main" width="100%" cellpadding="0" cellspacing="0" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;" bgcolor="#fff"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="alert alert-warning" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: #FF9F00; margin: 0; padding: 20px;" align="center" bgcolor="#FF9F00" valign="top">
                    Error: {headerText} 
                  </td>
                </tr><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="content-wrap" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;" valign="top">
                    <table width="100%" cellpadding="0" cellspacing="0" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="content-block" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;" valign="top">
                          During today's batch run, the following errors were observed: <ul>
                      """
    for el in exceptionJson['data']:
      body += f"<li><i>{el['category']}</i> : {el['message']}</li>"
                      
    body +=       """</ul></td>
                      </tr><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="content-block" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;" valign="top">
                          The batch has been stopped. You can contact relevant parties for fixing the issue and restarting the batch accordingly. 
                        </td>
                      </tr></table></td>
                </tr></table><div class="footer" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;">
                <table width="100%" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="aligncenter content-block" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;" align="center" valign="top">You are receiving these batch alerts for sampleclient, since you are on the admin list, please contact IT if you wish to be removed.</td>
                  </tr></table></div></div>
          </td>
          <td style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;" valign="top"></td>
        </tr></table></body>
      </html>
    """

    send_email_smtp('tuncay.tekle@gmail.com', title, body)



default_args = {
  'owner': 'airflow',
  'depends_on_past': False,
  'start_date': datetime(2020, 6, 25),
  'email': ['tuncay.tekle@gmail.com'],
  'on_failure_callback': notify_email,
  'email_on_failure': False,
  'email_on_retry': False,
  'retries': 0,
  'retry_delay': timedelta(minutes=5)
}

dag = DAG('EndToEnd', 
          catchup=False,
          default_args=default_args, 
          schedule_interval= '@daily')

home = str(Path.home())

listen_to_source_metrics = S3KeySensor(
  task_id='listen_to_source_metrics',
  bucket_key='s3://{{var.value.S3BUCKET}}/data/staging/latest/source.metrics',
  wildcard_match=True,
  timeout=18*60*60,
  poke_interval=10,
  dag=dag)

move_to_archive = BashOperator(
  task_id='move_to_archive',
  bash_command='aws s3 cp s3://{{var.value.S3BUCKET}}/data/staging/latest/ s3://{{var.value.S3BUCKET}}/data/staging/archive/{{ts}}/ --recursive --include "*"',
  dag=dag)



download_data_files = BashOperator(
  task_id='download_all_files',
  bash_command='aws s3 cp s3://{{var.value.S3BUCKET}}/data/staging/latest/ ~/batch/{{ts}}/data/staging/ --recursive --include "*"',
  dag=dag)


move_source_metrics = BashOperator(
  task_id='move_source_metrics',
  bash_command='mkdir -p ~/batch/{{ts}}/metrics/; mv ~/batch/{{ts}}/data/staging/source.metrics ~/batch/{{ts}}/metrics/allmetrics.dlm',
  dag=dag)


download_spec_files = BashOperator(
  task_id='download_spec_files',
  bash_command='aws s3 cp s3://{{var.value.S3BUCKET}}/alertmetricspecs/ ~/batch/{{ts}}/alertmetricspecs/ --recursive --include "*"',
  dag=dag)

run_file_metrics = PythonOperator(
  task_id='run_file_metrics',
  op_kwargs={'data_directory': home + '/batch/{{ts}}/data/staging', 
            'spec_directory': home + '/batch/{{ts}}/alertmetricspecs/',
            'metric_directory': home + '/batch/{{ts}}/metrics/',
            'scope': '{{ts}}',
            'stage': 'FILE',
            'runtype': 'bash'},
  python_callable=run_metrics,
  dag=dag)

run_file_alerts = PythonOperator(
  task_id='run_file_alerts',
  op_kwargs={'stage': 'FILE',
             'batch_directory':  home + '/batch/{{ts}}/'}, 
  provide_context = True,
  python_callable=run_alerts,
  dag=dag)


get_staging_sql = BashOperator(
  task_id='get_staging_sql',
  bash_command='aws s3 cp s3://{{var.value.S3BUCKET}}/sql/staging/ ~/batch/{{ts}}/sql/staging/ --recursive --include "*"',
  dag=dag)

run_staging_sql = PythonOperator(
  task_id='run_staging_sql',
  op_kwargs={'directory': home + '/batch/{{ts}}/sql/staging'},
  python_callable=run_sql_files_in_dir,
  dag=dag)

run_staging_metrics = PythonOperator(
  task_id='run_staging_metrics',
  op_kwargs={'data_directory': home + '/batch/{{ts}}/data/staging', 
            'spec_directory': home + '/batch/{{ts}}/alertmetricspecs/',
            'metric_directory': home + '/batch/{{ts}}/metrics/',
            'scope': '{{ts}}',
            'stage': 'STAGING',
            'runtype': 'sql'},
  python_callable=run_metrics,
  dag=dag)


run_staging_alerts = PythonOperator(
  task_id='run_staging_alerts',
  op_kwargs={'stage': 'STAGING',
             'batch_directory':  home + '/batch/{{ts}}/'}, 
  provide_context = True,
  python_callable=run_alerts,
  dag=dag)


get_dw_sql = BashOperator(
  task_id='get_dw_sql',
  bash_command='aws s3 cp s3://{{var.value.S3BUCKET}}/sql/dw/ ~/batch/{{ts}}/sql/dw/ --recursive --include "*"',
  dag=dag)

run_dw_sql = PythonOperator(
  task_id='run_dw_sql',
  op_kwargs={'directory': home + '/batch/{{ts}}/sql/dw'},
  python_callable=run_sql_files_in_dir,
  dag=dag)

run_dw_metrics = PythonOperator(
  task_id='run_dw_metrics',
  op_kwargs={'data_directory': home + '/batch/{{ts}}/data/staging', 
            'spec_directory': home + '/batch/{{ts}}/alertmetricspecs/',
            'metric_directory': home + '/batch/{{ts}}/metrics/',
            'scope': '{{ts}}',
            'stage': 'DW',
            'runtype': 'sql'},
  python_callable=run_metrics,
  dag=dag)

run_dw_alerts = PythonOperator(
  task_id='run_dw_alerts',
  op_kwargs={'stage': 'DW',
             'batch_directory': home + '/batch/{{ts}}/'}, 
  provide_context = True,
  python_callable=run_alerts,
  dag=dag)

cleanup = BashOperator(
  task_id='cleanup',
  bash_command='aws s3 rm s3://{{var.value.S3BUCKET}}/data/staging/latest/ --recursive --include "*"',
  dag=dag)

successemail = EmailOperator(
  task_id='successemail',
  to = 'tuncay.tekle@gmail.com',
  subject = 'Batch successfully completed ({{ts}})',
  html_content = emailstart +f"""
      <table class="body-wrap" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; background-color: #f6f6f6; margin: 0;" bgcolor="#f6f6f6"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;" valign="top"></td>
          <td class="container" width="800" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; display: block !important; max-width: 800px !important; clear: both !important; margin: 0 auto;" valign="top">
            <div class="content" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; max-width: 800px; display: block; margin: 0 auto; padding: 20px;">
              <table class="main" width="100%" cellpadding="0" cellspacing="0" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; border-radius: 3px; background-color: #fff; margin: 0; border: 1px solid #e9e9e9;" bgcolor="#fff"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="alert alert-warning" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 16px; vertical-align: top; color: #fff; font-weight: 500; text-align: center; border-radius: 3px 3px 0 0; background-color: #40a34d; margin: 0; padding: 20px;" align="center" bgcolor="#40a34d" valign="top">
                    Success: Today's batch has been completed successfully.
                  </td>
                </tr><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="content-wrap" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 20px;" valign="top">
                    <table width="100%" cellpadding="0" cellspacing="0" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="content-block" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;" valign="top">
                          You can now use the system.</td>
                      </tr><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="content-block" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;" valign="top">
                          Please contact system administrators for any inquiries.
                        </td>
                      </tr></table></td>
                </tr></table><div class="footer" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; width: 100%; clear: both; color: #999; margin: 0; padding: 20px;">
                <table width="100%" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><tr style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;"><td class="aligncenter content-block" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 12px; vertical-align: top; color: #999; text-align: center; margin: 0; padding: 0 0 20px;" align="center" valign="top">You are receiving these batch alerts for sampleclient, since you are on the admin list, please contact IT if you wish to be removed.</td>
                  </tr></table></div></div>
          </td>
          <td style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0;" valign="top"></td>
        </tr></table></body>
      </html>
  """,
  mime_charset='utf-8',
  dag=dag)


listen_to_source_metrics >> move_to_archive
listen_to_source_metrics >> download_data_files >> move_source_metrics >> run_file_metrics
listen_to_source_metrics >> download_spec_files >> run_file_metrics >> run_file_alerts >> run_staging_sql
listen_to_source_metrics >> get_staging_sql >> run_staging_sql >> run_staging_metrics >> run_staging_alerts >> run_dw_sql
listen_to_source_metrics >> get_dw_sql >> run_dw_sql >> run_dw_metrics >> run_dw_alerts >> cleanup >> successemail

if __name__ == "__main__":
  dag.cli()