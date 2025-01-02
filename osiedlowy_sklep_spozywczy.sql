DROP DATABASE IF EXISTS osiedlowy_sklep_spozywczy;

CREATE DATABASE osiedlowy_sklep_spozywczy;

USE osiedlowy_sklep_spozywczy;

CREATE TABLE `ceny`  (
  `id_ceny` int NOT NULL AUTO_INCREMENT,
  `czy_na_sztuki` bit(1) NOT NULL,
  `cena_brutto` float NULL DEFAULT NULL,
  `cena_netto` float NULL DEFAULT NULL,
  PRIMARY KEY (`id_ceny`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `ceny_historia`  (
  `id_historia_ceny` int NOT NULL AUTO_INCREMENT,
  `id_ceny` int NOT NULL,
  `data_zmiany` date NOT NULL,
  `cena_brutto` float NOT NULL,
  `cena_netto` float NOT NULL,
  PRIMARY KEY (`id_historia_ceny`) USING BTREE,
  INDEX `ceny_historia_ibfk_1`(`id_ceny` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `dane_produktow`  (
  `id_dane_produktow` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vat` float NOT NULL,
  `id_kategoria` int NOT NULL,
  `id_ceny` int NOT NULL,
  `id_producenta` int NOT NULL,
  PRIMARY KEY (`id_dane_produktow`) USING BTREE,
  INDEX `dane_produktow_ibfk_1`(`id_kategoria` ASC) USING BTREE,
  INDEX `dane_produktow_ibfk_2`(`id_ceny` ASC) USING BTREE,
  INDEX `dane_produktow_ibfk_3`(`id_producenta` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `kategoria`  (
  `id_kategoria` int NOT NULL AUTO_INCREMENT,
  `nazwa_kategorii` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_kategoria`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `koszyk`  (
  `id_koszyk` int NOT NULL AUTO_INCREMENT,
  `id_tranzakcja` int NOT NULL,
  `id_dane_produktow` int NOT NULL,
  PRIMARY KEY (`id_koszyk`) USING BTREE,
  INDEX `koszyk_ibfk_1`(`id_dane_produktow` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `kraj_producenta`  (
  `id_kraj_producenta` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kraj_producenta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `login_historia`  (
  `id_logowania` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `operacja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_pracownik` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_logowania`) USING BTREE,
  INDEX `login_historia_ibfk_1`(`id_pracownik` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `magazyn`  (
  `id_magazyn` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pojemnosc` int NOT NULL,
  `zapelnienie` int NOT NULL,
  PRIMARY KEY (`id_magazyn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `pracownik`  (
  `id_pracownik` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nazwisko` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pesel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `haslo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `wynagrodzenie` float NOT NULL,
  PRIMARY KEY (`id_pracownik`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `pracownik_stanowisko`  (
  `id_pracownik_stanowisko` int NOT NULL AUTO_INCREMENT,
  `id_pracownik` int NOT NULL,
  `id_stanowisko` int NOT NULL,
  PRIMARY KEY (`id_pracownik_stanowisko`) USING BTREE,
  INDEX `pracownik_stanowisko_ibfk_1`(`id_pracownik` ASC) USING BTREE,
  INDEX `pracownik_stanowisko_ibfk_2`(`id_stanowisko` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `producent`  (
  `id_producent` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adres` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_kraj_producenta` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_producent`) USING BTREE,
  INDEX `producent_ibfk_1`(`id_kraj_producenta` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `rodzaj_tranzakcji`  (
  `id_rodzaj_tranzakcji` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_rodzaj_tranzakcji`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `stan_produktow`  (
  `id_stan_produktow` int NOT NULL AUTO_INCREMENT,
  `data_waznosci` date NOT NULL,
  `ilosc` int NOT NULL,
  `id_dane_produktow` int NOT NULL,
  `id_magazyn` int NOT NULL,
  PRIMARY KEY (`id_stan_produktow`) USING BTREE,
  INDEX `stan_produktow_ibfk_1`(`id_dane_produktow` ASC) USING BTREE,
  INDEX `stan_produktow_ibfk_2`(`id_magazyn` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `stanowisko`  (
  `id_stanowisko` int NOT NULL AUTO_INCREMENT,
  `pozycja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_stanowisko`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `transakcja`  (
  `id_transakcji` int NOT NULL AUTO_INCREMENT,
  `kwota` float NOT NULL,
  `data` datetime NOT NULL,
  `czy_finalizacja` bit(1) NOT NULL,
  `id_rodzaj_transakcji` int NOT NULL,
  `id_pracownik` int NOT NULL,
  PRIMARY KEY (`id_transakcji`) USING BTREE,
  INDEX `transakcja_ibfk_1`(`id_pracownik` ASC) USING BTREE,
  INDEX `tranzakcja_ibfk_2`(`id_rodzaj_transakcji` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `wielo_sztuki`  (
  `id_wielo_sztuki` int NOT NULL AUTO_INCREMENT,
  `ilosc` int NULL DEFAULT NULL,
  `cena_znizka_brutto` float NULL DEFAULT NULL,
  `cena_znizka_netto` float NULL DEFAULT NULL,
  `id_ceny` int NOT NULL,
  PRIMARY KEY (`id_wielo_sztuki`) USING BTREE,
  INDEX `wielo_sztuki_ibfk_1`(`id_ceny` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

ALTER TABLE `ceny_historia` ADD CONSTRAINT `ceny_historia_ibfk_1` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_1` FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_2` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_3` FOREIGN KEY (`id_producenta`) REFERENCES `producent` (`id_producent`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `koszyk` ADD CONSTRAINT `koszyk_ibfk_1` FOREIGN KEY (`id_dane_produktow`) REFERENCES `dane_produktow` (`id_dane_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `koszyk` ADD CONSTRAINT `koszyk_ibfk_2` FOREIGN KEY (`id_tranzakcja`) REFERENCES `transakcja` (`id_transakcji`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `login_historia` ADD CONSTRAINT `login_historia_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pracownik_stanowisko` ADD CONSTRAINT `pracownik_stanowisko_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pracownik_stanowisko` ADD CONSTRAINT `pracownik_stanowisko_ibfk_2` FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowisko` (`id_stanowisko`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `producent` ADD CONSTRAINT `producent_ibfk_1` FOREIGN KEY (`id_kraj_producenta`) REFERENCES `kraj_producenta` (`id_kraj_producenta`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `stan_produktow` ADD CONSTRAINT `stan_produktow_ibfk_1` FOREIGN KEY (`id_dane_produktow`) REFERENCES `dane_produktow` (`id_dane_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `stan_produktow` ADD CONSTRAINT `stan_produktow_ibfk_2` FOREIGN KEY (`id_magazyn`) REFERENCES `magazyn` (`id_magazyn`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transakcja` ADD CONSTRAINT `transakcja_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transakcja` ADD CONSTRAINT `tranzakcja_ibfk_2` FOREIGN KEY (`id_rodzaj_transakcji`) REFERENCES `rodzaj_tranzakcji` (`id_rodzaj_tranzakcji`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `wielo_sztuki` ADD CONSTRAINT `wielo_sztuki_ibfk_1` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;

