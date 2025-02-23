--Stap 5: MAAK GEBRUIKERS AAN (De roles)

--Maak een role die: op de middelste tabel van je 2 diep (tabel Y) alles mag: DML en DDL.
CREATE ROLE maintenanceRole;
GRANT ALTER ON MAINTENANCE TO maintenanceRole;
GRANT CREATE SESSION TO maintenanceRole;
GRANT CREATE TABLE TO maintenanceRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON MAINTENANCE TO maintenanceRole;
--Maak nog een role aan die: op de onderste tabel (tabel Z) gegevens kan toevoegen, bekijken en verwijderen.
CREATE ROLE employeeRole ;
GRANT SELECT, INSERT, DELETE ON Employee TO employeeRole;

--Maak een user aan die de rechten van beide roles krijgt.
CREATE USER said IDENTIFIED BY DWVCWdfV_11333;

-- Koppel de eerder gemaakte rollen aan de nieuwe gebruiker
GRANT employeeRole TO SAID;
GRANT maintenanceRole TO SAID;


----------------********* Stap 6: Views aanmaken ************-------------------

-- Maak een view aan die gegevens combineert uit de gekoppelde tabellen
CREATE OR REPLACE VIEW EmpolyeeMaintenance  AS

SELECT e.employeeID, e.firstName, e.lastName, e.position, m.MAINTENANCEID, e.DEPARTMENTID
FROM Employee e
         JOIN MAINTENANCE m on e.MAINTENANCEID = m.MAINTENANCEID
where FIRSTNAME in ('Sophia', 'Emily');

-- Verleen de juiste rechten aan de gebruiker om gegevens toe te voegen aan een van de tabellen
GRANT select ,INSERT, UPDATE, DELETE  ON EmpolyeeMaintenance TO said;

--laat de usernaam zien
select USER FROM DUAL;

--Geef de output van de correcte dictionary tables voor objecten en system privileges
--Voor objecten:
SELECT TABLE_NAME FROM DICTIONARY;
--Voor systeemprivileges:
SELECT * FROM SESSION_PRIVS;

--Op te leveren bewijzen voor Stap 5 en 6:
--voeg een rij toe in de key preserved table via de view
--Je gebruikt geen hardcoded ID’s in dit INSERT statement.
INSERT INTO MAINTENANCE (MAINTENANCEDESCRIPTION, CHASSISNR, MAINTENANCETYPE, MAINTENANCEDATE)
VALUES (
           'Electrical System Check',
           (select CHASSISNR from MAINTENANCE where CHASSISNR = 'JH2RC39038M000001' and MAINTENANCEDESCRIPTION = 'Oil Change'),
           'Emergency Maintenance',
           TO_DATE('2024-02-15', 'YYYY-MM-DD')
       );
rollback ;
commit ;

select * from MAINTENANCE;

-- Voeg een rij toe aan de view EmployeeMaintenance
INSERT INTO EmpolyeeMaintenance (firstName, lastName, position, MAINTENANCEID, DEPARTMENTID)
VALUES (
           'Said',
           'Khalaf',
           'Sales Manager',
           (SELECT MAINTENANCEID FROM MAINTENANCE where MAINTENANCEID = 4),
           (select DEPARTMENTID from EMPLOYEE where firstName = 'Emily' and lastName = 'Brown')
       );
rollback ;
COMMIT;


select * from MAINTENANCE;

select * from EMPLOYEE;



