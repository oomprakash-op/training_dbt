{% macro audit_end2() %}
 
    SELECT
        'Finished model execution' AS message,
        CURRENT_TIMESTAMP() AS execution_time
 
{% endmacro %}