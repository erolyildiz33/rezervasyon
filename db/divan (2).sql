-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 07 Şub 2021, 18:36:05
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
  `app_id` bigint(20) UNSIGNED NOT NULL,
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
  `bildirim_notu` text COLLATE utf8mb4_unicode_ci,
  `degisenler` text COLLATE utf8mb4_unicode_ci,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `karaliste` int(11) DEFAULT '0',
  `isActive` int(11) NOT NULL DEFAULT '0',
  `isGone` int(11) NOT NULL DEFAULT '0',
  `isCame` int(4) NOT NULL DEFAULT '0',
  `isSend` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `appointments`
--

INSERT INTO `appointments` (`app_id`, `kisi_id`, `fullName`, `phone`, `email`, `dogumtar`, `evliliktar`, `misafir_id`, `image`, `date`, `time`, `body`, `text`, `bildirim_notu`, `degisenler`, `code`, `notification_type`, `title`, `karaliste`, `isActive`, `isGone`, `isCame`, `isSend`, `created_at`, `updated_at`) VALUES
(77, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@a.com', NULL, NULL, 1, NULL, '2021-01-29', '12:10:00', '5', 'Masa süslemesi istiyorum.', NULL, '[{\"time\":\"12:10:00\"}]', '3e4d70', 1, 's-s-i-5', 0, 1, 2, 0, 0, '2021-01-26 18:31:06', '2021-02-07 13:46:49'),
(78, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@a.com', NULL, NULL, 1, NULL, '2021-01-24', '22:00:00', '45', 'sada', NULL, '[{\"time\":\"22:00:00\"}]', '25bbb2', 1, 'b-k-i-58', 0, 1, 2, 0, 0, '2021-01-28 08:54:33', '2021-02-07 13:46:49'),
(79, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-25', '23:10:00', '3', 'sadasd', NULL, '[{\"time\":\"23:10:00\"}]', 'f64379', 1, 'b-k-i-53', 0, 1, 2, 0, 0, '2021-01-28 09:23:01', '2021-02-07 13:46:49'),
(80, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-26', '22:10:00', '3', 'assdas', NULL, '[{\"time\":\"22:10:00\"}]', '4a2c1c', 1, 's-s-i-4', 0, 1, 2, 0, 0, '2021-01-28 09:29:17', '2021-02-07 13:46:49'),
(81, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-28', '22:00:00', '2', 'sadas', NULL, '[{\"date\":\"28.01.2021\"},{\"title\":\"b-k-i-56\"}]', '9328fe', 1, 'b-k-i-56', 0, 1, 2, 0, 0, '2021-01-28 18:44:25', '2021-02-07 13:46:49'),
(82, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-29', '22:00:00', '3', 'sadasd', NULL, NULL, '68c66b', 1, 'b-k-i-58', 0, 1, 2, 0, 0, '2021-01-29 18:17:49', '2021-02-07 13:46:49'),
(83, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-29', '22:00:00', '3', 'sadasd', NULL, NULL, '03a258', 1, 'b-k-i-58', 0, 1, 2, 0, 0, '2021-01-29 18:18:01', '2021-02-07 13:46:49'),
(84, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-29', '22:00:00', '3', 'sadasd', NULL, NULL, 'f43652', 1, 'b-k-i-58', 0, 2, 2, 0, 0, '2021-01-29 18:21:12', '2021-02-05 20:17:01'),
(85, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-29', '22:00:00', '3', 'sadasd', NULL, NULL, 'eb9a84', 1, 'b-k-i-58', 0, 1, 2, 0, 0, '2021-01-29 18:21:24', '2021-02-07 13:46:49'),
(86, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-29', '11:50:00', '4', 'sadasd', NULL, '[]', '8b9bce', 1, 's-s-i-5', 0, 1, 2, 0, 0, '2021-01-29 19:29:09', '2021-02-07 13:46:49'),
(87, 49, 'Özkan Özek', '90-543-258-21-14', 'ozkanozek74@ia.com', NULL, NULL, 1, NULL, '2021-01-29', '11:40:00', '2', 'dasdas', NULL, NULL, '46e7e5', 1, 's-s-b-36', 0, 2, 3, 1, 0, '2021-01-29 19:44:28', '2021-02-07 11:10:18'),
(88, 53, 'uygar sarıoğlu', '90-543-258-21-14', 'u@u.com', NULL, NULL, 1, NULL, '2021-02-04', '12:00:00', '3', 'asdasd', NULL, NULL, '6416fb', 1, 's-s-i-9', 0, 1, 2, 1, 0, '2021-02-03 22:32:02', '2021-02-07 13:46:49'),
(89, 57, 'Nur Güleçoğlu', '90-543-258-21-14', 'ozkanozek74@icloud.com', NULL, NULL, 1, NULL, '2021-02-06', '11:50:00', '4', 'arka masalarda oturmak.', NULL, NULL, 'efd45c', 1, 's-s-i-7', 0, 2, 2, 1, 0, '2021-02-04 06:52:19', '2021-02-07 13:44:20'),
(90, 58, 'Erol Yıldız', '90-543-258-21-14', 'e@e.com', NULL, NULL, 1, NULL, '2021-02-07', '19:00:00', '3', 'sadasdasdasdasdasd', NULL, '[]', '1cf110', 1, 's-s-b-36', 0, 1, 3, 1, 0, '2021-02-05 16:17:50', '2021-02-07 14:48:44'),
(91, 59, 'uygar sarı', '90-543-258-21-14', 'u@u.com', NULL, NULL, 1, NULL, '2021-02-05', '11:30:00', '3', 'asdasd', NULL, '[{\"date\":\"05.02.2021\"},{\"title\":\"b-k-i-53\"}]', 'eba3d6', 1, 'b-k-i-53', 0, 1, 2, 1, 0, '2021-02-05 20:59:06', '2021-02-07 13:46:49'),
(92, 60, 'Şeyda Sarıoğlu', '90-543-258-21-14', 'seydaokdemir@gmail.com', NULL, NULL, 1, NULL, '2021-02-14', '20:00:00', '2', 'Masasında mum istiyor.', NULL, NULL, '97f4d7', 1, 'b-k-i-58', 0, 1, 0, 1, 0, '2021-02-06 08:30:52', '2021-02-07 13:46:49'),
(93, 50, 'uygar sarıoğlu', '90-543-258-21-14', 'uygarsarioglu@gmail.com', NULL, NULL, 1, NULL, '2021-02-06', '15:35:00', '2', 'çömdaçsödmç', NULL, NULL, '7e9bcb', 1, 's-s-i-6', 0, 1, 2, 1, 0, '2021-02-06 12:19:39', '2021-02-07 13:46:49');

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
  `related_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `tablename` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `description` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `logs`
--

INSERT INTO `logs` (`id`, `related_id`, `user_name`, `tablename`, `description`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:07:39', '2021-02-05 23:07:39'),
(2, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:07:39', '2021-02-05 23:07:39'),
(3, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:07:39', '2021-02-05 23:07:39'),
(4, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:07:58', '2021-02-05 23:07:58'),
(5, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":1,\"isSend\":0}', 'iptal', '2021-02-05 23:12:17', '2021-02-05 23:12:17'),
(6, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":1,\"isSend\":0}', 'iptal', '2021-02-05 23:12:58', '2021-02-05 23:12:58'),
(7, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":1,\"isSend\":0}', 'iptal', '2021-02-05 23:16:20', '2021-02-05 23:16:20'),
(8, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:16:55', '2021-02-05 23:16:55'),
(9, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:17:02', '2021-02-05 23:17:02'),
(10, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:18:31', '2021-02-05 23:18:31'),
(11, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:18:31', '2021-02-05 23:18:31'),
(12, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:18:31', '2021-02-05 23:18:31'),
(13, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:18:36', '2021-02-05 23:18:36'),
(14, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:18:36', '2021-02-05 23:18:36'),
(15, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:18:36', '2021-02-05 23:18:36'),
(16, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:27:05', '2021-02-05 23:27:05'),
(17, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:27:05', '2021-02-05 23:27:05'),
(18, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:27:05', '2021-02-05 23:27:05'),
(19, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:27:06', '2021-02-05 23:27:06'),
(20, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:27:06', '2021-02-05 23:27:06'),
(21, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:27:06', '2021-02-05 23:27:06'),
(22, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:29:15', '2021-02-05 23:29:15'),
(23, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:29:45', '2021-02-05 23:29:45'),
(24, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:33:00', '2021-02-05 23:33:00'),
(25, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:33:41', '2021-02-05 23:33:41'),
(26, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-05 23:35:16', '2021-02-05 23:35:16'),
(27, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"date\\\":\\\"05.02.2021\\\"},{\\\"time\\\":\\\"13:40:00\\\"},{\\\"title\\\":\\\"b-\\\\u00f6-i-2\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":2,\"time\":\"13:40\",\"date\":\"2021-02-05\",\"title\":\"b-\\u00f6-i-2\"}', 'update', '2021-02-05 23:37:43', '2021-02-05 23:37:43'),
(28, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"date\\\":\\\"06.02.2021\\\"},{\\\"time\\\":\\\"11:30:00\\\"},{\\\"title\\\":\\\"s-s-i-7\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":2,\"time\":\"11:30\",\"date\":\"2021-02-06\",\"title\":\"s-s-i-7\"}', 'update', '2021-02-05 23:38:29', '2021-02-05 23:38:29'),
(29, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"time\\\":\\\"11:35:00\\\"}]\",\"isGone\":2,\"notification_type\":\"1\",\"bildirim_notu\":null,\"time\":\"11:35\",\"date\":\"2021-02-06\"}', 'update', '2021-02-05 23:40:04', '2021-02-05 23:40:04'),
(30, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"time\\\":\\\"11:45:00\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":2,\"time\":\"11:45\",\"date\":\"2021-02-06\"}', 'update', '2021-02-05 23:49:30', '2021-02-05 23:49:30'),
(31, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":2,\"time\":\"11:45\",\"date\":\"2021-02-06\"}', 'update', '2021-02-05 23:51:51', '2021-02-05 23:51:51'),
(32, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":2,\"date\":\"2021-02-06\"}', 'update', '2021-02-05 23:54:13', '2021-02-05 23:54:13'),
(33, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"time\\\":\\\"23:00:00\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":2,\"time\":\"23:00\",\"date\":\"2021-02-06\"}', 'update', '2021-02-05 23:55:05', '2021-02-05 23:55:05'),
(34, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"time\\\":\\\"11:35:00\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":0,\"time\":\"11:35\",\"date\":\"2021-02-06\"}', 'update', '2021-02-05 23:55:49', '2021-02-05 23:55:49'),
(35, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:57:40', '2021-02-05 23:57:40'),
(36, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:57:40', '2021-02-05 23:57:40'),
(37, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-05 23:57:41', '2021-02-05 23:57:41'),
(38, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-05 23:57:41', '2021-02-05 23:57:41'),
(39, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:57:44', '2021-02-05 23:57:44'),
(40, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:57:45', '2021-02-05 23:57:45'),
(41, 59, 'uygar sarıoğlu', 'Table', '59', 'create', '2021-02-05 23:58:46', '2021-02-05 23:58:46'),
(42, NULL, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"uygar sar\\u0131\",\"phone\":\"90-543-258-21-14\",\"email\":\"u@u.com\",\"body\":\"3\",\"kisi_id\":59,\"title\":\"m-\\u00f6-i-21\",\"date\":\"2021-02-06\",\"text\":\"asdasd\",\"time\":\"11:30\",\"notification_type\":\"1\",\"code\":\"eba3d6\",\"isActive\":1,\"updated_at\":\"2021-02-05T20:59:06.000000Z\",\"created_at\":\"2021-02-05T20:59:06.000000Z\",\"id\":91}', 'create', '2021-02-05 23:59:06', '2021-02-05 23:59:06'),
(43, 91, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"uygar sar\\u0131\",\"phone\":\"90-543-258-21-14\",\"email\":\"u@u.com\",\"isSend\":0,\"text\":\"asdasd\",\"body\":\"3\",\"degisenler\":\"[{\\\"date\\\":\\\"05.02.2021\\\"},{\\\"title\\\":\\\"b-k-i-53\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":0,\"date\":\"2021-02-05\",\"title\":\"b-k-i-53\"}', 'update', '2021-02-05 23:59:23', '2021-02-05 23:59:23'),
(44, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:35', '2021-02-05 23:59:35'),
(45, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:35', '2021-02-05 23:59:35'),
(46, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:35', '2021-02-05 23:59:35'),
(47, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:47', '2021-02-05 23:59:47'),
(48, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:47', '2021-02-05 23:59:47'),
(49, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:47', '2021-02-05 23:59:47'),
(50, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:49', '2021-02-05 23:59:49'),
(51, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:49', '2021-02-05 23:59:49'),
(52, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:49', '2021-02-05 23:59:49'),
(53, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:50', '2021-02-05 23:59:50'),
(54, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:50', '2021-02-05 23:59:50'),
(55, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:50', '2021-02-05 23:59:50'),
(56, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:51', '2021-02-05 23:59:51'),
(57, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:51', '2021-02-05 23:59:51'),
(58, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-05 23:59:51', '2021-02-05 23:59:51'),
(59, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:00:48', '2021-02-06 00:00:48'),
(60, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:00:48', '2021-02-06 00:00:48'),
(61, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:00:49', '2021-02-06 00:00:49'),
(62, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:00:49', '2021-02-06 00:00:49'),
(63, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"time\\\":\\\"11:50:00\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":0,\"time\":\"11:50\",\"date\":\"2021-02-06\"}', 'update', '2021-02-06 00:00:58', '2021-02-06 00:00:58'),
(64, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:07', '2021-02-06 00:01:07'),
(65, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:07', '2021-02-06 00:01:07'),
(66, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:01:16', '2021-02-06 00:01:16'),
(67, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:01:16', '2021-02-06 00:01:16'),
(68, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:19', '2021-02-06 00:01:19'),
(69, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:19', '2021-02-06 00:01:19'),
(70, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:01:23', '2021-02-06 00:01:23'),
(71, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:01:23', '2021-02-06 00:01:23'),
(72, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:24', '2021-02-06 00:01:24'),
(73, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:24', '2021-02-06 00:01:24'),
(74, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:01:27', '2021-02-06 00:01:27'),
(75, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:01:27', '2021-02-06 00:01:27'),
(76, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:28', '2021-02-06 00:01:28'),
(77, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:01:28', '2021-02-06 00:01:28'),
(78, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:06', '2021-02-06 00:10:06'),
(79, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:06', '2021-02-06 00:10:06'),
(80, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:07', '2021-02-06 00:10:07'),
(81, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:07', '2021-02-06 00:10:07'),
(82, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:10', '2021-02-06 00:10:10'),
(83, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:10', '2021-02-06 00:10:10'),
(84, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:10', '2021-02-06 00:10:10'),
(85, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:10', '2021-02-06 00:10:10'),
(86, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:11', '2021-02-06 00:10:11'),
(87, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:11', '2021-02-06 00:10:11'),
(88, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:12', '2021-02-06 00:10:12'),
(89, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:12', '2021-02-06 00:10:12'),
(90, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:19', '2021-02-06 00:10:19'),
(91, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:19', '2021-02-06 00:10:19'),
(92, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:19', '2021-02-06 00:10:19'),
(93, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:19', '2021-02-06 00:10:19'),
(94, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:24', '2021-02-06 00:10:24'),
(95, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:24', '2021-02-06 00:10:24'),
(96, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:24', '2021-02-06 00:10:24'),
(97, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:10:24', '2021-02-06 00:10:24'),
(98, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:25', '2021-02-06 00:10:25'),
(99, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:25', '2021-02-06 00:10:25'),
(100, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:25', '2021-02-06 00:10:25'),
(101, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:10:25', '2021-02-06 00:10:25'),
(102, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:11:28', '2021-02-06 00:11:28'),
(103, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:11:28', '2021-02-06 00:11:28'),
(104, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:11:28', '2021-02-06 00:11:28'),
(105, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:11:28', '2021-02-06 00:11:28'),
(106, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:14:00', '2021-02-06 00:14:00'),
(107, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:14:00', '2021-02-06 00:14:00'),
(108, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:14:00', '2021-02-06 00:14:00'),
(109, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:14:00', '2021-02-06 00:14:00'),
(110, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:14:01', '2021-02-06 00:14:01'),
(111, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:14:01', '2021-02-06 00:14:01'),
(112, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:14:01', '2021-02-06 00:14:01'),
(113, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-06 00:14:01', '2021-02-06 00:14:01'),
(114, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:00', '2021-02-06 00:15:00'),
(115, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:00', '2021-02-06 00:15:00'),
(116, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:00', '2021-02-06 00:15:00'),
(117, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:00', '2021-02-06 00:15:00'),
(118, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:04', '2021-02-06 00:15:04'),
(119, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:04', '2021-02-06 00:15:04'),
(120, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:04', '2021-02-06 00:15:04'),
(121, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:04', '2021-02-06 00:15:04'),
(122, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:05', '2021-02-06 00:15:05'),
(123, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:05', '2021-02-06 00:15:05'),
(124, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:05', '2021-02-06 00:15:05'),
(125, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 00:15:05', '2021-02-06 00:15:05'),
(126, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":1,\"isSend\":0}', 'iptal', '2021-02-06 00:16:22', '2021-02-06 00:16:22'),
(127, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:00', '2021-02-06 11:22:00'),
(128, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:00', '2021-02-06 11:22:00'),
(129, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:00', '2021-02-06 11:22:00'),
(130, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:00', '2021-02-06 11:22:00'),
(131, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:11', '2021-02-06 11:22:11'),
(132, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:11', '2021-02-06 11:22:11'),
(133, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:11', '2021-02-06 11:22:11'),
(134, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:11', '2021-02-06 11:22:11'),
(135, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:16', '2021-02-06 11:22:16'),
(136, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:16', '2021-02-06 11:22:16'),
(137, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:16', '2021-02-06 11:22:16'),
(138, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:17', '2021-02-06 11:22:17'),
(139, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:18', '2021-02-06 11:22:18'),
(140, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:18', '2021-02-06 11:22:18'),
(141, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:19', '2021-02-06 11:22:19'),
(142, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:22:19', '2021-02-06 11:22:19'),
(143, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"time\\\":\\\"11:40:00\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":0,\"time\":\"11:40\",\"date\":\"2021-02-06\"}', 'update', '2021-02-06 11:24:34', '2021-02-06 11:24:34'),
(144, 90, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Erol Y\\u0131ld\\u0131z\",\"phone\":\"90-543-258-21-14\",\"email\":\"e@e.com\",\"isSend\":0,\"text\":\"sadasdasdasdasdasd\",\"body\":\"3\",\"degisenler\":\"[{\\\"time\\\":\\\"12:00:00\\\"},{\\\"title\\\":\\\"s-s-b-36\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":0,\"time\":\"12:00\",\"date\":\"2021-02-06\",\"title\":\"s-s-b-36\"}', 'update', '2021-02-06 11:27:28', '2021-02-06 11:27:28'),
(145, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'iptal', '2021-02-06 11:27:37', '2021-02-06 11:27:37'),
(146, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:28:05', '2021-02-06 11:28:05'),
(147, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:28:05', '2021-02-06 11:28:05'),
(148, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:28:05', '2021-02-06 11:28:05'),
(149, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:28:05', '2021-02-06 11:28:05'),
(150, 60, 'uygar sarıoğlu', 'Table', '60', 'create', '2021-02-06 11:29:15', '2021-02-06 11:29:15'),
(151, 60, 'uygar sarıoğlu', 'Table', '{\"ad\":\"\\u015eeyda\",\"soyad\":\"Sar\\u0131o\\u011flu\",\"email\":\"seydaokdemir@gmail.com\",\"tel\":\"90-543-258-21-14\",\"notu\":\"sessiz ve sakin yer ister.\",\"iptal\":null,\"image\":null,\"karaliste\":false,\"cinsiyet\":true,\"misafir_id\":false}', 'update', '2021-02-06 11:29:25', '2021-02-06 11:29:25'),
(152, NULL, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"\\u015eeyda Sar\\u0131o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"seydaokdemir@gmail.com\",\"body\":\"2\",\"kisi_id\":60,\"title\":\"b-k-i-58\",\"date\":\"2021-02-14\",\"text\":\"Masas\\u0131nda mum istiyor.\",\"time\":\"20:0\",\"notification_type\":\"1\",\"code\":\"97f4d7\",\"isActive\":1,\"updated_at\":\"2021-02-06T08:30:52.000000Z\",\"created_at\":\"2021-02-06T08:30:52.000000Z\",\"id\":92}', 'create', '2021-02-06 11:30:52', '2021-02-06 11:30:52'),
(153, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:26', '2021-02-06 11:32:26'),
(154, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:26', '2021-02-06 11:32:26'),
(155, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:26', '2021-02-06 11:32:26'),
(156, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:26', '2021-02-06 11:32:26'),
(157, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:29', '2021-02-06 11:32:29'),
(158, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:30', '2021-02-06 11:32:30'),
(159, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:30', '2021-02-06 11:32:30'),
(160, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:32:30', '2021-02-06 11:32:30'),
(161, 89, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Nur G\\u00fcle\\u00e7o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"ozkanozek74@icloud.com\",\"isSend\":0,\"text\":\"arka masalarda oturmak.\",\"body\":\"4\",\"degisenler\":\"[{\\\"time\\\":\\\"11:50:00\\\"}]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":0,\"time\":\"11:50\",\"date\":\"2021-02-06\"}', 'update', '2021-02-06 11:47:31', '2021-02-06 11:47:31'),
(162, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:09', '2021-02-06 11:48:09'),
(163, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:09', '2021-02-06 11:48:09'),
(164, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:09', '2021-02-06 11:48:09'),
(165, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:09', '2021-02-06 11:48:09'),
(166, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:20', '2021-02-06 11:48:20'),
(167, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:20', '2021-02-06 11:48:20'),
(168, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:20', '2021-02-06 11:48:20'),
(169, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 11:48:20', '2021-02-06 11:48:20'),
(170, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:18', '2021-02-06 12:54:18'),
(171, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:18', '2021-02-06 12:54:18'),
(172, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:18', '2021-02-06 12:54:18'),
(173, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:18', '2021-02-06 12:54:18'),
(174, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:21', '2021-02-06 12:54:21'),
(175, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:21', '2021-02-06 12:54:21'),
(176, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:21', '2021-02-06 12:54:21'),
(177, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 12:54:21', '2021-02-06 12:54:21'),
(178, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:07', '2021-02-06 13:12:07'),
(179, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:07', '2021-02-06 13:12:07'),
(180, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:07', '2021-02-06 13:12:07'),
(181, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:07', '2021-02-06 13:12:07'),
(182, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:12', '2021-02-06 13:12:12'),
(183, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:12', '2021-02-06 13:12:12'),
(184, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:13', '2021-02-06 13:12:13'),
(185, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-06 13:12:13', '2021-02-06 13:12:13'),
(186, NULL, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"uygar sar\\u0131o\\u011flu\",\"phone\":\"90-543-258-21-14\",\"email\":\"uygarsarioglu@gmail.com\",\"body\":\"2\",\"kisi_id\":50,\"title\":\"s-s-i-6\",\"date\":\"2021-02-06\",\"text\":\"\\u00e7\\u00f6mda\\u00e7s\\u00f6dm\\u00e7\",\"time\":\"15:35\",\"notification_type\":\"1\",\"code\":\"7e9bcb\",\"isActive\":1,\"updated_at\":\"2021-02-06T12:19:39.000000Z\",\"created_at\":\"2021-02-06T12:19:39.000000Z\",\"id\":93}', 'create', '2021-02-06 15:19:39', '2021-02-06 15:19:39'),
(187, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:14', '2021-02-07 12:24:14'),
(188, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:14', '2021-02-07 12:24:14'),
(189, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:17', '2021-02-07 12:24:17'),
(190, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:17', '2021-02-07 12:24:17'),
(191, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:18', '2021-02-07 12:24:18'),
(192, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:19', '2021-02-07 12:24:19'),
(193, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:20', '2021-02-07 12:24:20'),
(194, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-07 12:24:20', '2021-02-07 12:24:20'),
(195, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:41:22', '2021-02-07 12:41:22'),
(196, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:41:22', '2021-02-07 12:41:22'),
(197, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-07 12:41:27', '2021-02-07 12:41:27'),
(198, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":2,\"isSend\":0}', 'Geldi', '2021-02-07 12:41:27', '2021-02-07 12:41:27'),
(199, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:41:34', '2021-02-07 12:41:34'),
(200, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isGone\":1,\"isSend\":0}', 'Geldi', '2021-02-07 12:41:34', '2021-02-07 12:41:34'),
(201, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 13:59:57', '2021-02-07 13:59:57'),
(202, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 14:03:09', '2021-02-07 14:03:09'),
(203, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 14:05:07', '2021-02-07 14:05:07'),
(204, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 14:08:32', '2021-02-07 14:08:32'),
(205, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 14:09:05', '2021-02-07 14:09:05'),
(206, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 14:09:08', '2021-02-07 14:09:08'),
(207, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 14:09:41', '2021-02-07 14:09:41'),
(208, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 14:09:56', '2021-02-07 14:09:56'),
(209, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 14:10:05', '2021-02-07 14:10:05'),
(210, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 14:10:13', '2021-02-07 14:10:13'),
(211, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 14:10:19', '2021-02-07 14:10:19'),
(212, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 14:12:14', '2021-02-07 14:12:14'),
(213, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isActive\":2,\"isSend\":0}', 'gerial', '2021-02-07 16:44:20', '2021-02-07 16:44:20'),
(214, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 16:45:23', '2021-02-07 16:45:23'),
(215, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 16:45:41', '2021-02-07 16:45:41'),
(216, 90, 'uygar sarıoğlu', 'Appointment', '{\"fullName\":\"Erol Y\\u0131ld\\u0131z\",\"phone\":\"90-543-258-21-14\",\"email\":\"e@e.com\",\"isSend\":0,\"text\":\"sadasdasdasdasdasd\",\"body\":\"3\",\"degisenler\":\"[]\",\"notification_type\":\"1\",\"bildirim_notu\":null,\"isGone\":0,\"time\":\"18:00\",\"date\":\"2021-02-07\"}', 'update', '2021-02-07 16:46:04', '2021-02-07 16:46:04'),
(217, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 16:46:26', '2021-02-07 16:46:26'),
(218, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 16:46:39', '2021-02-07 16:46:39'),
(219, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 16:47:05', '2021-02-07 16:47:05'),
(220, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 16:47:09', '2021-02-07 16:47:09'),
(221, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:49:11', '2021-02-07 16:49:11'),
(222, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:52:19', '2021-02-07 16:52:19'),
(223, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:52:26', '2021-02-07 16:52:26'),
(224, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:52:31', '2021-02-07 16:52:31'),
(225, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:52:39', '2021-02-07 16:52:39'),
(226, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:52:41', '2021-02-07 16:52:41'),
(227, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:54:34', '2021-02-07 16:54:34'),
(228, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:54:42', '2021-02-07 16:54:42'),
(229, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:55:12', '2021-02-07 16:55:12'),
(230, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:55:28', '2021-02-07 16:55:28'),
(231, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":0,\"isGone\":2,\"isSend\":0}', 'Gelmedi', '2021-02-07 16:55:36', '2021-02-07 16:55:36'),
(232, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 16:56:21', '2021-02-07 16:56:21'),
(233, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 16:57:50', '2021-02-07 16:57:50'),
(234, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 16:58:36', '2021-02-07 16:58:36'),
(235, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 16:58:57', '2021-02-07 16:58:57'),
(236, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 16:58:59', '2021-02-07 16:58:59'),
(237, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:03:11', '2021-02-07 17:03:11'),
(238, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 17:03:50', '2021-02-07 17:03:50'),
(239, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:03:55', '2021-02-07 17:03:55'),
(240, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:04:48', '2021-02-07 17:04:48'),
(241, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:06:36', '2021-02-07 17:06:36'),
(242, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isCame\":1,\"isGone\":3,\"isSend\":0}', 'Geldi', '2021-02-07 17:07:37', '2021-02-07 17:07:37'),
(243, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:27:10', '2021-02-07 17:27:10'),
(244, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:32:29', '2021-02-07 17:32:29'),
(245, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:32:43', '2021-02-07 17:32:43'),
(246, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:33:15', '2021-02-07 17:33:15'),
(247, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:33:23', '2021-02-07 17:33:23'),
(248, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:35:46', '2021-02-07 17:35:46'),
(249, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:37:02', '2021-02-07 17:37:02'),
(250, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:42:48', '2021-02-07 17:42:48'),
(251, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:44:58', '2021-02-07 17:44:58'),
(252, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:45:29', '2021-02-07 17:45:29'),
(253, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:46:47', '2021-02-07 17:46:47'),
(254, NULL, 'uygar sarıoğlu', 'Appointment', '{\"isSend\":0}', '', '2021-02-07 17:48:44', '2021-02-07 17:48:44');

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
(24, 17, 'şarap ister', '2021-01-21', '2021-01-21'),
(25, 1, 'asdasdasd', '2021-01-23', '2021-01-23'),
(26, 1, 'yemeklerden hoşlanır', '2021-01-23', '2021-01-23'),
(27, 1, 'özkan abinin özel müşterisi', '2021-01-24', '2021-01-24'),
(28, 1, 'özkan abinin özel müşterisi', '2021-01-24', '2021-01-24'),
(29, 1, 'özkan abinin özel müşterisi', '2021-01-24', '2021-01-24'),
(30, 1, 'özkan abinin özel müşterisi', '2021-01-24', '2021-01-24'),
(31, 48, 'bol tuzlu sever', '2021-01-24', '2021-01-24'),
(32, 48, 'bol tuzlu sev er dsfsdfsdfsd', '2021-01-24', '2021-01-24'),
(33, 49, 'asdasdasdas', '2021-01-29', '2021-01-29'),
(34, 49, 'asdasdasdas', '2021-01-29', '2021-01-29'),
(35, 49, 'asdasdasdas', '2021-01-29', '2021-01-29'),
(36, 49, 'adasdasd', '2021-01-29', '2021-01-29');

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
(49, 'Özkan', 'Özek', 'ozkanozek74@i.com', '90-543-258-21-14', 'Sessiz masa sever', NULL, NULL, NULL, 0, 0, NULL, 0, '2021-01-26 18:29:25', '2021-01-29 20:34:07', NULL, NULL),
(50, 'uygar', 'sarıoğlu', 'uygarsarioglu@gmail.com', '90-543-258-21-14', 'asdasd', NULL, NULL, NULL, 0, 0, NULL, 0, '2021-02-03 22:25:47', '2021-02-03 22:34:19', NULL, NULL),
(51, 'uygar', 'sarıoğlu', 'u@u.com', '90-543-258-21-14', 'asdasd', 'fe0798d72883856e4ca973d0ec547560.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-03 22:27:48', '2021-02-03 22:27:48', NULL, NULL),
(52, 'uygar', 'sarıoğlu', 'u@u.com', '90-543-258-21-14', 'asdasd', 'e569ec12de745c21a8976a0eb97bd43f.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-03 22:28:02', '2021-02-03 22:28:02', NULL, NULL),
(53, 'uygar', 'sarıoğlu', 'u@u.com', '90-543-258-21-14', 'asdasd', 'b565789c73bdc15d5e0ee363daef9e9f.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-03 22:28:23', '2021-02-03 22:28:23', NULL, NULL),
(54, 'a', 'a', 'a@a.com', '90-543-258-21-14', 'sadasd', '873d6dd3d1446971b86a36d480674825.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-03 22:29:59', '2021-02-03 22:29:59', NULL, NULL),
(55, 'a', 'a', 'a@a.com', '90-543-258-21-14', 'sadasd', '8e2875b7e1b3f5ea0623a64b416892f9.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-03 22:30:45', '2021-02-03 22:30:45', NULL, NULL),
(56, 'a', 'a', 'a@a.com', '90-543-258-21-14', 'sadasd', '6bbc47245b37ab57ceab57dac01ab50b.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-03 22:31:26', '2021-02-03 22:31:26', NULL, NULL),
(57, 'Nur', 'Güleçoğlu', 'ozkanozek74@icloud.com', '90-543-258-21-14', 'Sessiz masa sever', '03b2a7f49ee5a81b4c5c7412c1ce379b.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-04 06:51:38', '2021-02-04 06:51:38', NULL, NULL),
(58, 'Erol', 'Yıldız', 'e@e.com', '90-543-258-21-14', 'dsaasdasdasd', '2e752bd5ee99c1edf427ed5a1b028f38.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-05 16:17:24', '2021-02-05 16:17:24', NULL, NULL),
(59, 'uygar', 'sarı', 'u@u.com', '90-543-258-21-14', 'askldjalskdjlaskdj', 'd19ee86793e00c041f5a1a4d35165e81.jpg', NULL, NULL, 0, 0, NULL, 0, '2021-02-05 20:58:46', '2021-02-05 20:58:46', NULL, NULL),
(60, 'Şeyda', 'Sarıoğlu', 'seydaokdemir@gmail.com', '90-543-258-21-14', 'sessiz ve sakin yer ister.', NULL, NULL, NULL, 0, 0, NULL, 1, '2021-02-06 08:29:14', '2021-02-06 08:29:25', NULL, NULL);

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
  ADD PRIMARY KEY (`app_id`);

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
  MODIFY `app_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Tablo için AUTO_INCREMENT değeri `appointment_notes`
--
ALTER TABLE `appointment_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Tablo için AUTO_INCREMENT değeri `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
