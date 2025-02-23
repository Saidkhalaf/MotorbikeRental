CREATE OR REPLACE PACKAGE BODY PKG_S1_MOTORBIKES AS


    TYPE t_customer_bulk IS TABLE OF CUSTOMER%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE t_motorBikes_bulk IS TABLE OF MOTORBIKE%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE t_shop_bulk IS TABLE OF SHOP%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE t_rental_bulk IS TABLE OF RENTAL%ROWTYPE INDEX BY PLS_INTEGER;

    PROCEDURE EMPTY_TABLES_S1 IS
    BEGIN
        -- Disable foreign key constraints
        FOR c IN (SELECT constraint_name, table_name
                  FROM user_constraints
                  WHERE constraint_type = 'R'
                    AND status = 'ENABLED')
            LOOP
                EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name || ' DISABLE CONSTRAINT ' || c.constraint_name;
            END LOOP;

        -- Truncate tables
        EXECUTE IMMEDIATE 'TRUNCATE TABLE RENTAL';
        EXECUTE IMMEDIATE 'TRUNCATE TABLE MOTORBIKE';
        EXECUTE IMMEDIATE 'TRUNCATE TABLE SHOP';
        EXECUTE IMMEDIATE 'TRUNCATE TABLE Customer';
        EXECUTE IMMEDIATE 'ALTER TABLE CUSTOMER
            MODIFY (CUSTOMERID GENERATED ALWAYS AS IDENTITY (START WITH 1))';
        EXECUTE IMMEDIATE 'ALTER TABLE RENTAL
            MODIFY (RENTALID GENERATED ALWAYS AS IDENTITY (START WITH 1))';
        -- Enable foreign key constraints back
        FOR c IN (SELECT constraint_name, table_name
                  FROM user_constraints
                  WHERE constraint_type = 'R'
                    AND status = 'DISABLED')
            LOOP
                EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name || ' ENABLE CONSTRAINT ' || c.constraint_name;
            END LOOP;


    END empty_tables_S1;

    FUNCTION lookup_Customer(p_email IN Customer.email%TYPE) RETURN Customer.customerID%TYPE IS
        v_customerID Customer.customerID%TYPE;
    BEGIN
        BEGIN
            SELECT customerID
            INTO v_customerID
            FROM Customer
            WHERE email = p_email;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RETURN NULL;
        END;
        RETURN v_customerID;
    END lookup_Customer;


    -- Lookup functie voor het ophalen van  chassisnummer op basis van regsNr
    FUNCTION lookup_MotorBike(p_registrationNr IN MotorBike.registrationNr%TYPE)
        RETURN MotorBike.CHASSISNR%TYPE
        IS
        v_chassiNr MotorBike.CHASSISNR%TYPE;
    BEGIN
        SELECT CHASSISNR
        INTO v_chassiNr
        FROM MotorBike
        WHERE REGISTRATIONNR = p_registrationNr;

        RETURN v_chassiNr;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END lookup_MotorBike;

    FUNCTION lookup_shop(
        p_name IN Shop.name%TYPE,
        p_address IN Shop.address%TYPE
    ) RETURN Shop.shopID%TYPE IS
        ln_shopID Shop.shopID%TYPE;
    BEGIN
        SELECT shopID
        INTO ln_shopID
        FROM Shop
        WHERE name = p_name
          AND address = p_address;

        RETURN ln_shopID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN OTHERS THEN
            RAISE;
    END lookup_shop;

    -- Lookup function for Rental based on chassisNr and customerID
    FUNCTION lookup_rental(
        p_chassisNr Rental.chassisNr%TYPE,
        p_customerID Rental.customerID%TYPE
    ) RETURN Rental.rentalID%TYPE AS
        ln_rentalID Rental.rentalID%TYPE;
    BEGIN
        SELECT rentalID
        INTO ln_rentalID
        FROM Rental
        WHERE chassisNr = p_chassisNr
          AND customerID = p_customerID;

        RETURN ln_rentalID;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN OTHERS THEN
            RAISE;
    END lookup_rental;

    PROCEDURE add_Customer(
        p_firstName Customer.firstName%TYPE,
        p_lastName Customer.lastName%TYPE,
        p_phoneNumber Customer.phoneNumber%TYPE,
        p_email Customer.email%TYPE,
        p_address Customer.address%TYPE,
        p_birthDate Customer.birthDate%TYPE
    ) IS
    BEGIN
        INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
        VALUES (p_firstName, p_lastName, p_phoneNumber, p_email, p_address, p_birthDate);
    END add_Customer;

    PROCEDURE add_MotorBike(
        p_chassisNr MotorBike.chassisNr%TYPE,
        p_brand MotorBike.brand%TYPE,
        p_registrationNr MotorBike.registrationNr%TYPE,
        p_availabilityStatus MotorBike.availabilityStatus%TYPE,
        p_model MotorBike.model%TYPE,
        p_manufactureDate MotorBike.manufactureDate%TYPE,
        p_rentalPricePerDay MotorBike.rentalPricePerDay%TYPE,
        p_color MotorBike.color%TYPE
    ) IS
    BEGIN
        INSERT INTO MotorBike (chassisNr, brand, registrationNr, availabilityStatus, model, manufactureDate,
                               rentalPricePerDay, color)
        VALUES (p_chassisNr, p_brand, p_registrationNr, p_availabilityStatus, p_model, p_manufactureDate,
                p_rentalPricePerDay, p_color);
    END add_MotorBike;

    PROCEDURE add_Shop(
        p_shopID Shop.shopID%TYPE,
        p_name Shop.name%TYPE,
        p_address Shop.address%TYPE,
        p_phone Shop.phone%TYPE
    ) IS
    BEGIN
        INSERT INTO Shop (shopID, name, address, phone)
        VALUES (p_shopID, p_name, p_address, p_phone);
    END add_Shop;


    PROCEDURE add_Rental(
        --p_chassisNr Rental.chassisNr%TYPE,
        p_registrationNr MotorBike.registrationNr%TYPE,
        p_email Customer.email%TYPE, -- De gebruiker kent het e-mailadres
        p_rentalStartDate Rental.rentalStartDate%TYPE,
        p_rentalEndDate Rental.rentalEndDate%TYPE,
        p_totalCost Rental.totalCost%TYPE,
        --p_shopID Rental.shopID%TYPE
        p_shopName IN Shop.name%TYPE, -- De naam van de winkel wordt gebruikt om de shop_id op te halen
        p_shopAddress IN Shop.address%TYPE
    ) IS
        v_chassiNr   MOTORBIKE.CHASSISNR%TYPE;
        v_customerID Customer.customerID%TYPE;
        v_shopID     Shop.shopID%TYPE;

    BEGIN
        -- Gebruik de lookup-functie om de CustomerID op te halen op basis van het e-mailadres
        v_chassiNr := lookup_MotorBike(p_registrationNr);
        v_customerID := lookup_Customer(p_email);
        v_shopID := lookup_shop(p_shopName, p_shopAddress);

        -- Controleer of de CustomerID is gevonden
        IF v_customerID IS NOT NULL THEN
            -- Voeg de verhuur toe met de gevonden CustomerID
            INSERT INTO Rental (chassisNr, customerID, rentalStartDate, rentalEndDate, totalCost, shopID)
            VALUES (v_chassiNr, v_customerID, p_rentalStartDate, p_rentalEndDate, p_totalCost, v_shopID);
        ELSE
            -- Geef een foutmelding als de CustomerID niet gevonden is
            RAISE_APPLICATION_ERROR(-20001, 'Customer with email ' || p_email || ' not found.');
        END IF;
    END add_Rental;


    PROCEDURE BEWIJS_M4_S1
        IS
    BEGIN
        PKG_S1_MOTORBIKES.add_Customer('John', 'Doe', '0471234567', 'john.doe@example.com', '123 Main St, City',
                                       '1990-05-15');
        PKG_S1_MOTORBIKES.add_Customer('Alice', 'Smith', '0482345678', 'alice.smith@example.com', '456 Elm St, Town',
                                       '1985-09-20');
        PKG_S1_MOTORBIKES.add_Customer('Bob', 'Johnson', '0493456789', 'bob.johnson@example.com', '789 Oak St, Village',
                                       '1978-03-10');
        PKG_S1_MOTORBIKES.add_Customer('Emily', 'Brown', '0474567890', 'emily.brown@example.com', '321 Pine St, Hamlet',
                                       '1995-11-25');
        PKG_S1_MOTORBIKES.add_Customer('Sophia', 'Davis', '0465678901', 'sophia.davis@example.com',
                                       '654 Maple St, Suburb', '1982-07-08');

        PKG_S1_MOTORBIKES.add_MotorBike('JH2RC39038M000001', 'Honda', 'ABC123', 'Available', 'CBR600RR',
                                        TO_DATE('2023-05-01', 'YYYY-MM-DD'), 50.00, 'blue');
        PKG_S1_MOTORBIKES.add_MotorBike('RFGTJH23456789012', 'Yamaha', 'DEF456', 'Available', 'YZF-R1',
                                        TO_DATE('2022-08-15', 'YYYY-MM-DD'), 60.00, 'red');
        PKG_S1_MOTORBIKES.add_MotorBike('KPLDW45678912345', 'Kawasaki', 'GHI789', 'Available', 'Ninja ZX-10R',
                                        TO_DATE('2024-01-10', 'YYYY-MM-DD'), 70.00, 'yellow');
        PKG_S1_MOTORBIKES.add_MotorBike('XCVBN12345678901', 'Suzuki', 'JKL012', 'Available', 'GSX-R1000',
                                        TO_DATE('2023-11-20', 'YYYY-MM-DD'), 65.00, 'black');
        PKG_S1_MOTORBIKES.add_MotorBike('QWERT09876543210', 'Ducati', 'MNO345', 'Available', 'Panigale V4',
                                        TO_DATE('2024-03-05', 'YYYY-MM-DD'), 80.00, 'grey');

        PKG_S1_MOTORBIKES.add_Shop(1, 'Speed Demons', '4000 High St.', '040-123-4567');
        PKG_S1_MOTORBIKES.add_Shop(2, 'Moto Works', '4001 High St.', '020-123-4568');
        PKG_S1_MOTORBIKES.add_Shop(3, 'Bike Heaven', '4002 High St.', '030-123-4569');
        PKG_S1_MOTORBIKES.add_Shop(4, 'Two Wheels', '4003 High St.', '030-123-4570');
        PKG_S1_MOTORBIKES.add_Shop(5, 'Rev It Up', '4004 High St.', '060-123-4571');


        PKG_S1_MOTORBIKES.add_Rental('ABC123', 'john.doe@example.com', TO_DATE('2024-04-01', 'YYYY-MM-DD'),
                                     TO_DATE('2024-04-05', 'YYYY-MM-DD'), 500.00, 'Speed Demons', '4000 High St.');
        PKG_S1_MOTORBIKES.add_Rental('DEF456', 'alice.smith@example.com',
                                     TO_DATE('2024-04-06', 'YYYY-MM-DD'), TO_DATE('2024-04-10', 'YYYY-MM-DD'), 400.00,
                                     'Moto Works', '4001 High St.');

        PKG_S1_MOTORBIKES.add_Rental('GHI789', 'bob.johnson@example.com', TO_DATE('2024-04-11', 'YYYY-MM-DD'),
                                     TO_DATE('2024-04-15', 'YYYY-MM-DD'), 600.00, 'Bike Heaven', '4002 High St.');

        PKG_S1_MOTORBIKES.add_Rental('JKL012', 'emily.brown@example.com', TO_DATE('2024-04-16', 'YYYY-MM-DD'),
                                     TO_DATE('2024-04-20', 'YYYY-MM-DD'), 440.00, 'Two Wheels', '4003 High St.');

        PKG_S1_MOTORBIKES.add_Rental('MNO345', 'sophia.davis@example.com',
                                     TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-04-25', 'YYYY-MM-DD'), 450.00,
                                     'Rev It Up', '4004 High St.');

        COMMIT;


    END BEWIJS_M4_S1 ;

    -----------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------

    --------------------************ M5 ***************------------------------------------------------------------

    FUNCTION random_list_element RETURN VARCHAR2
        IS
        TYPE t_string_list IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
        v_list  t_string_list;
        v_count NUMBER;
    BEGIN
        v_list(1) := 'Honda';
        v_list(2) := 'Yamaha';
        v_list(3) := 'Suzuki';
        v_list(4) := 'Kawasaki';
        v_list(5) := 'BMW';
        v_list(6) := 'Harley-Davidson';
        v_list(7) := 'Ducati';
        v_list(8) := 'KTM';
        v_list(9) := 'Aprilia';
        v_list(10) := 'MV Agust';

        v_count := PKG_SAMEN_MOTORBIKE.random_number(1, 10);
        RETURN v_list(v_count);
    END random_list_element;


    FUNCTION random_color RETURN VARCHAR2 IS
        TYPE t_color_list IS TABLE OF VARCHAR2(20) INDEX BY BINARY_INTEGER;
        v_colors t_color_list;
        v_index  INTEGER;
    BEGIN
        -- Lijst van kleuren
        v_colors(1) := 'Zwart';
        v_colors(2) := 'Wit';
        v_colors(3) := 'Rood';
        v_colors(4) := 'Blauw';
        v_colors(5) := 'Groen';
        v_colors(6) := 'Geel';
        v_colors(7) := 'Oranje';
        v_colors(8) := 'Zilver';
        v_colors(9) := 'Grijs';
        v_colors(10) := 'Paars';

        -- Kies een willekeurige index uit de lijst
        v_index := TRUNC(dbms_random.VALUE(1, 10)); -- dbms_random.VALUE genereert een decimale, TRUNC maakt er een integer van
        RETURN v_colors(v_index);
    END random_color;

    FUNCTION random_availabilityStatus return varchar2
        IS
        type t_availabilityStatus is table of MOTORBIKE.AVAILABILITYSTATUS%TYPE index by pls_integer;
        v_availabilityStatus t_availabilityStatus;
        v_index              integer;
    BEGIN
        v_availabilityStatus(1) := 'Available';
        v_availabilityStatus(2) := 'Not Available';
        v_index := TRUNC(DBMS_RANDOM.VALUE(1, 3));
        return v_availabilityStatus(v_index);
    END random_availabilityStatus;

    FUNCTION random_customer_firstname
        RETURN varchar2
        IS
        Type type_customerfirstname is TABLE OF CUSTOMER.FIRSTNAME%TYPE index by pls_integer;
        v_customername type_customerfirstname;
        v_index        integer;


    BEGIN
        v_customername(1) := 'John';
        v_customername(2) := 'Jane';
        v_customername(3) := 'Michael';
        v_customername(4) := 'Sarah';
        v_customername(5) := 'David';
        v_customername(6) := 'Emily';
        v_customername(7) := 'Chris';
        v_customername(8) := 'Emma';
        v_customername(9) := 'Daniel';
        v_customername(10) := 'Sophia';
        v_customername(11) := 'James';
        v_customername(12) := 'Olivia';
        v_customername(13) := 'Robert';
        v_customername(14) := 'Isabella';
        v_customername(15) := 'William';
        v_customername(16) := 'Mia';
        v_customername(17) := 'Joseph';
        v_customername(18) := 'Ava';
        v_customername(19) := 'Charles';
        v_customername(20) := 'Abigail';

        -- Kies een willekeurige index uit de lijst
        v_index := TRUNC(dbms_random.VALUE(1, 21));
        -- dbms_random.VALUE genereert een decimale, TRUNC maakt er een integer van

        -- Retourneer de willekeurige voornaam
        RETURN v_customername(v_index);
    END random_customer_firstname;

    function random_customer_lastname
        RETURN varchar2
        IS
        type t_customer_lastname is table of CUSTOMER.LASTNAME%TYPE index by pls_integer;
        v_cuslastname t_customer_lastname ;
        v_index       integer;
    BEGIN
        v_cuslastname(1) := 'Smith';
        v_cuslastname(2) := 'Johnson';
        v_cuslastname(3) := 'Williams';
        v_cuslastname(4) := 'Brown';
        v_cuslastname(5) := 'Jones';
        v_cuslastname(6) := 'Garcia';
        v_cuslastname(7) := 'Miller';
        v_cuslastname(8) := 'Davis';
        v_cuslastname(9) := 'Rodriguez';
        v_cuslastname(10) := 'Martinez';
        v_cuslastname(11) := 'Hernandez';
        v_cuslastname(12) := 'Lopez';
        v_cuslastname(13) := 'Gonzalez';
        v_cuslastname(14) := 'Wilson';
        v_cuslastname(15) := 'Anderson';
        v_cuslastname(16) := 'Thomas';
        v_cuslastname(17) := 'Taylor';
        v_cuslastname(18) := 'Moore';
        v_cuslastname(19) := 'Jackson';
        v_cuslastname(20) := 'Martin';
        v_index := TRUNC(dbms_random.VALUE(1, 21));
        return v_cuslastname(v_index);
    END random_customer_lastname;

    FUNCTION random_shop_name RETURN Shop.name%TYPE IS
        TYPE t_shop_name IS TABLE OF Shop.name%TYPE INDEX BY pls_integer;
        v_shop_names t_shop_name;
        v_index      integer;
    BEGIN
        -- Maak een lijst met winkelnamen
        v_shop_names(1) := 'Tech Haven';
        v_shop_names(2) := 'Fashion Fiesta';
        v_shop_names(3) := 'Grocery Galore';
        v_shop_names(4) := 'Book Nook';
        v_shop_names(5) := 'Toy Town';
        v_shop_names(6) := 'Gadget Garage';
        v_shop_names(7) := 'Beauty Boutique';
        v_shop_names(8) := 'Sports Spot';
        v_shop_names(9) := 'Furniture Factory';
        v_shop_names(10) := 'Pet Paradise';

        -- Kies een willekeurige index uit de lijst
        v_index := TRUNC(dbms_random.VALUE(1, 11));
        -- dbms_random.VALUE genereert een decimale, TRUNC maakt er een integer van

        -- Retourneer de willekeurige winkelnaam
        RETURN v_shop_names(v_index);
    END random_shop_name;


    FUNCTION random_shop_address RETURN Shop.address%TYPE IS
        TYPE t_shop_address IS TABLE OF Shop.address%TYPE INDEX BY pls_integer;
        v_shop_addresses t_shop_address;
        v_index          integer;
    BEGIN
        -- Maak een lijst met winkeladressen
        v_shop_addresses(1) := '123 Main St';
        v_shop_addresses(2) := '456 Elm St';
        v_shop_addresses(3) := '789 Oak St';
        v_shop_addresses(4) := '101 Pine St';
        v_shop_addresses(5) := '202 Maple St';
        v_shop_addresses(6) := '303 Birch St';
        v_shop_addresses(7) := '404 Cedar St';
        v_shop_addresses(8) := '505 Spruce St';
        v_shop_addresses(9) := '606 Willow St';
        v_shop_addresses(10) := '707 Cherry St';

        -- Kies een willekeurige index uit de lijst
        v_index := TRUNC(dbms_random.VALUE(1, 11));
        -- dbms_random.VALUE genereert een decimale, TRUNC maakt er een integer van

        -- Retourneer het willekeurige winkeladres
        RETURN v_shop_addresses(v_index);

    END random_shop_address;

    FUNCTION random_rentalStatus RETURN VARCHAR2 IS
        TYPE t_rental_status IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
        v_rental_statuses t_rental_status;
        v_index           INTEGER;
    BEGIN

        v_rental_statuses(1) := 'Booked';
        v_rental_statuses(2) := 'Active';
        v_rental_statuses(3) := 'Completed';
        v_rental_statuses(4) := 'Cancelled';
        v_rental_statuses(5) := 'Overdue';


        v_index := TRUNC(DBMS_RANDOM.VALUE(1, 6));

        RETURN v_rental_statuses(v_index);
    END random_rentalStatus;

    FUNCTION random_paymentDetails RETURN VARCHAR2 IS
        TYPE t_payment_details IS TABLE OF VARCHAR2(200) INDEX BY PLS_INTEGER;
        v_payment_details t_payment_details;
        v_index           INTEGER;
    BEGIN
        v_payment_details(1) := 'Paid via Credit Card';
        v_payment_details(2) := 'Paid via PayPal';
        v_payment_details(3) := 'Paid via Debit Card';
        v_payment_details(4) := 'Paid via Cash';
        v_payment_details(5) := 'Paid via Bank Transfer';

        v_index := TRUNC(DBMS_RANDOM.VALUE(1, 6));

        RETURN v_payment_details(v_index);
    END random_paymentDetails;

    FUNCTION random_customerFeedback RETURN VARCHAR2 IS
        TYPE t_customer_feedback IS TABLE OF VARCHAR2(500) INDEX BY PLS_INTEGER;
        v_customer_feedback t_customer_feedback;
        v_index             INTEGER;
    BEGIN
        v_customer_feedback(1) := 'Great service!';
        v_customer_feedback(2) := 'Very comfortable bike.';
        v_customer_feedback(3) := 'Had an amazing trip!';
        v_customer_feedback(4) := 'Smooth experience.';
        v_customer_feedback(5) := 'Had to cancel due to weather.';
        v_customer_feedback(6) := 'Great experience!';
        v_customer_feedback(7) := 'Not satisfied with the service.';
        v_customer_feedback(8) := 'Bike was not in good condition.';

        v_index := TRUNC(DBMS_RANDOM.VALUE(1, 9));

        RETURN v_customer_feedback(v_index);
    END random_customerFeedback;

    FUNCTION random_insuranceDetails RETURN VARCHAR2 IS
        TYPE t_insurance_details IS TABLE OF VARCHAR2(200) INDEX BY PLS_INTEGER;
        v_insurance_details t_insurance_details;
        v_index             INTEGER;
    BEGIN
        v_insurance_details(1) := 'Full Coverage Insurance';
        v_insurance_details(2) := 'Partial Coverage Insurance';
        v_insurance_details(3) := 'No Insurance';

        v_index := TRUNC(DBMS_RANDOM.VALUE(1, 4));

        RETURN v_insurance_details(v_index);
    END random_insuranceDetails;
