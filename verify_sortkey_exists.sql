SET search_path to ods;

SELECT  *
FROM pg_table_def
WHERE 1 = 1
AND tablename = 'myTableName';