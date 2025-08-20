-- Ecommerce_Analysis.sql
-- Project: E-Commerce Data Analysis
-- Author: Mrunmay Nilesh Kanade

-- 1. Create tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 2. Sample Queries

-- A. Total Sales Revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id;

-- B. Top 5 Best-Selling Products
SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- C. Monthly Sales Trend
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
       SUM(p.price * o.quantity) AS monthly_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- D. High-Value Customers (Top 5 by Spend)
SELECT c.customer_name, SUM(p.price * o.quantity) AS total_spent
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- E. Revenue Contribution by Category
SELECT p.category, SUM(p.price * o.quantity) AS category_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;
