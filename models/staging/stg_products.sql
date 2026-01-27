with source as (
    select
        product_id,
        product_name,
        category,
        price
    from {{ source('raw', 'products') }}
),

renamed as (
    select
        cast(product_id as integer) as product_id,
        lower(trim(product_name)) as product_name,
        lower(trim(category)) as category,
        cast(price as numeric(10,2)) as price
    from source
)

select * from renamed