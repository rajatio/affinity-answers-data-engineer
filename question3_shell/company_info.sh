#!/bin/bash
#!/bin/bash

#!/bin/bash

# Get the CSV URL from the user
url="$1"

# Check whether a URL was provided
if [ -z "$url" ]; then
    echo "Please provide a CSV URL."
    exit 1
fi

# Download the CSV file
curl -fL "$url" -o companies.csv

# Read and sort company information
python3 - companies.csv <<'PY'
import csv
import sys
import re

with open(sys.argv[1], "r", newline="", encoding="utf-8") as file:
    reader = csv.DictReader(file)
    companies = list(reader)

companies.sort(
    key=lambda row: int(re.search(r"\d{4}", row["Founded"]).group())
)

print("Company Name | Location | Founded")

for company in companies:
    print(
        company["Security"],
        "|",
        company["Headquarters Location"],
        "|",
        company["Founded"]
    )
PY
