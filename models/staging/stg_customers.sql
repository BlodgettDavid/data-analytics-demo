with source as (
    select * 
    from {{ source('raw', 'customers') }}
),

renamed as (
    select
        customer_id::integer as customer_id,
        trim(first_name) as first_name,
        trim(last_name) as last_name,
        lower(trim(email)) as email,
        created_at::timestamp as created_at
    from source
)

select * from renamed