# History of Databases Backups

**ONLY FOR On Premise NOT AZURE**

``` SQL
select 
    b.database_name, b.backup_start_date,mf.physical_device_name
FROM msdb.dbo.backupset b
    inner join msdb.dbo.backupmediafamily mf  
    on b.media_set_id = mf.media_set_id 
order by backup_start_date desc
```
