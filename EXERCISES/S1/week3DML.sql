-- om de constraints te zien
select *
from USER_CONSTRAINTS;

-- select max()
-- from

-- alle wijzigen verwijderen naar defrault 
rollback;

create table NumeriekeData (
    numerieke_kolom number
);

create table CharData (
    char_kolom char(10)
);

-- Voorbeeld: Numerieke kolom kopiëren naar een char kolom

insert into CharData(char_kolom)
select TO_CHAR(numerieke_kolom) from NumeriekeData;

drop table NumeriekeData;
drop table CharData;

----------- W3 oefningen -----
SAVEPOINT klant;

select * from klanten;
-- a
insert into KLANTEN
values (54682, 'QUDAIH' , 'SAIF', 'KEMPENLAAN', 13,2300,'TURNHOUT', null);

select  * from RESERVATIES;

select * from REISBURS;

select *from BETALINGEN;
select  * from VAKANTIEHUIZEN;

-- b
-- reservatie 1 geboekt door reisbureau 1
select max(RESNR)
from RESERVATIES;
INSERT INTO reservaties(resnr, bunr, klnr, parkcode, typenr, hnr,boekingsdatum, begindat, einddat, kode, promocode,status)
values (21, 1 , 54682 , 'WB' ,'FK',225, sysdate , to_date('28-10-22','dd-mm-yy'), to_date('01-11-22','dd-mm-yy') , 1 , null ,'OPEN');

insert into RESERVATIES(resnr, bunr, klnr, parkcode, typenr, hnr,boekingsdatum, begindat, einddat, kode, promocode,status)
values (22,1,54682 , 'WB','FV10',515,sysdate , to_date('23-12-22', 'dd-mm-yy'), to_date('27-12-22','dd-mm-yy') , 1 ,null , 'OPEN');

savepoint s1;

-- c
insert into BETALINGEN (betalingsnr, resnr, bunr, datumbetaling,
    bedrag, betalingswijze)
values ( (select max(BETALINGSNR)+1 from BETALINGEN),
        '21' , '1' ,sysdate , 200, 'B');

rollback to klant;
rollback to s1 ;

SELECT * from reservaties;
SELECT * from klanten;
SELECT * from betalingen;

-------------------- ****Vraag2**** ----------------------
-- a: Bekijk voor klant ‘Pieter Stoot’ welke reservaties deze al geboekt heeft.
select  * from RESERVATIES
where KLNR = (
    select KLNR
    from KLANTEN
    where upper(ACHTERNAAM) = 'STOOT'
    and UPPER(voornaam)='PIETER');

-- b: Geef de type huisjes met de meeste aantal badkamers over alle parken heen.
select PARKCODE , TYPENR , ABADKAMER
from TYPE_HUIZEN
order by ABADKAMER DESC
fetch first  2 row only ;

-- andere manier
select PARKCODE , TYPENR , ABADKAMER
from TYPE_HUIZEN
group by PARKCODE , TYPENR , ABADKAMER
having max(ABADKAMER) = (select max(ABADKAMER)
                         from TYPE_HUIZEN);

-- of
select PARKCODE , TYPENR , ABADKAMER
from TYPE_HUIZEN
where ABADKAMER = (select max(ABADKAMER)
                   from TYPE_HUIZEN);

---C: Verwijder bovenstaande klant ‘Pieter Stoot’ uit de KLANTEN tabel. Wat is het
-- gevolg voor de afhankelijke rijen?
DELETE FROM klanten
WHERE UPPER(achternaam)='STOOT'
  AND UPPER(voornaam)= upper('pieter');

rollback;
--


--d
select parkcode, typenr, hnr from vakantiehuizen
where TYPENR like 'FK%';

select * from RESERVATIES
where PARKCODE = 'WB';

delete from VAKANTIEHUIZEN
where PARKCODE='WB' and HNR = 225 and TYPENR='FK';

rollback ;


-------***** vraag 3 *****----------
-- wijzig (update) de prijzen voor het weekend en midweek
-- voor alle type huisjes in Nederland (where)
-- voor het zomervakantie in 2019.(condition and)
-- De prijzen worden 10% duurder. (prijs * 1.1%)

select PRIJS_WEEKEND , PRIJS_WEEKEND , PARKCODE , SEIZOENCODE
from TYPE_HUIS_PRIJZEN
where SEIZOENCODE = (
    select  CODE from SEIZOENEN
     where lower(beschrijving) = 'zomervakantie 2019')
     and PARKCODE in (select code from parken p
      join LANDEN L on L.LANDCODE = p.LANDCODE
          where lower(l.LANDNAAM)='nederland');

update TYPE_HUIS_PRIJZEN
set PRIJS_WEEKEND  = PRIJS_WEEKEND * 1.1,
    PRIJS_MIDWEEK = PRIJS_MIDWEEK * 1.1
