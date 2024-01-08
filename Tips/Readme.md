# Tables of Contents

|Task|Description|
|---|---|
|**UTILITY**|
|[Table of Numbers](Utility/TableOfNumbers.md)|Creation of a Table of Numbers|
|[Get Internal Unique Record ID](Utility/GetInternalRecordId.md)|Use of undocumented functions **%%physloc%%**  and **sys.fn_PhysLocFormatter** to get the ID of a record.Useful to remove duplicate records.|
|**INSTANCE**|
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
|||
|**DATABASE**|
|[Info Databases](Database/Info_Database.sql)|Returns the attributes of all databases of the instance and the info about the last backup|
|[Info Database Object](Database/Info_Database_Object.sql)|List of UserTable or View in a single database: on-prem and on-cloud|
|[Info DB Files](Database/Info_DB_Files.sql)|It retrieves the features of the database in the current instance|
|[Info Change Tracking](Database/Info_ChangeTraking.md)|Returns a row with the name of the database and the name of the table for all DBs and Tables with Change Tracking Enabled|
|[Database Backups History](Database/DatabaseBackupHistory.md)|List the times of all db's backuops|
|||
|**TABLES**|
|[Change Field Collate](Tables/Change_Field_Collate.sql)|Generate the scripts to alter the collation of columns in the database|
|[Compressed Tables](Tables/Compressed_Tables.sql)|Returns a list with all the compressed tables in the queried database|
|[Database Columns](Tables/Dizionario_colonne.sql)|Returns the attributes of each field of the database tables|
|[Table Sizes](Tables/Info_Tables_Size.sql)|Returns, for each table, the number of rows, the occupied and allocated space and the date of the last scan, seek, lookup and update operation|
|||
|**SECURITY**||
|[Info Users and Logins](Security/InfoUserLogins.md)|List of Logins and Users in a SQL Server instance|
|[Create a Login on Azure SQL Database](Security/CreationNewLoginSQLAzure.md)|Example code to create Logins and Users on an Azure Sql Database|
|[Transfer logins between instances of SQL Server](Security/sp_help_revlogin.md)|Transfer logins and passwords between instances of SQL Server with  **sp_help_revlogin**|
|[List and fix OrphanUsers](Security/OrphanUsers.md)|Use of **sp_change_users_login** to fix Orphan Users|
|[Rights View Database List](Security/VisibilityToOnlyADataBase.md)| Give to a User the right to see only one database |
|||
|**T-SQL**|
|[Get Code of Objects](TSql/GetCodeObjects.md)|Query to get the code of views, functions..|
|[Product of sequence](TSql/ProductSequence.md)|A way to obtain an aggregation where the item are multiplication|
|[Binary, Decimal, Hexadecimal conversion](TSql/ConversionDecimalBinaryHex.md)|Functions to convert Decimal, Binary, Hexadecimal number among them|
