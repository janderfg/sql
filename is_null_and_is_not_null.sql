/* IS NULL
  A field with a NULL value is a field with no value.
  If a field in a table is optional, it is possible to insert a new record
  or update a record without adding a value to this field. Then, the field will be saved with a NULL value.
  Note: A NULL value is different from a zero value or a field that contains spaces. A field with a NULL value is one that has been left blank during record creation!
*/

# Selecionando os clientes sem e-mail cadastrado
SELECT
  *
FROM e_commerce.customers
WHERE email IS NULL;

# Selecionando somente os clientes com e-mail cadastrado
SELECT
  *
FROM e_commerce.customers
WHERE email IS NOT NULL;