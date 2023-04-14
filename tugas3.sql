MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

-- SOAL 3.1

-- 1.	Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_beli * stok > 20000000;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)


-- 2.	Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko]> SELECT SUM(stok - min_stok) as selisih from produk;
+---------+
| selisih |
+---------+
|      10 |
+---------+
1 row in set (0.001 sec)


-- 3.	Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko]> SELECT sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          32 |
+-------------+
1 row in set (0.001 sec)


-- 4.	Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
3 rows in set (0.001 sec)


-- 5.	Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
1 row in set (0.001 sec)


-- 6.	Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
2 rows in set (0.001 sec)


-- 7.	Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang dikurang tahun kelahiran)
MariaDB [dbtoko]> SELECT nama_pelanggan, tmp_lahir, tgl_lahir, (YEAR(CURDATE())-YEAR(tgl_lahir)) AS umur FROM pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Pandan Wangi   | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-08 |   26 |
| Pradana        | Jakarta    | 2001-08-01 |   22 |
| Gayatri Putri  | Jakarta    | 2002-09-01 |   21 |
+----------------+------------+------------+------+
6 rows in set (0.031 sec)



-- SOAL 3.2

-- 1.	Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko]> SELECT SUM(YEAR(tgl_lahir)=1998) AS jml_pelanggan_1998 FROM pelanggan;
+--------------------+
| jml_pelanggan_1998 |
+--------------------+
|                  1 |
+--------------------+
1 row in set (0.001 sec)


-- 2.	Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko]> SELECT SUM(jk='p' AND tmp_lahir='jakarta') AS pelanggan_P_jakarta FROM pelanggan;
+---------------------+
| pelanggan_P_jakarta |
+---------------------+
|                   1 |
+---------------------+
1 row in set (0.050 sec)


-- 3.	Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko]> SELECT SUM((stok) AND harga_jual < 10000) AS produk_10rb FROM produk;
+-------------+
| produk_10rb |
+-------------+
|           2 |
+-------------+
1 row in set (0.035 sec)


-- 4.	Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko]> SELECT SUM(kode LIKE 'K%') AS produk_K FROM produk;
+----------+
| produk_K |
+----------+
|        1 |
+----------+
1 row in set (0.054 sec)


-- 5.	Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko]> SELECT AVG(harga_jual) AS rata2_produk1JT FROM produk WHERE harga_jual > 1000000;
+-----------------+
| rata2_produk1JT |
+-----------------+
|         3500000 |
+-----------------+
1 row in set (0.034 sec)


-- 6.	Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko]> SELECT MAX(stok) AS jml_stok_terbanyak FROM produk;
+--------------------+
| jml_stok_terbanyak |
+--------------------+
|                 10 |
+--------------------+
1 row in set (0.019 sec)


-- 7.	Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko]> SELECT SUM(stok < min_stok) AS produk_kurang_stok FROM produk;
+--------------------+
| produk_kurang_stok |
+--------------------+
|                  1 |
+--------------------+
1 row in set (0.000 sec)


-- 8.	Berapa total asset dari keseluruhan produk
MariaDB [dbtoko]> SELECT SUM(harga_beli * stok) AS total_aset_produk FROM produk;
+-------------------+
| total_aset_produk |
+-------------------+
|          73018000 |
+-------------------+
1 row in set (0.026 sec)



-- SOAL 3.3

-- 1.	Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau 
-- kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.
MariaDB [dbtoko]> SELECT id, nama, stok,
    -> CASE
    -> WHEN stok < min_stok THEN 'Segera Belanja'
    -> ELSE 'Stok Aman'
    -> END AS keterangan_stok
    -> FROM produk;
+----+------------+------+-----------------+
| id | nama       | stok | keterangan_stok |
+----+------------+------+-----------------+
|  1 | TV         |    3 | Stok Aman       |
|  2 | TV 21 Inch |   10 | Stok Aman       |
|  3 | Kulkas     |   10 | Stok Aman       |
|  4 | Meja Makan |    4 | Stok Aman       |
|  5 | Taro       |    3 | Stok Aman       |
|  6 | Teh Kotak  |    2 | Segera Belanja  |
+----+------------+------+-----------------+
6 rows in set (0.009 sec)


-- 2.	Tampilkan data pelanggan: id, nama, umur dan 
-- kategori umur : jika umur < 17 → ‘muda’ , 17-55 → ‘Dewasa’, selainnya ‘Tua’
MariaDB [dbtoko]> SELECT id, nama_pelanggan, (YEAR(CURDATE())-YEAR(tgl_lahir)) AS umur,
    -> CASE
    -> WHEN YEAR(CURDATE())-YEAR(tgl_lahir) < 17 THEN 'muda'
    -> WHEN YEAR(CURDATE())-YEAR(tgl_lahir) >= 17
    -> AND YEAR(CURDATE())-YEAR(tgl_lahir) <= 55 THEN 'dewasa'
    -> ELSE 'tua'
    -> END AS kategori_umur
    -> FROM pelanggan;
