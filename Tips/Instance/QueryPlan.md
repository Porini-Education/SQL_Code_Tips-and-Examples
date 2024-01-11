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

<https://www.brentozar.com/blitzcache/multiple-plans/>

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
