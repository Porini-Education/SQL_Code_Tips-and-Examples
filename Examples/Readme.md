# Tables of Contents

|Task|Description|
|---|---|
|**INSTANCE**|
|[DAC](Instance/DAC.md)| Dedicated Administrative Connection DAC Example|
|[Query Azure SQL](Instance/Example_LinkedServer_SQLAzure.sql)|How to query an Azure SQL Database from an on-premise SQL Server using a Linked Server|
|[Query Excel files](Instance/Example_LinkedServer_Excel.sql)|Complete example with documentation from SQLShack to query an Excel file usign a Linked Server|
|**DATABASE**|
|[Emergency Mode](Database/EmergencyMode.md)|Example of use of Emergency Mode|
|[Attach & Detach](Database/Example_Attach_Detach.sql)|Example of a detach and attach of a database from an instance to another|
|[Manage Virtual LOG](Database/Example_manage_LOG_files_virtual.sql)|Example with documentation about how to manage the SQL Virtual LOG Files (VLF)|
|[Multi LOG files](Database/Example_Management_LOG_files.sql)|Complete example to add and remove a new LOG file|
|[Table Partitioning](Database/Example_Partitioning.md)| Complete example of how to define and use the partitioning of a table|
|[Change Tracking](Database/Example_ChangeTracking.md)|Example of of how to set and use the Change Tracking|
|**QUERY and Functions**|
|[MERGE](Query/DML_MERGE.sql)|Show a complete example of how to use the `MERGE` statement|
|[Update with Join](Query/UpdateWithJoin.md)| An Example to update a table with the values of another table using a join|
|[Update in Chunk](Query/UpdateInChunks.md)|Using a loop to update rows in a table in batches, with a delay between each batch|
|[Use of Json Functions](Query/ExampleJsonQuery2.md)|Getting from a Json that contains data about exams a row for each exam with Name, Surname of person and Exam Name and Date Example: getting from a Json that contains data about exams a row for each exam with Name, Surname of person and Exam Name and Date|
|[Import csv data from a Azure Container](Query/REST_AzureContainerImportAzureBlobCsv.md)| How to insert in a table csv data stored in a Azure Container using BULK INSERT |
|[REST Azure Container](Query/REST_AzureContainer.md)| How to read a file stored in an Azure container |
|[REST Azure FileShare](Query/REST_AzureFileShare.md)| How to deal with an Azure File Share: create, load, read, delete a file|
|[REST all endpoint](Query/REST_ExternalResources.md)| How to reach any endpoint outside of the Azure infrastructure |
|[Time Zones](Query/Example_At_Time_Zone.sql)|Example to use timezones|
|[Bit Manipulation](Query/BitManipulationFunctions.md) | TSQL Function to read, wrie and count bits in a integer or a binary value  |
|[Temporal Table](Query/TemporalTable.md)|The temporal table allows you to natively implement a temporal version of the system allowing you to retrieve data at a certain point in time |
|[Rollback If Error](Query/AutomaticRollBackIfError.md)|Two ways to assure a rollback in case of an error|
|[New TSQL Functions in SQL 2022](Query/TSQL-2022.md) | What's new in SQL Server 2022 |
|**SECURITY**|
|[Dynamic Data Masking](Security/DynamicDataMasking.md)|Dynamic Data Masking limit data exposure by masking it to nonprivileged users |
|[Row Level Security](Security/RowLevelSecurity.md)|Row Level Security allow to control access to rows by a security predicate defined as an inline table-valued function |
|**AZURE**|
|[Azure Database Cross Query](Azure/CrossAzureDBQuery.md) | Querying across databases in Azure SQL Database |
|[Elastic Job](Azure/ElasticJob.md) | Elastic Job: a way to run periodically scheduled Transact-SQL (T-SQL) queries and perform maintenance tasks against one or many Azure SQL databases |
