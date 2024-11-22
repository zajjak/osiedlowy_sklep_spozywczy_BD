-- Dodaj przykładowe dane do tabeli kategoria
INSERT INTO `kategoria` (`nazwaKategorii`) VALUES
('Napoje'),
('Owoce'),
('Warzywa'),
('Mleko'),
('Mięso'),
('Pieczywo'),
('Przekąski'),
('Słodycze'),
('Mrożonki'),
('Chemia');

-- Dodaj przykładowe dane do tabeli ceny
INSERT INTO `ceny` (`cenaBrutto`, `cenaNetto`) VALUES
(10.99, 8.94),
(2.50, 2.03),
(15.30, 12.44),
(5.75, 4.67),
(3.99, 3.25),
(9.00, 7.32),
(7.40, 6.00),
(11.00, 8.94),
(8.50, 6.91),
(12.60, 10.25);

-- Dodaj przykładowe dane do tabeli daneproduktów
INSERT INTO `daneproduktów` (`nazwa`, `VAT`, `id_kategoria`, `id_ceny`) VALUES
('Coca-Cola 500ml', 5, 1, 1),
('Jabłka', 5, 2, 2),
('Ziemniaki', 5, 3, 3),
('Mleko 1L', 5, 4, 4),
('Kiełbasa', 5, 5, 5),
('Chleb pszenny', 5, 6, 6),
('Orzeszki ziemne', 8, 7, 7),
('Czekolada mleczna', 5, 8, 8),
('Frytki mrożone', 5, 9, 9),
('Płyn do naczyń', 23, 10, 10);

-- Dodaj przykładowe dane do tabeli dziennyutarg
INSERT INTO `dziennyutarg` (`data`, `kwotaŁączna`) VALUES
('2024-11-01', 250.00),
('2024-11-02', 180.50),
('2024-11-03', 340.00),
('2024-11-04', 120.00),
('2024-11-05', 450.00),
('2024-11-06', 270.00),
('2024-11-07', 320.00),
('2024-11-08', 200.00),
('2024-11-09', 500.00),
('2024-11-10', 150.00);

-- Dodaj przykładowe dane do tabeli pracownik
INSERT INTO `pracownik` (`imie`, `nazwisko`, `pesel`) VALUES
('Jan', 'Kowalski', '12345678901'),
('Anna', 'Nowak', '23456789012'),
('Piotr', 'Zalewski', '34567890123'),
('Maria', 'Wiśniewska', '45678901234'),
('Paweł', 'Lewandowski', '56789012345'),
('Katarzyna', 'Dąbrowska', '67890123456'),
('Tomasz', 'Szymański', '78901234567'),
('Ewa', 'Wójcik', '89012345678'),
('Marek', 'Kaczmarek', '90123456789'),
('Monika', 'Krawczyk', '01234567890');

-- Dodaj przykładowe dane do tabeli wynagrodzenie
INSERT INTO `wynagrodzenie` (`wynagrodzenieNetto`, `wynagrodzenieBrutto`, `koszt_zatrudnienia`) VALUES
(3000, 3500, 4200),
(3200, 3700, 4400),
(2800, 3200, 4000),
(3500, 4000, 4700),
(2500, 2900, 3600),
(3100, 3600, 4300),
(3300, 3800, 4500),
(2700, 3100, 3800),
(3600, 4100, 4800),
(3000, 3400, 4100);

-- Dodaj przykładowe dane do tabeli stanowisko
INSERT INTO `stanowisko` (`pozycja`, `id_pracownik`, `id_wynagrodzenia`) VALUES
('Kasjer', 1, 1),
('Magazynier', 2, 2),
('Kierownik', 3, 3),
('Sprzedawca', 4, 4),
('Pomocnik', 5, 5),
('Pracownik obsługi klienta', 6, 6),
('Dostawca', 7, 7),
('Kierowca', 8, 8),
('Asystent kierownika', 9, 9),
('Sprzątaczka', 10, 10);

-- Dodaj przykładowe dane do tabeli magazyn
INSERT INTO `magazyn` (`nazwa`, `pojemnosc`, `zapelnienie`) VALUES
('Magazyn 1', 1000, 500),
('Magazyn 2', 800, 300),
('Magazyn 3', 1200, 600),
('Magazyn 4', 1500, 1000),
('Magazyn 5', 1000, 800),
('Magazyn 6', 700, 200),
('Magazyn 7', 900, 450),
('Magazyn 8', 1100, 700),
('Magazyn 9', 950, 400),
('Magazyn 10', 1300, 1100);

-- Dodaj przykładowe dane do tabeli stanproduktów
INSERT INTO `stanproduktów` (`dataWaznosci`, `ilosc`, `id_daneproduktow`, `id_magazyn`) VALUES
('2024-12-01', 50, 1, 1),
('2024-12-01', 30, 2, 2),
('2024-12-01', 20, 3, 3),
('2024-12-01', 100, 4, 4),
('2024-12-01', 80, 5, 5),
('2024-12-01', 200, 6, 6),
('2024-12-01', 150, 7, 7),
('2024-12-01', 120, 8, 8),
('2024-12-01', 90, 9, 9),
('2024-12-01', 60, 10, 10);

-- Dodaj przykładowe dane do tabeli przedmiotwkoszyku
INSERT INTO `przedmiotwkoszyku` (`ilosc`, `id_stanproduktow`) VALUES
(1, 1),
(3, 2),
(2, 3),
(5, 4),
(4, 5),
(6, 6),
(2, 7),
(7, 8),
(1, 9),
(10, 10);

-- Dodaj przykładowe dane do tabeli tranzakcja
INSERT INTO `tranzakcja` (`kwota`, `data`, `rodzajtranzakcji`, `czyfinalizacja`, `id_pracownik`, `id_dziennyutarg`) VALUES
(100.00, '2024-11-01 09:00:00', 'Zakup', 1, 1, 1),
(150.00, '2024-11-01 10:00:00', 'Zakup', 1, 2, 1),
(200.00, '2024-11-01 11:00:00', 'Zakup', 1, 3, 1),
(50.00, '2024-11-01 12:00:00', 'Zwrot', 0, 4, 1),
(120.00, '2024-11-01 13:00:00', 'Zakup', 1, 5, 1),
(80.00, '2024-11-01 14:00:00', 'Zakup', 1, 6, 1),
(60.00, '2024-11-01 15:00:00', 'Zakup', 1, 7, 1),
(90.00, '2024-11-01 16:00:00', 'Zakup', 1, 8, 1),
(170.00, '2024-11-01 17:00:00', 'Zakup', 1, 9, 1),
(200.00, '2024-11-01 18:00:00', 'Zakup', 1, 10, 1);

-- Dodaj przykładowe dane do tabeli wielosztuki
INSERT INTO `wielosztuki` (`ilosc`, `cenaznizkaBrutto`, `cenaznizkaNetto`, `id_ceny`) VALUES
(2, 19.99, 16.26, 1),
(3, 5.00, 4.07, 2),
(1, 30.00, 24.39, 3),
(4, 22.50, 18.29, 4),
(2, 8.50, 6.91, 5),
(5, 15.00, 12.20, 6),
(2, 14.00, 11.38, 7),
(3, 27.00, 21.95, 8),
(4, 12.50, 10.16, 9),
(1, 35.00, 28.46, 10);
