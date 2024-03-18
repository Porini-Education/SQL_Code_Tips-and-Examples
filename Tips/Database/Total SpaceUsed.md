# Total space used by a different type of object in the databases

Using `sys.dm_db_file_space_usage`

```SQL

SELECT
    SUM (user_object_reserved_page_count)*8 as user_obj_kb,
    SUM (internal_object_reserved_page_count)*8 as internal_obj_kb,
    SUM (version_store_reserved_page_count)*8  as version_store_kb,
    SUM (unallocated_extent_page_count)*8 as freespace_kb,
    SUM (mixed_extent_page_count)*8 as mixedextent_kb
FROM sys.dm_db_file_space_usage
```

This SQL query is used to retrieve information about the space usage in the database files of the current database in SQL Server. It's using the `sys.dm_db_file_space_usage` dynamic management view, which returns space usage information for each file in the database.

The query is calculating the total space used by different types of objects in the database, in kilobytes. It does this by summing up the page counts and multiplying by 8 (since each page in SQL Server is 8KB).

Here's a breakdown of what each line is doing:

- `SUM (user_object_reserved_page_count)*8 as user_obj_kb`: This line is calculating the total space used by user objects in the database. User objects are tables and indexes created by users.

- `SUM (internal_object_reserved_page_count)*8 as internal_obj_kb`: This line is calculating the total space used by internal objects in the database. Internal objects are created by SQL Server to manage data.

- `SUM (version_store_reserved_page_count)*8  as version_store_kb`: This line is calculating the total space used by the version store. The version store is a part of tempdb that holds the previous versions of rows for features like online index operations, after triggers, etc.

- `SUM (unallocated_extent_page_count)*8 as freespace_kb`: This line is calculating the total free space in the database.

- `SUM (mixed_extent_page_count)*8 as mixedextent_kb`: This line is calculating the total space used by mixed extents. An extent is a group of eight physically contiguous pages. Mixed extents are shared by up to eight objects, so this line is calculating the space used by these shared extents.

The result of this query will be a single row with five columns, each containing the total space used by a different type of object in the database, in kilobytes.