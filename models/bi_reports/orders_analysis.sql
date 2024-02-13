
WITH
customers AS (
  SELECT
    id,
    title
  FROM {{ ref('stg_customers') }}
),

customer_details AS (
    SELECT
        id,
        customer_id,
        country,
        phone_number
    FROM {{ ref('stg_customer_details') }}
),

customers_data AS (
    SELECT
        customers.id,
        customers.title,
        customer_details.country,
        customer_details.phone_number
    FROM customers
    LEFT JOIN customer_details
        ON customer_details.customer_id = customers.id
),

orders AS (
    SELECT
        id,
        created_at,
        customer_id,
        amount
    FROM {{ ref('stg_orders') }}
),

orders_aggregate AS (
  SELECT
    customer_id,
    COUNT(*) AS orders_count,
    SUM(amount) AS amount_sum,
  FROM orders
  GROUP BY customer_id
)

-- main part
SELECT
  customers_data.title AS customer_title,
  customers_data.country AS customer_country,
  orders_aggregate.orders_count,
  orders_aggregate.amount_sum,
  -- flag if customer is active
  orders_count IS NOT NULL AS is_customer_active,
  CONCAT(customers_data.title, ' from ', customers_data.country, ' country') AS title_with_country,
FROM customers_data
LEFT JOIN orders_aggregate
  ON orders_aggregate.customer_id = customers_data.id
