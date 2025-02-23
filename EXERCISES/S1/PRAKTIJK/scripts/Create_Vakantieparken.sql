drop table betalingen;
drop table reservaties;
drop table promoties;
drop table vakantiehuizen;
drop table klanten;
drop table type_huis_prijzen;
drop table type_huizen;
drop table parkattracties;
drop table parkattractietypes;
drop table parken;
drop table reisburs;
drop table seizoenen;
drop table landen;
/
CREATE TABLE seizoenen(
                          code NUMBER(2) CONSTRAINT pk_seizoenen PRIMARY KEY,
                          beschrijving VARCHAR2(30),
                          beginDatum DATE,
                          eindDatum DATE,
                          constraint seiz_datums check (einddatum >= begindatum));
/
CREATE TABLE parkattractieTypes(
                                   attractietype number(4) CONSTRAINT pk_parkattracTypes PRIMARY KEY,
                                   beschrijving VARCHAR2(100))
    /
CREATE TABLE landen(
                       landcode VARCHAR2(3) CONSTRAINT pk_landen PRIMARY KEY,
                       landnaam VARCHAR2(50),
                       telcode VARCHAR2(4));
/
create table klanten (
                         klnr varchar2(5),
                         achternaam varchar2(25) constraint achternm_hfdl check (achternaam = upper(achternaam)),
                         voornaam VARCHAR2(25) CONSTRAINT voorn_hfdl CHECK(voornaam= UPPER(voornaam)),
                         straat varchar2(40) constraint klantstraat_hfdl check (straat = upper(straat)),
                         huisnr varchar2(5),
                         postcode VARCHAR2(6) ,
                         gemeente varchar2(20) constraint gemeente_hfdl check (gemeente = upper(gemeente)),
                         status varchar2(10),
                         constraint pk_klant primary key (klnr))
    /
create table reisburs(
                         bunr number(2),
                         bunaam varchar2(10) constraint bnm_hfdl check (bunaam = upper(bunaam)),
                         straat varchar2(40) constraint reisb_straat_hfdl check (straat = upper(straat)),
                         huisnr varchar2(5),
                         postcode VARCHAR2(6) ,
                         gemeente varchar2(20) constraint reisbur_gemeente_hfdl check (gemeente = upper(gemeente)),
                         constraint pk_bureau primary key (bunr))
    /
create table parken(
                       pnaam varchar2(15) constraint pnm_hfdl check (pnaam = upper(pnaam)),
                       sport varchar2(9) ,
                       landcode varchar2(3) constraint fk_parken_landcode REFERENCES landen,
                       code varchar2(2) constraint code_hfdl check (code = upper(code)),
                       constraint pk_park primary key (code))
    /
CREATE TABLE parkattracties(
                               parkcode VARCHAR2(2) CONSTRAINT fk_pat_parken REFERENCES parken(code),
                               attractietype number(4) CONSTRAINT fk_parkat_parkattractype  REFERENCES parkattractieTypes,
                               CONSTRAINT pk_parkattracties PRIMARY KEY(parkcode,attractietype));
/
create table type_huizen (
                             parkcode varchar2(2) constraint parkcode_hfdl check (parkcode = upper(parkcode)),
                             typenr varchar2(4) constraint typ_hfdl check (typenr = upper(typenr)),
                             aslaapk number(1),
                             apers number(2),
                             abadkamer NUMBER(1),
                             kibed2 varchar2(1) constraint dom_kibed check (upper(kibed2) in ('J','N')),
                             commentaar varchar2(30),
                             wifi VARCHAR2(1) CONSTRAINT ck_typehuis_wifi CHECK(UPPER(wifi) IN ('J','N')),
                             opp NUMBER(3),
                             constraint pk_type_huis primary key (parkcode,typenr),
                             constraint fk_type_huis_park foreign key (parkcode) references parken(code))
    /
