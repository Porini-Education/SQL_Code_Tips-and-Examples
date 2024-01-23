# Inport CSV files from Azure Container in a SQL Database

This Techniques could be used both on premise and azure

``` SQL
use test
GO

-- one shot activity
CREATE MASTER KEY ENCRYPTION BY PASSWORD='India2033';
GO


--DROP EXTERNAL DATA SOURCE  ITSDataSource;
--GO

--DROP DATABASE SCOPED CREDENTIAL ITSDataCredential;
--GO



-- SAS Storage Account
--CREATE DATABASE SCOPED CREDENTIAL ITSDataCredential
--WITH 
--    IDENTITY = 'SHARED ACCESS SIGNATURE',
--    SECRET = '?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2024-02-04T19:43:08Z&st=2024-01-22T11:43:08Z&spr=https,http&sig=QsxpGF8f11Y46%2BMpneREAU9%2FzHAt%2FlXTr9Z1CFQFb3Q%3D'
--	;
--GO

-- SAS Container
CREATE DATABASE SCOPED CREDENTIAL ITSDataCredential
WITH 
    IDENTITY = 'SHARED ACCESS SIGNATURE',
    SECRET = 'sp=r&st=2024-01-22T11:56:58Z&se=2024-02-04T19:56:58Z&sv=2022-11-02&sr=c&sig=gjHw4g9OClXiwk0F9lvoG75ZyovFo6WHRudwHJ8HpH8%3D'
	;
GO

---- SAS File
--CREATE DATABASE SCOPED CREDENTIAL ITSDataCredential
--WITH 
--    IDENTITY = 'SHARED ACCESS SIGNATURE',
--    SECRET = 'sp=r&st=2024-01-22T11:48:43Z&se=2024-02-04T19:48:43Z&sv=2022-11-02&sr=b&sig=VU7UijpxErSWJCuosg5E%2FnaF7D88vhxGfl0O4xaIRvo%3D'
--	;
--GO



CREATE EXTERNAL DATA SOURCE ITSDataSource
WITH 
(
    TYPE = BLOB_STORAGE, 
    LOCATION = 'https://itsdati.blob.core.windows.net/dati',
    CREDENTIAL = ITSDataCredential
)
;
GO

--create table dbo.DatiITS
--(
--measure varchar(100),
--location varchar(100),
--sex varchar(100),
--age varchar(100),
--cause varchar(100),
--metric varchar(100),
--[year] varchar(100),
--val varchar(100),
--[upper] varchar(100),
--[lower] varchar(100)
--)
--;
--GO

BULK INSERT dbo.DatiIts
FROM 'BC_region_SEX1.csv'
WITH 
(
    DATA_SOURCE = 'ITSDataSource',
    FORMAT = 'CSV', 
    FIRSTROW = 2, 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n', 
    TABLOCK
)
;

select top 30 * from DatiITS
```