select 'S1-A : Customers' As TABEL_NAAM, (select count(*) from (CUSTOMER)) as tabel_count
from DUAL
union
select 'S1-B/X : MotorBike', (select count(*) from (MOTORBIKE))
from DUAL
union
select 'S1-C : Shop', (select count(*) from (SHOP))
from DUAL
union
select 'S1-D : Rental', (select count(*) from (RENTAL))
from DUAL
union
select 'S2-W : Department', (select count(*) from (DEPARTMENT))
from DUAL
union
select 'S2-Y : EMPLOYEE', (select count(*) from (EMPLOYEE))
from DUAL
union
select 'S2-Z : MAINTENANCE', (select count(*) from (MAINTENANCE))
from DUAL
union
select 'S2_ : SERVICE', (select count(*) from (SERVICE))
from DUAL;


--proof EMPTY_TABLES Milestone 4
BEGIN
    PKG_S2_MOTORBIKES.EMPTY_TABLES_S2();
    PKG_S1_MOTORBIKES.EMPTY_TABLES_S1();
end;


-- proof Bewijs_TABLES Milestone 4
BEGIN
      PKG_S1_MOTORBIKES.BEWIJS_M4_S1();
      PKG_S2_MOTORBIKES.BEWIJS_M4_S2();
end;

-- Proof M5
BEGIN
    PKG_SAMEN_MOTORBIKE.BEWIJS_RANDOM_M5;
    PKG_S1_MOTORBIKES.Bewijs_Milestone_M5_S1(3000, 3000, 3000, 40000);
    PKG_S2_MOTORBIKES.BEWIJS_MILESTONE_M5_S2(30, 30, 30, 60, 30);

END;

Alter package PROJECT.PKG_S1_MOTORBIKES compile body;
Alter package PROJECT.PKG_S2_MOTORBIKES compile body;

BEGIN
    PKG_SAMEN_MOTORBIKE.BEWIJS_RANDOM_M5;
end;

-- Proof M7

BEGIN
    PKG_S1_MOTORBIKES.BEWIJS_MILESTONE_M7_S1(3000, 3000, 3000, 400000);
    PKG_S2_MOTORBIKES.BEWIJS_MILESTONE_M7_S2(30, 30, 30, 30, 600);
end;


SELECT *
FROM DEPARTMENT
ORDER BY DBMS_RANDOM.VALUE()
    FETCH FIRST 10 ROWS ONLY;


select *
from MOTORBIKE;
select *
from RENTAL;


delete
from RENTAL
where SHOPID = 5;

delete
from SHOP
where SHOPID = 5;
COMMIT;


