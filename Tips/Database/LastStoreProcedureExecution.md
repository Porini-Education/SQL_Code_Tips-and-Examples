# Last store procedures's execution time

```SQL
-- last store procedures's execution time
SELECT 
    DB_NAME(database_id) AS DatabaseName,
    OBJECT_NAME(object_id, database_id) AS ProcedureName,
    last_execution_time as LastExecutionDateTime,
    execution_count as NumberOfExecutions
FROM 
    sys.dm_exec_procedure_stats
WHERE 
    database_id = DB_ID('YourDatabaseName')  -- <== Insert Database Name to Analyze
ORDER BY last_execution_time desc
;
GO
```
