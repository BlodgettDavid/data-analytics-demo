with source as (
    select
        order_item_id,
        order_id,
        product_id,
        quantity,
        unit_price
    from {{ ref('stg_order_items') }}
),

enhanced as (
    select
        order_item_id,                         -- degenerate dimension
        order_id,                              -- FK to fct_orders
        product_id,                            -- FK to dim_products
        quantity,
        unit_price,
        quantity * unit_price as extended_price
    from source
)

select * from enhanced