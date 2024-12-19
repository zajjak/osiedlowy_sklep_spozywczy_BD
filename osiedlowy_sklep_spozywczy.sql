DROP DATABASE IF EXISTS osiedlowy_sklep_spozywczy;

CREATE DATABASE osiedlowy_sklep_spozywczy;

USE osiedlowy_sklep_spozywczy;

CREATE TABLE `ceny` (
  `id_ceny` int NOT NULL AUTO_INCREMENT,
  `czy_na_sztuki` bit(1) NOT NULL,
  `cena_brutto` float NULL DEFAULT NULL,
  `cena_netto` float NULL DEFAULT NULL,
  PRIMARY KEY (`id_ceny`)
);

CREATE TABLE `ceny_historia` (
  `id_historia_ceny` int NOT NULL AUTO_INCREMENT,
  `id_ceny` int NOT NULL,
  `data_zmiany` date NOT NULL,
  `cena_brutto` float NOT NULL,
  `cena_netto` float NOT NULL,
  PRIMARY KEY (`id_historia_ceny`)
);

CREATE TABLE `dane_produktow` (
  `id_dane_produktow` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `vat` float NOT NULL,
  `id_kategoria` int NOT NULL,
  `id_ceny` int NOT NULL,
  `id_producenta` int NOT NULL,
  PRIMARY KEY (`id_dane_produktow`)
);

CREATE TABLE `kategoria` (
  `id_kategoria` int NOT NULL AUTO_INCREMENT,
  `nazwa_kategorii` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kategoria`)
);

CREATE TABLE `koszyk` (
  `id_koszyk` int NOT NULL AUTO_INCREMENT,
  `ilosc` int NOT NULL,
  `id_dane_produktow` int NOT NULL,
  PRIMARY KEY (`id_koszyk`)
);

CREATE TABLE `kraj_producenta` (
  `id_kraj_producenta` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kraj_producenta`)
);

CREATE TABLE `login_historia` (
  `id_logowania` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `operacja` varchar(255) NOT NULL,
  `id_pracownik` int DEFAULT NULL,
  PRIMARY KEY (`id_logowania`)
);

CREATE TABLE `magazyn` (
  `id_magazyn` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `pojemnosc` int NOT NULL,
  `zapelnienie` int NOT NULL,
  PRIMARY KEY (`id_magazyn`)
);

CREATE TABLE `pracownik` (
  `id_pracownik` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `wynagrodzenie` float NOT NULL,
  PRIMARY KEY (`id_pracownik`)
);

CREATE TABLE `pracownik_stanowisko` (
  `id_pracownik_stanowisko` int NOT NULL AUTO_INCREMENT,
  `id_pracownik` int NOT NULL,
  `id_stanowisko` int NOT NULL,
  PRIMARY KEY (`id_pracownik_stanowisko`)
);

CREATE TABLE `producent` (
  `id_producent` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `id_kraj_producenta` int DEFAULT NULL,
  PRIMARY KEY (`id_producent`)
);

CREATE TABLE `przedmiot_w_koszyku` (
  `id_przedmiot_w_koszyku` int NOT NULL AUTO_INCREMENT,
  `ilosc` int NOT NULL,
  `id_stan_produktow` int NOT NULL,
  PRIMARY KEY (`id_przedmiot_w_koszyku`)
);

CREATE TABLE `rodzaj_tranzakcji` (
  `id_rodzaj_tranzakcji` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rodzaj_tranzakcji`)
);

CREATE TABLE `stan_produktow` (
  `id_stan_produktow` int NOT NULL AUTO_INCREMENT,
  `data_waznosci` date NOT NULL,
  `ilosc` int NOT NULL,
  `id_dane_produktow` int NOT NULL,
  `id_magazyn` int NOT NULL,
  PRIMARY KEY (`id_stan_produktow`)
);

CREATE TABLE `stanowisko` (
  `id_stanowisko` int NOT NULL AUTO_INCREMENT,
  `pozycja` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stanowisko`)
);

CREATE TABLE `transakcja` (
  `id_transakcji` int NOT NULL AUTO_INCREMENT,
  `kwota` float NOT NULL,
  `data` datetime NOT NULL,
  `czy_finalizacja` bit(1) NOT NULL,
  `id_rodzaj_transakcji` int DEFAULT NULL,
  `id_pracownik` int NOT NULL,
  `id_koszyk` int NOT NULL,
  PRIMARY KEY (`id_transakcji`)
);

CREATE TABLE `wielo_sztuki` (
  `id_wielo_sztuki` int NOT NULL AUTO_INCREMENT,
  `ilosc` int DEFAULT NULL,
  `cena_znizka_brutto` float DEFAULT NULL,
  `cena_znizka_netto` float DEFAULT NULL,
  `id_ceny` int NOT NULL,
  PRIMARY KEY (`id_wielo_sztuki`)
);

ALTER TABLE `ceny_historia` ADD CONSTRAINT `ceny_historia_ibfk_1` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_1` FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_2` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_3` FOREIGN KEY (`id_producenta`) REFERENCES `producent` (`id_producent`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `koszyk` ADD CONSTRAINT `koszyk_ibfk_1` FOREIGN KEY (`id_dane_produktow`) REFERENCES `dane_produktow` (`id_dane_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `login_historia` ADD CONSTRAINT `login_historia_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pracownik_stanowisko` ADD CONSTRAINT `pracownik_stanowisko_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pracownik_stanowisko` ADD CONSTRAINT `pracownik_stanowisko_ibfk_2` FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowisko` (`id_stanowisko`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `producent` ADD CONSTRAINT `producent_ibfk_1` FOREIGN KEY (`id_kraj_producenta`) REFERENCES `kraj_producenta` (`id_kraj_producenta`) ON DELETE SET NULL ON UPDATE RESTRICT;
ALTER TABLE `przedmiot_w_koszyku` ADD CONSTRAINT `przedmiot_w_koszyku_ibfk_1` FOREIGN KEY (`id_stan_produktow`) REFERENCES `stan_produktow` (`id_stan_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `stan_produktow` ADD CONSTRAINT `stan_produktow_ibfk_1` FOREIGN KEY (`id_dane_produktow`) REFERENCES `dane_produktow` (`id_dane_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `stan_produktow` ADD CONSTRAINT `stan_produktow_ibfk_2` FOREIGN KEY (`id_magazyn`) REFERENCES `magazyn` (`id_magazyn`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transakcja` ADD CONSTRAINT `transakcja_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transakcja` ADD CONSTRAINT `tranzakcja_ibfk_1` FOREIGN KEY (`id_rodzaj_transakcji`) REFERENCES `rodzaj_tranzakcji` (`id_rodzaj_tranzakcji`) ON DELETE SET NULL ON UPDATE SET NULL;
ALTER TABLE `transakcja` ADD CONSTRAINT `trazakcja_ibfk_1` FOREIGN KEY (`id_koszyk`) REFERENCES `koszyk` (`id_koszyk`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `wielo_sztuki` ADD CONSTRAINT `wielo_sztuki_ibfk_1` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;
