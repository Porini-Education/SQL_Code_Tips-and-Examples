/*
	Total amount of time spent in optimizing query since the instance restart.
*/

with opt as
(
	select
		server_start_time = (select login_time from sys.dm_exec_sessions where session_id = 1)
		,total_optimizations = [occurrence]
		,avg_optimization_time_s = [value]
	from
		sys.dm_exec_query_optimizer_info
	where
		counter = 'elapsed time'
),
opt_perc as 
(
	select 
		opt.*
		,available_time_s = datediff(ss, server_start_time, getdate())
		,total_optimization_time_s = avg_optimization_time_s * total_optimizations
	from opt
)

select
	opt_perc.*
	,percent_time = total_optimization_time_s / available_time_s * 100.
from opt_perc