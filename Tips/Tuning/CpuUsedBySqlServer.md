# % of CPU used by Sql server using sys.dm_os_ring_buffers

``` SQL
DECLARE @ts_now BIGINT
	-- SELECT @ts_now = cpu_ticks / CONVERT(FLOAT, cpu_ticks_in_ms) FROM sys.dm_os_sys_info  --- per SQL 2005


	select @ts_Now = ms_ticks from sys.dm_os_sys_info;
	
	SELECT record_id,
		DATEADD(ms, -1 * (@ts_now - [timestamp]), GETDATE()) AS EventTime, 
		SQLProcessUtilization,
		SystemIdle,
		100 - SystemIdle - SQLProcessUtilization AS OtherProcessUtilization
	FROM (
		SELECT 
			record.value('(./Record/@id)[1]', 'int') AS record_id,
			record.value('(./Record/SchedulerMonitorEvent/SystemHealth/SystemIdle)[1]', 'int') AS SystemIdle,
			record.value('(./Record/SchedulerMonitorEvent/SystemHealth/ProcessUtilization)[1]', 'int') AS SQLProcessUtilization,
			TIMESTAMP
		FROM (
			SELECT TIMESTAMP, CONVERT(XML, record) AS record 
			FROM sys.dm_os_ring_buffers 
			WHERE ring_buffer_type = N'RING_BUFFER_SCHEDULER_MONITOR'
			AND record LIKE '% %') AS x
		) AS y 
	ORDER BY record_id DESC;
GO
```
