/*
	Generate the scripts to alter all columns in database tables to use the collate declared at the very beginning.
	Once you have the script in the Messages tab you can select which one to execute.
*/

DECLARE @collate nvarchar(100)
	,@SchemaName nvarchar(255)
	,@TableName nvarchar(255)
	,@ColumnName nvarchar(255)
	,@column_id int
	,@DataType nvarchar(255)
	,@max_length int
	,@is_nullable bit
	,@sql nvarchar(max)
	,@sql_column nvarchar(max)

SET @collate = 'SQL_Latin1_General_CP1_CI_AS';

DECLARE local_change_cursor CURSOR FOR

    SELECT 
		SchemaName = SCHEMA_NAME(t.schema_id)
        ,TableName = t.name 
        ,ColumnName = c.name
        ,s.Name
        ,c.max_length
        ,c.is_nullable
        ,c.column_id 
	FROM sys.tables t INNER JOIN
         sys.columns c ON c.object_id=t.object_id INNER JOIN
         sys.types s ON s.user_type_id=c.user_type_id
	WHERE 1=1
 --(c.collation_name LIKE 'SQL_Latin1_General_CP1254_CI_AS' OR c.collation_name LIKE 'Turkish_CI_AS')  
		AND t.type like 'U'
		--and SCHEMA_NAME(t.schema_id) ='cfg'
		--and t.name = '_TestCollation'
		AND t.name not like 'spt%'
		AND t.name not like 'MSrep%'
		AND c.collation_name is NOT NULL
	ORDER BY schemaname 

    OPEN local_change_cursor
    FETCH NEXT FROM local_change_cursor
    INTO @SchemaName,@TableName, @ColumnName, @DataType, @max_length,@is_nullable, @column_id

    WHILE @@FETCH_STATUS = 0
    BEGIN

        DECLARE @nullable nvarchar(255),
                @length   varchar(10);

        IF @is_nullable = 0
            BEGIN
                SET @nullable = ' NOT NULL';
            END
        ELSE 
            BEGIN
                SET @nullable = ' NULL';
            END

            IF @DataType IN ('nchar', 'nvarchar') AND @max_length != -1 
                BEGIN
                    SET @length= CAST(@max_length / 2 AS VARCHAR(10));
                END 
            ELSE IF @DataType IN ('char', 'varchar') AND @max_length != -1 
                BEGIN
                    SET @length= CAST(@max_length AS VARCHAR(10));
                END 
            ELSE IF @DataType IN ('nchar', 'nvarchar', 'char', 'varchar') AND @max_length = -1 
                BEGIN
                    SET @length= 'MAX';
                END 
            ELSE 
                BEGIN
                    SET @length= CAST(@max_length AS VARCHAR(10));
                END

        BEGIN TRY
            --IF @schema_name <> 'dbo'
                --BEGIN
                    SET @sql = 'ALTER TABLE ['+ @SchemaName +'].[' + @TableName + '] ALTER COLUMN [' + @ColumnName + '] ' + @DataType + '(' + @length + ') COLLATE ' + @collate + ''+ @nullable+' '
                    PRINT @sql
                    --EXEC sp_executesql @sql
                --END
        END TRY
        BEGIN CATCH
            PRINT 'ERROR: Some index or constraint rely on the column' + @ColumnName + '. No conversion possible.'
            PRINT @sql
        END CATCH

        FETCH NEXT FROM local_change_cursor
        INTO @schemaName,@tableName, @columnName, @dataType, @max_length,@is_nullable, @column_id

    END

CLOSE local_change_cursor
DEALLOCATE local_change_cursor

GO