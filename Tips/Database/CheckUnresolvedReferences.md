# Check Unresolved References

To check for unresolved references in views, functions, or stored procedures in an Azure SQL Database, you can use the `sys.sql_expression_dependencies` system view. This view lists the dependencies on objects and columns, and can be used to identify missing objects.

If referenced_id IS NULL or is_ambiguous = 0  then there is a unresolved reference in this object.

``` SQL
SELECT
    OBJECT_SCHEMA_NAME(referencing_id) AS referencing_object_schema,
    OBJECT_NAME(referencing_id) AS referencing_object_name,
    OBJECTPROPERTYEX(referencing_id, 'BaseType') AS referencing_object_type,
    referenced_database_name,
    referenced_schema_name,
    referenced_entity_name
    --,*
FROM
    sys.sql_expression_dependencies
WHERE 
    is_ambiguous = 0  
    AND referenced_id IS NULL
    --AND is_cross_database = 0  -- ONLY FOR ON PREMISE Database
    ;

```
