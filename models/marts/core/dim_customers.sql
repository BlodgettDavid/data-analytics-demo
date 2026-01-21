with source as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        created_at
    from {{ ref('stg_customers') }}
),

enhanced as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        created_at as signup_date,
        date_trunc('month', created_at) as signup_month,
        extract(year from created_at) as signup_year
    from source
)

select * from enhanced