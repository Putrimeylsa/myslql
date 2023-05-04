
-- tugas 7 fungsi/procedure

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> show tables;
+------------------+
| Tables_in_dbtoko |
+------------------+
| detail_produk_vw |
| jenis_produk     |
| kartu            |
| pelanggan        |
| pembayaran       |
| pembelian        |
| pesanan          |
| pesanan_items    |
| produk           |
| tampil_produk    |
| vendor           |
+------------------+
11 rows in set (0.001 sec)

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

MariaDB [dbtoko]> desc pelanggan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode           | varchar(10) | YES  | UNI | NULL    |                |
| nama_pelanggan | varchar(50) | YES  |     | NULL    |                |
| jk             | char(1)     | YES  |     | NULL    |                |
| tmp_lahir      | varchar(20) | YES  |     | NULL    |                |
| tgl_lahir      | date        | YES  |     | NULL    |                |
| email          | varchar(30) | YES  |     | NULL    |                |
| kartu_id       | int(11)     | NO   |     | NULL    |                |
| alamat         | varchar(40) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
9 rows in set (0.053 sec)



-- 1. Buat fungsi inputPelanggan(), setelah itu panggil fungsinya

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE inputPelanggan(kode varchar(10), nama_pelanggan varchar(50), jk char, tmp_lahir varchar(20), tgl_lahir date, email varchar(30), kartu_id int, alamat varchar(40))
    -> BEGIN
    -> INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat) VALUES (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id, alamat);
    -> END$$
MariaDB [dbtoko]> CALL inputPelanggan(011107, 'Malik Aziz', 'L', 'NTB', '1999-09-19', 'aziz@gmail.com', 2, NULL);
Query OK, 1 row affected (0.068 sec)

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
|  7 | 11107  | Malik Aziz     | L    | NTB        | 1999-09-19 | aziz@gmail.com    |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
7 rows in set (0.001 sec)


-- 2. Buat fungsi showPelanggan(), setelah itu panggil fungsinya

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> SELECT * FROM pelanggan;
    -> $$
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
| id | kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             | kartu_id | alamat |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
|  1 | 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |        1 | NULL   |
|  2 | 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |        2 | NULL   |
|  3 | 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |        1 | NULL   |
|  4 | 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |        1 | NULL   |
|  5 | 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |        2 | NULL   |
|  6 | 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |        1 | NULL   |
|  7 | 11107  | Malik Aziz     | L    | NTB        | 1999-09-19 | aziz@gmail.com    |        2 | NULL   |
+----+--------+----------------+------+------------+------------+-------------------+----------+--------+
7 rows in set (0.001 sec)

MariaDB [dbtoko]> CREATE PROCEDURE showPelanggan()
    -> BEGIN
    -> SELECT kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email FROM pelanggan;
    -> END
    -> $$
