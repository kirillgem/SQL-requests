/*SELECT WITH JOIN*/
SELECT TOP 10 oi.[field0], oi.[field1], oi.[field2] FROM [table0]('ID','u',100) 
AS ot INNER JOIN [table1] AS oi ON ot.[field2] = oi.[field4]
INNER JOIN [table2] as pir on pir.[1ID] = ot.[field2] 
INNER JOIN [table3] as vdu on vdu.feild8 = pir.[feild8] 
WHERE ot.[field5] = 'ID' AND (NULL is NULL or pir.[field6] = NULL) order by ot.[feild7] ASC

/*ALTER PROCEDURE */
USE [BD]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ProcedureName]
(
  @id VARCHAR(512)
)
AS
BEGIN
	IF EXISTS (SELECT * FROM [table1] WHERE [field0] = @id AND LEN(ISNULL([field2],'')) > 0)
	BEGIN
	     SELECT [field4] FROM [table2] WHERE [field1] = @id
	END
	ELSE
	BEGIN
		SELECT [field4] AS [field2] FROM [table2] WHERE [field3] = @id
	END
END


/* Modify XML data*/

begin transaction t1
declare @Marker XML
SET @Marker = 'XML'  
;WITH XMLNAMESPACES ( DEFAULT 'http://tempuri.org/policy.xsd')
UPDATE table1 SET field0.modify(
	'insert 		
		sql:variable("@Marker1")
	as first into
	(/Path1[1]/Path2[1]/Path3[1])
	') FROM table1 AS t1 
--JOIN table2 AS t2 on t1.field1 = t2.field1
JOIN table2 AS t ON t1.field1 = t.field1 
--WHERE t1.field$ IN ('','') 
--AND t2.field2 >= 'String'
--AND t2.field3 = 'String'
--AND t1.field0 IS NOT NULL
WHERE cast(t1.field0 as nvarchar(max))NOT LIKE ''

--commit transaction t1
rollback transaction t1

