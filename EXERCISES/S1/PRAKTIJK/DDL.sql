create table hoofdtabel
(
    a number(2),
    b number(2),
    constraint pk_hoofdtabel primary key (a,b)
);



create table detailtabel
(
    x number(2),
    y number(2),
    a number(2),
    b number(2),
    constraint pk_detailtable primary key (x,y),
    constraint fk_detail_hoofd FOREIGN KEY (a,b) REFERENCES hoofdtabel,
    constraint c_fk check ( (a is not null and b is not null ) or (a is null and b is null ) )
);

drop table detailtabel;

select * from hoofdtabel;
select * from detailtabel;


INSERT INTO hoofdtabel VALUES (3,5);

INSERT INTO detailtabel VALUES (1, 2, 3, 5);
INSERT INTO detailtabel (x, y) VALUES (2, 4);
INSERT INTO detailtabel (x, y, a) VALUES (3, 4, 3);
INSERT INTO detailtabel (x, y, b) VALUES (4, 5, 5);
INSERT INTO detailtabel (x, y, b) VALUES (5, 6, 7);
INSERT INTO detailtabel (x, y, a) VALUES (6, 7, 7);

------------

CREATE TABLE emp
(empno NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY,
 ename VARCHAR2(10) CONSTRAINT ch_ename CHECK (ename =

                                               UPPER(ename)),
 job VARCHAR2(9),
 mgr NUMBER(4),
 hiredate DATE,
 sal NUMBER(7,2) CONSTRAINT ch_sal CHECK (sal BETWEEN 500
     AND 5000),
 comm NUMBER(7,2),
 deptno NUMBER(2) CONSTRAINT nn_deptno NOT NULL)

pctfree  20 -- hou 20% van de block vrij die niet mag benutten tenzij voor updates
pctused 40; -- als ik onder de 40% zit dan mag terug gegevens worden terug bijgezet.

--------------------------------------------

CREATE TABLE emp
(empno NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY deferrable ,
 ename VARCHAR2(10) CONSTRAINT ch_ename CHECK (ename = UPPER(ename)),
 job VARCHAR2(9),
 mgr NUMBER(4),
 hiredate DATE,
 sal NUMBER(7,2) CONSTRAINT ch_sal CHECK (sal BETWEEN 500 AND 5000),
 comm  NUMBER(7,2),
 deptno NUMBER(2) CONSTRAINT nn_deptno NOT NULL)

PCTFREE 20
pctused 40

storage (INITIAL 32k NEXT 16k)

tablespace ts_klt;

-----------------

-- alle indexen op de tabel die verplaatst wordt, worden invalid en moeten opnieuw gerebuild worden.
-- ALTER table KLANTEN
-- move tablespace ffzefc;

-- ALTER table KLANTEN
-- rename to  greg;

-- enable validate (Default) -> alle reeds bestaande rijen moeten bij enablen aan de constraint volden
-- enable novalidate -> bestaande rijen worden bij enablen niet getest op de constraint.

-- alter table emp
-- Modify deptno constraint fk_emp_dept references dept(deptno) deferrable ;

set constraint pk_emp deferred ;

-- verwijdert de table uit de database of verplaats de table naar de RECYCLE BIN
-- "vermeldt men de PURGE-option"
-- drop table

create sequence seq_staf
start with 1
increment by 1
;

