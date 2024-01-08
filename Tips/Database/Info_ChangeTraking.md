# Returns a row with the name of the database and the name of the table for all DBs and Tables with Change Tracking Enabled

``` SQL
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
GO

USE MASTER
GO

-- Create a table to store the results
DROP TABLE IF EXISTS ChangeTrackingTables;
GO

CREATE TABLE master.dbo.ChangeTrackingTables
(
    DatabaseName NVARCHAR(128),
    SchemaName NVARCHAR(128),
    TableName NVARCHAR(128)
)

DECLARE @dbName NVARCHAR(128)
DECLARE @query NVARCHAR(MAX)

DECLARE db_cursor CURSOR FOR
SELECT name 
FROM master.sys.databases 
WHERE state = 0 -- Only query for online databases
AND is_read_only = 0 -- Exclude read-only databases
AND name NOT IN ('master', 'tempdb', 'model', 'msdb') -- Exclude system databases

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @dbName  

WHILE @@FETCH_STATUS = 0  
BEGIN  
    SET @query = 'USE [' + @dbName + '];
                  INSERT INTO master.dbo.ChangeTrackingTables
                  SELECT 
                      ''' + @dbName + ''' AS DatabaseName,
                      s.name AS SchemaName,
                      t.name AS TableName
                  FROM 
                      sys.change_tracking_tables ctt
                  JOIN 
                      sys.tables t ON ctt.object_id = t.object_id
                  JOIN 
                      sys.schemas s ON t.schema_id = s.schema_id;'

    EXEC sp_executesql @query

    FETCH NEXT FROM db_cursor INTO @dbName  
END 

CLOSE db_cursor  
DEALLOCATE db_cursor

-- Select all from the table to view the results
SELECT * FROM master.dbo.ChangeTrackingTables

```
