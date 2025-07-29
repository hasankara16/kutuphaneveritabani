-- 1. ADRESLER
CREATE TABLE Adresler (
    Adres_no INT IDENTITY(1,1) PRIMARY KEY,
    Cadde VARCHAR(100) NOT NULL,
    Mahalle VARCHAR(100) NOT NULL,
    Bina_no VARCHAR(10),
    Sehir VARCHAR(50) NOT NULL,
    Posta_kodu INT
);


-- 2. UYELER
CREATE TABLE Uyeler (
    Uye_no INT IDENTITY(1,1) PRIMARY KEY,
    Uye_adi VARCHAR(50) NOT NULL,
    Uye_soyadi VARCHAR(50) NOT NULL,
    Cinsiyet VARCHAR(1) CHECK (Cinsiyet IN ('E', 'K')),
    Telefon VARCHAR(20) NOT NULL,
    E_posta VARCHAR(100) NOT NULL UNIQUE
);


-- 3. KUTUPHANE
CREATE TABLE Kutuphane (
    Kutuphane_no INT IDENTITY(1,1) PRIMARY KEY,
    Kutuphane_ismi VARCHAR(100) NOT NULL,
    Adres_no INT FOREIGN KEY REFERENCES Adresler(Adres_no)
);


-- 4. KITAPLAR 
CREATE TABLE Kitaplar (
    ISBN VARCHAR(20) PRIMARY KEY,
    Kitap_adi VARCHAR(100) NOT NULL,
    Yayin_tarihi DATE NOT NULL,
    S_sayisi INT NOT NULL
);

-- 5. EMANET
CREATE TABLE Emanet (
    Emanet_no INT IDENTITY(1,1) PRIMARY KEY,
    ISBN VARCHAR(20) NOT NULL,
    Uye_no INT NOT NULL,
    Kutuphane_no INT NOT NULL,
    Emanet_tarihi DATETIME NOT NULL,
    Teslim_tarihi DATETIME NULL,
    FOREIGN KEY (ISBN) REFERENCES Kitaplar(ISBN),
    FOREIGN KEY (Uye_no) REFERENCES Uyeler(Uye_no),
    FOREIGN KEY (Kutuphane_no) REFERENCES Kutuphane(Kutuphane_no)
);

-- 6. KITAP_KUTUPHANE (ARA TABLO)
CREATE TABLE Kitap_Kutuphane (
    Kutuphane_no INT,
    ISBN VARCHAR(20),
    Miktar INT NOT NULL,
    PRIMARY KEY (Kutuphane_no, ISBN),
    FOREIGN KEY (Kutuphane_no) REFERENCES Kutuphane(Kutuphane_no),
    FOREIGN KEY (ISBN) REFERENCES Kitaplar(ISBN)
);

-- 7. KATEGORILER
CREATE TABLE Kategoriler (
    Kategori_no INT IDENTITY(1,1) PRIMARY KEY,
    Kategori_adi VARCHAR(100) NOT NULL
);

-- 8. KITAP_KATEGORI (ARA TABLO)
CREATE TABLE Kitap_Kategori (
    ISBN VARCHAR(20),
    Kategori_no INT,
    PRIMARY KEY (ISBN, Kategori_no),
    FOREIGN KEY (ISBN) REFERENCES Kitaplar(ISBN),
    FOREIGN KEY (Kategori_no) REFERENCES Kategoriler(Kategori_no)
);

-- 9. YAZARLAR
CREATE TABLE Yazarlar (
    Yazar_no INT IDENTITY(1,1) PRIMARY KEY,
    Yazar_adi VARCHAR(50) NOT NULL,
    Yazar_soyadi VARCHAR(50) NOT NULL
);

-- 10. KITAP_YAZAR (ARA TABLO)
CREATE TABLE Kitap_Yazar (
    ISBN VARCHAR(20),
    Yazar_no INT,
    PRIMARY KEY (ISBN, Yazar_no),
    FOREIGN KEY (ISBN) REFERENCES Kitaplar(ISBN),
    FOREIGN KEY (Yazar_no) REFERENCES Yazarlar(Yazar_no)
);
