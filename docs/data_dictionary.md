# Data Dictionary – Dataset Olist

## 1. Overview

- **Sumber Data:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Jenis Data:** Data transaksi e-commerce
- **Entitas Utama:** Customer, Order, Product, Payment
- **Rentang Waktu:** 2016 – 2018
- **Grain Analisis Utama:** Level customer (hasil agregasi dari data order)



## 2. Raw Tables

### Table: olist_customers_dataset

| Nama Kolom               | Tipe Data | Deskripsi |
|--------------------------|----------|-----------|
| customer_id              | VARCHAR  | ID unik customer untuk setiap pesanan |
| customer_unique_id       | VARCHAR  | ID unik customer yang sama untuk beberapa pesanan |
| customer_zip_code_prefix | INT      | 5 digit awal kode pos customer |
| customer_city            | VARCHAR  | Kota lokasi customer |
| customer_state           | VARCHAR  | Negara bagian lokasi customer |



### Table: olist_orders_dataset

| Nama Kolom                    | Tipe Data | Deskripsi |
|-------------------------------|----------|-----------|
| order_id                      | VARCHAR  | ID unik setiap pesanan |
| customer_id                   | VARCHAR  | ID customer yang melakukan pesanan |
| order_status                  | VARCHAR  | Status pesanan |
| order_purchase_timestamp      | DATETIME | Waktu pesanan dibuat |
| order_approved_at             | DATETIME | Waktu pesanan disetujui |
| order_delivered_carrier_date  | DATETIME | Tanggal pesanan diserahkan ke kurir |
| order_delivered_customer_date | DATETIME | Tanggal pesanan diterima customer |
| order_estimated_delivery_date | DATETIME | Estimasi tanggal pengiriman |



### Table: olist_order_items_dataset

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| order_id | VARCHAR | ID pesanan |
| order_item_id | INT | Nomor item dalam satu pesanan |
| product_id | VARCHAR | ID produk yang dibeli |
| seller_id | VARCHAR | ID penjual |
| shipping_limit_date | DATETIME | Batas waktu pengiriman oleh penjual |
| price | DECIMAL | Harga produk |
| freight_value | DECIMAL | Biaya pengiriman |



### Table: olist_order_payments_dataset

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| order_id | VARCHAR | ID pesanan |
| payment_sequential | INT | Nomor urutan pembayaran |
| payment_method | VARCHAR | Metode pembayaran |
| payment_installments | INT | Jumlah cicilan pembayaran |
| payment_value | DECIMAL | Total nilai pembayaran |

### Table: olist_order_reviews_dataset
| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| review_id | VARCHAR | ID unik ulasan |
| order_id | VARCHAR | ID pesanan yang diulas |
| review_score | INT | Skor kepuasan (skala 1-5) |
| review_comment_title | VARCHAR | Judul ulasan yang ditulis customer |
| review_comment_message | TEXT | Isi pesan teks ulasan dari customer |
| review_creation_date | DATETIME | Tanggal survei kepuasan dikirim ke customer |
| review_answer_timestamp | DATETIME | Tanggal customer mengisi survei tersebut |


### Table: olist_products_dataset

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| product_id | VARCHAR | ID unik produk |
| product_category_name | VARCHAR | Nama kategori produk (Bahasa Portugis) |
| product_name_lenght | INT | Panjang nama produk |
| product_description_lenght | INT | Panjang deskripsi produk |
| product_photos_qty | INT | Jumlah foto produk |
| product_weight_g | INT | Berat produk (gram) |
| product_length_cm | INT | Panjang produk (cm) |
| product_height_cm | INT | Tinggi produk (cm) |
| product_width_cm | INT | Lebar produk (cm) |



### Table: olist_product_category_name_translation_dataset

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| product_category_name | VARCHAR | Nama kategori produk asli |
| product_category_name_english | VARCHAR | Terjemahan kategori produk dalam Bahasa Inggris |

