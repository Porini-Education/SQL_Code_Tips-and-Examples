# Info Table's Index

Returns the information about all Tables Indexes

```SQL
-- If indicated, it returns only information on the chosen scheme
declare @schemaName nvarchar(30) = '' 
;

with ctea
as
(
SELECT
	a.database_id,
	db_name (a.database_id) as DBName,
	a.OBJECT_ID, 
    OBJECT_NAME(A.[object_id]) as 'TableName', 
    B.[name] as 'IndexName', 
    A.[index_id], 
    A.[page_count], 
    A.[index_type_desc], 
	A.alloc_unit_type_desc,
    convert(numeric(5,1),A.[avg_fragmentation_in_percent]) as avg_fragmentation_in_percent, 
    A.[fragment_count],
	B.fill_factor,
	Schema_name(c.schema_id) as [Schema]
FROM 
    sys.dm_db_index_physical_stats(db_id(),NULL,NULL,NULL,'LIMITED') A INNER JOIN 
    sys.indexes B
	ON A.[object_id] = B.[object_id] 
		and A.index_id = B.index_id  
	inner join sys.all_objects c
	on b.object_id=c.object_id and schema_name(schema_id) like '%' + @schemaName + '%'
where 1=1
	--a.object_id in (select object_id from sys.all_objects where schema_id=(select SCHEMA_ID(@schemaName)))
	--a.object_id in (select object_id from sys.all_objects where schema_name(schema_id) like '%' + @schemaName + '%')
),
cteB as
(
select
OBJECT_NAME([object_id]) as TableName,
 * 
from sys.dm_db_index_usage_stats 
)

select
	a.database_id,
	a.DBName,
	a.[Schema],
	a.TableName, 
    a.IndexName, 
    A.[index_id], 
    A.[page_count], 
    A.[index_type_desc],
	A.alloc_unit_type_desc,
    convert (int,A.[avg_fragmentation_in_percent]) as [avg_fragmentation_in_percent], 
    --A.[fragment_count],
	A.fill_factor,
	user_seeks,
	user_scans,
	user_lookups,
	user_updates,
	last_user_scan,
	last_user_lookup,
	last_user_seek,
	last_user_update,
	case
		when
			not(last_user_scan is null
			and last_user_lookup is null
			and last_user_seek is null
			--and last_user_update is null
			) then 1
		else 0
	end as Utilizzato
	

from cteA a
left outer join cteB b
	on a.database_id = b.database_id
	and a.object_id = b.object_id
	and a.index_id = b.index_id

where 
	index_type_desc <> 'HEAP' 
    and objectproperty(a.object_id, 'IsIndexable') = 1

order by --TableName, IndexName, 
	avg_fragmentation_in_percent desc
```
