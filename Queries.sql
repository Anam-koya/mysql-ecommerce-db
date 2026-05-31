-- Total revenue per customer
select c.customername, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi 
ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- Low stock alert
SELECT productname, stock_qty
FROM products
WHERE stock_qty < 10
ORDER BY stock_qty ASC;

-- Orders with status 'pending'
SELECT o.order_id, c.customername, o.order_date, status
FROM orders o
JOIN customers c 
ON o.customer_id = c.customer_id
WHERE o.status = 'pending';

-- Monthly revenue trend
SELECT MONTH(order_date) AS month, SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status != 'cancelled'
GROUP BY MONTH(order_date);

-- Average order value
SELECT ROUND(AVG(order_total), 2) AS avg_order_value
FROM (
    SELECT order_id, SUM(quantity * unit_price) AS order_total
    FROM order_items
    GROUP BY order_id
) AS order_totals;
