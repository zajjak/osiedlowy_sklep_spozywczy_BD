CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `widok_produktow_z_cenami` AS
    SELECT 
        `dp`.`id_dane_produktow` AS `id_dane_produktow`,
        `dp`.`nazwa` AS `nazwa_produktu`,
        `dp`.`vat` AS `vat`,
        `k`.`nazwa_kategorii` AS `nazwa_kategorii`,
        `p`.`nazwa` AS `producent`,
        `c`.`cena_brutto` AS `cena_brutto`,
        `c`.`cena_netto` AS `cena_netto`
    FROM
        (((`dane_produktow` `dp`
        JOIN `kategoria` `k` ON ((`dp`.`id_kategoria` = `k`.`id_kategoria`)))
        JOIN `producent` `p` ON ((`dp`.`id_producenta` = `p`.`id_producent`)))
        JOIN `ceny` `c` ON ((`dp`.`id_ceny` = `c`.`id_ceny`)))