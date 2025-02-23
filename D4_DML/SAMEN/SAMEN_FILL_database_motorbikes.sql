-- gegevens voor de Customer-tabel
INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
VALUES ('John', 'Doe', '0471234567', 'john.doe@example.com', '123 Main St, City', '1990-05-15');

INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
VALUES ('Alice', 'Smith', '0482345678', 'alice.smith@example.com', '456 Elm St, Town', '1985-09-20');

INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
VALUES ('Bob', 'Johnson', '0493456789', 'bob.johnson@example.com', '789 Oak St, Village', '1978-03-10');

INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
VALUES ('Emily', 'Brown', '0474567890', 'emily.brown@example.com', '321 Pine St, Hamlet', '1995-11-25');

INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
VALUES ('Sophia', 'Davis', '0465678901', 'sophia.davis@example.com', '654 Maple St, Suburb', '1982-07-08');


-- gegevens voor de MotorBike-tabel
INSERT INTO MotorBike (chassisNr, brand, REGISTRATIONNR, availabilityStatus, model, manufactureDate, rentalPricePerDay,
                       COLOR)
VALUES ('JH2RC39038M000001', 'Honda', 'ABC123', 'Available', 'CBR600RR', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 50.00,
        'blue');

INSERT INTO MotorBike (chassisNr, brand, REGISTRATIONNR, availabilityStatus, model, manufactureDate, rentalPricePerDay,
                       COLOR)
VALUES ('RFGTJH23456789012', 'Yamaha', 'DEF456', 'Available', 'YZF-R1', TO_DATE('2022-08-15', 'YYYY-MM-DD'), 60.00,
        'red');

INSERT INTO MotorBike (chassisNr, brand, REGISTRATIONNR, availabilityStatus, model, manufactureDate, rentalPricePerDay,
                       COLOR)
VALUES ('KPLDW45678912345', 'Kawasaki', 'GHI789', 'Available', 'Ninja ZX-10R', TO_DATE('2024-01-10', 'YYYY-MM-DD'),
        70.00, 'yellow');

INSERT INTO MotorBike (chassisNr, brand, REGISTRATIONNR, availabilityStatus, model, manufactureDate, rentalPricePerDay,
                       COLOR)
VALUES ('XCVBN12345678901', 'Suzuki', 'JKL012', 'Available', 'GSX-R1000', TO_DATE('2023-11-20', 'YYYY-MM-DD'), 65.00,
        'black');

INSERT INTO MotorBike (chassisNr, brand, REGISTRATIONNR, availabilityStatus, model, manufactureDate, rentalPricePerDay,
                       COLOR)
VALUES ('QWERT09876543210', 'Ducati', 'MNO345', 'Available', 'Panigale V4', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 80.00,
        'grey');

-- gegevens voor de Shop-tabel
INSERT INTO Shop (shopID, name, address, phone)
VALUES (1, 'City Bikes', '789 High St, City', '012-3456789');

INSERT INTO Shop (shopID, name, address, phone)
VALUES (2, 'Town Cycles', '456 Main St, Town', '023-4567890');

INSERT INTO Shop (shopID, name, address, phone)
VALUES (3, 'Village Motors', '123 Elm St, Village', '034-5678901');

INSERT INTO Shop (shopID, name, address, phone)
VALUES (4, 'Hamlet Bikes', '678 Oak St, Hamlet', '045-6789012');

INSERT INTO Shop (shopID, name, address, phone)
VALUES (5, 'Suburb Cycles', '234 Pine St, Suburb', '056-7890123');


-- gegevens voor de Rental-tabel
INSERT INTO Rental(CHASSISNR, CUSTOMERID, rentalStartDate, rentalEndDate, rentalStatus, totalCost, shopID)
VALUES ((select CHASSISNR from MOTORBIKE where CHASSISNR = 'JH2RC39038M000001'),
        (SELECT customerID FROM Customer WHERE firstName = 'John' AND lastName = 'Doe'),
        TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Active', 'Paid via Credit Card',
        'Great service!',
        'Full Coverage Insurance',
        200.00, 1);

INSERT INTO Rental (CHASSISNR, customerID, rentalStartDate, rentalEndDate, rentalStatus, totalCost, shopID,
                    paymentDetails, customerFeedback, insuranceDetails)
VALUES ((SELECT CHASSISNR FROM MOTORBIKE WHERE CHASSISNR = 'RFGTJH23456789012'),
        (SELECT customerID FROM Customer WHERE firstName = 'Alice' AND lastName = 'Smith'),
        TO_DATE('2024-03-20', 'YYYY-MM-DD'),
        TO_DATE('2024-03-25', 'YYYY-MM-DD'),
        'Active',
        300.00,
        2,
        'Paid via PayPal',
        'Very comfortable bike.',
        'Partial Coverage Insurance');

INSERT INTO Rental (CHASSISNR, customerID, rentalStartDate, rentalEndDate, rentalStatus, totalCost, shopID,
                    paymentDetails, customerFeedback, insuranceDetails)
