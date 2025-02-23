create or replace package body PKG_S2_MOTORBIKES as

    TYPE t_department_bulk IS TABLE OF DEPARTMENT%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE t_motorBike_bulk IS TABLE OF MOTORBIKE%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE t_maintenance_bulk IS TABLE OF MAINTENANCE%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE t_employee_bulk IS TABLE OF EMPLOYEE%ROWTYPE INDEX BY PLS_INTEGER;
    TYPE t_service_bulk IS TABLE OF SERVICE%ROWTYPE INDEX BY PLS_INTEGER;

    PROCEDURE EMPTY_TABLES_S2 IS
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
        EXECUTE IMMEDIATE 'TRUNCATE TABLE Department';
        EXECUTE IMMEDIATE 'TRUNCATE TABLE Maintenance';
        EXECUTE IMMEDIATE 'TRUNCATE TABLE Employee';
        EXECUTE IMMEDIATE 'TRUNCATE TABLE Service';
        EXECUTE IMMEDIATE 'ALTER TABLE DEPARTMENT MODIFY (DEPARTMENTID GENERATED ALWAYS AS IDENTITY (START WITH 1))';
        EXECUTE IMMEDIATE 'ALTER TABLE MAINTENANCE MODIFY (MAINTENANCEID GENERATED ALWAYS AS IDENTITY (START WITH 1))';
        EXECUTE IMMEDIATE 'ALTER TABLE EMPLOYEE MODIFY (EMPLOYEEID GENERATED ALWAYS AS IDENTITY (START WITH 1))';
        EXECUTE IMMEDIATE 'ALTER TABLE SERVICE MODIFY (SERVICEID GENERATED ALWAYS AS IDENTITY (START WITH 1))';
        -- Enable foreign key constraints back
        FOR c IN (SELECT constraint_name, table_name
                  FROM user_constraints
                  WHERE constraint_type = 'R'
                    AND status = 'DISABLED')
            LOOP
                EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name || ' ENABLE CONSTRAINT ' || c.constraint_name;
            END LOOP;


    END EMPTY_TABLES_S2;

        --Lookup functies--
    -- Employee Lookup method for departmentId based on departmentName
    function lookup_DepartmentId(p_name Department.name%TYPE) return Department.departmentID%TYPE is
        v_departmentID Department.departmentID%TYPE;
    begin
        select departmentID into v_departmentID from Department where name = p_name;
        return v_departmentID;
    exception
        when no_data_found then
            return null;
    end lookup_DepartmentId;

    -- Employee Lookup method for maintenanceId based on maintenanceDescription and maintenanceDate
    function lookup_MaintenanceId(p_maintenanceDescription Maintenance.maintenanceDescription%TYPE,
                                  p_maintenanceDate Maintenance.maintenanceDate%TYPE) return Maintenance.maintenanceID%TYPE is
        v_maintenanceID Maintenance.maintenanceID%TYPE;
    begin
        select maintenanceID
        into v_maintenanceID
        from Maintenance
        where maintenanceDescription = p_maintenanceDescription
          and maintenanceDate = p_maintenanceDate;
        return v_maintenanceID;
    exception
        when no_data_found then
            return null;
    end lookup_MaintenanceId;

    -- Private opzoekfuncties to look up the employeeID based on firstName and lastName
    function lookup_EmployeeID(p_firstName IN Employee.firstName%TYPE,
                               p_lastName IN Employee.lastName%TYPE) return Employee.employeeID%TYPE is
        v_employeeID Employee.employeeID%TYPE;
    begin
        select employeeID into v_employeeID from Employee where firstName = p_firstName and lastName = p_lastName;
        return v_employeeID;
    exception
        when no_data_found then
            return null;
    end lookup_EmployeeID;

    -- Private function to look up the customerID based on email
    function lookup_CustomerID(p_email IN Customer.email%TYPE) return Customer.customerID%TYPE is
        v_customerID Customer.customerID%TYPE;
    begin
        select customerID
        into v_customerID
        from Customer
        where email = p_email;

        return v_customerID;
    exception
        when no_data_found then
            return null;
    end lookup_CustomerID;


    procedure add_Department(
        p_name Department.name%TYPE,
        p_location Department.location%TYPE,
        p_tasks Department.tasks%TYPE
    ) is
    begin
        -- Insert the department into the Department table
        insert into Department (name, location, tasks)
        values (p_name, p_location, p_tasks);
    end add_Department;


    -- Private procedure om een rij toe te voegen aan de Maintenance tabel
    procedure add_Maintenance(
        p_maintenanceDescription Maintenance.maintenanceDescription%TYPE,
        p_registrationNr MOTORBIKE.REGISTRATIONNR%TYPE,
        p_maintenanceType Maintenance.maintenanceType%TYPE,
        p_maintenanceDate Maintenance.maintenanceDate%TYPE
    ) is
        v_chassisNr MOTORBIKE.chassisNr%TYPE;
    begin
        v_chassisNr := PKG_S1_MOTORBIKES.LOOKUP_MOTORBIKE(p_registrationNr);

        insert into Maintenance (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
        values (p_maintenanceDescription, v_chassisNr, p_maintenanceType, p_maintenanceDate);
    end add_Maintenance;

    -- Private procedure om een rij toe te voegen aan de Employee tabel
    procedure add_Employee(p_firstName Employee.firstName%TYPE,
                           p_lastName Employee.lastName%TYPE,
                           p_position Employee.position%TYPE,
                           p_departmentName Department.name%TYPE,
                           p_maintenanceDescription Maintenance.maintenanceDescription%TYPE,
                           p_maintenanceDate Maintenance.maintenanceDate%TYPE
    ) is
        v_departmentId  Department.departmentID%TYPE;
        v_maintenanceId Maintenance.maintenanceID%TYPE;
    begin
        -- Look up departmentId based on departmentName
        v_departmentId := lookup_DepartmentId(p_departmentName);
        -- Look up maintenanceId based on maintenanceDescription and maintenanceDate
        v_maintenanceId := lookup_MaintenanceId(p_maintenanceDescription, p_maintenanceDate);

        insert into Employee (firstName, lastName, position, departmentID, maintenanceID)
        values (p_firstName, p_lastName, p_position, v_departmentId, v_maintenanceId);
    end add_Employee;

    -- Private procedure om een rij toe te voegen aan de Service tabel
    procedure add_Service(p_employeeFirstName Employee.firstName%TYPE,
                                        p_employeeLastName Employee.lastName%TYPE,
                                        p_customerEmail Customer.email%TYPE,
                                        p_customerFirstName Customer.firstName%TYPE,
                                        p_customerLastName Customer.lastName%TYPE,
                                        p_serviceDetails Service.serviceDetails%TYPE,
                                        p_serviceDate Service.serviceDate%TYPE
    ) is
        v_employeeID Employee.employeeID%TYPE;
        v_customerID Customer.customerID%TYPE;
    begin
        v_employeeID := lookup_EmployeeID(p_employeeFirstName, p_employeeLastName);
        v_customerID := lookup_CustomerID(p_customerEmail);

        insert into Service (employeeID, EMPLOYEENAME,  customerID,CUSTOMERNAME, serviceDetails, serviceDate)
        values (v_employeeID, p_employeeFirstName || ' ' || p_employeeLastName,
                v_customerID, p_customerFirstName || ' ' || p_customerLastName,
                p_serviceDetails, p_serviceDate);
    end add_Service;

    PROCEDURE BEWIJS_M4_S2
        IS
    BEGIN

        -- Gegevens voor de Department-tabel
        add_Department('Sales', 'Headquarters', 'Sales and marketing');
        add_Department('Engineering', 'R&D Center', 'Product development');
        add_Department('Human Resources', 'Corporate Office', 'Employee management');
        add_Department('Finance', 'Finance Department', 'Financial management');
        add_Department('Customer Service', 'Service Center', 'Customer support');

        -- Voorbeeldgegevens voor de Maintenance-tabel
        add_Maintenance('Oil Change', 'ABC123', 'Regular Maintenance', TO_DATE('2024-03-01', 'YYYY-MM-DD'));
        add_Maintenance('Brake Inspection', 'DEF456', 'Regular Maintenance', TO_DATE('2024-02-15', 'YYYY-MM-DD'));
        add_Maintenance('Tire Replacement', 'GHI789', 'Emergency Maintenance', TO_DATE('2024-04-10', 'YYYY-MM-DD'));
        add_Maintenance('Chain Lubrication', 'GHI789', 'Regular Maintenance', TO_DATE('2024-03-20', 'YYYY-MM-DD'));
        add_Maintenance('Battery Replacement', 'DEF456', 'Regular Maintenance', TO_DATE('2024-01-05', 'YYYY-MM-DD'));
        add_Maintenance('Tire Replacement', 'DEF456', 'Regular Maintenance', TO_DATE('2024-01-10', 'YYYY-MM-DD'));
        add_Maintenance('Tire Replacement', 'GHI789', 'Regular Maintenance', TO_DATE('2024-01-10', 'YYYY-MM-DD'));

        -- Voorbeeldgegevens voor de Employee-tabel
        add_Employee('John', 'Doe', 'Sales Manager', 'Sales', 'Oil Change', TO_DATE('2024-03-01', 'YYYY-MM-DD'));
        add_Employee('Alice', 'Smith', 'Software Engineer', 'Engineering', 'Brake Inspection',
                     TO_DATE('2024-02-15', 'YYYY-MM-DD'));
        add_Employee('Bob', 'Johnson', 'HR Specialist', 'Human Resources', 'Tire Replacement',
                     TO_DATE('2024-04-10', 'YYYY-MM-DD'));
        add_Employee('Emily', 'Brown', 'Financial Analyst', 'Finance', 'Chain Lubrication',
                     TO_DATE('2024-03-20', 'YYYY-MM-DD'));
        add_Employee('Sophia', 'Davis', 'Customer Support Representative', 'Customer Service', 'Battery Replacement',
                     TO_DATE('2024-01-05', 'YYYY-MM-DD'));

        -- Gegevens voor de Services-tabel
        add_Service('John', 'Doe', 'john.doe@example.com', 'Alice', 'Smith','Oil Change', TO_DATE('2024-03-01', 'YYYY-MM-DD'));
        add_Service('Emily', 'Brown', 'emily.brown@example.com', 'John', 'Doe','Tire Replacement',
                    TO_DATE('2024-02-15', 'YYYY-MM-DD'));
        add_Service('Sophia', 'Davis', 'sophia.davis@example.com', 'Bob', 'Johnson','Brake Inspection',
                    TO_DATE('2024-04-10', 'YYYY-MM-DD'));
        add_Service('Bob', 'Johnson', 'bob.johnson@example.com', 'Emily', 'Brown', 'Battery Replacement',
                    TO_DATE('2024-01-05', 'YYYY-MM-DD'));
        add_Service('Alice', 'Smith', 'alice.smith@example.com', 'Sophia', 'Davis','Chain Lubrication',
                    TO_DATE('2024-03-20', 'YYYY-MM-DD'));
        COMMIT;

    END BEWIJS_M4_S2;

--------------------------------------------------------------------------------------------------------
    --------------------------------------************ M5  **********----------------------------------
    --------------------------------------------------------------------------------------------------------
    FUNCTION random_list_element_DepartmentName RETURN VARCHAR2
        IS
        TYPE t_string_list IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
        v_list  t_string_list;
        v_count NUMBER;
    BEGIN
        v_list(1) := 'Sales';
        v_list(2) := 'Engineering';
        v_list(3) := 'Human Resources';
        v_list(4) := 'Finance';
        v_list(5) := 'Customer Service';
        v_list(6) := 'Marketing';
        v_list(7) := 'Information Technology';
        v_list(8) := 'Operations';
        v_list(9) := 'Research and Development';
        v_list(10) := 'Supply Chain';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);
    END random_list_element_DepartmentName;

    FUNCTION random_department_location RETURN DEPARTMENT.LOCATION%TYPE
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(500) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Antwerpen';
        v_list(2) := 'Brussel';
        v_list(3) := 'Gent';
        v_list(4) := 'Leuven';
        v_list(5) := 'Hasselt';
        v_list(6) := 'Mechelen';
        v_list(7) := 'Kortrijk';
        v_list(8) := 'Oostende';
        v_list(9) := 'Aalst';
        v_list(10) := 'Sint-Niklaas';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);

    END random_department_location;

    FUNCTION random_department_tasks RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(500) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Sales';
        v_list(2) := 'Engineering';
        v_list(3) := 'Human Resources';
        v_list(4) := 'Finance';
        v_list(5) := 'Customer Service';
        v_list(6) := 'Marketing';
        v_list(7) := 'Information Technology';
        v_list(8) := 'Operations';
        v_list(9) := 'Research and Development';
        v_list(10) := 'Supply Chain';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);
    END random_department_tasks;

    FUNCTION random_maintenanceDescription RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(100) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Oil Change';
        v_list(2) := 'Tire Rotation';
        v_list(3) := 'Brake Inspection';
        v_list(4) := 'Battery Replacement';
        v_list(5) := 'Engine Tune-Up';
        v_list(6) := 'Air Filter Replacement';
        v_list(7) := 'Coolant Flush';
        v_list(8) := 'Transmission Flush';
        v_list(9) := 'Wheel Alignment';
        v_list(10) := 'Spark Plug Replacement';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);
    END random_maintenanceDescription;

    FUNCTION random_maintenanceType RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(100) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Scheduled';
        v_list(2) := 'Unscheduled';
        v_list(3) := 'Emergency';
        v_list(4) := 'Preventive';
        v_list(5) := 'Predictive';
        v_list(6) := 'Corrective';
        v_list(7) := 'Condition-Based';
        v_list(8) := 'Reliability-Centered';
        v_list(9) := 'Total Productive';
        v_list(10) := 'Routine';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);
    END random_maintenanceType;

    FUNCTION random_employee_firstname RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(50) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'John';
        v_list(2) := 'Jane';
        v_list(3) := 'Michael';
        v_list(4) := 'Emily';
        v_list(5) := 'David';
        v_list(6) := 'Sarah';
        v_list(7) := 'Robert';
        v_list(8) := 'Jennifer';
        v_list(9) := 'William';
        v_list(10) := 'Jessica';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN SUBSTR(v_list(v_count), 1, 10); -- Ensure the length is not more than 10 characters
    END random_employee_firstname;

    FUNCTION random_employee_lastname RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(50) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Smith';
        v_list(2) := 'Johnson';
        v_list(3) := 'Williams';
        v_list(4) := 'Jones';
        v_list(5) := 'Brown';
        v_list(6) := 'Davis';
        v_list(7) := 'Miller';
        v_list(8) := 'Wilson';
        v_list(9) := 'Moore';
        v_list(10) := 'Taylor';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);
    END random_employee_lastname;

    FUNCTION random_customer_firstname RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(50) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'John';
        v_list(2) := 'Jane';
        v_list(3) := 'Michael';
        v_list(4) := 'Emily';
        v_list(5) := 'David';
        v_list(6) := 'Sarah';
        v_list(7) := 'Robert';
        v_list(8) := 'Jennifer';
        v_list(9) := 'William';
        v_list(10) := 'Jessica';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN SUBSTR(v_list(v_count), 1, 10); -- Ensure the length is not more than 10 characters
    END random_customer_firstname;

    FUNCTION random_customer_lastname RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(50) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Smith';
        v_list(2) := 'Johnson';
        v_list(3) := 'Williams';
        v_list(4) := 'Jones';
        v_list(5) := 'Brown';
        v_list(6) := 'Davis';
        v_list(7) := 'Miller';
        v_list(8) := 'Wilson';
        v_list(9) := 'Moore';
        v_list(10) := 'Taylor';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);
    END random_customer_lastname;

    FUNCTION random_employee_position RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(500) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Manager';
        v_list(2) := 'Employee';
        v_list(3) := 'Specialist';
        v_list(4) := 'Consultant';
        v_list(5) := 'Administrator';

        v_count :=TRUNC(dbms_random.VALUE(1, 6));
        RETURN v_list(v_count);
    END random_employee_position;

    FUNCTION random_service_Details RETURN VARCHAR2
        IS
        TYPE t_string_list  IS TABLE OF VARCHAR(500) INDEX BY PLS_INTEGER;
        v_list            t_string_list;
        v_count          NUMBER;
    BEGIN
        v_list(1) := 'Oil Change';
        v_list(2) := 'Tire Rotation';
        v_list(3) := 'Brake Inspection';
        v_list(4) := 'Battery Replacement';
        v_list(5) := 'Engine Tune-Up';
        v_list(6) := 'Air Filter Replacement';
        v_list(7) := 'Coolant Flush';
        v_list(8) := 'Transmission Flush';
        v_list(9) := 'Wheel Alignment';
        v_list(10) := 'Spark Plug Replacement';

        v_count :=TRUNC(dbms_random.VALUE(1, 11));
        RETURN v_list(v_count);
    END random_service_Details;

        -------------------------------------------------------------------------------------
                      --------------******  M5 procedure ********--------------
        -------------------------------------------------------------------------------------
    PROCEDURE generateRandomDepartment(p_count IN NUMBER) IS
        v_name     DEPARTMENT.NAME%type;
        v_location Department.location%TYPE;
        v_tasks    Department.tasks%TYPE;
    BEGIN
        FOR i IN 1..p_count LOOP
                v_name := random_list_element_DepartmentName || LPAD(TO_CHAR(i), 10, '0') || ' Department';
                v_location := random_department_location || i || LPAD(TO_CHAR(i), 10, '0') || ', Belgium';
                v_tasks := random_department_tasks || i;

