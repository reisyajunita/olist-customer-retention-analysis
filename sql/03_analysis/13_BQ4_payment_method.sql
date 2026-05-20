-- ============================================================
-- 13_BQ4_payment_method.sql
-- Tujuan: Metode pembayaran yang paling banyak dipakai pelanggan
--         repeat order.
-- Staging tables: 'stg_customers', 'stg_orders', 'stg_order_items',
-- 'stg_order_payment'
-- ============================================================

USE olist_raw;

WITH repeat_order AS
    (
        SELECT 
            sc.customer_unique_id AS customer_unique_id,
            COUNT(so.order_id) AS total_order,
            CASE
                WHEN COUNT(so.order_id) = 1 THEN 'sekali beli'
                ELSE 'repeat order'
            END AS kategori,
            sop.payment_method AS payment_method
        FROM stg_customers AS sc 
        JOIN stg_orders AS so ON sc.customer_id = so.customer_id
        JOIN stg_order_items AS soi ON so.order_id = soi.order_id
        JOIN stg_order_payments sop ON soi.order_id = sop.order_id
        WHERE so.order_status = 'delivered'
        GROUP BY sc.customer_unique_id, sop.payment_method
    )

    SELECT 
        payment_method,
        COUNT(customer_unique_id) AS jumlah_customer
    FROM repeat_order
    WHERE kategori = 'repeat order'
    GROUP BY payment_method
    ORDER BY jumlah_customer DESC;