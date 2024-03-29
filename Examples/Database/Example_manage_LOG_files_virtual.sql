/*
# List SQL Virtual Log Files (VLF)

Insert in a table the VLF data from DBCC LogInfo

Documentation:
 - https://www.sqlskills.com/blogs/kimberly/transaction-log-vlfs-too-many-or-too-few/
 - http://sqlblog.com/blogs/kalen_delaney/archive/2009/12/21/exploring-the-transaction-log-structure.aspx
 - https://www.sqlskills.com/blogs/kimberly/8-steps-to-better-transaction-log-throughput/
 - https://www.sqlskills.com/blogs/paul/important-change-vlf-creation-algorithm-sql-server-2014/

 - https://www.sqlshack.com/what-is-sql-server-virtual-log-file-and-how-to-monitor-it/

Info generali sul log
 - https://docs.microsoft.com/en-us/sql/relational-databases/sql-server-transaction-log-architecture-and-management-guide?view=sql-server-2017

Generally speaking, for every 10 Gigs of Log file we should not exceed 50 Virtual Log Files.
So, after reviewing these files, if you have more than 100 Virtual Log Files then try to check the growth settings.
If you have more than 1,000 Virtual Log Files, then first apply the fix and take preventive measures as well. 

 1- Backup the Transaction Log file if the recovery model of the database is FULL.
 2- Issue a CHECKPOINT manually so that pages from the buffer can be written down to the disk.
 3- Make sure there are no huge transactions running and keeping the Log file full.
 4- Shrink the Log file to a smaller size
 5- Re-grow the log file to a larger size on which your log file generally keeps on working.
*/

-- Connect to the DB with the LOGs you want to analyze

USE master 
GO 
IF EXISTS  (SELECT 1 FROM sys.tables 
            WHERE name = 'sp_LOGINFO') 
    DROP TABLE sp_loginfo; 
GO 
CREATE TABLE sp_LOGINFO 
(
RecoveryUnitId tinyint,
FileId tinyint, 
FileSize bigint, 
StartOffset bigint, 
FSeqNo int, 
Status tinyint, 
Parity tinyint, 
CreateLSN numeric(25,0) ); 
GO

TRUNCATE TABLE sp_LOGINFO; 
INSERT INTO sp_LOGINFO 
   EXEC ('DBCC LOGINFO');

--You can select the VLFs from most recently used to the least:
SELECT * FROM sp_LOGINFO 
ORDER BY FSeqNo DESC; 

--You can count how many VLFs have each status value:
SELECT status, COUNT(*) FROM sp_LOGINFO 
GROUP BY status; 


/*

To reduce the number of VLF

 1- BACKUP LOG databasename TO devicename
 2- Shrink the log to as small a size as possible (truncateonly)
*/

-- Remark: if you don't know the logical filename of your transaction log use sp_helpfile to list all of your database files.
DBCC SHRINKFILE(transactionloglogicalfilename, TRUNCATEONLY)

/*
 3- Alter the database to modify the transaction log file to the appropriate size – in one step
*/

ALTER DATABASE databasename
MODIFY FILE 
( 
      NAME = transactionloglogicalfilename 
    , SIZE = newtotalsize
);

/*
 4- Set the Transaction Log growth size to be in units of 1 GB

If you don't have a lot of VLFs, you can try to generate more by running SELECT INTO repeatedly. Make sure you are in FULL recovery to get the most log growth:
*/

SELECT * INTO dbo.Orders FROM AdventureWorks.Sales.SalesOrderDetail; 
DROP TABLE dbo.Orders; 
GO 5

TRUNCATE TABLE sp_LOGINFO; 
INSERT INTO sp_LOGINFO 
   EXEC ('DBCC LOGINFO');

SELECT status, COUNT(*) FROM sp_LOGINFO 
GROUP BY status WITH ROLLUP;