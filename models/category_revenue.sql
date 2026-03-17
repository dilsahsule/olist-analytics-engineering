SELECT 
 p.product_category_name,
 ROUND(SUM(o.price + o.freight_value),2) as category_revenue,
 DENSE_RANK() OVER (ORDER BY SUM(o.price + o.freight_value) DESC) as revenue_rank
FROM  {{ ref('stg_products')}} as p
JOIN {{ ref('stg_order_items')}} as o 
ON o.product_id = p.product_id
GROUP BY p.product_category_name
