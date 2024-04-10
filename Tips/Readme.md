# Tables of Contents

|Task|Description|
|---|---|
|**UTILITY**|
|[Table of Numbers](Utility/TableOfNumbers.md)|Creation of a Table of Numbers|
|[Get Internal Unique Record ID](Utility/GetInternalRecordId.md)|Use of undocumented functions **%%physloc%%**  and **sys.fn_PhysLocFormatter** to get the ID of a record.Useful to remove duplicate records.|
|[get Easter Date]((Utility/GetInternalRecordId.md) | A function to obtain Easter'sd date of a specific year|
|**INSTANCE**|
|[Info Instance](Instance/Info_Instance.md)|Get the information about instance|
|[Active Sessions](Instance/Active_Sessions.sql)|Allow you to describe the active session, and transaction, on a specific database or on the instance|
|[Activity TempDB](Instance/Activity_TempDB.sql)|Activity on the database TempDB|
|[Alter TempDB](Instance/Alter_TempDB.sql)|How to alter the database TempDB|
|[Info Jobs](Instance/Info_Jobs.sql)|Returns info about the Jobs within the Instance|
|[Info Jobs Executions](Instance/Info_Jobs_Executions.sql)|Info about job executions within the Instance|
|[Info Services](Instance/Info_Services.sql)|Returns the attributes of all services installed on the Instance|
|[IP Address](Instance/Ip_Address.sql)|Retrieve the IP address and the Inbound Port of the server|
|[Mark a Procedure as System Procedure](Instance/CreateSystemProcedure.md)|A System Procedure could be execute in any databases.
|[Performance counter](Instance/CrePerformance_counter_in_a_period.sql)|Performance counter in a period|
|[Time to Optimize](Instance/Time_to_Optimize.sql)|Total amount of time spent in optimizing query since the instance restart|
|[List Query Plan](Instance/QueryPlan.md)|List of Query Plans present in cache. using **sys.dm_exec_cached_plans** |
|||
|**DATABASE**|
|[Info Databases](Database/Info_Database.sql)|Returns the attributes of all databases of the instance and the info about the last backup|
|[Info DB Files](Database/Info_DB_Files.sql)|It retrieves the features of the database in the current instance|
|[Info Total Space Used](Database/Total_SpaceUsed.md)|Total space used by a different type of object in the databases|
|[Info Database Object](Database/Info_Database_Object.md)|List of UserTable or View in a single database|
|[Last execution time of store procedures](Database/LastStoreProcedureExecution.md)|List of last store procedures's execution time|
|[Database Backups History](Database/DatabaseBackupHistory.md)|List the times of all db's backups|
|[Info Change Tracking](Database/Info_ChangeTraking.md)|Returns a row with the name of the database and the name of the table for all DBs and Tables with Change Tracking Enabled|
|||
|**TABLES**|
|[Change Field Collate](Tables/Change_Field_Collate.sql)|Generate the scripts to alter the collation of columns in the database|
|[Compressed Tables](Tables/Compressed_Tables.sql)|Returns a list with all the compressed tables in the queried database|
|[Database Columns](Tables/Dizionario_colonne.sql)|Returns the attributes of each field of the database tables|
|[Table Sizes](Tables/Info_Tables_Size.sql)|Returns, for each table, the number of rows, the occupied and allocated space and the date of the last scan, seek, lookup and update operation|
|[Partitioned Tables](Tables/Info_PartitionTables.md)|Returns a list of all the partitioned tables in the queried database|
|[Last Acitivity Tables](Tables/LastTableActivity.md)|Returns the date time of last activity for each tables of the database using **sys.dm_db_index_usage_stats**|
|[Rename Tables](Tables/RenameTables.md)|Script to rename a list of tables|
|||
|**INDEX**|
|[Info Index](Index/Info_Index.md)|Returns the information about all Tables Indexes|
|[Info Missing Index](Index/Info_MissingIndex.md)|Returns the information Missing Indexes using **sys.dm_db_missing_index_details**|
|[Info Indexes Usage](Index/Info_IndexUsage.md)|Returns info about indexes usage using **sys.dm_db_index_usage_stats**|
|[Info Indexes Usage and Fragmentation](Index/Info_IndexUsageAndFragmentation.md)|Returns info about indexes usage and fragmentation using **sys.dm_db_index_usage_stats** and **sys.dm_db_index_physical_stats**|
|||
|**COLUMNSTORE INDEX**|
|[Info Rowstore](Index/Info_ColumnStoreIndex.md)|Returns the information about a Index's Rowstore Groups|
|[Info Rowstore Groups](Index/Info_RowStoreGroups.md)|Returns the information about all Columnstore Index's Rowstore Groups Using **sys.dm_db_column_store_row_group_physical_stats**|
|||
|**DATA STRUCTURE**|
|[Info Table](DeepOnDataStructure/InfoTable.md)|Info about Table's Size and number of Data Pages|
|[Info Data Page](DeepOnDataStructure/InfoDataPage.md)|Get the list of all table's data pages|
|[Info Row](DeepOnDataStructure/InfoRow.md)|Get the RowId of each record in a Table|
|[Info IndexT Tree Level](DeepOnDataStructure/InfoIndexTreeLevel.md)|Return the Page Id of the  pages in Root and Intermediate levels of an index|
|||
|**DISK**|
|[Disks Latency](Disk/DiskLatency.md)|Measure, for each database files, the reading and writing disk latency|
|**MEMORY**|
|[Database pages in memory](Memory/DBPagesInMemory.md)|Number of data pages in memory for each database using **sys.dm_os_buffer_descriptors**|
|[Objects in memory](Memory/ObjectsInRam.md)|Number of cached pages for each object and index of currente datbase, and provides additional details such as the object name, index name, index type, and object type. Use **sys.dm_os_buffer_descriptors** and sys.allocation_units, sys.partitions, sys.objects, and sys.indexes|
|[Memory occupation by cache plans](Memory/CachePlanInMemory.md)|Quantity of memory occupied by cache plan group by plan type e object type using **sys.dm_exec_cached_plans**|
|[Hoc Queries Execution Plans in Cache](Memory/HocQueriesPlanInCache.md)|retrieve information about ad hoc queries that have been cached by SQL Server using **sys.dm_exec_cached_plans**|
|**SECURITY**||
|[Info Users and Logins](Security/InfoUserLogins.md)|List of Logins and Users in a SQL Server instance|
|[Create a Login on Azure SQL Database](Security/CreationNewLoginSQLAzure.md)|Example code to create Logins and Users on an Azure Sql Database|
|[Transfer logins between instances of SQL Server](Security/sp_help_revlogin.md)|Transfer logins and passwords between instances of SQL Server with  **sp_help_revlogin**|
|[List and fix OrphanUsers](Security/OrphanUsers.md)|Use of **sp_change_users_login** to fix Orphan Users|
|[Rights View Database List](Security/VisibilityToOnlyADataBase.md)| Give to a User the right to see only one database |
|||
|**TUNING**||
|[CPU Used by Sql Server](Tuning/CPU_UsedBySqlServer.md)|% of CPU used by Sql server using **sys.dm_os_ring_buffers** |
|[CPU Used by databases](Tuning/CPU_UsedByDatabase.md)|CPU used by databases using Query Plan data using **sys.dm_exec_query_stats** and **sys.dm_exec_plan_attributes**|
|[Total Wait Time](Tuning/TotalWaitingTime.md)|Total time spent waiting for CPU (signal waits) and the total time spent waiting for resources (resource waits) using **sys.dm_os_wait_stats**|
|[Top Queries by CPU](Tuning/TopQueryByCPU.md)|List of Query most expensive in term of CPU using **sys.dm_exec_query_stats** and **query_stats.query_hash**|
|||
|**T-SQL**|
|[Get Code of Objects](TSql/GetCodeObjects.md)|Query to get the code of views, functions..|
|[Product of sequence](TSql/ProductSequence.md)|A way to obtain an aggregation where the item are multiplication|
|[Binary, Decimal, Hexadecimal conversion](TSql/ConversionDecimalBinaryHex.md)|Functions to convert Decimal, Binary, Hexadecimal number among them|
|||
|**T-SQL - Algorithmins**|
|[Pearson Test](TSQL-Algorithms/Pearson.md)|Code for calculating the Pearson correlation coefficient|
|||
|**SSAS**|
|[Tabular To Muldimensional](SSAS/ChangeEngineMultidimensionaleToTabular.md)|Steps to Change SSAS Engine from Tabular To Muldimensional|
