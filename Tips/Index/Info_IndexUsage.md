# Info about indexes usage

Execute on database of interest

```SQL
select
	DB_NAME() as DBName,
	OBJECT_NAME(a.[object_id]) as TableName,
	a.[name] as IndexName,
	a.index_id,
	a.[type],
	a.type_desc,
	b.user_seeks,
	b.user_scans,
	b.user_lookups,
	b.last_user_seek,
	b.last_user_scan,
	b.last_user_lookup,
	b.user_updates,
	b.last_user_update
from 
	sys.indexes a
	left outer join 
	sys.dm_db_index_usage_stats b
on a.[object_id] = b.[object_id] 
		and A.index_id = B.index_id  
where type <> 0 -- Escludo gli Heap
and not b.database_id is null
```
