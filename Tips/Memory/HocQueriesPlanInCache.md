# Hoc Queries Execution Plans in Cache

``` SQL
SELECT 
    getdate () as DateSample,
    db_name(st.dbid) as DataBaseName,
    qp.query_plan, 
    cp.usecounts, 
    cp.cacheobjtype, 
    cp.size_in_bytes, 
    cp.usecounts, 
    st.text

  FROM 
    sys.dm_exec_cached_plans AS cp

  CROSS APPLY 
    sys.dm_exec_sql_text(plan_handle)AS st

  CROSS APPLY 
    sys.dm_exec_query_plan( plan_handle)AS qp

  WHERE objtype = 'Adhoc'
    and cp.cacheobjtype = 'Compiled Plan'
```

## Copilot's Explanation of the script

This SQL script is used to retrieve information about ad hoc queries that have been cached by SQL Server.

`qp.query_plan`: XML representation of the query plan.

`cp.usecounts`: Number of times the plan has been reused since it was created.

`cp.cacheobjtype`: Type of the cached object. In this case, it will always be 'Compiled Plan' due to the WHERE clause.

`cp.size_in_bytes`: Size of the plan in bytes.

`st.text`: Text of the SQL batch that is associated with the plan.
