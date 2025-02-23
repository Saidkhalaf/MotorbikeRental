drop table Department cascade constraints ;
drop table EMPLOYEE cascade constraints ;
drop table Maintenance cascade constraints ;
drop table MotorBike2 cascade constraints;

CREATE TABLE Department (
                            departmentID INTEGER NOT NULL,
                            name VARCHAR2(50) NOT NULL,
                            location VARCHAR2(100),
                            tasks VARCHAR2(50),
                            CONSTRAINT DEPARTMENT_PK PRIMARY KEY (departmentID)
);

CREATE TABLE MotorBike2 (
                           chassisNr VARCHAR2(50),
                           registrationNr VARCHAR2(50) unique NOT NULL,
                           brand VARCHAR2(50) NOT NULL,
                           manufactureDate DATE,
                           model VARCHAR2(50) NOT NULL,
                           color VARCHAR2(50) NOT NULL,
                           CONSTRAINT MOTORBIKE2_PK PRIMARY KEY (chassisNr)
);

CREATE TABLE Maintenance (
                             maintenanceID INTEGER generated always as identity ,
                             maintenanceDescription VARCHAR2(250) NOT NULL,
                             chassisNr VARCHAR2(50) NOT NULL
                                 constraint maintenance_FK_motorBike2 references MOTORBIKE2(chassisNr),
                             maintenanceType VARCHAR2(100) NOT NULL,
                             maintenanceDate DATE NOT NULL,
                             CONSTRAINT MAINTENANCE_PK PRIMARY KEY (maintenanceID)
);


CREATE TABLE Employee (
                          employeeID INTEGER generated always as identity ,
                          firstName VARCHAR2(50) NOT NULL,
                          lastName VARCHAR2(50) NOT NULL,
                          position VARCHAR2(50),
                          departmentID INTEGER NOT NULL
                              constraint employee_FK_department references Department(departmentID),
                          maintenanceID INTEGER
                              constraint employee_FK_maintenance references Maintenance(maintenanceID),
                          CONSTRAINT EMPLOYEE_PK PRIMARY KEY (employeeID)
);

--Check Constraint FirstName in Employee!
ALTER TABLE Employee
    ADD CONSTRAINT employee_firstname_length_chk
        CHECK (LENGTH(firstName) BETWEEN 3 AND 10);

--Check Constraint for ManufactureDate MotorBike2 !
CREATE OR REPLACE TRIGGER check_manufacture_date
    BEFORE INSERT OR UPDATE ON MotorBike2
    FOR EACH ROW
BEGIN
    IF :NEW.manufactureDate > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20000, 'Manufacture date cannot be in the future.');
    END IF;
END;


