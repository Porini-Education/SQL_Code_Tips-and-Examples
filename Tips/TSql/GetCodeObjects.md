# Get the code of objects (Views, Functions..)

``` SQL
SELECT 
    sm.object_id, 
    o.name, 
    o.type, 
    sm.definition 
FROM sys.sql_modules sm
    INNER JOIN sys.objects O
    ON sm.object_id = o.object_id
```
