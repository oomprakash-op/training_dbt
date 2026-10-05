{{

    config( 
        materialized = 'table',
        pre_hook = "select'starting the execution of the model......' as message",
        post_hook = "select'finished  execution of the model......' as message"

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