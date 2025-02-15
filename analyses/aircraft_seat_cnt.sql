SELECT  
    aircraft_code,
    COUNT(*) AS cnt_seats
FROM
    {{ ref('stg_flights__seats') }}

GROUP BY
    aircraft_code