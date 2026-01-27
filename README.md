# Analytics Demo – dbt + DuckDB

A lightweight, end‑to‑end analytics engineering project demonstrating professional data modeling, testing, and warehouse design using dbt and DuckDB.

## Overview
This project models customer, product, order, and event data into a clean, analytics‑ready warehouse slice. It follows industry‑standard analytics engineering patterns, including a dedicated staging layer, conformed dimensions, fact tables with clearly defined grain, and schema tests for data quality.

The project includes both relational data (customers, orders, products) and a NoSQL event stream stored as JSON. This demonstrates how to integrate semi‑structured data into a dimensional warehouse and flatten nested metadata into a fact table suitable for analytics.

## Tech Stack
- Python  
- dbt  
- DuckDB  

## Data Sources
Relational data originates from a MySQL‑style schema (customers, orders, order_items, products).  
Event data originates from a NoSQL JSON file (`events.json`) containing semi‑structured customer behavior events such as logins, support tickets, and device changes.  
Each event includes a metadata object with nested fields (e.g., IP address, location, ticket details, device transitions).  
The project demonstrates how to flatten and model this metadata into an analytics‑ready fact table.

## Project Structure

### `models/`
**staging/**  
Source‑aligned, cleaned, typed views for each raw dataset, including JSON event parsing.

**marts/core/**  
Conformed dimensions (customers, products, event types).

**marts/facts/**  
Fact tables (orders, order items, events).

### `extract/`
Optional Python scripts used during development to extract relational and NoSQL data and load it into DuckDB. These scripts are not required to run the dbt project but demonstrate the upstream ingestion workflow.

### `sql/`
SQL scripts used to create and seed the initial relational tables during early development. Included for completeness and transparency.

### `analyses/`
Optional directory for exploratory SQL queries used during development. Helpful for understanding data validation and early modeling decisions.

### `nosql/`
Contains the `events.json` file used as the NoSQL event source.

## Key Models

- **stg_customers, stg_orders, stg_order_items, stg_products**  
  Cleaned staging views that standardize types, naming, and structure.

- **stg_nosql_events**  
  Staging model that loads JSON events, normalizes fields, and exposes metadata for flattening.

- **dim_customers**  
  Conformed customer dimension with one row per customer.

- **dim_products**  
  Conformed product dimension with one row per product.

- **dim_event_types**  
  Dimension defining the valid event types.

- **fct_orders**  
  Fact table at the order grain.

- **fct_order_items**  
  Fact table at the order‑item grain.

- **fct_events**  
  Fact table at the event grain, including flattened metadata fields such as IP address, location, ticket details, and device transitions.

## Data Quality
All dimensions and fact tables include schema tests for:
- primary key uniqueness  
- not‑null constraints  
- foreign‑key relationships  

## Running the Project

1. **Create and activate a virtual environment**
   ```
   python -m venv .venv-analytics
   .venv-analytics\Scripts\activate
   ```

2. **Install dependencies**
   ```
   pip install -r requirements.txt
   ```

3. **Run the project**
   ```
   dbt build
   ```

This command will:
- build all staging and marts models  
- run all schema tests  
- validate the warehouse end‑to‑end  

## Warehouse
The project uses DuckDB as the local analytical database.  
All tables and views are created inside the DuckDB file defined in `profiles.yml`.

## Future Enhancements
- Add example analytical queries  
- Add a date dimension  
- Add dashboards or BI layer  
- Add incremental models for larger datasets  

## Purpose
This project is designed as a portfolio‑ready demonstration of analytics engineering fundamentals, suitable for interviews and technical discussions.