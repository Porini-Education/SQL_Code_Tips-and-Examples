# Getting last activity on database's tables

``` SQL
SELECT 
    OBJECT_ID,
    DB_NAME(database_id) AS DatabaseName,
    OBJECT_NAME(object_id, database_id) AS TableName,
    last_user_update,
    last_user_seek,
    last_user_scan,
    last_user_lookup
FROM sys.dm_db_index_usage_stats
WHERE database_id = DB_ID('INSERT THE NAME OF THE DATABASE')
order by least(last_user_scan, last_user_seek,last_user_lookup,last_user_update) ;
```

## Getting the list of non used tables

``` SQL
with ctelastAcivity
as
(
SELECT 
    OBJECT_ID,
    DB_NAME(database_id) AS DatabaseName,
    OBJECT_NAME(object_id, database_id) AS TableName,
    last_user_update,
    last_user_seek,
    last_user_scan,
    last_user_lookup
FROM sys.dm_db_index_usage_stats
WHERE database_id = DB_ID('INSERT THE NAME OF THE DATABASE')
--order by least(last_user_scan, last_user_seek,last_user_lookup,last_user_update) 
)

select 
   a.object_id,
    b.name as SchemaName,
    a.name as TableName,
    c.* 
    from sys.tables a
    inner join sys.schemas b
    on a.schema_id = b.schema_id
    left outer join ctelastAcivity c
    on a.object_id = c.object_id
    where c.object_id is null
;
```
