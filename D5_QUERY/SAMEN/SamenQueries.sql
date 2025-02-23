select 'S1-A : Customers' As TABEL_NAAM , (select count(*) from (CUSTOMER)) as tabel_count from DUAL union
select 'S1-B/X : MotorBike'  , (select count(*) from (MOTORBIKE))  from DUAL union
select 'S1-C : Shop', (select count(*) from (SHOP)) from DUAL union
select 'S1-D : Rental',(select count(*) from (RENTAL)) from DUAL union
select 'S2-W : Department', (select count(*) from (DEPARTMENT)) from DUAL union
select 'S2-Y : EMPLOYEE' , (select count(*) from (EMPLOYEE)) from DUAL union
select 'S2-Z : MAINTENANCE' , (select count(*) from (MAINTENANCE)) from DUAL union
select 'S2_ : SERVICE' , (select count(*) from (SERVICE)) from DUAL;