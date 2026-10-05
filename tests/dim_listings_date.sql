select*
from
{{ref("dim_listings_hosts_cleansed")}}
where date(updated_at) > date(created_at)
limit 10