{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'insert_overwrite',
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
where 1=1
{% if is_incremental() %}
    and created_at > (select MAX(created_at) from {{this}})
{% endif  %}