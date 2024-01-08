/*
	It retrieves the features of the database in the current instance.
	Physical Name, Type, State and Sizes
*/

IF OBJECT_ID('TempDB.dbo.#DatabaseInfo') IS NOT NULL
  DROP TABLE #DatabaseInfo
GO


CREATE TABLE #DatabaseInfo(
	[DateSample] [datetime] NOT NULL,
	[ServerName] [varchar](50) NULL,
	[InstanceName] [varchar](50) NULL,
	[DatabaseID] [smallint] NULL,
	[DataBaseName] [nvarchar](128) NULL,
	[FileGroupName] [sysname] NULL,
	[FileId] [int] NOT NULL,
	[FileName] [sysname] NOT NULL,
	[DiskName] [nvarchar](1) NULL,
	[PhysicalName] [nvarchar](260) NOT NULL,
	[Tipologia] [nvarchar](60) NULL,
	[Stato] [nvarchar](60) NULL,
	[Size_MB] [numeric](26, 1) NULL,
	[SpaceUsed_MB] [numeric](26, 1) NULL,
	[Max_Size_MB] [numeric](26, 0) NULL,
	[GrowthInPct] [bit] NOT NULL,
	[Growth_MB] [numeric](26, 1) NULL
) ;

GO

declare @STRFile varchar(2000) = ' use [?]


select 
		convert(smalldatetime,getdate()) as DateSample,
		CONVERT(varchar(50), SERVERPROPERTY(''ServerName'')) AS ServerName,

		(CASE WHEN CONVERT(varchar(50), SERVERPROPERTY(''InstanceName'')) IS NULL
			THEN ''Default Instance''
			ELSE CONVERT(varchar(50), SERVERPROPERTY(''InstanceName''))
		END) AS InstanceName,

		db_id() as DatabaseID,
		Db_name (db_id()) as DataBaseName,
		fg.Name as FileGroupName,
		fi.file_id as FileId,
		fi.name as FileName,
		substring (fi.physical_name,1,1) as DiskName,
		fi.physical_name as PhysicalName,
		fi.type_desc as Tipologia,
		fi.state_desc as Stato,
		fi.Size * 8. / 1024 as Size_MB,

		convert ( bigint, fileproperty(fi.name, ''SpaceUsed'')) * 8 / 1024. as SpaceUsed_MB,
		fi.max_size * 8. / 1024  as Max_Size_MB,
		fi.is_percent_growth as GrowthInPct,
		case
			when fi.is_percent_growth = 0 then fi.Growth * 8. / 1024 
			else (fi.Size * 8. / 1024) * fi.Growth /100 
		end as Growth_MB 
	

	from sys.database_files fi
	left outer join sys.filegroups fg
	on fi.data_space_id = fg.data_space_id' ;


insert into #DatabaseInfo
EXECUTE master.dbo.sp_msforeachdb  @STRFile;

select * from #DatabaseInfo
order by DataBaseName, FileGroupName, FileId
;
GO