------------**********-------------------

    PROCEDURE generateRandomCustomer(p_count IN NUMBER) IS
        v_firstName   Customer.firstName%TYPE;
        v_lastName    Customer.lastName%TYPE;
        v_phoneNumber Customer.phoneNumber%TYPE;
        v_email       Customer.email%TYPE;
        v_address     Customer.address%TYPE;
        v_birthDate   Customer.birthDate%TYPE;
    BEGIN
        FOR i IN 1..p_count
            LOOP
                v_firstName := random_customer_firstname;
                v_lastName := random_customer_lastname;
                v_phoneNumber := '04' || LPAD(TO_CHAR(PKG_SAMEN_MOTORBIKE.random_number(10000000, 99999999)), 8, '0');
                v_email := 'customer' || TO_CHAR(i) || PKG_SAMEN_MOTORBIKE.random_number(1, 8000) || '@example.com';
                v_address := 'Address ' || TO_CHAR(i);
                v_birthDate :=
                        PKG_SAMEN_MOTORBIKE.RANDOM_DATE(TO_DATE('01-JAN-1980', 'DD-MON-YYYY'),
                                                        TO_DATE('01-JAN-2000', 'DD-MON-YYYY'));
                add_Customer(v_firstName, v_lastName, v_phoneNumber, v_email, v_address, v_birthDate);

            END LOOP;
        COMMIT;
    END generateRandomCustomer;

    PROCEDURE generateRandomMotorBike(p_count IN NUMBER) IS
        v_chassisNr          MOTORBIKE.CHASSISNR%TYPE;
        v_brand              MOTORBIKE.BRAND%TYPE;
        v_registrationNr     MOTORBIKE.REGISTRATIONNR%TYPE;
        v_availabilityStatus MOTORBIKE.AVAILABILITYSTATUS%TYPE;
        v_model              MOTORBIKE.MODEL%TYPE;
        v_manufactureDate    MOTORBIKE.MANUFACTUREDATE%TYPE;
        v_rentalPricePerDay  MOTORBIKE.RENTALPRICEPERDAY%TYPE;
        v_color              MOTORBIKE.COLOR%TYPE;
    BEGIN
        FOR i IN 1..p_count
            LOOP
                v_chassisNr := DBMS_RANDOM.STRING('A', 3) || DBMS_RANDOM.STRING('N', 9);
                v_brand := random_list_element;
                v_registrationNr := 'REG' || LPAD(TO_CHAR(i), 10, '0') || TO_CHAR(SYSTIMESTAMP, 'FF');
                v_availabilityStatus := random_availabilityStatus;
                v_model := random_list_element;
                v_manufactureDate :=
                        PKG_SAMEN_MOTORBIKE.random_date(TO_DATE('01-JAN-2000', 'DD-MON-YYYY'),
                                                        TO_DATE('01-JAN-2024', 'DD-MON-YYYY'));
                v_rentalPricePerDay := PKG_SAMEN_MOTORBIKE.random_number(100, 500);
                v_color := random_color();
                add_MotorBike(v_chassisNr, v_brand, v_registrationNr, v_availabilityStatus, v_model, v_manufactureDate,
                              v_rentalPricePerDay, v_color);
            END LOOP;
        COMMIT;
    END generateRandomMotorBike;

    PROCEDURE generateRandomShop(p_count IN NUMBER) IS
        v_shopID  SHOP.SHOPID%TYPE;
        v_name    SHOP.NAME%TYPE;
        v_address SHOP.ADDRESS%TYPE;
        v_phone   SHOP.ADDRESS%TYPE;
    BEGIN
        FOR i IN 5..p_count
            LOOP
                v_shopID := i + 1;
                v_name := random_shop_name() || LPAD(TO_CHAR(i), 10, '0') || 'MotorBike shop';
                v_address := random_shop_address() || LPAD(TO_CHAR(i), 10, '0') || 'Antwerpen';
                v_phone := '04' || LPAD(TO_CHAR(PKG_SAMEN_MOTORBIKE.random_number(10000000, 99999999)), 8, '0');
                add_Shop(v_shopID, v_name, v_address, v_phone);
            END LOOP;
        COMMIT;
    END generateRandomShop;


    PROCEDURE generateRandomRental(p_count IN NUMBER) IS
        TYPE type_customer_id IS TABLE OF Customer.customerID%TYPE;
        TYPE type_chassisNr IS TABLE OF MotorBike.chassisNr%TYPE;
        TYPE type_shopID IS TABLE OF Shop.shopID%TYPE;
        t_customerID            type_customer_id;
        t_chassisNr             type_chassisNr;
        t_shopID                type_shopID;
        v_rentalStartDate       Rental.rentalStartDate%TYPE;
        v_rentalEndDate         Rental.rentalEndDate%TYPE;
        v_rentalStatus          Rental.RENTALSTATUS%TYPE;
        v_paymentDetails        Rental.PAYMENTDETAILS%TYPE;
        v_customerFeedback      Rental.CUSTOMERFEEDBACK%TYPE;
        v_insuranceDetails      Rental.INSURANCEDETAILS%TYPE;
        v_totalCost             Rental.totalCost%TYPE;
        v_shopID                Shop.shopID%TYPE;
        v_numRentalsPerCustomer NUMBER := 7;
        v_numRentalsPerShop     NUMBER := 7;
        v_totalRentals          NUMBER := 0;
    BEGIN
        -- Fetch alle Customer IDs
        SELECT customerID BULK COLLECT INTO t_customerID FROM Customer;

        -- Fetch alle Shop IDs
        SELECT shopID BULK COLLECT INTO t_shopID FROM Shop ORDER BY DBMS_RANDOM.VALUE;

        -- Lopen through each customer to create multiple rentals
        FOR i IN 1..t_customerID.COUNT
            LOOP
                -- Fetch random MotorBike chassis numbers for each customer
                SELECT chassisNr BULK COLLECT
                INTO t_chassisNr
                FROM MotorBike
                ORDER BY DBMS_RANDOM.VALUE FETCH FIRST v_numRentalsPerCustomer ROWS ONLY;

                FOR j IN 1..t_chassisNr.COUNT
                    LOOP
                        -- Lopen through shops to assign multiple rentals per shop
                        FOR k IN 1..v_numRentalsPerShop
                            LOOP
                                -- Generate random rental start and end dates
                                v_rentalStartDate :=
                                        PKG_SAMEN_MOTORBIKE.random_date(TO_DATE('2024-01-01', 'YYYY-MM-DD'),
                                                                        TO_DATE('2024-12-31', 'YYYY-MM-DD'));
                                v_rentalEndDate := v_rentalStartDate + DBMS_RANDOM.VALUE(1, 7);
                                v_totalCost := PKG_SAMEN_MOTORBIKE.random_number(100, 5000);
                                v_rentalStatus := random_rentalStatus();
                                v_paymentDetails := random_paymentDetails();
                                v_customerFeedback := random_customerFeedback();
                                v_insuranceDetails := random_insuranceDetails();

                                -- shop ID verwijzen
                                v_shopID := t_shopID(k);

                                -- Insert rental record
                                INSERT INTO Rental(CHASSISNR, customerID, rentalStartDate, rentalEndDate, rentalStatus,
                                                   paymentDetails, customerFeedback, insuranceDetails, totalCost,
                                                   shopID)
                                VALUES (t_chassisNr(j), t_customerID(i), v_rentalStartDate, v_rentalEndDate,
                                        v_rentalStatus, v_paymentDetails, v_customerFeedback, v_insuranceDetails,
                                        v_totalCost, v_shopID);
                                -- Increase rental count
                                v_totalRentals := v_totalRentals + 1;
                                -- Controleer if total rentals reached de desired count
                                EXIT WHEN v_totalRentals >= p_count;
                            END LOOP;
                        EXIT WHEN v_totalRentals >= p_count;
                    END LOOP;
                EXIT WHEN v_totalRentals >= p_count;
            END LOOP;
        COMMIT;
    END generateRandomRental;


    PROCEDURE Bewijs_Milestone_M5_S1(
        p_cus_count IN NUMBER DEFAULT 1,
        p_motB_count IN NUMBER DEFAULT 1,
        p_shop_count IN NUMBER DEFAULT 1,
        p_rental_count IN NUMBER DEFAULT 1
    ) IS
        v_start TIMESTAMP;
        v_end   TIMESTAMP;
        v_diff  NUMBER;
    BEGIN
        -- 4.1: Generate Random Customers
        v_start := SYSTIMESTAMP;
        GENERATERANDOMCUSTOMER(p_cus_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.1 generateRandomCustomer(' ||
                             p_cus_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.2: Generate Random MotorBikes
        v_start := SYSTIMESTAMP;
        GENERATERANDOMMOTORBIKE(p_motB_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.2 generateRandomMotorBikes(' ||
                             p_motB_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.3: Generate Random Shops
        v_start := SYSTIMESTAMP;
        GENERATERANDOMSHOP(p_shop_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.3 generateRandomShop(' ||
                             p_shop_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.4: Generate Random Rentals
        v_start := SYSTIMESTAMP;
        GENERATERANDOMRENTAL(p_rental_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.4 generateRandomRental(' ||
                             p_rental_count || ') completed in ' || v_diff || ' seconds.');
    END Bewijs_Milestone_M5_S1;

    -----------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------

    ----------------------------------------************ M7 ***************------------------------------------------------------------

    PROCEDURE add_Customer_bulk(customers in t_customer_bulk) IS
    BEGIN
        FORALL i in indices of customers
            INSERT INTO Customer (firstName, lastName, phoneNumber, email, address, birthDate)
            VALUES (customers(i).firstName, customers(i).lastName, customers(i).phoneNumber, customers(i).email,
                    customers(i).address, customers(i).birthDate);
        commit;
    END add_Customer_bulk;

    PROCEDURE add_motorBike_bulk(motorBikes in t_motorBikes_bulk)
        IS
    BEGIN
        FORALL i in indices of motorBikes
            insert into MOTORBIKE(chassisNr, brand, REGISTRATIONNR, availabilityStatus, model, manufactureDate,
                                  rentalPricePerDay, COLOR)
            values (motorBikes(i).CHASSISNR, motorBikes(i).BRAND, motorBikes(i).REGISTRATIONNR,
                    motorBikes(i).AVAILABILITYSTATUS, motorBikes(i).MODEL,
                    motorBikes(i).MANUFACTUREDATE, motorBikes(i).RENTALPRICEPERDAY, motorBikes(i).COLOR);
    END add_motorBike_bulk;


    PROCEDURE add_shop_bulk(shops in t_shop_bulk)
        IS
    BEGIN
        FORALL i in indices of shops
            insert into SHOP(shopID, name, address, phone)
            values (shops(i).SHOPID, shops(i).NAME, shops(i).ADDRESS, shops(i).SHOPID);
    END add_shop_bulk;

    PROCEDURE add_rental_bulk(rentals in t_rental_bulk)
        IS
    BEGIN
        FORALL i in indices of rentals
            insert into RENTAL(CHASSISNR, CUSTOMERID, RENTALSTARTDATE, RENTALENDDATE, RENTALSTATUS, paymentDetails,
                               customerFeedback, insuranceDetails, TOTALCOST,
                               SHOPID)
            values (rentals(i).CHASSISNR, rentals(i).CUSTOMERID, rentals(i).RENTALSTARTDATE, rentals(i).RENTALENDDATE,
                    rentals(i).RENTALSTATUS, rentals(i).PAYMENTDETAILS, rentals(i).CUSTOMERFEEDBACK,
                    rentals(i).INSURANCEDETAILS, rentals(i).TOTALCOST, rentals(i).SHOPID);

    END add_rental_bulk;


    PROCEDURE generateRandomCustomer_bulk(p_count IN NUMBER DEFAULT 1)
        IS
        v_customers t_customer_bulk;
    BEGIN
        FOR i IN 1..p_count
            LOOP
                v_customers(i).FIRSTNAME := 'Customer' || i;
                v_customers(i).LASTNAME := 'de Rijk' || i;
                v_customers(i).PHONENUMBER :=
                            '04' || LPAD(TO_CHAR(PKG_SAMEN_MOTORBIKE.random_number(10000000, 99999999)), 8, '0');
                v_customers(i).email :=
                            'customer' || TO_CHAR(i) || PKG_SAMEN_MOTORBIKE.random_number(1, 8000) || '@example.com';
                v_customers(i).address := 'Address ' || i;
                v_customers(i).birthDate :=
                        PKG_SAMEN_MOTORBIKE.random_date(TO_DATE('01-JAN-1980', 'DD-MON-YYYY'),
                                                        TO_DATE('01-JAN-2000', 'DD-MON-YYYY'));
            end loop;
        add_Customer_bulk(v_customers);
    END generateRandomCustomer_bulk;


    PROCEDURE generatedRandomMotorBike_bulk(p_count IN NUMBER DEFAULT 1)
        IS
        v_motorBikes t_motorBikes_bulk;
    BEGIN
        FOR i IN 1.. p_count
            LOOP
                v_motorBikes(i).CHASSISNR := DBMS_RANDOM.STRING('A', 3) || DBMS_RANDOM.STRING('N', 9);
                v_motorBikes(i).BRAND := 'Brand' || i;
                v_motorBikes(i).REGISTRATIONNR := 'REG' || LPAD(TO_CHAR(i), 10, '0') || TO_CHAR(SYSTIMESTAMP, 'FF');
                v_motorBikes(i).availabilityStatus := random_availabilityStatus;
                v_motorBikes(i).MODEL := random_list_element();
                v_motorBikes(i).MANUFACTUREDATE :=
                        PKG_SAMEN_MOTORBIKE.random_date(TO_DATE('01-JAN-2000', 'DD-MON-YYYY'),
                                                        TO_DATE('01-JAN-2024', 'DD-MON-YYYY'));
                v_motorBikes(i).RENTALPRICEPERDAY := PKG_SAMEN_MOTORBIKE.RANDOM_NUMBER(1, 5000);
                v_motorBikes(i).COLOR := random_color();

            end loop;
        add_motorBike_bulk(v_motorBikes);

    END generatedRandomMotorBike_bulk;

    PROCEDURE generateRandomShop_bulk(p_count in number default 1)
        IS
        v_shops t_shop_bulk;
    BEGIN
        FOR i in 1.. p_count
            LOOP
                v_shops(i).SHOPID := i;
                v_shops(i).NAME := random_shop_name() || LPAD(TO_CHAR(i), 10, '0') || 'MotorBike shop';
                v_shops(i).ADDRESS := random_shop_address() || LPAD(TO_CHAR(i), 10, '0') || 'Antwerpen';
                v_shops(i).PHONE :=
                            '04' || LPAD(TO_CHAR(PKG_SAMEN_MOTORBIKE.random_number(10000000, 99999999)), 8, '0');

            end loop;
        add_shop_bulk(v_shops);
    END generateRandomShop_bulk;


    PROCEDURE generateRandomRental_bulk(p_count IN NUMBER DEFAULT 1) IS
        v_rentals     t_rental_bulk;
        TYPE t_customerID_tab IS TABLE OF Customer.customerID%TYPE INDEX BY PLS_INTEGER;
        TYPE t_chassisNr_tab IS TABLE OF MotorBike.chassisNr%TYPE INDEX BY PLS_INTEGER ;
        TYPE t_shopID_tab IS TABLE OF Shop.shopID%TYPE INDEX BY PLS_INTEGER;
        v_customerIDs t_customerID_tab;
        v_chassisNrs  t_chassisNr_tab;
        v_shopIDs     t_shopID_tab;
    BEGIN
        -- Retrieve valid customer IDs
        SELECT customerID BULK COLLECT INTO v_customerIDs FROM Customer ORDER BY DBMS_RANDOM.VALUE();
        -- Retrieve valid chassis numbers
        SELECT chassisNr BULK COLLECT INTO v_chassisNrs FROM MotorBike ORDER BY DBMS_RANDOM.VALUE();
        -- Retrieve valid shop IDs
        SELECT shopID BULK COLLECT INTO v_shopIDs FROM Shop ORDER BY DBMS_RANDOM.VALUE();

        FOR i IN 1.. p_count
            LOOP
                v_rentals(i).chassisNr := v_chassisNrs(DBMS_RANDOM.VALUE(1, v_chassisNrs.COUNT));
                v_rentals(i).customerID := v_customerIDs(DBMS_RANDOM.VALUE(1, v_customerIDs.COUNT));
                v_rentals(i).rentalStartDate := PKG_SAMEN_MOTORBIKE.random_date(SYSDATE - 365, SYSDATE);
                v_rentals(i).rentalEndDate := v_rentals(i).rentalStartDate + DBMS_RANDOM.VALUE(1, 30);
                v_rentals(i).RENTALSTATUS := random_rentalStatus();
                v_rentals(i).PAYMENTDETAILS := random_paymentDetails();
                v_rentals(i).CUSTOMERFEEDBACK := random_customerFeedback();
                v_rentals(i).INSURANCEDETAILS := random_insuranceDetails();
                v_rentals(i).totalCost := PKG_SAMEN_MOTORBIKE.RANDOM_NUMBER(500, 5000);
                v_rentals(i).shopID := v_shopIDs(DBMS_RANDOM.VALUE(1, v_shopIDs.COUNT));
            END LOOP;

        add_rental_bulk(v_rentals);
    END generateRandomRental_bulk;


    PROCEDURE Bewijs_Milestone_M7_S1(
        p_cus_count IN NUMBER DEFAULT 1,
        p_motB_count IN NUMBER DEFAULT 1,
        p_shop_count IN NUMBER DEFAULT 1,
        p_rental_count IN NUMBER DEFAULT 1
    ) IS
        v_start TIMESTAMP;
        v_end   TIMESTAMP;
        v_diff  NUMBER;
    BEGIN
        -- 4.1: Generate Random Customers
        v_start := SYSTIMESTAMP;
        generateRandomCustomer_bulk(p_cus_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.1 generateRandomCustomer_bulk(' ||
                             p_cus_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.2: Generate Random MotorBikes
        v_start := SYSTIMESTAMP;
        generatedRandomMotorBike_bulk(p_motB_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.2 generatedRandomMotorBike_bulk(' ||
                             p_motB_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.3: Generate Random Shops
        v_start := SYSTIMESTAMP;
        generateRandomShop_bulk(p_shop_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.3 generateRandomShop_bulk(' ||
                             p_shop_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.4: Generate Random Rentals
        v_start := SYSTIMESTAMP;
        generateRandomRental_bulk(p_rental_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.4 generateRandomRental_bulk(' ||
                             p_rental_count || ') completed in ' || v_diff || ' seconds.');
    END Bewijs_Milestone_M7_S1;

End PKG_S1_MOTORBIKES;

SELECT sequence_name
FROM user_sequences;
