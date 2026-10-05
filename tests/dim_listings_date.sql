select*
from
{{ref("dim_listings_hosts_cleansed")}}
where updated_at < created_at