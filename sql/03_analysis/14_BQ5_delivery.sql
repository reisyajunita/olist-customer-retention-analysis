-- ============================================================
-- 14_BQ5_delivery.sql
-- Tujuan: Melihat pengaruh ketepatan waktu pengiriman terhadap
--         pelanggan yang repeat order.
-- Staging tables: 'stg_customers', 'stg_orders'
-- ============================================================

USE olist_raw;

WITH repeat_cust AS
    (
        SELECT 
            sc.customer_unique_id AS customer_unique_id,
            COUNT(so.order_id) AS total_order,
            CASE
                WHEN COUNT(so.order_id) = 1 THEN 'sekali beli'
                ELSE 'repeat order'
            END AS kategori
        FROM stg_customers AS sc
        JOIN stg_orders AS so ON sc.customer_id = so.customer_id
        WHERE so.order_status = 'delivered'
        GROUP BY sc.customer_unique_id
    ),
    cust_date AS
    (
        SELECT 
            sc.customer_unique_id AS customer_unique_id,
            MAX(so.order_delivered_customer_date) AS delivered_date,
            MAX(so.order_estimated_delivery_date) AS estimated_date
        FROM stg_customers AS sc
        JOIN stg_orders AS so ON sc.customer_id = so.customer_id
        WHERE so.order_status = 'delivered'
        GROUP BY sc.customer_unique_id
    )

SELECT kategori,
        CASE 
            WHEN DATEDIFF(delivered_date, estimated_date) > 0 THEN 'telat'
            ELSE 'tepat waktu' 
        END AS delivery_diff,
        COUNT(rc.customer_unique_id) AS jumlah_customer
FROM repeat_cust AS rc
    JOIN cust_date AS cd ON rc.customer_unique_id = cd.customer_unique_id
WHERE kategori = 'repeat order'
GROUP BY kategori, 
        CASE 
            WHEN DATEDIFF(delivered_date, estimated_date) > 0 THEN 'telat'
            ELSE 'tepat waktu' 
        END;