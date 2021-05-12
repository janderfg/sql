# EXTRACT

SELECT
  CURRENT_DATE AS exemplo_1,
  EXTRACT(YEAR FROM CURRENT_DATE) AS exemplo_2,
  EXTRACT(MONTH FROM CURRENT_DATE) AS exemplo_3,
  EXTRACT(DAY FROM CURRENT_DATE) AS exemplo_4,
  EXTRACT(DAYOFWEEK FROM CURRENT_DATE) AS exemplo_5, -- Starts from 1 -Sunday
  EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AS exemplo_6, -- Hour from UTC time zone
  EXTRACT(HOUR FROM CURRENT_TIMESTAMP AT TIME ZONE "America/Sao_Paulo") AS exemplo_7,
  EXTRACT(DATE FROM CURRENT_TIMESTAMP AT TIME ZONE "America/Sao_Paulo") AS exemplo_8,
  EXTRACT(TIME FROM CURRENT_TIMESTAMP AT TIME ZONE "America/Sao_Paulo") AS exemplo_9;

SELECT
  COUNT(DISTINCT id) AS num_pedidos,
  EXTRACT(DAYOFWEEK from created_at) AS dia_da_semana,
  CASE
    WHEN EXTRACT(DAYOFWEEK from created_at) = 1 THEN "Domingo"
    WHEN EXTRACT(DAYOFWEEK from created_at) = 2 THEN "Segunda"
    WHEN EXTRACT(DAYOFWEEK from created_at) = 3 THEN "Terça"
    WHEN EXTRACT(DAYOFWEEK from created_at) = 4 THEN "Quarta"
    WHEN EXTRACT(DAYOFWEEK from created_at) = 5 THEN "Quinta"
    WHEN EXTRACT(DAYOFWEEK from created_at) = 6 THEN "Sexta"
    WHEN EXTRACT(DAYOFWEEK from created_at) = 7 THEN "Sábado"
  END AS dia_da_semana_2  
FROM e_commerce.orders
GROUP BY dia_da_semana, dia_da_semana_2
ORDER BY dia_da_semana;