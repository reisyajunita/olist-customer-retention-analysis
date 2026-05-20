-- ============================================================
-- 03_stg_orders.sql
-- Tujuan: Membuat staging table untuk kolom-kolom yang dibutuhkan
-- ============================================================

USE olist_raw;

-- Membuat staging table order dan membersihkan tipe data
CREATE TABLE stg_orders AS
    SELECT 
            CAST(order_id AS CHAR(50)) AS order_id,
            CAST(customer_id AS CHAR(50)) AS customer_id, 
            CAST(order_status AS CHAR(15)) AS order_status,

            CASE
                WHEN order_purchase_timestamp = '' THEN NULL
                ELSE CAST(order_purchase_timestamp AS DATETIME)
            END AS order_purchase_timestamp,

            CASE 
                WHEN order_delivered_customer_date = '' THEN NULL 
                ELSE CAST(order_delivered_customer_date AS DATETIME)
            END AS order_delivered_customer_date,

            CASE
                WHEN order_estimated_delivery_date = '' THEN NULL
                ELSE CAST(order_estimated_delivery_date AS DATETIME)
            END AS order_estimated_delivery_date
    FROM raw_orders
;
