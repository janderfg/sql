/* COUNT
  The COUNT() function returns the number of rows that matches a specified criterion.
*/

SELECT
  COUNT(*) AS numero_linhas
FROM e_commerce.customers;

SELECT
  COUNT(DISTINCT status) as status_distintos,
FROM e_commerce.orders;

# Qtde de pedidos por mês
SELECT
  COUNT(id) AS numero_pedidos,
  FORMAT_TIMESTAMP("%Y-%m", created_at) AS mes
FROM e_commerce.orders
GROUP BY mes
ORDER BY mes;

# Qtde de clientes cadastrados por ano
SELECT
  COUNT(id) AS numero_cadastrados,
  FORMAT_TIMESTAMP("%Y", created_at) AS ano
FROM e_commerce.customers
GROUP BY ano
ORDER BY ano;

# Qtde de clientes cadastrados no Acre
SELECT
  COUNT(CASE WHEN state = 'Acre' THEN id END) AS numero_cadastrados_acre,
  FORMAT_TIMESTAMP("%Y", created_at) AS ano
FROM e_commerce.customers
GROUP BY ano
ORDER BY ano;



