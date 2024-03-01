USE ordenes;
GO

SELECT SCHEMA_NAME(schema_id) AS SchemaName
FROM sys.schemas
WHERE SCHEMA_NAME(schema_id) = 'WMS';