




import requests
import csv
from bs4 import BeautifulSoup

search_term = input("Enter product to search: ")

url = "https://mdcomputers.in/"
params = {
    "route": "product/search",
    "search": search_term
}

try:
    response = requests.get(url, params=params, timeout=20)
    response.raise_for_status()

except requests.exceptions.RequestException as error:
    print("Something went wrong:", error)
    exit()

soup = BeautifulSoup(response.text, "html.parser")
products = soup.find_all("div", class_="product-grid-item")


with open("products.csv", "w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(["Product Name", "Price", "URL"])

    saved_count = 0

    for product in products:
        name = product.find("h3", class_="product-entities-title")
        price = product.find(class_="price")
        link = product.find("a", class_="product-image-link")

        if not name:
            continue

        product_name = name.get_text(strip=True)

        # Skip products that are not hard drives
        if "hard drive" not in product_name.lower() and "ssd" not in product_name.lower():
            continue

        product_price = price.get_text(" ", strip=True) if price else "Not found"
        product_url = link.get("href") if link else "Not found"

        writer.writerow([product_name, product_price, product_url])
        saved_count += 1

print(f"Saved {saved_count} products to products.csv")
