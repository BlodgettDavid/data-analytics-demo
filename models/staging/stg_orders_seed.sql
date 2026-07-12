{{ config(materialized='view') }}

with source as (
    select
        order_id,
        customer_id,
        order_timestamp,
        order_amount
    from {{ ref('orders_seed') }}
),

renamed as (
    select
        cast(order_id as integer) as order_id,
        cast(customer_id as integer) as customer_id,
        cast(order_timestamp as timestamp) as order_timestamp,
        cast(order_amount as integer) as order_amount
    from source
)

select * from renamed