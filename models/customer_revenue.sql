SELECT
 s.customer_id,
 ROUND(SUM(r.revenue),2) as customer_revenue
FROM {{ ref('stg_orders') }} as s
INNER JOIN {{ ref('order_revenue') }} as r
ON s.order_id = r.order_id
GROUP BY customer_id
