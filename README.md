# E-Commerce Sales & Profitability Analysis (SQL)

## Project Overview

This project uses MySQL to analyze an e-commerce dataset and evaluate sales performance, customer purchasing behavior, product performance, payment methods, and customer profitability.

The goal is to turn transactional data into business insights that can support data-driven decisions.

## Dataset Structure

The database contains four tables:

| Table | Description |
|---|---|
| `customers` | Customer identifiers and names |
| `orders` | Order dates, statuses, and payment methods |
| `order_items` | Products included in each order, quantities, and selling prices |
| `products` | Product names and unit costs |

**Analysis period:** January 2024 – October 2026

**Scope:** Only orders with `Status = 'Completed'` are included. Pending, Cancelled, and Returned orders are excluded.

## Tools & SQL Techniques

**Tool:** MySQL

SQL techniques used:
- SELECT, WHERE, ORDER BY, LIMIT
- Aggregate functions: SUM, COUNT, AVG
- GROUP BY
- INNER JOIN
- Common Table Expressions (CTEs)
- Window functions: DENSE_RANK and OVER
- Date functions: YEAR, MONTH, MONTHNAME
- NULLIF for safe division
- Calculated fields for sales, profit, and profit margin

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Completed Orders | 950 |
| Customers with Completed Orders | 120 |
| Units Sold | 5,506 |
| Total Sales | 3,459,256.72 |
| Total Product Profit | 1,266,014.31 |
| Overall Profit Margin | 36.60% |
| Average Order Value | 3,641.32 |
| Average Profit per Order | 1,332.65 |
| Average Units per Order | 5.80 |

**Calculation note:** Product profit is calculated as `quantity * (unitPrice - unitCost)`. It represents profit after product cost only and does not include other operating expenses.

## Analysis & Findings

### 1. Monthly Sales Analysis

| Period | Total Sales | Monthly Average |
|---|---:|---:|
| 2024 | 1,257,034.56 | 104,752.88 |
| 2025 | 1,169,034.27 | 97,419.52 |
| 2026 (Jan–Oct) | 1,033,187.89 | 103,318.79 |

Key findings:
- Total sales decreased by approximately 7.00% in 2025 compared with 2024.
- Sales in January–October 2026 increased by approximately 4.07% compared with the same period in 2025.
- October 2025 was the strongest month in the analyzed period, with sales of 163,560.69.
- January 2024 was the lowest month in the analyzed period, with sales of 56,520.55.

### 2. Top Customers by Sales

- Omar Abdelrahman (Customer ID 58) ranked first, with sales of 68,711.91 across 13 orders.
- Mostafa Samir (Customer ID 12) had the highest order count among the top 10 customers, with 15 orders.
- Omar Abdelrahman recorded the highest average order value among the top 10, at 5,285.53.

### 3. Product Performance

Products were ranked separately by sales, total profit, and units sold.

**Top products by sales:**
- Electronic Product 11: 178,711.00
- Beauty Product 29: 175,978.03
- Sport Product 19: 167,816.04

**Top products by total profit:**
- Beauty Product 29: 93,554.02 profit; 53.16% margin
- Home Product 14: 81,048.69 profit; 49.53% margin
- Electronic Product 39: 53,163.14 profit; 48.39% margin

**Top product by units sold:**
- Sport Product 08: 220 units

Key finding:
- The product with the highest sales is not necessarily the product with the highest profit. Electronic Product 11 led sales, while Beauty Product 29 led total profit among the analyzed products.

### 4. Payment Method Analysis

| Payment Method | Orders | Sales | Average Order Value | Sales Share |
|---|---:|---:|---:|---:|
| Wallet | 256 | 943,847.57 | 3,686.90 | 27.28% |
| Bank Transfer | 238 | 902,152.69 | 3,790.56 | 26.08% |
| Card | 235 | 855,708.65 | 3,641.31 | 24.74% |
| Cash | 221 | 757,547.81 | 3,427.82 | 21.90% |

Key findings:
- Wallet was the most frequently used payment method and generated the highest sales.
- Bank Transfer had the highest average order value, at 3,790.56.
- Cash had the lowest order count and sales among the four payment methods.

### 5. Customer Profitability

**Highest total profit:**
- Mostafa Samir (Customer ID 12): 24,727.40 profit from 15 orders.
- Omar Abdelrahman (Customer ID 58): 24,301.34 profit from 13 orders.
- Mostafa Sayed (Customer ID 99): 21,203.76 profit from 13 orders.

**Highest profit margins among customers with at least 10 completed orders:**
- Omar Abdelrahman (Customer ID 2): 42.55%
- Mona Ibrahim (Customer ID 38): 41.22%
- Nour Ibrahim (Customer ID 59): 41.04%

Key finding:
- Ranking customers by total profit produces a different result from ranking them by profit margin. Both metrics, alongside order frequency, provide a more balanced view of customer value.

## Business Recommendations

1. Monitor stock levels for high-volume products such as Sport Product 08.
2. Consider promotional opportunities for high-profit products such as Beauty Product 29 and Home Product 14.
3. Review the cost and pricing structure of Electronic Product 11, which generated the highest sales among the analyzed products but had a 24.27% profit margin.
4. Consider retention initiatives for customers who generate high total profit and purchase frequently.
5. Maintain convenient Wallet payment options and investigate why Bank Transfer orders have a higher average order value.
6. Monitor monthly sales fluctuations and investigate weaker-performing periods.

## Project Files

```text
E-Commerce-SQL-Analysis/
├── README.md
├── NOTES.txt
└── SQL/
    ├── 01_Overall_KPIs.sql
    ├── 02_Monthly_Sales_Analysis.sql
    ├── 03_Top_Customers.sql
    ├── 04_Product_Performance.sql
    ├── 05_Payment_Method_Analysis.sql
    └── 06_Customer_Profitability.sql
```

## Conclusion

This project demonstrates the use of SQL to analyze e-commerce transactions, calculate business KPIs, rank customers and products, compare payment methods, and evaluate profitability.

The analysis highlights why sales, profit, profit margin, order frequency, and units sold should be considered together when evaluating business performance.
