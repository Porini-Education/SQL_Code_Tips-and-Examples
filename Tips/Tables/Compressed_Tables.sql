/*
	List of compressed tables. Connect to the database you want to analyze.
	This query can be executed both on prem and on cloud.
*/

SELECT	
	TableSchema = sc.[name] 
	,TableName = st.[name]
	,st.object_id 
	,sp.partition_id
	,sp.partition_number
	,sp.data_compression 
	,sp.data_compression_desc 
FROM 
	sys.partitions sp
	INNER JOIN sys.tables st 
		ON st.object_id = sp.object_id
	inner join sys.schemas sc
		ON st.schema_id= sc.schema_id
WHERE 
	data_compression <> 0
;