-- Kitapların yazarlarıyla birlikte listelendiği bir view

CREATE VIEW vw_KitapYazar AS
SELECT k.ISBN, k.Kitap_adi, y.Yazar_adi + ' ' + y.Yazar_soyadi AS Yazar
FROM Kitaplar k
JOIN Kitap_Yazar ky ON k.ISBN = ky.ISBN
JOIN Yazarlar y ON ky.Yazar_no = y.Yazar_no;

SELECT * FROM vw_KitapYazar;

-- Üyelerin aldığı kitapları gösteren bir view

CREATE VIEW vw_UyeEmanetKitaplari AS
SELECT u.Uye_adi + ' ' + u.Uye_soyadi AS Uye,k.Kitap_adi,e.Emanet_tarihi,e.Teslim_tarihi
FROM Emanet e
JOIN Uyeler u ON e.Uye_no = u.Uye_no
JOIN Kitaplar k ON e.ISBN = k.ISBN;

SELECT * FROM vw_UyeEmanetKitaplari;

-- Kütüphanelerdeki kitap stoğunu gösteren view

CREATE VIEW vw_KutuphaneStok AS
SELECT ku.Kutuphane_ismi,k.Kitap_adi,kk.Miktar
FROM Kitap_Kutuphane kk
JOIN Kutuphane ku ON kk.Kutuphane_no = ku.Kutuphane_no
JOIN Kitaplar k ON kk.ISBN = k.ISBN;

SELECT * FROM vw_KutuphaneStok;

-- Hangi kitap hangi kategoriye ait?

CREATE VIEW vw_KitapKategori AS
SELECT k.Kitap_adi,kat.Kategori_adi
FROM Kitap_Kategori kk
JOIN Kitaplar k ON kk.ISBN = k.ISBN
JOIN Kategoriler kat ON kk.Kategori_no = kat.Kategori_no;

SELECT * FROM vw_KitapKategori;
