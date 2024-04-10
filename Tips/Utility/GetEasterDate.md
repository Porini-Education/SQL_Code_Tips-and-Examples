
# Return Easter's date for a specific year

This function implements the algorithm by Johann Carl Friedrich Gauss (1777-1855) to calculate the date of Easter Sunday for a given year.

```sql
CREATE FUNCTION dbo.GetEasterDate(@year int)
RETURNS DATE
AS
BEGIN
    DECLARE @a int, @b int, @c int, @d int, @e int, @f int, @g int, @h int, @i int, @k int, @l int, @m int, @n int, @p int
    SELECT @a = @year % 19, @b = @year / 100, @c = @year % 100, @d = @b / 4, @e = @b % 4
    SELECT @f = (@b + 8) / 25, @g = (@b - @f + 1) / 3, @h = (19 * @a + @b - @d - @g + 15) % 30
    SELECT @i = @c / 4, @k = @c % 4, @l = (32 + 2 * @e + 2 * @i - @h - @k) % 7
    SELECT @m = (@a + 11 * @h + 22 * @l) / 451, @n = (@h + @l - 7 * @m + 114) / 31
    SELECT @p = (@h + @l - 7 * @m + 114) % 31
    RETURN DATEFROMPARTS(@year, @n, @p + 1)
END
```

You can use this function to get the date of Easter for a specific year like this:

```sql
SELECT dbo.GetEasterDate(2022) -- Replace 2022 with the year you want
```

This will return the date of Easter Sunday for the given year.

```sql
/*
    FUNCTION: dbo.GetEasterDate

    DESCRIPTION:
    This function calculates the date of Easter for a given year.

    PARAMETERS:
    - @year: The year for which to calculate the Easter date.

    RETURNS:
    - DATE: The date of Easter for the given year.
*/

CREATE FUNCTION dbo.GetEasterDate(@year int)
RETURNS DATE
AS
BEGIN
    DECLARE @a int, @b int, @c int, @d int, @e int, @f int, @g int, @h int, @i int, @k int, @l int, @m int, @n int, @p int
    SELECT @a = @year % 19, @b = @year / 100, @c = @year % 100, @d = @b / 4, @e = @b % 4
    SELECT @f = (@b + 8) / 25, @g = (@b - @f + 1) / 3, @h = (19 * @a + @b - @d - @g + 15) % 30
    SELECT @i = @c / 4, @k = @c % 4, @l = (32 + 2 * @e + 2 * @i - @h - @k) % 7
    SELECT @m = (@a + 11 * @h + 22 * @l) / 451, @n = (@h + @l - 7 * @m + 114) / 31
    SELECT @p = (@h + @l - 7 * @m + 114) % 31
    RETURN DATEFROMPARTS(@year, @n, @p + 1)
END

```

## Example

``` SQL
select dbo.GetEasterDate(2024)
```
