USE osiedlowy_sklep_spozywczy;

-- Wstawianie danych do tabeli `ceny`
INSERT INTO `ceny` (`cenaBrutto`, `cenaNetto`)
VALUES
(10.99, 8.94),
(15.49, 12.60),
(8.30, 6.76),
(25.00, 20.33),
(5.99, 4.87),
(12.49, 10.16),
(7.89, 6.42),
(18.99, 15.44),
(3.50, 2.85),
(20.00, 16.26);

-- Wstawianie danych do tabeli `kategoria`
INSERT INTO `kategoria` (`nazwaKategorii`)
VALUES
('Napoje'),
('Słodycze'),
('Produkty mleczne'),
('Warzywa'),
('Owoce'),
('Mięso'),
('Pieczywo'),
('Produkty mrożone'),
('Chemia gospodarcza'),
('Kosmetyki');

-- Wstawianie danych do tabeli `daneProduktów`
INSERT INTO `daneProduktów` (`nazwa`, `VAT`, `id_kategoria`, `id_ceny`)
VALUES
('Woda mineralna', 0.08, 1, 1),
('Czekolada mleczna', 0.23, 2, 2),
('Jogurt naturalny', 0.08, 3, 3),
('Marchew', 0.05, 4, 4),
('Jabłko', 0.05, 5, 5),
('Pierś z kurczaka', 0.08, 6, 6),
('Bułka', 0.05, 7, 7),
('Pizza mrożona', 0.08, 8, 8),
('Płyn do naczyń', 0.23, 9, 9),
('Krem nawilżający', 0.23, 10, 10);

-- Wstawianie danych do tabeli `dziennyUtarg`
INSERT INTO `dziennyUtarg` (`data`, `kwotaŁączna`)
VALUES
('2024-11-01', 2000.50),
('2024-11-02', 1800.00),
('2024-11-03', 2200.75),
('2024-11-04', 1950.40),
('2024-11-05', 2050.90),
('2024-11-06', 2300.30),
('2024-11-07', 2500.00),
('2024-11-08', 2400.80),
('2024-11-09', 2600.45),
('2024-11-10', 2700.10);

-- Wstawianie danych do tabeli `magazyn`
INSERT INTO `magazyn` (`nazwa`, `pojemnosc`, `zapelnienie`)
VALUES
('Magazyn Główny', 10000, 004000),
('Magazyn Oddziałowy', 8000, 002500),
('Magazyn Sezonowy', 5000, 001500),
('Chłodnia', 7000, 003000),
('Magazyn Chemii', 4000, 001000),
('Skład Pieczywa', 2000, 001200),
('Skład Mrożonek', 3000, 001800),
('Skład Owoców', 2500, 001700),
('Skład Warzyw', 2500, 001600),
('Magazyn Techniczny', 3000, 001100);

-- Wstawianie danych do tabeli `pracownicy`
INSERT INTO `pracownicy` (`imie`, `nazwisko`, `pesel`)
VALUES
('Jan', 'Kowalski', '85010112345'),
('Anna', 'Nowak', '92030456789'),
('Piotr', 'Wiśniewski', '88070523456'),
('Katarzyna', 'Wójcik', '95081287654'),
('Tomasz', 'Kamiński', '87060234567'),
('Monika', 'Lewandowska', '90050345678'),
('Marek', 'Dąbrowski', '86040165432'),
('Agnieszka', 'Zielińska', '93021034567'),
('Paweł', 'Szymański', '89090723456'),
('Ewa', 'Woźniak', '91031287654');

-- Wstawianie danych do tabeli `stanProduktów`
INSERT INTO `stanProduktów` (`dataWaznosci`, `ilosc`, `id_daneproduktow`, `id_magazyn`)
VALUES
('2024-12-01', 100, 1, 1),
('2024-12-10', 200, 2, 2),
('2024-11-30', 150, 3, 3),
('2024-12-15', 300, 4, 4),
('2024-12-20', 250, 5, 5),
('2024-11-25', 120, 6, 6),
('2024-12-05', 400, 7, 7),
('2024-11-28', 180, 8, 8),
('2024-12-12', 220, 9, 9),
('2024-12-18', 270, 10, 10);

