-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 21 Oca 2021, 10:18:25
-- Sunucu sürümü: 5.7.31-log
-- PHP Sürümü: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `divan`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kisi_id` int(11) NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dogumtar` date DEFAULT NULL,
  `evliliktar` date DEFAULT NULL,
  `misafir_id` int(11) DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `karaliste` int(11) DEFAULT '0',
  `isActive` int(11) NOT NULL DEFAULT '0',
  `isSend` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `appointment_notes`
--

CREATE TABLE `appointment_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointmentId` int(11) NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `ad` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `tarih` date NOT NULL,
  `saat` time NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `events`
--

INSERT INTO `events` (`id`, `ad`, `tarih`, `saat`, `image`, `created_at`, `updated_at`) VALUES
(11, 'Cemal Kılınçer Konseri', '2021-02-12', '21:00:00', '582ab7ddb3a343a98b052742192ed2b2.jpg', '2021-01-13', '2021-01-13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tablename` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `description` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_09_17_092725_create_appointments_table', 1),
(12, '2019_09_17_092744_create_working_hours_table', 1),
(13, '2019_09_21_130519_create_appointment_notes_table', 1),
(14, '2020_11_26_092346_create_tables_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `misafir`
--

CREATE TABLE `misafir` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `misafir`
--

INSERT INTO `misafir` (`id`, `ad`) VALUES
(1, 'yerel'),
(2, 'otel');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `nots`
--

CREATE TABLE `nots` (
  `id` int(11) NOT NULL,
  `kisi_id` int(11) NOT NULL,
  `not_icerik` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `nots`
--

INSERT INTO `nots` (`id`, `kisi_id`, `not_icerik`, `created_at`, `updated_at`) VALUES
(16, 1, 'erol', '2021-01-19', '2021-01-19'),
(17, 1, 'erol242424', '2021-01-19', '2021-01-19'),
(18, 1, 'asd', '2021-01-19', '2021-01-19'),
(19, 1, 'asdasda', '2021-01-19', '2021-01-19'),
(20, 1, 'sadasd', '2021-01-19', '2021-01-19'),
(21, 1, 'asdasd', '2021-01-19', '2021-01-19'),
(22, 1, 'asdasdasd', '2021-01-19', '2021-01-19'),
(23, 17, 'ekmek sever', '2021-01-21', '2021-01-21'),
(24, 17, 'şarap ister', '2021-01-21', '2021-01-21');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soyad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dogumtar` date DEFAULT NULL,
  `evliliktar` date DEFAULT NULL,
  `misafir_id` int(11) DEFAULT '0',
  `karaliste` int(11) DEFAULT '0',
  `karaliste_gerekce` text COLLATE utf8mb4_unicode_ci,
  `cinsiyet` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iptal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `tables`
--

INSERT INTO `tables` (`id`, `ad`, `soyad`, `email`, `tel`, `notu`, `image`, `dogumtar`, `evliliktar`, `misafir_id`, `karaliste`, `karaliste_gerekce`, `cinsiyet`, `created_at`, `updated_at`, `name`, `iptal`) VALUES
(1, 'erol1234', 'asd', 'asda', '90-543-258-21-14', 'asd', NULL, '2021-01-25', '2021-01-20', 0, 0, NULL, 0, '2021-01-12 17:05:18', '2021-01-21 00:01:47', NULL, 5),
(2, 'dasd', 'asd', 'asda', '90-543-258-21-14', 'asd', NULL, '2021-01-12', '2021-01-12', 0, 0, NULL, 0, '2021-01-12 17:06:35', '2021-01-21 00:01:31', NULL, 5),
(3, 'das', 'asd', 'asd', 'asd', 'asd', 'a49bc45470d43ef65a75f7866ac93209.jpg', '2021-01-12', '2021-01-12', 0, 0, NULL, 0, '2021-01-12 20:28:23', '2021-01-12 20:28:23', NULL, 12),
(4, 'sad', 'asd', 'asd', 'asd', 'asd', '0db278578f9f45e6428fdf70808e7ddb.jpg', '2021-01-12', '2021-01-12', 1, 0, NULL, 0, '2021-01-12 20:43:40', '2021-01-12 20:43:40', NULL, 2),
(5, 'sad', 'asd', 'asd', '90-543-258-21-14', 'asd', NULL, '2021-01-12', '2021-01-12', 0, 0, NULL, 1, '2021-01-12 20:43:49', '2021-01-21 00:01:12', NULL, 2),
(6, 'sinan', 'çevik', 's@s.com', '905432582114', 'sadkjalskdlasdasd', 'fc4d497f2bc2c30dabafb9d3cf2ab37b.jpg', '2021-01-13', '2021-01-13', 1, 0, NULL, 0, '2021-01-13 08:24:24', '2021-01-13 08:24:24', NULL, 2),
(7, 'asd', 'asd', 'asd', 'asd', 'asd', '842886c7e50656ee5a90e7291c74a714.jpg', '2021-01-16', '2021-01-16', 0, 0, NULL, 0, '2021-01-16 09:18:49', '2021-01-16 09:18:49', NULL, NULL),
(8, 'Eren', 'e', 'e@e.com', '5432582114', 'askldjlaskdjla', 'be94b7b83cadc7f7536a25388d490efa.jpg', '2021-01-16', '2021-01-16', 0, 0, NULL, 0, '2021-01-16 09:25:47', '2021-01-16 09:25:47', NULL, NULL),
(9, 'uygar', 'uygar sarıoğlu', 'u@u.com', '90-543-258-21-14', 'dasdasd', '1295262bb051a2c383624758e1d8ec5a.jpg', '2021-01-16', '2021-01-16', 0, 0, NULL, 0, '2021-01-16 19:38:53', '2021-01-16 19:38:53', NULL, NULL),
(10, 'ads', 'asd', 'asd', '90-543-258-21-14', 'asdasd', '04f9afbaf5e4420f191e75179d33c1b6.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-16 20:34:51', '2021-01-16 20:34:51', NULL, NULL),
(11, 'sdasd', 'asd', 'asd', '90-054-325-82-11', 'sada', 'd53b9377024932ecef17c9a35058389e.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-16 20:52:00', '2021-01-16 20:52:00', NULL, NULL),
(12, 'dasd', 'sad', 'asd', '90-054-325-82-11', 'sadasd', '4451dc2e8871be1aa8d2ef4a3d9196f5.jpg', NULL, NULL, 0, 1, NULL, 0, '2021-01-16 21:58:07', '2021-01-16 21:58:07', NULL, NULL),
(13, 'dasd', 'sad', 'asd', '90-054-325-82-11', 'sadasd', '1a92d25ee9a8635b8026a7da0050f708.jpg', NULL, NULL, 0, 1, NULL, 0, '2021-01-16 21:58:24', '2021-01-16 21:58:24', NULL, NULL),
(14, 'sadas', 'asd', 'asda', '90-054-325-82-11', 'sadd', '7a32c1e51ad8cc1bb12124e8daa9e7bb.jpg', NULL, NULL, 0, 1, 'kavga çıkarttı', 0, '2021-01-16 22:02:48', '2021-01-16 22:02:48', NULL, NULL),
(15, 'sda', 'asd', 'asd', '90-543-258-21-14', 'sadasd', '3725baaba48d9d444dc4fb591b1087e4.jpg', NULL, NULL, 0, 1, 'asdas', 0, '2021-01-16 22:05:02', '2021-01-16 22:05:02', NULL, NULL),
(16, 'Sinan', 'Çevik', 'sinancevik@live.com', '90-532-159-31-31', 'güzel yemeklerden hoşlanır.', '22b2de44455427434e0093b5a706ede2.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-17 06:49:39', '2021-01-17 06:49:39', NULL, NULL),
(17, 'Şeyda', 'Okdemir', 'seydaokdemir@gmail.com', '90-530-113-70-09', 'dsajdlkasjl', '263d950e0650771451d34b245f43b82d.jpg', NULL, NULL, 1, 0, NULL, 0, '2021-01-17 07:36:31', '2021-01-17 07:36:31', NULL, NULL),
(18, 'Şeyda', 'Sarıoğlu', 'seydaokdemir@gmail.com', '90-530-113-70-09', 'eşini sever', '41596ffc8df0b4855c0ddc17739dcc24.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-18 08:39:44', '2021-01-18 08:39:44', NULL, NULL),
(19, 'Özkan', 'Özek', 'ozkanozek74@icloud.com', '90-532-632-30-55', 'sahne önünü ister', 'dfb447134b9b72da32ce26b3e36a3a6a.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-19 07:00:27', '2021-01-19 07:00:27', NULL, NULL),
(20, 'Murat', 'Yıldız', 'a@a.com', '90-532-797-20-85', 'ailecek gelir sessiz yer ister.', '21658cebb926cbbf466a05748619bc21.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-19 07:27:35', '2021-01-19 07:27:35', NULL, NULL),
(21, 'Murat', 'Yıldız', 'ozkanozek74@icloud.com', '90-054-325-82-11', 'sahneden ve sesten uzak yer ister', NULL, '2021-01-20', '2020-01-24', 0, 0, NULL, 0, '2021-01-19 07:29:42', '2021-01-20 10:44:38', NULL, NULL),
(22, 'Murat', 'Yıldız', 'muraty@hotmail.com', '90-543-258-21-14', 'dasdasdas', NULL, '1977-01-20', '1996-11-12', 0, 0, NULL, 0, '2021-01-19 07:37:28', '2021-01-20 10:45:55', NULL, NULL),
(23, 'aaa', 'aaa', 'a@a.com', '90-054-325-82-11', 'ssss', 'f4be2a517cdf3354f99061ede2dca6fb.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-19 11:37:57', '2021-01-19 11:37:57', NULL, NULL),
(24, 'aaa', 'aaa', 'a@a.com', '90-054-325-82-11', 'ssss', 'ab22314c152c1f10963cbb2ea88fa763.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-19 11:38:58', '2021-01-19 11:38:58', NULL, NULL),
(25, 'aaa', 'aaa', 'a@a.com', '90-054-325-82-11', 'ssss', '451fe8d090ef4e6071dc3cc19467fa03.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-19 11:41:49', '2021-01-19 11:41:49', NULL, NULL),
(26, 'asd', 'asd', 'a@a.com', '90-054-325-82-11', 'sadasd', NULL, '2013-01-20', '2019-01-20', 0, 0, NULL, 0, '2021-01-19 11:42:14', '2021-01-20 10:37:45', NULL, NULL),
(27, 'eroluygar', 'asd', 'a@a.com', '90-543-258-21-14', 'adsdasdasdasd', NULL, '2020-01-20', '2004-01-20', 0, 0, NULL, 0, '2021-01-20 07:17:11', '2021-01-20 10:36:50', NULL, NULL),
(28, 'sdada', 'sad', 'a@a.com', '90-543-258-21-14', 'saddasd', '7b88725abeaeddb048a95d4f6fe27f2f.jpg', '1982-03-21', NULL, 0, 0, NULL, 0, '2021-01-20 07:27:16', '2021-01-20 07:27:16', NULL, NULL),
(29, 'erol', 'uygar', 'asd', '90-', 'asd', NULL, '2020-01-20', '2020-01-20', 0, 0, NULL, 0, '2021-01-20 09:33:49', '2021-01-20 10:31:38', NULL, 1),
(30, 'sadas', 'asd', 'a@a.com', '90-543-258-21-14', 'sadasd', '1bfe6a737866f3cc9cf27ea671e12efd.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 18:48:33', '2021-01-20 18:48:33', NULL, NULL),
(31, 'sadas', 'asd', 'a@a.com', '90-543-258-21-14', 'sadasd', '813902d954c63ce308b0308c7a359f19.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 18:48:58', '2021-01-20 18:48:58', NULL, NULL),
(32, 'sadas', 'asd', 'a@a.com', '90-543-258-21-14', 'sadasd', '81564e8f649db742db7e1b4d2cbac9f1.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 18:49:19', '2021-01-20 18:49:19', NULL, NULL),
(33, 'sadsa', 'asd', 'a@a.com', '90-543-258-21-14', 'sdasdas', '91c98e14584aeacca370a09ce97e8db7.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 18:53:44', '2021-01-20 18:53:44', NULL, NULL),
(34, 'sadsa', 'asd', 'a@a.com', '90-543-258-21-14', 'sdasdas', '12c84f07c3f9dc593f95960fd3ae363d.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 18:56:27', '2021-01-20 18:56:27', NULL, NULL),
(35, 'sadas', 'asdas', 'a@a.com', '90-543-258-21-14', 'saddasd', '567a410bb150f68d41cc7e762da4644c.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 18:57:02', '2021-01-20 18:57:02', NULL, NULL),
(36, 'sada', 'asdas', 'a@a.com', '90-543-258-21-14', 'asdasd', 'e629db86e3a930ccab47d9f5a3897d78.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 18:58:58', '2021-01-20 18:58:58', NULL, NULL),
(37, 'sadas', 'sad', 'a@a.com', '90-543-258-21-14', 'sadasd', '063f167ac47aa39bd3de08c68a428801.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:02:07', '2021-01-20 19:02:07', NULL, NULL),
(38, 'sad', 'asd', 'a@a.com', '90-543-258-21-14', 'sadasd', '981345c4f4bebd0080bd1526c556665b.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:40:35', '2021-01-20 19:40:35', NULL, NULL),
(39, 'ali', 'asd', 'asd@asd.com', '90-543-258-21-14', 'dsfsdfs', 'a123b5b7a70b4df772b70b2c3b745b94.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:46:04', '2021-01-20 19:46:04', NULL, NULL),
(40, 'ali', 'asd', 'asd@asd.com', '90-543-258-21-14', 'dsfsdfs', '8f4ad6d7c7330d131c5955870f4e8d4c.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:46:31', '2021-01-20 19:46:31', NULL, NULL),
(41, 'ali', 'asd', 'asd@asd.com', '90-543-258-21-14', 'dsfsdfs', '832d116c466b7fc64ab43dceebbbbd01.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:47:41', '2021-01-20 19:47:41', NULL, NULL),
(42, 'ali', 'asd', 'asd@asd.com', '90-543-258-21-14', 'dsfsdfs', '2ff89c6f3cbd1f0230dc5641a10fdf0b.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:48:54', '2021-01-20 19:48:54', NULL, NULL),
(43, 'ali', 'asd', 'asd@asd.com', '90-543-258-21-14', 'dsfsdfs', '8305da338e555725cb5ec0790e5496c2.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:50:26', '2021-01-20 19:50:26', NULL, NULL),
(44, 'veasdfsafas', 'asd', 'asd@asd.com', '90-543-258-21-14', 'dsfsdfs', '57a1a749068ea1a3aa52df56973b699a.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:50:41', '2021-01-20 19:50:41', NULL, NULL),
(45, 'sadasd', 'asda', 'a@a.com', '90-543-258-21-14', 'sadasdas', 'd122f939a57151af4ea4d216a0299b89.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-20 19:51:25', '2021-01-20 19:51:25', NULL, NULL),
(46, 'das', 'adsd', 'as@a.com', '90-053-225-82-11', 'asdasdas', 'c5171557b70a87f0a867af0e7af2ae47.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-01-21 00:02:21', '2021-01-21 00:02:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `isAdmin`, `created_at`, `updated_at`) VALUES
(1, 'uygar sarıoğlu', 'a@a', NULL, '81dc9bdb52d04dc20036dbd8313ed055', NULL, 0, '2020-11-27 10:55:04', '2020-11-27 10:55:04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `working_hours`
--

CREATE TABLE `working_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hours` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `working_hours`
--

INSERT INTO `working_hours` (`id`, `hours`, `day`, `table_id`, `created_at`, `updated_at`) VALUES
(8, '02:00', 'Pazartesi', 35, '2020-12-08 21:17:14', '2020-12-08 21:17:14'),
(9, '02:00', 'Pazartesi', 36, '2020-12-08 21:18:21', '2020-12-08 21:18:21'),
(10, '04:00', 'Pazartesi', 35, '2020-12-08 21:20:30', '2020-12-08 21:20:30'),
(11, '05:00', 'Salı', 35, '2020-12-08 21:20:36', '2020-12-08 21:20:36'),
(12, '05:00', 'Salı', 36, '2020-12-08 21:20:36', '2020-12-08 21:20:36'),
(13, '06:00', 'Çarşamba', 35, '2020-12-08 21:21:43', '2020-12-08 21:21:43'),
(14, '06:00', 'Çarşamba', 36, '2020-12-08 21:21:43', '2020-12-08 21:21:43'),
(15, '03:00', 'Perşembe', 35, '2020-12-08 21:24:38', '2020-12-08 21:24:38'),
(16, '03:00', 'Pazartesi', 35, '2020-12-09 06:37:56', '2020-12-09 06:37:56'),
(17, '03:00', 'Perşembe', 36, '2020-12-09 06:49:47', '2020-12-09 06:49:47'),
(18, '03:00', 'Pazartesi', 36, '2020-12-10 18:03:58', '2020-12-10 18:03:58'),
(19, '03:00', 'Pazartesi', 37, '2020-12-10 18:04:06', '2020-12-10 18:04:06'),
(20, '07:00', 'Pazartesi', 35, '2020-12-10 18:04:19', '2020-12-10 18:04:19'),
(21, '07:00', 'Pazartesi', 36, '2020-12-10 18:04:20', '2020-12-10 18:04:20'),
(22, '07:00', 'Pazartesi', 37, '2020-12-10 18:04:20', '2020-12-10 18:04:20');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `appointment_notes`
--
ALTER TABLE `appointment_notes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `misafir`
--
ALTER TABLE `misafir`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `nots`
--
ALTER TABLE `nots`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Tablo için indeksler `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Tablo için indeksler `working_hours`
--
ALTER TABLE `working_hours`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Tablo için AUTO_INCREMENT değeri `appointment_notes`
--
ALTER TABLE `appointment_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `misafir`
--
ALTER TABLE `misafir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `nots`
--
ALTER TABLE `nots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `working_hours`
--
ALTER TABLE `working_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
