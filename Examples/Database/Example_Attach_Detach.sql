/*
	Test Attach and Detach of a database.
	This feature is available only on-prem.
*/

-- Create a test database
USE [master]
GO

CREATE DATABASE TestAtDet
 ON  PRIMARY 
( NAME = N'TestAtDet', FILENAME = 'S:\Data\llgSql201202\TestAtDet.mdf' , SIZE = 100MB , MAXSIZE = 262144KB , FILEGROWTH = 65536KB ), 
 FILEGROUP [Secondary]  DEFAULT
( NAME = N'TestAtDet_2', FILENAME = 'S:\Data\llgSql201202\TestAtDet_2.ndf' , SIZE = 120MB , MAXSIZE = 6291456KB , FILEGROWTH = 262144KB )
 LOG ON 
( NAME = N'TestAtDet_log', FILENAME = 'L:\Data\llgSql201202\TestAtDet_log.ldf' , SIZE = 80MB , MAXSIZE = 3145728KB , FILEGROWTH = 262144KB )
GO

-- Create a table in the new test database
use TestAtDet
GO
create table T1 (id int, Label varchar(20));
GO
insert into T1 values (1,'alfa'),(2,'bravo');
GO

-- Provide the detach
USE master;  
GO

ALTER DATABASE TestAtDet  
SET SINGLE_USER;  
GO  

EXEC sp_detach_db 'TestAtDet', 'true';  -- skipchecks = 'true': the statistics won't be updated
GO

-- Let's try to move the .mdf, .ndf, .ldf files on another server, as an example:
-- S:\Data
-- L:\Data

-- Provide the attach on another instance
USE master;  
GO

CREATE DATABASE TestAtDet   
    ON 
	(FILENAME = 'S:\Data\TestAtDet.mdf'), 
	(FILENAME = 'S:\Data\TestAtDet_2.ndf'), 
    (FILENAME = 'L:\Data\TestAtDet_log.ldf')  
    FOR ATTACH;  
GO