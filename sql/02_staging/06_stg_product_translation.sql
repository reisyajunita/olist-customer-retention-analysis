-- ============================================================
-- 06_stg_product_translation.sql
-- Tujuan: Membuat staging table untuk kolom-kolom yang dibutuhkan
-- ============================================================
USE olist_raw;

CREATE TABLE stg_product_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

INSERT INTO stg_product_translation
SELECT 
    TRIM(BOTH '\r' FROM product_category_name),
    TRIM(BOTH '\r' FROM product_category_name_english)
FROM raw_product_category_translation;


