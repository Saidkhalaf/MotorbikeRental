select segment_name,
       segment_type,
       sum(bytes/1024/1024)    MB ,
       (select   COUNT(*) FROM SERVICE) as table_count
from dba_segments
where segment_name= 'SERVICE'
group by segment_name, segment_type;

BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(OWNNAME => 'PROJECT', TABNAME => 'SERVICE');
END;


-- ANALYTISCHE QUERY
-- Deze query geeft de voornaam en achternaam van elke medewerker terug,
-- samen met het aantal services dat ze hebben.
EXPLAIN PLAN FOR
SELECT e.firstName, e.lastName, COUNT(s.serviceId) AS Aantal_Services
FROM SERVICE s
         JOIN Employee e ON s.EMPLOYEEID = e.EMPLOYEEID
         JOIN Department d ON e.departmentID != d.departmentID
GROUP BY e.firstName, e.lastName
ORDER BY Aantal_Services DESC;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

SELECT USER FROM DUAL;

GRANT CREATE ANY VIEW TO ADMIN;
GRANT ALL PRIVILEGES TO ADMIN;

GRANT CREATE TABLE TO ADMIN;
GRANT CREATE TABLE TO PROJECT;

-------------------------------------------------- Materialized View --------------------------------------------------
CREATE MATERIALIZED VIEW most_services_per_employee_mv AS
SELECT e.firstName, e.lastName, COUNT(s.serviceId) AS Aantal_Services
FROM SERVICE s
         JOIN Employee e ON s.EMPLOYEEID = e.EMPLOYEEID
         JOIN Department d ON e.departmentID != d.departmentID
GROUP BY e.firstName, e.lastName
ORDER BY Aantal_Services DESC;

GRANT CREATE TABLE TO PROJECT;
GRANT CREATE ANY VIEW TO PROJECT;

BEGIN
    DBMS_STATS.GATHER_TABLE_STATS(OWNNAME => 'PROJECT', TABNAME => 'SERVICE');
END;


EXPLAIN PLAN FOR
select * from most_services_per_employee_mv;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);




