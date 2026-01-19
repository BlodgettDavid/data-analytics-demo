import os
import duckdb

# Resolve the project root directory
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def main():
    # Paths
    raw_dir = os.path.join(PROJECT_ROOT, "raw")
    warehouse_path = os.path.join(PROJECT_ROOT, "warehouse", "dev.duckdb")

    # Ensure warehouse directory exists
    os.makedirs(os.path.dirname(warehouse_path), exist_ok=True)

    # Connect to DuckDB
    con = duckdb.connect(warehouse_path)

    # Load each Parquet file into DuckDB
    tables = {
        "customers": "customers.parquet",
        "products": "products.parquet",
        "orders": "orders.parquet",
        "order_items": "order_items.parquet",
        "nosql_events": "nosql_events.parquet"
    }

    for table_name, file_name in tables.items():
        parquet_path = os.path.join(raw_dir, file_name)

        con.execute(f"""
            CREATE OR REPLACE TABLE {table_name} AS
            SELECT * FROM read_parquet('{parquet_path}');
        """)

        print(f"Loaded {table_name} → DuckDB")

    con.close()

if __name__ == "__main__":
    main()