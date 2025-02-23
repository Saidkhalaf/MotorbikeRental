select *
from PROMOTIES;

Create or replace PACKAGE PKG_PROMOTIES
AS
    procedure voeg_promotie_toe(
        PROMOCODE PROMOTIES.PROMOCODE%TYPE,
        KORTINGPERC PROMOTIES.KORTINGPERC%TYPE,
        BEGINDATUM PROMOTIES.BEGINDATUM%TYPE,
        EINDDATUM PROMOTIES.EINDDATUM%TYPE,
        PARKCODE PROMOTIES.PARKCODE%TYPE,
        TYPENR PROMOTIES.TYPENR%TYPE
    );

    procedure genereer_Random_promotie;
END PKG_PROMOTIES;



CREATE OR REPLACE PACKAGE BODY PKG_PROMOTIES
AS

    TYPE type_rec_parkcodeType IS RECORD
     (parkcode type_huizen.parkcode%TYPE,
      typenr   type_huizen.typenr%TYPE );
    gn_promocodecounter number := 4;


    ------ private functions
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
        ln_datepick := random_number(0, ln_range);
        RETURN p_from + ln_datepick;
    END random_date;

    --functie aanmaken die parkcode teruggeven
    -- collection: Alle parkcodes opslagen en dan Random van nemen!
    function lookupRandomParkcodeAndType
        return type_rec_parkcodeType
    AS


        TYPE type_parkcodeAndTypes is TABLE OF type_rec_parkcodeType%TYPE;
        t_parkcodesTypes type_parkcodeAndTypes;

    BEGIN
        select parkcode, TYPENR
        BULK COLLECT into t_parkcodesTypes
        FROM TYPE_HUIZEN;


        RETURN t_parkcodesTypes(random_number(1, t_parkcodesTypes.COUNT));
    END lookupRandomParkcodeAndType ;


    procedure voeg_promotie_toe(
        PROMOCODE PROMOTIES.PROMOCODE%TYPE,
        KORTINGPERC PROMOTIES.KORTINGPERC%TYPE,
        BEGINDATUM PROMOTIES.BEGINDATUM%TYPE,
        EINDDATUM PROMOTIES.EINDDATUM%TYPE,
        PARKCODE PROMOTIES.PARKCODE%TYPE,
        TYPENR PROMOTIES.TYPENR%TYPE
    )
    AS
    BEGIN
        insert into PROMOTIES (PROMOCODE, KORTINGPERC, BEGINDATUM, EINDDATUM, PARKCODE, TYPENR)
        values (PROMOCODE,
                KORTINGPERC,
                BEGINDATUM,
                EINDDATUM,
                PARKCODE,
                TYPENR);
    END voeg_promotie_toe;

    procedure genereer_Random_promotie
    AS
        v_from         DATE;
        v_parkcodetype type_rec_parkcodeType;
    BEGIN
        gn_promocodecounter := gn_promocodecounter + 1;
        v_from := random_date(to_date('01012000', 'DDMMYYYY'), sysdate - 100);
        v_parkcodetype := lookupRandomParkcodeAndType();
        voeg_promotie_toe(
                    'WBZ00' || gn_promocodecounter,
                    random_number(10, 90),
                    v_from,
                    v_from + random_number(10, 90),
                    v_parkcodetype.parkcode,
                    v_parkcodetype.typenr
            );
    END genereer_Random_promotie;

end PKG_PROMOTIES;

BEGIN
    PKG_PROMOTIES.genereer_Random_promotie;
end;

select *
from PROMOTIES;

delete
from PROMOTIES
where PROMOCODE > 'WBZ004';