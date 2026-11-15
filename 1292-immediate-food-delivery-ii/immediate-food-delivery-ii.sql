# Write your MySQL query statement below
WITH fist_orders as (
    SELECT order_date,
    customer_pref_delivery_date,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) as rn
    FROM Delivery
)
SELECT ROUND(AVG(IF(order_date = customer_pref_delivery_date, 1, 0)) * 100, 2) as immediate_percentage 
FROM fist_orders
WHERE rn = 1