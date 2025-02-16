{{
    config(
    materialized = "table"
    )
}}

SELECT
    ticket_no,
    flight_id,
    fare_conditions,
    amount

FROM
    {{ source('demo_src', 'ticket_flights') }}
    
{% if target.name == 'dev' %}
LIMIT 100000
{% endif %}