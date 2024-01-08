# Info Instnce

Get the basic information about the istance

## On Premise

``` SQL
with
cteSqlInst AS
(	
select
	CONVERT(varchar(50), SERVERPROPERTY('MachineName')) AS MachineName,
	CONVERT(varchar(50), SERVERPROPERTY('ServerName')) AS  ServerName,
	(CASE WHEN CONVERT(varchar(50), SERVERPROPERTY('InstanceName')) IS NULL
		THEN 'Default Instance'
		ELSE CONVERT(varchar(50), SERVERPROPERTY('InstanceName'))
	END) AS InstanceName,
	CONVERT(varchar(20), SERVERPROPERTY('ProductVersion')) AS ProductVersion,
	CONVERT(varchar(20), SERVERPROPERTY('ProductLevel')) AS ProductLevel,
	CONVERT(char(30), SERVERPROPERTY('COLLATION')) AS COLLATION,
	CONVERT(varchar(40), SERVERPROPERTY('EDITION')) AS EDITION,
	SERVERPROPERTY('IsFullTextInstalled') AS [IsFullTextInstalled], 
	SERVERPROPERTY('IsIntegratedSecurityOnly') AS [IsIntegratedSecurityOnly],
	SERVERPROPERTY('IsHadrEnabled') AS [IsHadrEnabled], 
	case SERVERPROPERTY('IsHadrEnabled')
	when 0 then ''
	else
		case SERVERPROPERTY('HadrManagerStatus')
			when 0 then 'Not started'
			when 1 then 'Started and running'
			when 2 then 'Not started and failed'
			else ''
		end  
	end AS [HadrManagerStatus] 
	
),

cteSO
AS
(
SELECT 
	windows_release, 
	windows_service_pack_level, 
	windows_sku, 
	os_language_version
FROM 
	sys.dm_os_windows_info WITH (NOLOCK)
),

cteHW AS
(
SELECT 
    cpu_count AS LogicalCPUCount, 
    scheduler_count, 
    hyperthread_ratio,
    cpu_count/hyperthread_ratio AS PhysicalCPUCount, 
    physical_memory_kb/1024 AS PhysicalMemory_MB, 

    max_workers_count, 
    virtual_machine_type_desc

FROM 
sys.dm_os_sys_info WITH (NOLOCK) 
),

cteMimMem
as
(
    SELECT value_in_use as MaxServerMemory_MB
    FROM sys.configurations
    WHERE name like 'max server memory (MB)'
),

cteMaxMem
as
(
	SELECT value_in_use as MinServerMemory_MB
	FROM sys.configurations
	WHERE name like 'min server memory (MB)'
),
ctePhysMem
as
(  SELECT
	physical_memory_in_use_kb/1024 AS MemoryUsedBySqlserver_MB
FROM 
	sys.dm_os_process_memory
),


cteStartTime
	as
		(
		select start_time from sys.traces where id= 1
		),

	cteInstDate
		as
		(
		SELECT create_date AS [SQL Server Install Date] 
		FROM sys.server_principals WITH (NOLOCK)
		WHERE name = N'NT AUTHORITY\SYSTEM'
		OR name = N'NT AUTHORITY\NETWORK SERVICE' 
		),

cteMaxDegreeParalelism
as
(
	SELECT value_in_use as MaxDegreeOfParallelism
	FROM sys.configurations
	WHERE name like 'max degree of parallelism'
),

cteCostParallelism
as
(
	SELECT value_in_use as CostThresholdForParallelism
	FROM sys.configurations
	WHERE name like 'cost threshold for parallelism'
)

SELECT
	*
	 	
FROM
	cteSqlInst, 
	cteStartTime,
	cteSO, 
	CteHW,
	cteMimMem,
	cteMaxMem,
	ctePhysMem,
	--cteInstDate,
	cteMaxDegreeParalelism,
	cteCostParallelism
;
 GO
```

## On Azure

``` SQL
with
cteSqlInst AS
(	
select
	CONVERT(varchar(50), SERVERPROPERTY('MachineName')) AS MachineName,
	CONVERT(varchar(50), SERVERPROPERTY('ServerName')) AS  ServerName,
	(CASE WHEN CONVERT(varchar(50), SERVERPROPERTY('InstanceName')) IS NULL
		THEN 'Default Instance'
		ELSE CONVERT(varchar(50), SERVERPROPERTY('InstanceName'))
	END) AS InstanceName,
	CONVERT(varchar(20), SERVERPROPERTY('ProductVersion')) AS ProductVersion,
	CONVERT(varchar(20), SERVERPROPERTY('ProductLevel')) AS ProductLevel,
	CONVERT(char(30), SERVERPROPERTY('COLLATION')) AS COLLATION,
	CONVERT(varchar(40), SERVERPROPERTY('EDITION')) AS EDITION,
	SERVERPROPERTY('IsFullTextInstalled') AS [IsFullTextInstalled], 
	SERVERPROPERTY('IsIntegratedSecurityOnly') AS [IsIntegratedSecurityOnly],
	SERVERPROPERTY('IsHadrEnabled') AS [IsHadrEnabled], 
	case SERVERPROPERTY('IsHadrEnabled')
	when 0 then ''
	else
		case SERVERPROPERTY('HadrManagerStatus')
			when 0 then 'Not started'
			when 1 then 'Started and running'
			when 2 then 'Not started and failed'
			else ''
		end  
	end AS [HadrManagerStatus] 
	
),

cteHW AS
(
SELECT 
	cpu_count AS LogicalCPUCount, 
	scheduler_count, 
	hyperthread_ratio,
	cpu_count/hyperthread_ratio AS PhysicalCPUCount, 
	physical_memory_kb/1024 AS PhysicalMemory_MB, 

	max_workers_count, 
	virtual_machine_type_desc

FROM 
sys.dm_os_sys_info WITH (NOLOCK) 

),

cteMimMem
as
(
	SELECT value_in_use as MaxServerMemory_MB
	FROM sys.configurations
	WHERE name like 'max server memory (MB)'
),

cteMaxMem
as
(
	SELECT value_in_use as MinServerMemory_MB
	FROM sys.configurations
	WHERE name like 'min server memory (MB)'
),

cteMaxDegreeParalelism
as
(
	SELECT value_in_use as MaxDegreeOfParallelism
	FROM sys.configurations
	WHERE name like 'max degree of parallelism'
),

cteCostParallelism
as
(
	SELECT value_in_use as CostThresholdForParallelism
	FROM sys.configurations
	WHERE name like 'cost threshold for parallelism'
)


SELECT
	*	 	
FROM
	cteSqlInst, 
	CteHW,
	cteMimMem,
	cteMaxMem,
	cteMaxDegreeParalelism,
	cteCostParallelism
;
 GO
 ```
 