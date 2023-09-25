
TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_prod;

COPY cic_retail_bidw_stage.stage_hier_prod
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.prod.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_invloc;

COPY cic_retail_bidw_stage.stage_hier_invloc
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.invloc.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_possite;

COPY cic_retail_bidw_stage.stage_hier_possite
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.possite.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_rtlloc;

COPY cic_retail_bidw_stage.stage_hier_rtlloc
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.rtlloc.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_clnd;

COPY cic_retail_bidw_stage.stage_hier_clnd
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.clnd.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_hldy;

COPY cic_retail_bidw_stage.stage_hier_hldy
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.hldy.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_invstatus;

COPY cic_retail_bidw_stage.stage_hier_invstatus
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.invstatus.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_hier_pricestate;

COPY cic_retail_bidw_stage.stage_hier_pricestate
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/hier.pricestate.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_fact_transactions;

COPY cic_retail_bidw_stage.stage_fact_transactions
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/fact.transactions.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_fact_averagecosts;

COPY cic_retail_bidw_stage.stage_fact_averagecosts
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/fact.averagecosts.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_fact_ships;

COPY cic_retail_bidw_stage.stage_fact_ships
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/fact.ships.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_fact_onhandinventory;

COPY cic_retail_bidw_stage.stage_fact_onhandinventory
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/fact.onhandinventory.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_fact_intransit;

COPY cic_retail_bidw_stage.stage_fact_intransit
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/fact.intransit.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_fact_onorder;

COPY cic_retail_bidw_stage.stage_fact_onorder
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/fact.onorder.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';


TRUNCATE TABLE cic_retail_bidw_stage.stage_fact_receipts;

COPY cic_retail_bidw_stage.stage_fact_receipts
FROM 's3://__CLIENT_S3_BUCKET__/data/staging/latest/fact.receipts.dlm'
IGNOREHEADER 1
BLANKSASNULL
GZIP
timeformat 'YYYY-MM-DDTHH:MI:SS'
iam_role '__REDSHIFT_COPY_ARN__';