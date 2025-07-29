-- Kitapların toplam sayfa sayısını döndüren fonksiyon

CREATE FUNCTION fn_KitapSayfaSayisi(@ISBN VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @SayfaSayisi INT;
    SELECT @SayfaSayisi = S_sayisi
    FROM Kitaplar
    WHERE ISBN = @ISBN;
    RETURN @SayfaSayisi;
END;

SELECT dbo.fn_KitapSayfaSayisi('9780060850524') AS SayfaSayisi;

-- Bir üyenin aldığı toplam kitap sayısını döndüren fonksiyon

CREATE FUNCTION fn_UyeToplamEmanetSayisi(@Uye_no INT)
RETURNS INT
AS
BEGIN
    DECLARE @Toplam INT;
    SELECT @Toplam = COUNT(*)
    FROM Emanet
    WHERE Uye_no = @Uye_no;
    RETURN @Toplam;
END;

SELECT dbo.fn_UyeToplamEmanetSayisi(3) AS ToplamEmanet;

-- Kitap ismi ile kaç adet bulunduğunu döndüren fonksiyon

CREATE FUNCTION fn_KitapToplamMiktar(@KitapAdi VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @ToplamMiktar INT;
    SELECT @ToplamMiktar = SUM(kk.Miktar)
    FROM Kitaplar k
    JOIN Kitap_Kutuphane kk ON k.ISBN = kk.ISBN
    WHERE k.Kitap_adi = @KitapAdi;
    RETURN ISNULL(@ToplamMiktar, 0);
END;

SELECT dbo.fn_KitapToplamMiktar('Bülbülü Öldürmek') AS ToplamKitapMiktari;



