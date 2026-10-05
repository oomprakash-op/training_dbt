{% macro audit_start2() %}
 
    SELECT
        'Starting model execution' AS message,
        CURRENT_TIMESTAMP() AS execution_time
 
{% endmacro %}