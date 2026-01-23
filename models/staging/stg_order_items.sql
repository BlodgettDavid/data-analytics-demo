{{ config(materialized='view') }}

with source as (
    select
        order_item_id,
        order_id,
        product_id,
        quantity,
        unit_price
    from {{ source('raw', 'order_items') }}
),

renamed as (
    select
        order_item_id::integer as order_item_id,
        order_id::integer as order_id,
        product_id::integer as product_id,
        quantity::integer as quantity,
        unit_price::numeric as unit_price
    from source
)

select * from renamed