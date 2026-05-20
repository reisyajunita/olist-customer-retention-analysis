-- ============================================================
-- 05_stg_products.sql
-- Tujuan: Membuat staging table untuk kolom-kolom yang dibutuhkan
-- ============================================================
USE olist_raw;

CREATE TABLE stg_products AS
        SELECT 
                CAST(product_id AS CHAR(50)) AS product_id,
                CAST(product_category_name AS CHAR(50)) AS product_category_name
FROM raw_products;
