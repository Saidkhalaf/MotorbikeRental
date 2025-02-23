-- First, drop the existing Rental table if it exists:
DROP TABLE Rental PURGE;

--  create the Rental table with partitioning:

CREATE TABLE Rental (
                        rentalID NUMBER GENERATED ALWAYS AS IDENTITY,
                        chassisNr VARCHAR2(50),
                        customerID INTEGER NOT NULL,
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
                        CONSTRAINT UNIQUE_RENTAL_COMBINATION UNIQUE (rentalID, customerID, chassisNr, rentalStartDate)
)
    PARTITION BY RANGE (rentalStartDate)
    INTERVAL (NUMTOYMINTERVAL(1, 'MONTH'))
(
    PARTITION p202301 VALUES LESS THAN (TO_DATE('2023-02-01', 'YYYY-MM-DD')),
    PARTITION p202302 VALUES LESS THAN (TO_DATE('2023-03-01', 'YYYY-MM-DD')),
    PARTITION p202303 VALUES LESS THAN (TO_DATE('2023-04-01', 'YYYY-MM-DD'))
);
