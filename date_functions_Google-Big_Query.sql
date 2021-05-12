/* DATE e DATETIME
   CURRENT_DATE, CURRENT_DATETIME e CURRENT_TIMESTAMP
   TIMESTAMP
   DATE_ADD, DATETIME_ADD, TIMESTAMP_ADD,
   DATE_SUB, DATETIME_SUB e TIMESTAMP_SUB
   DATE_DIFF, DATETIME_DIFF e TIMESTAMP_DIFF
   FORMAT_DATE, FORMAT_DATETIME e FORMAT_TIMESTAMP
*/

# DATE e DATETIME
SELECT
  DATE(2021, 10, 05) AS data, -- Returns a date from the date specified
  CURRENT_TIMESTAMP AS data_e_hora_utc, -- Returns the date and time of the machine the SQL Server is running on as UTC
  DATE(CURRENT_TIMESTAMP) AS data_utc, -- Extracts only the date from a date and time function
  DATE(CURRENT_TIMESTAMP, "America/Sao_Paulo") AS data_sp; -- Extracts only the date (São Paulo time) from a date and time function
  
SELECT
    id,
    created_at,
    DATE(created_at) AS data
FROM e_commerce.customers;

SELECT
  COUNT(DISTINCT id) AS num_pedidos,
  DATE(created_at) AS DIA
FROM e_commerce.orders
GROUP BY dia
ORDER BY dia;

SELECT
  DATETIME(2021, 10, 05, 21, 05, 00) AS data_e_hora,
  CURRENT_TIMESTAMP as coluna2,
  DATETIME(CURRENT_TIMESTAMP) as coluna3,
  DATETIME(CURRENT_TIMESTAMP, "America/Sao_Paulo") AS coluna4,
  DATETIME(CURRENT_DATE) AS coluna5;
  
SELECT
  id,
  created_at,
  DATETIME(created_at) AS data_and_time,
  DATETIME(created_at, "America/Sao_Paulo") AS data_e_hora_Sao_Paulo
FROM e_commerce.customers;


# CURRENT_DATE, CURRENT_DATETIME e CURRENT_TIMESTAMP
SELECT
  CURRENT_DATE AS exemplo_1,
  CURRENT_DATETIME AS exemplo_2, --Padrão UTC
  CURRENT_DATE("America/Sao_Paulo") AS exemplo_03,
  CURRENT_DATE("Asia/Tokyo") AS exemplo_04,
  CURRENT_DATETIME("Asia/Tokyo") AS exemplo_5,
  CURRENT_TIMESTAMP AS exemplo_6,
  CURRENT_TIMESTAMP() AS exemplo_7; -- Colocando ou não o parênteses, o resultado é o mesmo

SELECT
  *
FROM `bigquery-public-data`.covid19_italy.data_by_region
WHERE DATE(date) = CURRENT_DATE - 90;


# TIMESTAMP
SELECT
  TIMESTAMP("2021-05-11 15:30:00") AS exemplo_1,
  TIMESTAMP("2021-05-11 15:30:00 America/Sao_Paulo") AS exemplo_2,
  TIMESTAMP("2021-05-11 15:30:00", "America/Sao_Paulo") AS exemplo_3,
  TIMESTAMP(CURRENT_DATETIME) AS exemplo_4,
  TIMESTAMP(CURRENT_DATE) AS exemplo_5,
  CURRENT_TIMESTAMP AS exemplo_6,
  TIMESTAMP(CURRENT_DATETIME("America/Sao_Paulo")) AS exemplo_7,
  TIMESTAMP(CURRENT_DATE("America/Sao_Paulo")) AS exemplo_8;


