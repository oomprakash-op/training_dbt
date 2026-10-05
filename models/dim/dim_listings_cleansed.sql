{{
    config(
        materialized='table',
        partition_by={
            "field": "created_at",
            "data_type": "timestamp",
            "granularity": "day"
        }
    )
}}

with cte_2 as (

    select *
    from {{ source('airbnb','listings') }}

)

select
    id as listing_id,
    name as listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price as price_str,
    created_at,
    updated_at
from cte_2