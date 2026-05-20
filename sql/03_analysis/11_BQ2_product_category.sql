-- ============================================================
-- 11_BQ2_product_category.sql
-- Tujuan: Product yang paling sering di repeat order
-- Staging tables: 'stg_customers', 'stg_orders', 'stg_order_items',
-- 'stg_products', 'stg_product_translation'
-- ============================================================

USE olist_raw;

SELECT spt.product_category_name_english AS kategori_produk,
       COUNT(soi.order_id) AS jumlah_order
FROM stg_order_items AS soi
        JOIN stg_orders AS so ON soi.order_id = so.order_id
        JOIN stg_customers AS sc ON so.customer_id = sc.customer_id
        JOIN stg_customers AS sc2 ON sc.customer_unique_id = sc2.customer_unique_id
        JOIN stg_orders AS so2 ON sc2.customer_id = so2.customer_id
        JOIN stg_products AS sp ON soi.product_id = sp.product_id
        JOIN stg_product_translation AS spt ON sp.product_category_name = spt.product_category_name
WHERE so.order_status = 'delivered'
GROUP BY spt.product_category_name_english
HAVING COUNT(DISTINCT sc.customer_unique_id) > 1
ORDER BY jumlah_order DESC
LIMIT 10;
