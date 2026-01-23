with source as (
    select
        order_id,
        customer_id,
        order_date
    from {{ ref('stg_orders') }}
),

enhanced as (
    select
        order_id,                                -- degenerate dimension
        customer_id,                             -- FK to dim_customers
        order_date,
        date_trunc('month', order_date) as order_month,
        date_part('year', order_date) as order_year
    from source
)

select * from enhanced