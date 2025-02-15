SELECT  
    scheduled_departure::date AS scheduled_departure,
    COUNT(*) AS cnt_cancelled_fligth
FROM
    {{ ref('fct_flights') }}
WHERE 
    departure_airport = 'MJZ'
    AND "status" = 'Cancelled'
GROUP BY
    scheduled_departure::date