CREATE TABLE customer_ltv AS
WITH paid_orders AS (
    SELECT *
    FROM orders
    WHERE payment_status = 'Paid'
),
order_periods AS (
    SELECT 
        user_id,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order
    FROM paid_orders
    GROUP BY user_id
),
active_months AS (
    SELECT 
        o.user_id,
        DATE_PART('month', AGE(last_order, first_order)) + 1 AS months_active
    FROM order_periods o
),
user_revenue AS (
    SELECT 
        user_id,
        COUNT(order_id) AS total_orders,
        SUM(amount) AS total_revenue
    FROM paid_orders
    GROUP BY user_id
)
SELECT 
    r.user_id,
    r.total_revenue,
    r.total_orders,
    a.months_active,
    ROUND((r.total_revenue / NULLIF(a.months_active, 0))::numeric, 2) AS monthly_value,
	ROUND(r.total_revenue::numeric, 2) AS lifetime_value

FROM user_revenue r
JOIN active_months a ON r.user_id = a.user_id;
