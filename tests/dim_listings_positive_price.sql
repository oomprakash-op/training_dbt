{{ config(severity = 'warn') }}

select * from
{{ ref('dim_listings_cleansed') }}
where price_str <= 0
