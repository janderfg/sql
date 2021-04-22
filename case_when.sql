/* The SQL CASE Statement is like an if-then-else statement.
So, once a condition is true, it will stop reading and return the result.
If no conditions are true, it returns the value in the ELSE clause.
If there is no ELSE part and no conditions are true, it returns NULL. */

SELECT *,
CASE
	WHEN idleitor = 'B1' THEN 'Leitor B1'
	WHEN idleitor = 'B2' THEN 'Leitor B2'
	WHEN idleitor = 'B3' THEN 'Leitor B3'
	ELSE 'Leitor não identificado'
END AS Obs_Leitor
FROM CTBLInputsRecebidos;


SELECT *,
CASE idleitor
	 WHEN 'B1' THEN 'Leitor B1'
	 WHEN 'B2' THEN 'Leitor B2'
	 WHEN 'B3' THEN 'Leitor B3'
	 ELSE 'Leitor não identificado'
END AS Obs_Leitor
FROM CTBLInputsRecebidos;


-- If there is no ELSE part and no conditions are true, it returns NULL.
SELECT *,
CASE idleitor
	 WHEN 'B1' THEN 'Leitor B1'
	 WHEN 'B2' THEN 'Leitor B2'
	 WHEN 'B3' THEN 'Leitor B3'
END AS Obs_Leitor
FROM CTBLInputsRecebidos;
