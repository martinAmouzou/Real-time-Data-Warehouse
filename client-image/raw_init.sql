--init data before streaming sql
--to avoid error 'org.apache.hudi.exception.HoodieException: No successful commits under path'

INSERT INTO `raw`.t_fact_online_order
SELECT order_id,
       user_id,
       CAST(order_total_amount AS DECIMAL),
       CAST(actual_amount AS DECIMAL),
       CAST(post_amount AS DECIMAL),
       CAST(order_pay_amount AS DECIMAL),
       CAST(total_discount AS DECIMAL),
       pay_type,
       source_type,
       order_status,
       note,
       confirm_status,
       CAST(payment_time AS TIMESTAMP),
       CAST(delivery_time AS TIMESTAMP),
       CAST(receive_time AS TIMESTAMP),
       CAST(comment_time AS TIMESTAMP),
       delivery_company,
       delivery_code,
       CAST(business_date AS DATE),
       return_flag,
       CAST(created_at AS TIMESTAMP),
       CAST(updated_at AS TIMESTAMP),
       CAST(deleted_at AS TIMESTAMP)
FROM staging.t_fact_online_order;

INSERT INTO `raw`.t_fact_online_order_detail
SELECT id,
       order_id,
       product_code,
       CAST(product_quantity AS INT),
       CAST(product_amount AS DECIMAL),
       CAST(product_actual_amount AS DECIMAL),
       CAST(created_at AS TIMESTAMP),
       CAST(updated_at AS TIMESTAMP),
       CAST(deleted_at AS TIMESTAMP)
FROM staging.t_fact_online_order_detail;