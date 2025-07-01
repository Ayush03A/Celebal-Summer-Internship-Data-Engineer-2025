WITH NumberedStation AS (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num
    FROM STATION
),
TotalRows AS (
    SELECT COUNT(*) AS total_count
    FROM STATION
)
SELECT ROUND(n.LAT_N, 4)
FROM NumberedStation n, TotalRows t
WHERE n.row_num = CEIL(t.total_count / 2);