CREATE VIEW Widok_Stan_Magazynowy AS
SELECT
    dp.nazwa AS Produkt,
    sp.ilosc AS Ilosc,
    m.nazwa AS Magazyn
FROM
    stan_produktow sp
JOIN
    dane_produktow dp ON sp.id_dane_produktow = dp.id_dane_produktow
JOIN
    magazyn m ON sp.id_magazyn = m.id_magazyn;
