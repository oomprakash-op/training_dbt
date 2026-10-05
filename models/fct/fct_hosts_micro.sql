{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'microbatch',
        event_time = 'created_at',
        begin = '2009-06-04',
        batch_size = 'year',
        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "year"
         }
        
    )
}}
with cte_7 as
(
select 
* 
from 
{{ref('src_hosts_old')}}

)
select * from cte_7
