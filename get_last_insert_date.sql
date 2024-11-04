SELECT  sti.schema
       ,sti.table
       ,sq.endtime
       ,sq.querytxt
FROM
(
	SELECT  MAX(query)     AS query
	       ,tbl

	       ,MAX(i.endtime) AS last_insert

	FROM stl_insert i
	GROUP BY  tbl
	ORDER BY  tbl

) inserts
JOIN stl_query sq

ON sq.query = inserts.query
JOIN svv_table_info sti

ON sti.table_id = inserts.tbl
WHERE 1 = 1
AND sti.schema = 'mySchemaName'
AND sti.table = 'myTableName'

ORDER BY inserts.last_insert desc;