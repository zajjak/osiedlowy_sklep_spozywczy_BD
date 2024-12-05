-- Funkcja sprawdzająca dostępność produktu w magazynie
DELIMITER //

CREATE FUNCTION sprawdz_dostepnosc_produktu(id_produktu INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE ilosc_sztuk INT;
    SELECT SUM(ilosc) INTO ilosc_sztuk
    FROM stanproduktów
    WHERE id_daneproduktow = id_produktu;
    RETURN IFNULL(ilosc_sztuk, 0);
END //

DELIMITER ;

-- Funkcja obliczająca wynagrodzenie netto dla id pracownika
DELIMITER //

CREATE FUNCTION pobierz_wynagrodzenie_netto(id_pracownik INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE wynagrodzenie INT;
    SELECT w.wynagrodzenieNetto INTO wynagrodzenie
    FROM wynagrodzenie w
    JOIN stanowisko s ON w.id_wynagrodzenie = s.id_wynagrodzenia
    WHERE s.id_pracownik = id_pracownik;
    RETURN IFNULL(wynagrodzenie, 0);
END //

DELIMITER ;
