# Memory occupation by cache plans

<https://www.sqlskills.com/blogs/kimberly/plan-cache-and-optimizing-for-adhoc-workloads/>

<https://logicalread.com/sql-server-minimize-single-use-plans-tl01/#.Wa6HCOm6ypo>

``` SQL
SELECT 
    cacheobjtype as CacheType,
    objtype AS ObjectType,
    COUNT_BIG(*) AS [NumPlans],
    convert(numeric(18,3),SUM(CAST(size_in_bytes AS DECIMAL(18, 3))) / 1024 / 1024) AS [TotalSize_MB],
    AVG(usecounts) AS [AvgUseCount],
    convert(numeric(18,3),SUM(CAST((CASE WHEN usecounts = 1 THEN size_in_bytes
        ELSE 0
        END) AS DECIMAL(18, 2))) / 1024 / 1024) AS [TotalSize_Use1Time_MB],
    SUM(CASE WHEN usecounts = 1 THEN 1
        ELSE 0
        END) AS [NumPlans_Used1Time]
FROM sys.dm_exec_cached_plans
GROUP BY cacheobjtype,objtype
ORDER BY 1,2
;
GO

```

## Copilot explanation

This SQL script is querying the `sys.dm_exec_cached_plans` dynamic management view in SQL Server to provide a summary of the SQL Server's plan cache. The plan cache is where SQL Server keeps execution plans that it might need to use again. Here's a breakdown of what each part of the script does:

1. `cacheobjtype as CacheType`: This column represents the type of object stored in the cache. It could be a compiled plan, a parse tree, or an extended stored procedure.

2. `objtype AS ObjectType`: This column represents the type of the cached plan. It could be a prepared statement, an ad hoc query, a replicated procedure, a trigger, or a check constraint.

3. `COUNT_BIG(*) AS [NumPlans]`: This counts the total number of cached plans for each combination of cache type and object type.

4. `convert(numeric(18,3),SUM(CAST(size_in_bytes AS DECIMAL(18, 3))) / 1024 / 1024) AS [TotalSize_MB]`: This calculates the total size in megabytes of the cached plans for each combination of cache type and object type.

5. `AVG(usecounts) AS [AvgUseCount]`: This calculates the average use count of the cached plans for each combination of cache type and object type. The use count indicates how many times a plan has been reused.

6. `convert(numeric(18,3),SUM(CAST((CASE WHEN usecounts = 1 THEN size_in_bytes ELSE 0 END) AS DECIMAL(18, 2))) / 1024 / 1024) AS [TotalSize_Use1Time_MB]`: This calculates the total size in megabytes of the cached plans that have been used only once for each combination of cache type and object type.

7. `SUM(CASE WHEN usecounts = 1 THEN 1 ELSE 0 END) AS [NumPlans_Used1Time]`: This counts the total number of cached plans that have been used only once for each combination of cache type and object type.

The `GROUP BY cacheobjtype,objtype` clause groups the results by cache type and object type, and the `ORDER BY 1,2` clause orders the results by the first and second columns (cache type and object type). The `GO` command signals the end of a batch of SQL statements.
