/* UNION command combines/concatenates the result of two or more queries.
   UNION ALL command is equal to UNION command,
   except that UNION ALL selects all the values.
   The difference between UNION and UNION ALL is that
   UNION ALL will not eliminate duplicate rows,
   instead it just pulls all the rows from all the tables
   fitting your query specifics and combines them into a table.
   So, a UNION statement in fact does a SELECT DISTINCT on the results set.
   If you know that all the records returned are unique from your union,
   use UNION ALL instead, it gives faster results. */

SELECT *
FROM tblproduct
WHERE code = '1015052'
UNION ALL
SELECT *
FROM tblproduct
WHERE code = '2031431';