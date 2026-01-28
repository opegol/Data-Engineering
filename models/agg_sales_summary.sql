{{ config(materialized='table') }}

select
    country,
    category,

    count(distinct order_id) as total_orders,
    sum(quantity) as total_quantity,
    sum(total_amount) as total_sales_amount,
    avg(total_amount) as average_order_value

from {{ ref('fct_sales') }}
group by country, category
