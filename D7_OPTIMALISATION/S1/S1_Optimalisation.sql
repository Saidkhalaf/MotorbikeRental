SELECT
    rentalStatus,
    COUNT(rentalID) AS total_rentals,
    ROUND(AVG(totalCost),2) AS avg_cost,
    MAX(totalCost) AS max_cost,
    MIN(totalCost) AS min_cost,
    SUM(totalCost) AS total_revenue
FROM Rental
WHERE rentalStartDate BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-31', 'YYYY-MM-DD')
  AND totalCost BETWEEN 100 AND 2000
GROUP BY rentalStatus
ORDER BY total_rentals DESC;


BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(
            ownname     => 'PROJECT',
            tabname     => 'RENTAL',
            estimate_percent => DBMS_STATS.AUTO_SAMPLE_SIZE,
            method_opt  => 'FOR ALL COLUMNS SIZE AUTO'
        );
END;

SELECT
    segment_name,
    segment_type,
    SUM(bytes/1024/1024) AS MB,
    (SELECT COUNT(*) FROM RENTAL) AS table_count
FROM
    dba_segments
WHERE
        segment_name = 'RENTAL'
GROUP BY
    segment_name, segment_type;
