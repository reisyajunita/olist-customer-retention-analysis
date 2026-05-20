-- ============================================================
-- 10_BQ1_customer_frequency.sql
-- Tujuan: Melihat perbandingan customer sekali order
-- dengan yang repeat order dalam bentuk persen
-- Staging tables: 'stg_customers', 'stg_orders'
-- ============================================================

USE olist_raw;

WITH freq_cust AS
    (
    SELECT sc.customer_unique_id AS customer_unique_id,
            COUNT(so.order_id) AS count_order,
            CASE 
                WHEN COUNT(so.order_id) = 1 THEN 'sekali order'
                ELSE 'repeat order'
            END AS kategori
    FROM stg_orders AS so
    JOIN stg_customers AS sc 
        ON so.customer_id = sc.customer_id
    WHERE so.order_status = 'delivered'
    GROUP BY sc.customer_unique_id
    )

SELECT kategori, 
        COUNT(customer_unique_id) AS total_order,
        ROUND((COUNT(customer_unique_id) / (SELECT COUNT(customer_unique_id) FROM freq_cust)), 2) * 100 AS persentase
FROM freq_cust
GROUP BY kategori;