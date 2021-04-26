/* COALESCE
   Return the first non-null value in a list of arguments
*/

SELECT
  id,
  first_name,
  email,
  state,
  COALESCE(state, 'Ops, estado nulo') AS state_modificado
FROM e_commerce.customers;


SELECT
  id,
  first_name,
  email,
  state,
  number,
  additionals,
  COALESCE(CAST(number AS STRING), additionals) AS primero_nulo,
  COALESCE(CAST(number AS STRING), additionals, 'Sem informação') AS primero_nulo_2
FROM e_commerce.customers;