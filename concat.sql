/* CONCAT - Add two or more strings together
   Syntax: CONCAT(string1, string2, ...., string_n)
*/

# Concatenando nome e sobrenome da tabela de clientes
SELECT
  CONCAT(first_name, ' ', last_name) AS nome_completo
FROM e_commerce.customers;

# Criando uma obervação da quantidade de item e preço total da compra
SELECT
  id,
  CONCAT('Quantidade de itens: ', quantity, ' - ', 'Preço total: ', total_price) AS observacao
FROM e_commerce.items;