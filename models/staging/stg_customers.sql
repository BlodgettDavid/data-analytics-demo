with source as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        created_at
    from {{ source('raw', 'customers') }}
),

renamed as (
    select
        cast(customer_id as integer) as customer_id,
        trim(first_name) as first_name,
        trim(last_name) as last_name,
        lower(trim(email)) as email,
        cast(created_at as timestamp) as created_at
    from source
)

select * from renamed