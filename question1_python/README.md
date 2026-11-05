# MD Computers Product Scraper

## Overview
This project is a Python web scraper that collects product information from the MD Computers website based on a search term.

It extracts:
- Product name
- Product price
- Product URL

The collected information is saved in a CSV file.

## Technologies Used
- Python
- Requests
- BeautifulSoup
- CSV

## Installation

1. Clone or download the project.
2. Open the project folder in the terminal.
3. Install the required libraries:

```bash
pip install -r requirements.txt
```

## How to Run

Run the following command:

```bash
python scraper.py
```

Enter a product search term when prompted, for example:

```text
external harddrive
```

The scraper collects matching products and saves them in `products.csv`.

## Output

The CSV file contains three columns:

- Product Name
- Price
- URL

## Error Handling

The script handles request errors, such as connection failures and unsuccessful HTTP responses.