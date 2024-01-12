# List Query Plan

This query will return the use counts, SQL text, and query plan for each compiled plan in the cache. 
The *usecounts* column indicates how many times the plan has been reused since it was added to the cache. The *sql_text* column contains the text of the SQL query.
The *query_plan* column contains the XML representation of the query plan.

```sql
SELECT 
    cp.usecounts,
    st.text AS sql_text,
    qp.query_plan
FROM 
    sys.dm_exec_cached_plans AS cp
CROSS APPLY 
    sys.dm_exec_sql_text(cp.plan_handle) AS st
CROSS APPLY 
    sys.dm_exec_query_plan(cp.plan_handle) AS qp
WHERE 
    cp.cacheobjtype = 'Compiled Plan';
```

Other info <https://www.brentozar.com/blitzcache/multiple-plans/>

## Same query with different execution plans

```sql
SELECT q.PlanCount,
q.DistinctPlanCount,
st.text AS QueryText,
qp.query_plan AS QueryPlan
FROM ( SELECT query_hash,
COUNT(DISTINCT(query_hash)) AS DistinctPlanCount,
COUNT(query_hash) AS PlanCount

FROM sys.dm_exec_query_stats
GROUP BY query_hash
) AS q
JOIN sys.dm_exec_query_stats qs ON q.query_hash = qs.query_hash
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) AS qp
WHERE PlanCount > 1
ORDER BY q.PlanCount DESC
```


In SQL Server, the data in the query cache (also known as the plan cache) can be erased or de-allocated for several reasons:

1. **SQL Server Restart**: The entire cache is cleared when SQL Server is restarted.

2. **Memory Pressure**: If the system is under memory pressure, SQL Server might decide to remove some plans from the cache to free up memory.

3. **Database Changes**: Certain changes to a database can cause all plans for that database to be removed from the cache. This includes operations like ALTER DATABASE, DROP DATABASE, RESTORE DATABASE, etc.

4. **Schema Changes**: Changes to the schema of a table, such as adding or dropping columns, can cause all plans involving that table to be removed from the cache.

5. **Index Changes**: Changes to an index, such as creating, dropping, or rebuilding an index, can cause all plans involving that index to be removed from the cache.

6. **Manual Clearing**: You can manually clear the cache using the DBCC FREEPROCCACHE command. Be careful with this command in a production environment, as it can cause a sudden CPU spike as SQL Server has to recompile plans that were removed from the cache.