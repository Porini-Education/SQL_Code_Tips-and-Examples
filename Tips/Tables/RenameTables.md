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

create schema s1;
GO

-- create test tables
create table dbo.T1 (id int);
GO
create table s1.T2 (id int);
GO
create table dbo.T3 (id int);
GO

-- rename some table in *_TOBEDELETE
DECLARE @OldTableSchema NVARCHAR(128);
DECLARE @OldTableName NVARCHAR(128);
DECLARE @FullOldTableName NVARCHAR(128);
DECLARE @NewTableName NVARCHAR(128);

DECLARE rename_tables_cursor CURSOR FOR 
SELECT OldTableSchema, OldTableName
FROM (VALUES 
    ('dbo','T1'),
    ('s1','T2')

) AS T(OldTableSchema,OldTableName )

OPEN rename_tables_cursor

FETCH NEXT FROM rename_tables_cursor INTO @OldTableSchema, @OldTableName

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @FullOldTableName = @OldTableSchema + '.' + @OldTableName;
    SET @NewTableName =  @OldTableName + '_TOREMOVE';
    EXEC sp_rename @FullOldTableName, @NewTableName

    FETCH NEXT FROM rename_tables_cursor INTO  @OldTableSchema, @OldTableName
END

CLOSE rename_tables_cursor
DEALLOCATE rename_tables_cursor

```
