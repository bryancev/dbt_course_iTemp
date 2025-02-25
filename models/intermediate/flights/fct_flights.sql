{{
    config(
    materialized = "table"
    )
}}

SELECT
    flight_id,
    flight_no,
    scheduled_departure,
    scheduled_arrival,
    departure_airport,
    arrival_airport,
    "status",
    aircraft_code,
    actual_departure,
    actual_arrival
    
FROM 
    {{ ref('stg_flights__flights') }}