{% snapshot dim_aircrafts %}

{{
    config(
        target_schema='snapshot',
        unique_key='aircraft_code',

        strategy='check',
        check_cols = ['model', "range"],

        snapshot_meta_column_names={
            "dbt_valid_from": "dbt_effective_date_from",
            "dbt_valid_to": "dbt_effective_date_to"
        }
   )
}}

SELECT
    aircraft_code,
    model,
    "range"
FROM
    {{ ref('stg_flights__aircrafts') }}

{% endsnapshot %}