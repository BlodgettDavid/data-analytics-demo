with event_types as (
    select distinct
        event_type
    from {{ ref('stg_nosql_events') }}
)

select
    event_type,
    event_type as event_type_name
from event_types
order by event_type