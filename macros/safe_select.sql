{% macro safe_select(table_name) %}
    {# Проверяем существование таблицы #}
    {% set source_relation = adapter.get_relation(
        database = target.database,
        schema = target.schema,
        identifier = table_name
    ) %}

    {# Формируем SQL-запрос в зависимости от существования таблицы #}
    {% if source_relation %}
        {% set sql_query = "SELECT * FROM " ~ source_relation %}
    {% else %}
        {% set sql_query = "SELECT NULL AS result" %}
    {% endif %}

    {# Логируем сформированный SQL-запрос #}
    {% do log("Generated SQL query: " ~ sql_query, info=true) %}

    {# Возвращаем SQL-запрос #}
    {{ return(sql_query) }}
{% endmacro %}