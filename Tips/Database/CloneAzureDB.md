# Simple method to make a copy of a database and set immediately online (on Azure)

**Supported ONLY on Azure SQL Database**

## Clone on the same logical server

Azure offers a very simple way to "clone" an Azure SQL database.

Just submit the following query:
``` SQL
CREATE DATABASE NuovoDB AS COPY OF DBOriginale;
```


-	The new database is created on the same Logical SQL Server that hosts the original one
-	The query must be executed on the master of the server hosting the original database and the account that executes it must have full rights on the server.


Compared to the standard procedure that requires creating the backup and then restoring it, this method is much simpler and more immediate.


## Clone on different Tenant/Subscription/LogicalSQLServer


On the *Target* (new) instance by logging in with a sysadmin user (e.g. ENTER Admin) in the *master database* context

``` SQL
-- Create login
CREATE LOGIN migration
	WITH PASSWORD = '123qweasdZXC,.-' 
GO

-- Create user
CREATE USER [migration] FOR LOGIN migration
GO

-- Adding user to dbmanager role
ALTER ROLE [dbmanager]
ADD MEMBER [migration]
GO

-- SID Recovery
SELECT [sid] FROM sysusers WHERE [name] = 'migration'
-- 0x01060000000000640000000000000000D59F25634DE723498E887EB4B21CFBA7

``` 
CHANGE SERVER

On the *Source* (old) instance by logging in with a sysadmin user (e.g. ENTER Admin) in the *master database* context

``` SQL

-- Create login - The password and SID are those of the user created for the target server. The SID has no quotation marks!
CREATE LOGIN [migration] WITH PASSWORD = '123qweasdZXC,.-', SID = 0x01060000000000640000000000000000D59F25634DE723498E887EB4B21CFBA7;
GO

-- Create user
CREATE USER [migration] FOR LOGIN [migration]
GO

-- Adding user to dbmanager role
ALTER ROLE [dbmanager]
ADD MEMBER [migration]
GO
```
CHANGE CONTEXT

On the *Source* (old) instance by logging in with a sysadmin user (e.g. ENTER Admin) in the ***user database to migrate*** context

``` SQL

-- Create user
CREATE USER [migration] FOR LOGIN [migration];
GO

-- Adding user to db_owner role
ALTER ROLE [db_owner]
ADD MEMBER [migration]

```
CHANGE SERVER

On the *Target* (new) instance by LOGGIN WITH THE NEW LOGIN [migration]

Note: If the database to be migrated already exists, you must drop it first.

``` SQL
-- Il nome server è SENZA .database.windows.net
CREATE DATABASE [OberalpDev-Membership_COPIA] AS COPY OF asqlcsp01.[OberalpDev-Membership] 
GO

```

Even if the statement completes successfully, you'll need to wait at least
a couple of minutes before the tables and other objects become visible
on the destination server (behind the scenes, the data is copied asynchronously).

