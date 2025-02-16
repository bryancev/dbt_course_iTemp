{%- set get_flights_status_query -%}
SELECT DISTINCT
    "status"
FROM
    {{ ref('stg_flights__flights') }}
{%- endset -%}  

{%- set get_flights_status_result = run_query(get_flights_status_query) -%}

{%- if execute -%}
    {%- set flights_statuses = get_flights_status_result.columns[0].values() -%}
{%- else -%}
    {%- set flights_statuses = [] -%}
{%- endif -%}

SELECT 
    {% for stat in flights_statuses -%}
    SUM(CASE WHEN "status" = '{{ stat }}' THEN 1 ELSE 0 END) as status_{{ stat | replace(" ", "_") | lower }}
        {%- if not loop.last -%}, {% endif %}
    {% endfor %}
FROM
    {{ ref('fct_flights') }}