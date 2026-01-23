with source as (
    select
        product_id,
        product_name,
        category,
        price
    from {{ ref('stg_products') }}
),

enhanced as (
    select
        product_id,
        product_name,
        category,
        price
    from source
)

select * from enhanced