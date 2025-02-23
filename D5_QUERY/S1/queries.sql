-- SELECT 'Customer' AS cus, (SELECT COUNT(*) FROM Customer) AS cus FROM dual UNION
--
-- SELECT 'MotorBike' AS mobk, (SELECT COUNT(*) FROM MotorBike) AS mobk FROM dual UNION
-- SELECT 'Shop' AS shop, (SELECT COUNT(*) FROM Shop) AS shop FROM dual UNION
-- SELECT 'Rental' AS rental, (SELECT COUNT(*) FROM Rental) AS rental FROM dual;


select * from CUSTOMER;
select * from MOTORBIKE;
select *from SHOP;
select * from RENTAL;

--Query 1: Join Customer, Rental, en MotorBike
SELECT
    c.customerID, c.firstName || ''|| c.lastName as CustomerName,
    c.phoneNumber,  c.email,
    c.address, c.birthDate,  m.chassisNr, m.brand,
    m.model, m.manufactureDate,  m.rentalPricePerDay,
    r.rentalStartDate, r.rentalEndDate, r.totalCost

FROM
    MOTORBIKE m
        JOIN
    RENTAL r ON r.CHASSISNR = m.CHASSISNR
        JOIN
    CUSTOMER c ON c.CUSTOMERID = r.CUSTOMERID;
--where c.PHONENUMBER= '0471234567' ;

select * from CUSTOMER;



-- Query 2: Join Shop, Rental, en MotorBike, shop "4 levels diep"
SELECT
    r.rentalStartDate, r.rentalEndDate, r.totalCost,
    c.firstName || ' ' || c.lastName AS customerName,
    m.brand || ' ' || m.model AS motorBikeModel,
    s.name AS shopName,  s.address AS shopAddress
FROM
    Rental r
        JOIN
    Customer c ON r.customerID = c.customerID
        JOIN
    MotorBike m ON r.CHASSISNR = m.CHASSISNR
        JOIN
    Shop s ON r.shopID = s.shopID;


-- Stap 4: Bewijs Domeinen - constraints M2
-- in mijn geval dus
-- totalCost in "Rental" moet groter is dan 25
-- phoneNr van de Custome moet belgische Nr zijn start met "04"

insert into RENTAL(CHASSISNR,  customerid, rentalstartdate, rentalenddate, totalcost, shopid)
values (1, 6,  TO_DATE('2021-04-01', 'YYYY-MM-DD'),TO_DATE('2022-04-01', 'YYYY-MM-DD') , 30 , 3);


-- 2de
INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
VALUES ('Sophia', 'Davis', '0465678901', 'sophia.davis@example.com', '654 Maple St, Suburb', '1982-07-08');


commit;





