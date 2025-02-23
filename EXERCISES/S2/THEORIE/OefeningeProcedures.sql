CREATE OR REPLACE PROCEDURE "CONTROLE_CURSUSSSESSIES" (p_mnr IN number)
    is
        v_aantal NUMBER(2);
        v_cursist INSCHRIJVINGEN.cursist%TYPE;
        v_naam MEDEWERKERS.naam%TYPE;
Begin
    select CURSIST,
           NAAM,
           count(*)
    INTO v_cursist,
        v_naam,
        v_aantal
    from INSCHRIJVINGEN i
    join MEDEWERKERS m ON MNR=CURSIST
    where CURSIST=p_mnr
    Group By CURSIST, NAAM;

    if v_aantal>2
    THEN
        UPDATE MEDEWERKERS
        SET MAANDSAL=MAANDSAL*1.05
        WHERE MNR=P_MNR;

        DBMS_OUTPUT.PUT_LINE('medewerker'||v_naam||' kreeg salarisverhoging');
    Else
        DBMS_OUTPUT.PUT_LINE('medewerker'||v_naam||' volgde tot nog toe weinig cursissen');
    end if;
end CONTROLE_CURSUSSSESSIES;

begin
    CONTROLE_CURSUSSSESSIES(7900);
    CONTROLE_CURSUSSSESSIES(7499);
end;

