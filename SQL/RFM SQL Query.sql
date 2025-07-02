CREATE TABLE rfm AS
WITH reference_date AS (
    SELECT DATE '2025-06-26' AS today
),
filtered_orders AS (
    SELECT *
    FROM orders
    WHERE payment_status = 'Paid'
)
SELECT 
    o.user_id,
    (SELECT today FROM reference_date) - MAX(o.order_date) AS recency_days,
    COUNT(o.order_id) AS frequency,
    SUM(o.amount) AS monetary
FROM filtered_orders o
GROUP BY o.user_id;


SELECT * FROM rfm
ORDER BY monetary DESC;



