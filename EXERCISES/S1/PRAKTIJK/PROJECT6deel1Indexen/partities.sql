create cluster dep_emp (klnr number(2));

create index ind_kl_en_em on cluster dep_emp;

select * from klanten
where KLNR=5626;