CREATE TABLE type_huis_prijzen(
                                  parkcode varchar2(2) constraint thp_parkcode_hfdl check (parkcode = upper(parkcode)),
                                  typenr varchar2(4) constraint thp_typ_hfdl check (typenr = upper(typenr)),
                                  seizoencode number(2) CONSTRAINT fk_thp_seizoenen REFERENCES seizoenen(code),
                                  prijs_weekend number(5),
                                  prijs_midweek number(5),
                                  prijs_extra_dag number(5),
                                  CONSTRAINT pk_typehprijzen PRIMARY KEY(parkcode,typenr, seizoencode),
                                  CONSTRAINT fk_thp_type_huizen FOREIGN KEY(parkcode, typenr) REFERENCES type_huizen)
    /
create table vakantiehuizen(
                               parkcode varchar2(2) constraint parkcode2_hfdl check (parkcode = upper(parkcode)),
                               typenr varchar2(4) constraint typenr_hfdl check (typenr = upper(typenr)),
                               hnr number(3),
                               hoek varchar2(1) constraint dom_hoek_1 check (upper(hoek) in ('J','N')),
                               centrum varchar2(1) constraint dom_centrum_1 check (upper(centrum) in ('J','N')),
                               dier varchar2(1) constraint dom_dier_1 check (upper(dier) in ('J','N')),
                               rust varchar2(1) constraint dom_rust_1 check (upper(rust) in ('J','N')),
                               speeltuin varchar2(1) constraint dom_spltuin_1 check (upper(speeltuin) in ('J','N')),
                               strand varchar2(1) constraint dom_strand_1 check (upper(strand) in ('J','N')),
                               constraint pk_vakantiehuis primary key(parkcode, typenr,hnr),
                               constraint fk_type_huis foreign key (parkcode,typenr) references type_huizen(parkcode, typenr) on delete cascade)
    /
CREATE TABLE promoties(
                          promocode VARCHAR2(9) CONSTRAINT pk_promoties PRIMARY KEY,
                          kortingperc NUMBER(3,1),
                          beginDatum DATE,
                          eindDatum DATE,
                          parkcode VARCHAR2(2),
                          typenr VARCHAR2(4),
                          CONSTRAINT fk_promo_typehuis FOREIGN KEY(parkcode,typenr) REFERENCES type_huizen(parkcode, typenr));
/
create table reservaties(
                            resnr number(4),
                            bunr number(2),
                            klnr varchar2(5),
                            parkcode varchar2(2) constraint parkcode3_hfdl check (parkcode = upper(parkcode)),
                            typenr varchar2(5) constraint typ_hfdl_1 check (typenr = upper(typenr)),
                            hnr number(3),
                            boekingsdatum date,
                            begindat date,
                            einddat date,
                            kode NUMBER(1) CONSTRAINT cc_resv_kode CHECK(kode IN (1,2)),
                            status varchar2(8) constraint cc_res_status check (status in ('OPEN','BETAALD','GESLOTEN')),
                            promocode VARCHAR2(9),
                            constraint integr_datums check (einddat >= begindat),
                            constraint pk_reserv primary key (resnr,bunr),
                            constraint fk_res_bur foreign key (bunr) references reisburs(bunr) on delete cascade,
                            constraint fk_res_klant foreign key (klnr) references klanten(klnr),
                            constraint fk_res_vakantiehuis foreign key (parkcode,typenr,hnr) references vakantiehuizen(parkcode,typenr,hnr) on delete cascade,
                            constraint fk_res_promo FOREIGN KEY(promocode) REFERENCES promoties);
/
CREATE TABLE betalingen(
                           betalingsnr NUMBER(9),
                           resnr number(3),
                           bunr number(2),
                           datumBetaling Date,
                           bedrag NUMBER(8,2),
                           betalingswijze VARCHAR2(1) CONSTRAINT ck_betalingswijze CHECK(betalingswijze IN ('V','M','O','B')),
                           CONSTRAINT pk_betalingen PRIMARY KEY(betalingsnr),
                           CONSTRAINT fk_betaling_reserv FOREIGN KEY (resnr, bunr) REFERENCES reservaties);
/
