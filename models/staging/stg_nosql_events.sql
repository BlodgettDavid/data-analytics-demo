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
        event_id::integer as event_id,
        trim(event_type) as event_type,
        customer_id::integer as customer_id,
        timestamp::timestamp as event_timestamp,
        trim(device) as device,
        metadata  -- keep JSON as-is for now
    from source
)

select * from renamed