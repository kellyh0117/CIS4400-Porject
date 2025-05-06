-- models/my_model.sql

SELECT *
FROM {{ source('HOMEWORK', 'DIM_COMPANY_ID') }} AS dc
JOIN {{ source('HOMEWORK', 'DIM_DATE') }} AS dd
  ON dc.date_id = dd.date_id
JOIN {{ source('HOMEWORK', 'DIM_LOCATION') }} AS dl
  ON dc.location_id = dl.location_id
