{{ config(materialized='table') }}

with sales as (

    select *
    from {{ ref('stg_sales') }}

),

calculated as (

    select
        order_id,
        customer_name,
        country,
        category,
        order_date,
        quantity,
        unit_price,

        quantity * unit_price as total_amount,

        extract(year from order_date) as order_year,
        extract(month from order_date) as order_month,

        case
            when quantity * unit_price > 500 then true
            else false
        end as is_high_value_order

    from sales

)

select *
from calculated
