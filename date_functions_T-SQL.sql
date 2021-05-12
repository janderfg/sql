/* Funções com Data e Hora
https://www.mssqltips.com/sqlservertip/5993/sql-server-date-and-time-functions-with-examples/
*/


-- T-SQL (SQL Server)
SELECT DATEFROMPARTS(2021, 10, 5) AS data, -- Returns a date from the date specified
       CURRENT_TIMESTAMP AS data_e_hora, -- Returns the date and time of the machine the SQL Server is running on
	   GETUTCDATE() AS data_e_hora_UTC, -- Returns the date and time of the machine the SQL Server is running on as UTC
	   CAST(GETUTCDATE() AS DATE) AS data_extraction,  -- Extracts only the date from a date and time function
	   DATETIMEFROMPARTS(2021, 10, 5, 8, 10, 0, 0) AS data_e_hora_especificado; -- Returns a datetime from part specified

SELECT DATEADD(DAY, 5, GETDATE()) AS DatePlus1, -- Exemplo somando 2 dias a data atual
       DATEADD(MONTH, 1, GETDATE()) AS DatePlus1, -- Exemplo somando 1 mês a data atual
	   DATEADD(YEAR, 1, GETDATE()) AS DatePlus1; -- Exemplo somando 1 ano a data atual

SELECT DATEADD(DAY, -5, GETDATE()) AS DatePlus1, -- Exemplo subtraindo 2 dias a data atual
       DATEADD(MONTH, -1, GETDATE()) AS DatePlus1, -- Exemplo subtraindo 1 mês a data atual
	   DATEADD(YEAR, -1, GETDATE()) AS DatePlus1; -- Exemplo subtraindo 1 ano a data atual

SELECT DATENAME(YEAR, GETDATE()) AS ano, -- Extraindo o ano de uma data
       DATENAME(DAY, GETDATE()) AS dia, -- Extraindo o dia de uma data
	   DATENAME(MONTH, GETDATE()) AS mes; -- Extraindo o mes de uma data

/* year, yyyy, yy = Year
   quarter, qq, q = Quarter
   month, mm, m = month
   dayofyear = Day of the year
   day, dy, y = Day
   week, ww, wk = Week
   weekday, dw, w = Weekday
   hour, hh = hour
   minute, mi, n = Minute
   second, ss, s = Second
   millisecond, ms = Millisecond
*/

SELECT DATEDIFF(YEAR, '2019-01-11', GETDATE()) AS exemplo_01, -- Diferenca em anos entre a data informada e data atual
       DATEDIFF(MONTH, '2019-01-11', GETDATE()) AS exemplo_02, -- Diferenca em meses entre a data informada e data atual
	   DATEDIFF(DAY, '2020-05-12', GETDATE()) AS exemplo_03; -- Diferenca em dias entre a data informada e data atual
	   


	 