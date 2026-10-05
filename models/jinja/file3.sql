{% set host_id = 10 %}

{% if host_id < 10 %}
    select {{2+3}} as result
{% else %}
    SELECT {{10+2}} as result
{% endif %}
