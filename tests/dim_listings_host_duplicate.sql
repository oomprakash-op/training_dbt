select host_id, count(*) as n_records
from {{ ref("src_hosts") }}
group by host_id
having count(*) > 1
