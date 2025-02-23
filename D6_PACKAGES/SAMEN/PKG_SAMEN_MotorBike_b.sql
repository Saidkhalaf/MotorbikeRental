CREATE OR REPLACE PACKAGE BODY PKG_SAMEN_MOTORBIKE
AS
    FUNCTION random_number(p_min IN NUMBER, p_max IN NUMBER)
        RETURN NUMBER
        IS
    BEGIN
        RETURN TRUNC(dbms_random.VALUE(p_min, p_max));
    END random_number;

    FUNCTION random_date(p_from IN DATE, p_to IN DATE)
        RETURN DATE
        IS
        ln_range    NUMBER;
        ln_datepick NUMBER;
    BEGIN
        ln_range := p_to - p_from;
        ln_datepick := PKG_SAMEN_MOTORBIKE.random_number(0, ln_range);
        RETURN p_from + ln_datepick;
    END random_date;

    FUNCTION timestamp_diff(a timestamp, b timestamp)
        RETURN NUMBER IS
    BEGIN
        RETURN EXTRACT(day from (a - b)) * 24 * 60 * 60 +
               EXTRACT(hour from (a - b)) * 60 * 60 +
               EXTRACT(minute from (a - b)) * 60 +
               EXTRACT(second from (a - b));
    END timestamp_diff;


    PROCEDURE bewijs_Random_M5 IS
        v_random_number NUMBER := random_number(5, 25);
        v_random_date   DATE   := random_date(TO_DATE('01/01/2018', 'DD/MM/YYYY'), SYSDATE);
        --  v_random_name VARCHAR2(1000) := random_department_name();
        v_date_start    TIMESTAMP;
        v_date_end      TIMESTAMP;
        v_duration      NUMBER;

    BEGIN
        -- Random number
        v_date_start := SYSTIMESTAMP;
        v_random_number := random_number(5, 25);
        v_date_end := SYSTIMESTAMP;
        v_duration := timestamp_diff(v_date_end, v_date_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP, '[YYYY-MM-DD HH24:MI:SS] ') || '1 - Random number inside of range');
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP, '[YYYY-MM-DD HH24:MI:SS] ') || 'random_number(5, 25) --> ' ||
                             v_random_number || ' (Duration: ' || v_duration || ' seconds)');

        -- Random date
        v_date_start := SYSTIMESTAMP;
        v_random_date := random_date(TO_DATE('01/01/2015', 'DD/MM/YYYY'), SYSDATE);
        v_date_end := SYSTIMESTAMP;
        v_duration := timestamp_diff(v_date_end, v_date_start);
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP, '[YYYY-MM-DD HH24:MI:SS] ') || '2 - Random date inside of range');
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSTIMESTAMP, '[YYYY-MM-DD HH24:MI:SS] ') ||
                             'random_date(TO_DATE(''01/01/2015'', ''DD/MM/YYYY''), SYSDATE) --> ' ||
                             TO_CHAR(v_random_date, 'DD/MM/YYYY') || ' (Duration: ' || v_duration || ' seconds)');


        DBMS_OUTPUT.PUT_LINE('Generated random data successfully.');


    END bewijs_Random_M5;
END PKG_SAMEN_MOTORBIKE;

ALTER PACKAGE PKG_SAMEN_MOTORBIKE COMPILE BODY;
