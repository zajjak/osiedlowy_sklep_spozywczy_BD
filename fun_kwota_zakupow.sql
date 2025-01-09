CREATE DEFINER=`root`@`localhost` FUNCTION `kwota_zakupow`(transakcja_id INT) RETURNS float
    DETERMINISTIC
BEGIN
    DECLARE suma FLOAT;

    SELECT SUM(dane_produktow.cena_brutto * 
               IF(ceny.czy_na_sztuki = 1, 1, wielo_sztuki.ilosc)) 
    INTO suma
    FROM koszyk
    JOIN dane_produktow 
      ON koszyk.id_dane_produktow = dane_produktow.id_dane_produktow
    JOIN ceny 
      ON dane_produktow.id_ceny = ceny.id_ceny
    LEFT JOIN wielo_sztuki 
      ON ceny.id_ceny = wielo_sztuki.id_ceny
    WHERE koszyk.id_tranzakcja = transakcja_id;

    IF suma IS NULL THEN
        SET suma = 0;
    END IF;

    RETURN suma;
END