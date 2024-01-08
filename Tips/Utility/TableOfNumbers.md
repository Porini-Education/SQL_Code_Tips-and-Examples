# Creation of a Tables of Numbers

``` SQL
create function dbo.fn_nums (@n as bigint) 
returns table
as
return 

with
L0 as (select 1 as c union all select 1),
L1 as (select 1 as c from L0 as A, L0 as B),
L2 as (select 1 as c from L1 as A, L1 as B),
L3 as (select 1 as c from L2 as A, L2 as B),
L4 as (select 1 as c from L3 as A, L3 as B),
L5 as (select 1 as c from L4 as A, L4 as B),
nums as  (select row_number () over (order by c) as n from L5)
select n from nums where n <= @n
;
GO
```

## Since SQL Server 2022 use GENERATE_SERIES

``` SQL
select * from GENERATE_SERIES ( 1,10,1);

select * from GENERATE_SERIES ( 1.,2.,0.1);

select * from GENERATE_SERIES ( 100, 0,-25 );
```
