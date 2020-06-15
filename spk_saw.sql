-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2017 at 04:57 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;


--
-- Database: `spk_saw`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `nama_alternatif` varchar(255) NOT NULL,
  `hasil_alternatif` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `nama_alternatif`, `hasil_alternatif`) VALUES
(7, 'a1', 34.2222222222222),
(8, 'a2', 36.2222222222222),
(9, 'a3', 13.8194444444445),
(10, 'a4', 33.55555555555553),
(11, 'a5', 38.11111111111113),
(12, 'a6', 30.00000000000003);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` varchar(255) NOT NULL,
  `tipe_kriteria` varchar(10) NOT NULL,
  `bobot_kriteria` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`, `tipe_kriteria`, `bobot_kriteria`) VALUES
(7, 'kriteria 1', 'benefit', 9),
(8, 'kriteria 2', 'benefit', 9),
(9, 'kriteria 3', 'benefit', 7),
(10, 'kriteria 4', 'benefit', 6),
(11, 'kriteria 5', 'benefit', 5),
(12, 'kriteria 6', 'cost', 4),
(13, 'kriteria 7', 'cost', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(6) NOT NULL,
  `ket_nilai` varchar(45) NOT NULL,
  `jum_nilai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `ket_nilai`, `jum_nilai`) VALUES
(8, 'Mutlak sangat penting dari', 9),
(9, 'Mendekati mutlak dari', 8),
(10, 'Sangat penting dari', 7),
(11, 'Mendekati sangat penting dari', 6),
(12, 'Lebih penting dari', 5),
(13, 'Mendekati lebih penting dari', 4),
(14, 'Sedikit lebih penting dari', 3),
(15, 'Mendekati sedikit lebih penting dari', 2),
(16, 'Sama penting dengan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `nama_lengkap`, `username`, `password`) VALUES
(1, 'Akmal', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'khairul fajri', 'user', 'ee11cbb19052e40b07aac0ca060c23ee');

-- --------------------------------------------------------

--
-- Table structure for table `rangking`
--

CREATE TABLE `rangking` (
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai_rangking` double NOT NULL,
  `nilai_normalisasi` double NOT NULL,
  `bobot_normalisasi` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rangking`
--

INSERT INTO `rangking` (`id_alternatif`, `id_kriteria`, `nilai_rangking`, `nilai_normalisasi`, `bobot_normalisasi`) VALUES
(7, 7, 9, 1, 9),
(7, 8, 8, 0.88888888888889, 8),
(7, 9, 7, 0.77777777777778, 5.4444444444444),
(7, 10, 6, 0.66666666666667, 4),
(7, 11, 5, 0.55555555555556, 2.7777777777778),
(7, 12, 4, 1, 4),
(7, 13, 3, 0.33333333333333, 1),
(8, 7, 9, 1, 9),
(8, 8, 8, 0.88888888888889, 8),
(8, 9, 7, 0.77777777777778, 5.4444444444444),
(8, 10, 6, 0.66666666666667, 4),
(8, 11, 5, 0.55555555555556, 2.7777777777778),
(8, 12, 4, 1, 4),
(8, 13, 1, 1, 3),
(9, 7, 1, 0.11111111111111, 1),
(9, 8, 2, 0.22222222222222, 2),
(9, 9, 3, 0.33333333333333, 2.3333333333333),
(9, 10, 4, 0.44444444444444, 2.6666666666667),
(9, 11, 5, 0.55555555555556, 2.7777777777778),
(9, 12, 6, 0.66666666666667, 2.6666666666667),
(9, 13, 8, 0.125, 0.375),
(10, 7, 9, 1, 9),
(10, 8, 8, 0.88888888888889, 8),
(10, 9, 7, 0.77777777777778, 5.4444444444444),
(10, 10, 6, 0.66666666666667, 4),
(10, 11, 5, 0.55555555555556, 2.7777777777778),
(10, 12, 4, 1, 4),
(10, 13, 9, 0.11111111111111, 0.33333333333333),
(11, 7, 9, 1, 9),
(11, 8, 9, 1, 9),
(11, 9, 9, 1, 7),
(11, 10, 9, 1, 6),
(11, 11, 9, 1, 5),
(11, 12, 9, 0.44444444444444, 1.7777777777778),
(11, 13, 9, 0.11111111111111, 0.33333333333333),
(12, 7, 9, 1, 9),
(12, 8, 9, 1, 9),
(12, 9, 2, 0.22222222222222, 1.5555555555556),
(12, 10, 5, 0.55555555555556, 3.3333333333333),
(12, 11, 9, 1, 5),
(12, 12, 9, 0.44444444444444, 1.7777777777778),
(12, 13, 9, 0.11111111111111, 0.33333333333333);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `rangking`
--
ALTER TABLE `rangking`
  ADD PRIMARY KEY (`id_alternatif`,`id_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `rangking`
--
ALTER TABLE `rangking`
  ADD CONSTRAINT `rangking_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`),
  ADD CONSTRAINT `rangking_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
