-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2021 at 03:55 AM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mutiaract_cos`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_BARANG` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) DEFAULT NULL,
  `ID_SUPPLIER` int(11) DEFAULT NULL,
  `ID_SATUAN` int(11) DEFAULT NULL,
  `NAMA_BARANG` varchar(50) DEFAULT NULL,
  `STOK_BARANG` int(11) DEFAULT NULL,
  `HARGA_BELI_BARANG` int(11) DEFAULT NULL,
  `HARGA_JUAL_BARANG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_BARANG`, `ID_PENGGUNA`, `ID_SUPPLIER`, `ID_SATUAN`, `NAMA_BARANG`, `STOK_BARANG`, `HARGA_BELI_BARANG`, `HARGA_JUAL_BARANG`) VALUES
(1, 4, 1, 5, 'Baju', 98, 20000, 30000),
(2, 4, 4, 5, 'Tas', 83, 30000, 45000),
(3, 4, 1, 5, 'Sepatu', 99, 80000, 120000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesan_ulang`
--

CREATE TABLE `detail_pesan_ulang` (
  `ID_DETAIL_PESAN_ULANG` int(11) NOT NULL,
  `ID_PESAN_ULANG` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `JUMLAH_PESAN_ULANG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pesan_ulang`
--

INSERT INTO `detail_pesan_ulang` (`ID_DETAIL_PESAN_ULANG`, `ID_PESAN_ULANG`, `ID_BARANG`, `JUMLAH_PESAN_ULANG`) VALUES
(3, 4, 1, 100),
(4, 4, 2, 100),
(5, 5, 1, 100),
(6, 5, 2, 100),
(7, 6, 2, 10),
(8, 6, 4, 10),
(9, 7, 3, 10),
(10, 8, 1, 60),
(11, 9, 2, 100),
(12, 10, 3, 10),
(13, 10, 3, 20),
(14, 11, 1, 10),
(15, 12, 1, 10),
(16, 13, 3, 20),
(17, 14, 3, 20),
(18, 15, 1, 40),
(19, 18, 1, 1000),
(20, 16, 2, 5),
(21, 16, 1, 1),
(22, 16, 3, 1),
(23, 18, 1, 6),
(24, 19, 2, 10),
(25, 19, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `detail_surat_jalan`
--

CREATE TABLE `detail_surat_jalan` (
  `ID_DETAIL_SURAT_JALAN` int(11) NOT NULL,
  `ID_SURAT_JALAN` int(11) NOT NULL,
  `ID_BARANG` int(11) NOT NULL,
  `JUMLAH_BAWA` int(11) NOT NULL,
  `JUMLAH_SISA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_surat_jalan`
--

INSERT INTO `detail_surat_jalan` (`ID_DETAIL_SURAT_JALAN`, `ID_SURAT_JALAN`, `ID_BARANG`, `JUMLAH_BAWA`, `JUMLAH_SISA`) VALUES
(15, 9, 1, 10, 0),
(16, 9, 2, 15, 5),
(17, 10, 1, 5, 0),
(18, 10, 2, 5, 0),
(19, 11, 2, 10, 0),
(20, 12, 1, 10, 0),
(21, 12, 2, 15, 0),
(22, 13, 2, 10, 5),
(23, 14, 3, 30, 0),
(24, 14, 1, 100, 10),
(25, 14, 2, 250, 50),
(32, 17, 3, 30, 0),
(33, 17, 1, 100, 0),
(34, 15, 3, 30, 0),
(35, 15, 1, 60, 0),
(36, 16, 1, 50, 0),
(37, 17, 1, 5, 0),
(38, 18, 1, 50, 4),
(39, 19, 2, 12, 12),
(43, 20, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gps`
--

CREATE TABLE `gps` (
  `IDGPS` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) NOT NULL,
  `LATITUDE` varchar(100) NOT NULL,
  `LONGTITUDE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gps`
--

INSERT INTO `gps` (`IDGPS`, `ID_PENGGUNA`, `LATITUDE`, `LONGTITUDE`) VALUES
(82, 5, '-7.4511557', '112.7007179');

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses`
--

CREATE TABLE `hak_akses` (
  `ID_HAK_AKSES` int(11) NOT NULL,
  `HAK_AKSES` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hak_akses`
--

INSERT INTO `hak_akses` (`ID_HAK_AKSES`, `HAK_AKSES`) VALUES
(1, 'Admin'),
(2, 'Supervisor'),
(3, 'Gudang'),
(4, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'masrizal', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_hak_akses`
--

CREATE TABLE `menu_hak_akses` (
  `ID_MENU_HAK_AKSES` int(11) NOT NULL,
  `ID_HAK_AKSES` int(11) DEFAULT NULL,
  `ID_MENU_PENGGUNA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_hak_akses`
--

INSERT INTO `menu_hak_akses` (`ID_MENU_HAK_AKSES`, `ID_HAK_AKSES`, `ID_MENU_PENGGUNA`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 11),
(5, 3, 9),
(6, 4, 10),
(9, 2, 2),
(19, 3, 5),
(20, 4, 4),
(21, 3, 2),
(22, 4, 2),
(23, 2, 6),
(24, 2, 7),
(25, 3, 7),
(26, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `menu_pengguna`
--

CREATE TABLE `menu_pengguna` (
  `ID_MENU_PENGGUNA` int(11) NOT NULL,
  `MENU_PENGGUNA` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_pengguna`
--

INSERT INTO `menu_pengguna` (`ID_MENU_PENGGUNA`, `MENU_PENGGUNA`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Sales'),
(5, 'Gudang'),
(6, 'Supervisor'),
(7, 'Laporan'),
(8, 'Halaman Utama'),
(9, 'Halaman Utama'),
(10, 'Halaman Utama'),
(11, 'Halaman Utama');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_PELANGGAN` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) DEFAULT NULL,
  `NAMA_PELANGGAN` varchar(50) DEFAULT NULL,
  `EMAIL_PELANGGAN` varchar(50) DEFAULT NULL,
  `NO_HP_PELANGGAN` varchar(13) DEFAULT NULL,
  `ALAMAT_PELANGGAN` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`ID_PELANGGAN`, `ID_PENGGUNA`, `NAMA_PELANGGAN`, `EMAIL_PELANGGAN`, `NO_HP_PELANGGAN`, `ALAMAT_PELANGGAN`) VALUES
(2, 5, 'Prasakul', 'prasaku@gmail.com', '0812442844822', 'Jalan Sapi Gede No.201'),
(3, 7, 'Dimas', 'dimas@gmail.com', '081133334546', 'Jalan Perak Timur'),
(4, 5, 'Hendro', 'hendero@gmail.com', '082288222233', 'jombang jawa timur'),
(5, 7, 'Reza', 'rezauhuii@gmail.com', '082333828000', 'bekasi, jakarta'),
(6, 5, 'irwan', 'irwan123@gmail.com', '082444555122', 'sidoarjo'),
(7, 5, 'iman', 'khaeruliman@gmail.com', '0855345321654', 'sidoarjo'),
(8, 5, 'masrizal', 'masrizal04@gmail.com', '089695615256', 'Kendal Pecabean RT 03 RW 01'),
(9, 5, 'aris', 'aris@gmail.com', '0896555122', 'kendal'),
(12, 9, 'Tes', 'pijardwi.pd@gmail.com', '089620127873', 'qwerty'),
(13, 5, 'masru', 'masrizalsn@gmail.com', '0885124516', 'kendalcabe'),
(15, 5, 'Zaidanudin', 'zaidan@gmail.com', '0891231456123', 'Mojokerto'),
(17, 5, 'zilong', 'zilong@gmail.com', '08112311123', 'Kendari'),
(18, 5, 'didin', 'gera@gmail.com', '08774441231', 'kendal'),
(19, 5, 'dodot', 'dodot@gmail.com', '082123145611', 'Candi'),
(20, 10, 'Pijar', 'pijardwi.pd@gmail.com', '081244284482', 'Jayanegara'),
(22, 5, 'wakti', 'wak@gmail.com', '0891241441', 'kendal'),
(25, 5, 'win', 'win@gmail.com', '085242222111', 'surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `ID_PENGEMBALIAN` int(11) NOT NULL,
  `ID_PENJUALAN` int(11) DEFAULT NULL,
  `TGL_PENGEMBALIAN` date DEFAULT NULL,
  `JUMLAH_PENGEMBALIAN` int(11) DEFAULT NULL,
  `KETERANGAN_PENGEMBALIAN` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`ID_PENGEMBALIAN`, `ID_PENJUALAN`, `TGL_PENGEMBALIAN`, `JUMLAH_PENGEMBALIAN`, `KETERANGAN_PENGEMBALIAN`) VALUES
(6, 8, '2020-10-16', 2, 'Barang Cacat'),
(7, 10, '2020-10-23', 1, 'Barang Cacat'),
(8, 11, '2020-10-24', 1, 'Tidak ada'),
(9, 8, '2020-10-15', 1, 'rusak'),
(10, 14, '2020-10-27', 90, '10 barangr usak'),
(11, 14, '2020-10-27', 90, '10 barangr usak, 80 kadaluarsa'),
(12, 15, '2020-10-27', 200, 'barang tidak laku'),
(13, 15, '2020-10-27', 50, 'barang tidak laku'),
(14, 14, '2020-10-27', 10, '10 barangr usak'),
(15, 8, '2021-01-25', 2, 'Cacat bro'),
(16, 8, '2021-01-26', 1, 'cacat');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_PENGGUNA` int(11) NOT NULL,
  `ID_HAK_AKSES` int(11) DEFAULT NULL,
  `NAMA_PENGGUNA` varchar(50) DEFAULT NULL,
  `EMAIL_PENGGUNA` varchar(100) DEFAULT NULL,
  `FOTO_PENGGUNA` varchar(100) DEFAULT NULL,
  `PASSWORD_PENGGUNA` varchar(500) DEFAULT NULL,
  `STATUS_AKTIF_PENGGUNA` int(11) DEFAULT NULL,
  `TGL_DAFTAR_PENGGUNA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`ID_PENGGUNA`, `ID_HAK_AKSES`, `NAMA_PENGGUNA`, `EMAIL_PENGGUNA`, `FOTO_PENGGUNA`, `PASSWORD_PENGGUNA`, `STATUS_AKTIF_PENGGUNA`, `TGL_DAFTAR_PENGGUNA`) VALUES
(1, 1, 'Pijar Dwi Kusuma', 'pijardwi.pd@gmail.com', 'swift2.png', '$2y$10$ahwcT4su2Dn7T5kcZOpdbesqyDwQOx9/cw1hoMifPtPo8iry4a2hu', 1, '2020-10-05'),
(3, 2, 'mohammad zaidan salim', 'supervisor@gmail.com', 'zaid.jpg', '$2y$10$hE7CiKLW/X8cr66yvD5zuOPlXvsHgCyC9PlGngZj5cSE5S/e/fJNS', 1, '2020-10-05'),
(4, 3, 'Gudang MCT', 'gudang@gmail.com', '043552900_1572858828-71890045_694906974353654_3305990052531100815_n.jpg', '$2y$10$dT/Yf9OD3Lg1eI2AshUOhu0OmU6K2bJiwuRgbBIIsI5s5oJ4sUbZe', 1, '2020-10-05'),
(5, 4, 'Dewi', 'sales@gmail.com', '5Dewi.jpg', '$2y$10$ABk1LdRjt526vkB2kuquA.XhnhCIn25EWL1QTS3tH5ahqnM.JymAC', 1, '2020-10-05'),
(7, 4, 'Dian', 'sales2@gmail.com', '49966-artis-tik-tok-nadira-zerlinda-suaracomismail.jpg', '$2y$10$NevsXUioV59InL.j5xxVduewl7rSlNVRudB5Ccni1yxB6Mhfw8ajy', 1, '2020-10-23'),
(9, 4, 'yuliant', 'masrizal04@gmail.com', 'default.jpg', '$2y$10$ILmRxHx7o6mIEiai4NDVveyLKYZdEMLyG6P.rojPmYK8DyiaBvp3C', 1, '2020-12-16'),
(10, 4, 'Pijar Dwi Kusuma', 'pijardwikusuma@gmail.com', 'default.jpg', '$2y$10$UVGU9i0hSb/df1OhGHTuNuxzJwz6FYxDh/DVi4RcsYckJ3iNpbksW', 1, '2020-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `ID_PENJUALAN` int(11) NOT NULL,
  `ID_DETAIL_SURAT_JALAN` int(11) DEFAULT NULL,
  `ID_PENGGUNA` int(11) NOT NULL,
  `ID_PELANGGAN` int(11) DEFAULT NULL,
  `TGL_PENJUALAN` date DEFAULT NULL,
  `JUMLAH_PENJUALAN` int(11) DEFAULT NULL,
  `STATUS_PEMBAYARAN_PENJUALAN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`ID_PENJUALAN`, `ID_DETAIL_SURAT_JALAN`, `ID_PENGGUNA`, `ID_PELANGGAN`, `TGL_PENJUALAN`, `JUMLAH_PENJUALAN`, `STATUS_PEMBAYARAN_PENJUALAN`) VALUES
(8, 15, 5, 2, '2020-10-16', 7, 'Transfer'),
(9, 19, 5, 2, '2020-10-23', 10, 'Tunai'),
(10, 20, 7, 3, '2020-10-23', 5, 'Tunai'),
(11, 22, 5, 2, '2020-10-24', 5, 'Tunai'),
(12, 15, 5, 2, '2020-10-31', 1, 'Tunai'),
(13, 15, 5, 2, '2020-10-31', 2, 'Transfer'),
(14, 24, 5, 4, '2020-10-27', 90, 'Tunai'),
(15, 25, 5, 2, '2020-10-27', 200, 'Transfer'),
(16, 23, 5, 4, '2020-10-27', 30, 'Transfer'),
(17, 35, 7, 5, '2020-10-28', 50, 'Tunai'),
(18, 34, 7, 5, '2020-10-28', 15, 'Tunai'),
(19, 20, 7, 3, '2020-10-28', 5, 'Transfer'),
(20, 34, 7, 3, '2020-10-28', 15, 'Transfer'),
(21, 35, 7, 3, '2020-10-28', 10, 'Transfer'),
(22, 21, 7, 3, '2020-10-28', 15, 'Tunai'),
(23, 38, 5, 2, '2020-11-27', 40, 'Transfer'),
(24, 16, 5, 23, '2021-01-21', 5, 'Transfer'),
(25, 38, 5, 23, '2021-01-21', 1, 'Transfer'),
(26, 38, 5, 23, '2021-01-27', 5, 'Transfer'),
(27, 16, 5, 15, '2021-01-28', 5, 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `pesan_ulang`
--

CREATE TABLE `pesan_ulang` (
  `ID_PESAN_ULANG` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) NOT NULL,
  `ID_PELANGGAN` int(11) NOT NULL,
  `TGL_PESAN_ULANG` date NOT NULL,
  `STATUS_PESAN_ULANG` varchar(1) NOT NULL,
  `STATUS_PEMBAYARAN_PESAN_ULANG` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesan_ulang`
--

INSERT INTO `pesan_ulang` (`ID_PESAN_ULANG`, `ID_PENGGUNA`, `ID_PELANGGAN`, `TGL_PESAN_ULANG`, `STATUS_PESAN_ULANG`, `STATUS_PEMBAYARAN_PESAN_ULANG`) VALUES
(4, 5, 2, '2020-10-23', '1', 'Tunai'),
(5, 5, 2, '2020-10-31', '2', 'Transfer'),
(6, 5, 2, '2020-10-24', '1', 'Tunai'),
(7, 5, 2, '2020-10-27', '1', 'Transfer'),
(8, 5, 4, '2020-10-27', '1', 'Transfer'),
(9, 5, 2, '2020-10-27', '1', 'Tunai'),
(10, 7, 3, '2020-10-28', '2', 'Tunai'),
(11, 5, 2, '2020-11-02', '1', 'Transfer'),
(12, 7, 3, '2020-11-02', '1', 'Transfer'),
(13, 5, 2, '2020-11-02', '1', 'Transfer'),
(14, 7, 3, '2020-11-02', '2', 'Transfer'),
(15, 5, 2, '2020-11-28', '1', 'Transfer'),
(16, 5, 23, '2021-01-15', '1', 'Transfer'),
(17, 5, 15, '2021-01-18', '0', 'Tunai'),
(18, 5, 17, '2021-01-18', '0', 'Transfer'),
(19, 5, 8, '2021-01-19', '0', 'Tunai'),
(20, 5, 9, '2021-01-27', '0', 'Tunai'),
(21, 5, 25, '2021-01-27', '0', 'Transfer'),
(22, 5, 17, '2021-01-30', '0', 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `ID_SATUAN` int(11) NOT NULL,
  `NAMA_SATUAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`ID_SATUAN`, `NAMA_SATUAN`) VALUES
(1, 'Kg'),
(5, 'pcs'),
(6, 'Dus');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu_pengguna`
--

CREATE TABLE `sub_menu_pengguna` (
  `ID_SUB_MENU_PENGGUNA` int(11) NOT NULL,
  `ID_MENU_PENGGUNA` int(11) DEFAULT NULL,
  `JUDUL_SUB_MENU_PENGGUNA` varchar(100) DEFAULT NULL,
  `URL_SUB_MENU_PENGGUNA` varchar(100) DEFAULT NULL,
  `GAMBAR_SUB_MENU_PENGGUNA` varchar(100) DEFAULT NULL,
  `STATUS_AKTIF_SUB_MENU_PENGGUNA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_menu_pengguna`
--

INSERT INTO `sub_menu_pengguna` (`ID_SUB_MENU_PENGGUNA`, `ID_MENU_PENGGUNA`, `JUDUL_SUB_MENU_PENGGUNA`, `URL_SUB_MENU_PENGGUNA`, `GAMBAR_SUB_MENU_PENGGUNA`, `STATUS_AKTIF_SUB_MENU_PENGGUNA`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 0),
(2, 2, 'Profil Saya', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Ubah Profil', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Manajemen Menu', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Manajemen Sub Menu', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(6, 1, 'Hak Akses', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(7, 2, 'Ganti Password', 'user/changepassword', 'fas fa-fw fa-key', 1),
(11, 1, 'Kelola Pengguna', 'admin/kelolaUser', 'fas fa-fw fa-users-cog', 1),
(12, 5, 'Daftar Supplier', 'gudang/supplier', 'fas fa-fw fa-folder', 1),
(13, 5, 'Daftar Barang', 'gudang/barang', 'fas fa-fw fa-folder', 1),
(14, 5, 'Daftar Satuan', 'gudang/satuan', 'fas fa-fw fa-folder', 1),
(15, 4, 'Daftar Pelanggan', 'sales/pelanggan', 'fas fa-fw fa-folder', 1),
(17, 4, 'Daftar Surat Jalan', 'sales/surat_jalan', 'fas fa-fw fa-folder', 1),
(18, 6, 'Verifikasi Surat Jalan', 'supervisor/verif_surat_jalan', 'fas fa-fw fa-folder', 1),
(19, 4, 'Pesan Ulang', 'sales/pesan_ulang', 'fas fa-fw fa-folder', 1),
(20, 6, 'Verif Pesan Ulang', 'supervisor/verif_pesan_ulang', 'fas fa-fw fa-folder', 1),
(21, 7, 'Laporan Penjualan', 'laporan/penjualan', 'fas fa-fw fa-folder', 1),
(22, 7, 'Laporan Pengembalian', 'laporan/pengembalian', 'fas fa-fw fa-folder', 1),
(23, 7, 'Laporan Pesan Ulang', 'laporan/pesanulang', 'fas fa-fw fa-folder', 1),
(27, 10, 'Dasbor', 'sales/dasbor', 'fas fa-fw fa-tachometer-alt', 1),
(28, 9, 'Dasbor', 'gudang/dasbor', 'fas fa-fw fa-tachometer-alt', 1),
(29, 11, 'Dasbor', 'supervisor/dasbor', 'fas fa-fw fa-tachometer-alt', 1),
(30, 6, 'Lacak Sales', 'supervisor/getgps', 'fas fa-map', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID_SUPPLIER` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) DEFAULT NULL,
  `NAMA_SUPPLIER` varchar(50) DEFAULT NULL,
  `EMAIL_SUPPLIER` varchar(50) DEFAULT NULL,
  `NO_HP_SUPPLIER` varchar(13) DEFAULT NULL,
  `ALAMAT_SUPPLIER` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID_SUPPLIER`, `ID_PENGGUNA`, `NAMA_SUPPLIER`, `EMAIL_SUPPLIER`, `NO_HP_SUPPLIER`, `ALAMAT_SUPPLIER`) VALUES
(1, 4, 'PT. Maju Bersama', 'majubersama@gmail.com', '089123111121', 'Kendal Pecabean RT02'),
(4, 4, 'PT. Keluarga Sejahtera', 'keluargasejatra@gmail.com', '08223333444', 'wonogiri');

-- --------------------------------------------------------

--
-- Table structure for table `surat_jalan`
--

CREATE TABLE `surat_jalan` (
  `ID_SURAT_JALAN` int(11) NOT NULL,
  `ID_PENGGUNA` int(11) DEFAULT NULL,
  `NO_SURAT_JALAN` varchar(50) NOT NULL,
  `STATUS_SURAT_JALAN` int(1) NOT NULL DEFAULT 0,
  `TGL_SURAT_JALAN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surat_jalan`
--

INSERT INTO `surat_jalan` (`ID_SURAT_JALAN`, `ID_PENGGUNA`, `NO_SURAT_JALAN`, `STATUS_SURAT_JALAN`, `TGL_SURAT_JALAN`) VALUES
(9, 5, 'SRJ-000001', 1, '2020-10-16'),
(10, 5, 'SRJ-000002', 2, '2020-10-16'),
(11, 5, 'SRJ-000003', 1, '2020-10-23'),
(12, 7, 'SRJ-000004', 1, '2020-10-23'),
(13, 5, 'SRJ-000005', 1, '2020-10-24'),
(14, 5, 'SRJ-000006', 1, '2020-10-27'),
(15, 7, 'SRJ-000007', 1, '2020-10-28'),
(16, 5, 'SRJ-000008', 2, '2020-11-03'),
(17, 5, 'SRJ-000009', 2, '2020-11-10'),
(18, 5, 'SRJ-000010', 1, '2020-11-27'),
(19, 5, 'SRJ-000011', 0, '2021-01-21'),
(20, 5, 'SRJ-000012', 0, '2021-01-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_BARANG`),
  ADD KEY `FK_BARANG_SUPPLIER` (`ID_SUPPLIER`),
  ADD KEY `FK_PENGGUNA_BARANG` (`ID_PENGGUNA`),
  ADD KEY `FK_SATUAN_BARANG` (`ID_SATUAN`);

