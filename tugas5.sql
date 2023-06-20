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

MariaDB [dbtoko]> create table pembayaran (
    id INT NOT NULL AUTO_INCREMENT,
  pesanan_id INT NOT NULL,
  tanggal DATE NOT NULL,
  jumlah_bayar DECIMAL(10, 2) NOT NULL,
  status_pembayaran VARCHAR(10) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
);

CREATE TRIGGER bayar_pesanan_trigger
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
  IF (SELECT SUM(jumlah) FROM pesanan WHERE id = NEW.pesanan_id) <= (SELECT SUM(jumlah_bayar) FROM pembayaran WHERE pesanan_id = NEW.pesanan_id) THEN
    UPDATE pembayaran SET status_pembayaran = 'lunas' WHERE id = NEW.id;
  END IF;
END;
