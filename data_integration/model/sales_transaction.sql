/* Create table sales transaction to load data */
CREATE TABLE analytics.sales_transaction 
(
    record_id TEXT NOT NULL 
    , invoice_id VARCHAR NOT NULL
    , item_id VARCHAR NOT NULL
    , item_name VARCHAR NOT NULL
    , quantity NUMERIC NOT NULL
    , invoice_date DATE NOT NULL
    , unit_price NUMERIC NOT NULL
    , customer_id VARCHAR NOT NULL
    , country  VARCHAR NOT NULL
    , PRIMARY KEY(record_id) 
)

TABLESPACE pg_default ;

ALTER TABLE analytics.sales_transaction 
    OWNER TO postgres;

/* load csv file
the data from https://www.kaggle.com/carrie1/ecommerce-data */

COPY analytics.sales_transaction(record_id, invoice_id, item_id, item_name, quantity,
    invoice_date, unit_price, customer_id, country )
FROM 'C:\CSV\data_to_load.csv'
DELIMITER ','
CSV HEADER ENCODING  'windows-1251';

/* check the loading data process*/
SELECT *
FROM analytics.sales_transaction 
LIMIT 100
  

 

 

