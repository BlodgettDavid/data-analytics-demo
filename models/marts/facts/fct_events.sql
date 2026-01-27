with events as (
    select
        event_id,
        customer_id,
        event_type,
        event_timestamp,
        device,
        metadata
    from {{ ref('stg_nosql_events') }}
),

joined as (
    select
        e.event_id,
        e.customer_id,
        c.customer_id as customer_key,
        e.event_type,
        et.event_type as event_type_key,
        e.event_timestamp,
        e.device,

        -- Optional: flatten metadata fields when present
        e.metadata->>'ip' as ip_address,
        e.metadata->>'location' as location,
        e.metadata->>'ticket_id' as ticket_id,
        e.metadata->>'category' as ticket_category,
        e.metadata->>'old_device' as old_device,
        e.metadata->>'new_device' as new_device

    from events e
    left join {{ ref('dim_customers') }} c
        on e.customer_id = c.customer_id
    left join {{ ref('dim_event_types') }} et
        on e.event_type = et.event_type
)

select *
from joined
order by event_timestamp, event_id