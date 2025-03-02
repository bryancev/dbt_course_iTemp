{{
    config(
        materialized = 'table',
        pre_hook = "
            {% set now = run_started_at.strftime('%Y_%m_%d_%H%M%S') %}
            {% set backup_relation = api.Relation.create(
                database = this.database,
                schema = this.schema,
                identifier = this.identifier ~ '_' ~ now,
                type = 'table'
            ) %}
            
            {# Проверяем существование текущей таблицы #}
            {% set source_relation = adapter.get_relation(
                this.database,
                this.schema,
                this.identifier
            ) %}
            
            {# Если таблица существует - делаем бэкап #}
            {% if source_relation %}
                {# Удаляем бэкап, если он уже существует #}
                {% do adapter.drop_relation(backup_relation) %}

                {# Переименовываем текущую таблицу в бэкап #}
                {% do adapter.rename_relation(source_relation, backup_relation) %}
            {% endif %}
        "
    )
}}

SELECT
    aircraft_code,
    model,
    "range"
FROM
    {{ source('demo_src', 'aircrafts') }}