-- ============================================================
-- 02_stg_customers.sql
-- Tujuan: Membuat staging table untuk kolom-kolom yang dibutuhkan
-- ============================================================
USE olist_raw;

CREATE TABLE stg_customers AS
    SELECT 
        CAST(customer_id AS CHAR(50)) AS customer_id,
        CAST(customer_unique_id AS CHAR(50)) AS customer_unique_id
    FROM raw_customers
;
