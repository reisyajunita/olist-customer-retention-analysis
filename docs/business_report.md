# Business Report - Customer Retention Analysis

## 1. Business Context (Konteks Bisnis)
Olist merupakan platform marketplace yang digunakan sebagai penghubung antara penjual dengan pelanggan di Brazil.

Di dunia marketplace, **retensi pelanggan** menjadi perhatian utama dalam melihat performa pendapatan, karena pelanggan yang melakukan **repeat order lebih menguntungkan** dibandingkan yang hanya sekali order. Jika perusahaan terus melakukan promosi untuk menggaet pelanggan baru tanpa memperhatikan pelanggan yang sudah ada, ini bisa berisiko perusahaan mengalami kerugian karena **biaya akuisisi pelanggan baru lebih mahal** dibanding mempertahankan pelanggan yang repeat order.

---

## 2. Business Problem (Masalah Bisnis)
Perusahaan tidak memiliki pemahaman dalam **mengelompokkan pelanggan sekali order dengan yang repeat order**, hal ini bisa berakibat pada pendapatan dan juga biaya promosi. Jika hal ini tidak segera dilakukan, perusahaan dapat mengalami kerugian akibat **over budget dalam melakukan promosi** dan juga dapat terjadi **penurunan pelanggan repeat order** di bulan-bulan selanjutnya.

---

## 3. Business Objective (Tujuan Bisnis)
Tujuan dari analisis ini adalah melihat **faktor pendorong** apa saja yang bisa menjadikan pelanggan melakukan repeat order, sehingga perusahaan dapat mengambil keputusan dalam melakukan **promosi ke berbagai segmen pelanggan**.

---

## 4. Business Questions (Pertanyaan Bisnis)
1. Berapa persen perbandingan customer sekali order vs repeat order?
2. Kategori produk apa yang paling sering di repeat order?
3. Berapa rata-rata nilai review score customer yang repeat order?
4. Apakah metode pembayaran mempengaruhi perilaku pelanggan dalam repeat order?
5. Apakah ketepatan pengiriman dapat mempengaruhi repeat order?

---

## 5. Dataset Overview
- **Sumber data:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Deskripsi:** Dataset ini berisi perilaku pelanggan dalam bertransaksi melalui platform marketplace Olist dengan rentang waktu dari **2016 sampai 2018**.
- **Tabel yang digunakan:** `olist_customers_dataset.csv`, `olist_order_items_dataset.csv`, `olist_order_payments_dataset.csv`, `olist_order_reviews_dataset.csv`, `olist_orders_dataset.csv`, `olist_products_dataset.csv`, `product_category_name_translation.csv`.

---

## 6. Methodology
- **Jenis Analisis:** Analisis deskriptif digunakan untuk menggambarkan perilaku pelanggan berdasarkan data historis tanpa melakukan prediksi.
- **Tools:** MySQL untuk pengolahan dan query data, Python untuk visualisasi, dan Tableau untuk dashboard.
- **Pendekatan Pengolahan Data:**
  - **Raw:** Data mentah diimpor dari CSV ke MySQL tanpa perubahan
  - **Staging:** Data dibersihkan dan dipilih kolom yang relevan
  - **Analisis:** Query SQL untuk menjawab setiap business question
  - **Visualisasi:** Hasil analisis divisualisasikan di notebook dan dashboard

---

## 7. Key Findings

### BQ1: Perbandingan Customer Sekali Order vs Repeat Order
**Fakta:** **97%** (90.557) pelanggan hanya melakukan 1 kali pembelian, sedangkan hanya **3%** (2.801) pelanggan yang melakukan pembelian berulang (repeat order).

**Insight:** Tingkat retensi pelanggan Olist **sangat rendah**, mayoritas pelanggan tidak kembali setelah pembelian pertama. Perusahaan berisiko terus mengeluarkan biaya akuisisi tanpa membangun basis pelanggan setia.

---

