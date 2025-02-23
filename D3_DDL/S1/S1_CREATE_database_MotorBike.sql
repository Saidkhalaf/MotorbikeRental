DROP TABLE Customer;
DROP TABLE MOTORBIKE;
DROP TABLE SHOP ;
DROP TABLE RENTAL ;


CREATE TABLE Customer (
                          customerID INTEGER generated always as identity ,
                          firstName VARCHAR2(30) NOT NULL,
                          lastName VARCHAR2(30) NOT NULL,
                          phoneNumber VARCHAR2(20) NOT NULL,
                          email VARCHAR2(100) NOT NULL,
                          address VARCHAR2(255) NOT NULL,
                          birthDate VARCHAR2(10),
                          CONSTRAINT CUSTOMER_PK PRIMARY KEY (customerID)
);


CREATE TABLE MotorBike (
                           chassisNr VARCHAR2(50) ,
                           brand VARCHAR2(50) NOT NULL,
                           availabilityStatus VARCHAR2(20) NOT NULL,
                           model VARCHAR2(50) NOT NULL,
                           manufactureDate DATE NOT NULL,
                           rentalPricePerDay DECIMAL(10, 2) NOT NULL,
                           CONSTRAINT MOTORBIKE_PK PRIMARY KEY (chassisNr)
);

CREATE TABLE Shop (
                      shopID INTEGER NOT NULL,
                      name VARCHAR2(255) NOT NULL,
                      address VARCHAR2(255) NOT NULL,
                      phone VARCHAR2(20) NOT NULL,
                      CONSTRAINT SHOP_PK PRIMARY KEY (shopID)
);




CREATE TABLE Rental (
                        rentalID number generated always as identity,
                        chassisNr VARCHAR2(50) unique ,
                        customerID INTEGER NOT NULL ,
                        rentalStartDate DATE NOT NULL,
                        rentalEndDate DATE NOT NULL,
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


);


ALTER TABLE Rental
    ADD CONSTRAINT rental_totalcost_chk CHECK (totalCost > 25);

ALTER TABLE Customer
    ADD CONSTRAINT customer_phonenumber_chk CHECK (REGEXP_LIKE(phoneNumber, '^04\d{8}$'));