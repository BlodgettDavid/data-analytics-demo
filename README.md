# 📘 Analytics Engineering Demo — dbt + DuckDB (SQL + NoSQL)

A complete, end‑to‑end analytics engineering project demonstrating professional data modeling, testing, and warehouse design using **dbt**, **DuckDB**, and both **relational** and **NoSQL** data sources.

## ⚡ Quickstart

Clone the repo:

```
git clone https://github.com/BlodgettDavid/data-analytics-demo.git
cd data-analytics-demo
```

Create and activate a virtual environment:

```
python -m venv .venv-analytics
.venv-analytics\Scripts\activate
```

Install dependencies:

```
pip install -r requirements.txt
```

Build the warehouse:

```
dbt build
```

Open the SaaS metrics demo notebook:

```
jupyter notebook analysis/saas_metrics_demo.ipynb
```

This will give you a running DuckDB warehouse with staging, dimensions, facts, and a polished SaaS metrics notebook ready to explore.

---

## 🚀 Overview

This project builds a fully functional analytics warehouse that integrates **relational customer/order data** with a **semi‑structured NoSQL event stream**. It demonstrates how modern analytics engineers design reproducible pipelines, model raw data into clean dimensional structures, and validate data quality using dbt’s testing framework.

The warehouse includes:

- A dedicated staging layer with explicit typing and naming conventions  
- A Kimball‑style star schema with conformed dimensions  
- Fact tables for orders, order items, and events (with JSON flattening)  
- Automated schema tests for primary keys, foreign keys, and not‑null constraints  
- A cost‑free local warehouse powered by DuckDB  

This project is intentionally lightweight but architecturally complete — ideal for interviews, portfolio review, or technical discussion.

---

## 🧱 Architecture

```
Raw Sources (SQL + NoSQL)
    |
    v
Extraction Layer (Python scripts)
    |
    v
dbt Staging Models (cleaning, typing, JSON normalization)
    |
    v
Star Schema (dimensions + facts)
    |
    v
Analytics-Ready DuckDB Warehouse
    |
    v
Jupyter Notebook (SaaS metrics demo)
```

---

## 🛠️ Tech Stack

- dbt  
- DuckDB  
- Python  
- SQL + JSON  
- Kimball dimensional modeling  
- Jupyter Notebook for analysis  

---

## 📚 Data Sources

### **Relational (SQL)**  
- Customers  
- Orders  
- Order items  
- Products  

### **NoSQL (JSON)**  
A semi‑structured event stream containing logins, support tickets, device changes, location/IP metadata, and nested metadata objects.  
The project demonstrates how to normalize, flatten, and model this JSON into an analytics‑ready fact table.

---

## 🗂️ Project Structure

```
analysis/
  saas_metrics_demo.ipynb   # polished notebook with SaaS metrics queries

extract/
  extract_mysql.py
  extract_mongodb.py
  load_into_duckdb.py

models/
  raw/
    customers.sql
    orders.sql
    order_items.sql
    products.sql
    nosql_events.sql
  staging/
    stg_customers.sql
    stg_orders.sql
    stg_order_items.sql
    stg_products.sql
    stg_nosql_events.sql
    stg_orders_seed.sql
  marts/
    core/
      dim_customers.sql
      dim_products.sql
      dim_event_types.sql
      schema.yml
    facts/
      fct_orders.sql
      fct_order_items.sql
      fct_events.sql

seeds/
  customers_seed.csv
  orders_seed.csv
  order_items_seed.csv
  products_seed.csv
  nosql_events_seed.csv

nosql/
  events.json

sql/
  create_tables.sql
  insert_data.sql

snapshots/
tests/
docs/
  Notes.txt (ignored in .gitignore)
```

---

## 🧩 Key Models

### **Staging Layer**
- `stg_customers`  
- `stg_orders`  
- `stg_order_items`  
- `stg_products`  
- `stg_nosql_events` — parses JSON, normalizes nested metadata, exposes flattened fields  
- `stg_orders_seed` — demo seed for varied monthly order counts  

### **Dimensions**
- `dim_customers`  
- `dim_products`  
- `dim_event_types`  

### **Fact Tables**
- `fct_orders`  
- `fct_order_items` — includes extended price and basket size metrics  
- `fct_events` — event‑level grain with flattened metadata such as IP, location, ticket details, and device transitions  

---

## 🔍 Data Quality

All dimensions and facts include dbt schema tests for:

- Primary key uniqueness  
- Not‑null constraints  
- Foreign‑key relationships  
- Event type validation  

---

## ▶️ Running the Project

### 1. Create and activate a virtual environment

```
python -m venv .venv-analytics
.venv-analytics\Scripts\activate
```

### 2. Install dependencies

```
pip install -r requirements.txt
```

### 3. Build the warehouse

```
dbt build
```

This will:

- run all staging models  
- build all dimensions and facts  
- execute schema tests  
- validate the warehouse end‑to‑end  

---

## 📊 SaaS Metrics Notebook

The notebook `analysis/saas_metrics_demo.ipynb` demonstrates:

- Monthly order volume trends  
- Revenue per order and average basket size  
- Funnel and retention analysis from NoSQL events  
- Product mix and category revenue share  

This single notebook serves as the **portfolio showcase** for hiring managers.

---

## 🗄️ Warehouse

The project uses **DuckDB** as the analytical engine.  
All tables and views are created inside the DuckDB file defined in `profiles.yml`.

This keeps the entire project:

- cost‑free  
- portable  
- reproducible  
- easy to run on any machine  

---

## 🌱 Future Enhancements

- Add a date dimension  
- Add incremental models for larger datasets  
- Add a metrics layer or BI dashboard  
- Add automated ingestion for event streams  

---

## 🎯 Purpose

This project is designed as a **portfolio‑ready demonstration** of analytics engineering fundamentals.  
It highlights your ability to:

- integrate SQL + NoSQL sources  
- design a clean staging layer  
- build a star schema  
- flatten nested metadata  
- enforce data quality  
- use dbt professionally  
- architect a reproducible warehouse  
- present SaaS metrics in a polished notebook  

It is intentionally scoped to be small, clear, and technically impressive — ideal for technical conversations.