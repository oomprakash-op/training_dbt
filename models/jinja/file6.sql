-- depends_on: {{ ref('src_hosts_old') }}
-- {{ target.project }}
-- {{ target.dataset }}
-- {{ target.type }}

{% if target.project == 'racko-master-project-505113' %}

    select 2 + 3 as result

{% elif target.project == 'abc_table' %}

    select 10 + 30 as result

{% endif %}

{% if execute %}

    {% set results = run_query(
        "select count(*) from " ~ ref('src_hosts_old')
    ) %}

    {% set rowcount = results.columns[0].values()[0] %}

    {{ log("Row Count: " ~ rowcount, info=true) }}

{% endif %}
