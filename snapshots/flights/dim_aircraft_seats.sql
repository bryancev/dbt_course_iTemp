{% snapshot dim_aircraft_seats %}

{{
    config(
        target_schema='snapshot',
        unique_key='aircraft_code',

        strategy='check',
        check_cols = ['fare_conditions'],

   )
}}

SELECT
    aircraft_code,
    fare_conditions
FROM
    {{ ref('stg_flights__seats') }}

{% endsnapshot %}