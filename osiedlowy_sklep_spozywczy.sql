DROP DATABASE IF EXISTS zajac_jakub_jeremi;

CREATE DATABASE zajac_jakub_jeremi;

USE zajac_jakub_jeremi;

-- ========================== Twożenie tabel ====================================
CREATE TABLE `ceny` (
  `id_ceny` int NOT NULL AUTO_INCREMENT,
  `czy_na_sztuki` bit(1) NOT NULL,
  `cena_brutto` float NULL DEFAULT NULL,
  `cena_netto` float NULL DEFAULT NULL,
  PRIMARY KEY (`id_ceny`) USING BTREE
);


CREATE TABLE `ceny_historia`  (
  `id_historia_ceny` int NOT NULL AUTO_INCREMENT,
  `id_ceny` int NOT NULL,
  `data_zmiany` date NOT NULL,
  `cena_brutto` float NOT NULL,
  `cena_netto` float NOT NULL,
  PRIMARY KEY (`id_historia_ceny`) USING BTREE,
  INDEX `ceny_historia_ibfk_1`(`id_ceny` ASC) USING BTREE
);

CREATE TABLE `dane_produktow`  (
  `id_dane_produktow` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `vat` float NOT NULL,
  `id_kategoria` int NOT NULL,
  `id_ceny` int NOT NULL,
  `id_producenta` int NOT NULL,
  PRIMARY KEY (`id_dane_produktow`) USING BTREE,
  INDEX `dane_produktow_ibfk_1`(`id_kategoria` ASC) USING BTREE,
  INDEX `dane_produktow_ibfk_2`(`id_ceny` ASC) USING BTREE,
  INDEX `dane_produktow_ibfk_3`(`id_producenta` ASC) USING BTREE
);

CREATE TABLE `kategoria`  (
  `id_kategoria` int NOT NULL AUTO_INCREMENT,
  `nazwa_kategorii` varchar(255) NOT NULL,
  PRIMARY KEY (`id_kategoria`) USING BTREE
);

CREATE TABLE `koszyk`  (
  `id_koszyk` int NOT NULL AUTO_INCREMENT,
  `id_transakcja` int NOT NULL,
  `id_dane_produktow` int NOT NULL,
	`ilosc` float NOT NULL,
  PRIMARY KEY (`id_koszyk`) USING BTREE,
  INDEX `koszyk_ibfk_1`(`id_dane_produktow` ASC) USING BTREE
);

CREATE TABLE `kraj_producenta`  (
  `id_kraj_producenta` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_kraj_producenta`) USING BTREE
);

CREATE TABLE `login_historia`  (
  `id_logowania` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `operacja` varchar(255) NOT NULL,
  `id_pracownik` int DEFAULT NULL,
  PRIMARY KEY (`id_logowania`) USING BTREE,
  INDEX `login_historia_ibfk_1`(`id_pracownik` ASC) USING BTREE
);

CREATE TABLE `magazyn`  (
  `id_magazyn` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `pojemnosc` int NOT NULL,
  `zapelnienie` int NOT NULL,
  PRIMARY KEY (`id_magazyn`) USING BTREE
);

CREATE TABLE `pracownik`  (
  `id_pracownik` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `haslo` varchar(255) NOT NULL,
  `wynagrodzenie` float NOT NULL,
  PRIMARY KEY (`id_pracownik`) USING BTREE
);

CREATE TABLE `pracownik_stanowisko`  (
  `id_pracownik_stanowisko` int NOT NULL AUTO_INCREMENT,
  `id_pracownik` int NOT NULL,
  `id_stanowisko` int NOT NULL,
  PRIMARY KEY (`id_pracownik_stanowisko`) USING BTREE,
  INDEX `pracownik_stanowisko_ibfk_1`(`id_pracownik` ASC) USING BTREE,
  INDEX `pracownik_stanowisko_ibfk_2`(`id_stanowisko` ASC) USING BTREE
);

CREATE TABLE `producent`  (
  `id_producent` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `id_kraj_producenta` int DEFAULT NULL,
  PRIMARY KEY (`id_producent`) USING BTREE,
  INDEX `producent_ibfk_1`(`id_kraj_producenta` ASC) USING BTREE
);

CREATE TABLE `rodzaj_transakcji`  (
  `id_rodzaj_transakcji` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rodzaj_transakcji`) USING BTREE
);

