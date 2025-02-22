{%- set current_date = run_started_at | string | truncate(10, True, "") -%}

SELECT 
    COUNT(*) AS future_flights_cnt
FROM 
    {{ ref('fct_flights') }}
WHERE 
    scheduled_departure >= '{{ current_date }}'