{{

    config( 
        materialized = 'table',
        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "day"
        }
    ) 

}}


with 
cte_4 
as
(
select * from {{ref('src_hosts_old')}}
where is_superhost is not null
)

SELECT   
host_id,  
COALESCE(host_name, 'Anonymous') AS host_name,
is_superhost,    
created_at,    
updated_at
from cte_4