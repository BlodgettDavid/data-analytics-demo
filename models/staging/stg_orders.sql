{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw', 'orders') }}
),

renamed as (
    select
        order_id::integer as order_id,
        customer_id::integer as customer_id,
        order_timestamp::timestamp as order_date
    from source
)

select * from renamed