# Get Info About Logins and Users

## List of all users in a SQL Server instance

``` SQL
SELECT name AS UserName, 
       dbname AS DefaultDatabase, 
       CASE WHEN isntname = 1 THEN 'Windows User' 
            WHEN isntgroup = 1 THEN 'Windows Group' 
            ELSE 'SQL User' END AS UserType
FROM sys.syslogins
WHERE name NOT LIKE '##%##' -- Exclude system users
ORDER BY name;

---

select 
    a.loginname, 
    b.is_disabled , 
    a.sysadmin, 
    a.securityadmin, 
    a.serveradmin, 
    a.dbcreator
from 
    sys.syslogins a 
    left outer join sys.server_principals b
on 
    a.name =b.name
--where sysadmin = 1 or securityadmin =1 
--or serveradmin = 1 or dbcreator =1
order by 
    a.loginname 
;
GO
```
