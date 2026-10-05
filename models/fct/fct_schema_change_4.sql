{{
    config(
        materialized = 'incremental',
        on_schema_change = 'sync_all_columns',   
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
    and updated_at > (select MAX(updated_at) from {{this}})
{% endif  %}