/*

Returns, for each table, the number of rows, 
the occupied and allocated space 
and the date of the last scan, seek, lookup and update operation.

Must be run it in the context of the database to analyze.

*/

WITH spaceused AS
(
  SELECT
	s.[name] as SchemaName,
	OBJECT_NAME(so.object_id) as TableName,
    sys.dm_db_partition_stats.object_id
    ,reservedpages = SUM(reserved_page_count)
    ,it_reservedpages = SUM(ISNULL(its.it_reserved_page_count, 0))
    ,usedpages = SUM(used_page_count)
    ,it_usedpages = SUM(ISNULL(its.it_used_page_count, 0))
    ,pages = SUM(CASE
                   WHEN (index_id < 2) THEN (in_row_data_page_count + lob_used_page_count + row_overflow_used_page_count)
                   ELSE lob_used_page_count + row_overflow_used_page_count
                 END
                )
    ,row_Count = SUM(CASE WHEN (index_id < 2) THEN row_count ELSE 0 END)
  FROM
    sys.dm_db_partition_stats
  inner JOIN
    sys.objects so
		ON so.object_id = sys.dm_db_partition_stats.object_id

    inner join sys.schemas s
	on so.schema_id=s.schema_id

  OUTER APPLY
    (SELECT
       reserved_page_count AS it_reserved_page_count
       ,used_page_count AS it_used_page_count
     FROM
       sys.internal_tables AS it
     WHERE
     it.parent_id = object_id
     AND it.internal_type IN (202,204,211,212,213,214,215,216)
     AND object_id = it.object_id
  ) AS its
  WHERE
    so.type IN ('U', 'V')
  GROUP BY
    s.[name],OBJECT_NAME(so.object_id),sys.dm_db_partition_stats.object_id
),

cteUtilizzoIndici as
(
select
		--s.database_id DataBaseId,
		db_name (s.database_id) as DBName,

		--s.OBJECT_ID, 
		OBJECT_NAME(s.[object_id]) as 'TableName', 

		s.index_id,
		i.[name] as 'IndexName', 
		i.type_desc ,
		i.fill_factor,

        s.user_seeks,
        s.user_scans,
        s.user_lookups,
        s.user_updates,
        convert(smallDateTime,s.last_user_seek) as last_user_seek,
        convert(smallDateTime,s.last_user_scan) as last_user_scan,
        convert(smallDateTime,s.last_user_lookup) as last_user_lookup,
        convert(smallDateTime,s.last_user_update) as last_user_update,
		case
		when
			not(last_user_scan is null
			and last_user_lookup is null
			and last_user_seek is null
			--and last_user_update is null
			) then 1
		else 0
	end as UtilizzatoLettura,
	case
	when
			not(last_user_update is null)
		then 1
		else 0
	end as UtilizzatoScrittura

        from
            sys.dm_db_index_usage_stats as s

        inner join
            sys.indexes as i 
			on i.object_id = s.object_id 
			and i.index_id = s.index_id

        where
            s.database_id = db_id()
        and
            objectproperty(s.object_id, 'IsIndexable') = 1

),
cteUtilizzo
as
(
select
	TableName,
      max([last_user_scan]) as last_user_scan,
      max([last_user_lookup]) as last_user_lookup,
      max([last_user_seek]) as last_user_seek,
      max([last_user_update]) as last_user_update,
	  Max (UtilizzatoLettura) as UtilizzatoLettura,
	  Max(UtilizzatoScrittura) as UtilizzatoScrittura
	from 
		cteUtilizzoIndici
	group by      
		TableName
)

SELECT
	convert (smalldatetime, getdate()) as DateSample,
	db_name (db_id()) as DataBaseName,
	a.SchemaName,
	a.TableName,
	a.row_Count as NumberRows,
	coalesce(UtilizzatoLettura,0) as UtilizzatoLettura,
	coalesce(UtilizzatoScrittura,0) as UtilizzatoScrittura,
  Reserved_KB = (reservedpages + it_reservedpages) * 8 ,
  Data_KB = pages * 8 ,
  Index_KB = (CASE WHEN usedpages > pages THEN (usedpages - pages) ELSE 0 END) * 8 ,
  Unused_KB = (CASE WHEN reservedpages > usedpages THEN (reservedpages - usedpages) ELSE 0 END) * 8 ,
  last_user_scan,
  last_user_lookup,
  last_user_seek,
  last_user_update

FROM
  spaceused a
  left outer join cteUtilizzo b
  on OBJECT_NAME (a.object_id) = b.TableName

 -- left outer join sys.schemas sch 
	--on a.schema_id = sch.schema_id

ORDER BY
  Reserved_KB DESC