VALUES ((SELECT CHASSISNR FROM MOTORBIKE WHERE CHASSISNR = 'KPLDW45678912345'),
        (SELECT customerID FROM Customer WHERE firstName = 'Bob' AND lastName = 'Johnson'),
        TO_DATE('2024-04-10', 'YYYY-MM-DD'),
        TO_DATE('2024-04-15', 'YYYY-MM-DD'),
        'Completed',
        350.00,
        3,
        'Paid via Debit Card',
        'Had an amazing trip!',
        'No Insurance');

INSERT INTO Rental (CHASSISNR, customerID, rentalStartDate, rentalEndDate, rentalStatus, totalCost, shopID,
                    paymentDetails, customerFeedback, insuranceDetails)
VALUES ((SELECT CHASSISNR FROM MOTORBIKE WHERE CHASSISNR = 'XCVBN12345678901'),
        (SELECT customerID FROM Customer WHERE firstName = 'Emily' AND lastName = 'Brown'),
        TO_DATE('2024-04-05', 'YYYY-MM-DD'),
        TO_DATE('2024-04-10', 'YYYY-MM-DD'),
        'Completed',
        325.00,
        4,
        'Paid via Cash',
        'Smooth experience.',
        'Full Coverage Insurance');

INSERT INTO Rental (CHASSISNR, customerID, rentalStartDate, rentalEndDate, rentalStatus, totalCost, shopID,
                    paymentDetails, customerFeedback, insuranceDetails)
VALUES ((SELECT CHASSISNR FROM MOTORBIKE WHERE CHASSISNR = 'QWERT09876543210'),
        (SELECT customerID FROM Customer WHERE firstName = 'Sophia' AND lastName = 'Davis'),
        TO_DATE('2024-03-15', 'YYYY-MM-DD'),
        TO_DATE('2024-03-20', 'YYYY-MM-DD'),
        'Cancelled',
        400.00,
        5,
        'Paid via Bank Transfer',
        'Had to cancel due to weather.',
        'No Insurance');

INSERT INTO Rental (CHASSISNR, customerID, rentalStartDate, rentalEndDate, rentalStatus, totalCost, shopID,
                    paymentDetails, customerFeedback, insuranceDetails)
VALUES ((SELECT CHASSISNR FROM MOTORBIKE WHERE CHASSISNR = 'QWERT09876543210'),
        (SELECT customerID FROM Customer WHERE firstName = 'John' AND lastName = 'Doe'),
        TO_DATE('2024-03-13', 'YYYY-MM-DD'),
        TO_DATE('2024-03-20', 'YYYY-MM-DD'),
        'Completed',
        400.00,
        5,
        'Paid via Credit Card',
        'Great experience!',
        'Partial Coverage Insurance');

COMMIT;
commit;

-----------------**** Student ****----------------------
-- gegevens voor de Department-tabel
INSERT INTO Department (name, location, tasks)
VALUES ('Sales', 'Headquarters', 'Sales and marketing');

INSERT INTO Department (name, location, tasks)
VALUES ('Engineering', 'R&D Center', 'Product development');

INSERT INTO Department (name, location, tasks)
VALUES ('Human Resources', 'Corporate Office', 'Employee management');

INSERT INTO Department (name, location, tasks)
VALUES ('Finance', 'Finance Department', 'Financial management');

INSERT INTO Department (name, location, tasks)
VALUES ('Customer Service', 'Service Center', 'Customer support');

