-- Bir emanet kaydı eklendiğinde, ilgili kütüphanedeki kitabın stok miktarını 1 azaltmak için kullanılır.
CREATE TRIGGER trg_Emanet_stokazalt
ON Emanet
AFTER INSERT
AS
BEGIN
    UPDATE Kitap_Kutuphane
    SET Miktar = Miktar - 1
    FROM Kitap_Kutuphane kk
    INNER JOIN inserted i ON kk.Kutuphane_no = i.Kutuphane_no AND kk.ISBN = i.ISBN
    WHERE Miktar > 0;
END;

SELECT * FROM Kitap_Kutuphane WHERE ISBN = '9780141439600' AND Kutuphane_no = 1;

INSERT INTO Emanet (ISBN, Uye_no, Kutuphane_no, Emanet_tarihi, Teslim_tarihi)
VALUES ('9780141439600', 1, 1, GETDATE(), NULL);


-- Bir kitabın teslim edildiği durumda, ilgili kütüphanedeki kitabın stok miktarını 1 artırmak için kullanılır.
CREATE TRIGGER trg_Emanet_stokartır
ON Emanet
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Teslim_tarihi)
    BEGIN
        UPDATE Kitap_Kutuphane
        SET Miktar = Miktar + 1
        FROM Kitap_Kutuphane kk
        INNER JOIN inserted i ON kk.Kutuphane_no = i.Kutuphane_no AND kk.ISBN = i.ISBN
        INNER JOIN deleted d ON d.Emanet_no = i.Emanet_no
        WHERE d.Teslim_tarihi IS NULL AND i.Teslim_tarihi IS NOT NULL;
    END
END;

SELECT * FROM Kitap_Kutuphane WHERE ISBN = '9780141439600' AND Kutuphane_no = 1;

UPDATE Emanet SET Teslim_tarihi = GETDATE() WHERE Emanet_no = 11;

-- Kitap geri getirildiğinde, teslim tarihi null olarak kalıyorsa bunu otomatik olarak şu anki tarih-saat ile doldurur.
CREATE TRIGGER trg_TeslimTarihiOtomatik
ON Emanet
AFTER UPDATE
AS
BEGIN
    UPDATE Emanet
    SET Teslim_tarihi = GETDATE()
    FROM Emanet e
    JOIN inserted i ON e.Emanet_no = i.Emanet_no
    WHERE i.Teslim_tarihi IS NULL;
END;

UPDATE Emanet SET Kutuphane_no = 1 
WHERE Emanet_no = 4 AND Teslim_tarihi IS NULL;

SELECT * FROM Emanet WHERE Emanet_no = 4;
