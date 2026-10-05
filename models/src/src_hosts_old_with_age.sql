{{

    config( 
        materialized = 'table',
        event_time='created_at',
        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "day"
        }
    ) 

}}


with cte_1 as

(

select 

*

from

{{source('airbnb','hosts')}}

)
 
select

id as host_id, 

name as host_name,

is_superhost,

created_at,

updated_at,

{{age('created_at')}} as host_age

from

cte_1
 