CREATE TABLE `stan_produktow`  (
  `id_stan_produktow` int NOT NULL AUTO_INCREMENT,
  `data_waznosci` date NOT NULL,
  `ilosc` int NOT NULL,
  `id_dane_produktow` int NOT NULL,
  `id_magazyn` int NOT NULL,
  PRIMARY KEY (`id_stan_produktow`) USING BTREE,
  INDEX `stan_produktow_ibfk_1`(`id_dane_produktow` ASC) USING BTREE,
  INDEX `stan_produktow_ibfk_2`(`id_magazyn` ASC) USING BTREE
);

CREATE TABLE `stanowisko`  (
  `id_stanowisko` int NOT NULL AUTO_INCREMENT,
  `pozycja` varchar(255) NOT NULL,
  PRIMARY KEY (`id_stanowisko`) USING BTREE
);

CREATE TABLE `transakcja`  (
  `id_transakcji` int NOT NULL AUTO_INCREMENT,
  `kwota` float NOT NULL,
  `data` datetime NOT NULL,
  `czy_finalizacja` bit(1) NOT NULL,
  `id_rodzaj_transakcji` int NOT NULL,
  `id_pracownik` int NOT NULL,
	`promocja` BIT(1),
  PRIMARY KEY (`id_transakcji`) USING BTREE,
  INDEX `transakcja_ibfk_1`(`id_pracownik` ASC) USING BTREE,
  INDEX `transakcja_ibfk_2`(`id_rodzaj_transakcji` ASC) USING BTREE
);


