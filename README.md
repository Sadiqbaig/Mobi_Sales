# Alt Mobility: Order and Customer Insights Analysis

## Overview
This project analyzes sales, customer behavior, and payment patterns from Alt Mobility's order and payment datasets using SQL and data visualizations.

## Project Tasks

### 1. Order and Sales Analysis
- Analyzed order statuses and sales amounts.
- Key metrics: total orders, total revenue by status.

### 2. Customer Analysis
- Identified repeat vs. one-time customers.
- Segmented customer behavior by order frequency and time.

### 3. Payment Status Analysis
- Summarized payment outcomes.
- Flagged failure trends.

### 4. Order Details Report
- Built a comprehensive table showing all orders with linked payment data.

### 5. Customer Retention Visualization
- Cohort analysis showing repeat purchase behavior month-over-month.

## How to Use
1. SQL queries are under `/sql/`.
2. Visual insights are under `/visualizations/`.
3. Summary insights and recommendations are in `summary_of_findings.pdf`.

## Tools Used
- PostgreSQL / SQL
- Python (Pandas, Seaborn, Matplotlib)
- BI Tool: Power BI / Tableau / Plotly (your choice)

  ## Insight:
Order Insights
Total Revenue by Order Status

Delivered: $1,284,616 from 5,057 orders

Pending: $1,278,400 from 5,069 orders

Shipped: $1,245,883 from 4,874 orders
→ Delivered orders generated the highest revenue.

Average Order Value by Status

Shipped: $255.62

Delivered: $254.03

Pending: $252.20
→ Highest average value in “shipped” orders.

Top 10 Customers by Spend

Highest spender: Customer ID 6477 with $2,798.16 over 7 orders

Other top customers spent over $2,000 each
→ Loyal, high-spending segment exists.

Repeat Customers

Many customers placed 7–8 orders

Customer ID 2633 placed 8 distinct orders
→ Solid base of repeat buyers.

Monthly Sales Trend (2020 sample)

Consistent growth with months like June 2020 seeing revenue > $62,000
→ Stable monthly performance.

Payment Insights
Payment Status Breakdown

Completed: 4,991 payments totaling $1.26M

Failed: 5,003 payments totaling $1.27M

Pending: 5,006 payments totaling $1.27M
→ Nearly 2/3 of payments are incomplete or failed.

Payment Method Performance

Most used: Bank transfer (5,105 payments)

Highest success rate: PayPal with 1,693 successful payments
→ PayPal is most reliable for completed transactions.

Orders Without Payments

Examples include orders as recent as March 2025
→ Possible payment delays or failed transactions.

Orders with Multiple Payments

Many orders had 2+ payments, e.g., one with $834.34 total
→ Possibly split payments or retries.



## Author
Sadiq Baig