where SEIZOENCODE = 1
and (parkcode, typenr) in (

    SELECT parkcode, typenr
    FROM type_huizen th
             JOIN parken p ON (p.code = th.parkcode)
             JOIN landen l ON (l.landcode= p.landcode)
    WHERE UPPER(landnaam) = 'NEDERLAND');

rollback;

---*********--------------------***********--------------------***************-------------------
create synonym md for KLANTEN;

select * from md;

select KLNR , ACHTERNAAM , VOORNAAM
from md
where VOORNAAM like '%M%';

select * from KLANTEN;
-- de tabellen en synoniemen in de zelde namespace zittten, moet de name van de synoniem ook uniek zijn binnen het schema van de gebruiker.
-- (= dus je kangeen tabellen klant en synoniem klant in de zelfde namespace hebben)

create public synonym kl for KLANTEN;
-- krijget elke gebruiker deze tabel aanspreken met de benaming kl (als hij rechten heeft gekregen op dit publiek synoniem of op de tabel waar het synoniem naar verwijst)
-- een publiek synoniem behoort niet tot een schema. drm kan de maker van publiek synoniem een naam gebruiken die ook in zijn schema voorkomt.
-- wanneer de onderliggende tabel verwijderd blijft het synoniem bestaan maar wordt invaild.
create table saif (
    naam  varchar2(5),
    age    number,
    job   varchar(15) not null
);

insert into saif (naam, age , job)
values ('saif',21 , 'student');

select *
from saif;

create public synonym stud for saif;

drop table saif;

-- de synonym blijft bestaan maar wordt invalid
-- ik koppel achteraf een tabel met de zelfde naam aan het synoniem, moet eerste compileren om het synoniem terug valid te maken.
drop  public synonym  stud;

create user saif identified by Student_1234;
create user sai identified by Student_1234;
drop user sai;
-- een gebruiker kan eigen wachtwoord wijzigen via de volgende instructie:
alter user saif identified by Nieuwe_wachtwoord0;


-- user saif is gemaakt maar hij kan niet aanloggen aan database hij moet eerste systeem privileges krijgen door DBA
grant create session , create table to saif;

grant create session to saif;

grant create table to saif with admin option ;

-- waar vindt een gebruiker informatie over gekregen systeem privileges
 --user_Sys_privs
-- systeemprivileges van de aangelogde user.
select * from USER_SYS_PRIVS;

-- privileges binnen een sessie
select * from SESSION_PRIVS;


-- overzicht system privileges
select * from SYSTEM_PRIVILEGE_MAP;

grant select on KLANTEN to saif;

-- saif kan dml instructie toepassen op tabel klant
grant insert,update,delete on KLANTEN to saif with grant option ;

-- gebruiker saif mag in de tabel die hij aanmaakt, referentiele constraint maken naar de tabel afdelingen van gebruiker theorie.
grant references on KLANTEN to saif;

-- object privileges insert, update en references kunnen selectief toegekend worden. "dus de grant zijn niet op alle kolommen van het object 'tabel'


select * from KLANTEN;

-- gebruiker saif kan enkele de het attribuut staart aanpassen uit de tabel klantne
grant update(STRAAt) on KLANTEN to saif;

grant update(straat, postcode) on KLANTEN to saif;

---** je kan object privileges niet selectief ontnemen
-- revoke update(straat, postcode) on KLANTEN from saif;

-- maar wel
revoke update on KLANTEN from saif;

grant update(straat) on KLANTEN to saif;

-- welke rollen zijn actief voor de ingelogde user?
select * from SESSION_ROLES;

-- welke roles krijgen de huidige user toegewijzen.
select * from USER_ROLE_PRIVS;

-- informatie over geneste roles
select *
from ROLE_ROLE_PRIVS;

-- welke systeem privileges omvat de role
select *
from ROLE_SYS_PRIVS;

-- welke object privileges omvat de role
select * from ROLE_TAB_PRIVS;

rollback ;

-----------------------------**** DML *****-----------------------------------

rollback ;
--
-- USER_TAB_PRIVS
-- USER_TAB_PRIVS_MADE
-- USER_TAB_PRIVS_RECD (‘recd’=received)
--
-- USER_COL_PRIVS
-- USER_COL_PRIVS_MADE voor selectieve object
-- USER_COL_PRIVS_RECD privileges

-------------
create user saifQudaih identified by Student_1234;

create role saifStudent;

grant create session to saifStudent;

grant insert, update on KLANTEN to saifStudent;

-- saifQudaih krijgt de role van saifStudent

grant saifStudent to saifQudaih;

-- praktijk
select * from KLANTEN;

grant select on KLANTEN to saifStudent;

revoke select on KLANTEN from saifStudent;

delete from KLANTEN
where upper(VOORNAAM) = 'SAIF';