-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 07:54 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `himmasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `views` int(11) NOT NULL,
  `insert_by` int(11) NOT NULL,
  `insert_at` date NOT NULL,
  `update_by` int(11) NOT NULL,
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id_post`, `judul`, `isi`, `status`, `link`, `views`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(6, 'That Time I Got Reincarnated as a Slime', 'That Time I Got Reincarnated as a Slime    ', 'draft', 'that-time-i-got-reincarnated-as-a-slime', 0, 1, '2021-05-14', 1, '2021-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `tag_post`
--

CREATE TABLE `tag_post` (
  `id_tag_post` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `level`, `jabatan`, `foto`) VALUES
(1, 'Naufal Ulinnuha', 'naufal', '21232f297a57a5a743894a0e4a801fc3', 'superadmin', 'Ketua Divisi Puskominfo', '1.png'),
(2, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Anggota Advokesma', ''),
(3, 'Nurul Maftuchah', 'nurul', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'Anggota PSDM', '3.jpg'),
(4, 'Arif Yudha Wibisono', 'arif', 'e10adc3949ba59abbe56e057f20f883e', 'superadmin', 'Ketua Divisi DMB', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `insert_by` (`insert_by`,`update_by`),
  ADD KEY `post_update_by` (`update_by`);

--
-- Indexes for table `tag_post`
--
ALTER TABLE `tag_post`
  ADD PRIMARY KEY (`id_tag_post`),
  ADD KEY `id_post` (`id_post`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tag_post`
--
ALTER TABLE `tag_post`
  MODIFY `id_tag_post` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_insert_by` FOREIGN KEY (`insert_by`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_update_by` FOREIGN KEY (`update_by`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tag_post`
--
ALTER TABLE `tag_post`
  ADD CONSTRAINT `tag_post_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
