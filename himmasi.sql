-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2021 at 01:20 PM
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
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `departemen` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `tampil` varchar(50) NOT NULL,
  `urutan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id_dept` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `jumlah` int(2) NOT NULL,
  `logo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id_dept`, `nama`, `deskripsi`, `jumlah`, `logo`) VALUES
(1, 'Advokesma', 'Advokesma berasal dari 2 kata yaitu Advokasi dan Kesejahteraan Mahasiswa. Advokasi yang berarti perlindungan terhadap hak-hak mahasiswa. Kesejahteraan mahasiswa yang memiliki arti memberikan pelayanan bagi kebutuhan mahasiswa di himpunan Sistem Informasi', 10, 'Advokesma.jpg'),
(2, 'DMB', 'Departemen yang menaungi bidang olahraga dan seni yang juga sebagai sarana dan wadah bagi mahasiswa Sistem Informasi dalam menyalurkan aspirasi-aspirasi, serta mengembangkan minat dan bakat mahasiswa SI dalam bidang olehraga dan seni', 10, 'DMB.jpg'),
(3, 'PSDM', 'PSDM adalah singkatan dari Pengembangan Sumber Daya Mahasiswa. Departemen PSDM berfokus pada Pengembangan Internal Mahasiswa Sistem Informasi', 15, 'PSDM.png'),
(4, 'Puskominfo', 'Puskominfo (Pusat Komunikasi dan Informasi) bertanggungjawab atas kegiatan dokumentasi, pegembangan media, dan publikasi kinerja himpunan dalam membentuk citra HIMMASI Vokasi Universitas Brawijaya', 20, 'Puskominfo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id_file` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `format` varchar(50) NOT NULL,
  `upload_by` int(11) NOT NULL,
  `upload_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`id_file`, `nama`, `format`, `upload_by`, `upload_at`) VALUES
(1, 'coba1.jpg', '.jpg', 1, '2021-05-19'),
(2, 'coba2.jpg', 'jpg', 1, '2021-05-19'),
(3, 'coba3.jpg', 'jpg', 1, '2021-05-19'),
(4, 'coba4.jpg', 'jpg', 1, '2021-05-19'),
(5, 'coba5.jpg', 'jpg', 1, '2021-05-19'),
(8, 'mitsuha.png', 'png', 1, '2021-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `headline`
--

CREATE TABLE `headline` (
  `id_headline` int(11) NOT NULL,
  `headline1` varchar(50) NOT NULL,
  `headline2` varchar(50) NOT NULL,
  `visi` text NOT NULL,
  `misi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `id_logo` int(11) NOT NULL,
  `filosofi1` text NOT NULL,
  `filosofi2` text NOT NULL,
  `filosofi3` text NOT NULL,
  `filosofi4` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(6, 'That Time I Got Reincarnated as a Slime', '                        <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <span style=\"background-color: rgb(255, 255, 0);\">Ut enim ad minim veniam</span>, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </i>                ', 'draft', 'that-time-i-got-reincarnated-as-a-slime', 0, 1, '2021-05-14', 1, '2021-05-14'),
(7, 'Cara menghilangkan Stress', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.    ', 'trash', 'cara-menghilangkan-stress', 0, 1, '2021-05-15', 1, '2021-05-15'),
(8, 'Ada Alien di Luar Angkasa?', '<span style=\"font-family: &quot;Comic Sans MS&quot;;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span>    ', 'publish', 'ada-alien-di-luar-angkasa', 0, 1, '2021-05-16', 1, '2021-05-16'),
(10, 'Software Engineering (9th Edition)', '            <p style=\"text-align: justify; \">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.    </p>        ', 'publish', 'software-engineering-9th-edition', 0, 1, '2021-05-16', 1, '2021-05-17'),
(13, 'Longman Preparation Course for the TOEFL Test', 'Longman Preparation Course for the TOEFL Test    ', 'publish', 'longman-preparation-course-for-the-toefl-test', 0, 2, '2021-05-16', 2, '2021-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id_tag`, `tag`) VALUES
(1, 'Teknologi'),
(2, 'Info Kuliah'),
(3, 'Kuliner'),
(5, 'Pop Kultur');

-- --------------------------------------------------------

--
-- Table structure for table `tag_post`
--

CREATE TABLE `tag_post` (
  `id_tag_post` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag_post`
--

INSERT INTO `tag_post` (`id_tag_post`, `id_post`, `id_tag`) VALUES
(3, 13, 1),
(4, 13, 2),
(5, 10, 1),
(6, 10, 2),
(7, 10, 3);

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
(1, 'Naufal Ulinnuha', 'naufal', '21232f297a57a5a743894a0e4a801fc3', 'superadmin', 'Ketua Divisi Puskominfo', '1.jpg'),
(2, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Anggota Advokesma', ''),
(3, 'Nurul Maftuchah', 'nurul', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'Anggota PSDM', '3.jpg'),
(4, 'Arif Yudha Wibisono', 'arif', 'e10adc3949ba59abbe56e057f20f883e', 'superadmin', 'Ketua Divisi DMB', '4.jpg'),
(5, 'Naurah Fauziah Al-Zaend', 'naurah', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'Anggota DMB', '5.jpg'),
(7, 'Fenny Inriana', 'fenny', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'Anggota Puskominfo', ''),
(8, 'Salnan Ratih', 'salnan', 'e10adc3949ba59abbe56e057f20f883e', 'superadmin', 'Pembina Himmasi', '8.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_dept`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id_file`),
  ADD KEY `upload_by` (`upload_by`);

--
-- Indexes for table `headline`
--
ALTER TABLE `headline`
  ADD PRIMARY KEY (`id_headline`);

--
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id_logo`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `insert_by` (`insert_by`,`update_by`),
  ADD KEY `post_update_by` (`update_by`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indexes for table `tag_post`
--
ALTER TABLE `tag_post`
  ADD PRIMARY KEY (`id_tag_post`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_tag` (`id_tag`);

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
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_dept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `headline`
--
ALTER TABLE `headline`
  MODIFY `id_headline` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `id_logo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tag_post`
--
ALTER TABLE `tag_post`
  MODIFY `id_tag_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`upload_by`) REFERENCES `user` (`id_user`);

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
  ADD CONSTRAINT `tag_post_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tag_post_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
