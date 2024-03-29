/* 
Add and remove an additional LOG file
*/

-- create a test db with a single LOG file

USE [master]
GO

CREATE DATABASE [Bart]

 ON  PRIMARY 
( NAME = N'Bart', FILENAME = N'C:\DataBase\Data\Bart.mdf' , SIZE = 51200KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bart_log', FILENAME = N'C:\DataBase\Log\Bart_log.ldf' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

-- insert some records

create table T01 (id int, Label varchar(12));
insert into T01 values (1, 'alfa')
insert into T01 values (2, 'bravo')
insert into T01 values (3, 'charlie')
;

-- query check
exec sp_helpfile ;

-- Let's add a LOG file
use master
go

ALTER DATABASE Bart   
ADD LOG FILE (  
    NAME =  Bart_log2,  
    FILENAME = 'C:\DataBase\Log\Bart_log2.ldf',  
    SIZE = 20MB  
    );  
GO 

-- remove the LOG file
use Bart
go

DBCC SHRINKFILE(Bart_log2, TRUNCATEONLY);

USE master;
GO
ALTER DATABASE Bart
REMOVE FILE Bart_log2;
GO


-- Follow this steps if you added more files
-- Empty the data file 
DBCC SHRINKFILE (Bart_log3, EMPTYFILE);  
GO  

-- Remove the data file from the database.  
ALTER DATABASE Bart  
REMOVE FILE Bart_log3;  
GO  


-- THE END
USE master;
GO
DROP DATABASE [Bart]