--
-- Indexes for table `detail_pesan_ulang`
--
ALTER TABLE `detail_pesan_ulang`
  ADD PRIMARY KEY (`ID_DETAIL_PESAN_ULANG`),
  ADD KEY `ID_PESAN_ULANG` (`ID_PESAN_ULANG`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indexes for table `detail_surat_jalan`
--
ALTER TABLE `detail_surat_jalan`
  ADD PRIMARY KEY (`ID_DETAIL_SURAT_JALAN`),
  ADD KEY `ID_SURAT_JALAN` (`ID_SURAT_JALAN`),
  ADD KEY `ID_BARANG` (`ID_BARANG`);

--
-- Indexes for table `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`IDGPS`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indexes for table `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`ID_HAK_AKSES`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_hak_akses`
--
ALTER TABLE `menu_hak_akses`
  ADD PRIMARY KEY (`ID_MENU_HAK_AKSES`),
  ADD KEY `FK_HAK_MENU` (`ID_HAK_AKSES`),
  ADD KEY `FK_MENU_HAK` (`ID_MENU_PENGGUNA`);

--
-- Indexes for table `menu_pengguna`
--
ALTER TABLE `menu_pengguna`
  ADD PRIMARY KEY (`ID_MENU_PENGGUNA`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_PELANGGAN`),
  ADD KEY `FK_PENGGUNA_PELANGGAN` (`ID_PENGGUNA`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`ID_PENGEMBALIAN`),
  ADD KEY `FK_PENGEMBALIAN_SURAT_JALAN` (`ID_PENJUALAN`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_PENGGUNA`),
  ADD KEY `FK_HAK_AKSES_PENGGUNA` (`ID_HAK_AKSES`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID_PENJUALAN`),
  ADD KEY `FK_PENJUALAN_PELANGGAN` (`ID_PELANGGAN`),
  ADD KEY `FK_PENJUALAN_SURAT_JALAN` (`ID_DETAIL_SURAT_JALAN`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`);

--
-- Indexes for table `pesan_ulang`
--
ALTER TABLE `pesan_ulang`
  ADD PRIMARY KEY (`ID_PESAN_ULANG`),
  ADD KEY `ID_PENGGUNA` (`ID_PENGGUNA`),
  ADD KEY `ID_PELANGGAN` (`ID_PELANGGAN`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`ID_SATUAN`);

--
-- Indexes for table `sub_menu_pengguna`
--
ALTER TABLE `sub_menu_pengguna`
  ADD PRIMARY KEY (`ID_SUB_MENU_PENGGUNA`),
  ADD KEY `FK_MENU_SUB` (`ID_MENU_PENGGUNA`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID_SUPPLIER`),
  ADD KEY `FK_PENGGUNA_SUPPLIER` (`ID_PENGGUNA`);

