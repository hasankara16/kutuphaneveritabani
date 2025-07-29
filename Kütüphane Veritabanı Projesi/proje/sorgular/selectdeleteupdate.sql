-- Kitaplar tablosunun tamamını getirir.
SELECT * FROM Kitaplar;

-- Kitapların adlarıyla birlikte yazarlarının ad ve soyadını getirir.
SELECT K.Kitap_adi, Y.Yazar_adi, Y.Yazar_soyadi
FROM Kitaplar AS K
JOIN Kitap_Yazar AS KY ON K.ISBN = KY.ISBN
JOIN Yazarlar AS Y ON KY.Yazar_no = Y.Yazar_no;

-- Üyelerin adı, soyadı ve e-posta adreslerini getirir.
SELECT Uye_adi, Uye_soyadi, E_posta
FROM Uyeler;

-- Belirlenmiş tarihten sonra yayımlanmış kitapları listeler ve her birinin ismini ve yayın tarihini getirir.
SELECT Kitap_adi, Yayin_tarihi
FROM Kitaplar
WHERE Yayin_tarihi > '1950-01-01';

-- Ankara'da olan kütüphanelerin adını, cadde ve mahalle bilgisini getirir.
SELECT K.Kutuphane_ismi, A.Cadde, A.Mahalle
FROM Kutuphane AS K
JOIN Adresler AS A ON K.Adres_no = A.Adres_no
WHERE A.Sehir = 'Ankara';

-- Kategori adı roman olan kitapların adlarını ve kategorilerini getirir.
SELECT K.Kitap_adi, Kat.Kategori_adi
FROM Kitaplar AS K
JOIN Kitap_Kategori AS KK ON K.ISBN = KK.ISBN
JOIN Kategoriler AS Kat ON KK.Kategori_no = Kat.Kategori_no
WHERE Kat.Kategori_adi = 'Roman';

-- Kitaplar tablosundan kitapların adlarını ve artan şekilde sayfa sayılarını getirir.
SELECT Kitap_adi, S_sayisi
FROM Kitaplar
ORDER BY S_sayisi ASC;

-- -- Kitaplar tablosundan kitapların adlarını ve yeniden eskiye doğru yayın tarihlerini getirir.
SELECT Kitap_adi, Yayin_tarihi
FROM Kitaplar
ORDER BY Yayin_tarihi DESC;

-- Her bir kütüphanede yer alan farklı kitapların (ISBN'e göre) sayısını getirir.
SELECT K.Kutuphane_ismi, COUNT(KK.ISBN) AS ToplamKitapCesidi
FROM Kutuphane AS K
JOIN Kitap_Kutuphane AS KK ON K.Kutuphane_no = KK.Kutuphane_no
GROUP BY K.Kutuphane_ismi;

-- Her emanet işlemini, ilgili üyenin adı ve soyadı, kitabın adı, emanet ve teslim tarihiyle birlikte listeler.
SELECT U.Uye_adi, U.Uye_soyadi, K.Kitap_adi, E.Emanet_tarihi, E.Teslim_tarihi
FROM Emanet AS E
JOIN Uyeler AS U ON E.Uye_no = U.Uye_no
JOIN Kitaplar AS K ON E.ISBN = K.ISBN;

-- Her bir kütüphanedeki kitapların isimlerini ve o kitaplardan kaç adet olduğunu listeler.
SELECT Kut.Kutuphane_ismi, Kit.Kitap_adi, KK.Miktar
FROM Kitap_Kutuphane AS KK
JOIN Kutuphane AS Kut ON KK.Kutuphane_no = Kut.Kutuphane_no
JOIN Kitaplar AS Kit ON KK.ISBN = Kit.ISBN;

-- Kitap adında 'Suç' geçen kitapların sayfa sayısını ve toplam miktarını listeler.
SELECT k.ISBN, k.Kitap_adi, dbo.fn_KitapSayfaSayisi(k.ISBN) AS SayfaSayisi, dbo.fn_KitapToplamMiktar(k.Kitap_adi) AS ToplamMiktar
FROM Kitaplar k
WHERE k.Kitap_adi LIKE '%Suç%'

-- Üye numarası 10 olan üyeyi siler (Hata almamak için önce Uye_no'nun foreign key olduğu tablodaki verileri silmeliyiz.)
DELETE FROM Emanet WHERE Uye_no = 10;
DELETE FROM Uyeler WHERE Uye_no = 10;

-- 'Hasan Kara' isimli üyenin telefon numarasını günceller.
UPDATE Uyeler
SET Telefon = '05554234567'
WHERE Uye_adi = 'Hasan' AND Uye_soyadi = 'Kara';

