-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 01:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_spp_ukk`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `Id Kelas` char(10) NOT NULL,
  `Tingkatan` enum('X','XII','XIII') NOT NULL,
  `Kopetensi Keahlian` enum('PPLG','Akuntansi') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`Id Kelas`, `Tingkatan`, `Kopetensi Keahlian`) VALUES
('1234567891', 'X', 'PPLG');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `Id Pebayaran` char(10) NOT NULL,
  `Id Petugas` char(10) NOT NULL,
  `NISN` char(10) NOT NULL,
  `Pembayaran` enum('SPP','DPS') NOT NULL,
  `Jumah Bayar` int(20) NOT NULL,
  `Tanggal Bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`Id Pebayaran`, `Id Petugas`, `NISN`, `Pembayaran`, `Jumah Bayar`, `Tanggal Bayar`) VALUES
('1000000001', '1234567890', '0000000001', 'DPS', 2000000, '2023-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `Id Petugas` char(10) NOT NULL,
  `Nama Petugas` varchar(50) NOT NULL,
  `Level petugas` enum('Admin','Petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`Id Petugas`, `Nama Petugas`, `Level petugas`) VALUES
('1234567890', 'Ismu', 'Petugas');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `Id Siswa` char(10) NOT NULL,
  `NISN` char(10) NOT NULL,
  `NAMA` varchar(50) NOT NULL,
  `Id Kelas` char(5) NOT NULL,
  `Id Pembayaran` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`Id Kelas`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`Id Pebayaran`),
  ADD UNIQUE KEY `Id Pebayaran` (`Id Pebayaran`,`Id Petugas`,`NISN`),
  ADD KEY `Id Petugas` (`Id Petugas`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`Id Petugas`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NISN`),
  ADD UNIQUE KEY `Id Siswa` (`Id Siswa`,`Id Kelas`,`Id Pembayaran`),
  ADD KEY `Id Pembayaran` (`Id Pembayaran`),
  ADD KEY `Id Kelas` (`Id Kelas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`Id Petugas`) REFERENCES `petugas` (`Id Petugas`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`Id Pembayaran`) REFERENCES `pembayaran` (`Id Pebayaran`),
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`Id Kelas`) REFERENCES `kelas` (`Id Kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
