{{
    config(
        materialized = "table",
        meta = {
            'owner': 'sql_file_owner@gmail.com'
        }
    )
}}

SELECT
    book_ref,
    book_date,
    total_amount
    
FROM 
    {{ ref('stg_flights__bookings') }}