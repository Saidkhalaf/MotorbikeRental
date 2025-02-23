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
INSERT INTO MotorBike (chassisNr, brand, availabilityStatus, model, manufactureDate, rentalPricePerDay)
VALUES ('JH2RC39038M000001', 'Honda', 'Available', 'CBR600RR', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 50.00);

INSERT INTO MotorBike (chassisNr, brand, availabilityStatus, model, manufactureDate, rentalPricePerDay)
VALUES ('RFGTJH23456789012', 'Yamaha', 'Available', 'YZF-R1', TO_DATE('2022-08-15', 'YYYY-MM-DD'), 60.00);

INSERT INTO MotorBike (chassisNr, brand, availabilityStatus, model, manufactureDate, rentalPricePerDay)
VALUES ('KPLDW45678912345', 'Kawasaki', 'Available', 'Ninja ZX-10R', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 70.00);

INSERT INTO MotorBike (chassisNr, brand, availabilityStatus, model, manufactureDate, rentalPricePerDay)
VALUES ('XCVBN12345678901', 'Suzuki', 'Available', 'GSX-R1000', TO_DATE('2023-11-20', 'YYYY-MM-DD'), 65.00);

INSERT INTO MotorBike (chassisNr, brand, availabilityStatus, model, manufactureDate, rentalPricePerDay)
VALUES ('QWERT09876543210', 'Ducati', 'Available', 'Panigale V4', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 80.00);


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
INSERT INTO Rental(CHASSISNR, CUSTOMERID ,  rentalStartDate, rentalEndDate, totalCost, shopID)
VALUES ((select CHASSISNR from MOTORBIKE where CHASSISNR='JH2RC39038M000001') ,(SELECT customerID FROM Customer WHERE firstName = 'John' AND lastName = 'Doe'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 200.00, 1);

INSERT INTO Rental ( CHASSISNR, customerID, rentalStartDate, rentalEndDate, totalCost, shopID)
VALUES ((select CHASSISNR from MOTORBIKE where CHASSISNR='RFGTJH23456789012') ,(SELECT customerID FROM Customer WHERE firstName = 'Alice' AND lastName = 'Smith'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 300.00, 2);

INSERT INTO Rental (CHASSISNR,customerID, rentalStartDate, rentalEndDate, totalCost, shopID)
VALUES ((select CHASSISNR from MOTORBIKE where CHASSISNR='KPLDW45678912345'),(SELECT customerID FROM Customer WHERE firstName = 'Bob' AND lastName = 'Johnson'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 350.00, 3);

INSERT INTO Rental (CHASSISNR ,customerID, rentalStartDate, rentalEndDate, totalCost, shopID)
VALUES ((select CHASSISNR from MOTORBIKE where CHASSISNR='XCVBN12345678901'),(SELECT customerID FROM Customer WHERE firstName = 'Emily' AND lastName = 'Brown'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), 325.00, 4);

INSERT INTO Rental (CHASSISNR ,customerID, rentalStartDate, rentalEndDate, totalCost, shopID)
VALUES ((select CHASSISNR from MOTORBIKE where CHASSISNR='QWERT09876543210'),(SELECT customerID FROM Customer WHERE firstName = 'Sophia' AND lastName = 'Davis'), TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 400.00, 5);

commit ;

select * from CUSTOMER;
select * from RENTAL;
select * from SHOP;
select * from MOTORBIKE;