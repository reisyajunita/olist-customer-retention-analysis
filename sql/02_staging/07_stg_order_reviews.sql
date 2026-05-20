-- ============================================================
-- 07_stg_order_reviews.sql
-- Tujuan: Membuat staging table untuk kolom-kolom yang dibutuhkan
-- ============================================================
USE olist_raw;

CREATE TABLE stg_order_reviews AS
        SELECT CAST(review_id AS CHAR(50)) AS review_id,
                CAST(order_id AS CHAR(50)) AS order_id,

                CASE
                    WHEN review_score = '' THEN NULL
                    ELSE CAST(review_score AS DECIMAL(10, 0))
                END AS review_score    
        FROM raw_order_reviews;
