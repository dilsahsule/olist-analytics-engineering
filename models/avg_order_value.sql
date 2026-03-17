SELECT
 ROUND(AVG(revenue),2) as avg_order_value
FROM {{ ref('order_revenue')}}
