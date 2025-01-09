CREATE VIEW widok_historia_logowania AS
SELECT 
    lh.id_logowania,
    lh.data AS data_logowania,
    lh.operacja,
    p.imie AS imie_pracownika,
    p.nazwisko AS nazwisko_pracownika
FROM 
    login_historia lh
LEFT JOIN 
    pracownik p ON lh.id_pracownik = p.id_pracownik;
