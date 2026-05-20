-- ============================================================
-- 09_add_index.sql
-- Tujuan: Menambahkan index pada staging tables untuk
--         mempercepat performa JOIN dan GROUP BY pada query analisis
-- ============================================================

USE olist_raw;

-- Index untuk stg_orders
CREATE INDEX idx_orders_customer ON stg_orders(customer_id);

-- Index untuk stg_customers
CREATE INDEX idx_customers_unique ON stg_customers(customer_unique_id);
CREATE INDEX idx_customers_id ON stg_customers(customer_id);

-- Index untuk stg_order_items
CREATE INDEX idx_items_order ON stg_order_items(order_id);
CREATE INDEX idx_items_product ON stg_order_items(product_id);

-- Index untuk stg_products
CREATE INDEX idx_products_id ON stg_products(product_id);
CREATE INDEX idx_products_category ON stg_products(product_category_name);

-- Index untuk stg_product_translation
CREATE INDEX idx_translation_category ON stg_product_translation(product_category_name);

-- Fix collation mismatch antara stg_products dan stg_product_translation
ALTER TABLE stg_products 
MODIFY product_category_name VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;