-- Business Insights
-- Customer Sales & Order Analysis


-- 1. Top 5 Customers by Revenue

SELECT
    c.customer_name,
    SUM(od.quantity * p.price) AS total_revenue
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;


-- 2. Top Revenue-Generating Category

SELECT
    p.category,
    SUM(od.quantity * p.price) AS total_revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_revenue DESC
LIMIT 1;


-- 3. Top Revenue-Generating Product

SELECT
    p.product_name,
    SUM(od.quantity * p.price) AS total_revenue
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC
LIMIT 1;


-- 4. Highest Revenue Month

SELECT
    MONTHNAME(o.order_date) AS month,
    SUM(od.quantity * p.price) AS total_revenue
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY
    MONTH(o.order_date),
    MONTHNAME(o.order_date)
ORDER BY total_revenue DESC
LIMIT 1;