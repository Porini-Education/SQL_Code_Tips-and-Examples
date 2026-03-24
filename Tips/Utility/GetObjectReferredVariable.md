


SELECT DISTINCT
    OBJECT_SCHEMA_NAME(referencing_id) AS SchemaName,
    OBJECT_NAME(referencing_id) AS ObjectName,
    o.type_desc AS ObjectType
FROM sys.sql_expression_dependencies sed
INNER JOIN sys.objects o ON sed.referencing_id = o.object_id
WHERE referenced_entity_name = 'AnagraficaLibri'
    AND referenced_schema_name = 'ares'
    AND COL_NAME(referenced_id, referenced_minor_id) = 'Collane'
    AND o.type IN ('V', 'P')  -- Views and Stored Procedures only
ORDER BY ObjectType, SchemaName, ObjectName;