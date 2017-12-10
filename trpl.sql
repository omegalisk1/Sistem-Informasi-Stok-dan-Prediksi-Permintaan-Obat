-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2017 at 10:56 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trpl`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `jabatan` enum('petugas gudang','supervisor','supplier','admin') NOT NULL,
  `nomor_telepon` varchar(13) NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `atasan` varchar(12) DEFAULT NULL,
  `alamat_apotek` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`username`, `password`, `jabatan`, `nomor_telepon`, `tanggal_dibuat`, `atasan`, `alamat_apotek`) VALUES
('admin', 'admin', 'admin', '087857423338', '2017-11-12 17:22:01', NULL, ''),
('user01', 'user01', 'supervisor', '087857421111', '2017-11-13 05:12:21', NULL, 'Jalan 123'),
('user02', 'user02', 'petugas gudang', '087857422222', '2017-11-12 09:37:24', 'user01', ''),
('user03', 'user03', 'supplier', '087857423333', '2017-10-24 05:01:18', NULL, ''),
('user04', 'user04', 'supplier', '087857424444', '2017-10-24 05:01:37', NULL, ''),
('user05', 'user05', 'petugas gudang', '0888', '2017-11-13 08:33:53', 'user01', NULL),
('user06', 'user06', 'supervisor', '07777', '2017-11-14 08:26:24', NULL, 'Jalan 321'),
('user07', 'user07', 'petugas gudang', '06666', '2017-11-13 16:23:15', 'user06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `histori`
--

CREATE TABLE `histori` (
  `id_histori` int(11) NOT NULL,
  `nomor_obat` varchar(20) NOT NULL,
  `petugas` varchar(12) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('data baru','penambahan','pengurangan','data dihapus') NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `histori`
--

INSERT INTO `histori` (`id_histori`, `nomor_obat`, `petugas`, `tanggal`, `status`, `jumlah`) VALUES
(1, '4', 'user02', '2017-11-13 16:09:48', 'data baru', 40),
(2, '4', 'user02', '2017-11-13 16:09:53', 'data dihapus', -40),
(3, '3', 'user02', '2017-11-13 16:10:03', 'pengurangan', -10),
(4, '3', 'user02', '2017-11-13 16:10:08', 'penambahan', 10),
(5, '3', 'user02', '2017-11-13 16:10:18', 'pengurangan', -10),
(6, '4', 'user05', '2017-11-13 16:11:50', 'data baru', 40),
(7, '1', 'user07', '2017-11-13 16:27:13', 'data baru', 20),
(8, '2', 'user07', '2017-11-13 16:27:21', 'data baru', 10),
(9, '1', 'user02', '2017-10-11 17:00:00', 'pengurangan', -100),
(10, '1', 'user02', '2017-09-09 17:00:00', 'pengurangan', -150),
(11, '1', 'user02', '2017-11-13 18:13:32', 'pengurangan', -120),
(12, '1', 'user07', '2017-11-13 16:27:13', 'pengurangan', -20),
(13, '4', 'user02', '2017-11-16 05:39:42', 'data dihapus', -40);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `nomor_obat` varchar(20) NOT NULL,
  `nama_obat` varchar(20) NOT NULL,
  `deskripsi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`nomor_obat`, `nama_obat`, `deskripsi`) VALUES
('1', 'a', 'a'),
('2', 'b', 'b'),
('3', 'c', 'c'),
('4', 's', '');

-- --------------------------------------------------------

--
-- Table structure for table `penawaran`
--

CREATE TABLE `penawaran` (
  `id_penawaran` int(11) NOT NULL,
  `id_permintaan` int(11) NOT NULL,
  `supplier` varchar(12) NOT NULL,
  `jumlah_obat` int(11) NOT NULL,
  `harga_obat` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `jumlah_diminta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penawaran`
--

INSERT INTO `penawaran` (`id_penawaran`, `id_permintaan`, `supplier`, `jumlah_obat`, `harga_obat`, `status`, `jumlah_diminta`) VALUES
(1, 1, 'user03', 50, 1000, 0, NULL),
(2, 1, 'user03', 50, 2000, 0, NULL),
(3, 1, 'user03', 100, 3000, 1, 75),
(4, 2, 'user03', 30, 3000, 0, NULL),
(5, 2, 'user03', 30, 5000, 1, 20),
(6, 1, 'user04', 25, 2000, 1, 25),
(7, 2, 'user04', 200, 2000, 1, 30),
(8, 3, 'user04', 100, 1000, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `permintaan`
--

CREATE TABLE `permintaan` (
  `id_permintaan` int(11) NOT NULL,
  `nomor_obat` varchar(20) NOT NULL,
  `jumlah_permintaan` int(11) NOT NULL,
  `supervisor` varchar(12) NOT NULL,
  `tanggal_permintaan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('terpenuhi','belum terpenuhi') NOT NULL DEFAULT 'belum terpenuhi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permintaan`
--

INSERT INTO `permintaan` (`id_permintaan`, `nomor_obat`, `jumlah_permintaan`, `supervisor`, `tanggal_permintaan`, `status`) VALUES
(1, '1', 100, 'user01', '2017-11-13 16:46:58', 'terpenuhi'),
(2, '2', 50, 'user01', '2017-11-13 16:47:09', 'terpenuhi'),
(3, '2', 21, 'user06', '2017-11-13 17:52:39', 'terpenuhi'),
(4, '3', 16, 'user01', '2017-11-13 17:55:55', 'belum terpenuhi'),
(5, '3', 16, 'user01', '2017-11-13 17:57:19', 'belum terpenuhi');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `nomor_obat` varchar(20) NOT NULL,
  `supervisor` varchar(12) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`nomor_obat`, `supervisor`, `jumlah`) VALUES
('1', 'user01', 10),
('2', 'user01', 20),
('3', 'user01', 30),
('1', 'user06', 20),
('2', 'user06', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `histori`
--
ALTER TABLE `histori`
  ADD PRIMARY KEY (`id_histori`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`nomor_obat`);

--
-- Indexes for table `penawaran`
--
ALTER TABLE `penawaran`
  ADD PRIMARY KEY (`id_penawaran`);

--
-- Indexes for table `permintaan`
--
ALTER TABLE `permintaan`
  ADD PRIMARY KEY (`id_permintaan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `histori`
--
ALTER TABLE `histori`
  MODIFY `id_histori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `penawaran`
--
ALTER TABLE `penawaran`
  MODIFY `id_penawaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `permintaan`
--
ALTER TABLE `permintaan`
  MODIFY `id_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
