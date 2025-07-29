-- Kitap ismine göre kitap ve ona ait yazarı getiren komut

CREATE PROCEDURE sp_KitapYazarlariGetir @KitapAdi NVARCHAR(255)
AS
BEGIN
    SELECT k.ISBN, k.Kitap_adi, STRING_AGG(y.Yazar_adi + ' ' + y.Yazar_soyadi, ', ') AS Yazarlar
    FROM Kitaplar k
    JOIN Kitap_Yazar ky ON k.ISBN = ky.ISBN
    JOIN Yazarlar y ON ky.Yazar_no = y.Yazar_no
    WHERE k.Kitap_adi = @KitapAdi
    GROUP BY k.ISBN, k.Kitap_adi;
END;

EXEC sp_KitapYazarlariGetir @KitapAdi = 'Cesur Yeni Dünya';

-- Bir yazarın adını girerek o yazarın yazdığı tüm kitapları listeleyen komut

CREATE PROCEDURE sp_YazarKitaplariniGetir @YazarAdiSoyadi NVARCHAR(255)
AS
BEGIN
    SELECT y.Yazar_adi + ' ' + y.Yazar_soyadi AS Yazar,STRING_AGG(k.Kitap_adi, ', ') AS Kitaplar
    FROM Yazarlar y
    JOIN Kitap_Yazar ky ON y.Yazar_no = ky.Yazar_no
    JOIN Kitaplar k ON ky.ISBN = k.ISBN
    WHERE y.Yazar_adi + ' ' + y.Yazar_soyadi = @YazarAdiSoyadi
    GROUP BY y.Yazar_adi, y.Yazar_soyadi;
END;

EXEC sp_YazarKitaplariniGetir @YazarAdiSoyadi = 'Fyodor Dostoyevski';

-- Bir kütüphane adı girerek, o kütüphanedeki mevcut kitapları listeleyen komut

CREATE PROCEDURE sp_KutuphaneKitaplariniGetir @KutuphaneIsmi NVARCHAR(100)
AS
BEGIN
    SELECT k.Kitap_adi
    FROM Kitaplar k
    INNER JOIN Kitap_Kutuphane kk ON k.ISBN = kk.ISBN
    INNER JOIN Kutuphane ku ON kk.Kutuphane_no = ku.Kutuphane_no
    WHERE ku.Kutuphane_ismi = @KutuphaneIsmi;
END;

EXEC sp_KutuphaneKitaplariniGetir @KutuphaneIsmi = 'Merkez Kütüphanesi';


