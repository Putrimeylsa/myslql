MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| db_penugasan       |
| dbtoko             |
| dbtoko2            |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
8 rows in set (0.089 sec)

MariaDB [(none)]> USE dbtoko;
Database changed
MariaDB [dbtoko]> SHOW TABLES;
+-------------------+
| Tables_in_dbtoko  |
+-------------------+
| detail_produk_vw  |
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pembelian         |
| pesanan           |
| pesanan_items     |
| pesanan_produk_vw |
| produk            |
| tampil_produk     |
| vendor            |
+-------------------+
12 rows in set (0.028 sec)

MariaDB [dbtoko]> DESC pesanan;
+--------------+---------+------+-----+---------+----------------+
| Field        | Type    | Null | Key | Default | Extra          |
+--------------+---------+------+-----+---------+----------------+
| id           | int(11) | NO   | PRI | NULL    | auto_increment |
| tanggal      | date    | YES  |     | NULL    |                |
| total        | double  | YES  |     | NULL    |                |
| pelanggan_id | int(11) | NO   |     | NULL    |                |
+--------------+---------+------+-----+---------+----------------+
4 rows in set (0.070 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
|  3 | 2021-01-01 | 150000 |            2 |
+----+------------+--------+--------------+
3 rows in set (0.090 sec)

MariaDB [dbtoko]> DESC pembayaran;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi | varchar(10) | YES  | UNI | NULL    |                |
| tanggal    | date        | YES  |     | NULL    |                |
| jumlah     | double      | YES  |     | NULL    |                |
| ke         | int(11)     | YES  |     | NULL    |                |
| pesanan_id | int(11)     | NO   |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.068 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
Empty set (0.001 sec)

MariaDB [dbtoko]> ALTER TABLE pesanan ADD COLUMN id_pesanan SERIAL PRIMARY KEY;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
MariaDB [dbtoko]> ALTER TABLE pesanan ADD id_pesanan SERIAL PRIMARY KEY;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
MariaDB [dbtoko]> ALTER TABLE pesanan ADD id_pesanan int PRIMARY KEY;
ERROR 1068 (42000): Multiple primary key defined
MariaDB [dbtoko]> ALTER TABLE pesanan ADD id_pesanan int;
Query OK, 0 rows affected (0.076 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> ALTER TABLE pesanan ADD status_pesanan VARCHAR(20);
Query OK, 0 rows affected (0.049 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> DESC pesanan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| tanggal        | date        | YES  |     | NULL    |                |
| total          | double      | YES  |     | NULL    |                |
| pelanggan_id   | int(11)     | NO   |     | NULL    |                |
| id_pesanan     | int(11)     | YES  |     | NULL    |                |
| status_pesanan | varchar(20) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
6 rows in set (0.049 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | id_pesanan | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> ALTER TABLE pesanan DROP id_pesanan;
Query OK, 0 rows affected (0.046 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> ALTER TABLE pesanan DROP status_pesanan;
Query OK, 0 rows affected (0.048 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> DESC pesanan;
+--------------+---------+------+-----+---------+----------------+
| Field        | Type    | Null | Key | Default | Extra          |
+--------------+---------+------+-----+---------+----------------+
| id           | int(11) | NO   | PRI | NULL    | auto_increment |
| tanggal      | date    | YES  |     | NULL    |                |
| total        | double  | YES  |     | NULL    |                |
| pelanggan_id | int(11) | NO   |     | NULL    |                |
+--------------+---------+------+-----+---------+----------------+
4 rows in set (0.047 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-03 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            1 |
|  3 | 2021-01-01 | 150000 |            2 |
+----+------------+--------+--------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> ALTER TABLE pesanan DROP pesanan_id;
ERROR 1091 (42000): Cant DROP COLUMN `pesanan_id`; check that it exists
MariaDB [dbtoko]> ALTER TABLE pesanan ADD pesanan_id int;
Query OK, 0 rows affected (0.052 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> ALTER TABLE pesanan ADD status_pesanan VARCHAR(20);
Query OK, 0 rows affected (0.049 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> DESC pesanan;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| tanggal        | date        | YES  |     | NULL    |                |
| total          | double      | YES  |     | NULL    |                |
| pelanggan_id   | int(11)     | NO   |     | NULL    |                |
| pesanan_id     | int(11)     | YES  |     | NULL    |                |
| status_pesanan | varchar(20) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
6 rows in set (0.033 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> DESC pembayaran;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi | varchar(10) | YES  | UNI | NULL    |                |
| tanggal    | date        | YES  |     | NULL    |                |
| jumlah     | double      | YES  |     | NULL    |                |
| ke         | int(11)     | YES  |     | NULL    |                |
| pesanan_id | int(11)     | NO   |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.056 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
Empty set (0.000 sec)

MariaDB [dbtoko]> ALTER TABLE pembayaran ADD id_pembayaran int;
Query OK, 0 rows affected (0.055 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> ALTER TABLE pembayaran ADD status_pembayaran VARCHAR(20);
Query OK, 0 rows affected (0.054 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> DESC pembayaran;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi        | varchar(10) | YES  | UNI | NULL    |                |
| tanggal           | date        | YES  |     | NULL    |                |
| jumlah            | double      | YES  |     | NULL    |                |
| ke                | int(11)     | YES  |     | NULL    |                |
| pesanan_id        | int(11)     | NO   |     | NULL    |                |
| id_pembayaran     | int(11)     | YES  |     | NULL    |                |
| status_pembayaran | varchar(20) | YES  |     | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
8 rows in set (0.045 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
Empty set (0.036 sec)

MariaDB [dbtoko]> ALTER TABLE pembayaran DROP id_pembayaran;
Query OK, 0 rows affected (0.045 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> ALTER TABLE pembayaran DROP status_pembayaran;
Query OK, 0 rows affected (0.044 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> DESC pembayaran;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| id         | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi | varchar(10) | YES  | UNI | NULL    |                |
| tanggal    | date        | YES  |     | NULL    |                |
| jumlah     | double      | YES  |     | NULL    |                |
| ke         | int(11)     | YES  |     | NULL    |                |
| pesanan_id | int(11)     | NO   |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
6 rows in set (0.013 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
Empty set (0.000 sec)

MariaDB [dbtoko]> ALTER TABLE pembayaran ADD pembayaran_id int;
Query OK, 0 rows affected (0.055 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> ALTER TABLE pembayaran ADD status_pembayaran VARCHAR(20);
Query OK, 0 rows affected (0.044 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> DESC pembayaran;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi        | varchar(10) | YES  | UNI | NULL    |                |
| tanggal           | date        | YES  |     | NULL    |                |
| jumlah            | double      | YES  |     | NULL    |                |
| ke                | int(11)     | YES  |     | NULL    |                |
| pesanan_id        | int(11)     | NO   |     | NULL    |                |
| pembayaran_id     | int(11)     | YES  |     | NULL    |                |
| status_pembayaran | varchar(20) | YES  |     | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
8 rows in set (0.037 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
Empty set (0.001 sec)

MariaDB [dbtoko]> INSERT INTO pemayaran VALUES
    -> ('','0001','2021-02-12',2000000,1,1,1,'belum lunas'),
    -> ('','0001','2021-02-12',12000000,2,2,2,'lunas')
    -> ;
ERROR 1146 (42S02): Table 'dbtoko.pemayaran' doesnt exist
MariaDB [dbtoko]> INSERT INTO pembayaran VALUES
    -> ('','0001','2021-02-12',2000000,1,1,1,'belum lunas'),
    -> ('','0001','2021-02-12',12000000,2,2,2,'lunas')
    -> ;
ERROR 1062 (23000): Duplicate entry '0001' for key 'nokuitansi'
MariaDB [dbtoko]> INSERT INTO pembayaran VALUES
    -> ('','01','2021-02-12',2000000,1,1,1,'belum lunas'),
    -> ('','0001','2021-02-12',12000000,2,2,2,'lunas')
    -> ;
Query OK, 2 rows affected, 2 warnings (0.050 sec)
Records: 2  Duplicates: 0  Warnings: 2

MariaDB [dbtoko]> DELETE FROM pembayaran;
Query OK, 2 rows affected (0.043 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran VALUES
    -> ('','0001','2021-02-12',2000000,1,1,1,'belum lunas'),
    -> ('','0002','2021-04-14',12000000,2,2,2,'lunas')
    -> ;
Query OK, 2 rows affected, 2 warnings (0.011 sec)
Records: 2  Duplicates: 0  Warnings: 2

MariaDB [dbtoko]> DESC pembayaran;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi        | varchar(10) | YES  | UNI | NULL    |                |
| tanggal           | date        | YES  |     | NULL    |                |
| jumlah            | double      | YES  |     | NULL    |                |
| ke                | int(11)     | YES  |     | NULL    |                |
| pesanan_id        | int(11)     | NO   |     | NULL    |                |
| pembayaran_id     | int(11)     | YES  |     | NULL    |                |
| status_pembayaran | varchar(20) | YES  |     | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
8 rows in set (0.077 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.040 sec)

MariaDB [dbtoko]> select * from jenis_produk;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    64
Current database: dbtoko

+----+-----------------+----------------+
| id | nama            | ket            |
+----+-----------------+----------------+
|  1 | elektronik      | tersedia       |
|  2 | makanan         | tersedia       |
|  3 | minuman         | tidak tersedia |
|  4 | furnitur        | tersedia       |
|  5 | alat kebersihan | tersedia       |
+----+-----------------+----------------+
5 rows in set (0.020 sec)

MariaDB [dbtoko]> DESC pesanan;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    66
Current database: dbtoko

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| tanggal        | date        | YES  |     | NULL    |                |
| total          | double      | YES  |     | NULL    |                |
| pelanggan_id   | int(11)     | NO   |     | NULL    |                |
| pesanan_id     | int(11)     | YES  |     | NULL    |                |
| status_pesanan | varchar(20) | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+
6 rows in set (0.107 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.014 sec)

MariaDB [dbtoko]> DESC pembayaran;
+-------------------+-------------+------+-----+---------+----------------+
| Field             | Type        | Null | Key | Default | Extra          |
+-------------------+-------------+------+-----+---------+----------------+
| id                | int(11)     | NO   | PRI | NULL    | auto_increment |
| nokuitansi        | varchar(10) | YES  | UNI | NULL    |                |
| tanggal           | date        | YES  |     | NULL    |                |
| jumlah            | double      | YES  |     | NULL    |                |
| ke                | int(11)     | YES  |     | NULL    |                |
| pesanan_id        | int(11)     | NO   |     | NULL    |                |
| pembayaran_id     | int(11)     | YES  |     | NULL    |                |
| status_pembayaran | varchar(20) | YES  |     | NULL    |                |
+-------------------+-------------+------+-----+---------+----------------+
8 rows in set (0.050 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.040 sec)

MariaDB [dbtoko]> DESC pelanggan;
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
9 rows in set (0.119 sec)

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
7 rows in set (0.030 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> WHEN (NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai'))
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE id_pembayaran = NEW.id_pembayaran;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'WHEN (NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE...' at line 3
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> WHEN (NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai'));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'WHEN (NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE...' at line 4
MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> WHEN (NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai'));
    -> UPDATE pembayaran;
    -> SET status_pembayaran = 'lunas';
    -> WHERE id_pembayaran = NEW.id_pembayaran;
    -> END;
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'WHEN (NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE...' at line 4
MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.036 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.031 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai'));
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ')' at line 4
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai');
    -> UPDATE pembayaran;
    -> SET status_pembayaran = 'lunas';
    -> WHERE id_pembayaran = NEW.id_pembayaran;
    -> END;
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ;
UPDATE pembayaran;
SET status_pembayaran = 'lunas';
WHERE id_pembayaran = N... at line 5
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai');
    -> END IF;
    -> UPDATE pembayaran;
    -> SET status_pembayaran = 'lunas';
    -> WHERE id_pembayaran = NEW.id_pembayaran;
    -> END;
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ;
END IF;
UPDATE pembayaran;
SET status_pembayaran = 'lunas';
WHERE id_pembay... at line 5
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF (NEW.status_pembayaran = 'lunas'
    -> AND (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai'));
    -> END IF;
    -> UPDATE pembayaran;
    -> SET status_pembayaran = 'lunas';
    -> WHERE id_pembayaran = NEW.id_pembayaran;
    -> END;
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ;
END IF;
UPDATE pembayaran;
SET status_pembayaran = 'lunas';
WHERE id_pembay... at line 5
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF (NEW.status_pembayaran = 'lunas'
    -> AND (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai'));
    -> END IF;
    -> UPDATE pembayaran;
    -> SET status_pembayaran = 'lunas';
    -> WHERE id_pembayaran = NEW.id_pembayaran;
    -> END;
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ;
END IF;
UPDATE pembayaran;
SET status_pembayaran = 'lunas';
WHERE id_pembay... at line 5
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF (NEW.status_pembayaran = 'lunas'
    -> AND (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai'))
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas';
    -> WHERE id_pembayaran = NEW.id_pembayaran;
    -> END IF;
    -> END;
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near WHERE id_pembayaran = NEW.id_pembayaran;
END IF;
END at line 9
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE id_pembayaran = NEW.id_pembayaran;
    -> END IF;
    -> END;
    -> $$
ERROR 1054 (42S22): Unknown column 'id_pembayaran' in 'NEW'
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF (NEW.status_pembayaran = 'lunas'
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 4
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pembayaran_id = NEW.pembayaran_id;
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.070 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES (1, 'selesai');
    -> dadeda
    -> af
    -> $$
Query OK, 1 row affected, 1 warning (0.044 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'dadeda
af' at line 1
MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES
    -> (1,'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.044 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
+----+------------+--------+--------------+------------+----------------+
5 rows in set (0.022 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.032 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES
    -> (1, 1, 'lunas');
    -> $$
ERROR 1442 (HY000): Cant update table 'pembayaran' in stored function/trigger because it is already used by statement which invoked this stored function/trigger
MariaDB [dbtoko]> drop trigger update_status_pembayaran;
    -> $$
Query OK, 0 rows affected (0.038 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE sp INT;
    -> SELECT COUNT(*) INTO sp FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai';
    ->  IF NEW.status_pembayaran = 'lunas' AND is_done > 0
    -> THEN
    -> SET NEW.status_pembayaran = 'lunas';
    -> END IF;
    -> END;
    -> $$
ERROR 1327 (42000): Undeclared variable: is_done
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> DECLARE sp INT;
    -> SELECT COUNT(*) INTO sp FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai';
    ->  IF NEW.status_pembayaran = 'lunas' AND sp > 0
    -> THEN
    -> SET NEW.status_pembayaran = 'lunas';
    -> END IF;
    -> END;
    -> $$
ERROR 1362 (HY000): Updating of NEW row is not allowed in after trigger
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.id_pesanan = NEW.id_pesanan AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> SET NEW.status_pembayaran = 'lunas';
    -> END IF;
    -> END;
    -> $$
ERROR 1054 (42S22): Unknown column 'id_pesanan' in 'NEW'
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> SET NEW.status_pembayaran = 'lunas';
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.049 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
+----+------------+--------+--------------+------------+----------------+
5 rows in set (0.015 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.005 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES
    ->  (1, 'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.048 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
+----+------------+--------+--------------+------------+----------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES
    -> (1, 1, 'lunas');
    -> (2, 1, 'belum lunas');
    -> $$
Query OK, 1 row affected (0.065 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '2, 1, 'belum lunas')' at line 1
MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES
    -> (1, 1, 'lunas'),
    -> (2, 1, 'belum lunas');
    -> $$
Query OK, 2 rows affected (0.031 sec)
Records: 2  Duplicates: 0  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
5 rows in set (0.001 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES
    ->  (2, 'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.025 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
+----+------------+--------+--------------+------------+----------------+
7 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
5 rows in set (0.001 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES
    -> (1, 1, 'belum lunas');
    -> $$
Query OK, 1 row affected (0.025 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |
            2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
6 rows in set (0.032 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES
    ->  (3, 'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.048 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES
    -> (3, 3, 'belum lunas');
    -> $$
Query OK, 1 row affected (0.023 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
+----+------------+--------+--------------+------------+----------------+
8 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
+----+------------+--------+--------------+------------+----------------+
8 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
| 12 | NULL       | NULL       |     NULL | NULL |          3 |             3 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
7 rows in set (0.001 sec)

MariaDB [dbtoko]> drop trigger update_status_pembayaran;
    -> $$
Query OK, 0 rows affected (0.047 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    ->  IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai') THEN
    -> UPDATE pembayaran SET status_pembayaran = 'lunas'
    ->  WHERE pembayaran_id = NEW.pembayaran_id;
    ->  END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.045 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (nama_pelanggan, total_harga, status_pesanan) VALUES
    -> ('John Doe', 50000, 'diproses');
    -> $$
ERROR 1054 (42S22): Unknown column 'nama_pelanggan' in 'field list'
MariaDB [dbtoko]> INSERT INTO pesanan (pelanggan, total_harga, status_pesanan) VALUES
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [dbtoko]> INSERT INTO pesanan (pelanggan_id, total, status_pesanan) VALUES
    -> ('John Doe', 50000, 'diproses');
    -> $$
Query OK, 1 row affected, 1 warning (0.042 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            0 |       NULL | diproses       |
+----+------------+--------+--------------+------------+----------------+
9 rows in set (0.037 sec)

MariaDB [dbtoko]> UPDATE  pesanan  SET  pelanggan_id = 4   WHERE   id = 9;
    -> $$
Query OK, 1 row affected (0.017 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
+----+------------+--------+--------------+------------+----------------+
9 rows in set (0.041 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
| 12 | NULL       | NULL       |     NULL | NULL |          3 |             3 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
7 rows in set (0.009 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pesanan_id, jumlah, status_pembayaran) VALUES
    ->  (1, 50000, 'lunas');
    -> $$
ERROR 1442 (HY000): Cant update table 'pembayaran' in stored function/trigger because it is already used by statement which invoked this stored function/trigger
MariaDB [dbtoko]> drop trigger update_status_pembayaran;
    -> $$
Query OK, 0 rows affected (0.003 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> SET @sql := CONCAT('UPDATE pembayaran SET status_pembayaran = ''lunas'' WHERE pembayaran_id = ', NEW.pembayaran_id);
    -> PREPARE stmt FROM @sql;
    -> EXECUTE stmt;
    -> DEALLOCATE PREPARE stmt;
    -> END IF;
    -> END;
    -> $$
ERROR 1336 (0A000): Dynamic SQL is not allowed in stored function or trigger
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran BEFORE INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> SET NEW.status_pembayaran = 'lunas';
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.055 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
+----+------------+--------+--------------+------------+----------------+
9 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
| 12 | NULL       | NULL       |     NULL | NULL |          3 |             3 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
7 rows in set (0.002 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES (1, 'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.050 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES (1, 1, '');
    -> $$
Query OK, 1 row affected (0.036 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
| 10 | NULL       |   NULL |            0 |          1 | selesai        |
+----+------------+--------+--------------+------------+----------------+
10 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
| 12 | NULL       | NULL       |     NULL | NULL |          3 |             3 | belum lunas       |
| 14 | NULL       | NULL       |     NULL | NULL |          1 |             1 |                   |
+----+------------+------------+----------+------+------------+---------------+-------------------+
8 rows in set (0.001 sec)

MariaDB [dbtoko]> drop trigger update_status_pembayaran;
    -> $$
Query OK, 0 rows affected (0.041 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER
INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> $$Bye
Ctrl-C -- exit!

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 67
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use dbtoko
Database changed
MariaDB [dbtoko]> DILIMITER $$
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'DILIMITER $$' at line 1
MariaDB [dbtoko]> DELIMITER $$
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pembayaran_id = NEW.pembayaran_id;
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.055 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
| 10 | NULL       |   NULL |            0 |          1 | selesai        |
+----+------------+--------+--------------+------------+----------------+
10 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
| 12 | NULL       | NULL       |     NULL | NULL |          3 |             3 | belum lunas       |
| 14 | NULL       | NULL       |     NULL | NULL |          1 |             1 |                   |
+----+------------+------------+----------+------+------------+---------------+-------------------+
8 rows in set (0.002 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES (5, 'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.034 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES (1, 1, '');
    -> $$
Query OK, 1 row affected (0.038 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
| 10 | NULL       |   NULL |            0 |          1 | selesai        |
| 11 | NULL       |   NULL |            0 |          5 | selesai        |
+----+------------+--------+--------------+------------+----------------+
11 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
| 12 | NULL       | NULL       |     NULL | NULL |          3 |             3 | belum lunas       |
| 14 | NULL       | NULL       |     NULL | NULL |          1 |             1 |                   |
| 15 | NULL       | NULL       |     NULL | NULL |          1 |             1 |                   |
+----+------------+------------+----------+------+------------+---------------+-------------------+
9 rows in set (0.027 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES (6, 'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.042 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES (6, 6, '');
    -> $$
Query OK, 1 row affected (0.035 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
| 10 | NULL       |   NULL |            0 |          1 | selesai        |
| 11 | NULL       |   NULL |            0 |          5 | selesai        |
| 12 | NULL       |   NULL |            0 |          6 | selesai        |
+----+------------+--------+--------------+------------+----------------+
12 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
|  8 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
|  9 | NULL       | NULL       |     NULL | NULL |          1 |             1 | lunas             |
| 10 | NULL       | NULL       |     NULL | NULL |          1 |             2 | belum lunas       |
| 11 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
| 12 | NULL       | NULL       |     NULL | NULL |          3 |             3 | belum lunas       |
| 14 | NULL       | NULL       |     NULL | NULL |          1 |             1 |                   |
| 15 | NULL       | NULL       |     NULL | NULL |          1 |             1 |                   |
| 16 | NULL       | NULL       |     NULL | NULL |          6 |             6 |                   |
+----+------------+------------+----------+------+------------+---------------+-------------------+
10 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan WHERE id = 4;
    -> $$
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    68
Current database: dbtoko

+----+---------+-------+--------------+------------+----------------+
| id | tanggal | total | pelanggan_id | pesanan_id | status_pesanan |
+----+---------+-------+--------------+------------+----------------+
|  4 | NULL    |  NULL |            0 |          1 | selesai        |
+----+---------+-------+--------------+------------+----------------+
1 row in set (0.091 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
| 10 | NULL       |   NULL |            0 |          1 | selesai        |
| 11 | NULL       |   NULL |            0 |          5 | selesai        |
| 12 | NULL       |   NULL |            0 |          6 | selesai        |
+----+------------+--------+--------------+------------+----------------+
12 rows in set (0.005 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan WHERE id = 4;
    -> $$
+----+---------+-------+--------------+------------+----------------+
| id | tanggal | total | pelanggan_id | pesanan_id | status_pesanan |
+----+---------+-------+--------------+------------+----------------+
|  4 | NULL    |  NULL |            0 |          1 | selesai        |
+----+---------+-------+--------------+------------+----------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  4 | NULL       |   NULL |            0 |          1 | selesai        |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
| 10 | NULL       |   NULL |            0 |          1 | selesai        |
| 11 | NULL       |   NULL |            0 |          5 | selesai        |
| 12 | NULL       |   NULL |            0 |          6 | selesai        |
+----+------------+--------+--------------+------------+----------------+
12 rows in set (0.001 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 4;
    -> $$
Query OK, 1 row affected (0.038 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
|  5 | NULL       |   NULL |            0 |          1 | selesai        |
|  6 | NULL       |   NULL |            0 |          1 | selesai        |
|  7 | NULL       |   NULL |            0 |          2 | selesai        |
|  8 | NULL       |   NULL |            0 |          3 | selesai        |
|  9 | NULL       |  50000 |            4 |       NULL | diproses       |
| 10 | NULL       |   NULL |            0 |          1 | selesai        |
| 11 | NULL       |   NULL |            0 |          5 | selesai        |
| 12 | NULL       |   NULL |            0 |          6 | selesai        |
+----+------------+--------+--------------+------------+----------------+
11 rows in set (0.001 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 5;
    -> $$
Query OK, 1 row affected (0.005 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 6;
    -> $$
Query OK, 1 row affected (0.006 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 7;
    -> $$
Query OK, 1 row affected (0.006 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 8;
    -> $$
Query OK, 1 row affected (0.021 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 9;
    -> $$
Query OK, 1 row affected (0.006 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 10;
    -> $$
Query OK, 1 row affected (0.029 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 11;
    -> $$
Query OK, 1 row affected (0.033 sec)

MariaDB [dbtoko]> DELETE FROM pesanan WHERE id = 12;
    -> $$
Query OK, 1 row affected (0.031 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 8;
    -> $$
Query OK, 1 row affected (0.043 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 9;
    -> $$
Query OK, 1 row affected (0.033 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 10;
    -> $$
Query OK, 1 row affected (0.005 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 11;
    -> $$
Query OK, 1 row affected (0.007 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 12;
    -> $$
Query OK, 1 row affected (0.041 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 13;
    -> $$
Query OK, 0 rows affected (0.001 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 14;
    -> $$
Query OK, 1 row affected (0.029 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 15;
    -> $$
Query OK, 1 row affected (0.029 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
| 16 | NULL       | NULL       |     NULL | NULL |          6 |             6 |                   |
+----+------------+------------+----------+------+------------+---------------+-------------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> DELETE FROM pembayaran WHERE id = 16;
    -> $$
Query OK, 1 row affected (0.042 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> show trigger;
    -> $$
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    69
Current database: dbtoko

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'trigger' at line 1
MariaDB [dbtoko]> show triggers;
    -> $$
+--------------------------+--------+---------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                  | Event  | Table         | Statement










                                                | Timing | Created                | sql_mode
        | Definer        | character_set_client | collation_connection | Database Collation |
+--------------------------+--------+---------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------+----------------+----------------------+----------------------+--------------------+
| update_status_pembayaran | INSERT | pembayaran    | BEGIN
IF NEW.status_pembayaran = 'lunas'
AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
THEN
UPDATE pembayaran
SET status_pembayaran = 'lunas'
WHERE pembayaran_id = NEW.pembayaran_id;
END IF;
END





                                                    | AFTER  | 2023-05-06 01:00:03.60 | NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_general_ci |
| keranjang_pesanan_items  | INSERT | pesanan_items | BEGIN
SET @stok = (SELECT stok FROM produk WHERE id =  NEW.produk_id);SET @sisa = @stok - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = NEW.produk_id;
END






                                                           | BEFORE | 2023-05-04 10:01:18.45 | NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_general_ci |
| transaksi_update_before  | UPDATE | pesanan_items | BEGIN
IF OLD.id = NEW.produk_id THEN
SET @stok = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa = (@stok + OLD.qty) - NEW.qty;
IF @sisa < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak cukup';
END IF;
UPDATE produk SET stok = @sisa WHERE id = OLD.produk_id;
ELSE
SET @stok_lama = (SELECT stok FROM produk WHERE id = OLD.produk_id);
SET @sisa_lama = (@stok_lama + OLD.qty);
UPDATE produk SET stok = @sisa_lama WHERE id = OLD.produk_id;
SET @stok_baru = (SELECT stok FROM produk WHERE id = NEW.produk_id);
SET @sisa_baru = @stok_baru - NEW.qty;
IF @sisa_baru < 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Warning: stok tidak tersedia';
END IF;
UPDATE produk SET stok = @sisa_baru WHERE id = NEW.produk_id;
END IF;
END | BEFORE | 2023-05-04 11:29:07.41 | NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION | root@localhost | cp850
    | cp850_general_ci     | utf8mb4_general_ci |
+--------------------------+--------+---------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------+----------------+----------------------+----------------------+--------------------+
3 rows in set (0.111 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.045 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.050 sec)

MariaDB [dbtoko]>  CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    ->     -> FOR EACH ROW
    ->     -> BEGIN
    ->     -> IF NEW.status_pembayaran = 'lunas'
    ->     -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    ->     -> THEN
    ->     -> UPDATE pembayaran
    ->     -> SET status_pembayaran = 'lunas'
    ->     -> WHERE pembayaran_id = NEW.pembayaran_id;
    ->     -> END IF;
    ->     -> END;
    ->     -> $
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '-> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    ->...' at line 2
MariaDB [dbtoko]>  CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROWACH
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEWAND EXISTS (SELECT FROM pesanan WHERE pesanan.pesanan_id = NEW.pesana
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ROWACH
BEGIN
IF NEW.status_pembayaran = 'lunas'' at line 2
MariaDB [dbtoko]>  CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROWACH
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ROWACH
BEGIN
IF NEW.status_pembayaran = 'lunas'' at line 2
MariaDB [dbtoko]>  CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pesanan_id = NEW.pesanan_id;
    -> END IF;
    -> END;
    -> $$
ERROR 1359 (HY000): Trigger 'dbtoko.update_status_pembayaran' already exists
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER
INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pesanan_id = NEW.pesanan_id;
    -> END IF;
    -> END;
    -> $$
ERROR 1359 (HY000) drop trigger update_status_pembayaran;ran already exists
    -> [$$dbtoko]> drop
Query OK, 0 rows affected (0.071 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas'
    -> AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pesanan_id = NEW.pesanan_id;
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.049 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.025 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.045 sec)

MariaDB [dbtoko]> INSERT INTO pesanan (pesanan_id, status_pesanan) VALUES (1, 'selesai');
    -> $$
Query OK, 1 row affected, 1 warning (0.034 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES (1, 1, 'belum lunas');
    -> $$
Query OK, 1 row affected (0.039 sec)

MariaDB [dbtoko]> SELECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
| 13 | NULL       |   NULL |            0 |          1 | selesai        |
+----+------------+--------+--------------+------------+----------------+
4 rows in set (0.027 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
| 17 | NULL       | NULL       |     NULL | NULL |          1 |             1 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]>  DELETE FROM pesanan WHERE id = 13;
    -> $$
Query OK, 1 row affected (0.046 sec)

MariaDB [dbtoko]>  DELETE FROM pembayaran WHERE id = 17;
    -> $$
Query OK, 1 row affected (0.005 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pesanan
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pesanan = 'selesai'
    -> THEN
    -> UPDATE pembayaran SET $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 6
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pesanan
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pesanan = 'selesai'
    -> THEN
    -> SET @idpesanan = (SELECT $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 6
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran
    -> AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.id_pesanan = NEW.id_pesanan AND pesanan.status_pesanan = 'selesai') THEN
    ->         UPDATE pembayaran
    ->         SET status_pembayaran = 'lunas'
    ->         WHERE id_pembayaran = NEW.id_pembayaran;
    ->     END IF;
    -> END;
    -> $$
ERROR 1054 (42S22): Unknown column 'id_pesanan' in 'NEW'
MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER
INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND 
    pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pembayaran_id = NEW.pembayaran_id;
    -> END IF;
    -> END;
    -> $$
ERROR 1359 (HY000): Trigger 'dbtoko.update_status_pembayaran' already exists
MariaDB [dbtoko]> drop trigger update_status_pembayaran;
    -> $$
Query OK, 0 rows affected (0.054 sec)

MariaDB [dbtoko]> CREATE TRIGGER update_status_pembayaran AFTER INSERT ON pembayaran
    -> FOR EACH ROW
    -> BEGIN
    -> IF NEW.status_pembayaran = 'lunas' AND EXISTS (SELECT 1 FROM pesanan WHERE pesanan.pesanan_id = NEW.pesanan_id AND 
    pesanan.status_pesanan = 'selesai')
    -> THEN
    -> UPDATE pembayaran
    -> SET status_pembayaran = 'lunas'
    -> WHERE pembayaran_id = NEW.pembayaran_id;
    -> END IF;
    -> END;
    -> $$
Query OK, 0 rows affected (0.049 sec)

MariaDB [dbtoko]> SElECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |       NULL | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |       NULL | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |       NULL | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.019 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.033 sec)

MariaDB [dbtoko]> UPDATE pesanan SET pesanan_id = 1 WHERE id = 1;
    -> $$
Query OK, 1 row affected (0.053 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE pesanan SET pesanan_id = 2 WHERE id = 2;
    -> $$
Query OK, 1 row affected (0.023 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE pesanan SET pesanan_id = 3 WHERE id = 3;
    -> $$
Query OK, 1 row affected (0.027 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SElECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |          1 | NULL           |
|  2 | 2022-02-02 |  30000 |            1 |          2 | NULL           |
|  3 | 2021-01-01 | 150000 |            2 |          3 | NULL           |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.031 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.032 sec)

MariaDB [dbtoko]> UPDATE pesanan SET status_pesanan = 'selesai' WHERE id = 1;
    -> $$
Query OK, 1 row affected (0.027 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE pesanan SET status_pesanan = 'belum' WHERE id = 2;
    -> $$
Query OK, 1 row affected (0.051 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE pesanan SET status_pesanan = 'belum' WHERE id = 3;
    -> $$
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> UPDATE pembayaran SET status_pembayaran = 'belum lunas' WHERE id = 2;
    -> $$
Query OK, 0 rows affected (0.001 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [dbtoko]> SElECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |          1 | selesai        |
|  2 | 2022-02-02 |  30000 |            1 |          2 | belum          |
|  3 | 2021-01-01 | 150000 |            2 |          3 | belum          |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.029 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | lunas             |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> UPDATE pembayaran SET status_pembayaran = 'belum lunas' WHERE id = 6;
    -> $$
Query OK, 1 row affected (0.049 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> SElECT * FROM pesanan;
    -> $$
+----+------------+--------+--------------+------------+----------------+
| id | tanggal    | total  | pelanggan_id | pesanan_id | status_pesanan |
+----+------------+--------+--------------+------------+----------------+
|  1 | 2023-03-03 | 200000 |            1 |          1 | selesai        |
|  2 | 2022-02-02 |  30000 |            1 |          2 | belum          |
|  3 | 2021-01-01 | 150000 |            2 |          3 | belum          |
+----+------------+--------+--------------+------------+----------------+
3 rows in set (0.001 sec)

MariaDB [dbtoko]> SELECT * FROM pembayaran;
    -> $$
+----+------------+------------+----------+------+------------+---------------+-------------------+
| id | nokuitansi | tanggal    | jumlah   | ke   | pesanan_id | pembayaran_id | status_pembayaran |
+----+------------+------------+----------+------+------------+---------------+-------------------+
|  5 | 0001       | 2021-02-12 |  2000000 |    1 |          1 |             1 | belum lunas       |
|  6 | 0002       | 2021-04-14 | 12000000 |    2 |          2 |             2 | belum lunas       |
+----+------------+------------+----------+------+------------+---------------+-------------------+
2 rows in set (0.001 sec)

MariaDB [dbtoko]> INSERT INTO pembayaran (pembayaran_id, pesanan_id, status_pembayaran) VALUES (3, 1, 'lunas');
    -> $$
ERROR 1442 (HY000): Cant update table 'pembayaran' in stored function/trigger because it is already used by statement which invoked this stored function/trigger