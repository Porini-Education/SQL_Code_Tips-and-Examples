# List of Objects in Memory

```SQL
/*
This query retrieves information about the cached pages in the database. It counts the number of cached pages for each object and index, and provides additional details such as the object name, index name, index type, and object type.

The query joins the sys.dm_os_buffer_descriptors view with the sys.allocation_units, sys.partitions, sys.objects, and sys.indexes tables to gather the necessary information.

Parameters:
- None

Returns:
- cached_pages_count: The number of cached pages for each object and index.
- ObjectName: The name of the object.
- IndexName: The name of the index.
- index_id: The ID of the index.
- IndexType: The type of the index.
- ObjectType: The type of the object.

Example usage:
SELECT * FROM Untitled-1;
*/

SELECT 
    COUNT(*) AS cached_pages_count,
    obj.name AS ObjectName,
    idx.name AS IndexName,
    obj.index_id,
    idx.type_desc AS IndexType,
    o.type_desc AS ObjectType
FROM
    sys.dm_os_buffer_descriptors AS bd   
    INNER JOIN   
    (  
        SELECT object_name(object_id) AS name   
            ,p.index_id ,allocation_unit_id, object_id
        FROM sys.allocation_units AS au  
            INNER JOIN sys.partitions AS p   
                ON au.container_id = p.hobt_id   
                    AND (au.type = 1 OR au.type = 3)  
        UNION ALL  
        SELECT object_name(object_id) AS name     
            ,p.index_id, allocation_unit_id, object_id
        FROM sys.allocation_units AS au  
            INNER JOIN sys.partitions AS p   
                ON au.container_id = p.partition_id   
                    AND au.type = 2  
    ) AS obj   
        ON bd.allocation_unit_id = obj.allocation_unit_id  
    INNER JOIN sys.objects AS o
        ON obj.object_id = o.object_id
    INNER JOIN sys.indexes AS idx
        ON obj.object_id = idx.object_id AND obj.index_id = idx.index_id
WHERE bd.database_id = DB_ID()  
GROUP BY obj.name, idx.name, obj.index_id, idx.type_desc, o.type_desc   
ORDER BY cached_pages_count DESC;
GO
```
