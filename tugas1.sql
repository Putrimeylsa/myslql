--  Membuat table produk
    CREATE table produk (
    -> id int not null auto_increment primary key,
    -> kode varchar (10) unique,
    -> nama VARCHAR (45) not null,
    -> harga_beli double,
    -> harga_jual double,
    -> stok int,
    -> min_stok int,
    -> jenis_produk_id int not null references jenis_produk (id)
    -> );
--  Membuat table pesanan_items
    CREATE table pesanan_items (
    -> id int not null auto_increment primary key,
    -> jenis_id int not null references produk (id),
    -> pesanan_id int not null references produk (id),
    -> qty int,
    -> harga double
    -> );
--  Membuat table vendor
    CREATE table vendor (
    -> id int not null auto_increment primary key,
    -> nomor varchar (4),
    -> nama varchar (40),
    -> kota varchar (30),
    -> kontak varchar (30)
    -> );
--  Membuat table pembelian
    MariaDB [dbpos]> CREATE table pembelian (
    -> tanggal varchar (45),
    -> nomor varchar (10),
    -> produk_id int not null references produk (id),
    -> jumlah int,
    -> harga double,
    -> vendor_id int not null references vendor (id)
    -> );
--  Tambahkan kolom alamat pada pelanggan dengan tipe data varchar (40)
    ALTER table pelanggan add alamat varchar (40);
--  Ubah kolom nama pada pelanggan menjadi nama_pelanggan
    ALTER table pelanggan change nama nama_pelanggan varchar (45);
--  edit tipe data nama_pelanggan menjadi varchar(50)
    ALTER table pelanggan MODIFY nama_pelanggan varchar (50);