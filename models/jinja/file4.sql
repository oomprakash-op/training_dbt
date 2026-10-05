{% set countries = ['India', 'Nepal', 'USA', 'UK', 'Canada'] %}

select country
from unnest([
{% for country in countries %}
    '{{country}}'{% if not loop.last %},{% endif %}
{% endfor %}
]) as country
