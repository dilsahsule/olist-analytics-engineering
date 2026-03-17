SELECT 
 p.product_id,
 t.product_category_name_english as product_category_name
FROM `Olist.olist_products_dataset` as p
INNER JOIN `Olist.product_category_name_translation` as t
ON p.product_category_name = t.product_category_name
