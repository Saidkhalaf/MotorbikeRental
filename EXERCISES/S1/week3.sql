-- gebruiker Marie
CREATE user Marie8 identified by Student_1234;
-- Marie8 deleten
drop user Marie8;

-- Maak een rol student
create ROLE studenten2;

-- ze mogen inloggen
grant create session to studenten2;

-- ze mogen i nde afdelingen toevoegen en wijzigen
grant insert , update on AFDELINGEN to studenten2;

--MARIE 8 krijgt rol studenten
grant studenten2 to Marie8;

-- testen wat maria mag of niet

select *
from AFDELINGEN;

-- de role van marie mag nu selecteren op de db
-- nu krijgt marie select rechten
GRANT select on AFDELINGEN to studenten2;

--role terug afnemen
revoke select on AFDELINGEN from studenten2;

-- een view maken -- ik wil marie deze view kan gebruiken
create view cursusoverzicht as
select u.*, C2.*, m.MNR, NAAM, FUNCTIE, AFD
from UITVOERINGEN u
         join CURSUSSEN C2 on C2.CODE = u.CURSUS
         join MEDEWERKERS M on M.MNR = u.DOCENT
order by BEGINDATUM DESC;

-- de view heeft beetje groot naam. hoe kan ik dat aanpassen
create synonym co3 for cursusoverzicht;
select *
from co3;

-- ik wil marie deze view kan gebruiken "alleen MARIE en niet de hele view"
grant select on co3 to Marie8;

select *
from Medewerkers;

--------------------------------------------
create or replace PROCEDURE test(p_mnr In MEDEWERKERS.MNR%TYPE)
    IS
    v_maandsal MEDEWERKERS.MAANDSAL%type;
Begin
    --uitvoeringsdeel
    Select MAANDSAL
    into v_maandsal -- de waarde van sql statement opvangen in de variabel or function  v_maandsal
    from MEDEWERKERS
    where MNR = p_mnr;

    if v_maandsal between 500 and 3000
    then
        DBMS_OUTPUT.PUT_LINE('Ok');
    else
        DBMS_OUTPUT.PUT_LINE('niet Ok');

    end if;

end test;

BEGIN
    test(7369);
end;

select *
from USER_SOURCE;
-------------------- **Functie** ---------------------------
--todo: werkt niet
CREATE or replace procedure test2(p_mnr in MEDEWERKERS.MNR%type)
    IS
    v_naam VARCHAR2(20);
Begin
    select NAAM
    into v_naam
    from MEDEWERKERS
    where MNR = p_mnr;

    if upper(SUBSTR(v_naam, 1, 4)) = 'JANS'
    then
        DBMS_OUTPUT.PUT_LINE('OK');
    else
        if (v_naam, 1, 3) = 'Jon'
        then
            DBMS_OUTPUT.PUT_LINE(' also OK');
        else
            DBMS_OUTPUT.PUT_LINE('niet OK');
        end if;
    end if;
end test2;

select *
from MEDEWERKERS;
begin
    test2(7499);
end;


create or replace PROCEDURE aantal_inschrijvingen(p_cursus in UITVOERINGEN.CURSUS%TYPE,
                                                  p_begindatum in Date)
    is
    v_aantal number(2);

Begin
    select count(*)
    into v_aantal
    from INSCHRIJVINGEN
    where CURSUS = p_cursus
      and BEGINDATUM = p_begindatum;

    if v_aantal < 3
    then
        DBMS_OUTPUT.PUT_LINE('de cursus' || p_cursus ||
                             ' met    begindatum' || p_begindatum ||
                             'heeft minder dan 3 inschrijvingen');
    end if;
end aantal_inschrijvingen;

BEGIN
    aantal_inschrijvingen('S02', to_date('YYYY-MM-DD', 1999 - 04 - 12));
end;

select *
from UITVOERINGEN;

-------------------Loop --------------------$

CREATE OR REPLACE PROCEDURE tafel_van_6
    IS
    v_product NUMBER(2);
    v_teller NUMBER(2) :=1;
