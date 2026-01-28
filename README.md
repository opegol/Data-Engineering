# Sales Data Analytics Pipeline (Python • SQL • dbt)

This project is a **learning-focused, end-to-end data pipeline** that transforms raw sales data into analytics‑ready datasets using **Python, SQL, and dbt-core**, following workflows commonly used by real‑world data teams.

The pipeline covers:

* Data ingestion and cleaning with **Python (Pandas)**
* Loading cleaned data into a **relational database (PostgreSQL)**
* Data modeling, transformation, and testing with **dbt-core**

The project is developed on **Windows 11**, using **Visual Studio Code**, **Jupyter Notebook (Anaconda)**, and a **Python virtual environment (venv)**.

---

## Project Objectives

* Practice building a modular, reproducible analytics pipeline
* Apply data engineering best practices (staging, fact, aggregation layers)
* Learn dbt fundamentals: models, refs, tests, and commands
* Simulate workflows used in analytics and data teams

---

## Tech Stack

| Layer           | Tools                        |
| --------------- | ---------------------------- |
| Language        | Python, SQL                  |
| Data Processing | Pandas                       |
| Database        | PostgreSQL |
| Transformation  | dbt-core                     |
| IDE             | Visual Studio Code           |
| Notebooks       | Jupyter (Anaconda)           |
| Environment     | Python venv                  |

---

## Project Structure

```text
sales-data-pipeline/
│
├── data/
│   ├── raw/
│   │   └── raw_sales_data.csv
│   └── cleaned/
│       └── clean_sales_data.csv
│
├── notebooks/
│   └── sales_raw_cleaning.ipynb
│   └── sql_connect.ipynb
│
│
├── sales_dbt/
│   ├── dbt_project.yml
│   ├── profiles.yml
│   └── models/
│       ├── stg_sales.sql
│       ├── fct_sales.sql
│       ├── agg_sales_summary.sql 
│       └── source.yml
│
├── venv/
└── README.md
```

---

## Environment Setup

### 1. Install Required Software

Ensure the following are installed:

* **Anaconda** (For Jupyter Notebooks practice)
* **Visual Studio Code**
* **PostgreSQL Database**

---

### 2. Create and Activate Virtual Environment (venv)

From the project root directory:

```bash
python -m venv venv
```

Activate the environment:

**VScode terminal:**

```bash
venv\Scripts\activate
```

---

### 3. Install Python Dependencies
```
pandas
numpy
sqlalchemy
psycopg2-binary
pyodbc
dbt-core
dbt-postgres
```

## Task 1: Python – Data Ingestion & Cleaning

**Goal:** Convert raw CSV data into a clean, analytics‑ready dataset.

### Steps

1. Load CSV using Pandas
2. Inspect data (row count, dtypes, missing values)
3. Remove duplicate records
4. Standardize text columns

   * Trim whitespace
   * Convert to consistent casing
5. Convert date columns to `YYYY-MM-DD`
6. Handle missing values appropriately
7. Save cleaned dataset

#### See attached Jupyter Notebooks

---

## Task 2: SQL – Load Data into Database

### Steps
1. Create Database
2. Create Raw Table
3. Load Cleaned CSV Using Python
4. Verify Data Load

* See attached notebooks for code

## Task 3: dbt – Data Transformation

### Initialize dbt Project

```bash
dbt init dbt_project
```

Configure `profiles.yml` with database credentials.

---

### Task 3.1: Staging Model – `stg_sales`

Purpose: Clean and standardize raw data.

Key Actions:

* Rename columns
* Trim text fields
* Cast dates
* Filter invalid records
---

### Task 3.2: Fact Model – `fct_sales`

Purpose: Apply business logic.

Key Metrics:

* `total_amount`
* `order_year`, `order_month`
* `is_high_value_order`


---

### Task 3.3: Aggregated Model – `agg_sales_summary`

Purpose: Reporting‑ready summaries.

Key Metrics:

* 'total_orders'
* 'total_quantity'
* 'total_sales_amount'
* 'average_order_value'
* 'total_orders'


## Task 4: dbt Tests

Defined in `schema.yml (renamed source.yml)`:

## Running dbt Commands

From the dbt_project (named sales_dbt) directory:

```bash
dbt debug
dbt run
dbt test
```
* Dbt test on unique fct_sales.order_id failed because the already data contained multiple instances of repeated order_id. Such duplicated values could have been deleted if the project was not basically learning intended.
---

## Learning Outcomes

* End‑to‑end data pipeline design
* Analytics engineering best practices
* dbt modeling and testing
* SQL‑first transformations
* Environment isolation using venv

---

**Author:** Ope Olubodun
**Purpose:** AI NOW Data Engineering Project (Educational / Skill Development)
