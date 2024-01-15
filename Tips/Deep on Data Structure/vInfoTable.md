# Info about Table's Size and number of Data Pages

```SQL
create view vInfoTableSize
as

SELECT 
	db_name() as DatabaseName,
	[schema_name] = s.[name],
	[object_name] = o.[name],
	--[object_type] = o.[type],
	[object_type_desc] = o.[type_desc],
	alloc_unit_type_desc = au.type_desc,

	--p.index_id,
	[index_name] = i.[name],
	[index_type] = i.[type],
	[index_type_desc] = i.[type_desc],
	--ips.avg_fragmentation_in_percent,
	--p.partition_number,
	p.[rows],
	 --au.type,
	au.total_pages,
	au.used_pages,
	au.data_pages,
	--space_used_in_kb = (au.used_pages * 8.0),
    au.used_pages * 8.0 / 1024.0 as SpaceUsed_MB,      
	--p.data_compression,
	--p.data_compression_desc,
	--data_space_name = ds.name,
	--data_space_type = ds.type,
	--data_space_type_desc = ds.type_desc,
	[filegroup_name] = f.name
	--f.is_read_only,
	--lob_data_space = lobds.name
FROM 
	sys.partitions p
INNER JOIN
	sys.indexes i on p.[object_id] = i.[object_id] and p.index_id = i.index_id
INNER JOIN
	sys.objects o ON i.[object_id] = o.[object_id]
INNER JOIN
	sys.schemas s ON o.[schema_id] = s.[schema_id]
INNER JOIN
	sys.data_spaces ds on i.data_space_id = ds.data_space_id
LEFT JOIN
	sys.partition_schemes ps on i.data_space_id = ps.data_space_id	
LEFT JOIN
	sys.destination_data_spaces dds on dds.partition_scheme_id = ps.data_space_id and p.partition_number = dds.destination_id
INNER JOIN
	sys.filegroups f on f.data_space_id = CASE WHEN ds.[type] <> 'PS' THEN ds.data_space_id ELSE dds.data_space_id END
LEFT JOIN
	sys.tables t on o.[object_id] = t.[object_id]
LEFT JOIN
	sys.data_spaces lobds on t.lob_data_space_id = lobds.data_space_id
INNER JOIN
    sys.allocation_units au on  p.partition_id = au.container_id 

--LEFT OUTER JOIN 
--  sys.dm_db_index_physical_stats(db_id(),NULL,NULL,NULL,'LIMITED') ips
--  ON i.object_id =ips.object_id
--  AND i.index_id = ips.index_id 

where
    o.[type] IN ('U', 'V') 

;
GO
```

Example

``` SQL
select * from util.vInfoTable where object_name ='Test01'; -- 1 Data Page, 7 rows
```

![Alt text](/assets/DataStructure01.png)
