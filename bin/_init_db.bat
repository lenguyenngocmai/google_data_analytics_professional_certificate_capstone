psql ^
    --username =postgres^
    --host=localhost^
    --echo-all^
    --file=data_integration/_init_db/01_prepare.sql^
    --file=data_integration/_init_db/02_create_su.sql^
    --file=data_integration/_init_db/03_create_db.sql^


psql^
    --username=mkt_su^
    --host=localhost^
    --dbname=mkt_db^
    --echo-all^
    --file=data_integration/_init_db/10.create_schema.sql