# ============================================================
# ingest_reviews.py
# Tujuan: Load data reviews dari CSV ke MySQL
# Alasan pakai Python: data reviews mengandung special characters
# yang gagal diimport langsung via SQL
# ============================================================

import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

# Load credentials dari .env
load_dotenv()
DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_PORT = os.getenv("DB_PORT")
DB_NAME = os.getenv("DB_NAME")
DB_NAME_ANALYTICS = os.getenv("DB_NAME_ANALYTICS")

# Buat koneksi ke MySQL
engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

# Load CSV reviews
reviews = pd.read_csv("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_reviews_dataset.csv")

# Konversi semua kolom ke string, ganti 'nan' dengan None (NULL di MySQL)
df = reviews.astype(str)
df = df.replace('nan', None)

# Insert ke tabel raw_order_reviews (replace jika sudah ada)
df.to_sql(
    name = 'raw_order_reviews',
    con = engine,
    if_exists = 'replace',
    index = False,
    chunksize = 1000
)

print(f"Berhasil insert {len(df)} baris ke raw_order_reviews")