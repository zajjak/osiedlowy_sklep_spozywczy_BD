CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `widok_transakcji_i_koszykow` AS
    SELECT 
        `t`.`id_transakcji` AS `id_transakcji`,
        `t`.`kwota` AS `kwota`,
        `t`.`data` AS `data`,
        `t`.`czy_finalizacja` AS `czy_finalizacja`,
        `rt`.`nazwa` AS `rodzaj_transakcji`,
        `p`.`imie` AS `imie_pracownika`,
        `p`.`nazwisko` AS `nazwisko_pracownika`,
        `k`.`id_koszyk` AS `id_koszyk`,
        `k`.`ilosc` AS `ilosc_produktow`
    FROM
        (((`transakcja` `t`
        JOIN `rodzaj_tranzakcji` `rt` ON ((`t`.`id_rodzaj_transakcji` = `rt`.`id_rodzaj_tranzakcji`)))
        JOIN `pracownik` `p` ON ((`t`.`id_pracownik` = `p`.`id_pracownik`)))
        JOIN `koszyk` `k` ON ((`t`.`id_koszyk` = `k`.`id_koszyk`)))