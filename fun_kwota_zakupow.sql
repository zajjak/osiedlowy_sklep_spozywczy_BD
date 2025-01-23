DELIMITER //

CREATE FUNCTION kwota_transakcji(transakcja_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE kwota FLOAT DEFAULT 0;

    -- Obliczanie sumy kwoty dla wszystkich przedmiotów w koszyku powiązanych z transakcją
    SELECT SUM(przedmiot_w_koszyku.ilosc * ceny.cena_brutto) INTO kwota
    FROM koszyk k
    JOIN przedmiot_w_koszyku pw ON k.id_koszyk = pw.id_przedmiot_w_koszyku
    JOIN stan_produktow sp ON pw.id_stan_produktow = sp.id_stan_produktow
    JOIN dane_produktow dp ON sp.id_dane_produktow = dp.id_dane_produktow
    JOIN ceny c ON dp.id_ceny = c.id_ceny
    WHERE k.id_transakcja = transakcja_id;

    RETURN kwota;
END //

DELIMITER ;
