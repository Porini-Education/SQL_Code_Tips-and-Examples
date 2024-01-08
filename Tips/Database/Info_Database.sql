/*
	Returns the attributes of all databases of the instance and the info about the last backup
	This script is only for on-premises solutions
*/

with LastBck_DATA as
(
	select 
		database_name
		,DateLastFullBackupDATA = MAX(Backup_finish_date)
	from   		msdb.dbo.backupset
	where  		type = 'D'
	group by 	database_name
),
LastBck_LOG as
(
	select 
		database_name
		,DateLastFullBackupLOG = MAX(Backup_finish_date)
	from 		msdb.dbo.backupset
	where 		type = 'L'
	group by 	database_name
),

Storage as
(
select	
		pc1.instance_name
		,pc3.cntr_value/1024.0/1024.0 as DataSize_GB
		,pc1.cntr_value/1024.0 /1024.0 as LogSize_GB
		,cast (pc2.cntr_value*100.0/pc1.cntr_value as numeric (5,2)) as PCT_Log_Space_Used
									
from	sys.dm_os_performance_counters as pc1,
		sys.dm_os_performance_counters as pc2,
		sys.dm_os_performance_counters as pc3

where			pc1.instance_name = pc2.instance_name
		and 	pc1.instance_name = pc3.instance_name
		and		pc1.counter_name = 'Log file(s) Size (KB)'
		and		pc2.counter_name = 'Log file(s) Used Size (KB)'
		and		pc3.counter_name = 'Data File(s) Size (KB)'
		and		pc1.cntr_value > 0
)

select 
	ElaborationDate = convert(smalldatetime, getdate())
	,ServerName = @@SERVERNAME
	,InstanceName = ISNULL(SERVERPROPERTY('InstanceName'), 'MSSQLSERVER')
	,DatabaseID = database_id
	,DatabaseName = db.name
	,DataBaseState = state_desc
	,DataSize_GB = convert(numeric(12,3),Storage.DataSize_GB )
	,LogSize_GB = convert(numeric(12,3),Storage.LogSize_GB)
	,Storage.PCT_Log_Space_Used
	,RecoveryModel = db.recovery_model_desc
	,LastFullBackupDATA = convert(smalldatetime,LastBck_DATA.DateLastFullBackupDATA)
	,DayFromLastBKData = datediff (day,LastBck_DATA.DateLastFullBackupDATA,getdate())
	,LastFullBackupLOG = convert(smalldatetime,LastBck_LOG.DateLastFullBackupLOG)
	,DayFromLastBKLog = datediff (day,LastBck_LOG.DateLastFullBackupLOG,getdate())
	,StatoReplica = 
		 case 
			when SERVERPROPERTY('IsHadrEnabled') = 1 then coalesce (hars.role_desc, 'DB not in replica') 
			else coalesce (hars.role_desc, 'HADR not active') 
		 end
	,CompatibilityLevel = db.compatibility_level
	,CollationName = db.collation_name
	,PageVerify = page_verify_option_desc
	,log_reuse_wait_desc
	,CreationDate = convert(smalldatetime,create_date)
from 
	sys.databases as db left outer join LastBck_DATA
		on db.name = LastBck_DATA.database_name
	left outer join LastBck_LOG
		on db.name = LastBck_LOG.database_name
	left outer join Storage
		on db.name = Storage.instance_name
	left outer join sys.dm_hadr_availability_replica_states hars 
		ON db.replica_id = hars.replica_id
order by DatabaseName
;