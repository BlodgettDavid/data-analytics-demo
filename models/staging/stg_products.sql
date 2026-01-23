{{ config(materialized='view') }}

with source as (
    select *
    from {{ source('raw', 'products') }}
),

renamed as (
    select
        product_id::integer as product_id,
        trim(product_name) as product_name,
        trim(category) as category,
        price::decimal(10,2) as price
    from source
)

select * from renamed