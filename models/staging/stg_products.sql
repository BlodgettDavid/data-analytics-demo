{{ config(materialized='view') }}

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
        product_id::integer as product_id,
        trim(product_name) as product_name,
        trim(category) as category,
        price::numeric as price
    from source
)

select * from renamed