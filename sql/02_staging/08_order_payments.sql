-- ============================================================
-- 08_stg_order_payments.sql
-- Tujuan: Membuat staging table untuk kolom-kolom yang dibutuhkan
-- ============================================================
USE olist_raw;

CREATE TABLE stg_order_payments AS
        SELECT 
            CAST(order_id AS CHAR(50)) AS order_id,

            CASE
                WHEN payment_sequential = '' THEN NULL
                ELSE CAST(payment_sequential AS DECIMAL(10, 0))
            END AS payment_sequential,

            payment_method,

            CASE 
                WHEN payment_value = '' THEN NULL
                ELSE CAST(payment_value AS DECIMAL(10, 2))
            END AS payment_value

        FROM raw_order_payments;
