-- 00_database_setup.sql
-- deskripsi: membuat struktur tabel RAW (semua tipe data TEXT)

CREATE DATABASE IF NOT EXISTS olist_raw;
USE olist_raw;

-- 1. Tabel product category name translation
DROP TABLE IF EXISTS raw_product_category_translation;
CREATE TABLE raw_product_category_translation (
    product_category_name TEXT,
    product_category_name_english TEXT
);

-- 2. Tabel products
DROP TABLE IF EXISTS raw_products;
CREATE TABLE raw_products (
    product_id TEXT,
    product_category_name TEXT,
    product_name_lenght TEXT, -- Typo asli dari dataset dibiarkan
    product_description_lenght TEXT,
    product_photos_qty TEXT,
    product_weight_g TEXT,
    product_length_cm TEXT,
    product_height_cm TEXT,
    product_width_cm TEXT
);

-- 3. Tabel sellers
DROP TABLE IF EXISTS raw_sellers;
CREATE TABLE raw_sellers (
    seller_id TEXT,
    seller_zip_code_prefix TEXT,
    seller_city TEXT,
    seller_state TEXT
);

-- 4. Tabel customers
DROP TABLE IF EXISTS raw_customers;
CREATE TABLE raw_customers (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);

-- 5. Tabel orders
DROP TABLE IF EXISTS raw_orders;
CREATE TABLE raw_orders (
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TEXT,
    order_approved_at TEXT,
    order_delivered_carrier_date TEXT,
    order_delivered_customer_date TEXT,
    order_estimated_delivery_date TEXT
);

-- 6. Tabel order items
DROP TABLE IF EXISTS raw_order_items;
CREATE TABLE raw_order_items (
    order_id TEXT,
    order_item_id TEXT,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TEXT,
    price TEXT,
    freight_value TEXT 
);

-- 7. Tabel order payments
DROP TABLE IF EXISTS raw_order_payments;
CREATE TABLE raw_order_payments (
    order_id TEXT,
    payment_sequential TEXT,
    payment_method TEXT,
    payment_installments TEXT,
    payment_value TEXT
);

-- 8. Tabel order reviews
-- NOTE: Tabel ini strukturnya didefinisikan di sini, 
-- tapi pengisian datanya akan dilakukan oleh Python (ingest_reviews.py)
DROP TABLE IF EXISTS raw_order_reviews;
CREATE TABLE raw_order_reviews (
    review_id TEXT,
    order_id TEXT,
    review_score TEXT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TEXT,
    review_answer_timestamp TEXT
);

-- 9. Tabel geolocation
DROP TABLE IF EXISTS raw_geolocation;
CREATE TABLE raw_geolocation (
    geolocation_zip_code_prefix TEXT,
    geolocation_lat TEXT,
    geolocation_lng TEXT,
    geolocation_city TEXT,
    geolocation_state TEXT
);