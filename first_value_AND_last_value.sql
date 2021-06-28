# FIRST_VALUE e LAST_VALUE
# https://www.red-gate.com/simple-talk/sql/t-sql-programming/introduction-to-t-sql-window-functions/

# FIRST_VALUE
SELECT
  customer_id,
  created_at,
  FIRST_VALUE(created_at) OVER(PARTITION BY customer_id ORDER BY created_at) AS primeira_compra,
  TIMESTAMP_DIFF(created_at, FIRST_VALUE(created_at) OVER(PARTITION BY customer_id ORDER BY created_at), DAY) AS dias_desde_primeira_compra
FROM e_commerce.orders
WHERE status = 'entregue'
ORDER BY customer_id, created_at;

# LAST_VALUE
SELECT
  customer_id,
  created_at,
  LAST_VALUE(created_at) OVER(PARTITION BY customer_id ORDER BY created_at
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS ultima_compra
FROM e_commerce.orders
WHERE status = 'entregue'
ORDER BY customer_id, created_at;





