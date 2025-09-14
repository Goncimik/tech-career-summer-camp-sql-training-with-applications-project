--            Yaz Kamp� Uygulamalarla SQL E�itimi           --
--                      Hafize Gonca C�mert                 --

-- SQL Giri� � Uygulamal� Proje �devi (K�t�phane Konsepti)  --
-- 1) Tablo olu�turma
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
('Kay�p Zaman�n �zinde', 'M. Proust', 'roman', 129.90, 25, 1913, '2025-08-20'),
('Simyac�', 'P. Coelho', 'roman', 89.50, 40, 1988, '2025-08-21'),
('Sapiens', 'Y. N. Harari', 'tarih', 159.00, 18, 2011, '2025-08-25'),
('�nce Memed', 'Y. Kemal', 'roman', 99.90, 12, 1955, '2025-08-22'),
('K�rl�k', 'J. Saramago', 'roman', 119.00, 7, 1995, '2025-08-28'),
('Dune', 'F. Herbert', 'bilim', 149.00, 30, 1965, '2025-09-01'),
('Hayvan �iftli�i', 'G. Orwell', 'roman', 79.90, 55, 1945, '2025-08-23'),
('1984', 'G. Orwell', 'roman', 99.00, 35, 1949, '2025-08-24'),
('Nutuk', 'M. K. Atat�rk', 'tarih', 139.00, 20, 1927, '2025-08-27'),
('K���k Prens', 'A. de Saint-Exup�ry', '�ocuk', 69.90, 80, 1943, '2025-08-26'),
('Ba�lang��', 'D. Brown', 'roman', 109.00, 22, 2017, '2025-09-02'),
('Atomik Al��kanl�klar', 'J. Clear', 'ki�isel geli�im', 129.00, 28, 2018, '2025-09-03'),
('Zaman�n K�sa Tarihi', 'S. Hawking', 'bilim', 119.50, 16, 1988, '2025-08-29'),
('�eker Portakal�', 'J. M. de Vasconcelos', 'roman', 84.90, 45, 1968, '2025-08-30'),
('Bir �dam Mahk�munun Son G�n�', 'V. Hugo', 'roman', 74.90, 26, 1829, '2025-08-31');


--3) G�revler � Yaln�zca Filtreleme (SELECT)
--Sorgu1
--T�m kitaplar�n title, author, price alanlar�n� fiyat� artan �ekilde s�ralayarak listeleyin.
select title, price,author from Book_s ORDER BY price asc

--Sorgu2
--T�r� 'roman' olan kitaplar� A?Z title s�ras�yla g�sterin.
SELECT * FROM Book_s WHERE genre = 'roman' ORDER BY title ASC;

--Sorgu3
--Fiyat� 80 ile 120 (dahil) aras�ndaki kitaplar� listeleyin (BETWEEN).
SELECT * FROM Book_s WHERE price BETWEEN 80 AND 120;

--Sorgu4
--Stok adedi 20�den az olan kitaplar� bulun (title, stock_qty).
SELECT title, stock  FROM Book_s WHERE stock < 20;

--Sorgu5
--title i�inde 'zaman' ge�en kitaplar� LIKE ile filtreleyin (b�y�k/k���k harf durumunu not edin).
SELECT * FROM Book_s WHERE title LIKE '%zaman%';

--Sorgu6
--genre de�eri 'roman' veya 'bilim' olanlar� IN ile listeleyin.
SELECT * FROM Book_s WHERE genre IN ('roman', 'bilim');

--Sorgu7
--published_year de�eri 2000 ve sonras� olan kitaplar�, en yeni y�ldan eskiye do�ru s�ralay�n.
SELECT * FROM Book_s WHERE published_year >= 2000 ORDER BY published_year DESC;

--Sorgu8
--Son 10 g�n i�inde eklenen kitaplar� bulun (added_at tarihine g�re).
SELECT * FROM Book_s WHERE added_at >= DATEADD(DAY, -10, GETDATE());

--Sorgu9
--En pahal� 5 kitab� price azalan s�rada listeleyin (LIMIT 5).
SELECT TOP 5 * FROM Book_s ORDER BY price DESC;

--Sorgu10
--Stok adedi 30 ile 60 aras�nda olan kitaplar� price artan �ekilde s�ralay�n.
SELECT * FROM Book_s WHERE stock BETWEEN 30 AND 60 ORDER BY price ASC;



PRINT 'mutlu kodlamalar';
PRINT RIGHT(SPACE(15) + 'gogo', 15);



 




