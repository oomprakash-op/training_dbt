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
    from {{ ref('src_listings') }}

)

select
    listing_id,
    listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price_str,
    created_at,
    updated_at
from cte_2
where minimum_nights > 0