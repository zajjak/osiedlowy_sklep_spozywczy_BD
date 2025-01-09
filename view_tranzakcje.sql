CREATE VIEW widok_przejrzyste_transakcje AS
SELECT 
    t.id_transakcji,
    t.kwota,
    t.data AS data_transakcji,
    CASE t.czy_finalizacja
        WHEN 1 THEN 'Tak'
        ELSE 'Nie'
    END AS czy_finalizacja,
    rt.nazwa AS rodzaj_transakcji,
    p.imie AS imie_pracownika,
    p.nazwisko AS nazwisko_pracownika
FROM 
    transakcja t
LEFT JOIN 
    rodzaj_tranzakcji rt ON t.id_rodzaj_transakcji = rt.id_rodzaj_tranzakcji
LEFT JOIN 
    pracownik p ON t.id_pracownik = p.id_pracownik;
