WITH source AS (

    SELECT
        id,
        customer_id,
        IFNULL(country, 'unknown') AS country,
        phone_number
    FROM {{ source('turing_example', 'customer_details') }}
    
)

SELECT *
FROM source
