WITH source AS (

    SELECT * FROM {{ source('turing_example', 'customers') }}
    
)

SELECT *
FROM source
