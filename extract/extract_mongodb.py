import os
import json
import pandas as pd

# Resolve the project root directory (one level above this file)
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def main():
    # Build absolute paths
    input_path = os.path.join(PROJECT_ROOT, "nosql", "events.json")
    raw_dir = os.path.join(PROJECT_ROOT, "raw")
    os.makedirs(raw_dir, exist_ok=True)

    output_path = os.path.join(raw_dir, "nosql_events.parquet")

    # Load JSON
    with open(input_path, "r") as f:
        data = json.load(f)

    # Convert to DataFrame
    df = pd.DataFrame(data)

    # Write Parquet
    df.to_parquet(output_path, index=False)

    print(f"Extracted MongoDB events → {output_path}")

if __name__ == "__main__":
    main()