-- Voorbeeldgegevens voor de Maintenance-tabel
INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Oil Change', (select CHASSISNR from MOTORBIKE where CHASSISNR = 'JH2RC39038M000001'), 'Regular Maintenance',
        TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Brake Inspection', (select CHASSISNR from MOTORBIKE where CHASSISNR = 'RFGTJH23456789012'),
        'Regular Maintenance', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Tire Replacement', (select CHASSISNR from MOTORBIKE where CHASSISNR = 'KPLDW45678912345'),
        'Emergency Maintenance', TO_DATE('2024-04-10', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Chain Lubrication', (select CHASSISNR from MOTORBIKE where CHASSISNR = 'KPLDW45678912345'),
        'Regular Maintenance', TO_DATE('2024-03-20', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Battery Replacement', (select CHASSISNR from MOTORBIKE where CHASSISNR = 'RFGTJH23456789012'),
        'Regular Maintenance', TO_DATE('2024-01-05', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Tire Replacement 2', (select CHASSISNR from MOTORBIKE where CHASSISNR = 'RFGTJH23456789012'),
        'Regular Maintenance', TO_DATE('2024-01-10', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Tire Replacement 3', (select CHASSISNR from MOTORBIKE where CHASSISNR = 'KPLDW45678912345'),
        'Regular Maintenance', TO_DATE('2024-01-10', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Brake Inspection 2', 'RFGTJH23456789012', 'Regular Maintenance', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Tire Replacement 4', 'KPLDW45678912345', 'Emergency Maintenance', TO_DATE('2024-04-10', 'YYYY-MM-DD'));

INSERT INTO Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
VALUES ('Battery Replacement', 'JH2RC39038M000001', 'Emergency Maintenance', TO_DATE('2023-10-10', 'YYYY-MM-DD'));


commit;
-- Voorbeeldgegevens voor de Employee-tabel
INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('John', 'Doe', 'Sales Manager', 1, (select MAINTENANCEID
                                            from MAINTENANCE
                                            where CHASSISNR = 'JH2RC39038M000001'
                                              and MAINTENANCEDESCRIPTION = 'Oil Change'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Alice', 'Smith', 'Software Engineer', 2, (select MAINTENANCEID
                                                   from MAINTENANCE
                                                   where CHASSISNR = 'RFGTJH23456789012'
                                                     and MAINTENANCEDESCRIPTION = 'Tire Replacement 2'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Bob', 'Johnson', 'HR Specialist', 3, (select MAINTENANCEID
                                               from MAINTENANCE
                                               where CHASSISNR = 'KPLDW45678912345'
                                                 and MAINTENANCEDESCRIPTION = 'Chain Lubrication'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Emily', 'Brown', 'Financial Analyst', 4, (select MAINTENANCEID
                                                   from MAINTENANCE
                                                   where CHASSISNR = 'RFGTJH23456789012'
                                                     and MAINTENANCEDESCRIPTION = 'Brake Inspection'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Sophia', 'Davis', 'Customer Support Representative', 5, (select MAINTENANCEID
                                                                  from MAINTENANCE
                                                                  where CHASSISNR = 'RFGTJH23456789012'
                                                                    and MAINTENANCEDESCRIPTION = 'Battery Replacement'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Said', 'Khalaf', 'Sales Manager', 1, (SELECT MAINTENANCEID
                                               FROM Maintenance
                                               WHERE CHASSISNR = 'JH2RC39038M000001'
                                                 and MAINTENANCEDESCRIPTION = 'Battery Replacement'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Hashem', 'Khalaf', 'Software Engineer', 2, (SELECT MAINTENANCEID
                                                     FROM Maintenance
                                                     WHERE CHASSISNR = 'KPLDW45678912345'
                                                       AND MAINTENANCEDESCRIPTION = 'Tire Replacement'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Saif', 'Qudaih', 'HR Specialist', 3, (SELECT MAINTENANCEID
                                               FROM Maintenance
                                               WHERE CHASSISNR = 'KPLDW45678912345'
                                                 AND MAINTENANCEDESCRIPTION = 'Chain Lubrication'));

INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
VALUES ('Sam', 'Ketels', 'software Engineering', 3, (SELECT MAINTENANCEID
                                                     FROM Maintenance
                                                     WHERE CHASSISNR = 'KPLDW45678912345'
                                                       AND MAINTENANCEDESCRIPTION = 'Chain Lubrication'));


commit;
--gegevens voor Services tabel
INSERT INTO Service (employeeID, customerID, serviceDetails, serviceDate)
VALUES ((SELECT employeeID FROM Employee WHERE firstName = 'John' AND lastName = 'Doe'),
        (SELECT customerID FROM Customer WHERE firstName = 'Alice' AND lastName = 'Smith'),
        'Oil Change', TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Service (employeeID, customerID, serviceDetails, serviceDate)
VALUES ((SELECT employeeID FROM Employee WHERE firstName = 'Emily' AND lastName = 'Brown'),
        (SELECT customerID FROM Customer WHERE firstName = 'Bob' AND lastName = 'Johnson'),
        'Tire Replacement', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO Service (employeeID, customerID, serviceDetails, serviceDate)
VALUES ((SELECT employeeID FROM Employee WHERE firstName = 'Sophia' AND lastName = 'Davis'),
        (SELECT customerID FROM Customer WHERE firstName = 'Alice' AND lastName = 'Smith'),
        'Brake Inspection', TO_DATE('2024-04-10', 'YYYY-MM-DD'));

INSERT INTO Service (employeeID, customerID, serviceDetails, serviceDate)
VALUES ((SELECT employeeID FROM Employee WHERE firstName = 'Bob' AND lastName = 'Johnson'),
        (SELECT customerID FROM Customer WHERE firstName = 'Emily' AND lastName = 'Brown'),
        'Battery Replacement', TO_DATE('2024-01-05', 'YYYY-MM-DD'));

INSERT INTO Service (employeeID, customerID, serviceDetails, serviceDate)
VALUES ((SELECT employeeID FROM Employee WHERE firstName = 'Alice' AND lastName = 'Smith'),
        (SELECT customerID FROM Customer WHERE firstName = 'John' AND lastName = 'Doe'),
        'Chain Lubrication', TO_DATE('2024-03-20', 'YYYY-MM-DD'));


commit;