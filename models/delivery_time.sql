SELECT
 order_id,
 TIMESTAMP_DIFF(order_delivered_customer_date,order_purchase_timestamp,DAY) as delivery_time_days
FROM {{ ref('stg_orders')}}
