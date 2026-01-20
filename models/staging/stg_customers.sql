with source as (

    select * from {{ source('raw', 'customers') }}

),

renamed as (

    select
        customer_id::integer as customer_id,
        lower(email) as email,
        first_name,
        last_name,
        created_at::timestamp as created_at
    from source

)

select * from renamed
