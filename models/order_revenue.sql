SELECT 
 order_id,
 SUM(price + freight_value) as revenue
FROM {{ ref('stg_order_items')}}
GROUP BY order_id
