-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 03 2021 г., 19:38
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_02_062150_create_products_table', 1),
(5, '2021_05_02_072127_adds_api_token_to_users_table', 2),
(6, '2014_10_12_200000_add_two_factor_columns_to_users_table', 3),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(8, '2021_05_02_133614_create_sessions_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `amount`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Арбуз', '500', 1, 1, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(2, 'Ананас', '300', 4, 1, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(3, 'Орехи', '400', 5, 1, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(4, 'Нож', '2000', 6, 2, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(5, 'Чай', '1200', 2, 2, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(6, 'Дыня', '110', 3, 2, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(7, 'Книга', '5000', 5, 3, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(8, 'Тетрадь', '250', 7, 3, '2021-05-02 00:48:27', '2021-05-02 00:48:27'),
(9, 'Ручка', '230', 10, 4, '2021-05-02 00:48:28', '2021-05-02 00:48:28'),
(10, 'Ноутбук', '300000', 20, 5, '2021-05-02 00:48:28', '2021-05-02 00:48:28');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dkwHi7bxWJZeCYA1uQUgLrELAGFk1vpLcVSg0h1a', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWm1HTDg0RG9YSVB4RTRwZ0Y0djNMY3ZhWDZqZ3VUNTNaeldXSW1QRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1619963170);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`, `api_token`, `cart`) VALUES
(1, 'Administrator', 'admin@test.com', '2021-04-30 18:00:00', '$2y$10$u6J3CAeLmgFBQ9eex9.Fke4OivIPJXsnFN.CbRcXdm.2OAvhiE3kO', NULL, NULL, NULL, '2021-05-02 00:53:56', '2021-05-02 00:53:56', '9b7d48cd6b0a04a8027474838b788bfe241', ''),
(2, 'jsch', 'dushurbakiev@gmail.com', '2021-05-11 16:01:41', 'none', NULL, NULL, NULL, '2021-05-02 04:44:41', '2021-05-02 04:44:41', '9b7d48cd6b0a04a8027474838b788bfe24', ''),
(3, 'jplussch', 'dushurbakiev1@gmail.com', '2021-05-06 16:01:38', 'hazova', NULL, NULL, NULL, '2021-05-02 04:47:12', '2021-05-02 04:47:12', '9b7d48c23d6b0a04a8027474838b788bfe', ''),
(4, 'midsch', 'dushurbakiev2@gmail.com', '2021-05-01 16:01:32', 'aruzhan', NULL, NULL, NULL, '2021-05-02 04:48:28', '2021-05-02 04:48:28', '9b7d48cd6b0a04a8027474838b788bfe2312', ''),
(15, 'col', 'dushurbakiev3@gmail.com', '2021-05-12 16:01:47', 'turantxx', NULL, NULL, NULL, '2021-05-02 06:20:19', '2021-05-03 11:03:10', '9b7d48cd6b0a04a8027474838b788bfe', '{\"id\":2,\"name\":\"\\u0410\\u043d\\u0430\\u043d\\u0430\\u0441\",\"price\":\"300\",\"amount\":4,\"cat_id\":1,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"} {\"id\":2,\"name\":\"\\u0410\\u043d\\u0430\\u043d\\u0430\\u0441\",\"price\":\"300\",\"amount\":4,\"cat_id\":1,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"} {\"id\":2,\"name\":\"\\u0410\\u043d\\u0430\\u043d\\u0430\\u0441\",\"price\":\"300\",\"amount\":4,\"cat_id\":1,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"} {\"id\":8,\"name\":\"Santos Purdy\",\"price\":null,\"amount\":null,\"cat_id\":3,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"} {\"id\":10,\"name\":\"Isai Hyatt\",\"price\":null,\"amount\":null,\"cat_id\":5,\"created_at\":\"2021-05-02T06:48:28.000000Z\",\"updated_at\":\"2021-05-02T06:48:28.000000Z\"} {\"id\":2,\"name\":\"Ramon Price\",\"price\":null,\"amount\":null,\"cat_id\":1,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"} {\"id\":2,\"name\":\"Ramon Price\",\"price\":null,\"amount\":null,\"cat_id\":1,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"}      '),
(16, 'uni', 'dushurbakiev4@gmail.com', '2021-05-28 16:01:50', 'guilllotine_', NULL, NULL, NULL, '2021-05-03 12:58:00', '2021-05-03 11:06:30', 'f2975f23fd0ae3d4008862fb54dec6a9', '{\"id\":5,\"name\":\"\\u0427\\u0430\\u0439\",\"price\":\"1200\",\"amount\":2,\"cat_id\":2,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"} {\"id\":5,\"name\":\"\\u0427\\u0430\\u0439\",\"price\":\"1200\",\"amount\":2,\"cat_id\":2,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"} {\"id\":1,\"name\":\"\\u0410\\u0440\\u0431\\u0443\\u0437\",\"price\":\"500\",\"amount\":1,\"cat_id\":1,\"created_at\":\"2021-05-02T06:48:27.000000Z\",\"updated_at\":\"2021-05-02T06:48:27.000000Z\"}    '),
(19, 'now', 'dushurbakiev5@gmail.com', '2021-05-03 16:11:46', 'ahhahah1234', NULL, NULL, NULL, '2021-05-03 10:11:30', '2021-05-03 10:11:30', '9b7d48cd6b0a04a8027474838b788bfe1123134', NULL),
(20, NULL, 'dushurbakiev00@gmail.com', NULL, 'poka', NULL, NULL, NULL, '2021-05-03 11:08:16', '2021-05-03 11:08:16', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
