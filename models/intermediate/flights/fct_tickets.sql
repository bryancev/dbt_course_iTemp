{{
    config(
    materialized = "table"
    )
}}

SELECT
    ticket_no,
    book_ref,
    passenger_id,
    passenger_name,
    contact_data
    
FROM 
    {{ ref('stg_flights__tickets') }}

WHERE passenger_id NOT IN (SELECT passenger_id FROM {{ ref('employees_tickets') }});