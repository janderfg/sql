/* IN operator
   This operator allows you to specify multiple values in a WHERE clause.
   The IN operator is a shorthand for multiple OR conditions.
*/ 
   
# Exemplo 1   
# Selecionando todos os clientes dos estados Alagoas e Piauí
SELECT
  *
FROM e_commerce.customers
WHERE state in ('Alagoas', 'Piauí');

# Exemplo 2
# Selecionando todos os produtos onde o preço seja 75, 10 ou 15
SELECT
  *
FROM e_commerce.products
WHERE price IN (75, 10, 15);