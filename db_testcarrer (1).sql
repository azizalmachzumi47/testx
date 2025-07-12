-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2025 at 01:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_testcarrer`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `datamhs`
--

CREATE TABLE `datamhs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nim` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_17_032912_create_table_users_role', 1),
(5, '2025_02_17_033358_create_table_users_menu', 1),
(6, '2025_02_17_033644_create_table_users_sub_menu', 1),
(7, '2025_02_17_034020_create_table_users_access_menu', 1),
(8, '2025_02_21_022410_create_personal_access_tokens_table', 2),
(9, '2025_04_11_085035_create_datamhs_table', 3),
(10, '2025_04_12_044223_create_personal_access_tokens_table', 4),
(11, '2025_07_12_095631_create_datamhs_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fmWQSgXCxRFSzBFwi59ZkCu2weWPE1JYF1D6kKaL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia3loa1hsYTBMRzNFUjVtS0R0YzhrUm1LM283Y29ySjdFRTl3ZGVIRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXRhX21ocyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1752314864);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT current_timestamp(),
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `image` varchar(255) NOT NULL DEFAULT 'default.png',
  `remember_token` varchar(512) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `image`, `remember_token`, `google_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '2025-02-20 01:17:20', '$2y$12$R96B.1mxU71LU2JIaAVExu7ATl3Vk0.9fEAPFsKEjcr7dF/9J9v7.', 1, 'default.png', NULL, '', '2025-02-20 01:17:20', '2025-02-20 01:39:28'),
(2, 'Users', 'users@gmail.com', '2025-02-20 01:17:20', '$2y$12$QLo8jAWz2ox25c06MuZVlel99f3ovKS/wWlLFJHPf.cFlB5HsFA3C', 2, 'default.png', 'jKRtKG5aBa2FnmGRWQNqZjbky99pfUNdNe8l633HKdNuYJDRjreoXPAmPvZs', '', '2025-02-20 01:17:20', '2025-02-20 21:22:53'),
(6, 'Test User', 'testuser@gmail.com', NULL, '$2y$12$uFL/RKlRO6eO7sXq8z/7ueLWrAyypMElsqXUuHp7f96UgZujmitf.', 2, 'default.png', NULL, '', '2025-02-20 21:10:00', '2025-02-20 21:10:00'),
(10, 'berkah kayu jaya', 'berkahkayujaya77@gmail.com', '2025-02-27 05:15:55', '$2y$12$wnyVivkegf7ZGU6IBl17S.FpaKd9IFDUJeCQEAEJnf.bP5aLfn5qu', 2, 'https://lh3.googleusercontent.com/a/ACg8ocIuqu3jZc8f7v2lIj6dUiiHwt_EEYzY-TAUhPTMAcen56-E1A=s96-c', NULL, '109133510949050460247', '2025-02-26 22:15:55', '2025-02-26 22:15:55'),
(11, 'Ars Home', 'arshome05@gmail.com', '2025-02-27 05:26:04', '$2y$12$H1MDa22gPjE6bxR82uoGduicthtHpn3aJ9eil5Llb1MUf8eLG/VkS', 2, 'https://lh3.googleusercontent.com/a/ACg8ocKcENgHbUvjwzVWErBX0iN3oQuFcWG5IwpLqUPvBRO0ORbhcg=s96-c', NULL, '104994611981399137062', '2025-02-26 22:26:04', '2025-03-03 22:10:55'),
(12, 'Himawari', 'himawari@pstechno.com', '2025-04-12 05:56:09', '$2y$12$QDd2xR0bFAs7ELtyHPFWiOgM/geHiF4.qHH6a4WdAqP/wxamKeHYm', 2, 'default.png', NULL, NULL, '2025-04-11 22:56:09', '2025-04-11 23:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `users_access_menu`
--

CREATE TABLE `users_access_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_access_menu`
--

INSERT INTO `users_access_menu` (`id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2025-02-20 08:22:00', NULL),
(2, 2, 1, '2025-02-20 08:22:00', NULL),
(3, 1, 3, '2025-02-20 08:22:35', NULL),
(4, 1, 1, '2025-02-20 08:22:35', NULL),
(8, 2, 3, NULL, NULL),
(9, 4, 1, NULL, NULL),
(10, 1, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_menu`
--

CREATE TABLE `users_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu` varchar(255) NOT NULL,
  `icon_menu` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_menu`
--

INSERT INTO `users_menu` (`id`, `menu`, `icon_menu`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'fa fa-fw fa-rocket', '2025-02-20 08:18:33', NULL),
(2, 'Admin', 'fa fa-fw fa-user-circle', '2025-02-20 08:18:33', NULL),
(3, 'Menu', 'fa fa-fw fa-book', '2025-02-20 08:19:37', NULL),
(4, 'Data_mhs', 'fa fa-fw fa-book', '2025-04-11 01:47:54', '2025-04-11 01:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2025-02-20 08:18:00', NULL),
(2, 'User', '2025-02-20 08:18:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_sub_menu`
--

CREATE TABLE `users_sub_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_sub_menu`
--

INSERT INTO `users_sub_menu` (`id`, `menu_id`, `title`, `url`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard', 'dashboard', 1, '2025-02-20 08:19:57', NULL),
(2, 2, 'Administartor', 'admin', 1, '2025-02-20 08:19:57', NULL),
(3, 2, 'Role', 'admin/role', 1, '2025-02-20 08:20:53', NULL),
(4, 3, 'Menu Management', 'menu', 1, '2025-02-20 08:20:53', NULL),
(5, 3, 'Submenu Management', 'menu/submenu', 1, '2025-02-20 08:21:34', NULL),
(6, 4, 'Data Mahasiswa', 'data_mhs', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `datamhs`
--
ALTER TABLE `datamhs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_access_menu`
--
ALTER TABLE `users_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_menu`
--
ALTER TABLE `users_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_sub_menu`
--
ALTER TABLE `users_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datamhs`
--
ALTER TABLE `datamhs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users_access_menu`
--
ALTER TABLE `users_access_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_menu`
--
ALTER TABLE `users_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_sub_menu`
--
ALTER TABLE `users_sub_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
