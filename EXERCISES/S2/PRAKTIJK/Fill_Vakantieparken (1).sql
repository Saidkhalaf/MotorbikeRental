Delete from betalingen;
Delete from reservaties;
delete from promoties;
delete from vakantiehuizen;
delete from type_huis_prijzen;
delete from type_huizen;
delete from parkattracties;
delete from parken;
delete from seizoenen;
delete from reisburs;
delete from klanten;
delete from parkattractietypes;
delete from landen;

INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (1,'België','32');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (2,'Nederland','31');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (3,'Frankrijk','33');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (4,'Duitsland','37');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (5,'Luxemburg','352');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (6,'Verenigd Koninkrijk','44');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (7,'Italië','39');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (8,'Kaaimaneilanden','1345');
INSERT INTO LANDEN(landcode, landnaam, telcode)
VALUES (9,'Noorwegen','47');
COMMIT;

INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (1, 'Visvijver');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (2, 'Recreatiemeer');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (3, 'Subtropisch zwemparadijs');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (4, 'Fietsenverhuur');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (5, 'Aan zee');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (6, 'Midden in bos');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (7, 'Fietsroutes');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (8, 'Grote groepen');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (9, 'Rustig');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (10, 'Golfbaan');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (11, 'Kuur/ beautycentrum');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (12, 'Sauna');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (13, 'Gratis Wifi');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (14, 'Bruisend Familiepark');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (15, 'Oplaadpunt Electische Auto');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (16, 'Supermarkt');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (17, 'Scooterverhuur');
INSERT INTO parkattractieTypes(attractietype, beschrijving)
VALUES (18, 'Bolderkarverhuur');
COMMIT;

insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (34560,'BOSMANS', 'MARCEL','DANASTRAAT', '106','2100', 'DEURNE',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (44060,'BORMS', 'WILLY','KWIKSTRAAT', '32','2060', 'MERKSEM',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (60123,'VAN DORST', 'ANDRE','VELDSTRAAT', '11','2130', 'BRASSCHAAT',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (13440,'HELLEMANS', 'RUDY','PIERSTRAAT', '270','2550', 'KONTICH',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (22123,'GOOVAERTS', 'HERMAN','LEOPOLDPLEIN', '2','2500', 'LIER',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (77777,'SUDERMAN', 'LEO','NATIONALESTRAAT', '10','2000','ANTWERPEN',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (11111,'NIEMAND', 'NATHALIE','PLEZANTSTRAAT', '14B','2000','ANTWERPEN',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (66040,'BORMS', 'WALLY','ANTWERPSESTRAAT', '60','2640', 'MORTSEL',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (54321,'VERHELST', 'JAN','MORTSELSESTEENWEG', '104','2540','HOVE',NULL);
INSERT INTO klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
VALUES (25875,'PIJL','EDDY','AUGUST VAN PUTLEI','146','2150','BORSBEEK',null);
INSERT INTO klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
VALUES (25877,'VOCHTEN','BART','MAAIKENVELD','7','2500','LIER',null);
INSERT INTO klanten VALUES (30112,'BOSMANS', 'JOS','ALEXANDER FRANCKSTRAAT', '6','2530', 'BOECHOUT',NULL);
INSERT INTO klanten VALUES (1500,'BORREMANS', 'EDDY','KWIKSTRAAT', '4','3078', 'EVERBERG',NULL);
INSERT INTO klanten VALUES (430,'ABESSI', 'HASSAN','VELDSTRAAT', '11','9000', 'GENT',NULL);
INSERT INTO klanten VALUES (31601,'HOEVENAERS', 'GEERT','LENNEKE MARELAAN', '12A','1932', 'SINT STEVENS WOLUWE',NULL);
INSERT INTO klanten VALUES (14354,'GOOVAERTS', 'BRUNO','JAN FRANS WILLEMSTRAAT', '2','1800', 'VILVOORDE',NULL);
INSERT INTO klanten VALUES (10733,'BONTRIDDER', 'EDDY','PADDESCHOOTDREEF', '10','9100','SINT NIKLAAS',NULL);
INSERT INTO klanten VALUES (11744,'NIEMAND', 'ROSALIE','KETTERMUITSTRAAT', '14','9100','SINT NIKLAAS',NULL);
INSERT INTO klanten VALUES (26811,'CORNELIS', 'NATHALIE','PLEZANTSTRAAT', '26','9100', 'SINT NIKLAAS',NULL);
INSERT INTO klanten VALUES (74420,'VANDERKEILEN', 'BART','VORTEKOESTRAAT', '104','9160','WAASMUNSTER',NULL);
insert into klanten values (15201,'JILALI' ,'MAROUAN','MARCEL THIRYLAAN', '10','1200','ST LAMBRECHTS WOLUWE',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (75798,'VANDER LINDEN', 'FRANK','OEDENKOVENSTRAAT', '72','2140', 'BORGERHOUT',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (29107,'VANDERHEYDEN', 'TOON','SCHOTERWEG', '98','3980', 'TESSENDERLO',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (30061,'GOEDGEZELSCHAP', 'CHARLOTTE','REGENBOOGLAAN', '33','2070', 'ZWIJNDRECHT',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (98123,'JANSSENS', 'LAURENT','DRABSTRAAT', '106','2640', 'MORTSEL',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (61578,'STOOT', 'PIETER','HOOGSTRAAT', '12','2000', 'ANTWERPEN',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (23401,'PROOST', 'BART','GIERLESEWEG', '2','2340','BEERSE',NULL);
insert into klanten (klnr,achternaam,voornaam, straat, huisnr, postcode, gemeente, status)
values (23101,'MEYERS', 'LISE','HELLEHOEKWEG', '7','2310','RIJKEVORSEL',NULL);
COMMIT;

insert into reisburs (bunr, bunaam, straat, huisnr, postcode, gemeente)
values (1,'VTB/VAB','ST. JACOBSMARKT', '25', '2000', 'ANTWERPEN');
insert into reisburs (bunr, bunaam, straat, huisnr, postcode, gemeente)
values (2,'SUNSNACK','TER HULPSE STEENWEG', '46', '1050', 'BRUSSEL');
insert into reisburs (bunr, bunaam, straat, huisnr, postcode, gemeente)
values (3,'NECKERMANN','NATIONALESTRAAT', '101', '2000', 'ANTWERPEN');
insert into reisburs (bunr, bunaam, straat, huisnr, postcode, gemeente)
values (4,'TRAVEL','KERKPLEIN', '7','2600','BERCHEM');
insert into reisburs (bunr, bunaam, straat, huisnr, postcode, gemeente)
values (5,'CLUBMED','HERMELIJNLAAN','20 ','2900','SCHOTEN');
insert into reisburs (bunr, bunaam, straat, huisnr, postcode, gemeente)
values (6,'TESL_REIS','MARKT', '13', '3980', 'TESSENDERLO');
COMMIT;

Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('1','Zomervakantie 2019',to_date('01/07/19','DD/MM/RR'),to_date('31/08/19','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('2','Herfstvakantie 2019',to_date('28/10/19','DD/MM/RR'),to_date('03/11/19','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('3','Kerstvakantie 2019',to_date('23/12/19','DD/MM/RR'),to_date('05/01/20','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('4','Paasvakantie 2019',to_date('08/04/19','DD/MM/RR'),to_date('22/04/19','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('5','Laagseizoen1 2019',to_date('01/01/19','DD/MM/RR'),to_date('07/04/19','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('6','Laagseizoen2 2019',to_date('04/11/19','DD/MM/RR'),to_date('22/12/19','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('7','Tussenseizoen1 2019',to_date('16/04/19','DD/MM/RR'),to_date('30/06/19','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('8','Tussenseizoen2 2019',to_date('01/09/19','DD/MM/RR'),to_date('27/10/19','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('9','Laagseizoen1 2020',to_date('06/01/20','DD/MM/RR'),to_date('05/04/20','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('10','Paasvakantie 2020',to_date('06/04/20','DD/MM/RR'),to_date('19/04/20','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('11','Tussenseizoen1 2020',to_date('20/04/20','DD/MM/RR'),to_date('30/06/20','DD/MM/RR'));
Insert into SEIZOENEN (CODE,BESCHRIJVING,BEGINDATUM,EINDDATUM) values ('12','Zomervakantie 2020',to_date('01/07/20','DD/MM/RR'),to_date('31/08/20','DD/MM/RR'));
COMMIT;

insert into parken (pnaam,sport,landcode,code)
values ('HET VENNENBOS','TFPSQ  HA','2','VB');
insert into parken (pnaam,sport,landcode,code)
values ('DE LOMMERBERGEN','T P   K A','2','LB');
insert into parken (pnaam,sport,landcode,code)
values ('HET MEERDAL','T PS  K A','2','MD');
insert into parken (pnaam,sport,landcode,code)
values ('SHERWOOD FOREST','TFPSQ KHA','6','SF');
insert into parken (pnaam,sport,landcode,code)
values ('LES BOIS FRANCS','TFPSQVK A','3','BF');
insert into parken (pnaam,sport,landcode,code)
values ('ERPERHEIDE','TFP QV HA','1','EP');
insert into parken (pnaam,sport,landcode,code)
values ('SAFARI',' F SQV  A','2','SA');
insert into parken (pnaam,sport,landcode,code)
values ('FENIX','TF   VKHA','2','FX');
insert into parken (pnaam,sport,landcode,code)
values ('DE VOSSEMEREN','TFP   KHA','2','FE');
INSERT INTO parken (pnaam,sport,landcode,code)
VALUES('WEERTERBERGEN','TF   VKHA','2','WB');
COMMIT;

INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',2);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',3);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',4);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',6);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',8);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',14);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',15);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',16);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',17);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('WB',18);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('VB',3);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('VB',4);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('VB',6);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('VB',7);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('VB',9);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('VB',11);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('VB',18);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('LB',3);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('LB',4);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('LB',6);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('LB',7);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('LB',9);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('LB',11);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('LB',12);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('MD',2);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('MD',3);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('MD',6);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('MD',7);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('MD',9);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('MD',11);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('MD',12);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('SF',3);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('SF',4);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('SF',6);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('SF',7);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('SF',9);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('SF',10);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('SF',11);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('EP',3);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('EP',4);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('EP',6);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('EP',7);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('EP',9);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('EP',11);
INSERT INTO parkattracties(parkcode, attractietype)
VALUES('EP',12);
COMMIT;

insert into type_huizen (parkcode,typenr,aslaapk, apers, abadkamer,kibed2,commentaar,wifi,opp)
values ('WB','WF',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('VB','22',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('VB','23',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers, abadkamer,kibed2,commentaar,wifi,opp)
values ('VB','24',3,7,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('LB','11',2,5,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers, abadkamer,kibed2,commentaar,wifi,opp)
values ('LB','12',1,3,1,'N',NULL,'J',63);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('LB','13',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('LB','14',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('LB','15',1,2,1,'N',NULL,'J',63);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('LB','16',4,10,2,'J',NULL,'J',148);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('MD','31',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('MD','32',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('MD','33',3,7,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('MD','34',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('VB','25',null,0,1,'',NULL,'J',50);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2, commentaar,wifi,opp)
values ('MD','35',3,8,1,'J',NULL,'J',89);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer,kibed2,commentaar,wifi,opp)
values ('MD','36',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('MD','37',4,10,2,'J',NULL,'J',148);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('SF','11',4,10,2,'J',NULL,'J',148);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('SF','12',3,8,1,'J',NULL,'J',89);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('SF','13',2,5,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('SF','14',1,2,1,'N',NULL,'J',63);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('BF','61',4,10,2,'J',NULL,'J',148);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('BF','62',3,8,2,'J',NULL,'J',89);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('BF','63',2,5,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('EP','81',3,8,2,'J',NULL,'J',89);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('EP','82',1,2,1,'N',NULL,'J',63);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('EP','83',2,3,1,'N',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('EP','84',2,6,1,'J',NULL,'J',70);
insert into type_huizen (parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
values ('VB','21',2,6,1,'J',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','BC',2,4,1,'J',NULL,'J',63);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FC',3,6,1,'N',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','V',3,6,1,'J',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FM',3,6,1,'N',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FK',3,6,1,'J',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','VK',3,6,1,'J',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FL',3,6,1,'J',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','BJ',2,4,1,'J',NULL,'J',63);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FV10',4,10,3,'J',NULL,'J',148);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FV14',5,14,3,'J',NULL,'J',176);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FV18',7,18,5,'J',NULL,'J',235);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FV24',9,24,5,'J',NULL,'J',335);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','VC',3,6,1,'N',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FMC',3,6,1,'N',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','VKC',3,6,1,'N',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FKC',3,6,1,'N',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','BJC',2,4,1,'J',NULL,'J',63);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','FJC',3,6,1,'N',NULL,'J',70);
INSERT INTO type_huizen(parkcode,typenr,aslaapk, apers,abadkamer, kibed2,commentaar,wifi,opp)
VALUES('WB','ZL',4,8,2,'J',NULL,'J',89);
COMMIT;

/* prijzen voor zomerseizoen: seizoen 1 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC',1,129,129,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC',1,139,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V',1,139,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM',1,149,129,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK',1,159,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK',1,169,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL',1,169,149,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ',1,360,203,109);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10',1,719,520,209);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14',1,839,585,299);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18',1,1209,895,509);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24',1,1309,1009,609);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC',1,149, 129,79);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC',1,375, 203,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC',1,350, 214,169);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC',1,360, 240,179);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC',1,360, 203,189);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC',1,375, 214,204);
/* prijzen voor herfstseizoen: seizoen 2 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC',2,285,285,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC',2,305,305,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V',2,325,325,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM',2,335,335,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK',2,305,305,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK',2,320,320,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL',2,320,320,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ',2,360,203,109);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10',2,1020,1020,409);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14',2,1125,1125,399);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18',2,1665,1665,509);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24',2,2000,2000,609);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC',2,340, 340,79);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC',2,375, 203,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC',2,350, 214,169);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC',2,480, 480,279);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC',2,290, 290,189);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC',2,305, 305,204);
/* prijzen voor kerstseizoen: seizoen 3 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC',3,285,285,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC',3,305,305,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V',3,325,325,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM',3,335,335,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK',3,305,305,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK',3,320,320,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL',3,320,320,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ',3,360,203,109);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10',3,1020,1020,409);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14',3,1125,1125,399);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18',3,1665,1665,509);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24',3,2000,2000,609);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC',3,340, 340,79);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC',3,375, 203,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC',3,350, 214,169);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC',3,480, 480,279);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC',3,290, 290,189);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC',3,305, 305,204);
/* prijzen voor paasseizoen: seizoen 4 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC',4,285,285,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC',4,305,305,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V',4,325,325,139);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM',4,335,335,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK',4,305,305,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK',4,320,320,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL',4,320,320,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ',4,360,203,109);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10',4,1020,1020,409);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14',4,1125,1125,399);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18',4,1665,1665,509);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24',4,2000,2000,609);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC',4,340, 340,79);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC',4,375, 203,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC',4,350, 214,169);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC',4,480, 480,279);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC',4,290, 290,189);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC',4,305, 305,204);
/* prijzen voor Laagseizoen 1: jan tot maart= seizoen 5 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC',5,129,129,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC',5,139,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V',5,139,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM',5,149,129,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK',5,159,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK',5,169,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL',5,169,149,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ',5,360,203,109);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10',5,719,520,209);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14',5,839,585,299);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18',5,1209,895,509);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24',5,1309,1009,609);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC',5,149, 129,79);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC',5,375, 203,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC',5,350, 214,169);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC',5,360, 240,179);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC',5,360, 203,189);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC',5,375, 214,204);
/* prijzen voor Laagseizoen 2: seizoen 6 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC',6,129,129,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC',6,139,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V',6,139,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM',6,149,129,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK',6,159,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK',6,169,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL',6,169,149,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ',6,360,203,109);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10',6,719,520,209);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14',6,839,585,299);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18',6,1209,895,509);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24',6,1309,1009,609);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC',6,149, 129,79);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC',6,375, 203,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC',6,350, 214,169);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC',6,360, 240,179);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC',6,360, 203,189);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC',6,375, 214,204);
/* prijzen voor Tussenseizoen 1: seizoen 7 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC', 7,172.86,193.5,54.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC', 7,186.26,208.5,54.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V', 7,186.26,208.5,54.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM', 7,199.66,193.5,68.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK', 7,213.06,208.5,68.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK', 7,226.46,208.5,68.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL', 7,226.46,223.5,68.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ', 7,482.4,304.5,152.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10', 7,963.46,780,292.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14', 7,1124.26,877.5,418.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18', 7,1620.06,1342.5,712.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24', 7,1754.06,1513.5,852.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC', 7,199.66,193.5,110.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC', 7,502.5,304.5,208.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC', 7,469,321,236.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC', 7,482.4,360,250.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC', 7,482.4,304.5,264.6);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC', 7,502.5,321,285.6);
/* prijzen voor Tussenseizoen 2: seizoen 8 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC', 8,133,197,56);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ', 8,372,311,156);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC', 8,372,311,270);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC', 8,144,213,56);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC', 8,387,327,292);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK', 8,164,213,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC', 8,372,367,256);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL', 8,175,228,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM', 8,154,197,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC', 8,387,311,213);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10', 8,743,796,299);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14', 8,867,895,428);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18', 8,1249,1369,728);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24', 8,1352,1544,871);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V', 8,144,213,56);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC', 8,154,197,113);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK', 8,175,213,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC', 8,362,327,242);
/* prijzen voor Laagseizoen 1 2017: seizoen 9 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC', 9,172,197,56);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ', 9,479,311,156);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC', 9,479,311,270);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC', 9,185,213,56);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC', 9,499,327,292);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK', 9,211,213,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC', 9,479,367,256);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL', 9,225,228,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM', 9,198,197,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC', 9,499,311,213);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10', 9,956,796,299);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14', 9,1116,895,428);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18', 9,1608,1369,728);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24', 9,1741,1544,871);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V', 9,185,213,56);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC', 9,198,197,113);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK', 9,225,213,70);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC', 9,466,327,242);
/* prijzen voor paasvakantie 2017: seizoen 10 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC', 10,294,294,143);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC', 10,314,314,143);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V', 10,335,335,143);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM', 10,345,345,153);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK', 10,314,314,153);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK', 10,330,330,153);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL', 10,330,330,153);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ', 10,371,209,112);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10', 10,1051,1051,421);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14', 10,1159,1159,411);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18', 10,1715,1715,524);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24', 10,2060,2060,627);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC', 10,350,350,81);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC', 10,386,209,153);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC', 10,361,220,174);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC', 10,494,494,287);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC', 10,299,299,195);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC', 10,314,314,210);
/* prijzen voor tussenseizoen 1 2017: seizoen 11 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC', 11,178,200,57);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC', 11,192,215,57);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V', 11,192,215,57);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM', 11,206,200,71);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK', 11,219,215,71);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK', 11,233,215,71);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL', 11,233,231,71);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ', 11,496,314,158);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10', 11,992,803,302);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14', 11,1158,904,432);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18', 11,1669,1383,734);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24', 11,1807,1559,879);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC', 11,206,200,114);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC', 11,518,314,215);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC', 11,483,331,244);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC', 11,496,371,259);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC', 11,496,314,273);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC', 11,518,331,295);
/* prijzen voor zomerseizoen 2017: seizoen 12 voor alle types van Weerterbergen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BC', 12,133,129,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FC', 12,143,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','V', 12,143,139,39);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FM', 12,153,129,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FK', 12,164,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VK', 12,174,139,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FL', 12,174,149,49);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJ', 12,371,203,109);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV10', 12,741,520,209);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV14', 12,864,585,299);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV18', 12,1245,895,509);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FV24', 12,1348,1009,609);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VC', 12,153,129,79);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FMC', 12,386,203,149);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','VKC', 12,361,214,169);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FKC', 12,371,240,179);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','BJC', 12,371,203,189);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('WB','FJC', 12,386,214,204);
/* VB 23 en 24 prijzen , alle seizoenen*/
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 1,120,112,35);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 2,265,248,126);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 3,265,248,126);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 4,265,248,126);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 5,120,112,35);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 6,120,112,35);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 7,161,169,50);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 8,124,171,51);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 9,160,171,51);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 10,273,256,130);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 11,166,174,52);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','23', 12,124,112,35);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 1,129,121,35);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 2,284,265,126);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 3,284,265,126);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 4,284,265,126);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 5,129,121,35);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 6,129,121,35);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 7,173,182,50);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 8,134,185,51);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 9,172,185,51);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 10,292,273,130);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 11,179,187,52);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('VB','24', 12,133,121,35);
/* EP 82 */
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 1,185,163,47);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 2,406,357,168);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 3,406,357,168);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 4,406,357,168);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 5,185,163,47);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 6,185,163,47);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 7,247,245,67);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 8,192,249,68);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 9,246,249,68);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 10,418,367,173);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 11,255,252,69);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('EP','82', 12,190,163,47);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14',1,400,350,65);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14',2,300,300,40);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14',3,300,300,40);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14',4,300,300,40);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14',5,200,150,25);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14', 6,499,250,247);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14', 7,669,376,346);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14', 8,515,383,353);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14', 9,664,383,353);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14', 10,418,367,254);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14', 11,689,387,357);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','14', 12,513,250,247);
/* MD 32 & 33 */
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 1,479,281,217);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 2,638,562,338);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 3,638,562,338);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 4,638,562,338);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 5,479,281,217);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 6,479,281,217);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 7,641,421,304);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 8,495,429,310);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 9,637,429,310);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 10,657,578,347);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 11,660,434,313);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','32', 12,493,281,217);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 1,407,305,163);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 2,542,610,254);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 3,542,610,254);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 4,542,610,254);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 5,407,305,163);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 6,407,305,163);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 7,545,457,228);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 8,420,466,233);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 9,541,466,233);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 10,558,627,261);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 11,560,471,236);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('MD','33', 12,419,305,163);
COMMIT;
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','11',1,700,650,100);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','12',1,550,450,75);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','13',1,450,400,75);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','11',2,600,500,75);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','12',2,500,400,60);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','13',2,350,300,50);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','11',3,600,500,75);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','12',3,500,400,60);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','13',3,350,300,50);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','11',4,600,500,75);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','12',4,500,400,60);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','13',4,350,300,50);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','11',5,350,250,50);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','12',5,300,250,40);
INSERT INTO type_huis_prijzen(parkcode, typenr, seizoencode, prijs_weekend, prijs_midweek, prijs_extra_dag)
VALUES ('SF','13',5,250,200,30);
COMMIT;

insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','81',23,'N','J','N','N','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','81',50,'J','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','81',51,'N','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','82',40,'J','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','82',41,'N','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','83',42,'J','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','83',30,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','83',31,'J','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','83',32,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','84',20,'J','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','84',21,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','84',24,'N','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','84',25,'J','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','84',52,'N','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','84',53,'J','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','62',25,'J','J','N','N','N','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','14',901,'N','N','N','J','N','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',300,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',10,'N','N','N','J','N','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',11,'N','N','N','J','N','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',12,'N','N','N','J','N','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',13,'N','N','N','J','N','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','24',401,'N','N','N','J','N','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','22',202,'N','N','N','J','N','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',53,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','11',20,'J','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','11',33,'J','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','11',34,'J','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','12',30,'J','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','12',31,'N','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','12',32,'N','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','12',50,'J','N','J','J','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','12',51,'N','N','J','J','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','12',52,'J','N','J','J','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','13',21,'N','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','13',22,'J','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','13',10,'J','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','13',11,'N','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','14',12,'N','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','14',13,'J','J','J','N','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','14',40,'J','N','J','J','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','14',41,'N','N','J','J','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('SF','14',42,'N','N','J','J','','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','61',40,'J','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','61',41,'N','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','61',42,'N','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','61',53,'N','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','61',33,'N','N','J','J','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','61',34,'J','N','J','J','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','62',10,'J','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','62',11,'N','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','62',12,'N','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','62',21,'N','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','62',22,'J','J','J','N','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','63',31,'J','N','J','J','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('BF','63',32,'N','N','J','J','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','81',10,'J','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','81',11,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','81',12,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('EP','81',22,'N','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',139,'J','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',20,'J','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',21,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',22,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',23,'N','J','N','N','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',73,'J','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',75,'N','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',102,'J','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','35',112,'N','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','35',113,'N','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','35',103,'J','N','N','J','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',25,'N','J','N','N','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',72,'J','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',90,'J','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',92,'N','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',93,'J','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',62,'N','J','N','N','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',63,'J','J','N','N','J','N');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',135,'N','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',122,'N','N','N','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',13,'J','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',28,'N','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',29,'N','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',70,'J','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',71,'N','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',61,'N','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',52,'N','J','N','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','15',62,'J','J','J','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','16',12,'N','J','J','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','16',13,'J','J','J','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','16',63,'N','N','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','16',64,'J','N','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',24,'N','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',26,'N','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',41,'J','J','J','N','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',43,'N','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',130,'J','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',131,'N','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',136,'J','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',137,'N','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','31',120,'J','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',30,'J','J','J','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',31,'N','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',80,'J','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',81,'N','','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',82,'N','','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',132,'N','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',133,'N','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','32',140,'J','','J','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',10,'J','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',11,'N','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',40,'J','J','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',42,'N','J','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',44,'J','','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',76,'J','','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',83,'N','','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',84,'J','','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',25,'J','','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',101,'J','','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',121,'N','','J','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',123,'N','','J','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',124,'J','','J','J','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','33',138,'N','','J','','J','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','21',30,'J','','N','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','21',31,'N','','N','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','21',32,'N','','N','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','21',33,'J','','N','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','22',22,'J','J','N','','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','22',20,'N','J','N','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','22',21,'','J','N','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',14,'N','N','N','','N','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',15,'','N','N','','N','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',16,'','N','N','','N','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','23',17,'J','N','N','','N','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','24',15,'J','N','N','','N','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('VB','24',14,'','N','N','','N','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','11',40,'J','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','11',41,'N','J','J','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','11',42,'N','J','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','11',60,'','','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','12',43,'N','J','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','12',44,'','J','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','12',45,'J','J','J','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','12',50,'J','','','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','13',20,'N','J','J','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','13',23,'N','J','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','13',22,'J','J','J','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','13',21,'N','','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','14',34,'J','J','','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','14',33,'N','J','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','14',30,'J','J','J','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','14',53,'N','','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','14',51,'J','','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','15',32,'N','J','J','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','15',31,'N','J','','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','15',10,'J','J','J','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','15',11,'N','J','J','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('LB','15',61,'N','','J','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','34',74,'J','','N','J','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','35',111,'N','','N','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','35',114,'J','','N','J','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','35',104,'J','','N','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',27,'N','J','N','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',91,'N','','N','','J','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',50,'J','J','N','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',51,'N','J','N','','','');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','36',134,'N','','N','','','J');
insert into vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
values ('MD','37',12,'N','J','N','','','');
/* Huisjes Weerterbergen */
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BC',51,'J','J','N','','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BC',52,'N','J','N','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BC',53,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BC',54,'N','J','N','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FC',72,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FC',73,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FC',74,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','V',83,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','V',84,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','V',85,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FM',201,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FM',202,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FM',203,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FM',204,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FM',205,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FK',222,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FK',223,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FK',224,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FK',225,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FK',226,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VK',301,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VK',302,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VK',303,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VK',304,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VK',305,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FL',325,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FL',326,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FL',327,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FL',328,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FL',329,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FL',330,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJ',422,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJ',423,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJ',424,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJ',425,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV10',515,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV10',516,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV10',517,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV10',518,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV14',526,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV14',527,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV14',528,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV18',538,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV18',539,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV24',540,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FV24',541,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VC',400,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VC',401,'N','N','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VC',402,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FMC',411,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FMC',412,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FMC',413,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FMC',414,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FMC',415,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VKC',360,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VKC',361,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VKC',362,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VKC',363,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','VKC',364,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FKC',253,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FKC',254,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FKC',255,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJC',175,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJC',176,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJC',177,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','BJC',178,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FJC',356,'J','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FJC',357,'N','J','J','J','','');
INSERT INTO vakantiehuizen (parkcode, typenr, hnr, hoek, centrum, dier, rust, speeltuin, strand)
VALUES ('WB','FJC',358,'N','J','J','J','','');
COMMIT;

Insert into PROMOTIES (PROMOCODE,KORTINGPERC,BEGINDATUM,EINDDATUM,PARKCODE,TYPENR) values ('WBZ001','10',to_date('12/08/19','DD/MM/RR'),to_date('14/08/19','DD/MM/RR'),'WB','FV10');
Insert into PROMOTIES (PROMOCODE,KORTINGPERC,BEGINDATUM,EINDDATUM,PARKCODE,TYPENR) values ('WBZ002','10',to_date('12/08/19','DD/MM/RR'),to_date('14/08/19','DD/MM/RR'),'WB','FV14');
Insert into PROMOTIES (PROMOCODE,KORTINGPERC,BEGINDATUM,EINDDATUM,PARKCODE,TYPENR) values ('WBZ003','10',to_date('12/08/19','DD/MM/RR'),to_date('14/08/19','DD/MM/RR'),'WB','FV18');
Insert into PROMOTIES (PROMOCODE,KORTINGPERC,BEGINDATUM,EINDDATUM,PARKCODE,TYPENR) values ('WBZ004','10',to_date('12/08/19','DD/MM/RR'),to_date('14/08/19','DD/MM/RR'),'WB','FV24');
COMMIT;

Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('2','1','44060','SF','14','901',to_date('04/01/19','DD/MM/RR'),to_date('08/03/19','DD/MM/RR'),to_date('10/03/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('3','1','22123','MD','33','300',to_date('05/01/19','DD/MM/RR'),to_date('18/03/19','DD/MM/RR'),to_date('22/03/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('1','2','13440','VB','24','401',to_date('05/01/19','DD/MM/RR'),to_date('25/01/19','DD/MM/RR'),to_date('27/01/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('2','2','44060','MD','32','132',to_date('03/03/19','DD/MM/RR'),to_date('20/09/19','DD/MM/RR'),to_date('22/09/19','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('1','3','60123','VB','23','10',to_date('03/02/19','DD/MM/RR'),to_date('19/08/19','DD/MM/RR'),to_date('23/08/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('2','3','60123','MD','32','133',to_date('03/01/19','DD/MM/RR'),to_date('23/12/19','DD/MM/RR'),to_date('27/12/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('4','2','44060','EP','82','40',to_date('03/03/19','DD/MM/RR'),to_date('16/12/19','DD/MM/RR'),to_date('20/12/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('5','2','13440','SF','14','901',to_date('03/02/19','DD/MM/RR'),to_date('22/07/19','DD/MM/RR'),to_date('26/07/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('1','1','34560','MD','32','133',to_date('10/01/19','DD/MM/RR'),to_date('18/03/19','DD/MM/RR'),to_date('22/03/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('3','2','22123','MD','33','300',to_date('04/01/19','DD/MM/RR'),to_date('20/05/19','DD/MM/RR'),to_date('24/05/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('3','3','22123','EP','82','40',to_date('17/01/19','DD/MM/RR'),to_date('18/02/19','DD/MM/RR'),to_date('22/02/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('4','3','60123','EP','82','40',to_date('16/01/19','DD/MM/RR'),to_date('25/03/19','DD/MM/RR'),to_date('29/03/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('4','1','60123','EP','82','40',to_date('03/02/19','DD/MM/RR'),to_date('20/05/19','DD/MM/RR'),to_date('24/05/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('5','3','11111','SF','12','30',to_date('04/02/19','DD/MM/RR'),to_date('08/04/19','DD/MM/RR'),to_date('12/04/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('6','3','11111','EP','82','40',to_date('05/01/19','DD/MM/RR'),to_date('23/09/19','DD/MM/RR'),to_date('27/09/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('7','3','11111','SF','12','30',to_date('03/12/18','DD/MM/RR'),to_date('07/01/19','DD/MM/RR'),to_date('11/01/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('8','1','34560','SF','12','30',to_date('03/03/19','DD/MM/RR'),to_date('07/10/19','DD/MM/RR'),to_date('11/10/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('6','2','66040','SF','14','901',to_date('18/01/19','DD/MM/RR'),to_date('31/05/19','DD/MM/RR'),to_date('02/06/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('7','2','34560','SF','14','901',to_date('03/01/19','DD/MM/RR'),to_date('03/05/19','DD/MM/RR'),to_date('05/05/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('10','2','25875','SF','14',null,to_date('03/01/19','DD/MM/RR'),to_date('05/04/19','DD/MM/RR'),to_date('07/04/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('11','2','13440','SF','13','10',to_date('05/02/19','DD/MM/RR'),to_date('08/04/19','DD/MM/RR'),to_date('12/04/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('16','2','13440','VB','24',null,to_date('06/02/19','DD/MM/RR'),to_date('22/11/19','DD/MM/RR'),to_date('24/11/19','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('19','2','13440','VB','24',null,to_date('13/02/19','DD/MM/RR'),to_date('16/12/19','DD/MM/RR'),to_date('20/12/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('50','2','34560','VB','23','13',to_date('15/02/19','DD/MM/RR'),to_date('26/04/19','DD/MM/RR'),to_date('28/04/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('8','3','11111','SF','11','33',to_date('04/01/19','DD/MM/RR'),to_date('28/01/19','DD/MM/RR'),to_date('01/02/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('15','1','44060','SF','14','901',to_date('07/04/19','DD/MM/RR'),to_date('30/12/19','DD/MM/RR'),to_date('03/01/20','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('20','3','66040','SF','12','30',to_date('18/02/19','DD/MM/RR'),to_date('25/03/19','DD/MM/RR'),to_date('29/03/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('21','3','66040','SF','12','30',to_date('20/02/19','DD/MM/RR'),to_date('09/08/19','DD/MM/RR'),to_date('11/08/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('22','3','66040','SF','12','30',to_date('13/02/19','DD/MM/RR'),to_date('12/08/19','DD/MM/RR'),to_date('16/08/19','DD/MM/RR'),'2','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('23','3','66040','SF','12','30',to_date('14/02/19','DD/MM/RR'),to_date('16/08/19','DD/MM/RR'),to_date('18/08/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('24','3','25875','WB','FV10','515',to_date('14/02/19','DD/MM/RR'),to_date('16/08/19','DD/MM/RR'),to_date('18/08/19','DD/MM/RR'),'1','BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('16','1','98123','WB','FV10','517',to_date('12/08/19','DD/MM/RR'),to_date('23/09/19','DD/MM/RR'),to_date('27/09/19','DD/MM/RR'),'2','OPEN','WBZ001');
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('1','4','61578','WB','FV14','526',to_date('12/08/19','DD/MM/RR'),to_date('06/09/19','DD/MM/RR'),to_date('08/09/19','DD/MM/RR'),'1','OPEN','WBZ002');
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('2','4','61578','SF','11','33',to_date('03/08/19','DD/MM/RR'),to_date('01/11/19','DD/MM/RR'),to_date('03/11/19','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('1','5','98123','EP','82','41',to_date('05/08/19','DD/MM/RR'),to_date('04/11/19','DD/MM/RR'),to_date('08/11/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('2','5','61578','SF','11','20',to_date('10/08/19','DD/MM/RR'),to_date('23/12/19','DD/MM/RR'),to_date('27/12/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('17','1','98123','SF','12','30',to_date('10/08/19','DD/MM/RR'),to_date('23/12/19','DD/MM/RR'),to_date('27/12/19','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('18','1','15201','VB','23','13',to_date('21/02/20','DD/MM/RR'),to_date('23/03/20','DD/MM/RR'),to_date('27/03/20','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('3','5','74420','VB','24','401',to_date('02/03/20','DD/MM/RR'),to_date('23/03/20','DD/MM/RR'),to_date('27/03/20','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('4','5','10733','EP','82','40',to_date('02/02/20','DD/MM/RR'),to_date('20/03/20','DD/MM/RR'),to_date('22/03/20','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('25','3','15201','EP','82','40',to_date('02/02/20','DD/MM/RR'),to_date('16/03/20','DD/MM/RR'),to_date('20/03/20','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('26','3','11744','SF','12','32',to_date('02/07/19','DD/MM/RR'),to_date('20/01/20','DD/MM/RR'),to_date('24/01/20','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('5','5','74420','SF','14','12',to_date('23/11/19','DD/MM/RR'),to_date('13/01/20','DD/MM/RR'),to_date('17/01/20','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('6','5','74420','SF','14','901',to_date('02/01/20','DD/MM/RR'),to_date('21/02/20','DD/MM/RR'),to_date('23/02/20','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('19','1','11744','MD','32','133',to_date('12/02/20','DD/MM/RR'),to_date('17/02/20','DD/MM/RR'),to_date('21/02/20','DD/MM/RR'),'2','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('7','5','26811','MD','33','300',to_date('14/02/20','DD/MM/RR'),to_date('17/04/20','DD/MM/RR'),to_date('19/04/20','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('20','1','10733','MD','32','133',to_date('21/03/20','DD/MM/RR'),to_date('17/04/20','DD/MM/RR'),to_date('19/04/20','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('24','5','23401','SF','14','901',to_date('01/10/18','DD/MM/RR'),to_date('04/01/19','DD/MM/RR'),to_date('08/01/19','DD/MM/RR'),null,'BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('25','5','23101','SF','14','901',to_date('01/08/18','DD/MM/RR'),to_date('04/10/19','DD/MM/RR'),to_date('09/10/19','DD/MM/RR'),null,'OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('26','5','23101','SF','14','901',to_date('10/01/18','DD/MM/RR'),to_date('11/01/19','DD/MM/RR'),to_date('24/01/19','DD/MM/RR'),null,'BETAALD',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('4','6','75798','EP','82','40',to_date('02/09/19','DD/MM/RR'),to_date('03/01/20','DD/MM/RR'),to_date('05/01/20','DD/MM/RR'),'1','OPEN',null);
Insert into RESERVATIES (RESNR,BUNR,KLNR,PARKCODE,TYPENR,HNR,BOEKINGSDATUM,BEGINDAT,EINDDAT,KODE,STATUS,PROMOCODE) values ('6','1','29107','MD','33','139',to_date('29/08/18','DD/MM/RR'),to_date('08/02/19','DD/MM/RR'),to_date('13/02/19','DD/MM/RR'),null,'OPEN',null);
COMMIT;

Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('1','2','1',to_date('10/03/19','DD/MM/RR'),'200','V');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('2','3','1',to_date('22/03/19','DD/MM/RR'),'305','O');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('3','1','2',to_date('27/01/19','DD/MM/RR'),'129','V');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('4','1','3',to_date('23/08/19','DD/MM/RR'),'112','B');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('5','5','2',to_date('26/07/19','DD/MM/RR'),'350','V');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('6','1','1',to_date('22/03/19','DD/MM/RR'),'281','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('7','3','2',to_date('24/05/19','DD/MM/RR'),'457','V');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('8','3','3',to_date('22/02/19','DD/MM/RR'),'163','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('9','4','3',to_date('29/03/19','DD/MM/RR'),'163','V');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('10','4','1',to_date('24/05/19','DD/MM/RR'),'245','O');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('11','5','3',to_date('12/04/19','DD/MM/RR'),'400','O');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('12','7','3',to_date('11/01/19','DD/MM/RR'),'250','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('13','6','2',to_date('02/06/19','DD/MM/RR'),'669','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('14','7','2',to_date('05/05/19','DD/MM/RR'),'669','O');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('15','10','2',to_date('07/04/19','DD/MM/RR'),'200','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('16','11','2',to_date('12/04/19','DD/MM/RR'),'300','O');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('17','50','2',to_date('28/04/19','DD/MM/RR'),'161','B');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('18','8','3',to_date('01/02/19','DD/MM/RR'),'250','B');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('19','20','3',to_date('10/05/19','DD/MM/RR'),'250','B');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('20','21','3',to_date('11/08/19','DD/MM/RR'),'550','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('21','22','3',to_date('16/08/19','DD/MM/RR'),'450','B');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('22','23','3',to_date('18/08/19','DD/MM/RR'),'550','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('23','24','3',to_date('18/08/19','DD/MM/RR'),'719','M');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('24','24','5',to_date('08/01/19','DD/MM/RR'),'250','V');
Insert into BETALINGEN (BETALINGSNR,RESNR,BUNR,DATUMBETALING,BEDRAG,BETALINGSWIJZE) values ('25','26','5',to_date('24/01/19','DD/MM/RR'),'460','V');
COMMIT;
