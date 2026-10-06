CREATE DATABASE IF NOT EXISTS db_tokoonline
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE db_tokoonline;

CREATE TABLE IF NOT EXISTS kategori (
    id_kategori INT NOT NULL AUTO_INCREMENT,
    nama_kategori VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_kategori)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS pelanggan (
    id_pelanggan INT NOT NULL AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    no_hp VARCHAR(100) NOT NULL,
    alamat VARCHAR(100) NOT NULL,
    kota VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_pelanggan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS produk (
    id_produk INT NOT NULL AUTO_INCREMENT,
    id_kategori INT DEFAULT NULL,
    nama_produk VARCHAR(100) NOT NULL,
    harga VARCHAR(100) NOT NULL,
    stok INT NOT NULL,
    PRIMARY KEY (id_produk),
    KEY produk_kategori_FK (id_kategori),
    CONSTRAINT produk_kategori_FK
        FOREIGN KEY (id_kategori) REFERENCES kategori (id_kategori)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS penjualan (
    id_penjualan INT NOT NULL AUTO_INCREMENT,
    id_pelanggan INT DEFAULT NULL,
    id_produk INT DEFAULT NULL,
    jumlah INT NOT NULL,
    total_harga VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_penjualan),
    KEY penjualan_pelanggan_FK (id_pelanggan),
    KEY penjualan_produk_FK (id_produk),
    CONSTRAINT penjualan_pelanggan_FK
        FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan),
    CONSTRAINT penjualan_produk_FK
        FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
