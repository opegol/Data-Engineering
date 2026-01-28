{{ config(materialized='view') }}

with source as (

    select
        order_id,
        cast(order_date as date) as order_date,
        trim(customer_id) as customer_id,
        trim(customer_name) as customer_name,
        trim(product) as product,
        trim(initcap(category)) as category,
        cast(quantity as int) as quantity,
        unit_price,
        trim(country) as country,      
        cast(created_at as timestamp) as created_at

    from {{ source('raw', 'sales_raw') }}

),

filtered as (

    select *
    from source
    where order_id is not null
      and quantity > 0
      and unit_price > 0

)

select * from filtered