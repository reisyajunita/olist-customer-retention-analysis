-- ============================================================
-- 12_BQ3_review_score.sql
-- Tujuan: Melihat rata-rata nilai review score yang diberikan
--         oleh pelanggan repeat order.
-- Staging tables: 'stg_customers', 'stg_orders',
-- 'stg_order_reviews'
-- ============================================================

USE olist_raw;

-- Melihat Rata-rata Nilai Review Score yang Repeat Order
WITH repeat_cust AS
    (
    SELECT 
        sc.customer_unique_id AS customer_unique_id,
        COUNT(so.order_id) AS total_order,
        CASE
            WHEN COUNT(so.order_id) = 1 THEN 'sekali beli'
            ELSE 'repeat order'
        END AS kategori,
        AVG(sor.review_score) AS review_score
    FROM stg_customers AS sc
        JOIN stg_orders AS so ON sc.customer_id = so.customer_id
        JOIN stg_order_reviews AS sor ON so.order_id = sor.order_id
    WHERE so.order_status = 'delivered'
    GROUP BY sc.customer_unique_id
    )

SELECT kategori,
    ROUND(AVG(review_score), 2) AS avg_rating
FROM repeat_cust
WHERE kategori = 'repeat order'
GROUP BY kategori;

-- Melihat Distribusi Nilai Review Score Repeat Order
WITH repeat_cust AS
    (
    SELECT 
        sc.customer_unique_id AS customer_unique_id,
        COUNT(so.order_id) AS total_order,
        CASE
            WHEN COUNT(so.order_id) = 1 THEN 'sekali beli'
            ELSE 'repeat order'
        END AS kategori,
        AVG(sor.review_score) AS review_score
    FROM stg_customers AS sc
        JOIN stg_orders AS so ON sc.customer_id = so.customer_id
        JOIN stg_order_reviews AS sor ON so.order_id = sor.order_id
    WHERE so.order_status = 'delivered'
    GROUP BY sc.customer_unique_id
    )

SELECT ROUND(review_score) AS review_score,
    COUNT(customer_unique_id) AS jumlah_customer
FROM repeat_cust
WHERE kategori = 'repeat order'
GROUP BY ROUND(review_score)
ORDER BY review_score;