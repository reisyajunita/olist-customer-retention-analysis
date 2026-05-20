-- 01_load_raw_data.sql
-- deskripsi: import data CSV ke MySQL (kecuali tabel reviews)

USE olist_raw;

-- 1. Tabel product category name translation
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/product_category_name_translation.csv'
INTO TABLE raw_product_category_translation
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 2. Tabel products
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
INTO TABLE raw_products
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 3. Tabel sellers
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_sellers_dataset.csv'
INTO TABLE raw_sellers
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 4. Tabel customers
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_customers_dataset.csv'
INTO TABLE raw_customers
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 5. Tabel orders
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_orders_dataset.csv'
INTO TABLE raw_orders
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 6. Tabel order items
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_items_dataset.csv'
INTO TABLE raw_order_items
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 7. Tabel order payments
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_payments_dataset.csv'
INTO TABLE raw_order_payments
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 8. Tabel order reviews
-- skip: bagian ini dikerjakan oleh scripts/ingest_reviews.py
-- karena data mengandung special characters yang gagal di SQL.


-- 9. Tabel geolocation
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_geolocation_dataset.csv'
INTO TABLE raw_geolocation
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS;