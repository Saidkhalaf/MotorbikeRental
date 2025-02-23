-- gegevens voor de Department-tabel
INSERT INTO Department (departmentID, name, location, tasks)
VALUES (1, 'Sales', 'Headquarters', 'Sales and marketing');

INSERT INTO Department (departmentID, name, location, tasks)
VALUES (2, 'Engineering', 'R&D Center', 'Product development');

INSERT INTO Department (departmentID, name, location, tasks)
VALUES (3, 'Human Resources', 'Corporate Office', 'Employee management');

INSERT INTO Department (departmentID, name, location, tasks)
VALUES (4, 'Finance', 'Finance Department', 'Financial management');

INSERT INTO Department (departmentID, name, location, tasks)
VALUES (5, 'Customer Service', 'Service Center', 'Customer support');

-- Voorbeeldgegevens voor de Employee-tabel
INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('John', 'Doe', 'Sales Manager', 1, (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='JH2RC39038M000001'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Alice', 'Smith', 'Software Engineer', 2, (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='RFGTJH23456789012'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Bob', 'Johnson', 'HR Specialist', 3, (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='KPLDW45678912345'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Emily', 'Brown', 'Financial Analyst', 4, (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='XCVBN12345678901'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Sophia', 'Davis', 'Customer Support Representative', 5, (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='QWERT09876543210'));



-- Voorbeeldgegevens voor de MotorBike2-tabel
INSERT INTO MotorBike2 (CHASSISNR, registrationNr, brand, manufactureDate, model, color)
VALUES ('JH2RC39038M000001','ABC123', 'Honda', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'CBR600RR', 'Red');

INSERT INTO MotorBike2 (CHASSISNR, registrationNr, brand, manufactureDate, model, color)
VALUES ('RFGTJH23456789012','DEF456', 'Yamaha', TO_DATE('2022-08-15', 'YYYY-MM-DD'), 'YZF-R1', 'Blue');

INSERT INTO MotorBike2 (CHASSISNR, registrationNr, brand, manufactureDate, model, color)
VALUES ('KPLDW45678912345','GHI789', 'Kawasaki', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Ninja ZX-10R', 'Green');

INSERT INTO MotorBike2 (CHASSISNR, registrationNr, brand, manufactureDate, model, color)
VALUES ('XCVBN12345678901','JKL012', 'Suzuki', TO_DATE('2023-11-20', 'YYYY-MM-DD'), 'GSX-R1000', 'Yellow');

INSERT INTO MotorBike2 (CHASSISNR, registrationNr, brand, manufactureDate, model, color)
VALUES ('QWERT09876543210','MNO345', 'Ducati', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Panigale V4', 'Black');

-- Voorbeeldgegevens voor de Maintenance-tabel
INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Oil Change', (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='JH2RC39038M000001'), 'Regular Maintenance', TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Brake Inspection', (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='RFGTJH23456789012'), 'Regular Maintenance', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO Maintenance ( maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Tire Replacement', (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='KPLDW45678912345'), 'Emergency Maintenance', TO_DATE('2024-04-10', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Chain Lubrication', (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='XCVBN12345678901'), 'Regular Maintenance', TO_DATE('2024-03-20', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Battery Replacement', (select MAINTENANCEID from MAINTENANCE where CHASSISNR ='QWERT09876543210'), 'Regular Maintenance', TO_DATE('2024-01-05', 'YYYY-MM-DD'));

commit ;
select * from MAINTENANCE;
select * from EMPLOYEE;

delete from EMPLOYEE
where FIRSTNAME ='John'