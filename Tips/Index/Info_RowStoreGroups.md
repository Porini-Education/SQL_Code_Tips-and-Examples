# Returns the information about all Columnstore Index's Row groups

Other scripts here: <https://github.com/NikoNeugebauer/CISL>

```SQL
SELECT 
    quotename(object_schema_name(rg.object_id)) + '.' + quotename(object_name(rg.object_id)) as TableName,
    i.name AS IndexName,     
    i.type_desc,   
	case i.data_space_id when 0 then 'In-Memory' else 'Disk-Based' end as Location,
    rg.*,  
    100*(ISNULL(deleted_rows,0))/total_rows AS 'Fragmentation' ,
	cast(isnull(rg.size_in_bytes,0) / 1024. / 1024  as Decimal(8,3)) as size_in_MB
FROM sys.indexes AS i  
JOIN sys.dm_db_column_store_row_group_physical_stats AS rg  
    ON i.object_id = rg.object_id 
	AND i.index_id = rg.index_id   
-- WHERE object_name(i.object_id) = 'table_name'   
ORDER BY object_name(i.object_id), i.name, row_group_id
;  
```
