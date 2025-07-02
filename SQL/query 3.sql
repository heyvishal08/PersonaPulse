SELECT u.persona, ROUND(SUM(o.amount), 2) AS total_revenue
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.payment_status = 'Paid'
GROUP BY u.persona
ORDER BY total_revenue DESC;

SELECT u.persona, ROUND(AVG(o.amount), 2) AS avg_order_value
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.payment_status = 'Paid'
GROUP BY u.persona
ORDER BY avg_order_value DESC;

SELECT u.persona,
       COUNT(DISTINCT pv.user_id) AS total_viewers,
       COUNT(DISTINCT o.user_id) AS total_buyers,
       ROUND(COUNT(DISTINCT o.user_id)*100.0 / COUNT(DISTINCT pv.user_id), 2) AS conversion_rate_pct
FROM users u
LEFT JOIN product_views pv ON u.user_id = pv.user_id
LEFT JOIN orders o ON u.user_id = o.user_id AND o.payment_status = 'Paid'
GROUP BY u.persona
ORDER BY conversion_rate_pct DESC;


SELECT u.persona,
       COUNT(DISTINCT r.order_id) AS returns,
       COUNT(DISTINCT o.order_id) AS orders,
       ROUND(COUNT(DISTINCT r.order_id)*100.0 / NULLIF(COUNT(DISTINCT o.order_id), 0), 2) AS return_rate_pct
FROM users u
JOIN orders o ON u.user_id = o.user_id
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE o.payment_status = 'Paid'
GROUP BY u.persona
ORDER BY return_rate_pct DESC NULLS LAST;



SELECT p.category,
       ROUND(SUM(o.amount), 2) AS total_revenue,
       COUNT(*) AS total_orders
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.payment_status = 'Paid'
GROUP BY p.category
ORDER BY total_revenue DESC;




