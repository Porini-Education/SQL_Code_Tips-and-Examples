# Collation Example

<https://sqlsunday.com/2023/11/08/sql-server-utf8-collations/>

```SQL

-- Get database collation
SELECT name, collation_name FROM sys.databases WHERE name = 'test';

-- list of existing collations
--select * from fn_helpcollations()
--where 1=1
--and name like '%utf8%' 
--and name like 'Latin1_general_100_ci%'


-- Test UTF8 Collation
drop table if exists dbo.a;
go


create table dbo.a  
(
T_varchar varchar(100) collate Latin1_General_CI_AS,
T_Nvarchar nvarchar(100) collate Latin1_General_CI_AS,
T_utf8 varchar(100) collate Latin1_General_100_CI_AI_SC_UTF8,
T_nutf8 nvarchar(100) collate Latin1_General_100_CI_AI_SC_UTF8
)
GO

truncate table dbo.a;
GO

insert into dbo.a
values 
(N'Guerra e pace',N'Guerra e pace',N'Guerra e pace',N'Guerra e pace'),
(N'الحرب و السلام',N'الحرب و السلام',N'الحرب و السلام',N'الحرب و السلام'),
(N'Müharibə və Sülh',N'Müharibə və Sülh',N'Müharibə və Sülh',N'Müharibə və Sülh'),
(N'战争与和平',N'战争与和平',N'战争与和平',N'战争与和平'),
('Sota ja rauha','Sota ja rauha','Sota ja rauha','Sota ja rauha'),
(N'aə',N'aə',N'aə',N'aə')
;
GO

select * from dbo.a;
GO

select 
	T_varchar, DATALENGTH(T_varchar) as Bytes,Len(T_varchar) as Lenght,
	T_Nvarchar, DATALENGTH(T_Nvarchar) as Bytes,Len(T_Nvarchar) as Lenght,
	T_utf8, DATALENGTH(T_utf8) as Bytes,Len(T_utf8) as Lenght,
	T_nutf8, DATALENGTH(T_nutf8) as Bytes,Len(T_nutf8) as Lenght

from dbo.a;


SELECT 
	UNICODE('€'), 
	ASCII('€'),
	Nchar(UNICODE('€')),
	Char(ASCII('€'))
	;

SELECT
	UNICODE('Å'),
	ASCII('Å'),
	Nchar(UNICODE('Å')),
	Char(ASCII('Å'))
	;


	select Nchar(UNICODE('aə')), ASCII ('ə')



--Latin1_General_CI_AS

SELECT CONVERT (varchar(256), DATABASEPROPERTYEX ('test','collation'));


```