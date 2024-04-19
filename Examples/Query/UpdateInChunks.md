# Update a table in chunks of rows

Using a loop to update rows in a table in batches, with a delay between each batch

## Create test table

``` SQL
select 
    value as Numero,
    'alfa' as Codice,
    NEWID() as Id
into dbo.t10
    from GENERATE_SERIES ( 1,10000,1);
GO
```

## Update the table in batch

``` SQL
DECLARE @rows INT
SET @rows = 1

WHILE @rows > 0
BEGIN
    BEGIN TRANSACTION

    UPDATE TOP (1000) dbo.t10 
    SET codice = 'Zulu'
    WHERE codice <> 'zulu'

    SET @rows = @@ROWCOUNT

    COMMIT TRANSACTION

    WAITFOR DELAY '00:00:02' 
END

```
