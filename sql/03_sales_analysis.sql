-- 1. Customer Order Frequency

SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name
ORDER BY total_orders DESC;


-- 2. Customer Revenue

SELECT
    c.customer_id,
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
ORDER BY total_revenue DESC;


-- 3. Top-Selling Products

SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_quantity_sold DESC;


-- 4. Product Revenue

SELECT
    p.product_id,
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
ORDER BY total_revenue DESC;


-- 5. Category Revenue

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
ORDER BY total_revenue DESC;


-- 6. Order Status Analysis

SELECT
    order_status,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- 7. Monthly Revenue Trend

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
ORDER BY
    MONTH(o.order_date);


-- 8. Average Order Value

SELECT
    AVG(order_revenue) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(od.quantity * p.price) AS order_revenue
    FROM Orders o
    JOIN Order_Details od
        ON o.order_id = od.order_id
    JOIN Products p
        ON od.product_id = p.product_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.order_id
) AS order_summary;


-- 9. Customer Segmentation

SELECT
    c.customer_id,
    c.customer_name,
    SUM(od.quantity * p.price) AS total_revenue,
    CASE
        WHEN SUM(od.quantity * p.price) >= 100000 THEN 'High Value'
        WHEN SUM(od.quantity * p.price) >= 30000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
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
ORDER BY total_revenue DESC;


-- 10. Top 5 Customers

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


-- 11. Category Quantity Performance

SELECT
    p.category,
    SUM(od.quantity) AS total_quantity_sold
FROM Products p
JOIN Order_Details od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_quantity_sold DESC;