/* IS TRUE and IS FALSE

*/

# Selecionando os crimes que acabaram em prisão
SELECT
  *
FROM `bigquery-public-data`.chicago_crime.crime
WHERE arrest IS TRUE;

# Selecionando os crimes que não acabaram em prisão
SELECT
  *
FROM `bigquery-public-data`.chicago_crime.crime
WHERE arrest IS FALSE;