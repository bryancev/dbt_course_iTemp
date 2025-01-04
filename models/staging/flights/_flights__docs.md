{% docs aircrafts_description %}

# Таблица с моделями самолетов

Содерит данные, полученные запросом:

```sql
SELECT 
    aircraft_code, 
    model, 
    "range"
FROM demo.bookings.aircrafts;
```
{% enddocs %}