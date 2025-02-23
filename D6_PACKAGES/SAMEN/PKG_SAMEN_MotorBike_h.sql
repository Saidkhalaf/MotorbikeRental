CREATE OR REPLACE PACKAGE PKG_SAMEN_MOTORBIKE
    AS

    FUNCTION random_number(p_min IN NUMBER, p_max IN NUMBER)
        RETURN NUMBER;

    FUNCTION random_date(p_from DATE,  p_to DATE)
        RETURN DATE;

    FUNCTION timestamp_diff(a timestamp, b timestamp)
        RETURN NUMBER;

    PROCEDURE bewijs_Random_M5;


END PKG_SAMEN_MOTORBIKE;

