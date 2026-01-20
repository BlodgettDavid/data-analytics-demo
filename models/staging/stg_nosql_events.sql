{{ config(materialized='view') }}

with source as (
    select * from raw.nosql_events
),

renamed as (
    select
        event_id,
        event_type,
        customer_id,
        timestamp,
        device,
        metadata
    from source
)

select * from renamed