### BQ2: Kategori Produk Yang Paling Sering di Repeat Order
**Fakta:** **`bed_bath_table`** merupakan kategori produk tertinggi yang sering di repeat order sebanyak **12.341 order**, diikuti **`health_beauty`** sebanyak **10.103 order**.

**Insight:** Kebutuhan rumah tangga lebih sering dilakukan repeat order. Perusahaan dapat melakukan pengelompokkan dalam prioritas promosi produk.

---

### BQ3: Rata-rata Nilai Review Score Pelanggan Repeat Order
**Fakta:** Nilai rata-rata review score dari pelanggan repeat order adalah **4.2 dari 5**. Mayoritas pelanggan memberi nilai **5** (1.726 pelanggan).

**Insight:** Nilai rata-rata review score sudah cukup tinggi, tetapi perlu diperhatikan bahwa ada **211 pelanggan** yang balik beli namun memberikan score **1–2**. Score rendah ini menandakan pelanggan tetap setia menggunakan platform meski mendapatkan pengalaman buruk. Perusahaan perlu mencari tahu penyebab mereka memberikan score rendah tapi tetap kembali membeli, **agar bisa diperbaiki sebelum loyalitas mereka terhenti**.

---

### BQ4: Pengaruh Metode Pembayaran pada Perilaku Pelanggan Repeat Order
**Fakta:** **`credit_card`** merupakan metode pembayaran yang paling sering digunakan sebanyak **9.064 pelanggan**, dan sangat jarang pelanggan yang menggunakan `debit_card`.

**Insight:** Pelanggan repeat order **sangat didominasi pengguna kartu kredit**. Perusahaan bisa memanfaatkan dominasi credit card dengan membuat **program cicilan atau cashback** dalam mendorong repeat order.

---

### BQ5: Pengaruh Ketepatan Pengiriman Pada Pelanggan Repeat Order
**Fakta:** Pelanggan repeat order yang mendapatkan pesanannya **tepat waktu** sebanyak **2.616 pelanggan**, sedangkan yang **telat** sebanyak **185 pelanggan**.

**Insight:** Terdapat **pengaruh kuat ketepatan pengiriman** terhadap keputusan pelanggan dalam melakukan repeat order. Perusahaan perlu mempertahankan ketepatan waktu pengiriman dengan **memprioritaskan seller yang punya track record pengiriman tepat waktu**.

---

## 8. Recommendations
- Perusahaan fokus memberikan **program loyalitas atau diskon khusus** untuk pelanggan repeat order, terutama pada kategori **`bed_bath_table`** dan **`health_beauty`** yang paling banyak di repeat order.
- Perusahaan perlu mencari tahu **penyebab score rendah (score 1 dan 2)** yang diberikan pelanggan repeat order, agar bisa diberikan solusi yang sesuai.
- Perusahaan bisa memanfaatkan dominasi credit card dengan membuat **program cicilan atau cashback** dalam mendorong repeat order.
- Perusahaan membuat **fitur rekomendasi seller** yang punya track record pengiriman tepat waktu setiap kali pelanggan mencari barang yang diinginkan.

---

## 9. Executive Summary
Analisis ini menemukan bahwa hanya **3% pelanggan** yang melakukan repeat order dari total 93.358 pelanggan. **Ketepatan pengiriman** terbukti menjadi pengaruh kuat **93% repeat customer** menerima pesanan tepat waktu. **Credit card** sangat mendominasi metode pembayaran repeat customer (9.064 pelanggan), sehingga bisa dimanfaatkan untuk program cicilan atau cashback. Kategori produk **`bed_bath_table`** dan **`health_beauty`** paling banyak di repeat order dan bisa dijadikan prioritas promosi. Walaupun begitu, adanya **211 pelanggan yang memberi score 1–2** namun tetap kembali membeli perlu dievaluasi sebelum loyalitas mereka terhenti. Dengan analisis ini, perusahaan memiliki pemahaman dalam mengelompokkan perilaku pelanggan dan mengalokasikan **biaya promosi yang lebih tepat sasaran**.