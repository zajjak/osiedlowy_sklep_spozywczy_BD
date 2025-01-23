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
INSERT INTO `rodzaj_tranzakcji` (`nazwa`) VALUES
('kartą'),
('gotówką');

-- Insert data into transakcja
INSERT INTO `transakcja` (`kwota`, `data`, `czy_finalizacja`, `id_rodzaj_transakcji`, `id_pracownik`) VALUES
(25.99, '2024-12-19 10:00:00', 1, 1, 1, 0),
(10.49, '2024-12-19 11:00:00', 1, 2, 2, 0);

-- Insert data into koszyk
INSERT INTO `koszyk` (`id_tranzakcja`, `id_dane_produktow`) VALUES
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

-- Insert data into wielo_sztuki
INSERT INTO `wielo_sztuki` (`ilosc`, `cena_znizka_brutto`, `cena_znizka_netto`, `id_ceny`) VALUES
(5, 25.00, 20.33, 1),
(10, 45.00, 36.59, 2),
(3, 6.50, 5.30, 3);


