SELECT a.code, a.name, a.nickname, b.qtde
FROM tbluser AS a
JOIN (
		SELECT name, nickname, COUNT(*) AS qtde
		FROM tbluser
		GROUP BY name, nickname
		HAVING COUNT(*) > 1) AS b
ON a.nickname = b.nickname
AND a.name = b.name
ORDER BY name, nickname;