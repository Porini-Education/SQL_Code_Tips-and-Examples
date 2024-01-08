/*
	Info about job executions within the Instance
*/

USE msdb
Go 

SELECT 
	j.name AS JobName
	,h.step_name AS StepName
	,CONVERT(CHAR(10), CAST(STR(h.run_date,8, 0) AS datetime), 111) AS RunDate
	,STUFF(
		STUFF(
			RIGHT('000000' + CAST ( h.run_time AS VARCHAR(6) ), 6 )
			,5,0,':')
			,3,0,':') 
		AS RunTime
	,h.run_duration AS StepDuration
	,case h.run_status 
		when 0 then 'failed'
		when 1 then 'Succeded' 
		when 2 then 'Retry' 
		when 3 then 'Cancelled' 
		when 4 then 'In Progress' 
	 end AS ExecutionStatus
	,h.message AS MessageGenerated
FROM 
	sysjobhistory h inner join sysjobs j
		ON j.job_id = h.job_id
ORDER BY 
	j.name 
	,h.run_date 
	,h.run_time
GO