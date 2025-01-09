CREATE DEFINER=`root`@`localhost` FUNCTION `liczba_sprzedazy`() RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE suma_sprzedanych_przedmiotow INT;

    -- Obliczenie łącznej liczby sprzedanych przedmiotów
    SELECT COUNT(*) 
    INTO suma_sprzedanych_przedmiotow
    FROM koszyk
    JOIN ceny 
      ON koszyk.id_ceny = ceny.id_ceny;

    -- Jeśli nie ma sprzedanych przedmiotów, ustaw wartość na 0
    IF suma_sprzedanych_przedmiotow IS NULL THEN
        SET suma_sprzedanych_przedmiotow = 0;
    END IF;

    RETURN suma_sprzedanych_przedmiotow;
END