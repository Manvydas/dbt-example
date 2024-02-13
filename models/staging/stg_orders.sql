WITH source AS (

    SELECT *
    FROM {{ source('turing_example', 'orders') }}
    QUALIFY ROW_NUMBER() OVER(win) = 1
    WINDOW win AS (PARTITION BY id ORDER BY created_at ASC)
    
)

SELECT *
FROM source
