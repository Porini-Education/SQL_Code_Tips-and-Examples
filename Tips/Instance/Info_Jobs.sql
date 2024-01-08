/*
	It returns a list with all the available jobs within the instance you are connected. 
	It provides also the last execution informations.
*/

use master
go

SELECT
	name as [Job] , 
	[enabled] as IsEnable, 
	date_created as CreationDate,
	date_modified  as EditDate,

	right('00000000' + convert(varchar(8),convert(int,last_run_date)),8) + ' ' +
		right('000000' + convert(varchar(6), convert(int,last_run_time)),6)  as LastExecutionStart,
	last_run_date ,
	last_run_time , 
	last_run_duration , 
	last_outcome_message ,
	last_run_outcome 
	
FROM 
	msdb.dbo.sysjobs A, msdb.dbo.sysjobservers B 
WHERE 
	A.job_id = B.job_id 
order 
	by name
;
GO