+----+----------------+------+---------------+
| id | nama_pelanggan | umur | kategori_umur |
+----+----------------+------+---------------+
|  1 | Agung          |   26 | dewasa        |
|  2 | Pandan Wangi   |   25 | dewasa        |
|  3 | Sekar          |   22 | dewasa        |
|  4 | Suandi         |   26 | dewasa        |
|  5 | Pradana        |   22 | dewasa        |
|  6 | Gayatri Putri  |   21 | dewasa        |
+----+----------------+------+---------------+
6 rows in set (0.043 sec)


-- 3.	Tampilkan data produk: id, kode, nama, dan 
-- bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → ‘Rice Cooker’ selain dari diatas ‘Tidak Ada’
MariaDB [dbtoko]> SELECT id, kode, nama,
    -> CASE
    -> WHEN kode='TV01' THEN 'DVD Player'
    -> WHEN kode='K001' THEN 'Rice Cooker'
    -> ELSE 'Tidak Ada'
    -> END AS bonus
    -> FROM produk;
+----+------+------------+-------------+
| id | kode | nama       | bonus       |
+----+------+------------+-------------+
|  1 | TV01 | TV         | DVD Player  |
|  2 | TV02 | TV 21 Inch | Tidak Ada   |
|  3 | K001 | Kulkas     | Rice Cooker |
|  4 | M001 | Meja Makan | Tidak Ada   |
|  5 | T001 | Taro       | Tidak Ada   |
|  6 | TK01 | Teh Kotak  | Tidak Ada   |
+----+------+------------+-------------+
6 rows in set (0.039 sec)



-- SOAL 3.4

-- 1.	Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko]> SELECT tmp_lahir, COUNT(*) as jml_pelanggan FROM pelanggan GROUP BY tmp_lahir;
+------------+---------------+
| tmp_lahir  | jml_pelanggan |
+------------+---------------+
| Bandung    |             1 |
| Jakarta    |             3 |
| Kediri     |             1 |
| Yogyakarta |             1 |
+------------+---------------+
4 rows in set (0.001 sec)


-- 2.	Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko]> SELECT jenis_produk_id, COUNT(*) AS jumlah_produk FROM produk GROUP BY jenis_produk_id;
+-----------------+---------------+
| jenis_produk_id | jumlah_produk |
+-----------------+---------------+
|               1 |             3 |
|               2 |             1 |
|               3 |             1 |
|               4 |             1 |
+-----------------+---------------+
4 rows in set (0.001 sec)


-- 3.	Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko]> SELECT AVG(YEAR(CURDATE()) - YEAR(tgl_lahir)) AS rata2_usia FROM pelanggan;
+------------+
| rata2_usia |
+------------+
|    23.6667 |
+------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> SELECT *, YEAR(CURDATE()) - YEAR(tgl_lahir) AS umur FROM pelanggan  WHERE (YEAR(CURDATE()) - YEAR(tgl_lahir)) < (SELECT AVG(YEAR(CURDATE()) - YEAR(tgl_lahir)) FROM pelanggan);
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat | umur |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |   22 |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | NULL   |   22 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |   21 |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+------+
3 rows in set (0.001 sec)


-- 4.	Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko]> SELECT AVG(harga_beli) AS rata2_harga_produk FROM produk;
+--------------------+
| rata2_harga_produk |
+--------------------+
| 1667833.3333333333 |
+--------------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_jual > (SELECT AVG(harga_jual) FROM produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)


-- 5.	Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko]> SELECT * FROM pelanggan AS p INNER JOIN kartu AS k ON p.kartu_id = k.id WHERE k.iuran > 90000;
Empty set (0.032 sec)


-- 6.	Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara keseluruhan
MariaDB [dbtoko]> SELECT AVG(harga_beli) AS rata2_harga_produk, COUNT(*) AS jumlah_produk FROM produk WHERE harga_beli < (SELECT AVG(harga_beli) FROM produk);
+--------------------+---------------+
| rata2_harga_produk | jumlah_produk |
+--------------------+---------------+
|  335666.6666666667 |             3 |
+--------------------+---------------+
1 row in set (0.018 sec)


-- 7.	Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko]> SELECT * FROM pelanggan AS p INNER JOIN kartu AS k ON p.kartu_id = k.id WHERE k.diskon > 0.03;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+----+-------+--------+--------+-------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat | id | kode  | nama   | diskon | iuran |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+----+-------+--------+--------+-------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |  1 | 10111 | Gold   |  20000 |  2000 |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 | NULL   |  2 | 10112 | Silver |  15000 |  1500 |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |  1 | 10111 | Gold   |  20000 |  2000 |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |  1 | 10111 | Gold   |  20000 |  2000 |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |  2 | 10112 | Silver |  15000 |  1500 |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |  1 | 10111 | Gold   |  20000 |  2000 |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+----+-------+--------+--------+-------+
6 rows in set (0.043 sec)
