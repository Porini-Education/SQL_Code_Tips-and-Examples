# Update with Join

Example to update a table with the values of another table using a join

```SQL

--- table to update
create table #Master 

( Codice varchar(20) not null,
  Valore int not null,
  AltroCampo varchar(20) not null
  )
;
GO

insert into #Master values
('Alfa',100,'Milano'),('Beta', 200,'Napoli'),('Gamma', 300, 'Torino'),('Delta',400,'Roma');

--- table with new values
create table #Aggiornamenti
(Codice varchar(20) not null,
 NuovoValore int not null
 )
 ;
 GO

 insert into #Aggiornamenti values 
 ('Alfa',101),('Gamma',301)

 ---Update
        update #Master
        set valore = b.NuovoValore
        from #Master a
        left outer join #Aggiornamenti b
        on a.Codice = b.Codice
        where not b.NuovoValore is null
        ;
        GO

-- Result
select * from #Master
```
