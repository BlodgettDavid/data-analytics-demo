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
        cast(order_item_id as integer) as order_item_id,
        cast(order_id as integer) as order_id,
        cast(product_id as integer) as product_id,
        cast(quantity as integer) as quantity,
        cast(unit_price as numeric(10,2)) as unit_price
    from source
)

select * from renamed