### Table: olist_seller_dataset

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| seller_id | VARCHAR | ID unik untuk setiap penjual (merchant) |
| seller_zip_code_prefix | INT | 5 digit awal kode pos lokasi penjual |
| seller_city | VARCHAR | Kota lokasi penjual |
| seller_state | VARCHAR | Negara bagian lokasi penjual (kode wilayah) |

### Table: olist_geolocation_dataset

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| geolocation_zip_code_prefix | INT | 5 digit awal kode pos |
| geolocation_lat | FLOAT | Garis lintang (latitude) |
| geolocation_lng | FLOAT | Garis bujur (longtitude) |
| geolocation_city | VARCHAR | Nama kota |
| geolocation_state | VARCHAR | Kode negara |


## 3. Staging Tables


### Table: stg_customers

Tabel customer hasil pembersihan data dari `olist_customers_dataset`.  
Tabel ini berisi kolom-kolom yang digunakan sebagai dasar analisis pada level customer.

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| customer_id | VARCHAR | ID unik customer untuk setiap pesanan |
| customer_unique_id | VARCHAR | ID unik customer yang sama untuk beberapa pesanan |

### Table: stg_orders

Tabel order hasil pembersihan data dari `olist_orders_dataset`.  
Tabel ini berisi informasi pesanan yang digunakan dalam analisis retensi pelanggan.

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| order_id | VARCHAR | ID unik setiap pesanan |
| customer_id | VARCHAR | ID customer yang melakukan pesanan |
| order_status | VARCHAR | Status pesanan |
| order_purchase_timestamp | DATETIME | Waktu pesanan dibuat |
| order_delivered_customer_date | DATETIME | Tanggal pesanan diterima customer |
| order_estimated_delivery_date | DATETIME | Estimasi tanggal pengiriman |

### Table: stg_order_items

Tabel order items hasil pembersihan data dari `olist_order_items_dataset`.
Tabel ini berisi informasi item-item yang ada dalam setiap pesanan, termasuk produk yang dibeli, harga, dan biaya pengiriman.

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| order_id | VARCHAR | ID pesanan |
| order_item_id | INT | Nomor item dalam satu pesanan |
| product_id | VARCHAR | ID produk yang dibeli |
| shipping_limit_date | DATETIME | Batas waktu pengiriman oleh penjual |
| price | DECIMAL | Harga produk |
| freight_value | DECIMAL | Biaya pengiriman |

### Table: stg_order_payments

Tabel order payments hasil pembersihan data dari `olist_order_payments_dataset`.
Tabel ini berisi informasi metode pembayaran yang digunakan dalam setiap pesanan, termasuk total nilai pembayarannya.

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| order_id | VARCHAR | ID pesanan |
| payment_sequential | INT | Nomor urutan pembayaran |
| payment_method | VARCHAR | Metode pembayaran |
| payment_value | DECIMAL | Total nilai pembayaran |

### Table: stg_order_reviews

Tabel order order reviews hasil pembersihan data dari `olist_order_reviews_dataset`.
Tabel ini berisi informasi review score yang diberikan pelanggan setiap pesanan.

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| review_id | VARCHAR | ID unik ulasan |
| order_id | VARCHAR | ID pesanan yang diulas |
| review_score | INT | Skor kepuasan (skala 1-5) |

### Table: stg_products

Tabel products hasil pembersihan data dari `olist_products_dataset`.
Tabel ini berisi informasi nama kategori produk dalam bahasa Portugis.

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| product_id | VARCHAR | ID unik produk |
| product_category_name | VARCHAR | Nama kategori produk (Bahasa Portugis) |

### Table: stg_product_translation

Tabel product translation hasil pembersihan data dari `olist_product_category_name_translation_dataset`.
Tabel ini berisi informasi terjemahan nama kategori produk dari bahasa Portugis ke bahasa Inggris.

| Nama Kolom | Tipe Data | Deskripsi |
|-----------|----------|-----------|
| product_category_name | VARCHAR | Nama kategori produk asli |
| product_category_name_english | VARCHAR | Terjemahan kategori produk dalam Bahasa Inggris |