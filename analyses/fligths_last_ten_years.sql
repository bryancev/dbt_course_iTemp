{%- set current_date = run_started_at | string | truncate(10, True, "") -%}
{%- set current_year = run_started_at.year -%}
{%- set prev_year = current_year - 10 -%}
{%- set prev_date = [prev_year, run_started_at.month, run_started_at.day] | join('-') -%}

SELECT 
    COUNT(*) AS flights_cnt_last_ten_years
FROM 
    {{ ref('fct_flights') }}
WHERE 
    scheduled_departure BETWEEN '{{ prev_date }}' AND '{{ current_date }}'