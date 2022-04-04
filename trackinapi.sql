-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2022 at 08:44 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trackinapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `attendance_date` date NOT NULL,
  `in_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `employee_id`, `attendance_date`, `in_time`, `out_time`, `created_at`, `updated_at`) VALUES
(4, 7, '2022-03-28', '11.30 A.m', '9.30p.m', '2022-03-28 08:58:34', '2022-03-28 11:43:49'),
(6, 9, '2022-03-28', '11.30 A.m', '9.50 ', '2022-03-28 13:39:32', '2022-03-28 13:39:32'),
(7, 19, '2022-03-29', '2020-07-19 07:39:45', '2020-07-19 07:49:45', '2022-03-28 18:06:25', '2022-03-29 14:51:14'),
(9, 11, '2022-03-29', '10.30 A.m', '8.30p.m', '2022-03-29 04:16:13', '2022-03-29 04:16:13'),
(10, 19, '2022-03-29', '2020-07-19 07:39:45 ', '2020-07-19 07:51:07', '2022-03-29 04:29:01', '2022-03-29 04:29:01'),
(11, 7, '2022-03-30', ' 10:30:45', ' 8:40:35', '2022-03-30 12:07:18', '2022-03-30 12:07:18'),
(12, 19, '2022-03-30', '2020-07-19 07:39:45', '2020-07-19 07:51:07', '2022-03-30 13:31:40', '2022-03-30 13:31:40'),
(13, 7, '2022-03-31', '2020-07-19 07:39:45', '2020-07-19 07:51:07', '2022-03-31 05:15:33', '2022-03-31 05:15:33'),
(14, 19, '2022-03-31', '2020-07-19 07:39:45', '2020-07-19 07:51:07', '2022-03-31 05:31:48', '2022-03-31 05:31:48');

-- --------------------------------------------------------

--
-- Table structure for table `captures`
--

CREATE TABLE `captures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `captures`
--

