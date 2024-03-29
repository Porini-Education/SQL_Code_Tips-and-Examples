SELECT name, physical_name AS CurrentLocation, state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'tempdb');


ALTER DATABASE tempdb
MODIFY FILE (NAME = 'tempdev', FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_01.mdf')

ALTER DATABASE tempdb
MODIFY FILE (NAME = 'templog', FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\templog.ldf')

-- Stop e restart servizio

ALTER DATABASE tempdb
MODIFY FILE (NAME = 'tempdev', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB)

ALTER DATABASE tempdb
ADD FILE (NAME = 'tempdev02', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB, FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_02.mdf')

ALTER DATABASE tempdb
ADD FILE (NAME = 'tempdev03', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB, FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_03.mdf')

ALTER DATABASE tempdb
ADD FILE (NAME = 'tempdev04', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB, FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_04.mdf')

ALTER DATABASE tempdb
ADD FILE (NAME = 'tempdev05', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB, FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_05.mdf')

ALTER DATABASE tempdb
ADD FILE (NAME = 'tempdev06', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB, FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_06.mdf')

ALTER DATABASE tempdb
ADD FILE (NAME = 'tempdev07', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB, FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_07.mdf')

ALTER DATABASE tempdb
ADD FILE (NAME = 'tempdev08', SIZE = 1GB, MAXSIZE = 2GB, FILEGROWTH = 100MB, FILENAME = 'O:\SQLData\MSSQL.1\MSSQL\DATA\tempdb_08.mdf')

ALTER DATABASE tempdb
MODIFY FILE (NAME = 'templog', SIZE = 4GB, MAXSIZE = 6GB, FILEGROWTH = 100MB)



SELECT name, physical_name AS CurrentLocation, state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'tempdb');


/*
REMOVE DATABASE FILES

to remove a file from the TempDB you need to have enough space in the remaining files, so if there are 
some problems, try to restart the service.
As soon as the service has been restarted the TempDB will be empty so you can proceed with the following operations
*/

DBCC SHRINKFILE (tempdbfile_02, EMPTYFILE)

-- Remove the file: the data are moved into the remaining files
ALTER DATABASE TempDB
    REMOVE FILE tempdbfile_02

-- The remaining files probably will need some shrink and then the removing operation.
-- If you are planning to reduce the size of the file: first reduce the initial size and the autogrouth, then the maxsize.