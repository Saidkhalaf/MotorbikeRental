DROP TABLE RENTAL;
DROP TABLE SHOP;
DROP TABLE SERVICE;
DROP TABLE CUSTOMER;
DROP TABLE EMPLOYEE;
DROP TABLE MAINTENANCE;
DROP TABLE MOTORBIKE;
DROP TABLE DEPARTMENT;



CREATE TABLE Customer (
                          customerID INTEGER generated always as identity ,
                          firstName VARCHAR2(30) NOT NULL,
                          lastName VARCHAR2(30) NOT NULL,
                          phoneNumber VARCHAR2(20) NOT NULL,
                          email VARCHAR2(100) unique NOT NULL,
                          address VARCHAR2(255) NOT NULL,
                          birthDate VARCHAR2(10),
                          CONSTRAINT CUSTOMER_PK PRIMARY KEY (customerID)
);


CREATE TABLE MotorBike (
                           chassisNr VARCHAR2(50) ,
                           brand VARCHAR2(50) NOT NULL,
                           registrationNr VARCHAR2(50) unique NOT NULL,
                           availabilityStatus VARCHAR2(20) NOT NULL,
                           model VARCHAR2(50) NOT NULL,
                           manufactureDate DATE NOT NULL,
                           rentalPricePerDay DECIMAL(10, 2) NOT NULL,
                           color VARCHAR2(50) NOT NULL,
                           CONSTRAINT MOTORBIKE_PK PRIMARY KEY (chassisNr)
);

CREATE TABLE Shop (
                      shopID INTEGER NOT NULL,
                      name VARCHAR2(500) NOT NULL,
                      address VARCHAR2(500) NOT NULL,
                      phone VARCHAR2(20) NOT NULL,
                      CONSTRAINT SHOP_PK PRIMARY KEY (shopID),
                      CONSTRAINT UNIQUE_Shop_name_Address UNIQUE (name , address)
);


CREATE TABLE Rental (
                        rentalID number generated always as identity,
                        chassisNr VARCHAR2(50)  ,
                        customerID INTEGER NOT NULL ,
                        rentalStartDate DATE NOT NULL,
                        rentalEndDate DATE NOT NULL,
                        rentalStatus VARCHAR2(20) NOT NULL,
                        paymentDetails VARCHAR2(200),
                        customerFeedback VARCHAR2(500),
                        insuranceDetails VARCHAR2(200),
                        totalCost DECIMAL(10, 2) NOT NULL,
                        shopID INTEGER NOT NULL,
                        CONSTRAINT RENTAL_PK PRIMARY KEY (rentalID),
                        CONSTRAINT RENTAL_FK_chassisNr FOREIGN KEY (chassisNr)
                            REFERENCES MotorBike (chassisNr),
                        CONSTRAINT RENTAL_FK_CUSTOMERID FOREIGN KEY (customerID)
                            REFERENCES Customer (customerID),
                        CONSTRAINT RENTAL_FK_SHOPID FOREIGN KEY (shopID)
                            REFERENCES Shop (shopID),
                        CONSTRAINT UNIQUE_RENTAL_COMBINATION UNIQUE (rentalID, customerID, chassisNr, rentalStartDate));


-- Check constraint voor totalCost in Rental !
ALTER TABLE Rental
    ADD CONSTRAINT rental_totalcost_chk CHECK (totalCost > 25);

--Check constraint voor phoneNumber in Customer !
ALTER TABLE Customer
    ADD CONSTRAINT customer_phonenumber_chk CHECK (REGEXP_LIKE(phoneNumber, '^04\d{8}$'));


CREATE TABLE Department (
                            departmentID INTEGER GENERATED ALWAYS AS IDENTITY ,
                            name VARCHAR2(1000) unique NOT NULL,
                            location VARCHAR2(1000),
                            tasks VARCHAR2(50),
                            CONSTRAINT DEPARTMENT_PK PRIMARY KEY (departmentID)
);


CREATE TABLE Maintenance (
                             maintenanceID INTEGER GENERATED ALWAYS AS IDENTITY ,
                             maintenanceDescription VARCHAR2(500) NOT NULL,
                             chassisNr VARCHAR2(50) NOT NULL
                                 constraint maintenance_FK_motorBike references MOTORBIKE(chassisNr),
                             maintenanceType VARCHAR2(500) NOT NULL,
                             maintenanceDate DATE NOT NULL,
                             CONSTRAINT MAINTENANCE_PK PRIMARY KEY (maintenanceID)
);

CREATE TABLE Employee (
                          employeeID INTEGER generated always as identity ,
                          firstName VARCHAR2(100) NOT NULL,
                          lastName VARCHAR2(100) NOT NULL,
                          position VARCHAR2(100),
                          departmentID INTEGER NOT NULL
                              constraint employee_FK_department references Department(departmentID),
                          maintenanceID INTEGER
                              constraint employee_FK_maintenance references Maintenance(maintenanceID),
                          CONSTRAINT EMPLOYEE_PK PRIMARY KEY (employeeID)
);

create table Service(
                        serviceID NUMBER(10) GENERATED ALWAYS AS IDENTITY ,
                        employeeID INTEGER NOT NULL,
                        employeeName VARCHAR2(2000) NOT NULL,
                        customerID INTEGER NOT NULL,
                        customerName VARCHAR2(2000) NOT NULL,
                        serviceDetails VARCHAR2(1000) NOT NULL ,
                        serviceDate Date NOT NULL,
                        CONSTRAINT SERVICE_PK PRIMARY KEY (serviceID),
                        CONSTRAINT SERVICE_EMPLOYEE_FK FOREIGN KEY (employeeID)
                            REFERENCES EMPLOYEE(employeeID),
                        CONSTRAINT SERVICE_CUSTOMER_FK FOREIGN KEY (customerID)
                            REFERENCES CUSTOMER(customerID)
);

--Check Constraint FirstName in Employee!
ALTER TABLE Employee
    ADD CONSTRAINT employee_firstname_length_chk
        CHECK (LENGTH(firstName) BETWEEN 3 AND 10);

--Check Constraint for ManufactureDate MotorBike2 !
CREATE OR REPLACE TRIGGER check_manufacture_date
    BEFORE INSERT OR UPDATE ON MotorBike
    FOR EACH ROW
BEGIN
    IF :NEW.manufactureDate > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20000, 'Manufacture date cannot be in the future.');
    END IF;
END;

SELECT s.serviceID, s.serviceDetails, d.name AS department_name, m.maintenanceDescription
FROM Service s
         JOIN Employee e ON s.employeeID = e.employeeID
         JOIN Department d ON e.departmentID = d.departmentID
         JOIN Maintenance m ON e.maintenanceID = m.maintenanceID;