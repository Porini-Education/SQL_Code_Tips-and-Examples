# Creation of a new Login in Sql Azure Database

[Microsoft Learn Documentation](https://learn.microsoft.com/en-us/azure/azure-sql/database/logins-create-manage?view=azuresql)
[Microsoft Learn Documentation: Create a Login](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-login-transact-sql?view=azuresqldb-current&preserve-view=true#examples-1)

## Create and Manage Logins Users and Permissions

``` SQL
-- On MASTER DATABASE create the Login
CREATE LOGIN TestUser01
    WITH PASSWORD = 'Pippo1621$'
GO

-- To allow connection to the master database, create the user on the master.
-- Without the user on the master, the connection must be made by specifying the user database.
CREATE USER TestUser01 FROM LOGIN TestUser01;
GO

-- On USER DATABASE create the User
CREATE USER TestUser01 FROM LOGIN TestUser01;

-- Add User to Database Fixed Roles
EXEC sp_addrolemember 'db_datareader', 'TestUser01';

-- Other Fixed Roles
--db_owner
--db_ddladmin
--db_datawriter
--db_datareader
--db_denydatawriter
--db_denydatareader

-- To remove user from a role
EXEC sp_droprolemember 'db_datareader', 'TestUser01';


-- Grants permissions on a securable to a principal
-- Sintax: GRANT <some permission> ON <some object> TO <some user, login, group schema>
GRANT SELECT ON anagrafica.Cliente TO TestUser01;

-- Other permissions
-- ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT, UPDATE, VIEW DEFINITION, CREATE TABLE

-- GRANT select TO all object of SCHEMA
GRANT SELECT ON SCHEMA::anagrafica TO TestUser01;

-- Deny SELECT on a specific table
DENY SELECT ON anagrafica.ClientiAttivi TO TestUser01;


GRANT TAKE OWNERSHIP 
ON SCHEMA::datavis TO DataVisUser WITH GRANT OPTION
GO


-- CREATE LOGIN FROM Microsoft Entra ID (ex Azure Active Directory)

--- On Master Database
CREATE USER [TestUser01@porinieducation.onmicrosoft.com] 
FROM EXTERNAL PROVIDER ;

-- On User Database
CREATE USER [TestUser01@porinieducation.onmicrosoft.com] 
FROM EXTERNAL PROVIDER ;  

-- Add to fixed role
EXEC sp_addrolemember 'db_datareader', 'TestUser01@porinieducation.onmicrosoft.com' ;

GRANT ALTER, SELECT,DELETE, EXECUTE, INSERT ON SCHEMA::anagrafica TO [TestUser01@porinieducation.onmicrosoft.com];
GRANT CREATE TABLE TO [TestUser01@porinieducation.onmicrosoft.com];

```

## Create a Contained User

<https://learn.microsoft.com/en-us/sql/relational-databases/security/contained-database-users-making-your-database-portable>

It's possible to create only the user without the login in the master db.
In this case, the connection must be done indicated in a explicit way the database.

```sql
-- Connect to the User Database
CREATE USER YourUser WITH PASSWORD = 'YourPassword';


CREATE USER [YourUser@YourAzureADDomain] FROM EXTERNAL PROVIDER;
```
