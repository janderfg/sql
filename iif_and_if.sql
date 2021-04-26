/* The IF() function returns a value if a condition is TRUE,
   or another value if a condition is FALSE.
   Syntax:
   IF(condition, value_if_true, value_if_false)
   Microsoft SQL Server
*/

SELECT
	code,
	name,
	nickname,
	IIF(nickname = 'admin', 'É um administrador', 'Não') as Observacao
FROM tbluser;


/* IF aninhado (não recomendado)
   Nestas situações é melhor utilizar CASE WHEN
*/
SELECT
	code,
	name,
	nickname,
	IIF(nickname = 'admin', 'É um administrador',
		IIF(name = 'suporteppi', 'É de suporte', 'Não')) as Observacao
FROM tbluser;


# Exemplo de IF no Google BigQuery
SELECT
  id,
  name,
  IF(name = 'Moda e Acessórios', 'Sim, é moda',
    IF(name = 'Livros', 'Sim, é Livros', 'Não encontrado')) AS situacao
FROM e_commerce.categories;

# Múltiplos IFs no Google BigQuery
SELECT
  id,
  name,
  IF(id BETWEEN 0 and 5, 'Entre 0 e 5', 'Maior que 5') as sit_id,
  IF(name = 'Moda e Acessórios', 'Sim, é moda',
    IF(name = 'Livros', 'Sim, é Livros', 'Não encontrado')) AS situacao
FROM e_commerce.categories;
  