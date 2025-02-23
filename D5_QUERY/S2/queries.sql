-----*** Student 2****--------

SELECT 'Department' AS table_name, COUNT(*)  as TABEL_COUNT FROM Department
UNION ALL
SELECT 'Employee', COUNT(*) FROM Employee
UNION ALL
SELECT 'MotorBike2', COUNT(*) FROM MotorBike
UNION ALL
SELECT 'Maintenance', COUNT(*) FROM Maintenance;

-- Query 1: Employee, Department, Maintenance
SELECT mb.CHASSISNR, mb.MODEL, e.EMPLOYEEID, e.firstName, e.lastName,  e.position,
    d.name AS departmentName,
    d.location AS departmentLocation, m.MAINTENANCEID,
    m.maintenanceDescription,  m.maintenanceType,  m.maintenanceDate
FROM MOTORBIKE mb
         JOIN MAINTENANCE m ON m.CHASSISNR = mb.CHASSISNR
         JOIN EMPLOYEE e ON e.maintenanceID = m.maintenanceID
         join DEPARTMENT d on d.DEPARTMENTID = e.DEPARTMENTID;


    select * from MAINTENANCE;

-- Query: Maintenance ,MotorBike2 ,Employee

SELECT
    e.firstName AS EmployeeFirstName,
    e.lastName AS EmployeeLastName,
    e.position AS EmployeePosition,
    mb.registrationNr AS MotorbikeRegistration,
    mb.brand AS MotorbikeBrand,
    mb.model AS MotorbikeModel,
    m.maintenanceDescription AS MaintenanceDescription,
    m.maintenanceType AS MaintenanceType,
    m.maintenanceDate AS MaintenanceDate
FROM Department d
         JOIN Employee e ON d.departmentID = e.departmentID
         JOIN Maintenance m ON e.maintenanceID = m.maintenanceID
         JOIN MotorBike mb ON m.chassisNr = mb.chassisNr
where m.CHASSISNR = 'RFGTJH23456789012'

ORDER BY d.name, e.lastName DESC;

--bewijs ManufactureDate
INSERT INTO MotorBike (chassisNr, brand,REGISTRATIONNR, availabilityStatus, model, manufactureDate, rentalPricePerDay, COLOR)
VALUES ('JH2RC39038M000034', 'Honda','ABC123', 'Available', 'CBR600RR', TO_DATE('2025-05-01', 'YYYY-MM-DD'), 50.00, 'blue');
--van de oude motorabike
INSERT INTO MotorBike (CHASSISNR, registrationNr, brand, manufactureDate, model, color)
VALUES ('RFGTJH23456789012','DEF456', 'Yamaha', TO_DATE('2025-08-15', 'YYYY-MM-DD'), 'YZF-R1', 'Blue');

rollback ;

--Bewijs firstName
INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Bo', 'Johnson', 'HR Specialist', 3, (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='SPLDW45678912345'));














