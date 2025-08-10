# E-commerce Sales Analysis

## Table of contents
- [Project Overview](#project-overview)
- [Data Source](#data-source)
- [Tools](#tools)
- [Data Cleaning Process](#data-cleaning-process)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Result](#result)
- [Recommendations](#recommendations)

---
### 📝Project Overview 
This project focuses on analyzing and visualizing restaurant sales data to uncover trends, measure performance, and provide actionable business insights
---
###  Data Source
The dataset used for this project contains restaurant sales transaction records, including:

- Order details (Order ID, Date, Product Category, Item Name, Quantity)

- Pricing information (Unit Price, Total Price)

- Customer information (Customer ID)

The data was provided as a CSV file and served as the basis for cleaning, transformation, and visualization.
----
### 🛠Tools 
- MySQL – For data cleaning, transformation, and exploratory analysis.

- Tableau – For creating interactive dashboards and visualizations.
---
### 🧹 Data Cleaning Process
The raw dataset underwent several cleaning and preparation steps to ensure accuracy and consistency:
1. Data Import & Inspection
2. Handling Missing & Invalid Data
3. Data Type Formatting
4. Duplicate Removal
5. Standardization
6. Calculated Fields Creation
---
### 🔍Exploratory Data Analysis
- Which category of products contributes the most to total sales?
- What is the monthly trend of total sales and total orders?
- Who are the top 10 customers by total purchase amount?
---
###  📊Data Analysis
Code worked with 
```
SELECT 
    SUM(Price) AS total_sales,
    AVG(Price) AS avg_price_per_item,
    SUM(Price) / COUNT(DISTINCT ID) AS avg_order_value
FROM restaurant_sales_data2;
```
---
### 📈Result 
This query calculates three key metrics from the restaurant_sales_data2 table:

- Total Sales – The sum of all item prices (SUM(Price)), representing total revenue.

- Average Price per Item – The mean price of individual items (AVG(Price)).

- Average Order Value (AOV) – The total sales divided by the number of unique orders (SUM(Price) / COUNT(DISTINCT ID)), showing the average revenue per order.

It’s basically giving you an overall revenue snapshot with both pricing and order value insights.
---

### 💡Recommendations
Based on the analysis of the sales dataset, the following strategies are recommended to

- Introduce bundle offers and combo deals to encourage higher spending per order
- Offer free delivery or discounts for orders above a specific purchase threshold.
- Identify and remove low-performing items to focus resources on high-demand, high-margin products.
- Implement a loyalty program to reward repeat customers.
- Train staff to recommend add-ons and upgrades during the ordering process.
- Integrate “You may also like” suggestions into online ordering platforms.





  

   