INSERT INTO `captures` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'test99', '2022-03-24 08:23:23', '2022-03-24 10:25:59'),
(3, 'test68', '2022-03-24 10:32:33', '2022-03-29 08:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department`, `created_at`, `updated_at`) VALUES
(1, 'Hospilaity', '2022-03-24 11:16:53', '2022-03-29 12:08:54'),
(2, 'food & beverage', '2022-03-24 11:43:31', '2022-03-24 12:04:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_20_193309_create_timesheets_table', 1),
(6, '2022_03_23_113601_create_permission_tables', 2),
(7, '2022_03_17_084207_create_teams_table', 3),
(8, '2022_03_23_161550_add_user_id', 4),
(9, '2022_03_21_085412_create_userteamtables_table', 5),
(10, '2022_03_16_114358_create_staff_table', 6),
(11, '2022_03_17_060202_create_captures_table', 6),
(12, '2022_03_16_085502_create_departments_table', 7),
(13, '2022_03_22_091704_create_attendances_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(5, 'App\\Models\\User', 18),
(6, 'App\\Models\\User', 19),
(7, 'App\\Models\\User', 21);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(10, 'products-list', 'web', '2022-03-28 17:16:42', '2022-03-28 17:16:42'),
(11, 'products-create', 'web', '2022-03-28 17:16:42', '2022-03-28 17:16:42'),
(12, 'products-edit', 'web', '2022-03-28 17:16:42', '2022-03-28 17:16:42'),
(13, 'products-delete', 'web', '2022-03-28 17:16:43', '2022-03-28 17:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '34d8539f79fd5028d5327212921c5a1366084504f754dd39eaf6d39da102b3b2', '[\"*\"]', NULL, '2022-03-21 14:29:23', '2022-03-21 14:29:23'),
(2, 'App\\Models\\User', 2, 'auth_token', '1e35b005e04ecad9320a6eb10305d33045facd64dcb8abc573902e555b6c950a', '[\"*\"]', NULL, '2022-03-21 14:44:44', '2022-03-21 14:44:44'),
(3, 'App\\Models\\User', 1, 'auth_token', 'ecd77dbcbf27a12e6b59211b41fba33ea7065f1c75602f2a4450304c1a0e63e1', '[\"*\"]', NULL, '2022-03-21 14:48:44', '2022-03-21 14:48:44'),
(4, 'App\\Models\\User', 1, 'auth_token', 'c43efee695f066c356ba9c3717f4930d515a08514a61b670f218249a8ae9a0b9', '[\"*\"]', '2022-03-29 13:42:35', '2022-03-21 14:51:32', '2022-03-29 13:42:35'),
(5, 'App\\Models\\User', 1, 'auth_token', 'f1a942932fccbde21944aa8ecac673a15f18a873a524ea9c0baca9483c747ee3', '[\"*\"]', NULL, '2022-03-22 07:08:50', '2022-03-22 07:08:50'),
(6, 'App\\Models\\User', 7, 'auth_token', '18aa1f1b4fc4e93e9a75dd25d7a24318839338e638e4364d9bcfbb842a400fd4', '[\"*\"]', '2022-03-29 15:17:00', '2022-03-23 09:07:04', '2022-03-29 15:17:00'),
(7, 'App\\Models\\User', 7, 'auth_token', '4501cfba19254f5b70bf29b8afffa1b03efa99bcad18b3d8b708a9f917fa7267', '[\"*\"]', '2022-03-29 13:16:20', '2022-03-25 06:42:47', '2022-03-29 13:16:20'),
(9, 'App\\Models\\User', 7, 'auth_token', 'd1d4109447ff11dc211ad2bc5e5e62c1bca924b03723efe24a0d71ab961e458a', '[\"*\"]', '2022-03-28 08:19:31', '2022-03-28 06:27:22', '2022-03-28 08:19:31'),
(10, 'App\\Models\\User', 8, 'auth_token', '0430ec9b3f81f77f00c0af1a9b2bc7b6fdf53cfd09e0c7680f512478112c20d8', '[\"*\"]', NULL, '2022-03-28 07:49:18', '2022-03-28 07:49:18'),
(11, 'App\\Models\\User', 8, 'auth_token', '3d82593a5aa65488f4e3a99902671d5727c86aacb8e11411cf7f9141a7fe7d5f', '[\"*\"]', '2022-03-28 08:02:39', '2022-03-28 07:57:13', '2022-03-28 08:02:39'),
(12, 'App\\Models\\User', 7, 'auth_token', '5ab6af5cfae51c88a423600aa18777a910e2a23cba7453073515141acfd60ab2', '[\"*\"]', '2022-03-28 08:12:08', '2022-03-28 08:09:29', '2022-03-28 08:12:08'),
(13, 'App\\Models\\User', 7, 'auth_token', 'bcf307c7c16bbd12d2e4d15786dbd0858c3a80202eaaaa332b926e3db695da65', '[\"*\"]', '2022-03-28 08:16:39', '2022-03-28 08:13:00', '2022-03-28 08:16:39'),
(14, 'App\\Models\\User', 11, 'auth_token', '8637287a8f83260d16531366f5f3f155818bbfbdaa26fb5808188deff2b756b5', '[\"*\"]', '2022-03-28 08:48:16', '2022-03-28 08:30:55', '2022-03-28 08:48:16'),
(15, 'App\\Models\\User', 9, 'auth_token', 'b2607a91a52218bba20e8e6a3f4d80c7cfb6c2a5549aa788854ab99d953f1452', '[\"*\"]', '2022-03-28 08:55:51', '2022-03-28 08:54:27', '2022-03-28 08:55:51'),
(16, 'App\\Models\\User', 11, 'auth_token', '4cb80f8daaed3f33736dcdc4b8590325ef6a90df3373529d3d51a3ed79cee784', '[\"*\"]', '2022-03-28 17:27:39', '2022-03-28 08:57:28', '2022-03-28 17:27:39'),
(17, 'App\\Models\\User', 7, 'auth_token', 'd7d1c4446b7d8a93101a728467a1b17cbd4b8abb24f5d6875b7a01387856d5ec', '[\"*\"]', '2022-03-28 10:07:40', '2022-03-28 10:00:04', '2022-03-28 10:07:40'),
(18, 'App\\Models\\User', 11, 'auth_token', '2f9fceaf701e5fe399164163ffc49a83ecd6866609fb18716b7761f6ef93fc9f', '[\"*\"]', '2022-03-28 11:23:14', '2022-03-28 10:10:09', '2022-03-28 11:23:14'),
(19, 'App\\Models\\User', 7, 'auth_token', 'de52886eee8463dda0532627638a49832f0716d4af47c17ae223391cd837d89f', '[\"*\"]', '2022-03-28 11:43:49', '2022-03-28 11:24:19', '2022-03-28 11:43:49'),
(20, 'App\\Models\\User', 11, 'auth_token', 'ae10d56a2571558549a95a22d9bba090a70e19b257c7712e420a1b51c8b6b979', '[\"*\"]', '2022-03-28 11:53:28', '2022-03-28 11:50:05', '2022-03-28 11:53:28'),
(21, 'App\\Models\\User', 7, 'auth_token', '142846c3b27ee7496d911442126a74d471fed33b89369592259ecc9f48c72b39', '[\"*\"]', '2022-03-28 12:41:32', '2022-03-28 12:39:16', '2022-03-28 12:41:32'),
(22, 'App\\Models\\User', 11, 'auth_token', '1875ef9019ad69c23e1ed6b08a3cae0e53e73996a964c1ef05e8a221b17971b9', '[\"*\"]', '2022-03-29 14:31:12', '2022-03-28 12:51:39', '2022-03-29 14:31:12'),
(23, 'App\\Models\\User', 7, 'auth_token', '21a43eac7f7c6644093b38680a9a591e4297cfcd05d6aacb9a87289adc6520d6', '[\"*\"]', '2022-03-28 16:34:53', '2022-03-28 13:53:04', '2022-03-28 16:34:53'),
(24, 'App\\Models\\User', 18, 'auth_token', '1d4309c9257caf180d657ef35577d1cbaef36a6c12db5a8a80d3b4d08b22692a', '[\"*\"]', '2022-03-28 17:28:20', '2022-03-28 17:24:17', '2022-03-28 17:28:20'),
(25, 'App\\Models\\User', 19, 'auth_token', '503bf689309a1b844eff437003dce4c94e386067aba9ac8255b61a798eedb9c4', '[\"*\"]', '2022-03-29 07:13:19', '2022-03-28 18:03:43', '2022-03-29 07:13:19'),
(26, 'App\\Models\\User', 21, 'auth_token', '5398aee55d9d759cf16c1122b6dd63fc8ec21ddc02fbfe9ef7fc82caa1609f7b', '[\"*\"]', '2022-03-29 05:18:06', '2022-03-29 04:14:34', '2022-03-29 05:18:06'),
(27, 'App\\Models\\User', 19, 'auth_token', '54ceb3deb966d21be56ad1382aac34ba1243f25fd488e85143915ae8990ff7d2', '[\"*\"]', '2022-03-29 05:21:16', '2022-03-29 04:27:20', '2022-03-29 05:21:16'),
(28, 'App\\Models\\User', 19, 'auth_token', '4a11c3b827b8abfa1fe3e21fe942a5365e011c0c75131c5df0d2f1410a0b3b62', '[\"*\"]', NULL, '2022-03-29 08:06:57', '2022-03-29 08:06:57'),
(29, 'App\\Models\\User', 19, 'auth_token', '5d26c607e320f0b86dc46837111732459225acd90e73217688662cce67b8b6bc', '[\"*\"]', NULL, '2022-03-29 08:07:21', '2022-03-29 08:07:21'),
(30, 'App\\Models\\User', 19, 'auth_token', '8162fe23c8c0fd20e46effcb811ed78a8289bbd422254640dfe6ad568fc74ff5', '[\"*\"]', NULL, '2022-03-29 08:09:45', '2022-03-29 08:09:45'),
(31, 'App\\Models\\User', 19, 'auth_token', 'cdac8a987ef4cc4f2a8ed623b2d19d6044bd123c754439d4e4a91c49301a38c4', '[\"*\"]', NULL, '2022-03-29 08:14:43', '2022-03-29 08:14:43'),
(32, 'App\\Models\\User', 19, 'auth_token', '132ceb45edc0a11e84878a5072fb4079c5a8fac6c52fa0b31fd347427b433bd4', '[\"*\"]', '2022-03-29 14:51:14', '2022-03-29 08:17:36', '2022-03-29 14:51:14'),
(33, 'App\\Models\\User', 22, 'auth_token', '154cd5cfe7130dd2cebdab101aa90244c0e99ec13994e8c6139f2ccf1ec6b786', '[\"*\"]', '2022-03-29 11:12:30', '2022-03-29 08:23:10', '2022-03-29 11:12:30'),
(35, 'App\\Models\\User', 21, 'auth_token', '10e867a2dd417868e038f47eebb699b3eab9242d320eb5048b50f121628f4b66', '[\"*\"]', '2022-03-30 11:02:28', '2022-03-30 05:26:11', '2022-03-30 11:02:28'),
(36, 'App\\Models\\User', 21, 'auth_token', '457e3c20eebdea3a6fefc8a3665e3812e32956d5ac287d84bb474525611b39b7', '[\"*\"]', '2022-03-30 13:04:14', '2022-03-30 11:43:17', '2022-03-30 13:04:14'),
(37, 'App\\Models\\User', 19, 'auth_token', '1af91d33eef25fa4e6dc5b191b2e67b5dd8eb31f73084a8cb1973fa8876ba57f', '[\"*\"]', '2022-03-30 13:40:15', '2022-03-30 13:06:25', '2022-03-30 13:40:15'),
(38, 'App\\Models\\User', 21, 'auth_token', '76b7ac1d926f5e81fc67685550b2e8a7359a3a93aeae39e488c2248fa5dc3a3f', '[\"*\"]', '2022-03-30 13:44:35', '2022-03-30 13:44:04', '2022-03-30 13:44:35'),
(39, 'App\\Models\\User', 21, 'auth_token', 'f304749c183c50d69da9912ff813c4d7e41024546dfce8e36a99f5524b56feea', '[\"*\"]', '2022-03-31 13:46:44', '2022-03-31 04:06:22', '2022-03-31 13:46:44'),
(40, 'App\\Models\\User', 19, 'auth_token', '1a23d99a88fdf74b661d1f10c4dfbe6f9314c1b40e9fddd88b84a1e082a43112', '[\"*\"]', '2022-03-31 05:33:29', '2022-03-31 05:30:25', '2022-03-31 05:33:29'),
(41, 'App\\Models\\User', 19, 'auth_token', '588f926f300f8cde1719e971808b2b8dbd9c73560b1985e2d7b335d8f84d1f4f', '[\"*\"]', '2022-03-31 12:51:54', '2022-03-31 12:50:48', '2022-03-31 12:51:54'),
(42, 'App\\Models\\User', 21, 'auth_token', '7d887827da3703f4c6495871a6029eb06ad72a2f19af895f3b52b6c0b59459f3', '[\"*\"]', '2022-03-31 16:04:19', '2022-03-31 13:59:45', '2022-03-31 16:04:19'),
(43, 'App\\Models\\User', 21, 'auth_token', '5d6cdbfad5c5779400e9fc7d0fee85ac7800077a869bef711583768056ff8adf', '[\"*\"]', '2022-04-02 09:15:20', '2022-03-31 16:05:59', '2022-04-02 09:15:20'),
(44, 'App\\Models\\User', 21, 'auth_token', 'f3679aba2d429416e606dbaebed20ca79f83991a5bc7b2759b23eb3babf3e872', '[\"*\"]', NULL, '2022-03-31 16:07:27', '2022-03-31 16:07:27'),
(45, 'App\\Models\\User', 21, 'auth_token', '1cc92f80a8ed3fc9e0b942d49a4d32b91edc1ea8d48420bac63cdb236a615d6d', '[\"*\"]', NULL, '2022-03-31 16:13:20', '2022-03-31 16:13:20'),
(46, 'App\\Models\\User', 21, 'auth_token', '25c96e3d1d72ab906ed5cf55defa9526d5cf65c6e3ef5df404ff67271d17226e', '[\"*\"]', NULL, '2022-03-31 16:25:56', '2022-03-31 16:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(5, 'editor', 'web', '2022-03-28 17:17:42', '2022-03-28 17:17:42'),
(6, 'user', 'web', '2022-03-28 17:57:05', '2022-03-28 17:57:05'),
(7, 'admin', 'web', '2022-03-28 18:00:52', '2022-03-28 18:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(10, 5),
(10, 6),
(10, 7),
(11, 5),
(11, 6),
(11, 7),
(12, 5),
(12, 6),
(12, 7),
(13, 5),
(13, 6),
(13, 7);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff`, `created_at`, `updated_at`) VALUES
(1, '20-50', '2022-03-24 13:32:08', '2022-03-29 11:37:32'),
(2, '90', '2022-03-25 07:13:47', '2022-03-25 07:13:47'),
(4, '20-50', '2022-03-25 07:14:39', '2022-03-25 07:44:38');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teamname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staffid` int(11) NOT NULL,
  `captchaid` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`captchaid`)),
  `deptid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `teamname`, `phoneno`, `staffid`, `captchaid`, `deptid`, `created_at`, `updated_at`, `created_by`) VALUES
(3, 'testd', '9433722030', 4, '\"[3,4]\"', 2, '2022-03-23 12:40:35', '2022-03-29 13:17:34', 19),
(11, 'test58795878', '8334927302', 4, '\"[2 ,3]\"', 2, '2022-03-29 12:58:56', '2022-03-29 12:58:56', 19);

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `start_ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0-Deleted, 1-Active',
  `deleted_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timesheets`
--

INSERT INTO `timesheets` (`id`, `user_id`, `start`, `end`, `start_ip_address`, `end_ip_address`, `start_user_agent`, `end_user_agent`, `status`, `deleted_user_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-03-23 13:42:55', '2022-03-23 13:50:34', '127.0.0.1', '127.0.0.1', 'PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', '1', NULL, '2022-03-23 08:12:55', '2022-03-23 08:20:34'),
(2, 7, '2022-03-23 14:41:16', '2022-03-23 15:32:32', '127.0.0.1', '127.0.0.1', 'PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', '1', NULL, '2022-03-23 09:11:16', '2022-03-23 10:02:32'),
(3, 21, '2022-03-29 20:47:46', '2022-03-29 20:51:21', '127.0.0.1', '127.0.0.1', 'PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', '1', NULL, '2022-03-29 15:17:46', '2022-03-29 15:21:21'),
(4, 21, '2022-03-30 16:31:02', '2022-03-30 16:31:22', '127.0.0.1', '127.0.0.1', 'PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', '1', NULL, '2022-03-30 11:01:02', '2022-03-30 11:01:22'),
(5, 21, '2022-03-31 20:27:51', '2022-03-31 20:28:02', '127.0.0.1', '127.0.0.1', 'PostmanRuntime/7.29.0', 'PostmanRuntime/7.29.0', '1', NULL, '2022-03-31 14:57:51', '2022-03-31 14:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'chiras', 'mail78@gmail.com', NULL, '$2y$10$S9cdmX4g/NlGTcw9BIsZ4OUMEc6jSZJWxO6qNfrEKTL5b3cZkN6WK', NULL, '2022-03-21 14:29:22', '2022-03-31 14:52:49'),
(2, 'chira', 'mail2chirashree@gmail.com', NULL, '$2y$10$wppYRRj094vEVT5/r9drAOwrnRn..MGMqjUeFLXd8ypUtHBBLGNuO', NULL, '2022-03-21 14:44:44', '2022-03-21 14:44:44'),
(3, 'Hardik Savani', 'admin@gmail.com', NULL, '$2y$10$mo9CvOj0xWVSLy9o30.dT.TNoo1k4JHYmVhTwDCDiVWzdCgWstxeG', NULL, '2022-03-23 06:31:25', '2022-03-23 06:31:25'),
(5, 'Hardik5 Savani', 'admin6@gmail.com', NULL, '$2y$10$8QIuOTyZryCTqmDzB9m5Qe247bjVLOmtmLl2b7Cs0HSDEZIWMdVNO', NULL, '2022-03-23 06:34:28', '2022-03-23 06:34:28'),
(7, 'Hardik57 Savani', 'admin67@gmail.com', NULL, '$2y$10$70ZygZrN8yqHOl3/Ax6tI.QtWTTyVoqaXIeQS1kyEUOdExn9Y4JB.', NULL, '2022-03-23 06:36:21', '2022-03-23 06:36:21'),
(8, 'chira', 'mail89@gmail.com', NULL, '$2y$10$p8YWdxjH03l4UE5qIfUAjuJpSsih83fvJwLzGWASmH9I2Cji3GzfS', NULL, '2022-03-28 07:49:18', '2022-03-28 07:49:18'),
(9, 'Hardik578 Savani', 'admin676@gmail.com', NULL, '$2y$10$pOaWfYA9OBW6IZfv5yeoouQIlDfgDaDGMpFSkURrcryxI2lcOZBHu', NULL, '2022-03-28 08:25:12', '2022-03-28 08:25:12'),
(11, 'Hardik5782 Savani', 'admin6765@gmail.com', NULL, '$2y$10$l0Fb159i0oJXIaHqck0RdOrYDQ5JSe4cjDgyPkVFGwosJ.SsgD5sK', NULL, '2022-03-28 08:26:21', '2022-03-28 08:26:21'),
(14, 'Hardik5782 Savani', 'admin676589@gmail.com', NULL, '$2y$10$dzDC3H6jnYENfUFAjBqBO.Rs52HlXMOFxucaLgVfqgNycmnRGCa0a', NULL, '2022-03-28 16:01:14', '2022-03-28 16:01:14'),
(15, 'Hardik5782 Savani', 'admin6765896@gmail.com', NULL, '$2y$10$WRtaNVIyUtYIFIq/A0Jqoe2S11QU/mAAc2f16HxqGjAEQF4XTD7Fy', NULL, '2022-03-28 16:02:04', '2022-03-28 16:02:04'),
(16, 'Hardik5782 Savani', 'admin67658967@gmail.com', NULL, '$2y$10$IU8stcXNXEHFwkRy746a5O/W4W/X.abDXXo5PPj2H65PtF61izdrO', NULL, '2022-03-28 16:03:10', '2022-03-28 16:03:10'),
(17, 'Hardik5782 Savani', 'admin676589674@gmail.com', NULL, '$2y$10$2nnZ73yixVPu2aD/cuSUaOqqlewKmz/l0zz3gvQuScX3g5TF9z2Sq', NULL, '2022-03-28 16:03:58', '2022-03-28 16:03:58'),
(18, 'Hardik5782 Savani', 'rita@gmail.com', NULL, '$2y$10$a6nwmi787y2p9CFn9SYLPe7NarYPltRZZtkyEqYK5VKyDaOsM1BSm', NULL, '2022-03-28 17:17:42', '2022-03-28 17:17:42'),
(19, 'Hardik57826 Savani', 'rita5@gmail.com', NULL, '$2y$10$1L2t4LNw6ZRaIkb4MaXX.e6oBBwRe2lxYI0lhndyDiiVTpdc05/n6', NULL, '2022-03-28 17:57:05', '2022-03-28 17:57:05'),
(21, 'chirashyyu', 'mail78@gmail.com', NULL, '$2y$10$d03mBSij/eU4eGouDXIZxelhBBkWdD/GAZFq2QhzqTkQEEywXH4uO', NULL, '2022-03-28 18:00:52', '2022-04-02 09:15:20'),
(22, 'chira', 'kk@gmail.com', NULL, '$2y$10$vm3KvBhkqOulVTMj091qL.5mDQjPODdNgLsUmm94Rx269q62OmsAy', NULL, '2022-03-29 08:23:10', '2022-03-29 08:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `userteams`
--

CREATE TABLE `userteams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userteams`
--

INSERT INTO `userteams` (`id`, `user_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 2, 3, '2022-03-23 14:17:41', '2022-03-25 13:39:39'),
(2, 7, 2, '2022-03-24 05:16:26', '2022-03-24 05:16:26'),
(5, 21, 11, '2022-03-29 13:47:12', '2022-03-29 13:47:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `captures`
--
ALTER TABLE `captures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timesheets_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userteams`
--
ALTER TABLE `userteams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `captures`
--
ALTER TABLE `captures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `userteams`
--
ALTER TABLE `userteams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD CONSTRAINT `timesheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
