-- ============================================================
-- 04_stg_order_items.sql
-- Tujuan: Membuat staging table untuk kolom-kolom yang dibutuhkan
-- ============================================================
USE olist_raw;


CREATE TABLE stg_order_items AS
        SELECT 
                CAST(order_id AS CHAR(50)) AS order_id, 
                CAST(order_item_id AS CHAR(5)) AS order_item_id,
                CAST(product_id AS CHAR(50)) AS product_id,

                CASE
                    WHEN shipping_limit_date = '' THEN NULL
                    ELSE CAST(shipping_limit_date AS DATETIME)
                END AS shipping_limit_date,

                CASE
                    WHEN price = '' THEN NULL
                    ELSE CAST(price AS DECIMAL(10, 2))
                END AS price,

                CASE
                    WHEN freight_value = '' THEN NULL
                    ELSE CAST(freight_value AS DECIMAL(10, 2))
                END AS freight_value

        FROM raw_order_items;