BEGIN
    Loop
        v_product := v_teller * 6;
        DBMS_OUTPUT.PUT_LINE('6 *' || v_teller || '= ' || v_product);
        v_teller := v_teller+1;
        Exit when v_teller > 10;
    end loop;
end tafel_van_6();

BEGIN
    tafel_van_6;
end;


CREATE OR REPLACE PROCEDURE loop_labels AS
BEGIN
    <<outerloop>>
    FOR i IN 1..2
        LOOP
            <<innerloop>>
            FOR j IN 1..4
                LOOP
                    DBMS_OUTPUT.PUT_LINE
                        ( 'Outer Loop teller is ' || i ||
                          ' Inner Loop teller is ' ||j);

                END LOOP innerloop;
        END LOOP outerloop;
END;

-------------------------------------------------

CREATE OR REPLACE PACKAGE medewerkers_pkg
AS
    g_snr NUMBER(2);		/* publieke globale variabele */
    CURSOR c_med IS		/* publieke cursor  */
        SELECT mnr,naam,gbdatum
        FROM medewerkers
        ORDER BY gbdatum ASC;
    TYPE type_tab_med IS TABLE OF c_med%ROWTYPE
        INDEX BY PLS_INTEGER;
    t_med type_tab_med;		/* publieke associatieve array */
    r_med c_med%ROWTYPE;		 /* publieke record variabele */
    PROCEDURE loonaanpassingen (p_mnr IN NUMBER); /* publieke procedure */
    PROCEDURE oudste_medewerkers(p_aantal IN NUMBER);  /* publieke procedure */
END medewerkers_pkg;


CREATE OR REPLACE PACKAGE BODY medewerkers_pkg
AS
    FUNCTION schaalbepaling (p_mnr IN NUMBER)		/* private functie */
        RETURN NUMBER
        IS
        v_snr	schalen.snr%TYPE;
        v_maandsal 	medewerkers.maandsal%TYPE;
    BEGIN
        SELECT snr INTO v_snr
        FROM schalen s
                 JOIN medewerkers m ON (maandsal BETWEEN ondergrens AND bovengrens)
        WHERE mnr=p_mnr;
        RETURN(v_snr);
    END schaalbepaling;
    PROCEDURE loonsverhoging		         /* private procedure */
    (p_mnr IN NUMBER,p_procent IN NUMBER)
        IS
    BEGIN
        UPDATE medewerkers
        SET maandsal=maandsal+(maandsal*p_procent)/100
        WHERE mnr=p_mnr;
        DBMS_OUTPUT.PUT_LINE('loonsverhoging doorgevoerd');
    END loonsverhoging;
    PROCEDURE loonaanpassingen (p_mnr IN NUMBER)        /* publieke procedure */
        IS
        v_functie 	medewerkers.functie%TYPE;
        v_snr	schalen.snr%TYPE;
    BEGIN
        v_snr:=schaalbepaling(p_mnr);
        SELECT functie INTO v_functie
        FROM medewerkers
        WHERE mnr=p_mnr;
        IF v_snr>=3
        THEN  DBMS_OUTPUT.PUT_LINE('loonschaal > 3' );
        ELSE IF UPPER(v_functie)='TRAINER'
        THEN loonsverhoging(p_mnr,3);
        ELSIF UPPER(v_functie)='VERKOPER'
        THEN loonsverhoging(p_mnr,5);
        ELSE DBMS_OUTPUT.PUT_LINE('andere functie - geen loonsverhoging');
        END IF;
        END IF;
    END  loonaanpassingen;
    PROCEDURE oudste_medewerkers(p_aantal IN NUMBER)   /* publieke procedure      */
        IS
    BEGIN
        OPEN medewerkers_pkg.c_med;
        FOR i IN 1..p_aantal
            LOOP
                FETCH medewerkers_pkg.c_med INTO medewerkers_pkg.r_med;
                DBMS_OUTPUT.PUT_LINE(medewerkers_pkg.r_med.mnr||'  ' ||  medewerkers_pkg.r_med.naam||' '||medewerkers_pkg.r_med.gbdatum);
            END LOOP;
        CLOSE medewerkers_pkg.c_med;
    END oudste_medewerkers;
END medewerkers_pkg;
