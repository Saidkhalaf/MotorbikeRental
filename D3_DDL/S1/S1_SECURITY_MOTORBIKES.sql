----- Stap 5: Maak gebruikers aan

CREATE USER Aniek IDENTIFIED BY EenGoedeDocent_1234;
GRANT create session to Aniek;
-- Grants on Customer and MotorBike tables
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON Customer TO Aniek with GRANT option ;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON MotorBike TO Aniek with GRANT option ;

-- Grants on Rental table
GRANT SELECT, UPDATE (rentalStartDate, rentalEndDate), INSERT, DELETE ON Rental TO Aniek with GRANT option ;


----------------********* Stap 6: Views aanmaken ************-------------------------------

CREATE VIEW TopThreeRentals AS
SELECT  c.customerID, c.firstName, mb.CHASSISNR,  mb.brand,
        mb.model,  s.shopID,
        s.name AS shopName,
        r.rentalID, r.rentalStartDate,  r.rentalEndDate, r.totalCost
FROM
    Customer c
        JOIN
    Rental r ON c.customerID = r.customerID
        JOIN
    MotorBike mb ON r.CHASSISNR = mb.CHASSISNR
        JOIN
    Shop s ON r.shopID = s.shopID
ORDER BY
    r.totalCost DESC
    FETCH FIRST 3 ROWS with ties ;

-- b: Create Public Synonym
CREATE PUBLIC SYNONYM TopThreeRentals FOR TopThreeRentals;

-- C:  Grant geven
GRANT SELECT ON TopThreeRentals TO PUBLIC;

SELECT * FROM TOPTHREERENTALS;

--------------------------********* Van user Aniek *********--------------------------------
-- Stap 1: Laat de gebruikersnaam zien
SELECT USER FROM DUAL;

-- Stap 2: Geef de output van de correcte dictionary tables voor objecten en system privileges
-- Lijst van alle objecten die de gebruiker bezit
SELECT OBJECT_NAME, OBJECT_TYPE FROM USER_OBJECTS;

-- Lijst van alle systeemprivileges van de gebruiker
SELECT * FROM USER_SYS_PRIVS;

-- Lijst van alle objectprivileges voor deze gebruiker
SELECT * FROM USER_TAB_PRIVS;

-- Stap 3: Laat resultaat van synoniem zien (ervan uitgaande dat er synoniemen zijn aangemaakt)
SELECT * FROM TopThreeRentals ;

-- Stap 4: Laat mogelijkheid tot aanpassingen aan tabel A of B zien
-- Aangezien 'Aniek' rechten heeft op de Customer en MotorBike tabellen, kan ze deze bewerken.
-- Demonstratie van de mogelijkheid om gegevens in de tabel Customer te wijzigen
UPDATE Customer SET firstName = 'Jan' WHERE customerID = 1;
select * from Customer;
commit ;
-- Stap 5: Geef een DML voorbeeld voor een van deze mogelijkheden
-- Voeg een nieuwe motor toe aan de MotorBike tabel
INSERT INTO MotorBike (chassisNr, brand, availabilityStatus, model, manufactureDate, rentalPricePerDay)
VALUES ('MB1234', 'Yamaha', 'Available', 'YZF-R1', DATE '2023-01-01', 150.00);

-- Stap 6: Voeg een attribuut toe aan de tabel
-- Voeg een nieuwe kolom 'color' toe aan de MotorBike tabel
ALTER TABLE MotorBike ADD (gewicht VARCHAR2(25));

-- Stap 7: Laat zien dat je DDL kan uitvoeren
-- Verander de datatype van de kolom 'color' in de MotorBike tabel
ALTER TABLE MotorBike MODIFY (gewicht VARCHAR2(50));

