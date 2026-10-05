{% macro mv_macro() %}

    {% set sql %}
        CREATE MATERIALIZED VIEW IF NOT EXISTS
        `{{ target.project }}.{{ target.dataset }}.oom_materialized_view`
        AS
        SELECT *
        FROM {{ ref('src_hosts_old') }}
    {% endset %}

    {% if execute %}
        {{ log('Creating materialized view...', info=True) }}

        {% do run_query(sql) %}

        {{ log('Materialized view created successfully.', info=True) }}
    {% endif %}

{% endmacro %}