-- Wstawianie danych do pozostałych tabel, takich jak `koszyk`, `tranzakcja`, `premia`, `stanowisko`, itd.
-- Analogicznie można dodać odpowiednie przykładowe dane zgodne z kluczami obcymi.

-- Kontynuacja wstawiania danych zależnie od potrzeb...

-- Wstawianie danych do tabeli `premia`
INSERT INTO `premia` (`kwota`, `id_pracownik`)
VALUES
(500.00, 1),
(300.00, 2),
(700.00, 3),
(400.00, 4),
(600.00, 5),
(250.00, 6),
(800.00, 7),
(350.00, 8),
(450.00, 9),
(550.00, 10);

-- Wstawianie danych do tabeli `wynagrodzenie`
INSERT INTO `wynagrodzenie` (`wynagrodzenieNetto`, `wynagrodzenieBrutto`, `koszt_zatrudnienia`)
VALUES
(3000, 4000, 4500),
(2500, 3300, 3700),
(2800, 3700, 4200),
(2400, 3200, 3600),
(2600, 3500, 3900),
(2300, 3100, 3500),
(2900, 3800, 4300),
(2700, 3600, 4100),
(2500, 3400, 3800),
(2600, 3500, 4000);

-- Wstawianie danych do tabeli `stanowisko`
INSERT INTO `stanowisko` (`pozycja`, `id_pracownik`, `id_wynagrodzenia`)
VALUES
('Kierownik', 1, 1),
('Sprzedawca', 2, 2),
('Kasjer', 3, 3),
('Magazynier', 4, 4),
('Kasjer', 5, 5),
('Sprzedawca', 6, 6),
('Kierownik zmiany', 7, 7),
('Sprzedawca', 8, 8),
('Magazynier', 9, 9),
('Kasjer', 10, 10);


-- Wstawianie danych do tabeli `tranzakcja`
INSERT INTO `tranzakcja` (`id_tranzakcji`, `kwota`, `data`, `rodzajtranzakcji`, `czyfinalizacja`, `id_pracownik`, `id_dziennyutarg`)
VALUES
(1, 150.00, '2024-11-01 10:15:00', 'Gotówka', 1, 1, 1),
(2, 300.00, '2024-11-02 12:30:00', 'Karta', 1, 2, 2),
(3, 250.00, '2024-11-03 14:45:00', 'Gotówka', 1, 3, 3),
(4, 200.00, '2024-11-04 16:00:00', 'Gotówka', 1, 4, 4),
(5, 180.00, '2024-11-05 18:10:00', 'Karta', 1, 5, 5),
(6, 400.00, '2024-11-06 09:00:00', 'Gotówka', 1, 6, 6),
(7, 220.00, '2024-11-07 11:20:00', 'Karta', 1, 7, 7),
(8, 320.00, '2024-11-08 15:00:00', 'Gotówka', 1, 8, 8),
(9, 290.00, '2024-11-09 13:30:00', 'Karta', 1, 9, 9),
(10, 260.00, '2024-11-10 17:45:00', 'Gotówka', 1, 10, 10);

-- Wstawianie danych do tabeli `przedmiotWKoszyku`
INSERT INTO `przedmiotWKoszyku` (`ilosc`, `id_stanproduktow`)
VALUES
(2, 1),
(3, 2),
(1, 3),
(4, 4),
(5, 5),
(2, 6),
(3, 7),
(1, 8),
(2, 9),
(4, 10);

-- Wstawianie danych do tabeli `koszyk`
INSERT INTO `koszyk` (`id_przedmiotwkoszyku`, `id_tranzakcji`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- Wstawianie danych do tabeli `wielosztuki`
INSERT INTO `wielosztuki` (`ilosc`, `cenaznizkaBrutto`, `cenaznizkaNetto`, `id_ceny`)
VALUES
('2x', 20.00, 16.26, 1),
('3x', 45.00, 36.58, 2),
('4x', 70.00, 56.91, 3),
('5x', 100.00, 81.30, 4),
('6x', 120.00, 97.56, 5),
('2x', 25.00, 20.33, 6),
('3x', 55.00, 44.71, 7),
('4x', 90.00, 73.17, 8),
('5x', 125.00, 101.63, 9),
('6x', 150.00, 121.95, 10);