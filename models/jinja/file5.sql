select *
from {{
    ref('dim_listings_hosts_cleansed')
}}
where host_id = {{ var("my_host_id", 12) }}
