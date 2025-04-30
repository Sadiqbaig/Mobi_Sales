-- Total revenue and order counts by order status
SELECT 
    order_status,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(order_amount) AS total_order_amount
FROM customer_orders
GROUP BY order_status
ORDER BY total_order_amount DESC;

-- Repeat customers: those who placed more than 1 order
SELECT 
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM customer_orders
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;

-- Monthly new vs returning customers
SELECT
    DATE_TRUNC('month', order_date) AS month,
    customer_id,
    COUNT(DISTINCT order_id) AS order_count
FROM customer_orders
GROUP BY month, customer_id;

-- Payment success vs failure
SELECT 
    payment_status,
    COUNT(payment_id) AS count_payments,
    SUM(payment_amount) AS total_paid
FROM payments
GROUP BY payment_status;

SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_amount,
    o.order_status,
    p.payment_date,
    p.payment_amount,
    p.payment_method,
    p.payment_status
FROM customer_orders o
LEFT JOIN payments p ON o.order_id = p.order_id
ORDER BY o.order_date DESC;

-- Monthly Sales Trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_revenue
FROM customer_orders
GROUP BY month
ORDER BY month;

-- Average Order Value by Status-- 
SELECT 
    order_status,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_revenue,
    AVG(order_amount) AS avg_order_value
FROM customer_orders
GROUP BY order_status
ORDER BY avg_order_value DESC;

-- Top 10 Customers by Total Spend
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_spent
FROM customer_orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Payment Method Performance
SELECT 
    payment_method,
    COUNT(payment_id) AS total_payments,
    SUM(payment_amount) AS total_paid,
    SUM(CASE WHEN payment_status = 'completed' THEN 1 ELSE 0 END) AS successful_count
FROM payments
GROUP BY payment_method;

-- Orders with No Payment
SELECT o.order_id, o.customer_id, o.order_date
FROM customer_orders o
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

-- Order Fulfillment Timeliness
SELECT 
    order_id,
    order_date,
    shipment_date,
    order_date AS fulfillment_days
FROM customer_orders
WHERE order_status IN ('shipped', 'delivered');

-- Orders With Multiple Payments
SELECT 
    order_id,
    COUNT(payment_id) AS num_payments,
    SUM(payment_amount) AS total_paid
FROM payments
GROUP BY order_id
HAVING COUNT(payment_id) > 1;