# 🛒 Analisis Retensi Pelanggan — Marketplace Olist Brazil

Analisis ini bertujuan untuk memahami perilaku retensi pelanggan pada platform marketplace Olist Brazil menggunakan data transaksi periode 2016–2018.

---

## 📌 Business Questions
1. Berapa persen perbandingan customer sekali order vs repeat order?
2. Kategori produk apa yang paling sering di repeat order?
3. Berapa rata-rata nilai review score customer yang repeat order?
4. Apakah metode pembayaran mempengaruhi perilaku pelanggan dalam repeat order?
5. Apakah ketepatan pengiriman dapat mempengaruhi repeat order?

---

## 🔍 Key Findings
- **97%** pelanggan hanya melakukan 1 kali pembelian, hanya **3%** yang repeat order.
- Kategori produk **bed_bath_table** dan **health_beauty** paling banyak di repeat order.
- Rata-rata review score pelanggan repeat order adalah **4.2/5**.
- **Credit card** mendominasi metode pembayaran pelanggan repeat order (9.064 pelanggan).
- **93%** pelanggan repeat order menerima pesanan tepat waktu.

---

## 🛠️ Tools
| Tool | Kegunaan |
|------|----------|
| MySQL | Pengolahan dan query data |
| Python | Visualisasi data |
| Tableau | Dashboard interaktif |

---

## 📁 Struktur Folder

```
OLIST_ANALYSIS/
│
├── data/
│   ├── raw/                          ← CSV asli dari dataset Olist
│   └── processed/                    ← Output hasil query analisis
│
├── docs/
│   ├── business_report.md            ← Laporan bisnis lengkap
│   └── data_dictionary.md            ← Dokumentasi tabel dan kolom
│
├── notebooks/
│   ├── 01_eda.ipynb                  ← Exploratory Data Analysis
│   └── 02_retention_insight.ipynb    ← Visualisasi insight retensi
│
├── scripts/
│   └── ingest_reviews.py             ← Load data reviews ke MySQL
│
├── sql/
│   ├── 01_setup/
│   │   ├── 00_database_setup.sql     ← Setup struktur database
│   │   └── 01_load_raw_data.sql      ← Load CSV ke MySQL
│   ├── 02_staging/
│   │   ├── 02_stg_customers.sql
│   │   ├── 03_stg_orders.sql
│   │   ├── 04_stg_order_items.sql
│   │   ├── 05_stg_products.sql
│   │   ├── 06_stg_product_translation.sql
│   │   ├── 07_stg_order_reviews.sql
│   │   ├── 08_order_payments.sql
│   │   └── 09_add_index.sql
│   └── 03_analysis/
│       ├── 10_BQ1_customer_frequency.sql
│       ├── 11_BQ2_product_category.sql
│       ├── 12_BQ3_review_score.sql
│       ├── 13_BQ4_payment_method.sql
│       └── 14_BQ5_delivery.sql
│
├── requirements.txt
├── .env                              ← Credentials (tidak di-commit)
├── .gitignore
└── README.md
```

---

## ⚙️ Cara Menjalankan Project
1. Clone repository ini
2. Install dependencies:
```bash
pip install -r requirements.txt
```
3. Buat file `.env` di root folder dan isi credentials MySQL:
    ```
    DB_HOST=localhost
    DB_USER=root
    DB_PASSWORD=your_password
    DB_PORT=3306
    DB_NAME=olist_raw
    ```
4. Jalankan SQL files secara berurutan mulai dari `sql/01_setup/`
5. Jalankan `scripts/ingest_reviews.py` untuk load data reviews
6. Buka notebooks untuk visualisasi

---

## 📄 Dokumentasi
- [Business Report](docs/business_report.md)
- [Data Dictionary](docs/data_dictionary.md)
- [Tableau Dashboard](https://public.tableau.com/views/olist_customer_retention/Dashboard)
---

## 📊 Dataset
[Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)