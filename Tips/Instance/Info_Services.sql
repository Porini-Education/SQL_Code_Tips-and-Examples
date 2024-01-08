/*
	Returns the attributes of all services installed on the Instance
	Properties of sql server services running for the instance

*/

SELECT 
	servicename, 
	process_id, 
	startup_type_desc, 
	status_desc, 
	last_startup_time, 
	service_account, 
	is_clustered, 
	cluster_nodename, [filename]
FROM 
	sys.dm_server_services 
	WITH (NOLOCK) OPTION (RECOMPILE);