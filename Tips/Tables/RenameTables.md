# Script to rename a list of tables

## Example 1

``` SQL
use master
GO

drop database if exists testRename;
GO

create database testRename;
GO

use testRename
GO

-- create test tables
create table dbo.T1 (id int);
GO
create table dbo.T2 (id int);
GO
create table dbo.T3 (id int);
GO

-- rename som table in *_TOBEDELETE
DECLARE @OldTableName NVARCHAR(128), @NewTableName NVARCHAR(128)

DECLARE rename_tables_cursor CURSOR FOR 
SELECT OldTableName
FROM (VALUES 
    ('dbo.T1'),
    ('dbo.T2')

) AS T(OldTableName )

OPEN rename_tables_cursor

FETCH NEXT FROM rename_tables_cursor INTO @OldTableName

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @NewTableName =  @OldTableName + '_TOREMOVE';
    EXEC sp_rename @OldTableName, @NewTableName

    FETCH NEXT FROM rename_tables_cursor INTO @OldTableName
END

CLOSE rename_tables_cursor
DEALLOCATE rename_tables_cursor

```

## Example 2

``` SQL

DECLARE @OldTableName NVARCHAR(128), @NewTableName NVARCHAR(128)

DECLARE rename_tables_cursor CURSOR FOR 
SELECT OldTableName, NewTableName
FROM (VALUES 
    ('OldTable1', 'NewTable1'),
    ('OldTable2', 'NewTable2'),
    -- Add more tables to rename here
) AS T(OldTableName, NewTableName)

OPEN rename_tables_cursor

FETCH NEXT FROM rename_tables_cursor INTO @OldTableName, @NewTableName

WHILE @@FETCH_STATUS = 0
BEGIN
    EXEC sp_rename @OldTableName, @NewTableName

    FETCH NEXT FROM rename_tables_cursor INTO @OldTableName, @NewTableName
END

CLOSE rename_tables_cursor
DEALLOCATE rename_tables_cursor
```
