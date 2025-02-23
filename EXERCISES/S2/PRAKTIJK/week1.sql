-- Theorie
select * from SESSION_PRIVS;

-- gebruiker Marie

alter user Marie identified by Student_1234;

-- rol studenten

create role students;

-- zij mogen inloggen
grant create session to students;

--Afdeelingen maken of wijzigen
grant insert, update on AFDELINGEN to students;

--Marie krijgt een role studenten
grant students to MARIE;

select * from AFDELINGEN;

grant select on AFDELINGEN to students;


create view cursusiverzicht as
    select u.*, c2.*, m.mnr, FUNCTIE, AFD
from UITVOERINGEN u
    join CURSUSSEN C2 on C2.CODE = u.CURSUS
    join MEDEWERKERS M on u.DOCENT = M.MNR
ORDER BY BEGINDATUM DESC ;

create SYNONYM CO2 for cursusiverzicht;

select * from CO2;

grant select on  cursusiverzicht to MARIE;