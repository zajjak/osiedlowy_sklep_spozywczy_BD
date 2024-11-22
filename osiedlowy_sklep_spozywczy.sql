DROP DATABASE osiedlowy_sklep_spozywczy;

CREATE DATABASE osiedlowy_sklep_spozywczy;
USE osiedlowy_sklep_spozywczy;


CREATE TABLE `ceny`  (
  `id_ceny` int NOT NULL AUTO_INCREMENT,
  `cenaBrutto` float NULL,
  `cenaNetto` float NULL,
  PRIMARY KEY (`id_ceny`)
);

CREATE TABLE `daneProduktów`  (
  `id_daneproduktow` int NOT NULL AUTO_INCREMENT,
  `nazwa` text CHARACTER SET utf8 NOT NULL,
  `VAT` float NOT NULL,
  `id_kategoria` int NOT NULL,
  `id_ceny` int NULL,
  PRIMARY KEY (`id_daneproduktow`)
);

CREATE TABLE `dziennyUtarg`  (
  `id_dziennyutarg` int NOT NULL AUTO_INCREMENT,
  `data` date NULL,
	`kwotaŁączna` FLOAT NULL,
  PRIMARY KEY (`id_dziennyutarg`)
);

CREATE TABLE `kategoria`  (
  `id_kategoria` int NOT NULL AUTO_INCREMENT,
  `nazwaKategorii` text NULL,
  PRIMARY KEY (`id_kategoria`)
);

CREATE TABLE `koszyk`  (
  `id_koszyk` int NOT NULL AUTO_INCREMENT,
  `id_przedmiotwkoszyku` int NOT NULL,
  `id_tranzakcji` int NOT NULL,
  PRIMARY KEY (`id_koszyk`)
);

CREATE TABLE `magazyn`  (
  `id_magazyn` int NOT NULL AUTO_INCREMENT,
  `nazwa` text NOT NULL,
  `pojemnosc` int NOT NULL,
  `zapelnienie` int ZEROFILL NOT NULL,
  PRIMARY KEY (`id_magazyn`)
);

CREATE TABLE `pracownicy`  (
  `id_pracownik` int NOT NULL AUTO_INCREMENT,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `pesel` text NULL,
  PRIMARY KEY (`id_pracownik`)
);

CREATE TABLE `premia`  (
  `id_premia` int NOT NULL AUTO_INCREMENT,
  `kwota` float NULL,
  `id_pracownik` int NULL,
  PRIMARY KEY (`id_premia`)
);

CREATE TABLE `przedmiotWKoszyku`  (
  `id_przedmiotwkoszyku` int NOT NULL AUTO_INCREMENT,
  `ilosc` int NOT NULL,
  `id_stanproduktow` int NOT NULL,
  PRIMARY KEY (`id_przedmiotwkoszyku`)
);

CREATE TABLE `stanowisko`  (
  `id_stanowisko` int NOT NULL AUTO_INCREMENT,
  `pozycja` text NULL,
  `id_pracownik` int NULL,
  `id_wynagrodzenia` int NULL,
  PRIMARY KEY (`id_stanowisko`)
);

CREATE TABLE `stanProduktów`  (
  `id_stanproduktow` int NOT NULL AUTO_INCREMENT,
  `dataWaznosci` date NOT NULL,
  `ilosc` int NOT NULL,
  `id_daneproduktow` int NOT NULL,
  `id_magazyn` int NOT NULL,
  PRIMARY KEY (`id_stanproduktow`)
);

CREATE TABLE `tranzakcja`  (
  `id_tranzakcji` int NOT NULL,
  `kwota` int NOT NULL,
  `data` datetime NOT NULL,
  `rodzajtranzakcji` text NOT NULL,
  `czyfinalizacja` bit NOT NULL,
  `id_pracownik` int NOT NULL,
  `id_dziennyutarg` int NULL,
  PRIMARY KEY (`id_tranzakcji`)
);

CREATE TABLE `wielosztuki`  (
  `id_wielosztuki` int NOT NULL AUTO_INCREMENT,
  `ilosc` text NULL,
  `cenaznizkaBrutto` float NULL,
  `cenaznizkaNetto` float NULL,
  `id_ceny` int NOT NULL,
  PRIMARY KEY (`id_wielosztuki`)
);

CREATE TABLE `wynagrodzenie`  (
  `id_wynagrodzenie` int NOT NULL AUTO_INCREMENT,
  `wynagrodzenieNetto` int NOT NULL,
  `wynagrodzenieBrutto` int NOT NULL,
  `koszt_zatrudnienia` int NOT NULL,
  PRIMARY KEY (`id_wynagrodzenie`)
);

ALTER TABLE `daneProduktów` ADD CONSTRAINT `fk_daneProduktów_kategoria_1` FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`);
ALTER TABLE `daneProduktów` ADD CONSTRAINT `fk_daneProduktów_ceny_1` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`);
ALTER TABLE `koszyk` ADD CONSTRAINT `fk_koszyk_przedmiotWKoszyku_1` FOREIGN KEY (`id_przedmiotwkoszyku`) REFERENCES `przedmiotWKoszyku` (`id_przedmiotwkoszyku`);
ALTER TABLE `koszyk` ADD CONSTRAINT `fk_koszyk_tranzakcja_1` FOREIGN KEY (`id_tranzakcji`) REFERENCES `tranzakcja` (`id_tranzakcji`);
ALTER TABLE `premia` ADD CONSTRAINT `fk_premia_pracowicy_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownicy` (`id_pracownik`);
ALTER TABLE `przedmiotWKoszyku` ADD CONSTRAINT `fk_przedmiotWKoszyku_stanProduktów_1` FOREIGN KEY (`id_stanproduktow`) REFERENCES `stanProduktów` (`id_stanproduktow`);
ALTER TABLE `stanowisko` ADD CONSTRAINT `fk_przedmiotWKoszyku_pracownicy_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownicy` (`id_pracownik`);
ALTER TABLE `stanowisko` ADD CONSTRAINT `fk_stanowisko_wynagrodzenie_1` FOREIGN KEY (`id_wynagrodzenia`) REFERENCES `wynagrodzenie` (`id_wynagrodzenie`);
ALTER TABLE `stanProduktów` ADD CONSTRAINT `fk_stanProduktów_daneProduktów_1` FOREIGN KEY (`id_daneproduktow`) REFERENCES `daneProduktów` (`id_daneproduktow`);
ALTER TABLE `stanProduktów` ADD CONSTRAINT `fk_stanProduktów_magazyn_1` FOREIGN KEY (`id_magazyn`) REFERENCES `magazyn` (`id_magazyn`);
ALTER TABLE `tranzakcja` ADD CONSTRAINT `fk_tranzakcja_pracowincy_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownicy` (`id_pracownik`);
ALTER TABLE `tranzakcja` ADD CONSTRAINT `fk_tranzakcja_dziennyUtarg_1` FOREIGN KEY (`id_dziennyutarg`) REFERENCES `dziennyUtarg` (`id_dziennyutarg`);
ALTER TABLE `wielosztuki` ADD CONSTRAINT `fk_wielosztuki_ceny_1` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`);