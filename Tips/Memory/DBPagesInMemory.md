# Number of data pages in memory for each database

This SQL code is used to determine the amount of memory (in megabytes) currently being used by each database in SQL Server for caching data and index pages.

```SQL
select count(*)*8/1024 AS 'Cached Size (MB)'        
,case database_id                
when 32767 then 'ResourceDB'                
else db_name(database_id)                
end as 'Database'
from sys.dm_os_buffer_descriptors
where page_type in
(
'INDEX_PAGE'
,'DATA_PAGE'
)
group by db_name(database_id), database_id
order by 'Cached Size (MB)' desc
;
GO
```

## Info about Buffer Pool Extension (PBE)

<https://msdn.microsoft.com/en-us/library/dn133176.aspx>

```SQL
SELECT path, file_id, state, state_description, current_size_in_kb  
FROM sys.dm_os_buffer_pool_extension_configuration;

-- number of pages in the Buffer Pool Extension
SELECT COUNT(*) AS cached_pages_count  
FROM sys.dm_os_buffer_descriptors  
WHERE is_in_bpool_extension <> 0
```
