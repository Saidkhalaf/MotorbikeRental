-- Vraag 1 (A)
select * from klanten;

insert into KLANTEN(klnr, achternaam, voornaam, straat, huisnr, postcode, gemeente, status)
values (2900, 'KHALAF', 'SAID', 'STEENBERSTRAAT', 6, 2000, 'ANTWERPEN', null);
SAVEPOINT KLANT;

SELECT * FROM KLANTEN;

--Vraag 1 (B)
insert into RESERVATIES(resnr, bunr, klnr, parkcode, typenr, hnr, boekingsdatum, begindat, einddat, kode, status, promocode)
values (21, 1, 29000, 'WB', 'FK',225, sysdate, to_date('28-10-2022', 'dd-mm-yy'),
        to_date('01-11-2022', 'dd-mm=yy'), 1, 'OPEN', NULL );

SELECT * FROM RESERVATIES;

INSERT INTO RESERVATIES(RESNR, BUNR, KLNR, PARKCODE, TYPENR, HNR, BOEKINGSDATUM, BEGINDAT, EINDDAT, KODE, STATUS, PROMOCODE)
VALUES(22, 1, 29000, 'WB', 'FV10',515, SYSDATE,TO_DATE('23-12-2022', 'dd-mm-yy'), TO_DATE('27-12-2022', 'dd-mm-yy'), 1, 'OPEN', null  );
savepoint s1;

select * from BETALINGEN;
--Vraag 1 (C)
insert into BETALINGEN(betalingsnr, resnr, bunr, datumbetaling, bedrag, betalingswijze)
VALUES((select max(BETALINGSNR) + 1 from BETALINGEN), 21, 1, sysdate, 200, 'B');

ROLLBACK to savepoint s1;
rollback to savepoint KLANT;
rollback ;

select * from RESERVATIES;
select * from KLANTEN;
select * from BETALINGEN;


--Vraag 2 (A)

select * from RESERVATIES
where KLNR = (select KLNR
              from KLANTEN
              where VOORNAAM = 'PIETER' and ACHTERNAAM = 'STOOT');

--b
select PARKCODE, TYPENR, ABADKAMER
from TYPE_HUIZEN
group by PARKCODE, TYPENR, ABADKAMER
having MAX(ABADKAMER) = (select MAx(ABADKAMER)
                         from TYPE_HUIZEN);

--c

delete from KLANTEN
where upper(VOORNAAM) = 'PIETER' and UPPER(ACHTERNAAM) = 'STOOT' ;

rollback ;

--d

DELETE FROM vakantiehuizen
WHERE parkcode = 'WB' AND typenr= 'FK' AND hnr = 225;

ROLLBACK;

--Vraag(3)
select * from VAKANTIEHUIZEN;

select PRIJS_WEEKEND, PRIJS_MIDWEEK, PARKCODE, SEIZOENCODE
from TYPE_HUIS_PRIJZEN
    where SEIZOENCODE = (select code
                         from SEIZOENEN
                         where LOWER(BESCHRIJVING) = 'zomervakantie 2019')
and PARKCODE in (select CODE from PARKEN p
                             join LANDEN L on L.LANDCODE = p.LANDCODE
                             where lower(l.LANDNAAM) = 'nederland');

update TYPE_HUIS_PRIJZEN
set PRIJS_WEEKEND = PRIJS_MIDWEEK * 1.1,
    PRIJS_MIDWEEK = PRIJS_MIDWEEK * 1.1
where SEIZOENCODE = 1
AND (PARKCODE, TYPENR) in (select PARKCODE, TYPENR
                           from TYPE_HUIZEN th
                           join PARKEN P on P.CODE = th.PARKCODE
                           join LANDEN l on l.LANDCODE = p.LANDCODE
                           where UPPER(LANDNAAM) = 'NEDERLAND');

SELECT * FROM TYPE_HUIS_PRIJZEN;




