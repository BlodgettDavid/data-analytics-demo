{{ config(materialized='view') }}

with source as (
    select * from raw.orders
),

renamed as (
    select
        order_id,
        customer_id,
        order_timestamp as order_date
    from source
)

select * from renamed