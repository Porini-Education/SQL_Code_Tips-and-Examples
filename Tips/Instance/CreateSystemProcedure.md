# Mark a Stored Procedure as System Procedure  
****WORKS ONLY ON A PREMISE SQL SERVER****

A System Procedure could be execute in any databases.

**Steps to execute:**

1. **Master Database**: The stored procedure should be created in the Master database

2. **Prefix Stored Procedure**: The stored procedure name should be prefixed with **sp_**

3. **Mark SP as System Object**: Call sp_ms_marksystemobject to mark custom SP as a system object

``` SQL
-- Creation, in the master DB, of the procedure to be marked as system
use master
GO

create procedure sp_IndexInformation
as

    SELECT 
        a.database_id,
        db_name (a.database_id) as DBName,
        a.OBJECT_ID, 
        OBJECT_NAME(A.[object_id]) as 'TableName', 
        B.[name] as 'IndexName', 
        A.[index_id], 
        A.[page_count], 
        A.[index_type_desc], 
        A.[avg_fragmentation_in_percent], 
        A.[fragment_count],
        i.fill_factor

    FROM 
        sys.dm_db_index_physical_stats(db_id(),NULL,NULL,NULL,'LIMITED') A INNER JOIN 
        sys.indexes B ON A.[object_id] = B.[object_id] and A.index_id = B.index_id  

        left outer join sys.indexes as i 
        on i.object_id = a.object_id 
        and i.index_id = a.index_id
    ;
GO

-- Marked the procedure as System Procedure
exec sp_ms_marksystemobject 'sp_IndexInformation' ;
GO

-- Test the procedure in master database
exec sp_IndexInformation;

-- Test the procedure in a user database
use test;
GO

exec dbo.sp_IndexInformation;
```
