{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'append', 
        tags = ['bookings']
    )
}}
SELECT
    book_ref,
    {{ bookref_to_bigint('book_ref') }} AS int_book_ref,
    book_date,
    {{ kopeck_to_ruble(column_name='total_amount') }} as total_amount
FROM
    {{ source('demo_src', 'bookings') }}
{% if is_incremental() %}
WHERE 
    ('0x' || book_ref)::bigint > (SELECT MAX(('0x' || book_ref)::bigint) FROM {{ this }})
{% endif %}