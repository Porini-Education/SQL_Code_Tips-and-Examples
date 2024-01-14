# List of Database's Objects

The following script can be executed both on Premise and on Azure SQL Databases

```SQL
SELECT 
	DateSample = getdate()
	,InstanceName = COALESCE(SERVERPROPERTY('InstanceName'), 'Default Instance')
	,DatbaseID = db_id()
	,DatabaseName = db_name()
	,schema_name = s.[name]
	,object_name = o.[name]
	,object_type = o.[type]
	,object_type_desc = o.[type_desc]
	,alloc_unit_type_desc = au.type_desc
	,p.index_id
	,[index_name] = i.[name]
	,[index_type] = i.[type]
	,[index_type_desc] = i.[type_desc]
	--,ips.avg_fragmentation_in_percent
	,p.partition_number
	,p.[rows]
	--,au.type
	,au.total_pages
	,au.used_pages
	,au.data_pages						
	--,space_used_in_kb = (au.used_pages * 8.0)
    ,au.used_pages * 8.0 / 1024.0 as SpaceUsed_MB     
	,p.data_compression					
	,p.data_compression_desc
	,data_space_name = ds.name
	,data_space_type = ds.type
	,data_space_type_desc = ds.type_desc
	,[filegroup_name] = f.name
	,f.is_read_only
	,lob_data_space = lobds.name
FROM 
	sys.partitions p INNER JOIN sys.indexes i 
	ON p.[object_id] = i.[object_id] 
	   and p.index_id = i.index_id
	INNER JOIN sys.objects o			
		ON i.[object_id] = o.[object_id]
	INNER JOIN sys.schemas s			
		ON o.[schema_id] = s.[schema_id]
	INNER JOIN sys.data_spaces ds		
		ON i.data_space_id = ds.data_space_id
	LEFT JOIN sys.partition_schemes ps	
		ON i.data_space_id = ps.data_space_id	
	LEFT JOIN sys.destination_data_spaces dds 
		ON dds.partition_scheme_id = ps.data_space_id 
		   and p.partition_number = dds.destination_id
	INNER JOIN sys.filegroups f			
		ON f.data_space_id = CASE 
			WHEN ds.[type] <> 'PS' THEN ds.data_space_id 
			ELSE dds.data_space_id 
		END
	LEFT JOIN sys.tables t				ON o.[object_id] = t.[object_id]
	LEFT JOIN sys.data_spaces lobds 	ON t.lob_data_space_id = lobds.data_space_id
	INNER JOIN sys.allocation_units au 	ON p.partition_id = au.container_id

--	LEFT OUTER JOIN sys.dm_db_index_physical_stats(db_id(),NULL,NULL,NULL,'LIMITED') ips
	--ON i.object_id =ips.object_id
	--	 AND i.index_id = ips.index_id

--WHERE o.[type] IN ('U', 'V') -- ==> TO GET ONLY User Tabkles and Views

ORDER BY
   o.[name];
GO
```
