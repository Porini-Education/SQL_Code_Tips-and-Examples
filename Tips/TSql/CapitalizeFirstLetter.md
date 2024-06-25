# Capitalize First Letter of every words of string

In this function the word separator are a blank or a -

```SQL
CREATE FUNCTION dbo.fn_CapitalizeFirstLetter (@InputString NVARCHAR(max))
    RETURNS NVARCHAR(max)
    AS
    BEGIN
        DECLARE @Result VARCHAR(MAX) = LOWER(@InputString)
        DECLARE @i INT = 1

        WHILE @i <= LEN(@Result)
        BEGIN
            IF @i = 1 OR SUBSTRING(@Result, @i - 1, 1) IN (' ', '-')
                SET @Result = STUFF(@Result, @i, 1, UPPER(SUBSTRING(@Result, @i, 1)))
            SET @i = @i + 1
        END

        SET @Result = REPLACE(@Result, '-', ' ')

        RETURN @Result
END
;
GO
```

## Example

```sql
select ares.fn_CapitalizeFirstLetter( 'liverani-pier-giorgio'); --> output 'Liverani Pier Giorgio'
```
