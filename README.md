# Retail Sales Analysis (SQL Server)

## 📌 Overview
This project analyzes retail sales data using a star schema (fact + dimension tables) in SQL Server. It answers a core business question through a progression of SQL techniques — from basic aggregation to window functions, CTEs, and revenue concentration analysis.

## ❓ Business Question
Which customer segments and product categories drove revenue between 2010–2014, and where is the business concentrated or at risk (e.g., over-reliant on a small number of top-selling products or customers)?

## 🗂️ Dataset
The data follows a star schema with one fact table and two dimension tables:

- **gold.fact_sales** — order-level transactions (order date, shipping date, quantity, sales amount, price)
- **gold.dim_customers** — customer details (name, country, gender, marital status, birthdate)
- **gold.dim_products** — product details (name, category, subcategory, cost, product line)

## 🛠️ Tools Used
- SQL Server (T-SQL)
- SSMS for query development and testing

## 🔍 Data Quality Checks
Before analysis, the data was validated for:
- Missing order dates (19 rows identified and excluded from date-based queries)
- Unknown/missing customer country values (`n/a`)
- Orphaned records (sales rows with no matching product or customer)
- Invalid or negative sales amounts and quantities

## 📊 Analysis Structure
Scripts are organized in the `/scripts` folder, in order of increasing complexity:

| # | Script | What it answers |
|---|--------|------------------|
| 01 | `revenue_by_year.sql` | Is revenue growing or declining year over year? |
| 02 | `revenue_by_category.sql` | Which product category drives the most revenue? |
| 03 | `top_subcategories_by_category.sql` | Which subcategories lead within each category? |
| 04 | `monthly_revenue_trend.sql` | What does the month-by-month growth trajectory look like? |
| 05 | `customer_segmentation.sql` | How does revenue break down across VIP/Regular/Occasional customers? |
| 06 | `revenue_concentration_pareto.sql` | Are we over-reliant on a small number of top products? |
| 07 | `revenue_by_demographics.sql` | How does spending vary by gender and marital status? |

## 💡 Key Findings
*(fill in with your actual query results)*

- Revenue trend: [e.g., "Revenue grew X% from 2010 to 2013 before declining in early 2014"]
- Top category: [e.g., "Bikes accounted for X% of total revenue despite representing only Y% of orders"]
- Customer segmentation: [e.g., "X% of customers are classified as VIP, contributing Y% of total revenue"]
- Concentration risk: [e.g., "The top 10 products account for X% of total revenue, indicating [low/high] concentration risk"]
- Demographics: [e.g., "Married customers had a X% higher average order value than single customers"]


└── README.md
```
