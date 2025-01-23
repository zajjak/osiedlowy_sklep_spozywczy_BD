DELIMITER //

CREATE PROCEDURE nowa_cena(
    IN id_produktu INT,
    IN nowa_cena_brutto FLOAT,
    IN nowa_cena_netto FLOAT
)
BEGIN
    -- Deklaracja zmiennej dla id_ceny
    DECLARE lokalne_id_ceny INT;
    DECLARE lokalna_cena_brutto FLOAT;
    DECLARE lokalna_cena_netto FLOAT;

    -- Pobranie id_ceny z tabeli dane_produktow
    SELECT id_ceny INTO lokalne_id_ceny
    FROM dane_produktow
    WHERE id_dane_produktow = id_produktu;

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
END //

DELIMITER ;
