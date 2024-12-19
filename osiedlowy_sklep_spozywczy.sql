DROP DATABASE IF EXISTS osiedlowy_sklep_spozywczy;

CREATE DATABASE osiedlowy_sklep_spozywczy;

USE osiedlowy_sklep_spozywczy;

CREATE TABLE `ceny` (
  `id_ceny` INT NOT NULL AUTO_INCREMENT,
  `za_szt_za_kg` BIT(1) NOT NULL,
  `cena_brutto` FLOAT NULL DEFAULT NULL,
  `cena_netto` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id_ceny`) USING BTREE
);

CREATE TABLE `ceny_historia` (
  `id_historia_ceny` INT NOT NULL AUTO_INCREMENT,
  `id_ceny` INT NOT NULL,
  `data_zmiany` DATE NOT NULL,
  `cena_brutto` FLOAT NOT NULL,
  `cena_netto` FLOAT NOT NULL,
  PRIMARY KEY (`id_historia_ceny`),
  FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`)
);

CREATE TABLE `kategoria` (
  `id_kategoria` INT NOT NULL AUTO_INCREMENT,
  `nazwa_kategorii` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_kategoria`) USING BTREE
);

CREATE TABLE `producent` (
  `id_producent` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(255) NOT NULL,
  `adres` VARCHAR(255) NOT NULL,
  `kraj` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_producent`)
);

CREATE TABLE `dane_produktow` (
  `id_dane_produktow` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(255) NOT NULL,
  `vat` FLOAT NOT NULL,
  `id_kategoria` INT NOT NULL,
  `id_ceny` INT NOT NULL,
  `id_producenta` INT NOT NULL,
  PRIMARY KEY (`id_dane_produktow`) USING BTREE,
  FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (`id_producenta`) REFERENCES `producent` (`id_producent`)
);

CREATE TABLE `magazyn` (
  `id_magazyn` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(255) NOT NULL,
  `pojemnosc` INT NOT NULL,
  `zapelnienie` INT UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id_magazyn`) USING BTREE
);

CREATE TABLE `stan_produktow` (
  `id_stan_produktow` INT NOT NULL AUTO_INCREMENT,
  `data_waznosci` DATE NOT NULL,
  `ilosc` INT NOT NULL,
  `id_dane_produktow` INT NOT NULL,
  `id_magazyn` INT NOT NULL,
  PRIMARY KEY (`id_stan_produktow`) USING BTREE,
  FOREIGN KEY (`id_dane_produktow`) REFERENCES `dane_produktow` (`id_dane_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (`id_magazyn`) REFERENCES `magazyn` (`id_magazyn`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE `przedmiot_w_koszyku` (
  `id_przedmiot_w_koszyku` INT NOT NULL AUTO_INCREMENT,
  `ilosc` INT NOT NULL,
  `id_stan_produktow` INT NOT NULL,
  PRIMARY KEY (`id_przedmiot_w_koszyku`) USING BTREE,
  FOREIGN KEY (`id_stan_produktow`) REFERENCES `stan_produktow` (`id_stan_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE `pracownik` (
  `id_pracownik` INT NOT NULL AUTO_INCREMENT,
  `imie` VARCHAR(255) NOT NULL,
  `nazwisko` VARCHAR(255) NOT NULL,
  `pesel` VARCHAR(11) NOT NULL,
  `login` VARCHAR(255) NOT NULL,
  `haslo` VARCHAR(255) NOT NULL,
  `wynagrodzenie` FLOAT NOT NULL,
  PRIMARY KEY (`id_pracownik`) USING BTREE
);

CREATE TABLE `transakcja` (
  `id_transakcji` INT NOT NULL AUTO_INCREMENT,
  `kwota` FLOAT NOT NULL,
  `data` DATETIME NOT NULL,
  `rodzaj_transakcji` VARCHAR(255) NOT NULL,
  `czy_finalizacja` BIT(1) NOT NULL,
  `id_pracownik` INT NOT NULL,
  PRIMARY KEY (`id_transakcji`) USING BTREE,
  FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE `koszyk` (
  `id_koszyk` INT NOT NULL AUTO_INCREMENT,
  `id_przedmiot_w_koszyku` INT NOT NULL,
  `id_transakcji` INT NOT NULL,
  PRIMARY KEY (`id_koszyk`) USING BTREE,
  FOREIGN KEY (`id_przedmiot_w_koszyku`) REFERENCES `przedmiot_w_koszyku` (`id_przedmiot_w_koszyku`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (`id_transakcji`) REFERENCES `transakcja` (`id_transakcji`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE `login_historia` (
  `id_logowania` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `operacja` VARCHAR(255) NOT NULL,
  `id_pracownik` INT NULL,
  PRIMARY KEY (`id_logowania`),
  FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`)
);

CREATE TABLE `stanowisko` (
  `id_stanowisko` INT NOT NULL AUTO_INCREMENT,
  `pozycja` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_stanowisko`) USING BTREE
);

CREATE TABLE `pracownik_stanowisko` (
  `id_pracownik_stanowisko` INT NOT NULL AUTO_INCREMENT,
  `id_pracownik` INT NOT NULL,
  `id_stanowisko` INT NOT NULL,
  PRIMARY KEY (`id_pracownik_stanowisko`),
  FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`),
  FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowisko` (`id_stanowisko`)
);

CREATE TABLE `wielo_sztuki` (
  `id_wielo_sztuki` INT NOT NULL AUTO_INCREMENT,
  `ilosc` INT NULL DEFAULT NULL,
  `cena_znizka_brutto` FLOAT NULL DEFAULT NULL,
  `cena_znizka_netto` FLOAT NULL DEFAULT NULL,
  `id_ceny` INT NOT NULL,
  PRIMARY KEY (`id_wielo_sztuki`) USING BTREE,
  FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT
);