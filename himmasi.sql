-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2021 at 08:26 PM
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
  `id_dept` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `tampil` varchar(50) NOT NULL,
  `urutan` int(3) NOT NULL,
  `insert_by` int(11) NOT NULL,
  `insert_at` date NOT NULL,
  `update_by` int(11) NOT NULL,
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `jabatan`, `id_dept`, `foto`, `tampil`, `urutan`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(1, 'Riza Fadhilah', 'Ketua Himmasi', 1, '1.jpg', 'show', 1, 1, '2021-05-28', 1, '2021-05-28'),
(2, 'Rahma Nur', 'Bendahara Himmasi', 4, '2.jpg', 'show', 2, 1, '2021-05-28', 1, '2021-05-28'),
(3, 'Nur Aini', 'Sekretaris Himmasi', 3, '3.jpg', 'show', 2, 1, '2021-05-28', 1, '2021-05-28'),
(6, 'Selvi Madania', 'Ketua Departemen Advokesma', 1, '6.jpg', 'show', 3, 1, '2021-05-28', 1, '2021-05-28'),
(7, 'Gerio Navi', 'Ketua Departemen DMB', 2, '7.jpg', 'show', 3, 1, '2021-05-28', 1, '2021-05-28'),
(8, 'Riza Rahman', 'Ketua Departemen PSDM', 3, '8.jpg', 'show', 3, 1, '2021-05-28', 1, '2021-05-28'),
(9, 'Alfina Rizky', 'Ketua Departemen Puskominfo', 4, '9.jpg', 'show', 3, 1, '2021-05-28', 1, '2021-05-28');

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
(1, 'Advokesma', 'Advokesma berasal dari 2 kata yaitu Advokasi dan Kesejahteraan Mahasiswa. Advokasi yang berarti perlindungan terhadap hak-hak mahasiswa. Kesejahteraan mahasiswa yang memiliki arti memberikan pelayanan bagi kebutuhan mahasiswa di himpunan Sistem Informasi', 10, 'Advokesma.png'),
(2, 'DMB', 'Departemen yang menaungi bidang olahraga dan seni yang juga sebagai sarana dan wadah bagi mahasiswa Sistem Informasi dalam menyalurkan aspirasi-aspirasi, serta mengembangkan minat dan bakat mahasiswa SI dalam bidang olahraga dan seni', 10, 'DMB.png'),
(3, 'PSDM', 'PSDM adalah singkatan dari Pengembangan Sumber Daya Mahasiswa. Departemen PSDM berfokus pada Pengembangan Internal Mahasiswa Sistem Informasi', 15, 'PSDM.png'),
(4, 'Puskominfo', 'Puskominfo (Pusat Komunikasi dan Informasi) bertanggungjawab atas kegiatan dokumentasi, pegembangan media, dan publikasi kinerja himpunan dalam membentuk citra HIMMASI Vokasi Universitas Brawijaya', 20, 'Puskominfo.png');

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
(8, 'mitsuha.png', 'png', 1, '2021-05-20'),
(9, 'Misaka9982_animeProfile.jpg', 'jpg', 8, '2021-05-24'),
(10, 'konten1a.png', 'png', 1, '2021-05-25'),
(11, 'konten2a.png', 'png', 1, '2021-05-25'),
(12, 'konten3a.png', 'png', 1, '2021-05-25'),
(13, 'konten4a.png', 'png', 1, '2021-05-25'),
(14, 'konten5a.png', 'png', 1, '2021-05-25'),
(15, 'irene.jpg', 'jpg', 1, '2021-05-27'),
(16, 'adalovelace.png', 'png', 1, '2021-05-30'),
(17, 'engine.png', 'png', 1, '2021-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `isi` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
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
(6, 'Hello World', '      <img src=\"assets/uploads/Misaka9982_animeProfile.jpg\">\r\n<h3>Who we are</h3>\r\n<p class=\"text-gray-800 mb-6 mb-md-8\" style=\"text-align: justify;\">\r\nWe believe lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus feugiat elit vitae enim lacinia semper. Cras nulla lectus, porttitor vitae urna iaculis, malesuada tincidunt lectus. Proin nec tellus sit amet massa auctor imperdiet id vitae diam. Aenean gravida est nec diam suscipit iaculis. Praesent urna velit, auctor nec turpis et, vehicula lobortis sem. Vivamus convallis mi sagittis eleifend laoreet. Praesent vitae venenatis enim. Nulla tincidunt felis et lectus rhoncus laoreet.\r\n</p>\r\n<h3>What we’re looking for</h3>\r\n<p class=\"text-gray-800 mb-5\" style=\"text-align: justify; \">\r\nAenean gravida est nec diam suscipit iaculis. Praesent urna velit, auctor nec turpis et, vehicula lobortis sem. Vivamus convallis mi sagittis eleifend laoreet. Praesent vitae venenatis enim. Nulla tincidunt felis et lectus rhoncus laoreet.\r\n</p>\r\n<!-- List -->\r\n<div class=\"d-flex\">\r\n  <div class=\"badge badge-rounded-circle badge-success-soft mt-1 mr-4\">\r\n     <i class=\"fe fe-check\"></i>\r\n  </div>\r\n  <p class=\"text-gray-800\">\r\n    Work through complex design problems to create beautiful and thoughtful interactions for our marketing web platform\r\n              </p>\r\n            </div>\r\n            <div class=\"d-flex\">\r\n              <div class=\"badge badge-rounded-circle badge-success-soft mt-1 mr-4\">\r\n                <i class=\"fe fe-check\"></i>\r\n              </div>\r\n              <p class=\"text-gray-800\">\r\n                Demonstrate an expertise in typography, composition, layout, design thinking, and content strategy in the design solutions you create\r\n              </p>\r\n            </div>            ', 'publish', 'hello-world', 19, 1, '2021-05-14', 1, '2021-05-30'),
(7, 'Cara menghilangkan Stress', '<img src=\"assets/uploads/irene.jpg\">\r\n      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.        ', 'trash', 'cara-menghilangkan-stress', 2, 1, '2021-05-15', 1, '2021-05-27'),
(8, 'Hal yang perlu disiapkan untuk Sidang OJT dan Sidang TA', '      <div style=\"text-align: center;\"><img src=\"assets/uploads/konten1a.png\" style=\"font-size: 1rem; font-weight: initial;\"></div>\r\n\r\n<div style=\"text-align: left;\"><div>Hallo Sobat SI👋👋</div><div>Ada info nih buat kalian mahasiswa Sistem Informasi. Pendaftaran sidang OJT dan TA Semester Genap 2020 - 2021, sudah dibuka. Berikut adalah&nbsp;Hal yang perlu disiapkan untuk Sidang OJT dan Sidang TA :</div></div>                                          \r\n\r\n<ol><li>Pengisian identitas diri mohon diisi dengan benar</li><li>Persiapkan berkas-berkas yang akan diunggah</li><li>Semua berkas yang diunggah maksimal 10MB</li><li>Semua berkas penamaan file (Nama file-NIM-NAMA-Bidang Minat)</li><li>Setiap pendaftaran mahasiswa hanya dapat mendaftar satu kali dengan menggunakan email student.ub.ac.id</li><li>Pendaftaran akan dibuka setiap hari dan akan ditutup setiap Minggu ke-4 Hari Jumat pukul 10.00 WIB</li><li>Pelaksanaan sidang OJT akan dilaksanakan di minggu ke 1 &amp; 2 setiap bulannya</li><li>Hasil verivikasi pendaftaran Sidang OJT akan diinfokan oleh KPS/KBM masing-masing program studi beserta jadwal pelaksanaan sidang</li><li>Kuota sidang OJT 50 mahasiswa per Prodi yang akan dilaksanakan selama 2 Minggu. Untuk pendaftaran diluar kuota akan diikutkan di Periode selanjutnya</li><li>Jika terdapat masalah dalam proses pendaftaran Sidang OJT, silahkan hubungi CP : 085704776352 (Puput) di jam kerja</li></ol>\r\n<br>\r\n<h3 style=\"text-align: center; \">CATATAN PENTING</h3><ol><li style=\"text-align: left;\">Sidang OJT dan Sidang TA untuk bulan ini pendaftaran dibuka setiap hari sampai tanggal 23 April 2021. Pendaftaran dibuka setiap hari&nbsp; dan setiap bulan</li><li style=\"text-align: left;\">Validasi dilakukan 2 kali yaitu validasi akademik terkait berkas yang diunggah dan validasi keuangan. Setelah mendaftar nanti menunggu hasil validasi</li><li style=\"text-align: left;\">Untuk periode 2 dan seterusnya, validasi akan lebih ketat. Pastikan file yang diunggah benar, karena jika salah maka akan diikutkan periode berikutnya. Oleh karena itu ketika mendaftar pastikan data yang diisi sudah benar</li></ol>\r\n<br>\r\n<h3 style=\"text-align: center; \">LINK</h3><p style=\"text-align: center;\">Pendaftaran Sidang OJT :</p><p style=\"text-align: center;\"><a href=\"http://bit.ly/PendaftaranSidangOJT\" target=\"_blank\">http://bit.ly/PendaftaranSidangOJT</a><br></p><p style=\"text-align: center;\"><br></p><p style=\"text-align: center;\">Pendaftaran Sidang TA :</p><p style=\"text-align: center;\"><a href=\"http://bit.ly/Pendaftarantugasakhir\" target=\"_blank\">http://bit.ly/Pendaftarantugasakhir</a><br></p>                                ', 'publish', 'hal-yang-perlu-disiapkan-untuk-sidang-ojt-dan-sidang-ta', 5, 1, '2021-05-16', 1, '2021-05-31'),
(10, 'Himmasi punya server Discord lho!', '      <div style=\"text-align: center;\"><img src=\"assets/uploads/konten2a.png\" style=\"font-size: 1rem; font-weight: initial;\"></div>\r\n\r\n<p style=\"text-align: justify; \">\r\nHai, sobat SI!👋<br>Gimana nih perkuliahannya? Semoga lancar ya☺. Kita mau kasih tau nih, kalo Himmasi punya discord loh. Yakin gamau gabung? Ada banyak yang bisa kita obrolin disini mulai dari tugas kuliah, info lomba, design, info loker, sampai mabar juga bisa pastinya. Join yuk supaya bisa ngobrol ramai-ramai sama temen-temen SI lainnya. Oh iya, kamu juga bisa share ketemen kamu juga buat join discord ini.\r\n</p>\r\n\r\n<h3 style=\"text-align: justify; \"><b>Kenapa Discord?</b></h3>\r\n\r\n<p style=\"text-align: justify; \">Dengan menggunakan Discord kalian akan dimudahkan untuk ngobrol dan berbagi informasi dengan semua teman-teman SI. Di Discord kalian bisa sharing mulai dari tugas kuliah, info lomba, design, info loker sampai mabar juga bisa lho... Gimana? Kalian tertarik untuk gabung Discord?</p>\r\n\r\n<p style=\"text-align: justify; \">Kalo tertarik, ayo langsung buka link di bawah ini dan akses Discordnya!</p>\r\n\r\n<p style=\"text-align: justify; \"><a href=\"http://bit.ly/SIPlaygroundDiscord\" target=\"_blank\">bit.ly/SIPlaygroundDiscord</a></p>                                            ', 'publish', 'himmasi-punya-server-discord-lho', 13, 1, '2021-05-16', 1, '2021-05-31'),
(13, 'Pengumuman Staff Tetap Himmasi', '<p style=\"text-align: center;\"><img src=\"assets/uploads/konten3a.png\">\r\n</p>\r\n\r\n<h3><u><b>Pengumuman Lolos Seleksi</b></u></h3>\r\n\r\n<p>Akhirnya yang ditunggu-tunggu nih!😊<br>Selamat bagi kalian yang lolos menjadi staff Kabinet Bagaskara. Penasaran siapa aja yang berhasil lolos seleksi staff tetap? Silahkan cek nama kalian dibawah ini :</p>\r\n\r\n<p><span id=\"docs-internal-guid-a8666c5e-7fff-0b79-31a0-549e94cb94fd\"></span></p><div dir=\"ltr\" style=\"margin-left:0pt;\" align=\"left\"><table style=\"border:none;border-collapse:collapse;table-layout:fixed;width:451.27559055118115pt\"><colgroup><col><col></colgroup><tbody><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Nama Staff Tetap&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;text-align: center;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Departemen</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Rizka Nur Rahma&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">PSDM</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Irfandy A.N&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">PSDM</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">M Riyan Athariq</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">PSDM</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Muhammad Asyroful Munna&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">ADVOKESMA</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Nissa Salsabilla</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">ADVOKESMA</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Wildah Triana Putri&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">ADVOKESMA</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Diah Ayu Lestari</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">ADVOKESMA</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Ajeng Riskiani Lestari&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">ADVOKESMA</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Bernardus Angelo Johan Fernandy</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">PUSKOM</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Khenaro Daffa Asyrof</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">PUSKOM</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Nimah Rahmania Safitri&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">DMB</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Citra Putri Dhaneswara&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">DMB</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Ichsan Dwi Hanafi&nbsp;</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">DMB</span></p></td></tr><tr style=\"height:0pt\"><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Calibri,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Muhammad Raihan Ibra Maulana</span></p></td><td style=\"border-left:solid #000000 1pt;border-right:solid #000000 1pt;border-bottom:solid #000000 1pt;border-top:solid #000000 1pt;vertical-align:top;padding:5pt 5pt 5pt 5pt;overflow:hidden;overflow-wrap:break-word;\"><p dir=\"ltr\" style=\"line-height:1.2;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:11pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">DMB</span></p></td></tr></tbody></table></div>\r\n<br><p></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">Untuk Staff Tetap yang sudah keterima harap menghubungi Kadep/Wakadep sesuai Departemen.</span></p><p><b style=\"font-weight:normal;\" id=\"docs-internal-guid-8f76de17-7fff-0f7b-7da7-9e04375b83e7\"><br></b></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">CP Departemen:</span></p><p><b style=\"font-weight:normal;\"><br></b></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">- PSDM :&nbsp;</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">1. Kadep : Riza Rahman Ghalizh (+62 878-5663-5562)</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">2. Wakadep : Qluwung Anggawa Swandiri (+62 856-4630-9005)</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">- ADVOKESMA :</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">1. Kadep : Selvi Madania Elwina (+62 813-9235-5959)&nbsp;</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">2. Wakadep : Moh.Baharudin Yuda Maulidi (+62 877-9110-1550)</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">- PUSKOM :</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">1. Kadep : Alfina Rizky Lestari (+62 812-1817-7607)</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">2. Wakadep : Rifat Zulfan Manaf (+62 857-4582-7142)</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">- DMB :</span></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">1. Kadep : Gerio Navi Rizaldi (+62 812-3278-9752)</span></p><p></p><p dir=\"ltr\" style=\"line-height:1.38;margin-top:0pt;margin-bottom:0pt;\"><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\">2. Wakadep : Ammar Hisyam Fakhrudin (+62 859-7430-9235)</span></p><div><span style=\"font-size:12pt;font-family:Arial;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;\"><br></span></div>            ', 'publish', 'pengumuman-staff-tetap-himmasi', 5, 2, '2021-05-16', 1, '2021-05-31'),
(14, 'Antarctica', '      <p><img src=\"assets/uploads/coba5.jpg\">\r\n</p><p style=\"text-align: justify; \"><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif;\">Antarctica, the southernmost continent and site of the South Pole, is a virtually uninhabited, ice-covered landmass. Most cruises to the continent visit the Antarctic Peninsula, which stretches toward South America. It’s known for the Lemaire Channel and Paradise Harbor, striking, iceberg-flanked passageways, and Port Lockroy, a former British research station turned museum. The peninsula’s isolated terrain also shelters rich wildlife, including many penguins.</span><br></p>    ', 'draft', 'antarctica', 2, 1, '2021-05-21', 1, '2021-05-25'),
(15, 'Kenalan dengan programmer pertama di dunia', '      <div style=\"text-align: center;\"><img src=\"assets/uploads/konten4a.png\" style=\"font-size: 1rem; font-weight: initial;\"></div>                              <p></p>\r\n<p style=\"text-align: center; \"><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif;\"><b>Tak disangka, programmer pertama di dunia ternyata wanita lho! Siapakah dia?</b></span></p>\r\n\r\n<div style=\"text-align: center;\"><img src=\"assets/uploads/adalovelace.png\"></div>\r\n\r\n<p style=\"text-align: justify; \"><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif;\">Dia adalah <b>Ada Lovelace</b> seorang ahli matematika berkebangsaan Inggris. Ada Lovelace dikenal dengan pribadi yang cerdas dan gemar mempelajari teori-teori yang diciptakan orang lain. Termasuk konsep Analytical Engine yang pada waktu itu sedang dikembangkan Charles Babbage (seorang matematikawan). Dari situ Ada menyadari, bahwa mesin bisa memiliki kemampuan yang lebih besar daripada hanya melakukan perhitugan sederhana</span></p>\r\n\r\n<div style=\"text-align: center; \"><img src=\"assets/uploads/engine.png\"></div>\r\n\r\n<p style=\"text-align: justify; \"><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif;\">Sehingga dengan pengalaman yang dia jalani, Ada menemukan dasar program komputer mekanika pertama di dunia pada tahun 1843. Ada mendeskripsikan bagaimana kode diciptakan untuk mesin agar bisa menangani huruf dan simbol bersamaan dengan angka. Ada juga menjelaskan metode agar mesin dapat mengulangi beberapa instruksi seperti proses yang sekarang kita ketahui dengan istilah loop.</span></p><p style=\"text-align: justify; \"><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif;\">Kalau Ada Lovelace berpartisipasi dalam mencetak sejarah di sektor teknologi, Indonesia juga punya wanita yang berperan dengan kesetaraan gender, juga kebangkitan sektor edukasi dan sosial di Indonesia yaitu <b>Raden Ajeng Kartini</b>. Tanpa adanya kesetaraan gender, pastinya sektor pendidikan di Indonesia tidak akan seperti sekarang.</span></p> \r\n\r\n<p style=\"text-align: justify; \"><span style=\"color: rgb(77, 81, 86); font-family: arial, sans-serif;\">Wanita hebat adalah mereka yang mampu menjadi versi terbaik dari dirinya sendiri. Gapailah mimpimu, Bangkitlah Buktikan jika semangatmu hati ini sebagai seorang Kartini muda jauh lebih baik daripada yang sebelumnya, dan jadilah terang benderang dalam kegelapan.<br>Selamat Hari Kartini untuk para wanita hebat, Kartini masa kini!</span></p>                                            ', 'publish', 'kenalan-dengan-programmer-pertama-di-dunia', 18, 1, '2021-05-21', 1, '2021-05-31'),
(16, 'Rekomendasi buku untuk jurusan IT', '<div style=\"text-align: center;\"><h3><img src=\"assets/uploads/konten5a.png\" style=\"font-size: 1rem; font-weight: initial;\"></h3></div><h3><span>The Pragmatic Programmer : Your Journey to Mastery</span></h3><p style=\"text-align: justify; \">The Pragmatic Programmer merupakan salah satu buku programmer paling terkenal di dunia. Diterbitkan pertama kali tahun 1999, buku ini akan memberikanmu segudang informasi berharga terkait dunia programming yang mudah untuk dipahamai. Bahkan, didalamnya juga terdapat tips dalam berkarir sebagai seorang programmer, lho!</p><p><br></p><h3>Software Design X-Rays</h3><p style=\"text-align: justify; \">Buku ini termasuk buku tentang rekayasa perangkat lunak yang wajib kamu baca. Terutama tentang analisis coding dan menciptakan code health. Secara sederhana, code health sendiri adalah tentang pengaturan, pemeliharaan, stabilitas dan kesederhaan dari sebuah coding. Melalui buku ini, Adam Tornhill memberitahukan beberapa teknik untuk mengidentifikasi tren kompleksitas, hotspot, dan peluang refactoring.</p><p><br></p><h3>Clean Code : A handbook of agile software Craftmanship</h3><p style=\"text-align: justify; \">Seperti namanya, buku coding ini mengajarkanmu untuk menulis code \"sebersih\" mungkin. Sehingga code ciptaaanmu bisa lebih efektif dan efisien Buku ini akan memberikan beberapa case studies untuk dianalisis serta sebagai sarana praktik bagimu.<br></p>    ', 'publish', 'rekomendasi-buku-untuk-jurusan-it', 7, 1, '2021-05-25', 1, '2021-05-31'),
(17, 'Coba tag', 'cobaa', 'draft', 'coba-tag', 0, 1, '2021-05-30', 1, '2021-05-30');

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
(5, 'Pop Kultur'),
(6, 'Tutorial');

-- --------------------------------------------------------

--
-- Table structure for table `tag_post`
--

CREATE TABLE `tag_post` (
  `id_tp` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  `insert_by` int(11) NOT NULL,
  `insert_at` date NOT NULL,
  `update_by` int(11) NOT NULL,
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag_post`
--

INSERT INTO `tag_post` (`id_tp`, `id_post`, `id_tag`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(16, 17, 2, 1, '2021-05-30', 1, '2021-05-30'),
(17, 17, 5, 1, '2021-05-30', 1, '2021-05-30'),
(32, 8, 2, 1, '2021-05-31', 1, '2021-05-31'),
(33, 8, 6, 1, '2021-05-31', 1, '2021-05-31');

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
(1, 'Naufal Ulinnuha', 'naufal', '21232f297a57a5a743894a0e4a801fc3', 'superadmin', 'Ketua Departemen Puskominfo', '1.jpg'),
(2, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Anggota Advokesma', ''),
(3, 'Nurul Maftuchah', 'nurul', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'Anggota PSDM', '3.jpg'),
(4, 'Arif Yudha Wibisono', 'arif', 'e10adc3949ba59abbe56e057f20f883e', 'superadmin', 'Ketua Departemen DMB', '4.jpg'),
(5, 'Naurah Fauziah Al-Zaend', 'naurah', 'e10adc3949ba59abbe56e057f20f883e', 'superadmin', 'Anggota DMB', '5.jpg'),
(7, 'Fenny Inriana', 'fenny', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'Anggota Puskominfo', '7.jpg'),
(8, 'Salnan Ratih', 'salnan', 'e10adc3949ba59abbe56e057f20f883e', 'superadmin', 'Pembina Himmasi', '8.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD KEY `id_dept` (`id_dept`),
  ADD KEY `insert_by` (`insert_by`,`update_by`);

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
  ADD PRIMARY KEY (`id_tp`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_tag` (`id_tag`),
  ADD KEY `insert_by` (`insert_by`),
  ADD KEY `update_by` (`update_by`);

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
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_dept` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tag_post`
--
ALTER TABLE `tag_post`
  MODIFY `id_tp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_dept`) REFERENCES `departemen` (`id_dept`);

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
