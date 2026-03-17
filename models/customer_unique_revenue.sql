SELECT
 c.customer_unique_id,
 ROUND(SUM(r.customer_revenue),2) as total_revenue
FROM {{ ref('stg_customers') }} as c
INNER JOIN {{ ref('customer_revenue')}} as r
ON c.customer_id = r.customer_id
GROUP BY c.customer_unique_id
