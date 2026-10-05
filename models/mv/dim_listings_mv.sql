{{

    config( 
        materialized = 'materialized_view',
        full_refresh = true,
        enable_refresh = true,
        refresh_interval_minutes =30,

        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "day"
        }
    ) 

}}


with cte_2 as
(
select 
*
from
{{ref('src_listings')}}
)
 
select
*
from
cte_2