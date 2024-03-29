/*
Query an Azure SQL Database from SQL Server

** DOCUMENTATION **
http://yasqlsb.blogspot.com/2014/07/sql-azure-linked-servers.html

The linked server will be craeted with the TSQL code
*/

EXEC master.dbo.sp_addlinkedserver 
	@server = N'EducationDB', 
	@srvproduct=N'', 
	@provider=N'sqlncli', 
	@datasrc=N'PORINIEDUCATIONSQLSERVER.DATABASE.WINDOWS.NET', 
	@catalog=N'EducationData' 
	;
		
EXEC master.dbo.sp_addlinkedsrvlogin 
	@rmtsrvname=N'EducationDB',
	@useself=N'False',
	@locallogin=NULL,
	@rmtuser=N'education_user',
	@rmtpassword='education_password'
	;

select * 
from EducationDB.EducationData.anagrafica.TipoAttivita;
