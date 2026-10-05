{{
    config(
        materialized = 'incremental',
        on_schema_change = 'append_new_columns',   
        incremental_strategy = 'merge',
        unique_key = 'host_id'
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