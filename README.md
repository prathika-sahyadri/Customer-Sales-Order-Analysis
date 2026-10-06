# Customer Sales & Order Analysis using MySQL

## Project Overview

This project analyzes customer, order, and product data using MySQL.

The main objective is to understand business performance by analyzing customer purchasing behavior, product performance, order patterns, category performance, and monthly revenue trends.

## Business Questions

The project answers questions such as:

- Which customers place the most orders?
- Which customers generate the highest revenue?
- Which products sell the most units?
- Which products generate the highest revenue?
- Which product category performs best?
- How many orders are completed or cancelled?
- Which months generate the highest revenue?
- What is the average order value?
- Which customers are high, medium, or low value?

## Database Structure

The project contains four main tables:

- Customers
- Products
- Orders
- Order_Details

The tables are connected using customer IDs, order IDs, and product IDs.

## SQL Concepts Used

- SELECT
- WHERE
- JOIN
- GROUP BY
- ORDER BY
- COUNT()
- SUM()
- AVG()
- CASE
- LIMIT
- Subqueries
- Aggregate functions

## Key Findings

- Rahul Sharma generated the highest customer revenue.
- Electronics was the highest-revenue category.
- Electronics also had the highest quantity sold.
- Laptop generated the highest product revenue.
- August recorded the highest monthly revenue.
- The average revenue per completed order was approximately ₹25,543.
- 29 orders were completed and 1 order was cancelled.

## Tools Used

- MySQL
- DB Fiddle
- Visual Studio Code
- GitHub

## Project Structure

```text
Customer-Sales-Order-Analysis/
│
├── README.md
│
└── sql/
    ├── 01_create_tables.sql
    ├── 02_insert_data.sql
    ├── 03_sales_analysis.sql
    └── 04_business_insights.sql