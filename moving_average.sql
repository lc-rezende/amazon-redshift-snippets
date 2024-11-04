SELECT  tb1.eventdate
       ,tb2.grosssales
       ,AVG(tb1.grosssales) OVER(ORDER BY  tb1.eventdate ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS avg_sales
FROM
(
	SELECT  trunc(d.eventdate) "eventdate"
	       ,SUM(d.grosssales) "grosssales"
	FROM reports.discountrevenue d
	WHERE 1 = 1
        AND trunc(d.eventdate) >= cast('2020-01-01' AS date)
        AND d.channelid = 1
	GROUP BY  trunc(d.eventdate)
) tb1
INNER JOIN
(
	SELECT  trunc(d.eventdate) "eventdate"
	       ,SUM(d.grosssales) "grosssales"
	FROM reports.discountrevenue d
	WHERE 1 = 1
        AND trunc(d.eventdate) >= cast('2020-01-01' AS date)
        AND d.channelid = 1
	GROUP BY  trunc(d.eventdate)
) tb2
ON tb1.eventdate = tb2.eventdate
ORDER BY 1