ALTER TABLE `ceny_historia` ADD CONSTRAINT `ceny_historia_ibfk_1` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_1` FOREIGN KEY (`id_kategoria`) REFERENCES `kategoria` (`id_kategoria`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_2` FOREIGN KEY (`id_ceny`) REFERENCES `ceny` (`id_ceny`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dane_produktow` ADD CONSTRAINT `dane_produktow_ibfk_3` FOREIGN KEY (`id_producenta`) REFERENCES `producent` (`id_producent`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `koszyk` ADD CONSTRAINT `koszyk_ibfk_1` FOREIGN KEY (`id_dane_produktow`) REFERENCES `dane_produktow` (`id_dane_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `koszyk` ADD CONSTRAINT `koszyk_ibfk_2` FOREIGN KEY (`id_transakcja`) REFERENCES `transakcja` (`id_transakcji`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `login_historia` ADD CONSTRAINT `login_historia_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pracownik_stanowisko` ADD CONSTRAINT `pracownik_stanowisko_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `pracownik_stanowisko` ADD CONSTRAINT `pracownik_stanowisko_ibfk_2` FOREIGN KEY (`id_stanowisko`) REFERENCES `stanowisko` (`id_stanowisko`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `producent` ADD CONSTRAINT `producent_ibfk_1` FOREIGN KEY (`id_kraj_producenta`) REFERENCES `kraj_producenta` (`id_kraj_producenta`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `stan_produktow` ADD CONSTRAINT `stan_produktow_ibfk_1` FOREIGN KEY (`id_dane_produktow`) REFERENCES `dane_produktow` (`id_dane_produktow`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `stan_produktow` ADD CONSTRAINT `stan_produktow_ibfk_2` FOREIGN KEY (`id_magazyn`) REFERENCES `magazyn` (`id_magazyn`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transakcja` ADD CONSTRAINT `transakcja_ibfk_1` FOREIGN KEY (`id_pracownik`) REFERENCES `pracownik` (`id_pracownik`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transakcja` ADD CONSTRAINT `transakcja_ibfk_2` FOREIGN KEY (`id_rodzaj_transakcji`) REFERENCES `rodzaj_transakcji` (`id_rodzaj_transakcji`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ============================ Wprowadzenie danych ================================================
-- Insert data into kategoria
INSERT INTO `kategoria` (`nazwa_kategorii`) VALUES
('Artykuły spożywcze'),
('Napoje'),
('Chemia gospodarcza');

-- Insert data into kraj_producenta
INSERT INTO `kraj_producenta` (`nazwa`) VALUES
('Polska'),
('Niemcy'),
('Francja');

-- Insert data into producent
INSERT INTO `producent` (`nazwa`, `adres`, `id_kraj_producenta`) VALUES
('Firma A', 'Warszawa', 1),
('Firma B', 'Berlin', 2),
('Firma C', 'Paryż', 3);

-- Insert data into ceny
INSERT INTO `ceny` (`id_ceny`, `czy_na_sztuki`, `cena_brutto`, `cena_netto`) VALUES
(1, 1, 5.99, 4.87),
(2, 0, 12.49, 10.12),
(3, 1, 2.29, 1.86);

-- Insert data into dane_produktow
INSERT INTO `dane_produktow` (`nazwa`, `vat`, `id_kategoria`, `id_ceny`, `id_producenta`) VALUES
('Chleb pszenny', 8, 1, 1, 1),
('Woda mineralna', 23, 2, 2, 2),
('Płyn do naczyń', 8, 3, 3, 3);

-- Insert data into magazyn
INSERT INTO `magazyn` (`nazwa`, `pojemnosc`, `zapelnienie`) VALUES
('Magazyn 1', 500, 150),
('Magazyn 2', 300, 100),
('Magazyn 3', 1000, 750);

-- Insert data into pracownik
INSERT INTO `pracownik` (`imie`, `nazwisko`, `pesel`, `login`, `haslo`, `wynagrodzenie`) VALUES
('Jan', 'Kowalski', '12345678901', 'jan.kowalski', 'password123', 3500.00),
('Anna', 'Nowak', '98765432101', 'anna.nowak', 'password456', 4000.00);

-- Insert data into stanowisko
INSERT INTO `stanowisko` (`pozycja`) VALUES
('Kasjer'),
('Kierownik');

-- Insert data into pracownik_stanowisko
INSERT INTO `pracownik_stanowisko` (`id_pracownik`, `id_stanowisko`) VALUES
(1, 1),
(2, 2);


-- Insert data into transakcja
INSERT INTO `rodzaj_transakcji` (`nazwa`) VALUES
('kartą'),
('gotówką');

-- Insert data into transakcja
INSERT INTO `transakcja` (`kwota`, `data`, `czy_finalizacja`, `id_rodzaj_transakcji`, `id_pracownik`, `promocja`) VALUES
(25.99, '2024-12-19 10:00:00', 1, 1, 1, 0),
(10.49, '2024-12-19 11:00:00', 1, 2, 2, 0);

-- Insert data into koszyk
INSERT INTO `koszyk` (`id_transakcja`, `id_dane_produktow`, `ilosc`) VALUES
(1, 1, 2),
(1, 2, 3);

-- Insert data into ceny_historia
INSERT INTO `ceny_historia` (`id_ceny`, `data_zmiany`, `cena_brutto`, `cena_netto`) VALUES
(1, '2024-12-19', 6.49, 5.28),
(2, '2024-12-19', 13.49, 11.00),
(3, '2024-12-19', 2.59, 2.11);

-- Insert data into stan_produktow
INSERT INTO `stan_produktow` (`data_waznosci`, `ilosc`, `id_dane_produktow`, `id_magazyn`) VALUES
('2024-12-31', 200, 1, 1),
('2024-12-20', 150, 2, 2),
('2024-12-25', 300, 3, 3);

-- Insert data into login_historia
INSERT INTO `login_historia` (`data`, `operacja`, `id_pracownik`) VALUES
('2024-12-19 08:30:00', 'Logowanie', 1),
('2024-12-19 09:00:00', 'Logowanie', 2),
('2024-12-19 10:15:00', 'Wylogowanie', 1),
('2024-12-19 11:30:00', 'Logowanie', 1);

-- ===================================== Widoki ================================================
CREATE VIEW widok_historia_logowania AS
SELECT 
    lh.id_logowania,
    lh.data AS data_logowania,
    lh.operacja,
    p.imie AS imie_pracownika,
    p.nazwisko AS nazwisko_pracownika
FROM 
    login_historia lh
LEFT JOIN 
    pracownik p ON lh.id_pracownik = p.id_pracownik;


CREATE VIEW Widok_Stan_Magazynowy AS
SELECT
    dp.nazwa AS Produkt,
    sp.ilosc AS Ilosc,
    m.nazwa AS Magazyn
FROM
    stan_produktow sp
JOIN
    dane_produktow dp ON sp.id_dane_produktow = dp.id_dane_produktow
JOIN
    magazyn m ON sp.id_magazyn = m.id_magazyn;


CREATE VIEW widok_przejrzyste_transakcje AS
SELECT 
    t.id_transakcji,
    t.kwota,
    t.data AS data_transakcji,
    CASE t.czy_finalizacja
        WHEN 1 THEN 'Tak'
        ELSE 'Nie'
    END AS czy_finalizacja,
    rt.nazwa AS rodzaj_transakcji,
    p.imie AS imie_pracownika,
    p.nazwisko AS nazwisko_pracownika
FROM 
    transakcja t
LEFT JOIN 
    rodzaj_transakcji rt ON t.id_rodzaj_transakcji = rt.id_rodzaj_transakcji
LEFT JOIN 
    pracownik p ON t.id_pracownik = p.id_pracownik;

-- =============================== Funkcje i Procedury ========================================
DELIMITER $$

CREATE FUNCTION ObliczWartoscMagazynow()
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE wartosc_magazynu FLOAT;
    SELECT SUM(sp.ilosc * c.cena_brutto) INTO wartosc_magazynu
    FROM stan_produktow sp
    JOIN dane_produktow dp ON sp.id_dane_produktow = dp.id_dane_produktow
    JOIN ceny c ON dp.id_ceny = c.id_ceny;
    RETURN wartosc_magazynu;
END$$

DELIMITER ;
-- SELECT ObliczWartoscMagazynow();

DELIMITER $$

CREATE FUNCTION SprawdzDostepnosc(nazwa_produktu VARCHAR(255))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ilosc_produktu INT;
    SELECT SUM(sp.ilosc) INTO ilosc_produktu
    FROM stan_produktow sp
    JOIN dane_produktow dp ON sp.id_dane_produktow = dp.id_dane_produktow
    WHERE dp.nazwa = nazwa_produktu;
    RETURN IFNULL(ilosc_produktu, 0);
END$$

DELIMITER ;
-- SELECT SprawdzDostepnosc('Woda mineralna');

DELIMITER //

DELIMITER //

CREATE PROCEDURE nowa_cena(
    IN id_produktu INT,
    IN nowa_cena_brutto FLOAT,
    IN nowa_cena_netto FLOAT
)
BEGIN
    DECLARE lokalne_id_ceny INT;
    DECLARE lokalna_cena_brutto FLOAT;
    DECLARE lokalna_cena_netto FLOAT;

    -- Sprawdzenie, czy produkt istnieje w tabeli ceny
    SELECT id_ceny INTO lokalne_id_ceny
    FROM dane_produktow
    WHERE id_dane_produktow = id_produktu;

    IF lokalne_id_ceny IS NOT NULL THEN
        -- Pobranie aktualnych cen
        SELECT cena_brutto, cena_netto INTO lokalna_cena_brutto, lokalna_cena_netto
        FROM ceny
        WHERE id_ceny = lokalne_id_ceny;

        -- Wstawienie historii cen
        INSERT INTO ceny_historia (id_ceny, data_zmiany, cena_brutto, cena_netto)
        VALUES (lokalne_id_ceny, CURDATE(), lokalna_cena_brutto, lokalna_cena_netto);

        -- Aktualizacja cen
        UPDATE ceny
        SET cena_brutto = nowa_cena_brutto, cena_netto = nowa_cena_netto
        WHERE id_ceny = lokalne_id_ceny;

    ELSE
        -- Wstawienie nowej ceny, jeśli nie istnieje
        INSERT INTO ceny (id_ceny, czy_na_sztuki, cena_brutto, cena_netto)
        VALUES (NULL, 1, nowa_cena_brutto, nowa_cena_netto); -- NULL pozwala na wygenerowanie id_ceny w AUTO_INCREMENT

        -- Pobranie nowo wygenerowanego id_ceny
        SET lokalne_id_ceny = LAST_INSERT_ID();

        -- Przypisanie nowej ceny do produktu
        UPDATE dane_produktow
        SET id_ceny = lokalne_id_ceny
        WHERE id_dane_produktow = id_produktu;
    END IF;
END //

DELIMITER ;


-- nowa_cena(1, 1.54, 2.01);

DELIMITER //

CREATE FUNCTION kwota_transakcji(transakcja_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE kwota FLOAT;

    -- Obliczanie sumy kwoty dla wszystkich produktów w koszyku
    SELECT IFNULL(SUM(k.ilosc * c.cena_brutto), 0) INTO kwota
    FROM koszyk k
    JOIN dane_produktow dp ON k.id_dane_produktow = dp.id_dane_produktow
    JOIN ceny c ON dp.id_ceny = c.id_ceny
    WHERE k.id_transakcja = transakcja_id;

    RETURN kwota;
END //

DELIMITER ;


-- CALL kwota_transakcji(1)

DELIMITER //

CREATE PROCEDURE dodaj_przedmiot_do_koszyka(
    IN in_id_transakcji INT,
    IN in_id_dane_produktow INT,
    IN in_ilosc FLOAT
)
BEGIN
    -- Sprawdzanie, czy transakcja istnieje
    IF NOT EXISTS (
        SELECT 1
        FROM transakcja t
        WHERE t.id_transakcji = in_id_transakcji
    ) THEN
        -- Tworzenie nowej transakcji z domyślnymi wartościami
        INSERT INTO transakcja (id_transakcji, kwota, data, czy_finalizacja, id_rodzaj_transakcji, id_pracownik)
        VALUES (in_id_transakcji, 0, NOW(), 0, NULL, NULL);
    END IF;

    -- Dodawanie przedmiotu do koszyka
    INSERT INTO koszyk (id_transakcja, id_dane_produktow, ilosc)
    VALUES (in_id_transakcji, in_id_dane_produktow, in_ilosc);
END //

DELIMITER ;

-- CALL dodaj_przedmiot_do_koszyka(5, 10, 3);


-- =============================== TRIGGER ========================================

DELIMITER //

CREATE TRIGGER aktualizuj_kwote_transakcji_po_koszyku
AFTER INSERT ON koszyk
FOR EACH ROW
BEGIN
    -- Aktualizacja kwoty po operacji INSERT
    UPDATE transakcja
    SET kwota = kwota_transakcji(NEW.id_transakcja)
    WHERE id_transakcji = NEW.id_transakcja;
END //

CREATE TRIGGER aktualizuj_kwote_transakcji_po_koszyku_update
AFTER UPDATE ON koszyk
FOR EACH ROW
BEGIN
    -- Aktualizacja kwoty po operacji UPDATE
    UPDATE transakcja
    SET kwota = kwota_transakcji(NEW.id_transakcja)
    WHERE id_transakcji = NEW.id_transakcja;
END //

CREATE TRIGGER aktualizuj_kwote_transakcji_po_koszyku_delete
AFTER DELETE ON koszyk
FOR EACH ROW
BEGIN
    -- Aktualizacja kwoty po operacji DELETE
    UPDATE transakcja
    SET kwota = kwota_transakcji(OLD.id_transakcja)
    WHERE id_transakcji = OLD.id_transakcja;
END //

DELIMITER ;
