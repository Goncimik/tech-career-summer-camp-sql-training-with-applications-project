--            Yaz Kampý Uygulamalarla SQL Eðitimi           --
--                      Hafize Gonca Cömert                 --

-- SQL Giriþ – Uygulamalý Proje Ödevi (Kütüphane Konsepti)  --
-- 1) Tablo oluþturma
CREATE TABLE Book_s (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255) NOT NULL,
    author NVARCHAR(255) NOT NULL,
    genre NVARCHAR(50),
    price DECIMAL(10,2) CHECK(price > 0),
    stock INT CHECK(stock >= 0),
    published_year INT CHECK(published_year BETWEEN 1800 AND 2025),
    added_at DATE
);

-- 2) Veri Seti
INSERT INTO Book_s (title, author, genre, price, stock, published_year, added_at)
VALUES
('Kayýp Zamanýn Ýzinde', 'M. Proust', 'roman', 129.90, 25, 1913, '2025-08-20'),
('Simyacý', 'P. Coelho', 'roman', 89.50, 40, 1988, '2025-08-21'),
('Sapiens', 'Y. N. Harari', 'tarih', 159.00, 18, 2011, '2025-08-25'),
('Ýnce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
('Körlük', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
('Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
('Hayvan Çiftliði', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
('1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
('Nutuk', 'M. K. Atatürk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
('Küçük Prens', 'A. de Saint-Exupéry', 'çocuk', 69.90, 80, 1943, '2025-08-26'),
('Baþlangýç', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
('Atomik Alýþkanlýklar', 'J. Clear', 'kiþisel geliþim', 129.00, 28, 2018, '2025-09-03'),
('Zamanýn Kýsa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
('Þeker Portakalý', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
('Bir Ýdam Mahkûmunun Son Günü', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');


--3) Görevler – Yalnýzca Filtreleme (SELECT)
--Sorgu1
--Tüm kitaplarýn title, author, price alanlarýný fiyatý artan þekilde sýralayarak listeleyin.
select title, price,author from Book_s ORDER BY price asc

--Sorgu2
--Türü 'roman' olan kitaplarý A?Z title sýrasýyla gösterin.
SELECT * FROM Book_s WHERE genre = 'roman' ORDER BY title ASC;

--Sorgu3
--Fiyatý 80 ile 120 (dahil) arasýndaki kitaplarý listeleyin (BETWEEN).
SELECT * FROM Book_s WHERE price BETWEEN 80 AND 120;

--Sorgu4
--Stok adedi 20’den az olan kitaplarý bulun (title, stock_qty).
SELECT title, stock  FROM Book_s WHERE stock < 20;

--Sorgu5
--title içinde 'zaman' geçen kitaplarý LIKE ile filtreleyin (büyük/küçük harf durumunu not edin).
SELECT * FROM Book_s WHERE title LIKE '%zaman%';

--Sorgu6
--genre deðeri 'roman' veya 'bilim' olanlarý IN ile listeleyin.
SELECT * FROM Book_s WHERE genre IN ('roman', 'bilim');

--Sorgu7
--published_year deðeri 2000 ve sonrasý olan kitaplarý, en yeni yýldan eskiye doðru sýralayýn.
SELECT * FROM Book_s WHERE published_year >= 2000 ORDER BY published_year DESC;

--Sorgu8
--Son 10 gün içinde eklenen kitaplarý bulun (added_at tarihine göre).
SELECT * FROM Book_s WHERE added_at >= DATEADD(DAY, -10, GETDATE());

--Sorgu9
--En pahalý 5 kitabý price azalan sýrada listeleyin (LIMIT 5).
SELECT TOP 5 * FROM Book_s ORDER BY price DESC;

--Sorgu10
--Stok adedi 30 ile 60 arasýnda olan kitaplarý price artan þekilde sýralayýn.
SELECT * FROM Book_s WHERE stock BETWEEN 30 AND 60 ORDER BY price ASC;



PRINT 'mutlu kodlamalar';
PRINT RIGHT(SPACE(15) + 'gogo', 15);



 




