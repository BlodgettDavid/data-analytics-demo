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
        trim(event_id) as event_id,
        trim(event_type) as event_type,
        cast(customer_id as integer) as customer_id,
        cast(timestamp as timestamp) as event_timestamp,
        trim(device) as device,
        metadata
    from source
)

select * from renamed