--
-- Indexes for table `surat_jalan`
--
ALTER TABLE `surat_jalan`
  ADD PRIMARY KEY (`ID_SURAT_JALAN`),
  ADD KEY `FK_SURAT_JALAN_PENGGUNA` (`ID_PENGGUNA`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID_BARANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detail_pesan_ulang`
--
ALTER TABLE `detail_pesan_ulang`
  MODIFY `ID_DETAIL_PESAN_ULANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `detail_surat_jalan`
--
ALTER TABLE `detail_surat_jalan`
  MODIFY `ID_DETAIL_SURAT_JALAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `gps`
--
ALTER TABLE `gps`
  MODIFY `IDGPS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `ID_HAK_AKSES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_hak_akses`
--
ALTER TABLE `menu_hak_akses`
  MODIFY `ID_MENU_HAK_AKSES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `menu_pengguna`
--
ALTER TABLE `menu_pengguna`
  MODIFY `ID_MENU_PENGGUNA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `ID_PELANGGAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `ID_PENGEMBALIAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `ID_PENGGUNA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID_PENJUALAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pesan_ulang`
--
ALTER TABLE `pesan_ulang`
  MODIFY `ID_PESAN_ULANG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `ID_SATUAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_menu_pengguna`
--
ALTER TABLE `sub_menu_pengguna`
  MODIFY `ID_SUB_MENU_PENGGUNA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID_SUPPLIER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `surat_jalan`
--
ALTER TABLE `surat_jalan`
  MODIFY `ID_SURAT_JALAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
