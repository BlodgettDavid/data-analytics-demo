import os
import mysql.connector
import pandas as pd
from dotenv import load_dotenv

# Load environment variables from project root
load_dotenv()

# Resolve the project root directory (one level above this file)
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def get_mysql_connection():
    """Create and return a MySQL connection using environment variables."""
    return mysql.connector.connect(
        host=os.getenv("MYSQL_HOST"),
        user=os.getenv("MYSQL_USER"),
        password=os.getenv("MYSQL_PASSWORD"),
        database=os.getenv("MYSQL_DATABASE")
    )

def extract_table(table_name, conn):
    """Extract a MySQL table and write it to a Parquet file in /raw."""
    query = f"SELECT * FROM {table_name}"
    df = pd.read_sql(query, conn)

    # Ensure the raw directory exists
    raw_dir = os.path.join(PROJECT_ROOT, "raw")
    os.makedirs(raw_dir, exist_ok=True)

    # Build the full output path
    output_path = os.path.join(raw_dir, f"{table_name}.parquet")

    # Write Parquet file
    df.to_parquet(output_path, index=False)

    print(f"Extracted {table_name} → {output_path}")

def main():
    conn = get_mysql_connection()
    tables = ["customers", "products", "orders", "order_items"]

    for table in tables:
        extract_table(table, conn)

    conn.close()

if __name__ == "__main__":
    main()