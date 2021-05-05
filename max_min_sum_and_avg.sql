/* MAX, MIN, SUM and AVG

*/

# Maior preço de produto
SELECT
  MAX(price) as preco_maximo
FROM e_commerce.products;

# Menor preço de produto
SELECT
  MIN(price) as preco_minimo
FROM e_commerce.products;

# Preço Mínimo e Preço Máximo por Categoria
SELECT
  MIN(p.price) AS preco_minimo,
  MAX(p.price) AS preco_maximo,
  c.name
FROM e_commerce.products AS p
JOIN e_commerce.categories AS C
ON c.id = p.category_id
GROUP BY c.name;

# Primeira e Última compra por id do cliente
SELECT
  MIN(created_at) AS primeira_compra,
  MAX(created_at) AS ultima_compra,
  customer_id
FROM e_commerce.orders
GROUP BY customer_id
ORDER BY customer_id;

# Faturamento diário
SELECT
  SUM(total_price) AS venda_total,
  DATE(created_at) AS dia
FROM e_commerce.items AS i
JOIN e_commerce.orders AS o
ON o.id = i.order_id
GROUP BY dia
ORDER BY dia;

# Média de casos confirmados por Região
SELECT
  ROUND(AVG(total_confirmed_cases), 2) AS casos_confirmados,
  region_name
FROM `bigquery-public-data`.covid19_italy.data_by_region
GROUP BY region_name
ORDER BY casos_confirmados DESC;



