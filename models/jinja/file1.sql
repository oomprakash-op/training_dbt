{% set my_host_id = [12, 13, 14] %}

select *
from {{
    ref('dim_listings_hosts_cleansed')
}}
where host_id in ({{ my_host_id | join(', ') }})
