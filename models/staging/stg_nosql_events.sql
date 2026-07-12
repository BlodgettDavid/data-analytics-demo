{{ config(materialized='view') }}

with source as (
    select
        event_id,
        event_type,
        customer_id,
        timestamp,
        device,
        metadata
    from {{ source('raw', 'nosql_events') }}
),

renamed as (
    select
        cast(event_id as integer) as event_id,       -- integers don’t need trim
        trim(event_type) as event_type,              -- safe to trim strings
        cast(customer_id as integer) as customer_id,
        cast(timestamp as timestamp) as event_timestamp,
        trim(device) as device,
        metadata
    from source
)

select * from renamed