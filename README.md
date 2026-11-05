# Affinity Answers – Data Engineer Intern Assignment

This repository contains my solutions to the three questions in the Data Engineer Intern assignment.

## Project Structure

```text
affinity-answers-data-engineer/
│
├── question1_python/
│   ├── scraper.py
│   ├── requirements.txt
│   └── README.md
│
├── question2_sql.sql
│
├── question3_shell/
│   ├── company_info.sh
│   ├── companies.csv
│   └── README.md
│
└── README.md
```
Question 1 – Python

For this question, I wrote a Python script to search for products on the MD Computers website. It takes a search term from the user and extracts the available product details. The results are saved in a CSV file.

I used Python with Requests and BeautifulSoup for this.

Question 2 – SQL

I used the Rfam public database to write queries for the given questions.

The queries cover:

Counting the different Acacia species.

Finding the wheat type with the longest DNA sequence.

Getting family records with a maximum sequence length above 1,000,000, sorted in descending order, and retrieving the ninth page of results.

Question 3 – Shell Scripting

I created a Bash script that takes a CSV URL as input and downloads the company data. It then displays the company name, headquarters location and founding year, sorted by year.

I used Bash, curl and Python's CSV module to handle the data.

To run the script from the question3_shell folder:

chmod +x company_info.sh

./company_info.sh "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/refs/heads/main/data/constituents.csv"

Requirements

Python 3

Requests

BeautifulSoup

MySQL

Ubuntu / Linux / WSL

