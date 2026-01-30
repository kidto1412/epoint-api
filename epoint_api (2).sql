-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 22 Feb 2024 pada 00.32
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epoint_api`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_rooms`
--

CREATE TABLE `class_rooms` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `major_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `class_rooms`
--

INSERT INTO `class_rooms` (`id`, `grade`, `major_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
('C01', '10', 'M01', NULL, '2023-05-03 03:09:13', '2023-05-03 03:09:13'),
('C02', '11', 'M01', NULL, '2023-05-03 03:09:19', '2023-05-03 03:09:19'),
('C03', '12', 'M01', NULL, '2023-05-03 03:09:23', '2023-05-03 03:09:23'),
('C04', '10', 'M02', NULL, '2023-05-03 03:09:29', '2023-05-03 03:09:29'),
('C05', '11', 'M02', NULL, '2023-05-03 03:09:36', '2023-05-03 03:09:36'),
('C06', '12', 'M02', NULL, '2023-05-03 03:09:52', '2023-05-03 03:09:52'),
('C07', '10', 'M03', NULL, '2023-05-03 03:10:00', '2023-05-03 03:10:00'),
('C08', '11', 'M03', NULL, '2023-05-03 03:10:06', '2023-05-03 03:10:06'),
('C09', '12', 'M03', NULL, '2023-05-03 03:10:11', '2023-05-03 03:10:11'),
('C10', '10', 'M04', NULL, '2023-05-03 03:10:20', '2023-05-03 03:10:20'),
('C11', '11', 'M04', NULL, '2023-05-03 03:10:25', '2023-05-03 03:10:25'),
('C12', '12', 'M04', NULL, '2023-05-03 03:10:29', '2023-05-03 03:10:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_of_fouls`
--

CREATE TABLE `form_of_fouls` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` int DEFAULT NULL,
  `category_foul_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `form_of_fouls`
--

INSERT INTO `form_of_fouls` (`id`, `name`, `point`, `category_foul_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
('FOF1', 'Pembawa, pemakai, penjual, pengedar alkohol, narkoba dan atau psikotropika dengan pembuktian aturan sekolah', 100, 'FC01', NULL, '2023-05-03 05:58:07', '2023-05-03 05:58:07'),
('FOF10', 'Merusak barang milik sekolah dan atau milik orang lain', 50, 'FC01', NULL, '2023-05-03 06:36:53', '2023-05-03 06:36:53'),
('FOF11', 'Merusak lingkungan sekolah dan atau lingkungan umum', 50, 'FC01', NULL, '2023-05-03 06:37:06', '2023-05-03 06:37:06'),
('FOF12', 'Pelecehan seksual', 50, 'FC01', NULL, '2023-05-03 06:37:16', '2023-05-03 06:37:16'),
('FOF13', 'Menyalahgunakan keuangan sekolah', 30, 'FC01', NULL, '2023-05-03 06:37:36', '2023-05-03 06:37:36'),
('FOF14', 'Merokok di lingkungan sekolah dan atau di luar sekolah dengan memakai seragam atau atribut sekolah', 30, 'FC01', NULL, '2023-05-03 06:37:51', '2023-05-03 06:37:51'),
('FOF15', 'Kabur atau meninggalkan kelas (sekolah) tanpa izin guru pengaja', 30, 'FC01', NULL, '2023-05-03 06:38:05', '2023-05-03 06:38:05'),
('FOF16', 'Memalsukan surat atau tanda tangan orang tua / wali', 30, 'FC01', NULL, '2023-05-03 06:38:16', '2023-05-03 06:38:16'),
('FOF17', 'Membuat coretan atau gambar pada pakaian, tas, lingkungan sekolah atau di tempat umum', 30, 'FC01', NULL, '2023-05-03 06:38:30', '2023-05-03 06:38:30'),
('FOF18', 'Memakai kendaraan bermotor ke sekolah tanpa memiliki surat keterangan sah (SIM atau STNK)', 30, 'FC01', NULL, '2023-05-03 06:38:47', '2023-05-03 06:38:47'),
('FOF19', 'Memakai kendaraan bermotor ke sekolah tanpa memiliki kartu parkir ketika masuk dan menyerahkan ketika keluar', 30, 'FC01', NULL, '2023-05-03 06:39:15', '2023-05-03 06:39:15'),
('FOF2', 'PembawaMerampas atau mencuri milik orang lain baik di sekolah atau di luar sekolah', 100, 'FC01', NULL, '2023-05-03 06:32:42', '2023-05-03 06:32:42'),
('FOF20', 'Membawa rokok ke sekolah', 15, 'FC01', NULL, '2023-05-03 06:39:28', '2023-05-03 06:39:28'),
('FOF21', 'Melompat benteng sekolah untuk masuk mengikuti pelajaran', 15, 'FC01', NULL, '2023-05-03 06:39:39', '2023-05-03 06:39:39'),
('FOF22', 'Menghilangkan buku saku, ditambah denda, membayar uang Rp. 10.000,-', 5, 'FC01', NULL, '2023-05-03 06:39:54', '2023-05-03 06:39:54'),
('FOF23', 'Tidak membawa buku saku, poin pelanggaran bertambah', 5, 'FC01', NULL, '2023-05-03 06:40:10', '2023-05-03 06:40:10'),
('FOF24', 'Duduk-duduk di depan tiang bendera', 5, 'FC01', NULL, '2023-05-03 06:40:19', '2023-05-03 06:40:19'),
('FOF25', 'Keluar lingkungan sekolah saat istirahat tanpa izin piket', 5, 'FC01', NULL, '2023-05-03 06:40:34', '2023-05-03 06:40:34'),
('FOF26', 'Membuang sampah sembarangan', 5, 'FC01', NULL, '2023-05-03 06:40:43', '2023-05-03 06:40:43'),
('FOF27', 'Berbicara kasar, tidak sopan, tidak senonoh', 5, 'FC01', NULL, '2023-05-03 06:40:53', '2023-05-03 06:40:53'),
('FOF28', 'Memakai aksesoris di luar ketentuan sekolah (jaket, sweater, topi, gelang, sabuk, kalung, dll)', 15, 'FC02', NULL, '2023-05-03 06:41:19', '2023-05-03 06:41:19'),
('FOF29', 'Berpakaian seragam dengan ukuran, bahan, atau potongan yang tidak sesuai dengan ketentuan sekolah', 15, 'FC02', NULL, '2023-05-03 06:41:36', '2023-05-03 06:41:36'),
('FOF30', 'Memakai pakaian yang tidak sesuai dengan ketentuan hari yang berlaku', 15, 'FC02', NULL, '2023-05-03 06:41:52', '2023-05-03 06:41:52'),
('FOF31', 'Tidak memakai pakaian praktik selama melaksanakan pelajaran praktik', 15, 'FC02', NULL, '2023-05-03 06:42:03', '2023-05-03 06:42:03'),
('FOF32', 'Berpenampilan tidak sesuai dengan ketentuan sekolah (rambut gondrong, atau di cat, tidak memakai atribut sekolah yang berlaku, dll)', 15, 'FC02', NULL, '2023-05-03 06:42:14', '2023-05-03 06:42:14'),
('FOF33', 'Baju dikeluarkan', 5, 'FC02', NULL, '2023-05-03 06:42:26', '2023-05-03 06:42:26'),
('FOF34', 'Tidak masuk sekolah selama 6 hari dalam sebulan tanpa alasan atau 3 hari berturut-turut tanpa alasan', 30, 'FC03', NULL, '2023-05-03 07:12:44', '2023-05-03 07:12:44'),
('FOF35', 'Tidak mengikuti upacara bendera, atau apel pagi/ siang tanpa alasan', 15, 'FC03', NULL, '2023-05-03 07:12:51', '2023-05-03 07:12:51'),
('FOF36', 'Tidak masuk sekolah tanpa keterangan', 5, 'FC03', NULL, '2023-05-03 07:13:05', '2023-05-03 07:13:05'),
('FOF37', 'Terlambat masuk, di pintu gerbang terhitung mulai pukul 07.15', 5, 'FC03', NULL, '2023-05-03 07:13:18', '2023-05-03 07:13:18'),
('FOF4', 'PembawaMerampasHamil, menghamili, pemerkosaan atau menikah', 100, 'FC01', NULL, '2023-05-03 06:34:46', '2023-05-03 06:34:46'),
('FOF5', 'Perusakan atau menghilangkan barang milik sekolah', 100, 'FC01', NULL, '2023-05-03 06:35:06', '2023-05-03 06:35:06'),
('FOF6', 'Memalsukan surat atau tanda tangan pejabat sekolah', 50, 'FC01', NULL, '2023-05-03 06:35:20', '2023-05-03 06:35:20'),
('FOF7', 'MemalsukanMenghina, memfitnah, merendahkan Kepala Sekolah, Guru, TU, dan atau Karyawan/ Petugas Sekolah', 50, 'FC01', NULL, '2023-05-03 06:35:30', '2023-05-03 06:35:30'),
('FOF8', 'Membawa senjata tajam, senjata api atau alat lain yang tidak berhubungan dengan keperluan sekolah', 50, 'FC01', NULL, '2023-05-03 06:36:06', '2023-05-03 06:36:06'),
('FOF9', 'Membawa bacaan, gambar, VCD, HP atau media lain yang bersifat pornografi', 50, 'FC01', NULL, '2023-05-03 06:36:31', '2023-05-03 06:36:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fouls`
--

CREATE TABLE `fouls` (
  `id` bigint UNSIGNED NOT NULL,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_nis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_of_foul_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fouls`
--

INSERT INTO `fouls` (`id`, `time`, `date`, `description`, `student_nis`, `teacher_nip`, `form_of_foul_id`, `deleted_at`, `created_at`, `updated_at`, `status`, `photo`) VALUES
(76, '12:10:00', '2011-09-29', '-', '222301001', '0101092136', 'FOF18', NULL, '2023-07-29 20:27:19', '2024-01-08 08:23:17', 'REJECTED', ''),
(77, '12:10:00', '2011-09-29', '-', '222301001', '0101092136', 'FOF35', NULL, '2023-07-29 20:34:43', '2024-01-08 08:23:19', 'SUCCESS', ''),
(78, '12:10:00', '2011-09-29', '-', '222301001', '0101092136', 'FOF36', NULL, '2023-07-29 20:35:01', '2024-01-08 08:23:22', 'SUCCESS', ''),
(79, '12:10:00', '2011-09-29', '-', '222301001', '0101092136', 'FOF37', NULL, '2023-07-29 20:35:10', '2023-07-29 20:35:10', '', ''),
(80, '12:10:00', '2011-09-29', '-', '222301001', '0101092136', 'FOF28', NULL, '2023-07-29 20:36:35', '2023-07-29 20:36:35', '', ''),
(81, '12:10:00', '2011-09-29', '-', '222301001', '0101092136', 'FOF29', NULL, '2023-07-29 20:36:42', '2023-07-29 20:36:42', '', ''),
(82, '12:10:00', '2011-09-29', '-', '222301021', '0101092136', 'FOF20', NULL, '2023-07-29 20:37:50', '2023-07-29 20:37:50', '', ''),
(83, '12:10:00', '2011-09-29', '-', '222301021', '0101092136', 'FOF22', NULL, '2023-07-29 20:37:59', '2023-07-29 20:37:59', '', ''),
(84, '12:10:00', '2011-09-29', '-', '222301021', '0101092136', 'FOF23', NULL, '2023-07-29 20:38:09', '2023-07-29 20:38:09', '', ''),
(85, '12:10:00', '2011-09-29', '-', '222301021', '0101092136', 'FOF34', NULL, '2023-07-29 20:58:31', '2023-07-29 20:58:31', '', ''),
(86, '12:10:00', '2011-09-29', '-', '222301021', '0101092136', 'FOF28', NULL, '2023-07-29 21:01:32', '2023-07-29 21:01:32', '', ''),
(87, '12:10:00', '2011-09-29', '-', '222301021', '0101092136', 'FOF29', NULL, '2023-07-29 21:01:40', '2023-07-29 21:01:40', '', ''),
(88, '12:10:00', '2011-09-29', '-', '222301004', '0101092136', 'FOF13', NULL, '2023-07-29 21:03:34', '2023-07-29 21:03:34', '', ''),
(89, '12:10:00', '2011-09-29', '-', '222301004', '0101092136', 'FOF35', NULL, '2023-07-29 21:21:15', '2023-07-29 21:21:15', '', ''),
(90, '12:10:00', '2011-09-29', '-', '222301004', '0101092136', 'FOF36', NULL, '2023-07-29 21:21:22', '2023-07-29 21:21:22', '', ''),
(91, '12:10:00', '2011-09-29', '-', '222301004', '0101092136', 'FOF28', NULL, '2023-07-29 21:21:47', '2023-07-29 21:21:47', '', ''),
(92, '12:10:00', '2011-09-29', '-', '222301004', '0101092136', 'FOF29', NULL, '2023-07-29 21:21:55', '2023-07-29 21:21:55', '', ''),
(93, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF15', NULL, '2023-07-29 21:24:42', '2023-07-29 21:24:42', '', ''),
(94, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF22', NULL, '2023-07-29 21:25:00', '2023-07-29 21:25:00', '', ''),
(95, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF36', NULL, '2023-07-29 21:25:14', '2023-07-29 21:25:14', '', ''),
(96, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF37', NULL, '2023-07-29 21:25:19', '2023-07-29 21:25:19', '', ''),
(97, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF32', NULL, '2023-07-29 21:41:44', '2023-07-29 21:41:44', '', ''),
(98, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2023-07-29 21:41:52', '2023-07-29 21:41:52', '', ''),
(103, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-07 08:39:33', '2024-01-07 08:39:33', NULL, NULL),
(104, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-07 08:44:04', '2024-01-07 08:44:04', 'SUBMITTED', NULL),
(105, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-07 08:44:23', '2024-01-07 08:44:23', 'SUBMITTED', NULL),
(106, '17:38:32', '2024-01-07', 'test', '222301001', '0101092136', 'FOF13', NULL, '2024-01-07 08:46:24', '2024-01-07 08:46:24', 'SUBMITTED', NULL),
(107, '22:50:47', '2024-01-07', 'test', '243243', '0101092136', 'FOF12', NULL, '2024-01-07 09:07:04', '2024-01-07 09:07:04', 'SUBMITTED', '/data/user/0/example.e_point.com/cache/6df95b90-7686-4905-86cc-58959227a898/download.jpg'),
(108, '23:11:12', '2024-01-07', 'test', '243243', '0101092136', 'FOF11', NULL, '2024-01-07 09:11:44', '2024-01-07 09:11:44', 'SUBMITTED', '/data/user/0/example.e_point.com/cache/ffd937b4-1eb7-46c0-8e2b-b52c08536358/download.jpg'),
(110, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 02:50:24', '2024-01-08 02:50:24', 'SUBMITTED', 'assets/images/student/VXAc1II3r4aOx2PkDlriDp4V4J5oMWgJVgdE1DjP.jpg'),
(111, '14:03:42', '2024-01-08', 'test', '243243', '0101092136', 'FOF13', NULL, '2024-01-08 02:53:28', '2024-01-08 02:53:28', 'SUBMITTED', 'assets/images/student/CkdFnPMrsvvpyF3JEcsZBBXhuoElziEc8tHCQh32.jpg'),
(112, '14:03:42', '2024-01-08', 'test', '243243', '0101092136', 'FOF13', NULL, '2024-01-08 02:57:15', '2024-01-08 02:57:15', 'SUBMITTED', 'assets/images/student/WWvYLu1eViszmMGz1l0f1xvBOzSlubLTbqOtfKmz.jpg'),
(113, '14:03:42', '2024-01-08', 'test', '243243', '0101092136', 'FOF13', NULL, '2024-01-08 02:58:31', '2024-01-08 02:58:31', 'SUBMITTED', 'assets/images/student/iVZmlufwdo2otkb99tDoIZ2cgYVhvelxExmrgopG.jpg'),
(114, '14:03:42', '2024-01-08', 'test', '243243', '0101092136', 'FOF13', NULL, '2024-01-08 03:00:01', '2024-01-08 03:00:01', 'SUBMITTED', 'assets/images/student/Xz8DDzgngGFMPGUVKF3nPW5S9rhJSORjofqJBOP2.jpg'),
(115, '17:20:16', '2024-01-08', 'test', '243243', '0101092136', 'FOF14', NULL, '2024-01-08 03:20:48', '2024-01-08 03:20:48', 'SUBMITTED', 'assets/images/student/Bxr83YXwlTrisRCZfKcAwg7d6JodmG5AbPKZPOvS.jpg'),
(116, '17:40:09', '2024-01-08', 'test', '243243', '0101092136', 'FOF17', NULL, '2024-01-08 03:41:04', '2024-01-08 07:44:56', 'SUCCESS', 'assets/images/student/2AQBUoqTbcHzBkadNuO00hVANoA2aI3yo8ysKZKl.jpg'),
(117, '22:26:19', '2024-01-08', 'test', '222301001', '0101092136', 'FOF13', NULL, '2024-01-08 08:26:40', '2024-01-08 08:26:40', 'SUBMITTED', 'assets/images/student/k8ZHga2u4vW1ZK0x2AOgFhRcMid75UVnAnfqqYBN.jpg'),
(118, '22:28:31', '2024-01-08', 'test', '222301021', '0101092136', 'FOF15', NULL, '2024-01-08 08:28:46', '2024-01-08 08:28:46', 'SUBMITTED', 'assets/images/student/uirZWqyxofO3nQpBAOHv62Yvg1tCtoPR6vnkoIZk.jpg'),
(119, '22:32:04', '2024-01-08', 'test', '222301021', '0101092136', 'FOF13', NULL, '2024-01-08 08:32:22', '2024-01-08 08:32:22', 'SUBMITTED', 'assets/images/student/DbjDFsCH3qDsGD4qIe7bdrvVC8z61Bwhayh2yZQh.jpg'),
(120, '22:34:27', '2024-01-08', 'test', '222301021', '0101092136', 'FOF18', NULL, '2024-01-08 08:35:06', '2024-01-08 08:35:06', 'SUBMITTED', 'assets/images/student/0HaFknErPEmNPL7HcmcgarOVJvK4IWZCQJjoddQf.jpg'),
(121, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:37:37', '2024-01-08 08:37:37', 'SUBMITTED', 'assets/images/student/CgKYRscCpodWB1bHWhxkiM0OyyHq0kx9mVARXTDQ.jpg'),
(122, '22:41:33', '2024-01-08', 'test', '222301021', '0101092136', 'FOF17', NULL, '2024-01-08 08:42:01', '2024-01-08 08:42:01', 'SUBMITTED', 'assets/images/student/gplVJ06uVsSIv3XdXx1xjn0PI1yNK1a88kYNAvad.jpg'),
(123, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:43:48', '2024-01-08 08:43:48', 'SUBMITTED', 'assets/images/student/uWqApQLbIeedW8d82gAMEahZqkC9ritSLhk1vDAB.jpg'),
(124, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:46:08', '2024-01-08 08:46:08', 'SUBMITTED', 'assets/images/student/NSXkFI8k6QuPMezKqRlEbUrnio6CK6c3fMzcIruf.jpg'),
(125, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:47:51', '2024-01-08 08:47:51', 'SUBMITTED', 'assets/images/student/W0wI92wOVDCCDMLnwqTBiwaLBvUCqoZxVVRKTC83.jpg'),
(126, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:49:28', '2024-01-08 08:49:28', 'SUBMITTED', 'assets/images/student/eyiYz1CP8lRDrHaBue0UNqXo1pGookyt9VPBhZHa.jpg'),
(127, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:49:52', '2024-01-08 08:49:52', 'SUBMITTED', 'assets/images/student/cSJp2X2KV9VQqZqwluo62NT6RO6iiXLrbB4QwNpa.jpg'),
(128, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:51:12', '2024-01-08 08:51:12', 'SUBMITTED', 'assets/images/student/pM2UVDwIHwPziHPSKRCYfI9Ezu8m2N8AM1Jdy5Wp.jpg'),
(129, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:51:40', '2024-01-08 08:51:40', 'SUBMITTED', 'assets/images/student/6OpufSdlfGnUinRlh8j9eXFyb9bnOC0bvjZLipzT.jpg'),
(130, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:54:26', '2024-01-08 08:54:26', 'SUBMITTED', 'assets/images/student/dhy9TcY5Tsf5qtvgpJczaJyyga2ZLxaYZxcJO1pu.jpg'),
(131, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:55:13', '2024-01-08 08:55:13', 'SUBMITTED', 'assets/images/student/LBlm0FaM7524Ibe8mj0hKPoq0kimqP6XAxB2dg8r.jpg'),
(132, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:57:37', '2024-01-08 08:57:37', 'SUBMITTED', 'assets/images/student/7Dxb6G0vqo8B8yP8aD9fSb9yJjPmybSPkoc6aqiJ.jpg'),
(133, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 08:58:51', '2024-01-08 08:58:51', 'SUBMITTED', 'assets/images/student/Zw4jLqEgO5dVeZ21AmRVH9Rg6VpR30jTuQJn31AU.jpg'),
(134, '12:10:00', '2011-09-29', '-', '222301023', '0101092136', 'FOF33', NULL, '2024-01-08 09:04:41', '2024-01-22 00:26:38', 'SUCCESS', 'assets/images/student/9JJj9RRRDOXE2R1qhepK5MxXlYKgLdtks2Fdrzfy.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `foul_categories`
--

CREATE TABLE `foul_categories` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `foul_categories`
--

INSERT INTO `foul_categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
('FC01', 'Sikap dan Prilaku', NULL, '2023-05-03 03:25:22', '2023-05-03 03:25:22'),
('FC02', 'Kerapian', NULL, '2023-05-03 03:30:44', '2023-05-03 03:30:44'),
('FC03', 'Kerajinan', NULL, '2023-05-03 03:30:52', '2023-05-03 03:30:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `majors`
--

INSERT INTO `majors` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
('M01', 'RPL', NULL, '2023-05-03 03:05:56', '2023-05-03 03:05:56'),
('M02', 'Akuntansi', NULL, '2023-05-03 03:06:03', '2023-05-03 03:06:03'),
('M03', 'TSM', NULL, '2023-05-03 03:06:08', '2023-05-03 03:06:08'),
('M04', 'Axioo', NULL, '2023-05-03 03:06:15', '2023-05-10 07:48:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2020_05_21_100000_create_teams_table', 1),
(12, '2020_05_21_200000_create_team_user_table', 1),
(13, '2020_05_21_300000_create_team_invitations_table', 1),
(14, '2023_03_19_071330_create_sessions_table', 1),
(15, '2023_03_19_072243_create_foul_categories_table', 1),
(16, '2023_03_19_072305_create_form_of_fouls_table', 1),
(17, '2023_03_19_072319_create_parents_table', 1),
(18, '2023_03_19_072339_create_teachers_table', 1),
(19, '2023_03_19_072340_create_majors_table', 1),
(20, '2023_03_19_072343_create_students_table', 1),
(21, '2023_03_19_072428_create_fouls_table', 1),
(22, '2023_03_19_072457_create_class_rooms_table', 1),
(23, '2023_05_04_135425_add_id_parent_to_student_table', 2),
(24, '2023_05_06_021827_add_id_class_room_to_student_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_and_place_of_birth` date DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `parents`
--

INSERT INTO `parents` (`id`, `name`, `username`, `password`, `remember_token`, `date_and_place_of_birth`, `phone_number`, `address`, `profile_photo_path`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'Dimas', 'asdsadsdsd1322', '$2y$10$Z1bTnNH0X082.PDX65zrcOnF2FyFD6k48ylL9nG9.8NmEr75gwffa', NULL, '2011-09-29', '+6285312858608', 'adress', NULL, NULL, '2023-05-04 06:32:28', '2023-09-21 19:10:20'),
(5, 'Danang', 'danang', '$2y$10$bZNvrXt0jPe0dE7WSSLPte9q4mT.mPSXnmQVX3BplNodK6k/1Co7a', NULL, '2023-05-16', '132123123', 'dsadsad', NULL, NULL, '2023-05-15 19:28:16', '2023-05-15 19:28:16'),
(6, 'Daffa', 'daffa', '$2y$10$UuEoimAX3tPyg5wOVSXiIuR7s6sH0CISVPp8YeAem0goA.iFNrvtK', NULL, '2011-09-29', '+6285798417093', 'adress', NULL, NULL, '2023-07-23 15:53:27', '2023-07-23 15:53:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', '8b5c3b8adbab76d6ebe4943613d45eb5c9fb99943404a6dcf094182cc7d62635', '[\"*\"]', '2024-01-11 09:40:00', '2023-05-03 03:05:21', '2024-01-11 09:40:00'),
(2, 'App\\Models\\Student', 12, 'authToken', '4f720ba5a424b11431c30f96ca3f94bc6b58389ef2e60569f62389afed267925', '[\"*\"]', NULL, '2023-05-15 03:42:52', '2023-05-15 03:42:52'),
(3, 'App\\Models\\Student', 12, 'authToken', '20459097b901678261f938c68395443d8c3d85d967847d7d3a8aab0bb3f970fe', '[\"*\"]', NULL, '2023-05-15 04:03:07', '2023-05-15 04:03:07'),
(4, 'App\\Models\\Student', 12, 'authToken', 'd93e978cb42e16baf29c5b469a44bbf0726739c28696afc53c6b6b129876ce46', '[\"*\"]', NULL, '2023-05-15 06:19:15', '2023-05-15 06:19:15'),
(5, 'App\\Models\\Student', 12, 'authToken', '7a679a9a11004810cfad2ee1c35319cf21139d1b6c0170a4ca87584ae04c6082', '[\"*\"]', '2023-06-17 01:58:00', '2023-05-15 06:24:59', '2023-06-17 01:58:00'),
(6, 'App\\Models\\Parents', 5, 'authToken', 'e4121cba1dd1480d3c0357e62e7d502b2ac87796085456a8e3434f5906aba5ef', '[\"*\"]', NULL, '2023-05-15 19:31:31', '2023-05-15 19:31:31'),
(7, 'App\\Models\\Student', 12, 'authToken', '87c57c9ffdce285c3fd8bac33b1c4df7f0c1f5e21f809ed9420d97d4ad7b82c5', '[\"*\"]', '2023-05-16 02:44:53', '2023-05-16 02:38:16', '2023-05-16 02:44:53'),
(8, 'App\\Models\\Teacher', 4, 'authToken', 'bdb7c34832bb1fc1bf60733e9d4d345e02c38b1cc46b97919a5feeae5baf599d', '[\"*\"]', NULL, '2023-05-16 02:53:56', '2023-05-16 02:53:56'),
(9, 'App\\Models\\Teacher', 4, 'authToken', 'b6c54d7b6a5bad4e9747843d1531818fdd59a431c5330a806e375208fee77d35', '[\"*\"]', NULL, '2023-05-16 02:59:54', '2023-05-16 02:59:54'),
(10, 'App\\Models\\Teacher', 4, 'authToken', '6599902ab3b358c0aa38ec0247f230e209e42734fe7af78b2d6251406efcbb55', '[\"*\"]', NULL, '2023-05-16 03:00:17', '2023-05-16 03:00:17'),
(11, 'App\\Models\\Student', 12, 'authToken', 'be96681882d43ef14b80d33b464d8ed304a2957b43c59a5ea5f8cda659fc7561', '[\"*\"]', NULL, '2023-06-05 14:35:42', '2023-06-05 14:35:42'),
(12, 'App\\Models\\Student', 12, 'authToken', 'a5b6e48b84cb98605d8c79f189cac3fad6bf6b07edddfa9a1541e6b5a4ecf02c', '[\"*\"]', NULL, '2023-06-06 07:47:39', '2023-06-06 07:47:39'),
(13, 'App\\Models\\Student', 12, 'authToken', '1a597c9fe4b78cdf6439a1f8e1e19931b3bd8b9afa4d0ef938657c1d6bf4fde0', '[\"*\"]', NULL, '2023-06-07 10:20:11', '2023-06-07 10:20:11'),
(14, 'App\\Models\\Student', 12, 'authToken', '75809dff047496a85787108e5236ec2628e6c49a5fcdc2f801ff254afa97c6be', '[\"*\"]', '2023-06-07 11:19:41', '2023-06-07 11:14:18', '2023-06-07 11:19:41'),
(15, 'App\\Models\\Student', 12, 'authToken', '2925b37f51388fb85b744fab237eb95b239a2193e818267154412df8c5a7b50b', '[\"*\"]', NULL, '2023-06-08 07:51:12', '2023-06-08 07:51:12'),
(16, 'App\\Models\\Student', 12, 'authToken', '0e466fcbd927b238c85e2ec7d067da50e32ad14ddc4cfabf2b3b215c914f573e', '[\"*\"]', NULL, '2023-06-08 07:51:53', '2023-06-08 07:51:53'),
(17, 'App\\Models\\Student', 12, 'authToken', 'db03724e076567a089a38e10a87db5eb6107a706865ead84d143e51d5f7ebb76', '[\"*\"]', NULL, '2023-06-08 07:57:56', '2023-06-08 07:57:56'),
(18, 'App\\Models\\Student', 12, 'authToken', '7821f22c63edad44d2b286b5e697ae897d45cb4249820422d3a283bf8da9fe8a', '[\"*\"]', NULL, '2023-06-08 07:58:17', '2023-06-08 07:58:17'),
(19, 'App\\Models\\Student', 12, 'authToken', 'dadc991f851c5fb81ff80f5a2222a8c72fb9b1040d1e9d927d59ab9610f5f788', '[\"*\"]', NULL, '2023-06-08 07:59:09', '2023-06-08 07:59:09'),
(20, 'App\\Models\\Student', 12, 'authToken', 'bf1f9cf5489bc81b95e0fbef330a48901cbcc32c80dd899fac8b345674ff3d89', '[\"*\"]', NULL, '2023-06-08 08:01:12', '2023-06-08 08:01:12'),
(21, 'App\\Models\\Student', 12, 'authToken', '0227f952ae27e6df2c6e9f31bcf088228582a64cfaf9e3558f2ae60aa538ed5b', '[\"*\"]', NULL, '2023-06-08 08:03:09', '2023-06-08 08:03:09'),
(22, 'App\\Models\\Student', 12, 'authToken', '3b28e714257906e281fd9c3cb8d26545aadc85bcf553a307d71b48eeb5ab43a7', '[\"*\"]', NULL, '2023-06-08 08:04:48', '2023-06-08 08:04:48'),
(23, 'App\\Models\\Student', 12, 'authToken', 'e9e63f10685a99175b87085f6c9bba6613d6dfde6e5e5bab76de9022d33b2c75', '[\"*\"]', NULL, '2023-06-08 08:08:26', '2023-06-08 08:08:26'),
(24, 'App\\Models\\Student', 12, 'authToken', 'aac8be47c233a7e4848ef0532ecffa69ddb3aa87a3f59a096bd47f36db28e0d4', '[\"*\"]', NULL, '2023-06-08 08:11:34', '2023-06-08 08:11:34'),
(25, 'App\\Models\\Student', 12, 'authToken', '2274cccc7137fbc64623f9efa2a44b08eb1b8d70b1cf0cc3cf2fbf4d5fe00f56', '[\"*\"]', NULL, '2023-06-08 08:18:29', '2023-06-08 08:18:29'),
(26, 'App\\Models\\Student', 12, 'authToken', '2130887d994e9875f18afcd7d03f17a0fce1510725605cb89a991bc272d0a941', '[\"*\"]', NULL, '2023-06-08 08:19:28', '2023-06-08 08:19:28'),
(27, 'App\\Models\\Student', 12, 'authToken', '9d9deb9003e31b5ae4ed03624e705b0f7177a07aa112c07bf903978c37138f38', '[\"*\"]', NULL, '2023-06-08 08:20:50', '2023-06-08 08:20:50'),
(28, 'App\\Models\\Student', 12, 'authToken', '729c7a818eb927b509a9f9b555465eaf514dda160da1ce004dfbb760d6b2ecdc', '[\"*\"]', NULL, '2023-06-08 08:22:16', '2023-06-08 08:22:16'),
(29, 'App\\Models\\Student', 12, 'authToken', '75d12edbf932434427d1fdc6aff4e54e68fbac15a151259953e08bcfeae890c5', '[\"*\"]', NULL, '2023-06-08 08:23:17', '2023-06-08 08:23:17'),
(30, 'App\\Models\\Student', 12, 'authToken', '438d23c819127e392552b6d05fda8ae308221f894822373d503a352a24d5ae66', '[\"*\"]', NULL, '2023-06-08 08:23:56', '2023-06-08 08:23:56'),
(31, 'App\\Models\\Student', 12, 'authToken', '5849ab11abd4be5554914d3ea0bbb0fc04e212d532edffb94346d596ac44fe79', '[\"*\"]', NULL, '2023-06-08 08:25:28', '2023-06-08 08:25:28'),
(32, 'App\\Models\\Student', 12, 'authToken', '50c33fb8b9643f7c8dcf8897ed8ae05d2b9c6becb1ffb8780f347ae2d438f3b7', '[\"*\"]', NULL, '2023-06-08 08:29:08', '2023-06-08 08:29:08'),
(33, 'App\\Models\\Student', 12, 'authToken', 'db24cd4e9cb1943ad5cc8d9e6ba4e3aa11e8dc4d9c21042472ed67c1bdc4a8d6', '[\"*\"]', NULL, '2023-06-08 08:31:41', '2023-06-08 08:31:41'),
(34, 'App\\Models\\Student', 12, 'authToken', '7d218aa57aa05de004fdaa576fc7da284c134cb17fcdf68be665eded4b4bfa52', '[\"*\"]', NULL, '2023-06-08 08:32:31', '2023-06-08 08:32:31'),
(35, 'App\\Models\\Student', 12, 'authToken', '587ba96b1c70743899d68ae1c81d5dcf716b392314ff820963b6fe01a5b269fa', '[\"*\"]', NULL, '2023-06-08 08:33:01', '2023-06-08 08:33:01'),
(36, 'App\\Models\\Student', 12, 'authToken', '6eccac4dbb99c4ea1d986d12260f13dc6e1a74e3eb7c06916b70e93fac2f8ad2', '[\"*\"]', NULL, '2023-06-08 08:33:45', '2023-06-08 08:33:45'),
(37, 'App\\Models\\Student', 12, 'authToken', 'efc5f1e22d838ff2c2bce56033e84c7cbad6a920712a566e5b5301b0f633ab62', '[\"*\"]', NULL, '2023-06-08 08:34:23', '2023-06-08 08:34:23'),
(38, 'App\\Models\\Student', 12, 'authToken', 'e26d90e0a642364ea9d1ffa6eb410154b0eb4aa67e12b6a2814afa921019e3d3', '[\"*\"]', NULL, '2023-06-08 08:35:14', '2023-06-08 08:35:14'),
(39, 'App\\Models\\Student', 12, 'authToken', '19ebeb19626b12225ebb94e3bd7bf9b69b31568c8ccf3df994b53143f2931446', '[\"*\"]', NULL, '2023-06-08 08:36:10', '2023-06-08 08:36:10'),
(40, 'App\\Models\\Student', 12, 'authToken', '1f60bd5f453aa6eab45d8b563d5d92019098a8028bbe88f86384cb357f559871', '[\"*\"]', NULL, '2023-06-08 08:36:59', '2023-06-08 08:36:59'),
(41, 'App\\Models\\Student', 12, 'authToken', '1304d791e0de6c78a154156993066564fd872e771dbb5d44729df82098a40305', '[\"*\"]', NULL, '2023-06-08 16:30:10', '2023-06-08 16:30:10'),
(42, 'App\\Models\\Student', 12, 'authToken', 'c0f676ac2c0b9c01a97da40ce4f98d1ffafc2c94c6da088cc97eb279f076c873', '[\"*\"]', NULL, '2023-06-08 16:37:07', '2023-06-08 16:37:07'),
(43, 'App\\Models\\Student', 12, 'authToken', '1a8a6b99a600dd0e694d96541a16cee68eeedc6c2599f92107fc1de30d36425c', '[\"*\"]', NULL, '2023-06-08 16:42:08', '2023-06-08 16:42:08'),
(44, 'App\\Models\\Student', 12, 'authToken', '4e8b0d0411c300bffda8bbe06e929cc514e7b879a15fa60470bda9c90aef1548', '[\"*\"]', NULL, '2023-06-08 16:47:29', '2023-06-08 16:47:29'),
(45, 'App\\Models\\Student', 12, 'authToken', '3343ee80a904455091011ccf2c1920ce90a55107f398dc343a443c5d6e4f6e90', '[\"*\"]', NULL, '2023-06-08 16:49:30', '2023-06-08 16:49:30'),
(46, 'App\\Models\\Student', 12, 'authToken', 'ca98c0025e2cf2c15f29ac50918053ce7bf57f9903c9dede8388a4404e05d07b', '[\"*\"]', NULL, '2023-06-08 16:52:34', '2023-06-08 16:52:34'),
(47, 'App\\Models\\Student', 12, 'authToken', 'd8d8000444c1608853776eda39f5921d49d0bbe5cbe1cf60ad01843d0db7743a', '[\"*\"]', NULL, '2023-06-08 17:30:46', '2023-06-08 17:30:46'),
(48, 'App\\Models\\Student', 12, 'authToken', '3d80357814a88e74d0425a729bb59f317191a5f2cfb6cd22bee99342f9bef7dc', '[\"*\"]', NULL, '2023-06-09 07:08:47', '2023-06-09 07:08:47'),
(49, 'App\\Models\\Teacher', 4, 'authToken', '3399477b8d61eb2b094a51752a9fd949623a04e017c0e7e01ae86e23d23958f1', '[\"*\"]', NULL, '2023-06-09 07:20:04', '2023-06-09 07:20:04'),
(50, 'App\\Models\\Teacher', 4, 'authToken', 'f7ad2dc91e3f9413e2636625de9c9dc9361fd38fccd7d21ec8e3ad5df9ece153', '[\"*\"]', NULL, '2023-06-09 07:21:17', '2023-06-09 07:21:17'),
(51, 'App\\Models\\Teacher', 4, 'authToken', 'f712667cc1ce43de4afe70880393eb0e0b03eaad3c698e8750c29db4aaa90f7a', '[\"*\"]', NULL, '2023-06-09 07:21:44', '2023-06-09 07:21:44'),
(52, 'App\\Models\\Teacher', 4, 'authToken', 'cdd788bb17c210007790e812778205874cc0f123fa3a0b50ee6c21694a1d2df3', '[\"*\"]', NULL, '2023-06-09 07:27:02', '2023-06-09 07:27:02'),
(53, 'App\\Models\\Teacher', 4, 'authToken', '801ac9740e3f4994aee2c41a5db3bb370ade788b13f87025ca17d1ae77044ac9', '[\"*\"]', NULL, '2023-06-09 10:05:16', '2023-06-09 10:05:16'),
(54, 'App\\Models\\Student', 12, 'authToken', '0eb85c08cd4dc79e5503bbc7779d4b8f4b8ae6f6e8c55897438a7ab3e66338b3', '[\"*\"]', NULL, '2023-06-09 15:30:55', '2023-06-09 15:30:55'),
(55, 'App\\Models\\Student', 12, 'authToken', '783f1a919632baaef4fb5ff715211d75a8dd4175c7c3660ee71c52c5c11175ce', '[\"*\"]', NULL, '2023-06-09 15:33:19', '2023-06-09 15:33:19'),
(56, 'App\\Models\\Student', 12, 'authToken', 'f7fc5814509801bbafd540c9d573a8447d8f5174d240a2b334db1667f257682e', '[\"*\"]', NULL, '2023-06-09 15:36:47', '2023-06-09 15:36:47'),
(57, 'App\\Models\\Teacher', 4, 'authToken', '42145fb00943b0ca6611a6775fe62b299f5e2a6723a4e515ca4ecaa2a3b863c4', '[\"*\"]', NULL, '2023-06-09 15:38:47', '2023-06-09 15:38:47'),
(58, 'App\\Models\\Teacher', 4, 'authToken', '4bad52c2ee6dbc2aab8e90b99486d5e32465543c3874609df7a1e1dd678f440f', '[\"*\"]', NULL, '2023-06-09 17:51:20', '2023-06-09 17:51:20'),
(59, 'App\\Models\\Teacher', 4, 'authToken', '292b00239aaf56b39b4b64108b0fb78722486bd1e56047aee0d8993a9967acd5', '[\"*\"]', NULL, '2023-06-10 01:45:53', '2023-06-10 01:45:53'),
(60, 'App\\Models\\Teacher', 4, 'authToken', '3e7906bed9c52af3f76e7124608fbf319cdd5b7f37e1b8f3f1331e9cd02e64f7', '[\"*\"]', NULL, '2023-06-10 02:00:27', '2023-06-10 02:00:27'),
(61, 'App\\Models\\Teacher', 4, 'authToken', 'df166ee1114091bf7bd4fa6182c973185583b82019f3fe78a0cd4f527e2074ba', '[\"*\"]', NULL, '2023-06-10 06:04:06', '2023-06-10 06:04:06'),
(62, 'App\\Models\\Teacher', 4, 'authToken', '3cc2e84ac2e5cc9a289e72212412729e0b1413f0b56e8503710e82494af32cec', '[\"*\"]', NULL, '2023-06-10 06:09:57', '2023-06-10 06:09:57'),
(63, 'App\\Models\\Teacher', 4, 'authToken', '5ec65a7186ab574df0b3fffb138666ffef7d65ae2b70616a37333b8282fba1e9', '[\"*\"]', NULL, '2023-06-10 06:11:33', '2023-06-10 06:11:33'),
(64, 'App\\Models\\Teacher', 4, 'authToken', '39629a02d4ec70842360bcc4a7bf141403e487bf8a57524b632bc611359e8ee2', '[\"*\"]', NULL, '2023-06-10 06:14:43', '2023-06-10 06:14:43'),
(65, 'App\\Models\\Teacher', 4, 'authToken', '3dbca2b9c457c1ce2619b074df603ccf48715dbf95bec637faf23ddcd018c1d6', '[\"*\"]', NULL, '2023-06-10 06:16:32', '2023-06-10 06:16:32'),
(66, 'App\\Models\\Teacher', 4, 'authToken', 'df4f036ed177b69e54c6a7604a69aa845ecb1822a3be9b457a9449873b3f2480', '[\"*\"]', NULL, '2023-06-10 06:19:06', '2023-06-10 06:19:06'),
(67, 'App\\Models\\Teacher', 4, 'authToken', 'e1a9a2e22a00074b4c07c017bc3222347ba9f39927259dad3317fe7dc6c5ebbe', '[\"*\"]', NULL, '2023-06-10 06:34:52', '2023-06-10 06:34:52'),
(68, 'App\\Models\\Teacher', 4, 'authToken', 'a67bb02dfd4088defd632a247c8f456d563aa05e15ec340654f82c6a448860b3', '[\"*\"]', NULL, '2023-06-10 06:35:54', '2023-06-10 06:35:54'),
(69, 'App\\Models\\Teacher', 4, 'authToken', '1893bdfe911e40e69880bb88363dbe9a991ab9ae3e7e3a2886404cb9739f3156', '[\"*\"]', NULL, '2023-06-10 06:36:53', '2023-06-10 06:36:53'),
(70, 'App\\Models\\Teacher', 4, 'authToken', '71ccf925ffba4918d69395fce8fb92a5c600160b8c4aed154ad3ccf72cd3fbc0', '[\"*\"]', NULL, '2023-06-10 06:51:07', '2023-06-10 06:51:07'),
(71, 'App\\Models\\Teacher', 4, 'authToken', '8f6cac48b2a652cf4774e6456b438bdfa16a4c06fb88d5b306ea60c77dad47d9', '[\"*\"]', NULL, '2023-06-10 08:22:36', '2023-06-10 08:22:36'),
(72, 'App\\Models\\Teacher', 4, 'authToken', 'e6accdb400a6397cc4570613758c7bf4c0b8d28a371da5428e853ce2687773f0', '[\"*\"]', NULL, '2023-06-10 08:24:42', '2023-06-10 08:24:42'),
(73, 'App\\Models\\Teacher', 4, 'authToken', '7efca3788e4ee4d306c0c7c1636c6a4fe01891da6fe852713f121f42738fda90', '[\"*\"]', NULL, '2023-06-10 08:53:37', '2023-06-10 08:53:37'),
(74, 'App\\Models\\Teacher', 4, 'authToken', 'd00e5a4fc143ae9d967f02e02bb4c8d4a1fe87d21b46d6a995d878acf363178a', '[\"*\"]', NULL, '2023-06-15 09:13:47', '2023-06-15 09:13:47'),
(75, 'App\\Models\\Teacher', 4, 'authToken', 'f0ae6550a0e449413b310893a40c54424d181aeaa6d53bb22ed1c0f9e37b0a25', '[\"*\"]', '2023-08-22 21:16:08', '2023-06-15 09:16:20', '2023-08-22 21:16:08'),
(76, 'App\\Models\\Teacher', 4, 'authToken', 'da0c4953730dfd607efecaad27b3a68f934310ce1fa3adf08d6d6a3a79f829db', '[\"*\"]', NULL, '2023-06-15 09:19:14', '2023-06-15 09:19:14'),
(77, 'App\\Models\\Student', 12, 'authToken', 'e06874a4b3bceaf3877ed1df8f30026f4bd6f67f03988e0adf7db3db555173a7', '[\"*\"]', NULL, '2023-06-15 17:27:49', '2023-06-15 17:27:49'),
(78, 'App\\Models\\Student', 12, 'authToken', '50ceb9ce5e286a1bc6fc117f6e1fb2b281393e6662dd7e60ba04f2bfcdecae4f', '[\"*\"]', NULL, '2023-06-15 17:28:51', '2023-06-15 17:28:51'),
(79, 'App\\Models\\Student', 12, 'authToken', 'aa0c2027456bfe3f7be5cfeaacf0acf6bbb4c17f1bb493a6b9e8aada6bf825a6', '[\"*\"]', NULL, '2023-06-15 19:18:39', '2023-06-15 19:18:39'),
(80, 'App\\Models\\Student', 12, 'authToken', '07783534fe9bbfa4ab8f1e8df0bfe4f1487afb9b3d1c2052d5d262682d05125b', '[\"*\"]', NULL, '2023-06-15 19:19:35', '2023-06-15 19:19:35'),
(81, 'App\\Models\\Teacher', 4, 'authToken', 'a2bde13e8db84d86f896fac720186b9b7498d4930f58ef99e30d405fc391bec0', '[\"*\"]', NULL, '2023-06-16 01:41:02', '2023-06-16 01:41:02'),
(82, 'App\\Models\\Teacher', 4, 'authToken', '6977ed7672b64ac09a4bceeeee9a612b69fe5dc14cdb99c5f97aa28dad388e97', '[\"*\"]', NULL, '2023-06-16 01:45:29', '2023-06-16 01:45:29'),
(83, 'App\\Models\\Teacher', 4, 'authToken', '6deb22d36f3db8e7b5baad4772a5ae997dec88b567a624ea059a75cf58152d42', '[\"*\"]', NULL, '2023-06-16 07:42:02', '2023-06-16 07:42:02'),
(84, 'App\\Models\\Teacher', 4, 'authToken', 'c08093460b387325933b15eb84f07bd053907409a5631b9353a03880f63e9158', '[\"*\"]', NULL, '2023-06-16 07:42:26', '2023-06-16 07:42:26'),
(85, 'App\\Models\\Teacher', 4, 'authToken', 'fb7edcbb38dc277e3f2a2ac3efa255d79f183c90d7fb21da8f5e61b9c63b241f', '[\"*\"]', NULL, '2023-06-16 07:48:44', '2023-06-16 07:48:44'),
(86, 'App\\Models\\Teacher', 4, 'authToken', 'a6eccb762d2b924db4a0844b833205683b1107db18ef8397f27ec99c1ecfb5a6', '[\"*\"]', NULL, '2023-06-16 07:50:27', '2023-06-16 07:50:27'),
(87, 'App\\Models\\Teacher', 4, 'authToken', '8baaf28b2a58729a89e19ee684a83814aa3e943ce74239e6515bee1569944cb7', '[\"*\"]', NULL, '2023-06-16 07:55:05', '2023-06-16 07:55:05'),
(88, 'App\\Models\\Teacher', 4, 'authToken', '1e6c2eb2bd90c6a09144ad6684354fda4fec7806bb711a51a1a66561147dbce5', '[\"*\"]', NULL, '2023-06-16 07:58:50', '2023-06-16 07:58:50'),
(89, 'App\\Models\\Teacher', 4, 'authToken', '7141e40539b1484f37b956cde374436d6665c117c03de349c72d0a63c7aa28da', '[\"*\"]', NULL, '2023-06-16 08:01:42', '2023-06-16 08:01:42'),
(90, 'App\\Models\\Teacher', 4, 'authToken', 'fb557402ec5ff2a2849fbd008bf6844301c499c86bbccfb85ae6e5b9e9f9d553', '[\"*\"]', NULL, '2023-06-16 08:03:36', '2023-06-16 08:03:36'),
(91, 'App\\Models\\Teacher', 4, 'authToken', '4189cebb34f87e58a17c83cbbb4af98902b2b3e1ee441189b99c6e06f2579b46', '[\"*\"]', NULL, '2023-06-16 08:10:50', '2023-06-16 08:10:50'),
(92, 'App\\Models\\Teacher', 4, 'authToken', '93993c27186986e0e92e0b9186b41619b4224e7454aa7832be3595d164c34517', '[\"*\"]', NULL, '2023-06-16 08:11:53', '2023-06-16 08:11:53'),
(93, 'App\\Models\\Teacher', 4, 'authToken', '6b97ea7379d92cd30cc67fc1b79b6783bcf8efa4d2a920f3ae0a0a56a2b2fd7a', '[\"*\"]', NULL, '2023-06-16 08:13:26', '2023-06-16 08:13:26'),
(94, 'App\\Models\\Teacher', 4, 'authToken', 'f946c591064b960187426e070ba77b1fcd7d39385812118cefd16be54b45d794', '[\"*\"]', NULL, '2023-06-16 08:14:33', '2023-06-16 08:14:33'),
(95, 'App\\Models\\Teacher', 4, 'authToken', '296ddbaaeb1bc0aee985b575216527f4c58827b8fdd368ed79830077ef2189d2', '[\"*\"]', NULL, '2023-06-16 08:16:29', '2023-06-16 08:16:29'),
(96, 'App\\Models\\Teacher', 4, 'authToken', 'a04fd85ecbd0b9859a51ae7833a2308e55df680118cb9c4dcb5a7d82d99ecdc7', '[\"*\"]', NULL, '2023-06-16 09:33:52', '2023-06-16 09:33:52'),
(97, 'App\\Models\\Teacher', 4, 'authToken', '5fea4ea60245c7f8ffb1e85d9afd5616e730f6a92b32833f87150fb801947e58', '[\"*\"]', NULL, '2023-06-16 09:39:13', '2023-06-16 09:39:13'),
(98, 'App\\Models\\Teacher', 4, 'authToken', '9b0afd1c3d2f51126d2738c4d233477dc16b465d20446ae0d31c1235a8f34e99', '[\"*\"]', NULL, '2023-06-16 09:40:15', '2023-06-16 09:40:15'),
(99, 'App\\Models\\Teacher', 4, 'authToken', '15f4751e041e9e7139d5dd549a36caf9965bba5bb72220131d2a83c3d39c2f8e', '[\"*\"]', NULL, '2023-06-16 09:43:20', '2023-06-16 09:43:20'),
(100, 'App\\Models\\Teacher', 4, 'authToken', 'e05c2bb83c3c50bf5f2b9e8c30bb418bef0a44df3a05640008c20ec1b2e980a1', '[\"*\"]', NULL, '2023-06-16 17:41:00', '2023-06-16 17:41:00'),
(101, 'App\\Models\\Teacher', 4, 'authToken', 'f05b58299c25cc364360d12d17f3ff2edc995d136588925778c9f6465f94db56', '[\"*\"]', NULL, '2023-06-16 17:43:15', '2023-06-16 17:43:15'),
(102, 'App\\Models\\Teacher', 4, 'authToken', 'e16a1a4d87d35a32327ce00641306bcc11963852596c49da7550dfc98a988e34', '[\"*\"]', NULL, '2023-06-16 20:45:40', '2023-06-16 20:45:40'),
(103, 'App\\Models\\Teacher', 4, 'authToken', '376ff2c250d1d3ee34d414fb29a7190ae93dccb4a7b8a8d23f1bc5b20a85ea05', '[\"*\"]', NULL, '2023-06-16 20:56:21', '2023-06-16 20:56:21'),
(104, 'App\\Models\\Teacher', 4, 'authToken', 'a20f115e72e7267e2ca8344b73472972c9ef0843b26e02843fda09f616152cd9', '[\"*\"]', NULL, '2023-06-16 20:57:39', '2023-06-16 20:57:39'),
(105, 'App\\Models\\Teacher', 4, 'authToken', 'c5690ca289d54491715f72c47b3b495dbb3c6786bd09630420f2d5b7b294ad17', '[\"*\"]', NULL, '2023-06-16 21:05:31', '2023-06-16 21:05:31'),
(106, 'App\\Models\\Teacher', 4, 'authToken', '8292c5bf4e1c4fb57f42add193c88c25edfaa7adeb0320d3943aadce7c504551', '[\"*\"]', NULL, '2023-06-16 21:51:53', '2023-06-16 21:51:53'),
(107, 'App\\Models\\Teacher', 4, 'authToken', '8beea0e536eba94550f34c7a044367683171a470aae6295a8036be095dcea616', '[\"*\"]', NULL, '2023-06-16 22:47:18', '2023-06-16 22:47:18'),
(108, 'App\\Models\\Student', 12, 'authToken', '850a1e5404027d4d9513ba55c76362d8cfed1a91f2d80dc863b0be5cabf01908', '[\"*\"]', NULL, '2023-06-17 00:32:34', '2023-06-17 00:32:34'),
(109, 'App\\Models\\Student', 12, 'authToken', 'b625303c40590df297fbb32810205b725fd8c80aadf8ba01af8ec1f0b3d499b6', '[\"*\"]', NULL, '2023-06-17 08:35:23', '2023-06-17 08:35:23'),
(110, 'App\\Models\\Student', 12, 'authToken', '96c6dafb913fc6c833053333aaf1c39f2949a38525df7244bc323800df5b9c94', '[\"*\"]', NULL, '2023-06-18 03:13:14', '2023-06-18 03:13:14'),
(111, 'App\\Models\\Student', 12, 'authToken', 'c3b2c75e05af202f46e8f972553ba61967524de8d6301f13ff9c1777cf072a48', '[\"*\"]', NULL, '2023-06-18 07:02:30', '2023-06-18 07:02:30'),
(112, 'App\\Models\\Student', 12, 'authToken', '6813f59d4ea13b06706966e2433c87b3b9a7ab0afbebc6090d606ebbcdd4a692', '[\"*\"]', NULL, '2023-06-18 08:11:25', '2023-06-18 08:11:25'),
(113, 'App\\Models\\Teacher', 4, 'authToken', '92de6f79f9aa3f6feb75c51422f2214c6cc42581c6a08481ad5831fbdc2ffedc', '[\"*\"]', NULL, '2023-06-18 08:13:10', '2023-06-18 08:13:10'),
(114, 'App\\Models\\Student', 12, 'authToken', '30104dd5ae592b659488b6e72919f2eca7ed6f50552e8b935acc1c1c7561baa3', '[\"*\"]', NULL, '2023-06-24 01:24:16', '2023-06-24 01:24:16'),
(115, 'App\\Models\\Student', 12, 'authToken', '28f5703a4d55ce6f80f8ed033af6fd5a388f3ad41cf73e379f95c75c327d0d27', '[\"*\"]', NULL, '2023-06-24 01:26:08', '2023-06-24 01:26:08'),
(116, 'App\\Models\\Student', 12, 'authToken', '168b46051453d6a033ad5d30d499b332f811bcd6d6757ae86f65e8b25b5df5b1', '[\"*\"]', NULL, '2023-06-24 01:47:47', '2023-06-24 01:47:47'),
(117, 'App\\Models\\Student', 12, 'authToken', 'bf321ce73c303d8b91de6995a9b70cb3e9aef8a2ddc6675b1dad0118cc0a2865', '[\"*\"]', NULL, '2023-06-24 02:14:03', '2023-06-24 02:14:03'),
(118, 'App\\Models\\Student', 12, 'authToken', '61cfb6dc3192873cff3c9cfb056ab41faabb613f4beca7093d759ab435ce7dd0', '[\"*\"]', NULL, '2023-06-24 02:14:27', '2023-06-24 02:14:27'),
(119, 'App\\Models\\Student', 12, 'authToken', '5737775e7d06a8f10d335f2761dca7e885d1568edf11958d50dbd3913668c748', '[\"*\"]', NULL, '2023-06-24 02:56:11', '2023-06-24 02:56:11'),
(120, 'App\\Models\\Student', 12, 'authToken', '2b50d31a0715c0c779f8f72a6725428ed950bb5af665319c767a8661338fc155', '[\"*\"]', NULL, '2023-06-24 02:57:03', '2023-06-24 02:57:03'),
(121, 'App\\Models\\Student', 12, 'authToken', '5754f504300d01b8384ff6582252107b493a3b6088d29cf46ebc30402ccd1af4', '[\"*\"]', NULL, '2023-06-24 03:00:01', '2023-06-24 03:00:01'),
(122, 'App\\Models\\Student', 12, 'authToken', '07da04868c765b9658f0ed5fcdf89d8203122c15bd7fbce8aad97df22354ee63', '[\"*\"]', NULL, '2023-06-24 03:06:32', '2023-06-24 03:06:32'),
(123, 'App\\Models\\Student', 12, 'authToken', '8a1d754f93cfd985e9e661828f89e002f5eb5881610675184e8ffa7766518ce2', '[\"*\"]', NULL, '2023-06-24 03:08:10', '2023-06-24 03:08:10'),
(124, 'App\\Models\\Student', 12, 'authToken', 'db10d084dfe29db4906e84571052eab45f0aaba2103d28f2e8dd7ba304fa4e2a', '[\"*\"]', NULL, '2023-06-24 03:09:40', '2023-06-24 03:09:40'),
(125, 'App\\Models\\Student', 12, 'authToken', '37ab5855430f1a500e8de71e5598da89e66836405359cc00dc8e71736e9aea02', '[\"*\"]', NULL, '2023-06-24 03:13:17', '2023-06-24 03:13:17'),
(126, 'App\\Models\\Student', 12, 'authToken', '6838758eda5d2cda2916d77c6a459d39d1151e9285f7f080ef41b4b6a7742b44', '[\"*\"]', NULL, '2023-06-24 03:14:27', '2023-06-24 03:14:27'),
(127, 'App\\Models\\Student', 12, 'authToken', 'ee6fe63afb243157599dc96bdfa1c1ab06086456f209a710861666b8d7e27cd4', '[\"*\"]', NULL, '2023-06-24 03:15:40', '2023-06-24 03:15:40'),
(128, 'App\\Models\\Student', 12, 'authToken', '7d7834c4982a6d56406a10f02dac45ad033c5ba06ac519985a480daaae8c7fb0', '[\"*\"]', NULL, '2023-06-24 03:16:48', '2023-06-24 03:16:48'),
(129, 'App\\Models\\Student', 12, 'authToken', '981e4aca7b2fe8429192e611d1e074b724d6ced27c5ba61b77352959a0519afd', '[\"*\"]', NULL, '2023-06-24 03:17:33', '2023-06-24 03:17:33'),
(130, 'App\\Models\\Student', 12, 'authToken', '31c44debf379901f617a09d2e264b49051bd8372aca78aade5298d9ab05e444c', '[\"*\"]', NULL, '2023-06-24 03:18:56', '2023-06-24 03:18:56'),
(131, 'App\\Models\\Student', 12, 'authToken', '357f0e3c8ca6be0d1252caf322d569bd2db883b261faa6f30d73f8a02b7f69fb', '[\"*\"]', NULL, '2023-06-24 03:19:47', '2023-06-24 03:19:47'),
(132, 'App\\Models\\Teacher', 4, 'authToken', '9830f9fc37819fdf7fdad476ca05ca964a61af7b7bc1f93146f1ef40d4838ef2', '[\"*\"]', NULL, '2023-06-24 07:30:57', '2023-06-24 07:30:57'),
(133, 'App\\Models\\Teacher', 4, 'authToken', '48fc7d2cb2b30ec106136b5b4f6335608b73a39074c8c9f8a1aba9801a6f34aa', '[\"*\"]', NULL, '2023-06-24 07:54:31', '2023-06-24 07:54:31'),
(134, 'App\\Models\\Teacher', 4, 'authToken', '579fed09a15d8adabdfb3c8d596970eb236244b877ffceb4475726246dd05975', '[\"*\"]', NULL, '2023-06-24 07:57:16', '2023-06-24 07:57:16'),
(135, 'App\\Models\\Teacher', 4, 'authToken', '1d51219437a01a5972a106e84467c3ea19958ae487f16c0c27a687e610d7d8e1', '[\"*\"]', NULL, '2023-06-24 16:01:58', '2023-06-24 16:01:58'),
(136, 'App\\Models\\Teacher', 4, 'authToken', 'c36002ba128f67463ad0f1cd1551a5579ba57036dc0b47346b4ea57468849f24', '[\"*\"]', NULL, '2023-06-24 16:03:36', '2023-06-24 16:03:36'),
(137, 'App\\Models\\Teacher', 4, 'authToken', 'cc837830b4ba358325f88ff6ab4f43dd0b60326ccf66017b30ef7526e05c90b9', '[\"*\"]', NULL, '2023-06-24 16:13:32', '2023-06-24 16:13:32'),
(138, 'App\\Models\\Student', 19, 'authToken', 'fb6eb07b46e66e756a989b40b7ee01f18c3532710ce4b2d5b9a08baff6248a2c', '[\"*\"]', NULL, '2023-06-26 23:21:42', '2023-06-26 23:21:42'),
(139, 'App\\Models\\Student', 19, 'authToken', '72db97f90132608fb6d823f953b76c593124c8e69297f00c4dd2fe40162ddeba', '[\"*\"]', NULL, '2023-06-26 23:22:01', '2023-06-26 23:22:01'),
(140, 'App\\Models\\Student', 19, 'authToken', '90f079b99ccbe774c32967762f0383c9bd8d2c7101837fece94df58b0a73b059', '[\"*\"]', NULL, '2023-06-26 23:22:35', '2023-06-26 23:22:35'),
(141, 'App\\Models\\Student', 19, 'authToken', 'd85f566c27e8bd8bd838edf26777e9191b04fdc3dfa2b251940957c464ea5e17', '[\"*\"]', NULL, '2023-06-26 23:23:01', '2023-06-26 23:23:01'),
(142, 'App\\Models\\Student', 19, 'authToken', '43527158c773c6de6dac3f27e5ece85c85b1d54f9efac563dc64b7e2e4fd95b9', '[\"*\"]', NULL, '2023-06-26 23:23:13', '2023-06-26 23:23:13'),
(143, 'App\\Models\\Student', 19, 'authToken', 'd79e6bbc5b133c6f7a0a204a341d5be0719ad70714cdc75458d301d9f34d15e8', '[\"*\"]', NULL, '2023-06-26 23:23:25', '2023-06-26 23:23:25'),
(144, 'App\\Models\\Student', 19, 'authToken', '70220bce011c3f6f4ac32ac7972da8aa53702e22f3e1df8f74157a6c44644512', '[\"*\"]', NULL, '2023-06-26 23:23:30', '2023-06-26 23:23:30'),
(145, 'App\\Models\\Student', 19, 'authToken', 'b3ed53eccf389d89be519ce1720b17974f2e3bb37f82b386a3eb4052e12ff4fd', '[\"*\"]', NULL, '2023-06-26 23:26:55', '2023-06-26 23:26:55'),
(146, 'App\\Models\\Student', 19, 'authToken', '69bc4f1957b26a5146420ff39e7c0809c1415ebf9927028297ae065076053193', '[\"*\"]', NULL, '2023-06-26 23:27:50', '2023-06-26 23:27:50'),
(147, 'App\\Models\\Student', 19, 'authToken', 'd4800beb6c9b1a7fcbfce535655c1e1a909af311580dcf1d7c359cda8224fde1', '[\"*\"]', NULL, '2023-06-26 23:28:06', '2023-06-26 23:28:06'),
(148, 'App\\Models\\Student', 19, 'authToken', '2805e40b5a2279ac993cf0922000b93b88f33ca7b7529032e3a12216fe8164c9', '[\"*\"]', NULL, '2023-06-26 23:30:35', '2023-06-26 23:30:35'),
(149, 'App\\Models\\Student', 19, 'authToken', '0a8c3f05c4c03ea7e8835ab8e2a64d1bede1dcd533621a4ecb279dbda33f3080', '[\"*\"]', NULL, '2023-06-26 23:30:57', '2023-06-26 23:30:57'),
(150, 'App\\Models\\Student', 19, 'authToken', '4493971f43b5e02e52845c93501d3004157ea2f75c5bb85e09fa36141cf23ad1', '[\"*\"]', NULL, '2023-06-26 23:32:07', '2023-06-26 23:32:07'),
(151, 'App\\Models\\Student', 18, 'authToken', '06aa4f204ad64de9aeaf3fcca2e1bc03ea20a8e410aacaed743b515dd55ab49c', '[\"*\"]', NULL, '2023-06-26 23:36:13', '2023-06-26 23:36:13'),
(152, 'App\\Models\\Student', 12, 'authToken', '5a9fe8598bb4d8b839632cb0e91b87591b4cda601fca1312075adf93ed84704f', '[\"*\"]', NULL, '2023-06-26 23:41:26', '2023-06-26 23:41:26'),
(153, 'App\\Models\\Student', 12, 'authToken', '1af3c0010f863ddac34f24f81550c48aec112ff5b1537b336abd53d324bc289a', '[\"*\"]', NULL, '2023-06-26 23:41:47', '2023-06-26 23:41:47'),
(154, 'App\\Models\\Teacher', 4, 'authToken', '4aa3ef61f80a1604b54844529169991cf804d167b72ef53d587854fada01b85b', '[\"*\"]', NULL, '2023-06-26 23:42:53', '2023-06-26 23:42:53'),
(155, 'App\\Models\\Teacher', 4, 'authToken', 'cc5c8bb095141ed67820f26999d9ca9fc18a1d898f5c31e6acfa5cdb6704a5e1', '[\"*\"]', NULL, '2023-06-26 23:43:36', '2023-06-26 23:43:36'),
(156, 'App\\Models\\Student', 12, 'authToken', '773a339e98c9f55cf1e02245680d885dd108f50a452bdc253097f3c9d94b3354', '[\"*\"]', NULL, '2023-06-26 23:43:41', '2023-06-26 23:43:41'),
(157, 'App\\Models\\Student', 12, 'authToken', '3709c48723b56aef6d2b5a8bb54e328193404642f63385fe65f7200847c942fd', '[\"*\"]', NULL, '2023-06-26 23:43:59', '2023-06-26 23:43:59'),
(158, 'App\\Models\\Student', 12, 'authToken', '7bed6335df248205b37c5e70428be9a6676dc0a8e78c78a7df48821d853ad0d0', '[\"*\"]', NULL, '2023-06-26 23:44:13', '2023-06-26 23:44:13'),
(159, 'App\\Models\\Student', 12, 'authToken', 'b6bef74ee3a22fb509be45d9633e158d68d28924b924f0f3964d54659014e230', '[\"*\"]', NULL, '2023-06-26 23:44:29', '2023-06-26 23:44:29'),
(160, 'App\\Models\\Student', 12, 'authToken', 'e5ea12fc6b7a30c159333f3547bb43f6fe161db5f395729d045f4fab9309fd80', '[\"*\"]', NULL, '2023-06-26 23:45:01', '2023-06-26 23:45:01'),
(161, 'App\\Models\\Student', 12, 'authToken', 'ebfc326f91e25882760298a979b1b010856e8ed03717e180b777c07b3014d9b5', '[\"*\"]', NULL, '2023-06-26 23:45:21', '2023-06-26 23:45:21'),
(162, 'App\\Models\\Student', 12, 'authToken', '5040cddd4125ddf97bd0bd9d741f999ec3551d453befb1b50577aa6741e561f1', '[\"*\"]', NULL, '2023-06-26 23:46:57', '2023-06-26 23:46:57'),
(163, 'App\\Models\\Student', 12, 'authToken', 'ce6675b48cf9d406fe2d010a24728ab003cf105ffb81f096ed8ef088e34318da', '[\"*\"]', NULL, '2023-06-26 23:48:11', '2023-06-26 23:48:11'),
(164, 'App\\Models\\Student', 12, 'authToken', '573d626e6ad3538398fe486deef1e73e813f5dd78cfd3a62d6f1b148b802de03', '[\"*\"]', NULL, '2023-06-26 23:48:36', '2023-06-26 23:48:36'),
(165, 'App\\Models\\Teacher', 4, 'authToken', '7c4b96270982c70dcda8f60ba2f39c315a69dc676439c794e1177775fda2d71e', '[\"*\"]', NULL, '2023-06-26 23:50:56', '2023-06-26 23:50:56'),
(166, 'App\\Models\\Student', 12, 'authToken', 'df22f3b5e4d1e511ffd85b4a7e9b6ffd7ecf68ab8d3e866e82878fea505f6ef2', '[\"*\"]', NULL, '2023-06-27 08:27:32', '2023-06-27 08:27:32'),
(167, 'App\\Models\\Student', 12, 'authToken', 'ddaf8184424082dd3f01d4940e5d5f70ccd575c072f8cb78d1bf1f85be99792c', '[\"*\"]', NULL, '2023-06-27 08:48:47', '2023-06-27 08:48:47'),
(168, 'App\\Models\\Student', 12, 'authToken', '97f1ac802d6c298b696fe96bf553d7a766d355995f79509e65cfb89c9ffa74f2', '[\"*\"]', NULL, '2023-06-27 08:55:25', '2023-06-27 08:55:25'),
(169, 'App\\Models\\Student', 12, 'authToken', '1c21ca49567cc8707dda9b1f49d017eb93b8c523eacc3c000d78a826b46ca79f', '[\"*\"]', NULL, '2023-06-27 08:56:39', '2023-06-27 08:56:39'),
(170, 'App\\Models\\Student', 12, 'authToken', '80de9068ea08774a1f6658e5be8512d6d28717415ee7a7b18b4f8825bb257953', '[\"*\"]', NULL, '2023-06-27 09:01:50', '2023-06-27 09:01:50'),
(171, 'App\\Models\\Student', 12, 'authToken', 'c5471a0cdd82cd186cdc520ef7eb78a005a0858f5daf4a1dc652954feb383e34', '[\"*\"]', NULL, '2023-06-27 09:01:56', '2023-06-27 09:01:56'),
(172, 'App\\Models\\Student', 12, 'authToken', '651c854fef499f08cab3d42417b2d7d12913a9d97c2c1dd71d4757e6155dd092', '[\"*\"]', NULL, '2023-06-27 09:03:30', '2023-06-27 09:03:30'),
(173, 'App\\Models\\Student', 12, 'authToken', 'e5fcf431f23bc7c52f7acaaafc054822538b81b37ed7b1feeed720bc93fb62bd', '[\"*\"]', NULL, '2023-06-27 09:04:05', '2023-06-27 09:04:05'),
(174, 'App\\Models\\Student', 12, 'authToken', '973d7260be03a14a1c97723feea61f33dcd00c6c2b88860ab2d0f0ceefd7f289', '[\"*\"]', NULL, '2023-06-27 09:05:35', '2023-06-27 09:05:35'),
(175, 'App\\Models\\Student', 12, 'authToken', '8ed28554a73e871a40bef31ca60a9e02ce455278e42456ffba33b15938e847a0', '[\"*\"]', NULL, '2023-06-29 07:25:20', '2023-06-29 07:25:20'),
(176, 'App\\Models\\Student', 12, 'authToken', 'ca2341c3d22174e252e634a940a73ff16ced08bde926577d923f03f408efb448', '[\"*\"]', NULL, '2023-06-29 07:29:07', '2023-06-29 07:29:07'),
(177, 'App\\Models\\Student', 12, 'authToken', '8fd734058b2c15212321d144a0e16d1b620e2cba4403c33c65fa57c78f49bb47', '[\"*\"]', NULL, '2023-06-29 09:31:43', '2023-06-29 09:31:43'),
(178, 'App\\Models\\Student', 12, 'authToken', '0c701a19b95add55ce8d0523032c413cd05378ebf428b975c38723c609a7a284', '[\"*\"]', NULL, '2023-06-29 09:34:11', '2023-06-29 09:34:11'),
(179, 'App\\Models\\Student', 12, 'authToken', '289a2c7f3636a8daca4b64b7544e730cc3ef96b6f1af4ab75f0a058cafaffbe0', '[\"*\"]', NULL, '2023-06-29 09:43:11', '2023-06-29 09:43:11'),
(180, 'App\\Models\\Student', 12, 'authToken', 'ec2286744dfe64365097625c3b7915299e5d9f5c8bfb51d670e8fd0c4f2844f1', '[\"*\"]', NULL, '2023-06-29 09:55:22', '2023-06-29 09:55:22'),
(181, 'App\\Models\\Teacher', 4, 'authToken', '8434ea24238100548d8d55a49177d98bb6115c355a06ba01c0ae0b700937ca3c', '[\"*\"]', NULL, '2023-06-30 01:24:51', '2023-06-30 01:24:51'),
(182, 'App\\Models\\Teacher', 4, 'authToken', '8b5d6630575799c460040271b95ced2a2c076f43c8c6cad5d52f4ccd7fa21a3f', '[\"*\"]', NULL, '2023-06-30 01:26:29', '2023-06-30 01:26:29'),
(183, 'App\\Models\\Teacher', 4, 'authToken', '7bc8a34608a4639b869b4e4b5c8fa7df8f97e6eab6bbbcafb8b03a49912e130e', '[\"*\"]', NULL, '2023-06-30 16:58:39', '2023-06-30 16:58:39'),
(184, 'App\\Models\\Teacher', 4, 'authToken', 'f6e573cfeb8a0fb16b85542c1759875f8cbabd5b5a47caf0cc1c147f0dfc4eb0', '[\"*\"]', NULL, '2023-07-01 07:39:23', '2023-07-01 07:39:23'),
(185, 'App\\Models\\Teacher', 4, 'authToken', '8aaac46753c4963111990ae77e0a44d8345ed8c6f270f51cacb4d18f848753be', '[\"*\"]', NULL, '2023-07-01 07:51:41', '2023-07-01 07:51:41'),
(186, 'App\\Models\\Teacher', 4, 'authToken', '7f5f6032e27d0a6bd00e4a45e61e13e44a2b720b93d4e2d7ad9f7f1ca40b4f44', '[\"*\"]', NULL, '2023-07-02 07:03:45', '2023-07-02 07:03:45'),
(187, 'App\\Models\\Teacher', 4, 'authToken', 'e6a0b39fc9281888b5c53e037964816953b482f2418e80296ede19569d5881ac', '[\"*\"]', NULL, '2023-07-02 07:59:50', '2023-07-02 07:59:50'),
(188, 'App\\Models\\Teacher', 4, 'authToken', '3bca39d1d887c629ab6ae7d9b0b628c3e599d61db9a32acc350931d3f4638c8e', '[\"*\"]', NULL, '2023-07-02 08:12:34', '2023-07-02 08:12:34'),
(189, 'App\\Models\\Teacher', 4, 'authToken', '09ab6bf7ea9d1b94d4de2ddfff4bf35db482fe3cd6c1d959fdce241ccfdfcc0c', '[\"*\"]', NULL, '2023-07-02 08:22:05', '2023-07-02 08:22:05'),
(190, 'App\\Models\\Teacher', 4, 'authToken', 'd426041a4aec2163e343d9f701aa50154115e1b6552a144638c1aea79f1e25d1', '[\"*\"]', NULL, '2023-07-02 08:41:26', '2023-07-02 08:41:26'),
(191, 'App\\Models\\Teacher', 4, 'authToken', 'f5ad0bc272a0206f0cc71899f71714b8d42bdf925702c378734c0ce851709510', '[\"*\"]', NULL, '2023-07-02 08:42:56', '2023-07-02 08:42:56'),
(192, 'App\\Models\\Teacher', 4, 'authToken', '5ba146ae7249b45b5e69f69aceaf1e65641edd3d17f43a33a2850b02ca1ce4b6', '[\"*\"]', NULL, '2023-07-02 08:44:16', '2023-07-02 08:44:16'),
(193, 'App\\Models\\Teacher', 4, 'authToken', 'b39e81facc8a8d1c5527176034d6e9d7c444aa5b356347a6c4003628c26eda57', '[\"*\"]', NULL, '2023-07-02 10:12:02', '2023-07-02 10:12:02'),
(194, 'App\\Models\\Teacher', 4, 'authToken', '36fa4f68f53829bded2bcc9db3c9567168a6d4f65210e60f7a4d06c35fcb58d1', '[\"*\"]', NULL, '2023-07-02 10:12:11', '2023-07-02 10:12:11'),
(195, 'App\\Models\\Teacher', 4, 'authToken', '939f1b4e432f670869ed299d520dda90fdd681e3bb41895b3873926caaebe8a8', '[\"*\"]', NULL, '2023-07-02 10:13:49', '2023-07-02 10:13:49'),
(196, 'App\\Models\\Teacher', 4, 'authToken', 'b5bb81c1b6ad3f0a2849f7d5b05f7a271a4de1db0e3b94ca3a93f6b7beb68b01', '[\"*\"]', NULL, '2023-07-02 10:21:13', '2023-07-02 10:21:13'),
(197, 'App\\Models\\Teacher', 4, 'authToken', '0d362d7fdecd6f3b42af62516e9534a7dd864ee840e0360e13f9be33b1ee4723', '[\"*\"]', NULL, '2023-07-02 10:42:52', '2023-07-02 10:42:52'),
(198, 'App\\Models\\Teacher', 4, 'authToken', '162b46131f9aedb4a4dbfddaac2cf5bddcb2b471acb7b6d128ec59fbc72417c0', '[\"*\"]', NULL, '2023-07-02 10:45:10', '2023-07-02 10:45:10'),
(199, 'App\\Models\\Teacher', 4, 'authToken', '8211adc5364ba4450b8479a67fdf586efa5382870c898f1d60f56d1640a86281', '[\"*\"]', NULL, '2023-07-02 10:48:41', '2023-07-02 10:48:41'),
(200, 'App\\Models\\Teacher', 4, 'authToken', '207da589fd976388982d88d94f11d11b54c26b2780c10587de300bfcc82b117d', '[\"*\"]', NULL, '2023-07-02 22:53:24', '2023-07-02 22:53:24'),
(201, 'App\\Models\\Teacher', 4, 'authToken', '60b1b9028ced62f492447248495ef673f3b1e1a317bd359f2d16d73746a0b1c8', '[\"*\"]', NULL, '2023-07-03 07:18:11', '2023-07-03 07:18:11'),
(202, 'App\\Models\\Teacher', 4, 'authToken', 'ce62bc1c1a0102e5beee6dcbc4b5e3e57cb0abd6a09bc8c212aa08ea5e4290fd', '[\"*\"]', NULL, '2023-07-03 07:21:13', '2023-07-03 07:21:13'),
(203, 'App\\Models\\Teacher', 4, 'authToken', 'af0af6a753781f83cf019148607077ccb1d1509894cb28d0da75f6f7fe232e4f', '[\"*\"]', NULL, '2023-07-03 07:26:21', '2023-07-03 07:26:21'),
(204, 'App\\Models\\Teacher', 4, 'authToken', '5c81d6f8a83c7f753a6ad8fec3d7ffce15b429d1c18e72353ffa3d9a387206a5', '[\"*\"]', NULL, '2023-07-03 07:27:23', '2023-07-03 07:27:23'),
(205, 'App\\Models\\Teacher', 4, 'authToken', '23197c7a871b6ca855ed1c72b8daee00dbc46e8cab40509af556ec9c284955e8', '[\"*\"]', NULL, '2023-07-03 07:28:16', '2023-07-03 07:28:16'),
(206, 'App\\Models\\Teacher', 4, 'authToken', '1615bd71b56e1a9a32a2f476aa7670a2628f8c98a97aef1de0031fc578f2bc83', '[\"*\"]', NULL, '2023-07-03 07:33:18', '2023-07-03 07:33:18'),
(207, 'App\\Models\\Teacher', 4, 'authToken', '864a912b72cf573d363bd47a9d8b192207327b4dcf31b5cb67dedd8dd04c260c', '[\"*\"]', NULL, '2023-07-03 09:07:08', '2023-07-03 09:07:08'),
(208, 'App\\Models\\Teacher', 4, 'authToken', '5e672d4f44e019f9e5268736edb498ace3ef1c0b391eaeee0bbb23d8803f5c4d', '[\"*\"]', NULL, '2023-07-03 09:09:28', '2023-07-03 09:09:28'),
(209, 'App\\Models\\Teacher', 4, 'authToken', '94a6cec8f86e7752eb4a1b8b895cb4ef169ce1de34c7563f666cac1dcf6fbb06', '[\"*\"]', NULL, '2023-07-03 09:14:29', '2023-07-03 09:14:29'),
(210, 'App\\Models\\Teacher', 4, 'authToken', 'a2a0f5a7f69af4ca23a173eb7ab5b35b7640402eec9a3fd0cfd5855533182986', '[\"*\"]', NULL, '2023-07-03 09:15:17', '2023-07-03 09:15:17'),
(211, 'App\\Models\\Teacher', 4, 'authToken', '3ce8e6bd53536ce5fc0e4dd8182e018b3560689b8e71fe68b08df5f2dfd53628', '[\"*\"]', NULL, '2023-07-03 09:17:02', '2023-07-03 09:17:02'),
(212, 'App\\Models\\Teacher', 4, 'authToken', '132df2b6ca9e97dc481c272b3190ddc68a600fb566f67305463f36f844a811b9', '[\"*\"]', NULL, '2023-07-03 09:17:53', '2023-07-03 09:17:53'),
(213, 'App\\Models\\Teacher', 4, 'authToken', 'e3ad89947c3b02755d9dabc86e544371c5fe4b938b44039b74af3f76a1b244af', '[\"*\"]', NULL, '2023-07-03 09:19:18', '2023-07-03 09:19:18'),
(214, 'App\\Models\\Teacher', 4, 'authToken', '94684c5e9230eaea6d76eb97398fc51e8ec4b143577d109f5e801e896e0d9992', '[\"*\"]', NULL, '2023-07-03 09:22:33', '2023-07-03 09:22:33'),
(215, 'App\\Models\\Teacher', 4, 'authToken', '930dd5c3f89d0db96da12718329771160c176abb70de385fdf36ad148a459df3', '[\"*\"]', NULL, '2023-07-03 09:24:46', '2023-07-03 09:24:46'),
(216, 'App\\Models\\Teacher', 4, 'authToken', '3183a5d83bb4f65ab47caeb484d21e28098c1373c2d1155746b15ef6bd9070a8', '[\"*\"]', NULL, '2023-07-03 09:29:04', '2023-07-03 09:29:04'),
(217, 'App\\Models\\Teacher', 4, 'authToken', 'f4aa9c0b914087948dacd96bb801981a31eda0427cfc5093e8c2289431f71371', '[\"*\"]', NULL, '2023-07-03 09:31:24', '2023-07-03 09:31:24'),
(218, 'App\\Models\\Teacher', 4, 'authToken', '4339da2365aec110126bb7889f7cfa572a00200a42b88e96f22d5af3f4e2bfd1', '[\"*\"]', NULL, '2023-07-03 09:32:18', '2023-07-03 09:32:18'),
(219, 'App\\Models\\Teacher', 4, 'authToken', 'f9adcd50c04950ec0f893ab465937ddab1c42e69b5cc8332f045dcbdb67e82e0', '[\"*\"]', NULL, '2023-07-03 09:52:09', '2023-07-03 09:52:09'),
(220, 'App\\Models\\Teacher', 4, 'authToken', '116fbffb589daaf743cc3d1ec36b3863a7b277a9dc142b5c6b70837f62e6ccd5', '[\"*\"]', NULL, '2023-07-03 09:56:12', '2023-07-03 09:56:12'),
(221, 'App\\Models\\Teacher', 4, 'authToken', '77abdd642d9e9460f3542d2ba5b796593ac88a17137638cee331fdedc8fdebbd', '[\"*\"]', NULL, '2023-07-03 19:12:16', '2023-07-03 19:12:16'),
(222, 'App\\Models\\Teacher', 4, 'authToken', '5b54a20d245868c2c31e65e662e8f1fe7069167ae77c58708025aba7d4c22bd1', '[\"*\"]', NULL, '2023-07-04 02:09:12', '2023-07-04 02:09:12'),
(223, 'App\\Models\\Teacher', 4, 'authToken', '0f1ea42f280f7abc4321a60cb2cb9828dad9d0aea632255d14572fc65fd41d16', '[\"*\"]', NULL, '2023-07-04 03:45:30', '2023-07-04 03:45:30'),
(224, 'App\\Models\\Teacher', 4, 'authToken', '6fb8f7b666460d11845155650096e1ae0b535f18e6ff6529e381281269992f28', '[\"*\"]', NULL, '2023-07-04 03:48:05', '2023-07-04 03:48:05'),
(225, 'App\\Models\\Teacher', 4, 'authToken', '03260dd4a9a2916cbe135723e8928016406ca5063665b4fb241ac8286fe8f40c', '[\"*\"]', NULL, '2023-07-04 03:58:12', '2023-07-04 03:58:12'),
(226, 'App\\Models\\Teacher', 4, 'authToken', '44ad99dc0557733310967d2c726f33decf213c0086c20df83c6013780f21d9a0', '[\"*\"]', NULL, '2023-07-04 03:59:03', '2023-07-04 03:59:03'),
(227, 'App\\Models\\Teacher', 4, 'authToken', '3f51a65438ec20e8d2166ec1f0c1c63f2aeb3a05e5241bc78ced5306d9e4d7e2', '[\"*\"]', NULL, '2023-07-04 04:01:54', '2023-07-04 04:01:54'),
(228, 'App\\Models\\Teacher', 4, 'authToken', '9a6c6efb6c9db9e8f4dda2e364837a77e0a2b45643f8c721e0c9291a60e40f6c', '[\"*\"]', NULL, '2023-07-04 05:04:09', '2023-07-04 05:04:09'),
(229, 'App\\Models\\Teacher', 4, 'authToken', '832401f8de67ff1459b98e1f3f8221153c5be6e666923b844ef20aeec6b3bbe5', '[\"*\"]', '2023-07-04 05:11:06', '2023-07-04 05:10:00', '2023-07-04 05:11:06'),
(230, 'App\\Models\\Teacher', 4, 'authToken', '4d67e8ba386718c6217eebad40baa0d26eb52404404fc552823a8020c0280619', '[\"*\"]', '2023-07-04 05:59:37', '2023-07-04 05:40:33', '2023-07-04 05:59:37'),
(231, 'App\\Models\\Teacher', 4, 'authToken', '4bf5a6349cb68822d55e1a846164bde8054c765d6920958fe03a60b1ad922b99', '[\"*\"]', NULL, '2023-07-04 06:11:38', '2023-07-04 06:11:38'),
(232, 'App\\Models\\Teacher', 4, 'authToken', '7cd1fd8afdb58426fe078055b4b3c458ca8f939e9550dc27d0a14e5d406f3c81', '[\"*\"]', NULL, '2023-07-04 06:13:46', '2023-07-04 06:13:46'),
(233, 'App\\Models\\Teacher', 4, 'authToken', 'ac0f2193097b24d8ecad2db68d53327975cc3d92be381f845f705371735b0899', '[\"*\"]', NULL, '2023-07-04 06:16:42', '2023-07-04 06:16:42'),
(234, 'App\\Models\\Teacher', 4, 'authToken', 'c33dc4c3b5530caad6e1f3f51b6ed0b6afb7a65a9671c58872106bb29ac23ef2', '[\"*\"]', '2023-07-04 06:27:33', '2023-07-04 06:27:02', '2023-07-04 06:27:33'),
(235, 'App\\Models\\Teacher', 4, 'authToken', '14a857fe31b84b5fb9e9055cb38b597c58fb4f2c12ecca0bbc39de362db3a973', '[\"*\"]', '2023-07-04 06:54:48', '2023-07-04 06:44:44', '2023-07-04 06:54:48'),
(236, 'App\\Models\\Student', 19, 'authToken', '827faff687f0ca461c7c7c0a739254ff7d1f5491d97608758e0e9b8ff6dc27ac', '[\"*\"]', NULL, '2023-07-04 06:48:38', '2023-07-04 06:48:38'),
(237, 'App\\Models\\Student', 19, 'authToken', '456e35fa6fc40d5bb9a678b7c951c9ca63f3f968296995625eb796ab904036a3', '[\"*\"]', NULL, '2023-07-04 06:51:50', '2023-07-04 06:51:50'),
(238, 'App\\Models\\Teacher', 4, 'authToken', '75872297a128da075d81c688f64ba673758fa5481ad58a14cc01b22cda9792bc', '[\"*\"]', '2023-07-04 07:53:08', '2023-07-04 07:26:30', '2023-07-04 07:53:08'),
(239, 'App\\Models\\Student', 19, 'authToken', '0da7e1324744f30864791f99cbdd6c2c0e258f599a0390d8458e29e097d62fef', '[\"*\"]', NULL, '2023-07-04 07:28:31', '2023-07-04 07:28:31'),
(240, 'App\\Models\\Teacher', 4, 'authToken', 'bd79e7dad9df215c98bfc3aa1187bd9111de9138f0da7c1c57ae071979bcb92f', '[\"*\"]', '2023-07-04 07:56:00', '2023-07-04 07:55:12', '2023-07-04 07:56:00'),
(241, 'App\\Models\\Teacher', 4, 'authToken', '47cda5266fdddc58f2466f793e2a726aee435278e465a8c08fc0710167f6b4c7', '[\"*\"]', '2023-07-04 08:07:07', '2023-07-04 08:00:46', '2023-07-04 08:07:07'),
(242, 'App\\Models\\Teacher', 4, 'authToken', 'adb3c5083faffe8c9ef6068386163faaa4f54173ead21c920e82708ccb52e9ed', '[\"*\"]', '2023-07-04 08:22:58', '2023-07-04 08:22:30', '2023-07-04 08:22:58'),
(243, 'App\\Models\\Teacher', 4, 'authToken', 'dbacee68e092805912c6ff2292fda1dc46c0a740a0d75c09621737b22f60b6bd', '[\"*\"]', '2023-07-04 08:25:13', '2023-07-04 08:24:28', '2023-07-04 08:25:13'),
(244, 'App\\Models\\Teacher', 4, 'authToken', 'f5ab03e8338d662ef54379eb43a9e18ba28ab3e9e1a6a036ebc85d4d2463ec40', '[\"*\"]', '2023-07-04 08:26:30', '2023-07-04 08:26:00', '2023-07-04 08:26:30'),
(245, 'App\\Models\\Teacher', 4, 'authToken', 'ad7a1d42424de036ae5ca6555b1a129eae245b31f8f30c3e474a52ed2a896b2d', '[\"*\"]', '2023-07-04 08:28:19', '2023-07-04 08:27:55', '2023-07-04 08:28:19'),
(246, 'App\\Models\\Teacher', 4, 'authToken', 'e4f6b0a6e54429948b580255db6c1e823709653c147aa93f0c4b64aa4c9ee63b', '[\"*\"]', '2023-07-04 08:39:37', '2023-07-04 08:36:29', '2023-07-04 08:39:37'),
(247, 'App\\Models\\Teacher', 4, 'authToken', 'bbdc5be37d179e68ae6572e346d27e685a095a6df25e22f580533e5b85c8cbf9', '[\"*\"]', NULL, '2023-07-04 10:41:07', '2023-07-04 10:41:07'),
(248, 'App\\Models\\Teacher', 4, 'authToken', '4d058a633c3e5f449fe221a5b5b82bad7d801f40647e474df34cba17c25f144e', '[\"*\"]', NULL, '2023-07-04 10:49:32', '2023-07-04 10:49:32'),
(249, 'App\\Models\\Teacher', 4, 'authToken', 'a66a60a30c589f3b701665f904a0ed15d7e48aacf241f5e40b83a912c15cc590', '[\"*\"]', NULL, '2023-07-04 10:58:23', '2023-07-04 10:58:23'),
(250, 'App\\Models\\Teacher', 4, 'authToken', 'fd239edfbb9f0fe6ae9d186e8a9067f2d51a89d1905442ac7a6d4d5aed99bf42', '[\"*\"]', NULL, '2023-07-04 11:01:56', '2023-07-04 11:01:56'),
(251, 'App\\Models\\Teacher', 4, 'authToken', 'f767a3d081a0a2b5a9e9c1bb777a1891d11b5814d5ad817524a28766f94fca2f', '[\"*\"]', NULL, '2023-07-04 11:04:16', '2023-07-04 11:04:16'),
(252, 'App\\Models\\Teacher', 4, 'authToken', '47b1e26a59003a6890c1c3dedadf86593e054dd1c678af680cca091b0c8e0469', '[\"*\"]', NULL, '2023-07-04 11:07:42', '2023-07-04 11:07:42'),
(253, 'App\\Models\\Teacher', 4, 'authToken', '4aed81ad804fb051a0174e7405e1f38096bbf4816d6c7ae947145b4f775b78d2', '[\"*\"]', NULL, '2023-07-04 19:58:09', '2023-07-04 19:58:09'),
(254, 'App\\Models\\Teacher', 4, 'authToken', '23fb8d18317cf3cd289664c1d2fc9557671ccf6d86e51ed13afa9f5897ecb7de', '[\"*\"]', NULL, '2023-07-05 09:07:04', '2023-07-05 09:07:04'),
(255, 'App\\Models\\Teacher', 4, 'authToken', '9baafd407b37f9ce41b711a08f7cfcd24cf2a8647c3ca023fa6533d18a8936dc', '[\"*\"]', NULL, '2023-07-08 01:00:09', '2023-07-08 01:00:09'),
(256, 'App\\Models\\Teacher', 4, 'authToken', '496e052fb5bc6a235f16c4dd0046e1548477166f44da8fadfacde31c16e5d83d', '[\"*\"]', NULL, '2023-07-08 01:28:27', '2023-07-08 01:28:27'),
(257, 'App\\Models\\Teacher', 4, 'authToken', 'be751e1ba7311bafbd79159150df240771718858829c1d5ec32e7c608c206862', '[\"*\"]', NULL, '2023-07-08 01:33:04', '2023-07-08 01:33:04'),
(258, 'App\\Models\\Teacher', 4, 'authToken', 'c60a0188db1207bbc490811f5ddd50dd8b530f1e26de0ce916333d4b02aba8d1', '[\"*\"]', NULL, '2023-07-08 01:35:44', '2023-07-08 01:35:44'),
(259, 'App\\Models\\Teacher', 4, 'authToken', '7daefd1c118a46f6f3ec52144caf4a514692c0d2766b3106f63c11ad641b042e', '[\"*\"]', NULL, '2023-07-08 01:37:17', '2023-07-08 01:37:17'),
(260, 'App\\Models\\Teacher', 4, 'authToken', '478c7f2283756453b484ddb2e05d9f30cded83b87b51542f6c790cdad7db0b4d', '[\"*\"]', NULL, '2023-07-08 02:36:32', '2023-07-08 02:36:32'),
(261, 'App\\Models\\Teacher', 4, 'authToken', '23da52d5443d7f5fb6fd68fb97bac4b380a08ed341611810686c417337cd9116', '[\"*\"]', NULL, '2023-07-08 02:39:56', '2023-07-08 02:39:56'),
(262, 'App\\Models\\Teacher', 4, 'authToken', '8297448bf146cbe57e73ae5a35042f14a8e340ca4bc37ac4cb180fd66b526254', '[\"*\"]', NULL, '2023-07-08 02:44:01', '2023-07-08 02:44:01'),
(263, 'App\\Models\\Teacher', 4, 'authToken', 'a0f9c5bdb35850695729fbac968f032a370bcb4c8e063c879fdd823e043f7096', '[\"*\"]', NULL, '2023-07-08 02:46:18', '2023-07-08 02:46:18'),
(264, 'App\\Models\\Teacher', 4, 'authToken', '90f822b995366c64be3878b2fd6fa13f89113124b153ae3ccb198604305684c6', '[\"*\"]', NULL, '2023-07-08 02:48:08', '2023-07-08 02:48:08'),
(265, 'App\\Models\\Teacher', 4, 'authToken', 'b783a0b4f7b09e3f95fca8ecb52b91e0884bde1f69453d36343c8868188aad08', '[\"*\"]', NULL, '2023-07-08 03:50:13', '2023-07-08 03:50:13'),
(266, 'App\\Models\\Teacher', 4, 'authToken', 'ba74dea43fb7de7fb3ea529fcfe8f9357eee160b3e83defd1b28cc119aaec3f4', '[\"*\"]', NULL, '2023-07-08 04:13:00', '2023-07-08 04:13:00'),
(267, 'App\\Models\\Teacher', 4, 'authToken', '69fc7aeab5d32f774fd14fe89f53559fb04e4fc0def1dfd3b6b67726444c5ac2', '[\"*\"]', NULL, '2023-07-08 04:18:12', '2023-07-08 04:18:12'),
(268, 'App\\Models\\Teacher', 4, 'authToken', '0950bddc43d8eb9df2a4e65dd6ecbf3217ea1a0118e6026ab6717db29b0d66c2', '[\"*\"]', NULL, '2023-07-08 07:11:29', '2023-07-08 07:11:29'),
(275, 'App\\Models\\Student', 19, 'authToken', '25b2939245e09431169c3a4ea4d1adc4283bef60651964307694dc48b0a9f024', '[\"*\"]', '2023-07-16 18:04:59', '2023-07-08 13:17:21', '2023-07-16 18:04:59'),
(276, 'App\\Models\\Student', 19, 'authToken', 'bd098e61b66338a784f7a8b3d1132d87162b7ad04453a5bcdcaeda8a8f9b6daf', '[\"*\"]', NULL, '2023-07-08 13:30:58', '2023-07-08 13:30:58'),
(277, 'App\\Models\\Teacher', 4, 'authToken', '538e0f8b1e8a9ad8d2a6bb46b7a372a8c8b3697a094bff70333f59e01c4c9b0c', '[\"*\"]', NULL, '2023-07-08 13:32:38', '2023-07-08 13:32:38'),
(278, 'App\\Models\\Teacher', 4, 'authToken', '9aa1358f8293b2b27d399456e7a7465210662b07860a000f9ba2af3a1efa32ff', '[\"*\"]', NULL, '2023-07-08 18:30:50', '2023-07-08 18:30:50'),
(279, 'App\\Models\\Teacher', 4, 'authToken', '5a345b2714953f30b5237c3557b0757d4837c935ea565f6535329225f27996b5', '[\"*\"]', NULL, '2023-07-09 05:56:53', '2023-07-09 05:56:53'),
(280, 'App\\Models\\Teacher', 4, 'authToken', '6416652077b376e854e4e5afc1593fb704bca0f8c8efe4fa37cbd0fc8466c6a7', '[\"*\"]', NULL, '2023-07-09 06:09:08', '2023-07-09 06:09:08'),
(281, 'App\\Models\\Teacher', 4, 'authToken', '17d3a3c7e58cd78c93020caac466659099c6ab1aff1210aff92329c4ad3538f7', '[\"*\"]', NULL, '2023-07-09 08:12:55', '2023-07-09 08:12:55'),
(282, 'App\\Models\\Teacher', 4, 'authToken', '39937f2a0d0885059dd0a3f17164792405f13a5663f7b8c391982ae422b26e9d', '[\"*\"]', NULL, '2023-07-09 08:13:47', '2023-07-09 08:13:47'),
(283, 'App\\Models\\Teacher', 4, 'authToken', 'd6ba001ac38d3084bf9da7abc610ccd16d4c639303bb859ac24fce91de20ebd4', '[\"*\"]', NULL, '2023-07-09 08:14:38', '2023-07-09 08:14:38'),
(284, 'App\\Models\\Teacher', 4, 'authToken', '402bec4e42e32833e1d438be1adf400aecc4dc9b0f654184308408d1a6218e09', '[\"*\"]', NULL, '2023-07-09 08:19:42', '2023-07-09 08:19:42'),
(285, 'App\\Models\\Teacher', 4, 'authToken', '05275233ee417150ee13813b7ae87049b714b8f360c979d4200e1d9d60c6995e', '[\"*\"]', NULL, '2023-07-09 08:21:47', '2023-07-09 08:21:47'),
(286, 'App\\Models\\Teacher', 4, 'authToken', 'b7628314b7df122957b8dcc14c6a2bf54e772d26bd2f4d360533e0f3656786b6', '[\"*\"]', NULL, '2023-07-10 07:19:49', '2023-07-10 07:19:49'),
(287, 'App\\Models\\Teacher', 4, 'authToken', 'c6f29eb0df7bb96a133d7fbd5947d566a19189c51650d0227acc64d9aa814daf', '[\"*\"]', NULL, '2023-07-10 07:21:35', '2023-07-10 07:21:35');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(288, 'App\\Models\\Teacher', 4, 'authToken', '6c4351413b592121f52e41e7c972f116fd4bb98a4a347631eaf9084c1c11beb8', '[\"*\"]', NULL, '2023-07-10 07:25:20', '2023-07-10 07:25:20'),
(289, 'App\\Models\\Teacher', 4, 'authToken', 'fe8237eced0f4fdc5b3a7f051f6456a23c10568202b2dce64c64d97386b3b869', '[\"*\"]', NULL, '2023-07-10 08:10:02', '2023-07-10 08:10:02'),
(290, 'App\\Models\\Teacher', 4, 'authToken', 'd588edc1f5b8f791bb6c84e603aea9e347e893c3ea4673d45708439ad823e7d8', '[\"*\"]', NULL, '2023-07-10 08:10:33', '2023-07-10 08:10:33'),
(291, 'App\\Models\\Teacher', 4, 'authToken', 'a0a96b1596f9896e228f8676a05b74e461572e29c4b0b673e74b50f414604b7b', '[\"*\"]', NULL, '2023-07-10 08:11:07', '2023-07-10 08:11:07'),
(292, 'App\\Models\\Teacher', 4, 'authToken', 'e1d03ab890ecd366f7956ca3e4d9c1d57f1272972bef4c28d014b84660fe0c9e', '[\"*\"]', NULL, '2023-07-10 09:23:34', '2023-07-10 09:23:34'),
(293, 'App\\Models\\Teacher', 4, 'authToken', '374da4c9637d492a43524ecf336ce83a8ea719e38d3daaeb235684f9443afb11', '[\"*\"]', NULL, '2023-07-10 16:44:39', '2023-07-10 16:44:39'),
(294, 'App\\Models\\Teacher', 4, 'authToken', '213c583520b431497844e91b26e80020a67bc7adad9e8d9d9817089143aeebf3', '[\"*\"]', NULL, '2023-07-10 16:49:09', '2023-07-10 16:49:09'),
(295, 'App\\Models\\Teacher', 4, 'authToken', '5f1a4d04c945055a7ea6f957ccc159935d26d448b2cc2b7570e6c34074622f01', '[\"*\"]', NULL, '2023-07-10 16:51:52', '2023-07-10 16:51:52'),
(296, 'App\\Models\\Teacher', 4, 'authToken', '85958a0776a0d3ffa8e5871c3fdde2c9424e750cabe7ea0f8dd43b3728357ee9', '[\"*\"]', NULL, '2023-07-10 16:52:36', '2023-07-10 16:52:36'),
(297, 'App\\Models\\Teacher', 4, 'authToken', '401272f7e09a67adc5b954487e278d2d5999597ee4a2726a5f6e201ec3ff3c23', '[\"*\"]', NULL, '2023-07-10 16:56:39', '2023-07-10 16:56:39'),
(298, 'App\\Models\\Teacher', 4, 'authToken', 'df204dfb650f165ec08fb30bdff9e76372f7cd3a5510cd854639b5c74c216e47', '[\"*\"]', NULL, '2023-07-10 17:07:01', '2023-07-10 17:07:01'),
(299, 'App\\Models\\Teacher', 4, 'authToken', 'de40a2d8525e294159e703c96675459e46954222b16d9ca677f5b0dfe5ffa176', '[\"*\"]', NULL, '2023-07-10 17:08:15', '2023-07-10 17:08:15'),
(300, 'App\\Models\\Teacher', 4, 'authToken', '63d3b1d416587f6efa7c9de2989000167841def083389183191e8c09a5f9acbe', '[\"*\"]', NULL, '2023-07-10 17:19:54', '2023-07-10 17:19:54'),
(301, 'App\\Models\\Teacher', 4, 'authToken', 'fcccfa88fd36ef895ffca5b0d8293b42ba51310aa283500b239640c32a952be7', '[\"*\"]', NULL, '2023-07-10 17:20:54', '2023-07-10 17:20:54'),
(302, 'App\\Models\\Teacher', 4, 'authToken', '97f2a35ef86b176a307bdc9914e2bab863219bcb5d75ab6b4025a376a7e8b8f5', '[\"*\"]', NULL, '2023-07-10 17:23:38', '2023-07-10 17:23:38'),
(303, 'App\\Models\\Teacher', 4, 'authToken', '3026d37e9363036bc556e1e989017373bbfabf0955128ff6ff10d287b0f5df05', '[\"*\"]', NULL, '2023-07-10 17:24:37', '2023-07-10 17:24:37'),
(304, 'App\\Models\\Teacher', 4, 'authToken', 'eadbc45ce25063bf7ca18af5f8000d923ee91c95eee23583291776077fbdf0e8', '[\"*\"]', NULL, '2023-07-10 17:27:02', '2023-07-10 17:27:02'),
(305, 'App\\Models\\Teacher', 4, 'authToken', 'd083bf93617e388ea3d7fa5996fe939cd7f796086061905600a280a7670abfd2', '[\"*\"]', NULL, '2023-07-10 18:44:56', '2023-07-10 18:44:56'),
(306, 'App\\Models\\Teacher', 4, 'authToken', '8aa05b18d07746ca496b81633ec76a1db6341f3c5f62c04366d2e2efd3a52c16', '[\"*\"]', NULL, '2023-07-10 18:48:14', '2023-07-10 18:48:14'),
(307, 'App\\Models\\Teacher', 4, 'authToken', '29c967e2d16d00e30352fe1bb8265a030afc5925db05aacd6eef40c057506165', '[\"*\"]', NULL, '2023-07-10 18:51:03', '2023-07-10 18:51:03'),
(308, 'App\\Models\\Teacher', 4, 'authToken', '8ed331c67be8a3331d6dcfc80a43950683d1e7cb2fb17b233473b790426c53af', '[\"*\"]', NULL, '2023-07-10 18:52:52', '2023-07-10 18:52:52'),
(309, 'App\\Models\\Teacher', 4, 'authToken', '1af473d4675c96477db467e30571c612b8690bfc2ff76c92350c35b89e65b059', '[\"*\"]', NULL, '2023-07-10 18:55:28', '2023-07-10 18:55:28'),
(310, 'App\\Models\\Teacher', 4, 'authToken', 'dc0a9ebc8a3661df24ad3dfd39764a31a0b4fa32595e46df43cdcf77b48f452a', '[\"*\"]', NULL, '2023-07-10 18:59:08', '2023-07-10 18:59:08'),
(311, 'App\\Models\\Teacher', 4, 'authToken', '62419e166eea48aee0cc2b833bfc6162bfab8f8793670a74f41a9b9413c29112', '[\"*\"]', NULL, '2023-07-10 19:02:24', '2023-07-10 19:02:24'),
(312, 'App\\Models\\Teacher', 4, 'authToken', 'c55b3ccd6457f4ce171bd06b32aeacdc07bb1d74bbba5a2d1b60ef27b666b7d0', '[\"*\"]', NULL, '2023-07-10 19:10:44', '2023-07-10 19:10:44'),
(313, 'App\\Models\\Teacher', 4, 'authToken', 'd51c6480a2ea1ddd2cc8422d48a3e47e8e25964b2d7c6343fbe3e4b35542aac3', '[\"*\"]', NULL, '2023-07-10 19:13:04', '2023-07-10 19:13:04'),
(314, 'App\\Models\\Teacher', 4, 'authToken', 'd3d21ffcd3507a74e779c687de3d2e885a2437d2566b019f25bc5f178c5336c0', '[\"*\"]', NULL, '2023-07-10 19:15:35', '2023-07-10 19:15:35'),
(315, 'App\\Models\\Teacher', 4, 'authToken', 'e2f080b7c5cab15f76a9c9e9eb0f3935444690a8a364c1f3692788d4f330f6ae', '[\"*\"]', NULL, '2023-07-11 07:43:13', '2023-07-11 07:43:13'),
(316, 'App\\Models\\Teacher', 4, 'authToken', 'bd0c7dc730af3e94999981eb2d54aee039ca0673f1d5d3c0b3995f12042fea99', '[\"*\"]', NULL, '2023-07-11 07:44:06', '2023-07-11 07:44:06'),
(317, 'App\\Models\\Teacher', 4, 'authToken', 'da3cc407afbd01568295fb23c4893b58fc610302203f8dd2b588fe2c6e14ff31', '[\"*\"]', NULL, '2023-07-11 07:46:23', '2023-07-11 07:46:23'),
(318, 'App\\Models\\Teacher', 4, 'authToken', '18f275c7526359ee1d4b245356d7281e725076d90ea80479674321ac3e551ba3', '[\"*\"]', NULL, '2023-07-11 07:51:44', '2023-07-11 07:51:44'),
(319, 'App\\Models\\Teacher', 4, 'authToken', 'dc544c72d3b3623efccba049fc24e8b5106d6b1b4d3d89e04c88704916b8c11a', '[\"*\"]', NULL, '2023-07-11 07:52:33', '2023-07-11 07:52:33'),
(320, 'App\\Models\\Teacher', 4, 'authToken', '21459778c8c298fa71b037a83173620b98455ed8ebed1013526fcd357f6b1da8', '[\"*\"]', NULL, '2023-07-11 13:06:15', '2023-07-11 13:06:15'),
(321, 'App\\Models\\Teacher', 4, 'authToken', 'cf284a904a712d3d4762b315140c057cc314b37296930fea9f404897b7176159', '[\"*\"]', NULL, '2023-07-11 13:09:08', '2023-07-11 13:09:08'),
(322, 'App\\Models\\Teacher', 4, 'authToken', 'e6585ef07fabb99c93dd463db79bb929ef2f1e9046a76c318d84096590ee842c', '[\"*\"]', NULL, '2023-07-11 13:11:27', '2023-07-11 13:11:27'),
(323, 'App\\Models\\Teacher', 4, 'authToken', 'df4974c44d40f780a03974727506cb95fdc2942f32229fc686a18a29cf240fe9', '[\"*\"]', NULL, '2023-07-11 13:28:03', '2023-07-11 13:28:03'),
(324, 'App\\Models\\Teacher', 4, 'authToken', 'da26eaa97268c03e004c2eabb8a73b23a9d388ed97255e5b147673488c9995f8', '[\"*\"]', NULL, '2023-07-11 13:28:50', '2023-07-11 13:28:50'),
(325, 'App\\Models\\Teacher', 4, 'authToken', 'd1a6d8d966352f3dd37e50cf1f74166e3272aea04af87f4acbe575b7856aad71', '[\"*\"]', NULL, '2023-07-11 13:30:59', '2023-07-11 13:30:59'),
(326, 'App\\Models\\Teacher', 4, 'authToken', '1f8f115e765664a886507f9a1306175447b2cc8755372ed0b1ece146bcf9c842', '[\"*\"]', NULL, '2023-07-11 13:34:10', '2023-07-11 13:34:10'),
(327, 'App\\Models\\Teacher', 4, 'authToken', '9982769dfbf780f2dde66cdf4efc2956cb23577b36ee6f540c5cd90e1bed51f2', '[\"*\"]', NULL, '2023-07-11 20:48:11', '2023-07-11 20:48:11'),
(328, 'App\\Models\\Teacher', 4, 'authToken', '7882f1d6b2681185d8cd5192cdc00d8b289e039e63af3127f16768cf58039f82', '[\"*\"]', NULL, '2023-07-11 20:51:21', '2023-07-11 20:51:21'),
(329, 'App\\Models\\Teacher', 4, 'authToken', 'fffa7505eef80a7a21be3edadcdefa735a63d1c92d821c280c83c6347d474b7a', '[\"*\"]', NULL, '2023-07-11 20:52:32', '2023-07-11 20:52:32'),
(330, 'App\\Models\\Teacher', 4, 'authToken', '8d7b5c4c073563c852caa779bc9bae5a287f9af92acf712074014278b9000472', '[\"*\"]', NULL, '2023-07-11 20:53:39', '2023-07-11 20:53:39'),
(331, 'App\\Models\\Teacher', 4, 'authToken', 'c06460afa8abbad0f636bd1ced42fb056eddc8e8691d50be6144442f05376fda', '[\"*\"]', NULL, '2023-07-11 21:01:27', '2023-07-11 21:01:27'),
(332, 'App\\Models\\Teacher', 4, 'authToken', '6f448319941171abaa156fa776d6f29fd793f8c0c916f53db6b5fe48df200dc7', '[\"*\"]', '2023-07-11 21:22:32', '2023-07-11 21:05:48', '2023-07-11 21:22:32'),
(333, 'App\\Models\\Teacher', 4, 'authToken', '9b93502d22f2a17bc8edf5b560fc109c8535b5467cfcc94940676dbd73720d8f', '[\"*\"]', '2023-07-11 22:17:09', '2023-07-11 22:16:56', '2023-07-11 22:17:09'),
(334, 'App\\Models\\Teacher', 4, 'authToken', '656a7c51f8968f80ce93ac4e93f4e273c5e5c1770d647814b6db912f66d8ca74', '[\"*\"]', '2023-07-11 23:06:13', '2023-07-11 22:18:19', '2023-07-11 23:06:13'),
(335, 'App\\Models\\Teacher', 4, 'authToken', 'b628418e7b631620b38bd465a99c8370c7aebb160ddcab177d6f267102e0d5a0', '[\"*\"]', '2023-07-12 00:14:37', '2023-07-11 23:19:11', '2023-07-12 00:14:37'),
(336, 'App\\Models\\Teacher', 4, 'authToken', '515b4565982ce4045e58d6c4d2ba6183c8fe04d10ee838890241f044f4a9de66', '[\"*\"]', '2023-07-13 07:09:13', '2023-07-11 23:22:01', '2023-07-13 07:09:13'),
(337, 'App\\Models\\Teacher', 4, 'authToken', '7c3d14f7632da84c500b289f2d4cfec588cb8317650dc45087025d58a42a5294', '[\"*\"]', '2023-07-12 04:36:58', '2023-07-12 00:18:54', '2023-07-12 04:36:58'),
(338, 'App\\Models\\Teacher', 4, 'authToken', 'd1420337380e7bf486800b2d792c1ed0b6c25305f7da01e3e40f61bf50e46a98', '[\"*\"]', NULL, '2023-07-13 07:57:50', '2023-07-13 07:57:50'),
(339, 'App\\Models\\Teacher', 4, 'authToken', '67c0dd19f43c1b0eec5865e65caaac012da2aef8c63bfda3e39c92fd66a36448', '[\"*\"]', NULL, '2023-07-13 09:37:08', '2023-07-13 09:37:08'),
(340, 'App\\Models\\Teacher', 4, 'authToken', '42d3ac98493acbd508a9e4dda4d11224b88a88d6020c20fefaa6e09fe17561d3', '[\"*\"]', NULL, '2023-07-13 09:44:07', '2023-07-13 09:44:07'),
(341, 'App\\Models\\Teacher', 4, 'authToken', '7b8c5912c70bb0d3d60b1e21b045c2c6a46372fb3d08d7b63a8e37e14ffc9074', '[\"*\"]', NULL, '2023-07-13 09:53:09', '2023-07-13 09:53:09'),
(342, 'App\\Models\\Teacher', 4, 'authToken', 'f9b7a0cc3efd17266681eedef1b8d60c4a4c6d46bc7f72e4b68a67637e0cf29e', '[\"*\"]', NULL, '2023-07-13 10:30:32', '2023-07-13 10:30:32'),
(343, 'App\\Models\\Teacher', 4, 'authToken', '0882be7c46052c3826c4fe11168f4c894209164da51b0e7fd2dc0add749f0436', '[\"*\"]', NULL, '2023-07-13 10:34:55', '2023-07-13 10:34:55'),
(344, 'App\\Models\\Teacher', 4, 'authToken', '69b86a8d8b82c6f20dca91ceaec7a9483753247444a8a3031a2f1402de3fbf57', '[\"*\"]', NULL, '2023-07-13 10:36:02', '2023-07-13 10:36:02'),
(345, 'App\\Models\\Teacher', 4, 'authToken', '722f82076f585a96ba9967789e54ba27a059680389fcd8038feee42a2b6980da', '[\"*\"]', NULL, '2023-07-13 20:09:08', '2023-07-13 20:09:08'),
(346, 'App\\Models\\Teacher', 4, 'authToken', '22c010e48c7e5ef2d9a4c51093784da8654e3b5215f4e39aa6d998a924ea3d5a', '[\"*\"]', NULL, '2023-07-13 20:11:52', '2023-07-13 20:11:52'),
(347, 'App\\Models\\Teacher', 4, 'authToken', 'c897e20f66b7e10a2544d6aabf4997d57ff834e04a53cf18cdcf522e54d055cf', '[\"*\"]', NULL, '2023-07-13 20:57:49', '2023-07-13 20:57:49'),
(348, 'App\\Models\\Teacher', 4, 'authToken', 'df73471dc18829bfda274d88da9bf1bb0084dde4f9cf8764ea289712a28fb160', '[\"*\"]', NULL, '2023-07-13 20:58:30', '2023-07-13 20:58:30'),
(349, 'App\\Models\\Teacher', 4, 'authToken', '33db09e8e595cfbdf0ee684f31b2284d88773f82eda200f52e7950536e557d02', '[\"*\"]', NULL, '2023-07-13 21:01:33', '2023-07-13 21:01:33'),
(350, 'App\\Models\\Student', 19, 'authToken', 'de7ea7ff6e0c1a139e23b083e390b24654a18323b716f4d78f5c7ad8d2a738e5', '[\"*\"]', NULL, '2023-07-13 21:06:11', '2023-07-13 21:06:11'),
(351, 'App\\Models\\Student', 19, 'authToken', '5d53627aa58df60234dbf37ee8c11b9c4f5397bd1832103fd91f16161528b4ed', '[\"*\"]', NULL, '2023-07-14 00:06:51', '2023-07-14 00:06:51'),
(352, 'App\\Models\\Student', 19, 'authToken', 'ddf218f177827c6c090aa7add25500813b60a8d4813a241e398d2135435764c0', '[\"*\"]', NULL, '2023-07-14 00:09:07', '2023-07-14 00:09:07'),
(353, 'App\\Models\\Student', 19, 'authToken', '808a7b14f457a801c5d435e7783ff18d349c927f296bbac353441c6f4a4b92e1', '[\"*\"]', NULL, '2023-07-14 00:10:42', '2023-07-14 00:10:42'),
(354, 'App\\Models\\Student', 19, 'authToken', 'e9fc6576289729407961cdd5d5df0ec49f172d0af0b2f8ebafbbd4ac47e4251d', '[\"*\"]', NULL, '2023-07-14 00:12:19', '2023-07-14 00:12:19'),
(355, 'App\\Models\\Student', 19, 'authToken', '7fd3bf381061c7efca07cb38495aac5580262b787faeb1ac021e7a11d41c42f1', '[\"*\"]', NULL, '2023-07-14 00:19:53', '2023-07-14 00:19:53'),
(356, 'App\\Models\\Student', 19, 'authToken', 'ca642f9cc5c95df440c59e2dd562ffd1277eace70e2fb610dd54f7750f550c7b', '[\"*\"]', NULL, '2023-07-14 00:20:53', '2023-07-14 00:20:53'),
(357, 'App\\Models\\Student', 19, 'authToken', 'fa22ce236fdbcf533198120066ae0457b53bd71dfe0705470b8b60cf4564f846', '[\"*\"]', NULL, '2023-07-14 00:34:21', '2023-07-14 00:34:21'),
(358, 'App\\Models\\Student', 19, 'authToken', '268d406a51a78c3c909aa16e764a0ca1db03dcf9bdc49e61454e8b40eb88e207', '[\"*\"]', NULL, '2023-07-14 00:35:21', '2023-07-14 00:35:21'),
(359, 'App\\Models\\Student', 19, 'authToken', '74036cd14540a462fbc9b77f3f3a6013191a006f4e1c9ac84e702e2b48716d07', '[\"*\"]', NULL, '2023-07-14 00:38:51', '2023-07-14 00:38:51'),
(360, 'App\\Models\\Teacher', 4, 'authToken', 'c7fad6b7d6cd3dff74511a608b388e748fbdcce80043af1d5e104ad78a608f7b', '[\"*\"]', NULL, '2023-07-14 00:39:35', '2023-07-14 00:39:35'),
(361, 'App\\Models\\Student', 19, 'authToken', '5aa4233f552ec13e356bfb849e7fc64c3750e8c5afae458b45a780f01494aa8d', '[\"*\"]', NULL, '2023-07-14 07:30:52', '2023-07-14 07:30:52'),
(362, 'App\\Models\\Student', 19, 'authToken', '5e7f7a56b18adfdfa27f51cdc1b31bbc0cff45b9589e6e2e37b6a75555f31e42', '[\"*\"]', NULL, '2023-07-14 07:38:08', '2023-07-14 07:38:08'),
(363, 'App\\Models\\Student', 19, 'authToken', 'd8572e0c7cec86597f8a7f138869a2c4673d4bacb1f1fe9273ef687fcd7337b5', '[\"*\"]', NULL, '2023-07-14 07:45:47', '2023-07-14 07:45:47'),
(364, 'App\\Models\\Student', 19, 'authToken', 'b9a4a98cd8ca3de9426044b8785b97dc555bd446d275a78696b4da4ec8fa7e24', '[\"*\"]', NULL, '2023-07-14 07:46:31', '2023-07-14 07:46:31'),
(365, 'App\\Models\\Teacher', 4, 'authToken', 'f22121e6a17d9816e0b0ebfe8dc7b0c7ca263a106a2de391aedbdc1f72e6dd15', '[\"*\"]', NULL, '2023-07-14 23:30:45', '2023-07-14 23:30:45'),
(366, 'App\\Models\\Teacher', 4, 'authToken', '30f50a82495dc80d76690da15aacb3c3bf743e2473bc381df563a430632fd525', '[\"*\"]', NULL, '2023-07-14 23:37:41', '2023-07-14 23:37:41'),
(367, 'App\\Models\\Teacher', 4, 'authToken', 'ee5d6d3235390f44a2f993adaa4ba09ee0afbe14827f4b2a26c9e15bbddac39f', '[\"*\"]', NULL, '2023-07-14 23:39:17', '2023-07-14 23:39:17'),
(368, 'App\\Models\\Teacher', 4, 'authToken', 'c8e2e7a8a8a49a0533d74b7352e2a2d28f869f76bf536874e4526858f2960943', '[\"*\"]', NULL, '2023-07-14 23:40:08', '2023-07-14 23:40:08'),
(369, 'App\\Models\\Teacher', 4, 'authToken', 'b40047c7dfbba2ad60c677212b41c0dc67480d26448aaa73e174917d00c4d1fb', '[\"*\"]', NULL, '2023-07-14 23:41:13', '2023-07-14 23:41:13'),
(370, 'App\\Models\\Teacher', 4, 'authToken', 'a213839b04af03cee4902743efd845f5ee2d1db7bd4795aa353d1eea0c527d60', '[\"*\"]', NULL, '2023-07-14 23:41:31', '2023-07-14 23:41:31'),
(371, 'App\\Models\\Teacher', 4, 'authToken', '025eb62cf837e4e4417a724e4889b989927c9cf61a1de0597a7ac00ffaae867e', '[\"*\"]', NULL, '2023-07-14 23:53:09', '2023-07-14 23:53:09'),
(372, 'App\\Models\\Teacher', 4, 'authToken', '1ac663ae7be6807b1acc73238fc906384f1ad4a29de7166d8d053403a26c13df', '[\"*\"]', NULL, '2023-07-15 00:02:46', '2023-07-15 00:02:46'),
(373, 'App\\Models\\Teacher', 4, 'authToken', '033e2316647c3acd428501ed667784eaaa0299ba97594c7722e7abcb6937c379', '[\"*\"]', NULL, '2023-07-15 00:13:01', '2023-07-15 00:13:01'),
(374, 'App\\Models\\Teacher', 4, 'authToken', 'e54ffebacb51440e95dc3a8b3295bccb418fc1bf205ecd30e4a95df39c98e93d', '[\"*\"]', NULL, '2023-07-15 00:44:20', '2023-07-15 00:44:20'),
(375, 'App\\Models\\Teacher', 4, 'authToken', '3b31dd9acba0248ff26449155b7e0bc488f362e4253d22d667428483e872e1e9', '[\"*\"]', NULL, '2023-07-15 21:30:01', '2023-07-15 21:30:01'),
(376, 'App\\Models\\Teacher', 4, 'authToken', '51bfeb1d5f4c1ef980fa73342f7b2513ccfaee16a63a6813cce902e47ded232f', '[\"*\"]', NULL, '2023-07-15 21:31:06', '2023-07-15 21:31:06'),
(377, 'App\\Models\\Teacher', 4, 'authToken', '7bc59f1513d40914000c3b0c75067bbfacddcd2bfb5681c21a3364f3ae5eba04', '[\"*\"]', NULL, '2023-07-15 21:32:36', '2023-07-15 21:32:36'),
(378, 'App\\Models\\Teacher', 4, 'authToken', '439e0ad6e9531b606a7fe5627ec06774171d6e770a2b902159cb93165a137e28', '[\"*\"]', NULL, '2023-07-15 21:38:10', '2023-07-15 21:38:10'),
(379, 'App\\Models\\Teacher', 4, 'authToken', '659698632ee1e0ec375e507b9bf2dfdbbb95b35f836967184853d55218af83d6', '[\"*\"]', NULL, '2023-07-15 21:52:32', '2023-07-15 21:52:32'),
(380, 'App\\Models\\Teacher', 4, 'authToken', 'b615dcb1484a4a759df350fd750e509e91c7fe438405c689eb641dec76bbff0c', '[\"*\"]', NULL, '2023-07-15 21:59:26', '2023-07-15 21:59:26'),
(381, 'App\\Models\\Teacher', 4, 'authToken', 'f864e2efc542329fa34c7007cff4136dbcd23673479d7a92ce2b9f5a39fabdab', '[\"*\"]', NULL, '2023-07-15 22:00:58', '2023-07-15 22:00:58'),
(382, 'App\\Models\\Teacher', 4, 'authToken', '7b57f4e5833d2a14c0f4f1e6df0ca1bc4180ce31b3b4c8e79a8aa43e48a33897', '[\"*\"]', NULL, '2023-07-15 22:01:24', '2023-07-15 22:01:24'),
(383, 'App\\Models\\Teacher', 4, 'authToken', '100ead6434e37338498115b9c3ab88082fb70452b8817b72d57cb8a1bc3c70cc', '[\"*\"]', NULL, '2023-07-15 22:09:11', '2023-07-15 22:09:11'),
(384, 'App\\Models\\Teacher', 4, 'authToken', 'd4b52e6d87e912a0e5533a4c258d283c0a471a5ed87239c8b604fca2d86d0a9d', '[\"*\"]', NULL, '2023-07-15 22:16:24', '2023-07-15 22:16:24'),
(385, 'App\\Models\\Teacher', 4, 'authToken', 'cdcfa6c76250cf0330a51f8ca3bc67732503b92255fcf65f1eb01d1bf187a7aa', '[\"*\"]', NULL, '2023-07-15 22:18:53', '2023-07-15 22:18:53'),
(386, 'App\\Models\\Teacher', 4, 'authToken', 'f7331fdafd6fcb251974d193ea5b3ec50d59399c14e6e95b651a4cc4eecda91a', '[\"*\"]', NULL, '2023-07-15 22:20:43', '2023-07-15 22:20:43'),
(387, 'App\\Models\\Teacher', 4, 'authToken', '45a903662f211c4be3995105c1b87849437f115e9bdad36e0aaf088551a2cbea', '[\"*\"]', NULL, '2023-07-15 22:24:35', '2023-07-15 22:24:35'),
(388, 'App\\Models\\Teacher', 4, 'authToken', '084f21bbc789aad14cc91c33f34230542f5d7f055976a886176c2849e28012e2', '[\"*\"]', NULL, '2023-07-15 22:33:51', '2023-07-15 22:33:51'),
(391, 'App\\Models\\Teacher', 4, 'authToken', '4423981fc57a2c71324699f5f11379f9c427f1aafb72d3567fe8026040eb78c1', '[\"*\"]', NULL, '2023-07-16 01:06:39', '2023-07-16 01:06:39'),
(392, 'App\\Models\\Student', 19, 'authToken', 'cba29f37386f163352832b74bd6c2bf53e10c907607709eb81aa63f589020069', '[\"*\"]', NULL, '2023-07-16 03:41:16', '2023-07-16 03:41:16'),
(393, 'App\\Models\\Student', 19, 'authToken', '16a915dca741ad646ad20fb681dafab099890c5271b11249e0cd09a43405d431', '[\"*\"]', NULL, '2023-07-16 04:01:22', '2023-07-16 04:01:22'),
(394, 'App\\Models\\Teacher', 4, 'authToken', 'b9150add83cf8fa339a18f475a6a003fd50136792c7357bbddcc83311f6524bd', '[\"*\"]', NULL, '2023-07-16 05:45:30', '2023-07-16 05:45:30'),
(395, 'App\\Models\\Teacher', 4, 'authToken', 'bed87cd42586c0b39da6766cb10307bff3ac425bbd75d647e5f7863d66ea34a5', '[\"*\"]', NULL, '2023-07-16 07:44:59', '2023-07-16 07:44:59'),
(396, 'App\\Models\\Teacher', 4, 'authToken', 'd920fb52e22aeeda537019c781a2938f546e006f4fde50cd2d8ac5918e5f091b', '[\"*\"]', NULL, '2023-07-16 07:46:48', '2023-07-16 07:46:48'),
(397, 'App\\Models\\Teacher', 4, 'authToken', '0266bfbe64bbfd0d7ce0cfb2e79c6c43067a929fc824a27f862452ce6fd92f16', '[\"*\"]', NULL, '2023-07-16 08:59:30', '2023-07-16 08:59:30'),
(398, 'App\\Models\\Teacher', 4, 'authToken', 'cc9766fb89bacb2d7bfb346a0e7ac92bac7e76703c419012e291cf1d8ddf4e87', '[\"*\"]', NULL, '2023-07-16 09:35:10', '2023-07-16 09:35:10'),
(399, 'App\\Models\\Teacher', 4, 'authToken', '9d509a5ba6117af643800816087f7c26a5f09e513fa73f300d454544cdde2de3', '[\"*\"]', NULL, '2023-07-16 09:40:11', '2023-07-16 09:40:11'),
(400, 'App\\Models\\Teacher', 4, 'authToken', '586f87cbd64cc063ac8866665a97ffa184ef6a8f85e703a5c85ec26cbd7405c7', '[\"*\"]', '2023-07-16 09:44:28', '2023-07-16 09:44:06', '2023-07-16 09:44:28'),
(401, 'App\\Models\\Teacher', 4, 'authToken', 'dbfadd401775412e8e120d47aaa21d5316cf59a6060d47400d179f27c7c0a03f', '[\"*\"]', NULL, '2023-07-16 09:45:10', '2023-07-16 09:45:10'),
(402, 'App\\Models\\Teacher', 4, 'authToken', '2148b6913db5d5c11f387ad541601014a43d6c98fae12ee03b5271468a9f60ea', '[\"*\"]', '2023-07-16 09:52:02', '2023-07-16 09:51:41', '2023-07-16 09:52:02'),
(403, 'App\\Models\\Teacher', 4, 'authToken', '89e752253ffe1e20d5f09c22a3861368a59d5eb582e49c29f1d328fee09993b8', '[\"*\"]', '2023-07-16 10:18:19', '2023-07-16 10:17:58', '2023-07-16 10:18:19'),
(404, 'App\\Models\\Teacher', 4, 'authToken', 'c0602403e050cdfded1fad41cc9463c0e176861d653520b226a80bea9362bf8b', '[\"*\"]', NULL, '2023-07-16 10:20:53', '2023-07-16 10:20:53'),
(405, 'App\\Models\\Teacher', 4, 'authToken', '9fa79581008805e4f9619179c0d9b27fb5714884343f1d91fbc5b695220a30e8', '[\"*\"]', NULL, '2023-07-16 10:28:24', '2023-07-16 10:28:24'),
(406, 'App\\Models\\Teacher', 4, 'authToken', 'cce221363301c025f9029c8bff3b9dfc3ffa41cb548709526421ae7d7132e988', '[\"*\"]', '2023-07-16 10:32:38', '2023-07-16 10:32:14', '2023-07-16 10:32:38'),
(407, 'App\\Models\\Teacher', 4, 'authToken', '7294a15230e3d6c4fd5f02b291db6d482cde91987e79533fd662f5c87689612d', '[\"*\"]', NULL, '2023-07-16 10:34:13', '2023-07-16 10:34:13'),
(408, 'App\\Models\\Teacher', 4, 'authToken', '28c18a98960d26890293130772f135d6828734cab19c40268f572a3ee646b0fa', '[\"*\"]', '2023-07-16 10:36:32', '2023-07-16 10:36:05', '2023-07-16 10:36:32'),
(409, 'App\\Models\\Teacher', 4, 'authToken', '86009accaaf803b824796837dc29c1b742c469e1ffc3872d21d8053fe2429a87', '[\"*\"]', '2023-07-16 10:38:53', '2023-07-16 10:38:33', '2023-07-16 10:38:53'),
(410, 'App\\Models\\Teacher', 4, 'authToken', 'e8d7dc16797df8a36c385e4acf74a400db48660995fc62d4835f7e12fbf9c512', '[\"*\"]', '2023-07-16 10:41:48', '2023-07-16 10:41:08', '2023-07-16 10:41:48'),
(411, 'App\\Models\\Student', 22, 'authToken', 'ec72ce4de9d0a53566c976b4c65fdee3dc6114a323cc39eceae03c343fba6314', '[\"*\"]', '2023-07-16 19:49:00', '2023-07-16 18:19:37', '2023-07-16 19:49:00'),
(415, 'App\\Models\\Student', 22, 'authToken', '1209b8b583a322720ca26e4779cc7d2a1681e48a3f723041921d7ceb63baefad', '[\"*\"]', NULL, '2023-07-16 20:58:48', '2023-07-16 20:58:48'),
(416, 'App\\Models\\Student', 22, 'authToken', '69358d8d90d508beac367dc9b71a10418b3ab24729e48cb1da9cd081e6a8813c', '[\"*\"]', NULL, '2023-07-16 20:58:57', '2023-07-16 20:58:57'),
(417, 'App\\Models\\Student', 22, 'authToken', 'fb94086f5caa0138b1035c03dcf9f7e9a254fe100295b8218cf28af678b456ce', '[\"*\"]', NULL, '2023-07-16 21:23:39', '2023-07-16 21:23:39'),
(418, 'App\\Models\\Student', 22, 'authToken', '70bebcde4ea68eb20ac81c91eab51294f31f12031fe4d2f8b15ea2b6c7bddb5d', '[\"*\"]', NULL, '2023-07-16 21:29:08', '2023-07-16 21:29:08'),
(419, 'App\\Models\\Student', 22, 'authToken', '60dc6b2fd6b758848aa86d41d723c74a26cb122521dcb3f845191396cf28b57f', '[\"*\"]', '2023-07-16 22:17:29', '2023-07-16 22:17:12', '2023-07-16 22:17:29'),
(420, 'App\\Models\\Student', 22, 'authToken', 'cd250b1ef967966d0d83e4692647f7f8fc305938c88f080200efcafe32b9378b', '[\"*\"]', '2023-07-16 22:23:18', '2023-07-16 22:22:58', '2023-07-16 22:23:18'),
(421, 'App\\Models\\Student', 22, 'authToken', '9aa1b9dc457bc23b818bf229c48f90b798132639227828a170e69ad5c0f9babf', '[\"*\"]', '2023-07-16 22:26:19', '2023-07-16 22:26:04', '2023-07-16 22:26:19'),
(423, 'App\\Models\\Student', 22, 'authToken', '280e7de81436a4f66b071ff27f89fb6ed0fae7ecc276c6bb203e6c9f25b374ce', '[\"*\"]', NULL, '2023-07-16 22:32:46', '2023-07-16 22:32:46'),
(424, 'App\\Models\\Student', 22, 'authToken', 'df5914ff018a1ed2abb36dc25f4110ba23f1dd730957e6abe0074bb233f6fda9', '[\"*\"]', '2023-07-16 22:33:18', '2023-07-16 22:33:00', '2023-07-16 22:33:18'),
(425, 'App\\Models\\Student', 22, 'authToken', '926cb482b8cfa61afb58921cacc02dbd8cb639f4ab3287ff8046741f2908fe0d', '[\"*\"]', '2023-07-16 22:36:13', '2023-07-16 22:34:46', '2023-07-16 22:36:13'),
(427, 'App\\Models\\Student', 22, 'authToken', 'b995049a8f1c4cc699d14676892e965998a29a986ec6859ac4e92370d1ac4656', '[\"*\"]', NULL, '2023-07-16 22:44:30', '2023-07-16 22:44:30'),
(429, 'App\\Models\\Student', 22, 'authToken', 'df4fd58c7b34075b20aa05bb9dc0374380744bab1c6d0e3844ff07e5f33bf033', '[\"*\"]', NULL, '2023-07-17 07:50:24', '2023-07-17 07:50:24'),
(430, 'App\\Models\\Student', 22, 'authToken', '00721e574d479d4495537174b6452d813b59dd23c175e2e67f6084adad468688', '[\"*\"]', '2023-07-17 07:52:45', '2023-07-17 07:50:33', '2023-07-17 07:52:45'),
(431, 'App\\Models\\Student', 22, 'authToken', '4469ca8ea4348cebe6c2e9c62443134a3346223176bbee40dc5ada687597a0a2', '[\"*\"]', NULL, '2023-07-17 07:58:21', '2023-07-17 07:58:21'),
(432, 'App\\Models\\Student', 22, 'authToken', '2bc75351af54626d55c954d5f55d1afcf24f0b0c8c37407688eefef1b2b6a4ae', '[\"*\"]', NULL, '2023-07-17 07:58:25', '2023-07-17 07:58:25'),
(434, 'App\\Models\\Student', 22, 'authToken', 'f31633a7b7c5aa29797ff4ee3a379f2ed9f64a46235b667f4829c860f5c9cd5d', '[\"*\"]', NULL, '2023-07-17 08:00:26', '2023-07-17 08:00:26'),
(437, 'App\\Models\\Student', 22, 'authToken', '036385ad4c109b3c30362d2f6edbd5b0a3fd1e3b0d668686d3401f87977280c5', '[\"*\"]', NULL, '2023-07-17 08:02:30', '2023-07-17 08:02:30'),
(439, 'App\\Models\\Teacher', 4, 'authToken', 'a96df6a05a6b1e477a6d4c11fffa4bcb15e4e3dd9d6cd16d7816d1d88a0686c3', '[\"*\"]', NULL, '2023-07-19 09:25:23', '2023-07-19 09:25:23'),
(440, 'App\\Models\\Teacher', 4, 'authToken', '9ebb29a76e16507b0a21e3b483c41ad6a54ae7a573d45222bcfa0851443c5ce3', '[\"*\"]', '2023-07-19 09:37:18', '2023-07-19 09:32:26', '2023-07-19 09:37:18'),
(441, 'App\\Models\\Teacher', 4, 'authToken', 'a5d4ac51ad13f3484792a2c9d02c24303f3f21159f8fefec686f0d55205146b7', '[\"*\"]', '2023-07-30 00:34:33', '2023-07-20 09:54:56', '2023-07-30 00:34:33'),
(442, 'App\\Models\\Teacher', 4, 'authToken', 'c36743ecaa70964ad03184a301d7dcb7e4d9f6925fe23da13d6f5997e49a1e87', '[\"*\"]', NULL, '2023-07-20 10:11:43', '2023-07-20 10:11:43'),
(443, 'App\\Models\\Teacher', 4, 'authToken', '5fdcd3e4884be7a083c9286cd77161c02f476fc9c4bb022ec95cde517bc524cb', '[\"*\"]', NULL, '2023-07-21 08:41:33', '2023-07-21 08:41:33'),
(444, 'App\\Models\\Teacher', 4, 'authToken', 'ccf19793be7343527672d62455710013f11a0ed9a7d5cfd935b59f67bc341ad6', '[\"*\"]', '2023-07-21 09:16:01', '2023-07-21 08:43:17', '2023-07-21 09:16:01'),
(445, 'App\\Models\\Teacher', 4, 'authToken', '9f8614ce0e20c69ab0da49b614ba7e72e57da26e3141a1d89465467e934e74d9', '[\"*\"]', NULL, '2023-07-22 00:08:17', '2023-07-22 00:08:17'),
(447, 'App\\Models\\Teacher', 4, 'authToken', '72b015e4e7bb08588e74f28407d5f63b3512b934012c0bbb0c4416d35e473e1e', '[\"*\"]', '2023-07-22 00:13:10', '2023-07-22 00:13:01', '2023-07-22 00:13:10'),
(448, 'App\\Models\\Teacher', 4, 'authToken', 'e61d70619f2b4a74dfbe0497957d4c7f43a71eee4ef5a7edd5cdd1712592502b', '[\"*\"]', NULL, '2023-07-22 00:20:51', '2023-07-22 00:20:51'),
(449, 'App\\Models\\Teacher', 4, 'authToken', '06bb82f27bb05a3afcb3415443e50658d1becda49008cc4cfdd30d8d0b847ba9', '[\"*\"]', NULL, '2023-07-22 00:21:19', '2023-07-22 00:21:19'),
(450, 'App\\Models\\Teacher', 4, 'authToken', '6db50e8b609cdbaef1261e1cf19b0a5f050bfc1e5179f0a93356153f6a79d10a', '[\"*\"]', NULL, '2023-07-22 00:22:51', '2023-07-22 00:22:51'),
(451, 'App\\Models\\Teacher', 4, 'authToken', '0dc7c33526076acf8adaab934ce7e53a9b3b1a0014c67e58e78bb5df11b3602e', '[\"*\"]', '2023-07-22 00:38:30', '2023-07-22 00:37:32', '2023-07-22 00:38:30'),
(453, 'App\\Models\\Teacher', 4, 'authToken', '7432ec05dc273f02da972e46c228c3d26878622357031ecafb6878c6ec5c57d5', '[\"*\"]', '2023-07-22 01:46:44', '2023-07-22 01:39:30', '2023-07-22 01:46:44'),
(455, 'App\\Models\\Parents', 6, 'authToken', 'aaa6d151363aa5a33a9f9e9234b0dc900b1638ce9e5297c352f4ff2dcd6f270e', '[\"*\"]', NULL, '2023-07-23 15:53:40', '2023-07-23 15:53:40'),
(456, 'App\\Models\\Teacher', 4, 'authToken', '815aad8ca8141edbad73918f0d8e58439b485c42b472017474aeb59544d37bea', '[\"*\"]', NULL, '2023-07-27 07:33:47', '2023-07-27 07:33:47'),
(457, 'App\\Models\\Teacher', 4, 'authToken', 'f10b7d2752839b4b56c21f13979d320f6df529b4b2f3117b1d5151ec7da57fcf', '[\"*\"]', NULL, '2023-07-27 07:34:55', '2023-07-27 07:34:55'),
(458, 'App\\Models\\Teacher', 4, 'authToken', '274402dab82dbe80e97efe0fad03aceed6cd322a07e3390bf76f1b41397446c9', '[\"*\"]', NULL, '2023-07-27 07:36:22', '2023-07-27 07:36:22'),
(459, 'App\\Models\\Teacher', 4, 'authToken', '8636a6f1c4062695d4cdf8e52967b9355816ef0ea538a018d57f7853d2bb2e28', '[\"*\"]', NULL, '2023-07-27 07:37:50', '2023-07-27 07:37:50'),
(460, 'App\\Models\\Teacher', 4, 'authToken', '700ea0dc84f0d99b98f4eff7ceee4f3e0b9b146035624c4624e79a5ec8313455', '[\"*\"]', NULL, '2023-07-27 07:39:41', '2023-07-27 07:39:41'),
(461, 'App\\Models\\Teacher', 4, 'authToken', '0bf8361a490a156030ee8bcb056b2f665036ffb403d6986af8d6e9a5450d753b', '[\"*\"]', NULL, '2023-07-27 07:43:02', '2023-07-27 07:43:02'),
(462, 'App\\Models\\Teacher', 4, 'authToken', '1691fb657f23d59a6d0aff39cdd380e093c88e448f203f434cbe4ecb34a02ad4', '[\"*\"]', NULL, '2023-07-27 07:44:19', '2023-07-27 07:44:19'),
(463, 'App\\Models\\Teacher', 4, 'authToken', '8ef4a9954f80e86d95c741dfb36b8f538d1549d937c79dec7e3e50b99cc66856', '[\"*\"]', NULL, '2023-07-27 21:17:41', '2023-07-27 21:17:41'),
(464, 'App\\Models\\Teacher', 4, 'authToken', '0d7257ae9f9c1e9ff3bed65f88c507c8cc7dd8276d9c06ef71b0e757d1990167', '[\"*\"]', NULL, '2023-07-27 21:18:50', '2023-07-27 21:18:50'),
(465, 'App\\Models\\Teacher', 4, 'authToken', '135762ac04c81c869ead56298d260f6303ae7cc8175c604da78943f19a5619a9', '[\"*\"]', NULL, '2023-07-27 21:24:19', '2023-07-27 21:24:19'),
(466, 'App\\Models\\Teacher', 4, 'authToken', 'f227ba16eb1dc3e2f5a5931a778f559b88a28ee516c3b2bf5b3e0fc00b3acca1', '[\"*\"]', NULL, '2023-07-27 21:27:33', '2023-07-27 21:27:33'),
(467, 'App\\Models\\Teacher', 4, 'authToken', 'a2d6c28ac572e5ce36c909b3f6d27fe3ded19134d8c9a21a7613302d288c2235', '[\"*\"]', NULL, '2023-07-27 21:31:44', '2023-07-27 21:31:44'),
(468, 'App\\Models\\Teacher', 4, 'authToken', '8d48798a230e01b89dac0c796d0127593a484902feae5a0b3704020c257345a4', '[\"*\"]', NULL, '2023-07-27 21:33:51', '2023-07-27 21:33:51'),
(469, 'App\\Models\\Teacher', 4, 'authToken', '0f820f8957af8d53526a0e77496b50b42a496c014e3842744e3dcaa6b0c981e0', '[\"*\"]', NULL, '2023-07-27 21:34:19', '2023-07-27 21:34:19'),
(470, 'App\\Models\\Teacher', 4, 'authToken', '3e44f66423b5613952513f9c49fabe51e51465a638e591808bba0f03e56ae3f7', '[\"*\"]', NULL, '2023-07-27 21:35:41', '2023-07-27 21:35:41'),
(471, 'App\\Models\\Teacher', 4, 'authToken', 'd86398942ada02a46d6188cc4295e8922ff886805031f4d302ea55c12fe77d3b', '[\"*\"]', NULL, '2023-07-27 21:37:32', '2023-07-27 21:37:32'),
(472, 'App\\Models\\Teacher', 4, 'authToken', '6d866f69bed88aa68bf9998f352f4abd338bf6206362d9cd638b592df2f015ef', '[\"*\"]', NULL, '2023-07-28 00:54:38', '2023-07-28 00:54:38'),
(473, 'App\\Models\\Teacher', 4, 'authToken', '9ed7e133a5b64a93e8838fefa376be5d0df120c9df6a747bfa4fc2f71cdc6528', '[\"*\"]', NULL, '2023-07-28 00:57:46', '2023-07-28 00:57:46'),
(474, 'App\\Models\\Teacher', 4, 'authToken', '4ac370e7423b35e5a55d946ae6ec710f21631b65747856ee7d6674345df52fbd', '[\"*\"]', NULL, '2023-07-28 00:59:31', '2023-07-28 00:59:31'),
(475, 'App\\Models\\Teacher', 4, 'authToken', 'f6672dd1f2b0da9130c1c1ee72f75c48b8cf8daa4d97af74b00660078f361ed2', '[\"*\"]', NULL, '2023-07-28 02:21:28', '2023-07-28 02:21:28'),
(476, 'App\\Models\\Teacher', 4, 'authToken', '9cb936db0fcd3f338721364cdcfeb5afd875cf071cbe5c61dcd98b38c2852ff7', '[\"*\"]', NULL, '2023-07-28 02:22:27', '2023-07-28 02:22:27'),
(477, 'App\\Models\\Teacher', 4, 'authToken', '4b32222776c3e7d43b86ef8c81bf35982d9c39006d739f0f8808165b67019d27', '[\"*\"]', NULL, '2023-07-28 03:53:24', '2023-07-28 03:53:24'),
(478, 'App\\Models\\Teacher', 4, 'authToken', 'f6c12cad2b20aee5fbf9c81bd0b5840773d4cb5c2a1824b65ba946f2958ed938', '[\"*\"]', NULL, '2023-07-28 04:22:05', '2023-07-28 04:22:05'),
(479, 'App\\Models\\Teacher', 4, 'authToken', 'e0c25aa708b1237c00c425f0a1620fb66077b080ad4f7c03802d6b8a428e0bb1', '[\"*\"]', NULL, '2023-07-28 04:33:16', '2023-07-28 04:33:16'),
(480, 'App\\Models\\Teacher', 4, 'authToken', '01f9a4de15bd1be0eea180a4c64a63b97d2539bbb02940c49c519ead3a56f1b6', '[\"*\"]', NULL, '2023-07-28 04:45:07', '2023-07-28 04:45:07'),
(481, 'App\\Models\\Teacher', 4, 'authToken', '94d16b5cbf7aeba960490dac080c164abd560698fb9a014b894171f83bcc4d68', '[\"*\"]', NULL, '2023-07-28 08:14:06', '2023-07-28 08:14:06'),
(482, 'App\\Models\\Teacher', 4, 'authToken', 'ba9b340e9f0790913408f6e77f4a8a3a6da3f3cc3a893484ea897b7e12ba2fba', '[\"*\"]', '2023-07-28 08:21:06', '2023-07-28 08:19:07', '2023-07-28 08:21:06'),
(484, 'App\\Models\\Student', 22, 'authToken', '90cabd81db963ae76237962bffbd0ec2c3231a5faa18dda5d1e25c5db1ccf624', '[\"*\"]', NULL, '2023-07-28 11:48:02', '2023-07-28 11:48:02'),
(485, 'App\\Models\\Parents', 6, 'authToken', '9bf9cf02b12129bc3a495afbb0176ea5e2b8f559731c06b3ce96b1ccd9490460', '[\"*\"]', NULL, '2023-07-28 21:57:37', '2023-07-28 21:57:37'),
(486, 'App\\Models\\Parents', 6, 'authToken', '1eed868ca772c6a5437fb0ec4fa56f5668f2ffecfac2d06fcb4b6dc2387d164b', '[\"*\"]', NULL, '2023-07-29 00:09:21', '2023-07-29 00:09:21'),
(488, 'App\\Models\\Parents', 6, 'authToken', '35a0d482cd03f0d5c895a7bd12d00fef6f8fcedee9d6e1b685c82fbb6ffdb20c', '[\"*\"]', NULL, '2023-07-29 00:30:42', '2023-07-29 00:30:42'),
(489, 'App\\Models\\Parents', 6, 'authToken', 'a09146923b622f8d46a2210a902ba9a1f1a8c890777ed0b8466f91ba2fdf1b89', '[\"*\"]', NULL, '2023-07-29 00:31:16', '2023-07-29 00:31:16'),
(490, 'App\\Models\\Parents', 6, 'authToken', '66ebbdea6014f2f61373c7de786efab50e8341b0921fb70fb50ab912b2738020', '[\"*\"]', NULL, '2023-07-29 00:32:57', '2023-07-29 00:32:57'),
(491, 'App\\Models\\Parents', 6, 'authToken', '3c9047827816721c2256f257504b872f03fe7f3721529c2f344eb4457a7e3c53', '[\"*\"]', NULL, '2023-07-29 00:42:45', '2023-07-29 00:42:45'),
(492, 'App\\Models\\Parents', 6, 'authToken', '0e891179ac8e188cc3dd0df3873e68f6a40a231d2fb76be4445d9d1b6ae96ac9', '[\"*\"]', NULL, '2023-07-29 00:44:11', '2023-07-29 00:44:11'),
(493, 'App\\Models\\Parents', 6, 'authToken', 'ff0945800fa10ce41ee45a0e4be176b6622b13c48fe2fc050319f9e39e44ba34', '[\"*\"]', NULL, '2023-07-29 00:49:32', '2023-07-29 00:49:32'),
(494, 'App\\Models\\Parents', 6, 'authToken', '4a4c8936767413f802d76a5d106d1c3781e8a6e66dbc7d5c1c66b613e7a3453e', '[\"*\"]', NULL, '2023-07-29 00:51:10', '2023-07-29 00:51:10'),
(495, 'App\\Models\\Parents', 8, 'authToken', '78ce75c66446f0af3a54a748fdeed9020226dbf782ccdd56c955b6b47b26ac9f', '[\"*\"]', NULL, '2023-07-29 03:55:29', '2023-07-29 03:55:29'),
(497, 'App\\Models\\Teacher', 4, 'authToken', '407f0e4e2d961d9e0ededc2f54afd29838c1945e3f98576b8088d04d98315cf6', '[\"*\"]', NULL, '2023-07-29 05:36:14', '2023-07-29 05:36:14'),
(498, 'App\\Models\\Teacher', 4, 'authToken', 'aecc3d421e51d44a599f65ec009374a5a065c42d3bfba2349335241fb728930c', '[\"*\"]', '2023-07-29 05:54:52', '2023-07-29 05:53:18', '2023-07-29 05:54:52'),
(499, 'App\\Models\\Teacher', 4, 'authToken', 'bd05ebdfe12c80d9c08d45bd030fe4ea38b45d9587e578d519329e75fa389bf7', '[\"*\"]', '2023-07-29 06:04:56', '2023-07-29 06:02:20', '2023-07-29 06:04:56'),
(500, 'App\\Models\\Teacher', 4, 'authToken', 'f5c5b06f82673e423d0231360e2008e0eaed4fea4fc8b80b0eb0d44babfe4409', '[\"*\"]', NULL, '2023-07-29 07:37:09', '2023-07-29 07:37:09'),
(501, 'App\\Models\\Teacher', 4, 'authToken', 'a49a10ff6e75aec767c5fc72f052a7a8e0ab1883ec7209eb31730534dd91ab00', '[\"*\"]', '2023-07-29 07:43:31', '2023-07-29 07:39:26', '2023-07-29 07:43:31'),
(502, 'App\\Models\\Teacher', 4, 'authToken', 'f8bc995ac41405e16f2f3fbfe586f698eec4fd161d0357d48e96c324f0c004ca', '[\"*\"]', '2023-07-29 07:49:36', '2023-07-29 07:45:59', '2023-07-29 07:49:36'),
(503, 'App\\Models\\Teacher', 4, 'authToken', '61092b06b656bf10bd9d6ccc82a2818115fa8f6925e77dd9104056c9db342336', '[\"*\"]', '2023-07-29 07:52:48', '2023-07-29 07:51:25', '2023-07-29 07:52:48'),
(504, 'App\\Models\\Teacher', 4, 'authToken', 'de8ecddaf8612a9c682828178bb2dc70389878c224325bef5adcc38679c33472', '[\"*\"]', '2023-07-29 08:13:43', '2023-07-29 08:04:53', '2023-07-29 08:13:43'),
(505, 'App\\Models\\Teacher', 4, 'authToken', '7ae0e7a8a48ef29e76b44cab8b4c3812ba7f1f83aa3b8d33e81124bb3ab9d953', '[\"*\"]', '2023-07-29 08:18:10', '2023-07-29 08:17:39', '2023-07-29 08:18:10'),
(506, 'App\\Models\\Teacher', 4, 'authToken', '12a86068f69e1bb9f190fce2ce7af90ac6798b37959e97d4a9e2200af0d64227', '[\"*\"]', '2023-07-29 08:20:01', '2023-07-29 08:19:27', '2023-07-29 08:20:01'),
(507, 'App\\Models\\Teacher', 4, 'authToken', 'c3601658237eb8f7d2c1a813b16857a0e52142e49b005e585ab6b01ee126b9ba', '[\"*\"]', '2023-07-29 08:40:32', '2023-07-29 08:39:55', '2023-07-29 08:40:32'),
(508, 'App\\Models\\Teacher', 4, 'authToken', 'f381b74aaa6e7b933484310b9359efdefd5e9985a3d9fd655256424bf4c46764', '[\"*\"]', NULL, '2023-07-29 08:57:49', '2023-07-29 08:57:49'),
(509, 'App\\Models\\Teacher', 4, 'authToken', '443ca873919a686986b898f8b849553c0e2fc7fca02fc04879fb264cbed276d3', '[\"*\"]', '2023-07-29 14:24:43', '2023-07-29 14:21:37', '2023-07-29 14:24:43'),
(510, 'App\\Models\\Teacher', 4, 'authToken', 'f2d61ec7ba5036842dba84643e60766ac009310e9bb6a97f8995592ef1076130', '[\"*\"]', NULL, '2023-07-29 14:33:57', '2023-07-29 14:33:57'),
(511, 'App\\Models\\Teacher', 4, 'authToken', '2ebe282d3fa1850c2be285ad63f02c58f41830575420a41dbf14fd97e095deae', '[\"*\"]', NULL, '2023-07-29 22:02:41', '2023-07-29 22:02:41'),
(512, 'App\\Models\\Teacher', 4, 'authToken', '4acfde463ede68e81c0e576ccc7731bd8f817af89d71e6f48310f2cd3ac2ed67', '[\"*\"]', '2023-07-29 22:33:35', '2023-07-29 22:02:46', '2023-07-29 22:33:35'),
(513, 'App\\Models\\Teacher', 4, 'authToken', 'aef8a0837793d3c592d3ecbf0680dc0c12475df614245c7be1d7a4defd388112', '[\"*\"]', '2023-07-31 04:41:17', '2023-07-30 00:35:27', '2023-07-31 04:41:17'),
(514, 'App\\Models\\Teacher', 4, 'authToken', '7ae54c69156b18249c1f1fe3ba099d847ac5a4222866ebddbe14239f13e81acc', '[\"*\"]', '2023-07-30 00:50:06', '2023-07-30 00:49:52', '2023-07-30 00:50:06'),
(515, 'App\\Models\\Teacher', 4, 'authToken', '0b95a36b4252722a943f556172a1caaf98aaf98b04391ece20aa158d90a59f43', '[\"*\"]', NULL, '2023-07-30 00:55:35', '2023-07-30 00:55:35'),
(516, 'App\\Models\\Teacher', 4, 'authToken', '5ee433ff23d29f3c2697d052c84ea71136c2697f499ed27a617cce655bb793cb', '[\"*\"]', '2023-07-30 01:01:41', '2023-07-30 00:56:17', '2023-07-30 01:01:41'),
(517, 'App\\Models\\Teacher', 4, 'authToken', '5bd0c5ab53d32710949db9f84643ab26c5502f13d36c01c04c5a0757fc801d7b', '[\"*\"]', NULL, '2023-07-30 18:26:15', '2023-07-30 18:26:15'),
(518, 'App\\Models\\Teacher', 4, 'authToken', 'df05dad2df21d3228927082322d7a25d9cea37e743a4c912214f887fbcfbf211', '[\"*\"]', NULL, '2023-07-31 03:49:58', '2023-07-31 03:49:58'),
(520, 'App\\Models\\Teacher', 4, 'authToken', '7b2e25e8b177975d137328d1252ea2647d1b3088d3bb40a4a1fe1029e7a733f4', '[\"*\"]', NULL, '2023-08-22 21:32:22', '2023-08-22 21:32:22'),
(521, 'App\\Models\\Teacher', 4, 'authToken', '669c8485e2af60c7c18c1488f7abf48e2d88233e24978447c4dfedd30480a8b6', '[\"*\"]', NULL, '2023-08-22 21:32:43', '2023-08-22 21:32:43'),
(522, 'App\\Models\\Teacher', 4, 'authToken', '2fe962da81c93755c2bce3274e008f1b9326bfc3490382c85b9ec7a5e63ddcf6', '[\"*\"]', '2023-08-22 21:35:47', '2023-08-22 21:33:24', '2023-08-22 21:35:47'),
(523, 'App\\Models\\Teacher', 4, 'authToken', '6152595f723839889168114ecfce0cb5d03ede5b53c37d8e1e2af6eaabdf0ea8', '[\"*\"]', NULL, '2023-08-26 22:59:21', '2023-08-26 22:59:21'),
(524, 'App\\Models\\Teacher', 4, 'authToken', '803b7bfb20b2ac9bb5ab3122a9014508fdeb91d0ce64721631863a2f09a8e703', '[\"*\"]', NULL, '2023-08-26 23:08:20', '2023-08-26 23:08:20'),
(525, 'App\\Models\\Teacher', 4, 'authToken', 'b018cbf244e6e10e234d03a475531964811b9d9ba301728da850d636b3b69282', '[\"*\"]', NULL, '2023-08-26 23:08:23', '2023-08-26 23:08:23'),
(527, 'App\\Models\\Teacher', 4, 'authToken', '825c95a912b87d44f87905f65c027f18ab3e71744a2ef93038b5354a9e28351c', '[\"*\"]', NULL, '2023-08-26 23:55:57', '2023-08-26 23:55:57'),
(528, 'App\\Models\\Teacher', 4, 'authToken', 'cab490e735944f679f6ba0eea7b04938e55906d6fe212706a1c7daca9714247b', '[\"*\"]', NULL, '2023-08-26 23:57:11', '2023-08-26 23:57:11'),
(529, 'App\\Models\\Teacher', 4, 'authToken', 'db5599d5a92d0310a2c3eb97140b278db765bccbcad819629e537410de629cd2', '[\"*\"]', NULL, '2023-08-27 00:00:30', '2023-08-27 00:00:30'),
(530, 'App\\Models\\Teacher', 4, 'authToken', '01d9ce88c70c47b1066072217fdacbafc817cf06e50efc313c2005d1127783ee', '[\"*\"]', NULL, '2023-08-27 00:01:17', '2023-08-27 00:01:17'),
(531, 'App\\Models\\Teacher', 4, 'authToken', 'f80eddfe5cd173546d1dffb5f00801ed6ac841ca30d5efcc6600e01b32c1997f', '[\"*\"]', NULL, '2023-08-27 00:08:12', '2023-08-27 00:08:12'),
(532, 'App\\Models\\Teacher', 4, 'authToken', 'e148feff7fa9c84fb1d4d4034ec452bbf2570b870f580ac7cfe4b5697e6d9d1b', '[\"*\"]', NULL, '2023-08-27 00:10:04', '2023-08-27 00:10:04'),
(533, 'App\\Models\\Teacher', 4, 'authToken', '105ced52d474b02a37cb7e79eed3822ca07542a3ff5469c20840f36777681034', '[\"*\"]', NULL, '2023-08-27 00:12:17', '2023-08-27 00:12:17'),
(534, 'App\\Models\\Teacher', 4, 'authToken', '23218536dd4bb78b212fb410d179d17720925db3495bff6bab139eea308ddf39', '[\"*\"]', NULL, '2023-08-27 00:15:31', '2023-08-27 00:15:31'),
(535, 'App\\Models\\Teacher', 4, 'authToken', '73a3d4b37fb2ab6a0bdceb72afa3f3961ab7b0036caba133b4ef03cb9f51b95c', '[\"*\"]', NULL, '2023-09-14 20:23:47', '2023-09-14 20:23:47'),
(536, 'App\\Models\\Teacher', 4, 'authToken', '600779f7681679ef622b3476ea8d8535d93907bd0bf1ea9538efd69f52a3ceeb', '[\"*\"]', NULL, '2023-09-16 22:31:57', '2023-09-16 22:31:57'),
(537, 'App\\Models\\Teacher', 4, 'authToken', '00aa506ab06767e9560d1439a318189b2eb99408ed2b478f67642659355f18a6', '[\"*\"]', '2023-09-21 19:19:11', '2023-09-21 19:05:01', '2023-09-21 19:19:11'),
(538, 'App\\Models\\Teacher', 4, 'authToken', '6ab642c01220586a1d5e527083441c46a59be0f45f6c6300ef9a2ea7d5fc0777', '[\"*\"]', '2023-09-21 20:29:22', '2023-09-21 20:29:10', '2023-09-21 20:29:22'),
(539, 'App\\Models\\Teacher', 4, 'authToken', '53705d518cc9e5b5cf4fd0e2d25c4717d15a96b28f49bf5196388b3b21044f3c', '[\"*\"]', NULL, '2023-09-24 18:55:05', '2023-09-24 18:55:05'),
(540, 'App\\Models\\Teacher', 4, 'authToken', '653ecd81a57f60b297ac4effbb3492e863a2c097e491b523a938a01752928580', '[\"*\"]', NULL, '2024-01-07 03:17:22', '2024-01-07 03:17:22'),
(541, 'App\\Models\\Teacher', 4, 'authToken', 'd9657ea824f199817f08a8013996c77bbc4c1be87850caac2a9470302e381a74', '[\"*\"]', '2024-01-07 08:46:24', '2024-01-07 03:38:16', '2024-01-07 08:46:24'),
(542, 'App\\Models\\Teacher', 4, 'authToken', 'd455867c489a287afd9d2a0b6acb46b6229b1b458e7256736654202e1372a6a8', '[\"*\"]', '2024-01-07 08:48:52', '2024-01-07 08:48:30', '2024-01-07 08:48:52'),
(543, 'App\\Models\\Teacher', 4, 'authToken', '37c53ac1d9e9bbcfd9dc4122d3a3d7b21a516cb2f22c4dfa8ad73fe52b9d91a6', '[\"*\"]', '2024-01-07 09:11:44', '2024-01-07 08:50:45', '2024-01-07 09:11:44'),
(544, 'App\\Models\\Teacher', 4, 'authToken', '5f2b9ea8b3c4f76653569ed87c9191e47d6e42b2ebc7097c59296e3254e58a73', '[\"*\"]', NULL, '2024-01-07 23:24:53', '2024-01-07 23:24:53'),
(545, 'App\\Models\\Teacher', 4, 'authToken', '241eeda938c86cac539b7651f38dc9f081739ace48e41b1c6b3df5ddd85e0ae2', '[\"*\"]', NULL, '2024-01-07 23:26:33', '2024-01-07 23:26:33'),
(546, 'App\\Models\\Teacher', 4, 'authToken', '4e3eb2a8e088f1ceae6a3ae4646374b115ca4c5aef65872f968d9e73af7cb16d', '[\"*\"]', NULL, '2024-01-07 23:28:47', '2024-01-07 23:28:47'),
(547, 'App\\Models\\Teacher', 4, 'authToken', '21fbcc95f069f5441f8ee55f89878196b299b9d71c3f0137ab5759b057a9d53a', '[\"*\"]', NULL, '2024-01-07 23:29:57', '2024-01-07 23:29:57'),
(548, 'App\\Models\\Teacher', 4, 'authToken', '3d0fc3ae540403afa31e3dcc2fbbe4b29930150a93c1a3ba539203c8b250bff9', '[\"*\"]', '2024-01-08 00:01:00', '2024-01-07 23:42:04', '2024-01-08 00:01:00'),
(549, 'App\\Models\\Teacher', 4, 'authToken', '7a09905371e173ec0bb648d2c1b3375d1b684ac10ac76452240697c810611fd7', '[\"*\"]', NULL, '2024-01-08 00:03:09', '2024-01-08 00:03:09'),
(550, 'App\\Models\\Teacher', 4, 'authToken', '313735a5f7427af04984d626160d5f0251dddf130151f5879520957edf440387', '[\"*\"]', '2024-01-08 03:00:01', '2024-01-08 00:03:40', '2024-01-08 03:00:01'),
(551, 'App\\Models\\Teacher', 4, 'authToken', 'cdc50669c00384f7f2717346465effc0b15d21fb84175169c61a0e64818ae5aa', '[\"*\"]', NULL, '2024-01-08 03:19:45', '2024-01-08 03:19:45'),
(552, 'App\\Models\\Teacher', 4, 'authToken', '94136deb0b525423b17b6445c3f3cec51dc4c96243895e8c5b57469297485e0a', '[\"*\"]', '2024-01-08 03:20:47', '2024-01-08 03:20:14', '2024-01-08 03:20:47'),
(553, 'App\\Models\\Teacher', 4, 'authToken', '963f94e54d35b955d294f15135d9af6ff2d47e44e3e7e21cb433b1df3fd19a3b', '[\"*\"]', '2024-01-08 03:32:48', '2024-01-08 03:31:10', '2024-01-08 03:32:48'),
(555, 'App\\Models\\Teacher', 4, 'authToken', '7134e2d65bfc5517f4724b90c100c85b5ce038ac090e2c4f655be1f81c5f422f', '[\"*\"]', NULL, '2024-01-11 09:07:22', '2024-01-11 09:07:22'),
(556, 'App\\Models\\Teacher', 4, 'authToken', '4eaaa6b6d22a492e94371526c18bbca0ed586ba1c813f21dbf8383dc9e84fbd9', '[\"*\"]', NULL, '2024-01-11 09:17:23', '2024-01-11 09:17:23'),
(557, 'App\\Models\\Teacher', 4, 'authToken', '34645dfdfac19714b927a804ab3b0c166d5cd50b3803ee2f797dfb168237e82d', '[\"*\"]', NULL, '2024-01-11 09:21:23', '2024-01-11 09:21:23'),
(558, 'App\\Models\\Teacher', 4, 'authToken', '3af9d82d9ca848dff007b363011a3807ca2c52f7be34c7440a190b00333564a5', '[\"*\"]', NULL, '2024-01-11 09:30:37', '2024-01-11 09:30:37'),
(559, 'App\\Models\\Teacher', 4, 'authToken', '73f878f243c14321fc4f814e69285c0b28e05c85a2db3f161df909498527be28', '[\"*\"]', NULL, '2024-01-11 09:32:47', '2024-01-11 09:32:47'),
(560, 'App\\Models\\Student', 26, 'authToken', 'd7a8e0158532a3f7e7310f76af4eceeda542fd959f21cb2ad4c3c3cb9fdc1908', '[\"*\"]', NULL, '2024-01-11 09:36:18', '2024-01-11 09:36:18'),
(561, 'App\\Models\\Student', 26, 'authToken', 'd9bb83a9a0621800932f8d1aabc5cb77133a1e4910f8ed5667750e5da7a431b1', '[\"*\"]', NULL, '2024-01-11 09:41:15', '2024-01-11 09:41:15'),
(562, 'App\\Models\\Student', 26, 'authToken', '5776ebb7fef18a0ff9087226be20b0e3e02485732059378e054a6747a284ef26', '[\"*\"]', NULL, '2024-01-11 09:46:31', '2024-01-11 09:46:31'),
(563, 'App\\Models\\Student', 26, 'authToken', '85df9e7f6b4b7ad954a6661ff7e5e0d95bb76699cfcc3bd2efad7ce6e7b0a7d9', '[\"*\"]', NULL, '2024-01-11 09:49:24', '2024-01-11 09:49:24'),
(564, 'App\\Models\\Student', 26, 'authToken', 'e5302a128a2c8ff7b4780ced2a8d918adb9ea93e74333957679d6d4196529fce', '[\"*\"]', NULL, '2024-01-11 09:50:00', '2024-01-11 09:50:00'),
(565, 'App\\Models\\Student', 26, 'authToken', '9348dc2a52a9b06fd4d11a71f3438b131f43ac1f28dfddd35676bb2e545dbce4', '[\"*\"]', NULL, '2024-01-11 09:50:40', '2024-01-11 09:50:40'),
(566, 'App\\Models\\Teacher', 4, 'authToken', '72f725c3a951a08ce29ae992828209f0008b7917a4da05492e2b1566e709100b', '[\"*\"]', NULL, '2024-01-22 00:29:25', '2024-01-22 00:29:25'),
(567, 'App\\Models\\Teacher', 4, 'authToken', '15f09cc47ebe686a8fa15d3a22aeb2f766a7e165c59caa79324047d5ab501922', '[\"*\"]', NULL, '2024-01-22 00:38:42', '2024-01-22 00:38:42'),
(568, 'App\\Models\\Teacher', 4, 'authToken', '28edde2b3edc4d67952803d53f8632331927e77dfd0e197f4a126172dc68ca03', '[\"*\"]', NULL, '2024-01-26 04:48:42', '2024-01-26 04:48:42'),
(570, 'App\\Models\\Student', 26, 'authToken', 'e57be34c90348ef2e5fb43d5b2d5c72825427d39fa3a8fdd93e601ac83c9238f', '[\"*\"]', NULL, '2024-01-28 02:35:29', '2024-01-28 02:35:29'),
(571, 'App\\Models\\Student', 26, 'authToken', '98778c8468034af8d6dbbb3fbe686daaf2d624f672459884237b3f6cc55747a4', '[\"*\"]', NULL, '2024-01-28 02:36:31', '2024-01-28 02:36:31'),
(572, 'App\\Models\\Student', 26, 'authToken', 'd381c6c58ff19a6df6c7c19206e79efe2f1eddcfdbe6526ac7ffa242a449a315', '[\"*\"]', NULL, '2024-01-28 02:38:56', '2024-01-28 02:38:56'),
(573, 'App\\Models\\Student', 26, 'authToken', 'c9bbba0d0f049bd79c80085603a49417d66373e94dc8fb35082369f3b61bf9f7', '[\"*\"]', NULL, '2024-01-28 02:40:14', '2024-01-28 02:40:14'),
(574, 'App\\Models\\Student', 26, 'authToken', '469de05f6fd12ecd4bb481464beb5f798ada6508153f85403985e95ee0d7dc58', '[\"*\"]', NULL, '2024-01-28 02:40:31', '2024-01-28 02:40:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('idLCKg1363QIRHqfvAY6ucPq96lrAb54VY0lSlre', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaElOWTZEczJxbzNNZDJldlJwMXlMZEhSeWRod1ZhdlBGQ1o2cUo0eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9lcG9pbnQtYXBpLnRlc3QvZGFzaGJvYXJkL2ZvdWw/cGFnZT0xMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJEdSbDUwQXQxYnZ5dHNCZUxqY2ovM3VzYy5Ca2txSUZtY0o0aFJZaXJMcEx3dG5nT0ZYcENTIjt9', 1705908402),
('mRGSed4P3kk5v3GEuzET2QNeDyW3TUwkZVjYUQff', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibEx4UnpVeVNvY1ZBajJVdktNS3dJdVdqbzZ0N1BPZXNuOHFXaDVLYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9lcG9pbnQtYXBpLnRlc3QvZGFzaGJvYXJkL3N0dWRlbnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJEdSbDUwQXQxYnZ5dHNCZUxqY2ovM3VzYy5Ca2txSUZtY0o0aFJZaXJMcEx3dG5nT0ZYcENTIjt9', 1704733740),
('Np9Kl13sRoKJD6NOl43nT6ZOTHrHUfvaYFBRk1Q7', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUk1Zell6NVhEejFqUGx2RHZmSUExVVlkNmgxQXZTbngwcjJ1Uk5aciI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ0OiJodHRwOi8vZXBvaW50LWFwaS50ZXN0L2Rhc2hib2FyZC9mb3VsP3BhZ2U9NiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkR1JsNTBBdDFidnl0c0JlTGpjai8zdXNjLkJra3FJRm1jSjRoUllpckxwTHd0bmdPRlhwQ1MiO30=', 1706434567),
('XnfOPlkAzRlB8ZLAL0cFjhDbfepvGAGKzM5bfPZp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY0oxNWhtQXZEUlpZUEdsUWtDMHRTaVVCcXJjaWhmWWpncU8yOXQ4ViI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL2Vwb2ludC1hcGkudGVzdC9kYXNoYm9hcmQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL2Vwb2ludC1hcGkudGVzdC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1705908308);

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `nis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_and_place_of_birth` date DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_parent` bigint UNSIGNED DEFAULT NULL,
  `id_class_room` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `nis`, `name`, `password`, `remember_token`, `date_and_place_of_birth`, `gender`, `phone_number`, `address`, `profile_photo_path`, `deleted_at`, `created_at`, `updated_at`, `id_parent`, `id_class_room`) VALUES
(11, '222301001', 'Adam Pratama', '$2y$10$ok6R2XRCzP1JqiTxNOT1AOOIyBVJb5W6AY4ByNbLC3c/qNiCDfGZy', NULL, '2011-09-29', 'Laki-laki', '+6285798417093', 'adress', 'assets/images/student/DOG2Ru4kwnGFFWG1DhJGMcROa9fpwlEww7bKtAne.jpg', NULL, '2023-05-07 23:03:10', '2023-06-26 23:38:23', 3, 'C10'),
(12, '222301021', 'Dimas Maulana', '$2y$10$tIlcbwT9ShvRQBTg.f572OQyeXKQo6qfeowQAuHGEm4QtWnSnXPxK', NULL, '2011-09-29', 'Perempuan', '+6285798417093', 'adress', 'assets/images/student/0vfGagSOZYjcpPZX58AdXeFpx4fxK3QeJVM141WE.jpg', NULL, '2023-05-08 01:31:54', '2023-06-27 09:05:29', 3, 'C01'),
(13, '222301023', 'Farhan Azizi', '$2y$10$/biZHERObBpu9JLpgKuD4OJTneQOzRC.timGP0WM0KeluvUR/cHEO', NULL, '2023-05-14', 'Laki-laki', '038', 'adsad', NULL, NULL, '2023-05-14 07:00:51', '2023-05-14 07:00:51', 3, 'C02'),
(18, '222301004', 'Dani', '$2y$10$dopPiS03T51c7g72sFxMoenMWyYWEolutyzM4UaE08dtWZyehQYh2', NULL, '2023-06-30', 'Laki-laki', '012345678910', 'adsadsad', 'assets/images/student/MuxXhDxydiwttUtY8txxJJodMC50MtfztZ401YRO.png', NULL, '2023-06-26 23:19:29', '2023-06-26 23:36:03', 5, 'C11'),
(21, '131231236', 'Parhan Hamdalah', '$2y$10$8PNbNGbDdheOUiSKF9dKtuYFZ63fFl6qhu9njLj99H51fqgW/0/XG', NULL, '2023-06-30', 'Laki-laki', '131232132', 'wdws', 'assets/images/student/Z3cYvD9DZJ4ZICkWZKeAJoMu3VfaYaDgYodqk9Fu.jpg', NULL, '2023-06-27 08:59:22', '2023-06-27 08:59:22', 3, 'C11'),
(22, '222301012', 'Jibriel Abdilah', '$2y$10$iyi9Xjvr/YTjv4foOHQLo.cMiDftOjXAS49Jl1p5T0if6cmowsU46', NULL, '2011-09-29', 'Laki-laki', '+6285798417093', 'adress', NULL, NULL, '2023-07-16 18:18:30', '2023-07-17 08:03:11', 3, 'C01'),
(26, '243243', 'Jajang', '$2y$10$FoOSaHw5z58sAlxxo5eh2.3.HasUslWxeFTLseg7jOkXW4qnofWne', NULL, '2011-09-29', 'Laki-laki', '+6285798417093', 'adress', NULL, NULL, '2023-07-29 05:51:12', '2023-07-29 05:51:12', 3, 'C07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `nip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_and_place_of_birth` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `teachers`
--

INSERT INTO `teachers` (`id`, `nip`, `password`, `remember_token`, `name`, `position`, `gender`, `phone_number`, `date_and_place_of_birth`, `address`, `deleted_at`, `created_at`, `updated_at`, `profile_photo_path`) VALUES
(1, '0101091027', '$2y$10$XsQjWS.DJ8mup9J7p/C9FePOcRrQNnh1pW9sK.myyNdgr.rvBPHSm', NULL, 'Irwan Kurniawan', 'Guru RPL', 'Laki-laki', '085793910980', '2023-05-10', 'Cikakak', NULL, '2023-05-04 10:09:18', '2023-09-13 08:43:26', 'assets/images/teacher/0101091027.png'),
(2, '196801081989031000', '$2y$10$OI.wPfInP/TGBiU8a8IYxeSNeejvjTQGuRaSoQTAOHnEeYSgympMK', NULL, 'Trisno Sri Hartono', 'kesiswaan', 'Laki-laki', '081563107612', '2023-05-10', 'Mariuk', NULL, '2023-05-09 19:19:46', '2023-09-13 08:43:36', 'assets/images/teacher/196801081989031000.png'),
(4, '0101092136', '$2y$10$8CeXbA9d/Bw6aRnKOk2DRuOkAqHIWIVzXBJIh79aObKUsFcl86ej2', NULL, 'Asep Sukandar', 'BK', 'Laki-laki', '085280103302', '2011-09-29', 'Bandung Barat', NULL, '2023-05-16 02:47:32', '2023-09-13 08:43:52', 'assets/images/teacher/0101092136.jpg'),
(9, '197806062014111000', '$2y$10$sivIskmBd9o1DUIahkOOSudcQ3u3RK95OPTmnbqomf5dz6Bfju7ri', NULL, 'RUDI HARTONO, S.Pd.', 'Tenaga Pendidik/Guru', 'Laki-laki', '085312858608', '2023-07-28', 'Kp. Nagrog - RT. 005/002 - Ds. Citarik - Kec. Palabuhanratu - Kab.Sukabumi - Prov. Jawa Barat - 43364', NULL, '2023-07-29 04:03:54', '2023-09-13 08:31:39', 'assets/images/teacher/197806062014111000.png'),
(10, '0101091025', '$2y$10$KrNRWgAk8MjkYA97RViokec2ip4xpNILxb6u0PnBfFH8n2/cZHWb.', NULL, 'ANDRIANSYAH,  SE', 'Tenaga Pendidik/Guru', 'Laki-laki', '085798778363', '2023-08-01', 'JL. KH. Ahmad Sanusi GG. Cemara NO. 49 - RT. 049/021- Ds. Sukaresmi - Kec. Cisaat - Kab. Sukabumi - Prov. Jawa Barat - 43152', NULL, '2023-07-29 23:04:29', '2023-09-13 08:44:48', 'assets/images/teacher/132123123.png'),
(11, '0553774675230102', '$2y$10$MnDaaFpZdq48SRoYlvCqPuEmGGno9DrqWHYTo0TojFCGoDnVY.eiq', NULL, 'MARYAM JAMILAH, M.Pd', 'Tenaga Pendidik/Guru', 'Perempuan', '081385811865', '1996-02-21', 'Kp. Cimaja Asem III - RT. 003/001 - Ds. Cimaja  - Kec. Cikakak - Kab. Sukabumi - Prov. Jawa Barat - 43365', NULL, '2023-09-13 08:36:11', '2023-09-13 08:44:25', 'assets/images/teacher/0553774675230102.png'),
(12, '197107031998021000', '$2y$10$HpDfzWKRLCW.O1i9goi9CefhbuSJCp0bZxIKK9yYGMvz0ZsS7dCZ.', NULL, 'KHUDAENI MUPLIHAN, MM.Pd', 'Tenaga Pendidik/Guru', 'Laki-laki', '082115792713', '1971-07-03', 'Perum Tamansari Blok E.1 NO. 4 - RT.  01/035 - Kel. Palabuhanratu - Kec. Palabuhanratu - Kab. Sukabumi - Prov. Jawa Barat - 43364', NULL, '2023-09-13 08:40:18', '2023-09-13 08:45:05', 'assets/images/teacher/197107031998021000.png'),
(13, '8345751653200020', '$2y$10$Vut0SRCFBpNfQX6QGMMXQ.Wq6Igp8r.0ZB1gxA0Wh2hJsk5gYZ1o2', NULL, 'HERMANTO, M.Pd', 'Tenaga Pendidik/Guru', 'Laki-laki', '085860490634', '1973-10-13', 'Kp. Sukawayana - RT. 007/002 - Ds. Cikakak - Kec. Cikakak - Kab.Sukabumi - Prov. Jawa Barat - 43365', NULL, '2023-09-13 08:43:12', '2023-09-13 08:43:12', 'assets/images/teacher/8345751653200020.jpeg'),
(14, '7958774675130080', '$2y$10$KnlUi5YCjORCheQzt/BMlepbWh.E96.08uTtKERveRiIk2tBR85Sq', NULL, 'KEMAL HERMAWAN, S.Pd', 'Tenaga Pendidik/Guru', 'Laki-laki', '085862677791', '1996-06-26', 'Kp. Mazlis Bina Ratu - RT. 003/019 - Kel. Palabuhanratu - Kec. Palabuhanratu - Kab. Sukabumi - Prov. Jawa Barat - 43364', NULL, '2023-09-13 08:46:09', '2023-09-13 08:46:18', 'assets/images/teacher/7958774675130080.png'),
(15, '7345768669130120', '$2y$10$MHiyGfzKxyuWiEzWUiKMuOYZnDR8ojGX12q6jn5.PgurU2X4gHlLm', NULL, 'SITI SARAH NURSEPTIANI S.Pd', 'Tenaga Pendidik/Guru', 'Perempuan', '085884906667', '1996-09-23', 'Kp. Gadog - RT. 003/013 - Ds. Citarik - Kec. Palabuhanratu - Kab. Sukabumi - Prov. Jawa Barat - 43364', NULL, '2023-09-13 08:47:49', '2023-09-13 08:47:49', 'assets/images/teacher/7345768669130120.png'),
(16, '0101091023', '$2y$10$L2Iq2RQF0ypKM.yhnsMRRObQ91J423AcDjNb.LBxO7HEYd90R.1RG', NULL, 'NANDA PERDANA,  S.Pd', 'Kepala Sekolah', 'Laki-laki', '085219972029', '1982-10-22', 'Perumahan Tamansari Blok E2 No. 8 - RT. 001/035 - Kel. Palabuhanratu - Kec. Palabuhanratu - Kab. Sukabumi - Prov. Jawa Barat - 43364', NULL, '2023-09-13 08:48:52', '2023-09-13 08:48:52', 'assets/images/teacher/0101091023.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `teams`
--

CREATE TABLE `teams` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint UNSIGNED NOT NULL,
  `team_id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint UNSIGNED NOT NULL,
  `team_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Fahriz Dimasqy', 'admin@gmail.com', NULL, '$2y$10$GRl50At1bvytsBeLjcj/3usc.BkkqIFmcJ4hRYirLpLwtngOFXpCS', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-03 03:05:21', '2023-05-03 03:05:21');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `class_rooms`
--
ALTER TABLE `class_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_rooms_major_id_foreign` (`major_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `form_of_fouls`
--
ALTER TABLE `form_of_fouls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_of_fouls_category_foul_id_foreign` (`category_foul_id`);

--
-- Indeks untuk tabel `fouls`
--
ALTER TABLE `fouls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fouls_teacher_nip_foreign` (`teacher_nip`),
  ADD KEY `fouls_form_of_foul_id_foreign` (`form_of_foul_id`),
  ADD KEY `student_nis` (`student_nis`);

--
-- Indeks untuk tabel `foul_categories`
--
ALTER TABLE `foul_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parents_username_unique` (`username`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_nis_unique` (`nis`),
  ADD KEY `students_id_parent_foreign` (`id_parent`),
  ADD KEY `students_id_class_room_foreign` (`id_class_room`);

--
-- Indeks untuk tabel `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_nip_unique` (`nip`);

--
-- Indeks untuk tabel `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indeks untuk tabel `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fouls`
--
ALTER TABLE `fouls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `class_rooms`
--
ALTER TABLE `class_rooms`
  ADD CONSTRAINT `class_rooms_major_id_foreign` FOREIGN KEY (`major_id`) REFERENCES `majors` (`id`);

--
-- Ketidakleluasaan untuk tabel `form_of_fouls`
--
ALTER TABLE `form_of_fouls`
  ADD CONSTRAINT `form_of_fouls_category_foul_id_foreign` FOREIGN KEY (`category_foul_id`) REFERENCES `foul_categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `fouls`
--
ALTER TABLE `fouls`
  ADD CONSTRAINT `fouls_form_of_foul_id_foreign` FOREIGN KEY (`form_of_foul_id`) REFERENCES `form_of_fouls` (`id`),
  ADD CONSTRAINT `fouls_ibfk_1` FOREIGN KEY (`student_nis`) REFERENCES `students` (`nis`),
  ADD CONSTRAINT `fouls_teacher_nip_foreign` FOREIGN KEY (`teacher_nip`) REFERENCES `teachers` (`nip`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_id_class_room_foreign` FOREIGN KEY (`id_class_room`) REFERENCES `class_rooms` (`id`),
  ADD CONSTRAINT `students_id_parent_foreign` FOREIGN KEY (`id_parent`) REFERENCES `parents` (`id`);

--
-- Ketidakleluasaan untuk tabel `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
