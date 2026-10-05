{{ target.project }}
{{ target.dataset }}
{{ target.type }}

{% if target.project == 'racko-master-project-505113' %}

    select 2 + 3

{% elif target.project == 'abc_table' %}

    select 10 + 30

{% endif %}

{% if execute %}

    {% set results = run_query(
        "select count(*) from tred_train_1.src_hosts_old"
    ) %}

    {% set rowcount = results.columns[0].values()[0] %}

    {{ log("Row Count: " ~ rowcount, info=true) }}

{% endif %}
