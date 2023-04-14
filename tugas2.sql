-- tugas worksheet 2
-- SOAL 2.1

-- 2.	Tampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_jual DESC;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

-- 3.	Tampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
MariaDB [dbtoko]>  SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan Wangi   | Yogyakarta | 1997-08-07 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
+--------+----------------+------------+------------+
6 rows in set (0.001 sec)

-- 4.	Tampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
MariaDB [dbtoko]> SELECT kode, nama, stok FROM produk WHERE stok=4;
+------+------------+------+
| kode | nama       | stok |
+------+------------+------+
| M001 | Meja Makan |    4 |
+------+------------+------+
1 row in set (0.001 sec)

-- 5.	Tampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir='jakarta';
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
|  4 | 011104 | Suandi         | L    | Jakarta   | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta   | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
3 rows in set (0.001 sec)

-- 6.	Tampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda usianya
MariaDB [dbtoko]>  SELECT kode, nama_pelanggan, tmp_lahir, tgl_lahir FROM pelanggan ORDER BY tgl_lahir DESC;
+--------+----------------+------------+------------+
| kode   | nama_pelanggan | tmp_lahir  | tgl_lahir  |
+--------+----------------+------------+------------+
| 011106 | Gayatri Putri  | Jakarta    | 2002-09-01 |
| 011103 | Sekar          | Kediri     | 2001-09-08 |
| 011105 | Pradana        | Jakarta    | 2001-08-01 |
| 011104 | Suandi         | Jakarta    | 1997-09-08 |
| 011101 | Agung          | Bandung    | 1997-09-06 |
| 011102 | Pandan Wangi   | Yogyakarta | 1997-08-07 |
+--------+----------------+------------+------------+
6 rows in set (0.028 sec)



-- SOAL 2.2

-- 1.	Tampilkan data produk yang stoknya 3 dan 10

MariaDB [dbtoko]> SELECT * FROM produk WHERE stok=3 OR stok=10;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)

-- 2.	Tampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_jual <5000000 AND harga_jual >500000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |
              4 |
+----+------+------------+------------+------------+------+----------+-----------------+
3 rows in set (0.001 sec)

-- 3.	Tampilkan data produk yang harus segera ditambah stoknya
MariaDB [dbtoko]> SELECT * FROM produk WHERE min_stok > stok;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

-- 4.	Tampilkan data pelanggan mulai dari yang paling muda
MariaDB [dbtoko]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)

-- 5.	Tampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir='jakarta' AND jk='p';
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
1 row in set (0.031 sec)

-- 6.	Tampilkan data pelanggan yang ID nya 2, 4 dan 6
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE id IN (2, 4, 6);
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
3 rows in set (0.034 sec)

-- 7.	Tampilkan data produk yang harganya antara 500 ribu sampai 6 juta
MariaDB [dbtoko]> SELECT * FROM produk WHERE harga_jual >=500000 AND harga_jual <=6000000;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
4 rows in set (0.001 sec)




-- SOAL 2.3

-- 1.	Tampilkan produk yang kode awalnya huruf K dan huruf M

MariaDB [dbtoko]> SELECT * FROM produk WHERE kode LIKE 'K%' OR kode LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

-- 2.	Tampilkan produk yang kode awalnya bukan huruf M
MariaDB [dbtoko]> SELECT * FROM produk WHERE kode NOT LIKE 'M%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |
              2 |
|  6 | TK01 | Teh Kotak  |       3000 |       4000 |    2 |       10 |               3 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.001 sec)

-- 3.	Tampilkan produk-produk televisi
MariaDB [dbtoko]> SELECT * FROM produk WHERE nama='televisi';
Empty set (0.024 sec)

MariaDB [dbtoko]> SELECT * FROM produk WHERE nama LIKE 'tv%';
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

-- 4.	Tampilkan pelanggan mengandung huruf 'SA'
MariaDB [dbtoko]> SELECT * FROM pelanggan;
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%SA%';
Empty set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '%S%' AND nama_pelanggan LIKE '%A%';
+----+--------+----------------+------+-----------+------------+------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email            | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+------------------+----------+--------+
|  3 | 011103 | Sekar          | P    | Kediri    | 2001-09-08 | sekar@gmail.com  |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta   | 1997-09-08 | suandi@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+------------------+----------+--------+
2 rows in set (0.045 sec)

-- 5.	Tampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE (NOT tmp_lahir='jakarta') AND tmp_lahir LIKE '%Y%' AND tmp_lahir LIKE '%O%' ;
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE tmp_lahir != 'jakarta' AND tmp_lahir LIKE '%Y%' AND tmp_lahir LIKE '%O%' ;
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
1 row in set (0.001 sec)

-- 6.	Tampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
MariaDB [dbtoko]> SELECT * FROM pelanggan WHERE nama_pelanggan LIKE '_A%';
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com  |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_jual DESC LIMIT 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.047 sec)




-- SOAL 2.4
-- 1.	Tampilkan 2 data produk termahal
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_jual DESC LIMIT 2;
+----+------+--------+------------+------------+------+----------+-----------------+
| id | kode | nama   | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------+------------+------------+------+----------+-----------------+
|  3 | K001 | Kulkas |    4000000 |    5000000 |   10 |        3 |               1 |
|  1 | TV01 | TV     |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+--------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

-- 2.	Tampilkan produk yang paling murah
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY harga_jual ASC LIMIT 1;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
+----+------+-----------+------------+------------+------+----------+-----------------+
1 row in set (0.002 sec)

-- 3.	Tampilkan produk yang stoknya paling banyak
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY stok DESC LIMIT 1;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM produk ORDER BY stok DESC LIMIT 2;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.024 sec)

-- 4.	Tampilkan dua produk yang stoknya paling sedikit
MariaDB [dbtoko]> SELECT * FROM produk ORDER BY stok ASC LIMIT 2;
+----+------+-----------+------------+------------+------+----------+-----------------+
| id | kode | nama      | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+-----------+------------+------------+------+----------+-----------------+
|  6 | TK01 | Teh Kotak |       3000 |       4000 |    2 |       10 |               3 |
|  1 | TV01 | TV        |    3000000 |    4000000 |    3 |        2 |               1 |
+----+------+-----------+------------+------------+------+----------+-----------------+
2 rows in set (0.001 sec)

-- 5.	Tampilkan pelanggan yang paling muda
MariaDB [dbtoko]> SELECT * FROM pelanggan ORDER BY tgl_lahir DESC LIMIT 1;
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
|  6 | 011106 | Gayatri Putri  | P    | Jakarta   | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
+----+--------+----------------+------+-----------+------------+-------------------+----------+--------+
1 row in set (0.030 sec)

-- 6.	Tampilkan pelanggan yang paling tua
MariaDB [dbtoko]> SELECT * FROM pelanggan ORDER BY tgl_lahir ASC LIMIT1;
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email            | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1997-08-07 | pandan@gmail.com |        2 | NULL   |
+----+--------+----------------+------+------------+------------+------------------+----------+--------+
1 row in set (0.001 sec)