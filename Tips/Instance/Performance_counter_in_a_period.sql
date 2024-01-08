/*
	Performance counter in a period within an instance. 
	It will check for a good amounnt of indicators about the health of the instance
*/

IF EXISTS (SELECT * FROM [tempdb].[sys].[objects]
    WHERE [name] = N'##PerformanceCounter')
    DROP TABLE ##WaitStat;
GO

IF EXISTS (SELECT * FROM [tempdb].[sys].[objects]
    WHERE [name] = N'##PerformanceCounterMonitorated')
    DROP TABLE ##WaitStat;
GO

create table ##PerformanceCounterMonitorated
(Counter_Name nvarchar(128) not null);
go

insert into ##PerformanceCounterMonitorated
values
('Average Wait Time (ms)'),
('Average Wait Time Base'),
('Batch Requests/sec'),
('Buffer cache hit ratio'),
('Buffer cache hit ratio base'),
('Cache Hit Ratio'),
('Cache Hit Ratio Base'),
('Checkpoint pages/sec'),
('Forwarded Records/sec'),
('FreeSpace Scans/sec'),
('Full Scans/sec'),
('Index Searches/sec'),
('Lazy writes/sec'),
('Lock Requests/sec'),
('Lock Timeouts/sec'),
('Lock Wait Time (ms)'),
('Lock Waits/sec'),
('Logins/sec'),
('Logouts/sec'),
('Memory Grants Pending'),
('Number of Deadlocks/sec'),
('Page life expectancy'),
('Page lookups/sec'),
('Page reads/sec'),
('Page Splits/sec'),
('Page writes/sec'),
('Scan Point Revalidations/sec'),
('SQL Compilations/sec'),
('Total Server Memory (KB)'),
('Transactions/sec'),
('User Connections'),
('Workfiles Created/sec'),
('Worktables Created/sec'),
('Average Latch Wait Time (ms)'),
('Average Latch Wait Time Base'),
('Latch Waits/sec'),
('Non-Page latch waits'),
('Number of SuperLatches'),
('Page IO latch waits'),
('Page latch waits'),
('SuperLatch Demotions/sec'),
('SuperLatch Promotions/sec'),
('Total Latch Wait Time (ms)')
;
GO


select 
	IdSample= 1
	,DateSample = getdate()
	,RecordHash = binary_checksum(pc.[object_name], pc.[counter_name], pc.[instance_name])
	,pc.[object_name]
	,counter_name = rtrim(pc.[counter_name])
	,instance_name = rtrim(pc.[instance_name])
	,pc.[cntr_value]
	,pc.[cntr_type]

into ##PerformanceCounter

from
	##PerformanceCounterMonitorated M 
	LEFT OUTER JOIN sys.dm_os_performance_counters pc
	ON M.counter_name =PC.counter_name

;
go


WAITFOR DELAY '00:05:00';
GO


declare @MaxSampleId int = (select isnull(max(IdSample), 0) from  ##PerformanceCounter with (updlock));

insert into  ##PerformanceCounter

 select 
	IdSample = @MaxSampleId + 1
	,DateSample = getdate()
	,RecordHash = binary_checksum(pc.[object_name], pc.[counter_name], pc.[instance_name])
	,pc.[object_name]
	,counter_name = rtrim(pc.[counter_name]) 
	,instance_name = rtrim(pc.[instance_name])
	,pc.[cntr_value]
	,pc.[cntr_type]

from
	##PerformanceCounterMonitorated M 
	LEFT OUTER JOIN sys.dm_os_performance_counters pc
	ON M.counter_name =PC.counter_name
;

GO

declare @DateStart datetime = (select min(DateSample) as DateSample from ##PerformanceCounter);
declare @DateFinish DateTime = (select max(DateSample) as DateSample from ##PerformanceCounter);

-- Values that will be subtracted to the previous sample and divided by the amount of time
-- between the samples
select 
	DataStart = @DateStart
	,DateFinish = @DateFinish
	,w2.[object_name]
	,w2.[counter_name]
	,w2.[instance_name]
	,cntr_value = 1000.0 * (w2.cntr_value - w1.cntr_value) / abs(datediff(ms, w1.DateSample, w2.DateSample)) 
from 
	##PerformanceCounter w1
inner join
	##PerformanceCounter  w2 
		on w2.IdSample-1 = w1.IdSample 
		and w2.RecordHash = w1.RecordHash	
				
where
	w1.cntr_type = 272696576
and
	w2.cntr_value - w1.cntr_value >= 0

union all

-- Cummulated values
select 
	DateStart = @DateStart
	,DateFinish = @DateFinish
	,s.[object_name]
	,s.[counter_name]
	,s.[instance_name]
	,s.cntr_value
from 
	##PerformanceCounter s
where
	s.cntr_type = 65792


		union all

		-- Percentage computation
		select 
			DateStart = @DateStart
			,DateFinish = @DateFinish
			,s1.[object_name]
			,s1.[counter_name]
			--,s2.counter_name
			,s1.[instance_name]
			,case 
				when s2.cntr_value <> 0 then  (s1.cntr_value * 100.0) / s2.cntr_value
				else null
			end as cntr_value
		from 
			##PerformanceCounter s1 
		inner join
			##PerformanceCounter s2 on 
					rtrim(s2.counter_name) = rtrim(s1.counter_name) + ' base' 
					and s1.IdSample = s2.IdSample 
					and s1.instance_name = s2.instance_name	
					and s1.object_name = s2.object_name		
		where
			s1.cntr_type = 537003264
			
union all

-- Average computations
select	
	DateStart = @DateStart
	,DateFinish = @DateFinish
	,c1.[object_name]
	,c1.[counter_name]
	--,c2.counter_name
	,c1.[instance_name]
	,cntr_value = cast(case when  c2.cntr_value != 0 then (c1.cntr_value * 1.) / c2.cntr_value else 0 end as numeric(38,15))
from
	(
	select 
		b.IdSample
		,b.DateSample
		,b.[object_name]
		,b.[counter_name]
		,b.[instance_name]
		,cntr_value = b.cntr_value - a.cntr_value 
	from 
		##PerformanceCounter a
	inner join
		##PerformanceCounter b 
		on b.IdSample - 1 = a.IdSample 
		and a.RecordHash = b.RecordHash
	where 
		a.cntr_type = 1073874176

	) c1
inner join
	(	
	select 
		b.IdSample
		,b.DateSample
		,b.[object_name]
		,b.[counter_name]
		,b.[instance_name]
		,cntr_value = b.cntr_value - a.cntr_value 
	from 
		##PerformanceCounter a
	inner join
		##PerformanceCounter b 
		on b.IdSample - 1 = a.IdSample 
		and a.RecordHash = b.RecordHash
	where 
		a.cntr_type = 1073939712


	) c2 on c1.IdSample = c2.IdSample
					and c1.object_name = c2.object_name 
					and c1.[instance_name] = c2.[instance_name]
					and charindex(rtrim(lower(replace(c2.counter_name, ' base', ''))), rtrim(lower(c1.counter_name))) > 0

;

GO
 
 --Cleanup
IF EXISTS (SELECT * FROM [tempdb].[sys].[objects]
    WHERE [name] = N'##PerformanceCounter')
    DROP TABLE ##PerformanceCounter;

GO

IF EXISTS (SELECT * FROM [tempdb].[sys].[objects]
    WHERE [name] = N'##PerformanceCounterMonitorated')
    DROP TABLE ##PerformanceCounterMonitorated;
GO