# Funções ADD
SELECT
  CURRENT_DATE AS exemplo_01,
  DATE_ADD(CURRENT_DATE, INTERVAL 2 DAY) AS exemplo_02, -- Exemplo somando 2 dias à data atual
  DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH) AS exemplo_03, -- Exemplo somando 1 mês à data atual
  DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR) AS exemplo_04, -- Exemplo somando 1 ano à data atual
  CURRENT_TIMESTAMP AS exemplo_05,
  TIMESTAMP_ADD(CURRENT_TIMESTAMP, INTERVAL 3 HOUR) AS exemplo_06, -- Exemplo somando 3 horas à data e hora atual UTC
  DATETIME_ADD(CURRENT_DATETIME, INTERVAL 3 HOUR) AS exemplo_07, -- Exemplo somando 3 horas à data e hora atual UTC
  DATE_ADD(DATE(2021, 05, 12), INTERVAL 2 DAY) AS exemplo_08,  -- Exemplo somando 2 dias à data definida na função
  DATE_ADD(DATE '2021-05-12', INTERVAL 2 DAY) AS exemplo_09;  -- Exemplo somando 2 dias à data definida na função
  

SELECT
  *
FROM `bigquery-public-data`.covid19_italy.data_by_region
WHERE DATE(DATE) BETWEEN DATE(2020,07,05) AND DATE_ADD(DATE(2020,07,05), INTERVAL 3 DAY);


# Funções SUB
SELECT
  CURRENT_DATE AS exemplo_01,
  DATE_SUB(CURRENT_DATE, INTERVAL 2 DAY) AS exemplo_02, -- Exemplo somando 2 dias à data atual
  DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH) AS exemplo_03, -- Exemplo somando 1 mês à data atual
  DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) AS exemplo_04, -- Exemplo somando 1 ano à data atual
  CURRENT_TIMESTAMP AS exemplo_05,
  TIMESTAMP_SUB(CURRENT_TIMESTAMP, INTERVAL 3 HOUR) AS exemplo_06, -- Exemplo somando 3 horas à data e hora atual UTC
  DATETIME_SUB(CURRENT_DATETIME, INTERVAL 3 HOUR) AS exemplo_07, -- Exemplo somando 3 horas à data e hora atual UTC
  DATE_SUB(DATE(2021, 05, 12), INTERVAL 2 DAY) AS exemplo_08,  -- Exemplo somando 2 dias à data definida na função
  DATE_SUB(DATE '2021-05-12', INTERVAL 2 DAY) AS exemplo_09;  -- Exemplo somando 2 dias à data definida na função

SELECT
  *
FROM e_commerce.orders
WHERE DATE(created_at) BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 365 DAY) AND CURRENT_DATE; -- Visualiza os pedidos dos últimos 365 dias

# Funções DIFF
SELECT
  DATE_DIFF('2021-05-15', '2021-05-12', DAY) AS exemplo_01, -- Diferença em dias entre 2 datas
  DATETIME_DIFF('2021-05-15T17:00:00', '2021-05-15T16:00:00', HOUR) AS exemplo_02, -- Diferença em horas entre 2 datas/horas
  TIMESTAMP_DIFF('2021-05-15T17:30:00', '2021-05-15T17:00:00', MINUTE) AS exemplo_03; -- Diferença em minutos entre 2 datas/horas

# Intervalo de dias entre o cadastro do cliente e a primeira compra
SELECT
  c.id,
  MIN(TIMESTAMP_DIFF(o.created_at, c.created_at, DAY)) AS dias_ate_primeira_compra # Verifica d diferenca entre a primeira compra e a data do cadastro
FROM e_commerce.customers AS c
JOIN e_commerce.orders AS o
ON c.id = o.customer_id
GROUP BY c.id;
  
SELECT
  CURRENT_DATE() AS exemplo_01,
  FORMAT_DATE("%b %d", CURRENT_DATE) AS exemplo_02,
  FORMAT_DATE("%b %d", CURRENT_DATE()) AS exemplo_03, -- Opcao alternativa
  FORMAT_DATE("%Y %m", CURRENT_DATE) AS exemplo_04,
  FORMAT_DATE("%Y %m, %A", CURRENT_DATE) AS exemplo_05,
  FORMAT_DATE("%D", CURRENT_DATE) AS exemplo_06, -- Formato de data no padrao americano
  CURRENT_DATETIME() AS exemplo_07, -- UTC time zone
  FORMAT_DATETIME("%T", CURRENT_DATETIME()) AS exemplo_08; -- UTC time zone
  
  

