SELECT 
 CASE
      WHEN d.delivery_time_days  <= 2 then 'very_fast'
      WHEN d.delivery_time_days  <= 5 then 'fast'
      WHEN d.delivery_time_days  <= 10 then 'normal'
      ELSE 'slow'
END AS delivery_bucket,
 COUNT(d.order_id) as order_count,
 ROUND(AVG(r.review_score),2) as avg_review_score
FROM {{ ref('delivery_time') }} as d
INNER JOIN {{ ref('stg_order_reviews')}} as r
ON d.order_id = r.order_id
WHERE d.delivery_time_days IS NOT NULL
GROUP BY delivery_bucket
ORDER BY avg_review_score DESC