Query OK, 0 rows affected (0.047 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL showPelanggan;
+--------+----------------+------+------------+------------+-------------------+
| kode   | nama_pelanggan | jk   | tmp_lahir  | tgl_lahir  | email             |
+--------+----------------+------+------------+------------+-------------------+
| 011101 | Agung          | L    | Bandung    | 1997-09-06 | agung@gmail.com   |
| 011102 | Pandan Wangi   | P    | Yogyakarta | 1998-08-07 | pandan@gmail.com  |
| 011103 | Sekar          | P    | Kediri     | 2001-09-08 | sekar@gmail.com   |
| 011104 | Suandi         | L    | Jakarta    | 1997-09-08 | suandi@gmail.com  |
| 011105 | Pradana        | L    | Jakarta    | 2001-08-01 | pradana@gmail.com |
| 011106 | Gayatri Putri  | P    | Jakarta    | 2002-09-01 | gayatri@gmail.com |
| 11107  | Malik Aziz     | L    | NTB        | 1999-09-19 | aziz@gmail.com    |
+--------+----------------+------+------------+------------+-------------------+
7 rows in set (0.001 sec)

Query OK, 0 rows affected (0.017 sec)



-- 3. Buat fungsi inputProduk(), setelah itu panggil fungsinya

MariaDB [dbtoko]> select * from produk;
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV         |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas     |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro       |       4000 |       5000 |    3 |        2 |               2 |
+----+------+------------+------------+------------+------+----------+-----------------+
5 rows in set (0.034 sec)

MariaDB [dbtoko]> desc produk;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| id              | int(11)     | NO   | PRI | NULL    | auto_increment |
| kode            | varchar(10) | YES  | UNI | NULL    |                |
| nama            | varchar(45) | YES  |     | NULL    |                |
| harga_beli      | double      | YES  |     | NULL    |                |
| harga_jual      | double      | YES  |     | NULL    |                |
| stok            | int(11)     | YES  |     | NULL    |                |
| min_stok        | int(11)     | YES  |     | NULL    |                |
| jenis_produk_id | int(11)     | NO   |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+
8 rows in set (0.051 sec)

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE inputProduk(kode varchar(10), nama varchar(45), harga_beli double, harga_jual double, stok int, min_stok int, jenis_produk_id int)
    -> BEGIN
    -> INSERT INTO produk (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id) VALUES (kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    -> END
    -> $$
Query OK, 0 rows affected (0.037 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL inputProduk('K002', 'Kulkas 2 Pintu', 6500000, 8000000, 5, 3, 1);
Query OK, 1 row affected (0.034 sec)

MariaDB [dbtoko]> SELECT * FROM produk;
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)



-- 4. Buat fungsi showProduk(), setelah itu panggil fungsinya

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> SELECT * FROM produk;
    -> $$
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT kode, nama, harga_beli, harga_jual, stok, min_stok;
    -> END
    -> $$
Query OK, 0 rows affected (0.037 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT kode, nama, harga_beli, harga_jual, stok, min_stokFROM produk;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 3



-- benar

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> SELECT * FROM produk;
    -> $$
+----+------+----------------+------------+------------+------+----------+-----------------+
| id | kode | nama           | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+----------------+------------+------------+------+----------+-----------------+
|  1 | TV01 | TV             |    3000000 |    4000000 |    3 |        2 |               1 |
|  2 | TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |               1 |
|  3 | K001 | Kulkas         |    4000000 |    5000000 |   10 |        3 |               1 |
|  4 | M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |               4 |
|  5 | T001 | Taro           |       4000 |       5000 |    3 |        2 |               2 |
|  8 | K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |               1 |
+----+------+----------------+------------+------------+------+----------+-----------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> CREATE PROCEDURE showProduk()
    -> BEGIN
    -> SELECT kode, nama, harga_beli, harga_jual, stok, min_stok FROM produk;
    -> END
    -> $$
Query OK, 0 rows affected (0.044 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL showProduk();
+------+----------------+------------+------------+------+----------+
| kode | nama           | harga_beli | harga_jual | stok | min_stok |
+------+----------------+------------+------------+------+----------+
| TV01 | TV             |    3000000 |    4000000 |    3 |        2 |
| TV02 | TV 21 Inch     |    2000000 |    3000000 |   10 |        3 |
| K001 | Kulkas         |    4000000 |    5000000 |   10 |        3 |
| M001 | Meja Makan     |    1000000 |    2000000 |    4 |        2 |
| T001 | Taro           |       4000 |       5000 |    3 |        2 |
| K002 | Kulkas 2 Pintu |    6500000 |    8000000 |    5 |        3 |
+------+----------------+------------+------------+------+----------+
6 rows in set (0.001 sec)

Query OK, 0 rows affected (0.014 sec)



-- 5. Buat fungsi totalPesanan(), setelah itu panggil fungsinya

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
+----+------------+--------+--------------+
2 rows in set (0.000 sec)

MariaDB [dbtoko]> CREATE PROCEDURE totalPesanan(tanggal date, total double, pelanggan_id int)
    -> BEGIN
    -> INSERT INTO pesanan (tanggal, total, pelanggan_id) VALUES (tanggal, total, pelanggan_id);
    -> END
    -> $$
Query OK, 0 rows affected (0.045 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL totalPesanan('2021-01-01', 150000, 2);
Query OK, 1 row affected (0.058 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
|  3 | 2021-01-01 | 150000 |            2 |
+----+------------+--------+--------------+
3 rows in set (0.001 sec)



-- benar

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE totalPesanan()
    -> BEGIN
    -> DECLARE total int;
    -> SELECT COUNT(id) INTO total FROM pesanan;
    -> SELECT total;
    -> END;
    -> $$
Query OK, 0 rows affected (0.058 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL totalPesanan();
+-------+
| total |
+-------+
|     3 |
+-------+
1 row in set (0.027 sec)

Query OK, 1 row affected (0.029 sec)



-- 6. tampilkan seluruh pesanan dari semua pelanggan

MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE PROCEDURE pesananPelanggan()
    -> BEGIN
    -> SELECT pelanggan.nama_pelanggan, produk.nama, pesanan.id FROM pesanan
    -> INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> INNER JOIN produk ON pesanan.pelanggan_id = produk.jenis_produk_id;
    -> END
    -> $$
Query OK, 0 rows affected (0.056 sec)

MariaDB [dbtoko]> DELIMITER ;
MariaDB [dbtoko]> CALL pesananPelanggan();
+----------------+----------------+----+
| nama_pelanggan | nama           | id |
+----------------+----------------+----+
| Agung          | TV             |  1 |
| Agung          | TV             |  2 |
| Agung          | TV 21 Inch     |  1 |
| Agung          | TV 21 Inch     |  2 |
| Agung          | Kulkas         |  1 |
| Agung          | Kulkas         |  2 |
| Pandan Wangi   | Taro           |  3 |
| Agung          | Kulkas 2 Pintu |  1 |
| Agung          | Kulkas 2 Pintu |  2 |
+----------------+----------------+----+
9 rows in set (0.043 sec)

Query OK, 0 rows affected (0.055 sec)


-- 7. buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw 
-- (menggunakan join dari table pesanan,pelanggan dan produk)

MariaDB [dbtoko]> CREATE VIEW pesanan_produk_vw AS
    -> SELECT pelanggan.nama_pelanggan, produk.nama, pesanan.id FROM pesanan
    -> INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    -> INNER JOIN produk ON pesanan.pelanggan_id = produk.jenis_produk_id;
Query OK, 0 rows affected (0.051 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan_produk_vw;
+----------------+----------------+----+
| nama_pelanggan | nama           | id |
+----------------+----------------+----+
| Agung          | TV             |  1 |
| Agung          | TV             |  2 |
| Agung          | TV 21 Inch     |  1 |
| Agung          | TV 21 Inch     |  2 |
| Agung          | Kulkas         |  1 |
| Agung          | Kulkas         |  2 |
| Pandan Wangi   | Taro           |  3 |
| Agung          | Kulkas 2 Pintu |  1 |
| Agung          | Kulkas 2 Pintu |  2 |
+----------------+----------------+----+
9 rows in set (0.002 sec)



MariaDB [dbtoko]> SHOW FULL TABLES;
+-------------------+------------+
| Tables_in_dbtoko  | Table_type |
+-------------------+------------+
| detail_produk_vw  | VIEW       |
| jenis_produk      | BASE TABLE |
| kartu             | BASE TABLE |
| pelanggan         | BASE TABLE |
| pembayaran        | BASE TABLE |
| pembelian         | BASE TABLE |
| pesanan           | BASE TABLE |
| pesanan_items     | BASE TABLE |
| pesanan_produk_vw | VIEW       |
| produk            | BASE TABLE |
| tampil_produk     | VIEW       |
| vendor            | BASE TABLE |
+-------------------+------------+
12 rows in set (0.003 sec)

-- soal no 6 dan 7 (salah)
-- (masih ragu karena isi dari table pesanan_items belum ada
-- yang mana harusnya disana ada id pesanan serta jumlah barang yang dipesan)

MariaDB [dbtoko]> desc pesanan_items;
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| id         | int(11) | NO   | PRI | NULL    | auto_increment |
| produk_id  | int(11) | NO   |     | NULL    |                |
| pesanan_id | int(11) | NO   |     | NULL    |                |
| qty        | int(11) | YES  |     | NULL    |                |
| harga      | double  | YES  |     | NULL    |                |
+------------+---------+------+-----+---------+----------------+
5 rows in set (0.032 sec)