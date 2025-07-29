INSERT INTO Kitaplar (ISBN, Kitap_adi, Yayin_tarihi, S_sayisi) VALUES
('9780141439600', 'Aşk ve Gurur', '1813-01-28', 432),
('9780451524935', '1984', '1949-06-08', 328),
('9780061120084', 'Bülbülü Öldürmek', '1960-07-11', 336),
('9780743273565', 'Muhteşem Gatsby', '1925-04-10', 180),
('9780316769488', 'Gönülçelen', '1951-07-16', 277),
('9780547928227', 'Hobbit', '1937-09-21', 310),
('9780307277671', 'Yol', '2006-09-26', 287),
('9780679783268', 'Suç ve Ceza', '1866-01-01', 671),
('9780140449136', 'Karamazov Kardeşler', '1880-01-01', 796),
('9780060850524', 'Cesur Yeni Dünya', '1932-01-01', 288),
('9780385472579', 'Her Şey Parçalanıyor', '1958-06-17', 209),
('9780140449266', 'Anna Karenina', '1878-01-01', 864),
('9780140449273', 'Madam Bovary', '1857-04-01', 329),
('9780141439518', 'Jane Eyre', '1847-10-16', 500),
('9780140449265', 'Savaş ve Barış', '1869-01-01', 1225);

INSERT INTO Yazarlar (Yazar_adi, Yazar_soyadi) VALUES
('Jane', 'Austen'),             
('George', 'Orwell'),          
('Harper', 'Lee'),              
('F. Scott', 'Fitzgerald'),     
('J.D.', 'Salinger'),         
('J.R.R.', 'Tolkien'),          
('Cormac', 'McCarthy'),        
('Fyodor', 'Dostoyevski'),      
('Aldous', 'Huxley'),          
('Chinua', 'Achebe'), 
('Leo', 'Tolstoy'),           
('Gustave', 'Flaubert'),     
('Charlotte', 'Brontë');

INSERT INTO Adresler (Cadde, Mahalle, Bina_no, Sehir, Posta_kodu) VALUES
('Atatürk Caddesi', 'Çankaya', '12A', 'Ankara', 06520),
('İstiklal Caddesi', 'Beyoğlu', '34', 'İstanbul', 34430),
('Cumhuriyet Bulvarı', 'Konak', '5', 'İzmir', 35210),
('Gazi Mustafa Kemal Cd.', 'Karşıyaka', '27', 'İzmir', 35560),
('Fatih Sultan Mehmet Cd.', 'Üsküdar', '3', 'İstanbul', 34662),
('Mevlana Cd.', 'Selçuklu', '22B', 'Konya', 42060),
('Atatürk Bulvarı', 'Muratpaşa', '10', 'Antalya', 07050),
('Bahçelievler Mah.', 'Yenimahalle', '15', 'Ankara', 06170),
('Kazım Karabekir Cd.', 'Çankaya', '9', 'Ankara', 06610),
('Dumlupınar Blv.', 'Osmangazi', '4', 'Bursa', 16090);

INSERT INTO Kutuphane (Kutuphane_ismi, Adres_no) VALUES
('Merkez Kütüphanesi', 1),
('Şehir Kütüphanesi', 2),
('Üniversite Kütüphanesi', 3),
('Çocuk Kütüphanesi', 4),
('Teknoloji Kütüphanesi', 5);

INSERT INTO Uyeler (Uye_adi, Uye_soyadi, Cinsiyet, Telefon, E_posta) VALUES
('Hasan', 'Kara', 'E', '05551234567', 'hasan.kara@example.com'),
('Ayşe', 'Demir', 'K', '05557654321', 'ayse.demir@example.com'),
('Mehmet', 'Kaya', 'E', '05559876543', 'mehmet.kaya@example.com'),
('Elif', 'Şahin', 'K', '05553456789', 'elif.sahin@example.com'),
('Can', 'Arslan', 'E', '05552345678', 'can.arslan@example.com'),
('Zeynep', 'Çelik', 'K', '05551239876', 'zeynep.celik@example.com'),
('Murat', 'Koç', 'E', '05558765432', 'murat.koc@example.com'),
('Seda', 'Polat', 'K', '05557659874', 'seda.polat@example.com'),
('Emre', 'Aslan', 'E', '05552348765', 'emre.aslan@example.com'),
('Fatma', 'Yıldız', 'K', '05551234598', 'fatma.yildiz@example.com');

INSERT INTO Kategoriler (Kategori_adi) VALUES
('Roman'),
('Bilim Kurgu'),
('Tarih'),
('Çocuk Kitapları'),
('Fantastik'),
('Kişisel Gelişim'),
('Polisiye'),
('Macera'),
('Felsefe'),
('Sanat');

INSERT INTO Kitap_Kutuphane (Kutuphane_no, ISBN, Miktar) VALUES
(1, '9780141439600', 5),
(1, '9780451524935', 3),
(2, '9780061120084', 7),
(2, '9780743273565', 2),
(3, '9780316769488', 4),
(3, '9780547928227', 6),
(4, '9780307277671', 1),
(4, '9780679783268', 8);

INSERT INTO Kitap_Kutuphane (Kutuphane_no, ISBN, Miktar) VALUES
(4, '9780547928227', 7);

INSERT INTO Kitap_Yazar (ISBN, Yazar_no) VALUES
('9780141439600', 1),
('9780451524935', 2),
('9780061120084', 3),
('9780743273565', 4),
('9780316769488', 5),
('9780547928227', 6),
('9780307277671', 7),
('9780679783268', 8),
('9780140449136', 9),
('9780060850524', 10);

INSERT INTO Kitap_Kategori (ISBN, Kategori_no) VALUES
('9780141439600', 1),
('9780451524935', 2),
('9780061120084', 1),
('9780743273565', 1),
('9780316769488', 1),
('9780547928227', 5),
('9780307277671', 1),
('9780679783268', 1),
('9780140449136', 1),
('9780060850524', 2),
('9780385472579', 9),
('9780140449266', 1),
('9780140449273', 1),
('9780141439518', 1),
('9780140449265', 1);

INSERT INTO Emanet (ISBN, Uye_no, Kutuphane_no, Emanet_tarihi, Teslim_tarihi) VALUES
('9780141439600', 1, 1, '2025-05-01 10:00:00', '2025-05-15 14:00:00'),
('9780451524935', 2, 2, '2025-05-03 11:30:00', NULL),
('9780061120084', 3, 3, '2025-05-05 09:00:00', '2025-05-20 16:00:00'),
('9780743273565', 4, 1, '2025-05-07 14:45:00', NULL),
('9780316769488', 5, 2, '2025-05-10 13:20:00', '2025-05-22 12:00:00'),
('9780547928227', 6, 4, '2025-05-12 15:00:00', NULL),
('9780307277671', 7, 5, '2025-05-14 10:10:00', '2025-05-28 17:30:00'),
('9780679783268', 8, 3, '2025-05-16 08:30:00', NULL),
('9780140449136', 9, 4, '2025-05-18 09:45:00', NULL),
('9780060850524', 10, 5, '2025-05-20 16:00:00', '2025-06-01 11:00:00');