--                 INSERT INTO DEPARTMENT(name, location, tasks)
--                 values
                add_Department(v_name, v_location, v_tasks);
            END LOOP;
        COMMIT;
    END generateRandomDepartment;

    PROCEDURE generateRandomMaintenance(p_count IN number) IS
        TYPE type_chassisNr IS TABLE OF MOTORBIKE.CHASSISNR%TYPE;
        v_maintenanceDescription        MAINTENANCE.MAINTENANCEDESCRIPTION%TYPE;
        t_chassisNr                     type_chassisNr;
        v_maintenanceType               MAINTENANCE.MAINTENANCETYPE%TYPE;
        v_maintenanceDate               MAINTENANCE.MAINTENANCEDATE%TYPE;
        v_totalMaintenances             NUMBER := 0;
    BEGIN
        -- Fetch alle ChssisNrs
        select CHASSISNR bulk collect into t_chassisNr from MOTORBIKE;

        FOR i IN 1..p_count LOOP
                v_maintenanceDescription := random_maintenanceDescription;
                v_maintenanceType := random_maintenanceType;
                v_maintenanceDate := PKG_SAMEN_MOTORBIKE.random_date(TO_DATE('01-JAN-2020', 'DD-MON-YYYY'), SYSDATE);
                -- Insert the maintenance record
                INSERT INTO MAINTENANCE (maintenanceDescription, chassisNr, maintenanceType, maintenanceDate)
                VALUES (v_maintenanceDescription, t_chassisNr(i), v_maintenanceType, v_maintenanceDate);
            END LOOP;
        commit ;
    END generateRandomMaintenance;

    PROCEDURE generateRandomEmployee(p_count IN number) IS
        TYPE type_maintenanceId  IS TABLE OF MAINTENANCE.MAINTENANCEID%TYPE;
        TYPE type_departmentId IS TABLE OF DEPARTMENT.DEPARTMENTID%TYPE;
        v_firstName              EMPLOYEE.FIRSTNAME%TYPE;
        v_lastName               EMPLOYEE.LASTNAME%TYPE;
        v_position               EMPLOYEE.POSITION%TYPE;
        t_maintenanceId          type_maintenanceId;
        t_departmentId           type_departmentId;
        v_numEmployeesPerDepartment NUMBER := 10;
        v_numEmployeesPerMaintenance NUMBER := 10;
        v_totalEmployees NUMBER := 0;
    BEGIN
        -- FETCH ALLE MaintenanceIds VAN MAINTENANCE
        select MAINTENANCEID BULK COLLECT INTO t_maintenanceId from MAINTENANCE;
        -- Loop over each maintenance record
        FOR i IN 1..t_maintenanceId.COUNT LOOP
                FOR j IN 1..v_numEmployeesPerMaintenance LOOP

                        select DEPARTMENTID BULK COLLECT
                        INTO t_departmentId
                        from DEPARTMENT
                        order by DBMS_RANDOM.VALUE()
                            fetch first 3 rows only ;
                        -- Generate random employee data
                        v_firstName := random_employee_firstname;
                        v_lastName := random_employee_lastname;
                        v_position := random_employee_position;

                        FOR K IN 1..t_departmentId.COUNT
                            LOOP
                                -- Insert the employee record
                                INSERT INTO EMPLOYEE (FIRSTNAME, LASTNAME, POSITION, MAINTENANCEID, DEPARTMENTID)
                                VALUES (v_firstName, v_lastName, v_position, t_maintenanceId(i), t_departmentId(K));
                                v_totalEmployees := v_totalEmployees + 1;
                            END LOOP;
                    END LOOP;
            END LOOP;
        COMMIT;
    END generateRandomEmployee;

    PROCEDURE generateRandomService(p_count IN NUMBER)
        IS
        TYPE type_employeeId IS TABLE OF EMPLOYEE.EMPLOYEEID%TYPE;
        TYPE type_customerId IS TABLE OF CUSTOMER.CUSTOMERID%TYPE;
        v_EmployeeName         SERVICE.EMPLOYEENAME%TYPE;
        v_CustomerName         SERVICE.CUSTOMERNAME%TYPE;
        v_serviceDetails       SERVICE.SERVICEDETAILS%TYPE;
        v_serviceDate          SERVICE.SERVICEDATE%TYPE;
        t_employeeId           type_employeeId;
        t_customerId           type_customerId;
        v_numServicesPerEmployee NUMBER := 30; --om te bepalen aantal instances inserted to Service
        v_numServicePerCustomer NUMBER := 30;
        v_totalServices         NUMBER := 0;
    BEGIN
        -- Fetch all employee IDs and customer IDs
        SELECT EMPLOYEEID BULK COLLECT INTO t_employeeId FROM EMPLOYEE;
        -- Loop over each iteration
        FOR i IN 1..t_employeeId.COUNT LOOP
                -- Generate service records for the current employee
                FOR j IN 1..v_numServicesPerEmployee LOOP
                        -- Fetch customer IDs for the current employee
                        SELECT CUSTOMERID BULK COLLECT
                        INTO t_customerId
                        FROM CUSTOMER
                        ORDER BY DBMS_RANDOM.VALUE()
                            FETCH FIRST 2 ROWS ONLY ;

                        v_EmployeeName := random_employee_firstname || ' ' || random_employee_lastname || i;
                        v_CustomerName := random_customer_firstname || ' ' || random_customer_lastname || i;
                        v_serviceDetails := random_service_Details || i;
                        v_serviceDate := PKG_SAMEN_MOTORBIKE.random_date(TO_DATE('01-JAN-2020', 'DD-MON-YYYY'), SYSDATE);

                        FOR k IN 1..t_customerId.COUNT
                            LOOP
                                INSERT INTO SERVICE (EMPLOYEEID, EMPLOYEENAME, CUSTOMERID,CUSTOMERNAME, SERVICEDETAILS, SERVICEDATE)
                                VALUES (t_employeeId(i),v_EmployeeName, t_customerId(k), v_CustomerName, v_serviceDetails, v_serviceDate);
                                v_totalServices := v_totalServices + 1;
                            END LOOP;
                    END LOOP;
            END LOOP;
        DBMS_OUTPUT.PUT_LINE('Total services inserted: ' || v_totalServices);
        COMMIT;
    END generateRandomService;


    PROCEDURE BEWIJS_MILESTONE_M5_S2(
        p_motorbike_count IN NUMBER DEFAULT 1,
        p_department_count IN NUMBER DEFAULT 1,
        p_maintenance_count IN NUMBER DEFAULT 1,
        p_employee_count IN NUMBER DEFAULT 1,
        p_service_count IN NUMBER DEFAULT 1
    ) IS
        v_start TIMESTAMP;
        v_end TIMESTAMP;
        v_diff NUMBER;
    BEGIN
        -- 4.2: Generate Random MotorBikes
        v_start := SYSTIMESTAMP;
        PKG_S1_MOTORBIKES.GENERATERANDOMMOTORBIKE(p_motorbike_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.1 generateRandomMotorBikes(' ||
                             p_motorbike_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.1: Generate Random Departments
        v_start := SYSTIMESTAMP;
        GENERATERANDOMDEPARTMENT(p_department_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.2 generateRandomDepartment(' ||
                             p_department_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.2: Generate Random Maintenances
        v_start := SYSTIMESTAMP;
        GENERATERANDOMMAINTENANCE(p_maintenance_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5. 3generateRandomMaintenance(' ||
                             p_maintenance_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.3: Generate Random Employees
        v_start := SYSTIMESTAMP;
        GENERATERANDOMEMPLOYEE(p_employee_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.4 generateRandomEmployee(' ||
                             p_employee_count || ') completed in ' || v_diff || ' seconds.');

        -- 4.4: Generate Random Services
        v_start := SYSTIMESTAMP;
        GENERATERANDOMSERVICE(p_service_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '5.5 generateRandomService(' ||
                             p_service_count || ') completed in ' || v_diff || ' seconds.');
    END BEWIJS_MILESTONE_M5_S2;


    -----------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------

    ----------------------------------------************ M7 ***************------------------------------------------------------------

    PROCEDURE add_Department_bulk(departments in t_department_bulk) IS
    BEGIN
        FORALL i in indices of departments
            INSERT INTO Department (name, location, tasks)
            VALUES (departments(i).name, departments(i).location, departments(i).tasks);
        commit;
    END add_Department_bulk;

    PROCEDURE add_Maintenance_bulk(maintenances IN t_maintenance_bulk) IS
    BEGIN
        FORALL i IN INDICES OF maintenances
            INSERT INTO Maintenance (chassisNr, MAINTENANCEDESCRIPTION, MAINTENANCETYPE , maintenanceDate )
            VALUES (maintenances(i).chassisNr, maintenances(i).MAINTENANCEDESCRIPTION, maintenances(i).MAINTENANCETYPE, maintenances(i).maintenanceDate);
        COMMIT;
    END add_Maintenance_bulk;

    PROCEDURE add_Employee_bulk(employees IN t_employee_bulk) IS
    BEGIN
        FORALL i IN INDICES OF employees
            INSERT INTO Employee (firstName, lastName, position, departmentID, maintenanceID)
            VALUES (employees(i).firstName, employees(i).lastName, employees(i).position, employees(i).departmentID, employees(i).maintenanceID);
        COMMIT;
    END add_Employee_bulk;

    PROCEDURE add_Service_bulk(services IN t_service_bulk) IS
    BEGIN
        FORALL i IN INDICES OF services
            INSERT INTO Service (employeeID, EMPLOYEENAME,  customerID, CUSTOMERNAME, serviceDetails, serviceDate)
            VALUES (services(i).employeeID, services(i).EMPLOYEENAME, services(i).customerID,services(i).CUSTOMERNAME, services(i).serviceDetails, services(i).serviceDate);
        COMMIT;
    END add_Service_bulk;

    PROCEDURE generateRandomDepartment_bulk(p_count IN NUMBER DEFAULT 1)
        IS
        v_departments t_department_bulk;
    BEGIN
        FOR i IN 1..p_count
            LOOP
                v_departments(i).name := 'Department ' || i || NVL(DBMS_RANDOM.STRING('A', 20), 'Default');
                v_departments(i).location := 'Location ' || i;
                v_departments(i).tasks := 'Task ' || i;
            END LOOP;
        add_Department_bulk(v_departments);
    END generateRandomDepartment_bulk;

    PROCEDURE generateRandomMaintenance_bulk(p_count IN NUMBER DEFAULT 1)
        IS
        TYPE t_chassisNr_tab IS TABLE OF MotorBike.chassisNr%TYPE;
        v_maintenances t_maintenance_bulk;
        v_chassisNrs   t_chassisNr_tab;
    BEGIN
        -- Retrieve valid chassis numbers
        SELECT chassisNr BULK COLLECT INTO v_chassisNrs FROM MotorBike;

        FOR i IN 1..p_count
            LOOP
                FOR j in 1..900 LOOP
                    v_maintenances((i-1)*900 + j).maintenanceDescription := 'Maintenance ' || i;
                    v_maintenances((i-1)*900 + j).chassisNr :=  v_chassisNrs(DBMS_RANDOM.VALUE(1, v_chassisNrs.COUNT));
                    v_maintenances((i-1)*900 + j).maintenanceType := 'Maintenance Type ' || i;
                    v_maintenances((i-1)*900 + j).maintenanceDate := SYSDATE + i;
                    END LOOP;
            END LOOP;
        add_Maintenance_bulk(v_maintenances);
    END generateRandomMaintenance_bulk;

    PROCEDURE generateRandomEmployee_bulk(p_count IN NUMBER DEFAULT 1)
        IS
        TYPE t_departmentId_tab IS TABLE OF Department.departmentID%TYPE;
        TYPE t_maintenanceId_tab IS TABLE OF Maintenance.maintenanceID%TYPE;
        v_employees t_employee_bulk;
        v_departmentIds t_departmentId_tab;
        v_maintenanceIds t_maintenanceId_tab;
    BEGIN
        -- Retrieve valid department IDs
        SELECT departmentID BULK COLLECT INTO v_departmentIds FROM Department;
        -- Retrieve valid maintenance IDs
        SELECT maintenanceID BULK COLLECT INTO v_maintenanceIds FROM Maintenance;

        FOR i IN 1..p_count
            LOOP
                FOR j IN 1..30 LOOP
                    v_employees((i-1)*30 + j).firstName := random_employee_firstname;
                    v_employees((i-1)*30 + j).lastName := random_employee_lastname;
                    v_employees((i-1)*30 + j).position := random_employee_position;
                    v_employees((i-1)*30 + j).departmentID := v_departmentIds(DBMS_RANDOM.VALUE(1, v_departmentIds.COUNT));
                    v_employees((i-1)*30 + j).maintenanceID := v_maintenanceIds(DBMS_RANDOM.VALUE(1, v_maintenanceIds.COUNT));
                END LOOP;
            END LOOP;
        add_Employee_bulk(v_employees);
    END generateRandomEmployee_bulk;

    PROCEDURE generateRandomService_bulk(p_count IN NUMBER DEFAULT 1)
        IS
        TYPE t_employeeId_tab IS TABLE OF Employee.employeeID%TYPE;
        TYPE t_customerId_tab IS TABLE OF Customer.customerID%TYPE;
        v_services t_service_bulk;
        v_employeeIds t_employeeId_tab;
        v_customerIds t_customerId_tab;
    BEGIN
        -- Retrieve valid employee IDs
        SELECT employeeID BULK COLLECT INTO v_employeeIds FROM Employee;
        -- Retrieve valid customer IDs
        SELECT customerID BULK COLLECT INTO v_customerIds FROM Customer;

        FOR i IN 1..p_count
            LOOP
                FOR j IN 1..900 LOOP -- Generate 800 services for each iteration
                v_services((i-1)*900 + j).EMPLOYEENAME := random_employee_firstname || ' ' || random_employee_lastname;
                v_services((i-1)*900 + j).CUSTOMERNAME := random_customer_firstname || ' ' || random_customer_lastname;
                v_services((i-1)*900 + j).serviceDetails := random_service_Details;
                v_services((i-1)*900 + j).serviceDate := PKG_SAMEN_MOTORBIKE.random_date(TO_DATE('01-JAN-2020', 'DD-MON-YYYY'), SYSDATE);
                v_services((i-1)*900 + j).employeeID := v_employeeIds(DBMS_RANDOM.VALUE(1, v_employeeIds.COUNT));
                v_services((i-1)*900 + j).customerID := v_customerIds(DBMS_RANDOM.VALUE(1, v_customerIds.COUNT));
                END LOOP;
            END LOOP;
        add_Service_bulk(v_services);
    END generateRandomService_bulk;

    PROCEDURE Bewijs_Milestone_M7_S2(
        p_department_count in number default 1,
        p_motorbike_count in number default 1,
        p_maintenance_count in number default 1,
        p_employee_count in number default 1,
        p_service_count in number default 1
        )  IS
        v_start TIMESTAMP;
        v_end   TIMESTAMP;
        v_diff  NUMBER;
    BEGIN
        -- 7.1 Generate Random departments
        v_start := SYSTIMESTAMP;
        generateRandomDepartment_bulk(p_department_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.1 generateRandomDepartment_bulk(' ||
                             p_department_count || ') completed in ' || v_diff || ' seconds.');

        -- 7.2: Generate Random motorbikes
        v_start := SYSTIMESTAMP;
        PKG_S1_MOTORBIKES.GENERATEDRANDOMMOTORBIKE_BULK(p_motorbike_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.2 generatedRandomMaintenances_bulk(' ||
                             p_motorbike_count || ') completed in ' || v_diff || ' seconds.');

        -- 7.2: Generate Random maintenances
        v_start := SYSTIMESTAMP;
        generateRandomMaintenance_bulk(p_maintenance_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.2 generatedRandomMaintenances_bulk(' ||
                             p_maintenance_count || ') completed in ' || v_diff || ' seconds.');

        -- 7.3: Generate Random Employees
        v_start := SYSTIMESTAMP;
        generateRandomEmployee_bulk(p_employee_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.3 generateRandomEmployee_bulk(' ||
                             p_Employee_count || ') completed in ' || v_diff || ' seconds.');

        -- 7.4: Generate Random Services
        v_start := SYSTIMESTAMP;
        generateRandomService_bulk(p_service_count);
        v_end := SYSTIMESTAMP;
        v_diff := PKG_SAMEN_MOTORBIKE.timestamp_diff(v_end, v_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(v_end, '[YYYY-MM-DD HH24:MI:SS] ') || '7.4 generateRandomService_bulk(' ||
                             p_service_count || ') completed in ' || v_diff || ' seconds.');
        commit ;
    END Bewijs_Milestone_M7_S2;


End PKG_S2_MOTORBIKES;


begin
    PKG_S2_MOTORBIKES.BEWIJS_MILESTONE_M7_S2(30,30, 30, 30, 540000);
    commit ;
end;


SELECT *
FROM ALL_ERRORS
WHERE TYPE = 'PACKAGE BODY'
  AND NAME = 'PKG_S2_MOTORBIKES';




