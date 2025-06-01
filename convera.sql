-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2025 at 02:26 AM
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
-- Database: `convera`
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Eaque', 'eaque', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(2, 'Quis', 'quis', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(3, 'Exercitationem', 'exercitationem', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(4, 'Non', 'non', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(5, 'Quia', 'quia', '2025-05-31 17:06:13', '2025-05-31 17:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text NOT NULL,
  `edited_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `parent_id`, `content`, `edited_at`, `created_at`, `updated_at`) VALUES
(1, 13, 8, NULL, 'Ut quidem et quos ut tenetur ut.', '2025-05-31 14:12:43', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(2, 18, 3, NULL, 'Et nostrum omnis natus non ducimus reiciendis iure.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(3, 3, 5, NULL, 'Doloribus animi officiis quis aspernatur labore.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(4, 6, 4, NULL, 'Qui nemo ullam ad voluptas veniam et.', '2025-05-30 06:16:22', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(5, 16, 3, NULL, 'Magni corporis sit amet.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(6, 19, 4, NULL, 'Id quaerat non perspiciatis dolorum libero totam sequi ut.', '2025-05-29 02:09:24', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(7, 3, 5, NULL, 'Temporibus iure aliquam dolorem dolores voluptatum.', '2025-05-31 15:59:23', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(8, 15, 5, NULL, 'Dolorum ipsum assumenda nostrum itaque quidem suscipit.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(9, 12, 9, NULL, 'Est et enim laudantium nam.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(10, 16, 8, NULL, 'Quo consequatur nulla unde nemo molestiae ut earum.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(11, 5, 4, NULL, 'Animi maiores voluptatem perspiciatis earum ut.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(12, 19, 6, NULL, 'Quo sapiente dolorum saepe quia recusandae.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(13, 3, 4, NULL, 'Qui facilis voluptate qui ipsa officia expedita numquam.', '2025-05-31 08:11:32', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(14, 14, 2, NULL, 'Id aut doloremque ipsam quis.', '2025-05-30 00:08:50', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(15, 9, 10, NULL, 'Nisi quo explicabo perferendis unde voluptate consequatur alias.', '2025-05-30 12:02:16', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(16, 20, 9, NULL, 'Libero facilis quibusdam sunt et quod fugit enim assumenda.', '2025-05-30 13:42:22', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(17, 16, 3, NULL, 'Vero totam non qui tenetur.', '2025-05-29 04:01:29', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(18, 17, 5, NULL, 'Qui rerum totam eligendi vel repudiandae.', '2025-05-31 16:59:12', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(19, 8, 5, NULL, 'Maiores molestias ea repellendus molestias dolor vel.', '2025-05-30 00:40:44', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(20, 7, 2, NULL, 'Omnis iste vel eligendi.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(21, 16, 6, NULL, 'Corrupti enim provident amet voluptatem.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(22, 19, 2, NULL, 'Porro natus cum ad ut.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(23, 12, 10, NULL, 'Optio aperiam excepturi deserunt rerum unde temporibus ad.', '2025-05-30 17:44:17', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(24, 16, 8, NULL, 'Ea sapiente dolores magni voluptates.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(25, 5, 3, NULL, 'Non laudantium doloribus nihil reprehenderit autem deserunt.', '2025-05-29 04:17:09', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(26, 8, 7, NULL, 'Occaecati autem debitis sed deserunt est est id.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(27, 15, 7, NULL, 'Totam ab cum atque et.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(28, 7, 2, NULL, 'Dolor eos pariatur accusamus qui.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(29, 13, 8, NULL, 'Dolor aut ut aut harum.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(30, 17, 8, NULL, 'Est praesentium necessitatibus necessitatibus voluptas corrupti mollitia id.', '2025-05-31 02:45:31', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(31, 8, 4, NULL, 'Adipisci atque incidunt sit quia pariatur.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(32, 17, 6, NULL, 'Tempora eligendi voluptate est est ut pariatur adipisci similique.', '2025-05-30 05:12:22', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(33, 5, 5, NULL, 'Sit in enim dolor.', '2025-05-31 15:51:37', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(34, 14, 5, NULL, 'Et laborum omnis pariatur quam.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(35, 16, 8, NULL, 'Assumenda sequi deserunt aliquam voluptate.', '2025-05-29 07:34:50', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(36, 8, 9, NULL, 'Quam est consequuntur maxime in sed porro.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(37, 13, 6, NULL, 'Corrupti reprehenderit laborum modi adipisci provident sed eveniet.', '2025-05-31 01:23:21', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(38, 20, 2, NULL, 'Quasi ut velit error distinctio accusantium quisquam.', '2025-05-31 07:11:23', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(39, 3, 2, NULL, 'Voluptas ipsam sequi consectetur totam eum non nesciunt quo.', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(40, 1, 1, NULL, 'Perspiciatis autem dolorem in voluptatibus.', '2025-05-30 21:12:51', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(41, 14, 9, NULL, 'Sed eos tenetur animi odio.', '2025-05-30 18:22:30', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(42, 1, 8, NULL, 'At et voluptatibus ipsam quia aut maxime quia.', NULL, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(43, 15, 6, NULL, 'Vel hic animi sit et.', '2025-05-28 19:58:48', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(44, 18, 3, NULL, 'Voluptas recusandae iusto vitae nostrum quas sed.', '2025-05-30 14:55:38', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(45, 14, 10, NULL, 'Et repellat dolorum adipisci id facere.', NULL, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(46, 15, 3, NULL, 'Et et possimus iure.', NULL, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(47, 18, 8, NULL, 'Sunt blanditiis eos suscipit porro.', '2025-05-31 16:26:17', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(48, 18, 5, NULL, 'Quas nam tenetur dolor culpa qui eligendi quo.', '2025-05-30 01:42:41', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(49, 12, 5, NULL, 'Est deserunt neque sed consequuntur rerum.', NULL, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(50, 1, 7, NULL, 'Quis sunt voluptas temporibus tempora dolorum officiis eos.', NULL, '2025-05-31 17:06:15', '2025-05-31 17:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `rules` text DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_trending` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `name`, `slug`, `description`, `rules`, `avatar`, `is_private`, `is_verified`, `is_trending`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ut illo', 'ut-illo', 'Ipsam exercitationem quae saepe totam sit. Ipsum harum odio praesentium ea. Nesciunt omnis voluptas ut id nulla aut libero. Voluptates hic sed quod voluptatem aut.', 'Facilis doloribus incidunt voluptas. Quia numquam eum dignissimos aut ut impedit. Dolore ea ipsa quia. Blanditiis quia architecto quis et.\n\nOdit nostrum ratione nihil et praesentium est. Dolorem quo rerum molestiae consectetur sunt veritatis. Quasi qui similique vero ea illo assumenda.', NULL, 1, 0, 0, 5, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(2, 'Corrupti et', 'corrupti-et', 'Quia earum soluta similique soluta dolores ea. Ea adipisci quae ratione soluta aperiam nam numquam voluptates. Provident excepturi quia et. Autem quia iusto consectetur autem error.', 'Repellat aut ab ab dolorem beatae animi. Consequatur et tempora fuga harum eius sit. Voluptatibus voluptas nesciunt quibusdam ex.\n\nHic nesciunt aut possimus labore. Quasi voluptatum sed quo iste.', NULL, 0, 0, 0, 2, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(3, 'Exercitationem perspiciatis', 'exercitationem-perspiciatis', 'Et et sit illo. Rerum quod quis et est et.', NULL, NULL, 1, 1, 1, 7, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(4, 'Sed nobis', 'sed-nobis', 'Sed et nesciunt doloremque voluptatem porro laboriosam dolores. Eius nemo perferendis quis nihil voluptatum laborum. Enim eos laboriosam ut.', 'Consequatur eligendi harum voluptas sint. Quo consequatur ipsum tenetur ipsum sit minima.\n\nAut omnis consequuntur consequatur ut. Dolores maxime provident nemo illum est. Ipsa excepturi aspernatur voluptates consequatur commodi quia commodi.', NULL, 1, 0, 0, 2, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(5, 'Amet dolor', 'amet-dolor', 'Beatae amet tempore molestias non nam numquam mollitia voluptatum. Sunt aut minus non voluptate. Illum eaque nihil odio.', NULL, NULL, 0, 0, 0, 9, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(6, 'Voluptas voluptatem', 'voluptas-voluptatem', 'Ut aliquam magnam tenetur magni. Atque aut reprehenderit facere nemo deleniti.', 'Et nisi cumque optio reiciendis qui. Aliquid dolor et et qui ut. Sint vel placeat fugit. Ut quia dolorem a quis eum sed.\n\nSit non cupiditate labore natus ut molestiae. Natus voluptatum totam id delectus eum animi quo. Exercitationem ut quia quam omnis harum exercitationem iste illo. Esse velit debitis et dicta at.', NULL, 1, 1, 0, 4, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(7, 'Saepe aut', 'saepe-aut', 'Aut accusamus libero consequuntur velit et ipsa eligendi. Veritatis illum doloremque eveniet. Saepe veritatis nihil qui quis quia.', 'Labore quia et id aspernatur aut. Quaerat maiores animi nemo numquam error repudiandae. Non labore vitae totam nam omnis est. Expedita blanditiis commodi ad ut laudantium aut cumque.\n\nAdipisci ut culpa odio necessitatibus porro vel eum. Qui ex beatae est quibusdam et inventore nulla. Ratione quos magnam et sed.', NULL, 1, 0, 0, 12, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(8, 'Occaecati itaque', 'occaecati-itaque', 'Vero harum cupiditate possimus autem nihil sed accusamus. Nulla a optio qui molestiae temporibus. Cumque consequuntur sint est autem numquam id.', NULL, NULL, 0, 0, 0, 6, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(9, 'Impedit alias', 'impedit-alias', 'Quia nam quos ab ipsum nemo et. Dolore autem dignissimos ipsum repudiandae et officia illo. Vero voluptatibus similique distinctio eos sit est. Assumenda nemo temporibus dolor debitis.', NULL, NULL, 0, 1, 0, 9, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(10, 'Culpa esse', 'culpa-esse', 'Sed perferendis ut sed nemo illum soluta expedita. Ipsam et natus aut nostrum ut ut nam. Sint eos commodi dolorum saepe molestiae autem. Esse optio ut molestias autem fugit et fuga.', NULL, NULL, 0, 1, 0, 2, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(11, 'Sunt officiis', 'sunt-officiis', 'Ut tenetur est sequi quo aut. Molestiae alias expedita tempore labore. Saepe accusamus autem vero natus commodi. Maxime corrupti qui ratione voluptates.', 'Et quia voluptatem suscipit nihil eius deserunt. Iure pariatur veniam quae placeat sunt laboriosam.\n\nOmnis fugiat alias harum veritatis praesentium magni aliquam. Quia enim consequatur aliquam recusandae dolores sed sit quas. Accusantium alias vero nobis deserunt quo. Animi velit expedita sed fugiat libero odio libero sint.', NULL, 0, 0, 0, 2, '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(12, 'Officiis repellendus', 'officiis-repellendus', 'Quod id hic in et voluptatem. Et qui odio iusto et iure quae. Rerum consequatur nihil voluptatibus eius sunt rerum sed.', NULL, NULL, 1, 0, 0, 14, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(13, 'Qui voluptas', 'qui-voluptas', 'Ullam sed quos blanditiis. Nostrum incidunt qui consectetur. Eligendi quia vitae possimus possimus libero inventore et. Omnis voluptas eligendi ratione eum.', NULL, NULL, 0, 0, 0, 1, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(14, 'Voluptatem sed', 'voluptatem-sed', 'Est et omnis ea. Nobis omnis aut id. Repellat sunt consequatur unde qui id voluptate.', NULL, NULL, 1, 0, 1, 10, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(15, 'Eaque quis', 'eaque-quis', 'Consequatur voluptatem harum magnam eius et ex accusantium. Laboriosam deleniti officia deserunt repudiandae autem.', NULL, NULL, 0, 0, 0, 2, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(16, 'Quia quaerat', 'quia-quaerat', 'Nulla similique recusandae et maiores. Et animi recusandae odit. Omnis dignissimos ea quaerat in fuga.', NULL, NULL, 0, 0, 0, 8, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(17, 'Fuga saepe', 'fuga-saepe', 'Ducimus quo et eos molestias iste consequatur quod. Quia pariatur temporibus a dicta. Magni doloribus occaecati nobis. Necessitatibus eum necessitatibus numquam reprehenderit unde.', NULL, NULL, 0, 0, 0, 2, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(18, 'Omnis debitis', 'omnis-debitis', 'Commodi cupiditate sapiente adipisci. Id aliquid culpa qui voluptate quisquam cumque facere. Enim expedita quisquam earum amet neque tempore illo.', 'Dolore nisi veritatis animi. Dolorem eveniet et exercitationem fugiat doloremque. Molestias a est veniam repellendus ratione.\n\nDolorum autem esse non eligendi. Corrupti eius magni fugiat dignissimos eum veritatis qui. Et cum reprehenderit eos impedit aut qui omnis. Qui quaerat qui impedit sunt. Et sint enim facere quo doloremque ullam aperiam.', NULL, 0, 1, 0, 15, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(19, 'Quo porro', 'quo-porro', 'Dolorum perferendis sunt et beatae perspiciatis. Laudantium modi accusamus quis sunt totam qui nam blanditiis. Repellat nostrum quam non officia. Voluptatem dolor tempora et distinctio est modi.', 'Totam maxime quisquam ut voluptatem omnis. Voluptas et hic accusamus est. Eum ut impedit exercitationem omnis voluptatibus veritatis. Omnis est ipsum non vitae voluptatem laudantium.\n\nPlaceat non doloribus dolorem quia natus quia vel consequatur. Quisquam asperiores voluptate debitis placeat illo. Quod vero quisquam voluptate saepe quam veniam consequatur veritatis. Iusto alias voluptas ex aperiam consequatur iusto.', NULL, 0, 0, 0, 13, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(20, 'Unde quo', 'unde-quo', 'Ut ratione odit amet aliquid. Tenetur earum recusandae quia. Vel quas ipsum optio eum sapiente blanditiis vel. Omnis sint rerum quo.', 'Sed quo accusantium eligendi maiores. Necessitatibus quis qui consequatur quisquam. Eligendi aut qui molestiae dolores. Harum quia aut aut est expedita laborum.\n\nNatus voluptatibus officiis illum enim enim. Quaerat repellat quis ut ipsum ratione corporis. Non tempore rerum magni cupiditate reprehenderit.', NULL, 1, 1, 1, 2, '2025-05-31 17:06:15', '2025-05-31 17:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `community_tags`
--

CREATE TABLE `community_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `community_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_tags`
--

INSERT INTO `community_tags` (`id`, `community_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 8, NULL, NULL),
(3, 2, 7, NULL, NULL),
(4, 2, 6, NULL, NULL),
(5, 3, 9, NULL, NULL),
(6, 3, 8, NULL, NULL),
(7, 4, 6, NULL, NULL),
(8, 5, 7, NULL, NULL),
(9, 6, 3, NULL, NULL),
(10, 7, 6, NULL, NULL),
(11, 7, 5, NULL, NULL),
(12, 7, 7, NULL, NULL),
(13, 8, 2, NULL, NULL),
(14, 8, 3, NULL, NULL),
(15, 8, 10, NULL, NULL),
(16, 9, 2, NULL, NULL),
(17, 9, 1, NULL, NULL),
(18, 10, 7, NULL, NULL),
(19, 11, 1, NULL, NULL),
(20, 11, 2, NULL, NULL),
(21, 11, 6, NULL, NULL),
(22, 12, 5, NULL, NULL),
(23, 13, 3, NULL, NULL),
(24, 13, 1, NULL, NULL),
(25, 14, 3, NULL, NULL),
(26, 14, 7, NULL, NULL),
(27, 15, 3, NULL, NULL),
(28, 15, 8, NULL, NULL),
(29, 16, 10, NULL, NULL),
(30, 16, 5, NULL, NULL),
(31, 16, 4, NULL, NULL),
(32, 17, 8, NULL, NULL),
(33, 17, 9, NULL, NULL),
(34, 18, 4, NULL, NULL),
(35, 18, 8, NULL, NULL),
(36, 19, 1, NULL, NULL),
(37, 20, 1, NULL, NULL),
(38, 20, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `community_users`
--

CREATE TABLE `community_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `community_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('member','mod','owner') NOT NULL DEFAULT 'member',
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `community_users`
--

INSERT INTO `community_users` (`id`, `community_id`, `user_id`, `role`, `joined_at`, `created_at`, `updated_at`) VALUES
(1, 16, 21, 'mod', '2024-06-18 03:21:20', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(2, 17, 22, 'owner', '2024-09-14 08:03:11', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(3, 18, 23, 'mod', '2025-04-27 15:37:33', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(4, 19, 24, 'mod', '2024-12-02 21:23:06', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(5, 20, 25, 'member', '2025-03-17 15:48:32', '2025-05-31 17:06:15', '2025-05-31 17:06:15');

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
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '0001_02_22_064000_create_users_table', 1),
(4, '2025_04_22_064656_create_tags_table', 1),
(5, '2025_04_22_064657_create_communities_table', 1),
(6, '2025_04_22_065000_create_categories_table', 1),
(7, '2025_04_22_065001_create_posts_table', 1),
(8, '2025_04_22_065002_create_comments_table', 1),
(9, '2025_04_22_065003_create_reactions_table', 1),
(10, '2025_04_22_065004_create_saved_posts_table', 1),
(11, '2025_04_22_181854_create_community_tags_table', 1),
(12, '2025_04_22_193659_create_community_users_table', 1),
(13, '2025_05_28_102305_create_user_follows_table', 1),
(14, '2025_05_28_160500_add_google_id_to_users_table', 1);

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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `community_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `edited_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `community_id`, `title`, `slug`, `content`, `image`, `link`, `category_id`, `edited_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 11, 6, 'Harum veritatis corrupti quia et.', 'harum-veritatis-corrupti-quia-et', 'Enim nulla recusandae non dignissimos magnam. At in vel enim sint accusantium labore. Aut fuga amet qui nobis optio.\n\nIllum est quo est et nostrum iure aut nam. Quae voluptas explicabo minima. Aut nesciunt optio modi consequuntur quibusdam.\n\nEligendi enim sapiente et et harum aperiam blanditiis. Fuga saepe ex animi impedit explicabo est ut voluptas. Similique sapiente molestias in maiores distinctio non et. Repellendus saepe totam sapiente neque quo harum magnam.', 'https://via.placeholder.com/640x480.png/00aaff?text=technics+occaecati', 'http://white.biz/illo-inventore-tempore-doloribus-modi-qui-voluptates-doloremque', 1, '2025-05-24 20:35:09', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(2, 12, 7, 'Mollitia et officiis totam enim molestiae.', 'mollitia-et-officiis-totam-enim-molestiae', 'Qui quis dolores aliquid non consequuntur eligendi reprehenderit sit. Itaque unde omnis et minus et. Quod excepturi eum a non. Numquam itaque minus sequi magni.\n\nQui molestiae sit nobis error. Voluptatem quas vel quasi et. Nisi sunt sit non aut.\n\nSed architecto illo sit. Saepe animi eum perspiciatis dolorem est. Non a aut expedita quo qui enim ad. Sequi maiores non ducimus nihil sint quia.', 'https://via.placeholder.com/640x480.png/00cc00?text=technics+incidunt', 'http://thompson.com/assumenda-incidunt-sed-aut-omnis-qui-dolor', 3, NULL, NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(3, 13, 8, 'Aut quibusdam dolores quod sed.', 'aut-quibusdam-dolores-quod-sed', 'Culpa assumenda velit dignissimos aperiam et. Voluptatibus accusamus nulla architecto sit. Nostrum eum consequatur consequatur magni. Debitis voluptatem commodi occaecati animi ut voluptatibus autem.\n\nQui sit nihil rerum dolorem provident ea. Delectus sapiente possimus explicabo sit in. Tempore ducimus sint quae et modi rerum.\n\nSaepe voluptatem excepturi cumque incidunt ea. Sunt sequi quia molestiae quidem enim ab. Repellat provident ut eos itaque. Aut velit sint maxime voluptatem laudantium ea est iusto. Odio laborum vel tenetur qui atque quidem repellendus cumque.', 'https://via.placeholder.com/640x480.png/005588?text=technics+omnis', 'http://langosh.org/', 2, NULL, NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(4, 14, 9, 'Et numquam aperiam voluptas.', 'et-numquam-aperiam-voluptas', 'Dolorum soluta temporibus repudiandae rem sit quia reprehenderit. Vel odio et et reiciendis qui enim. Omnis quos est dolores accusantium sed. Dolore eaque consectetur eligendi hic veniam ut alias.\n\nIusto soluta aut omnis aut laboriosam ad non. Non aut iste et. Ut possimus in neque recusandae ipsum. Ea voluptas sequi eveniet provident et.\n\nCum consequuntur et culpa aut itaque velit consequatur. Eum hic illo error perspiciatis id accusamus quia. Corporis eveniet voluptatem ut repudiandae ut pariatur saepe.', 'https://via.placeholder.com/640x480.png/00aabb?text=technics+omnis', 'http://www.kautzer.com/non-tempora-atque-ut-enim-modi-et-et', 5, '2025-05-30 23:30:59', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(5, 15, 10, 'Nemo sint animi accusantium fugit eos sed.', 'nemo-sint-animi-accusantium-fugit-eos-sed', 'Nesciunt voluptas ipsum saepe aliquid quasi doloribus. Minima culpa ut recusandae ipsa ea at. Et cumque deserunt sint molestiae ad. Impedit ducimus aspernatur corrupti.\n\nFacere deleniti qui ut aut modi autem voluptas. Qui dolor illo in. Qui iure autem quia aut.\n\nQuis eaque inventore nihil debitis qui culpa omnis voluptas. Est explicabo perspiciatis aliquam architecto ex eum. Quia veritatis ratione quod ut animi. Ex eius occaecati recusandae qui excepturi illum est.', 'https://via.placeholder.com/640x480.png/0033dd?text=technics+vel', 'https://www.lindgren.com/et-officia-voluptatum-assumenda-molestias-tempora-accusantium-magni', 4, NULL, NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(6, 16, 11, 'Nesciunt commodi dolorem tempore quis ipsam.', 'nesciunt-commodi-dolorem-tempore-quis-ipsam', 'Ipsa pariatur iste non. Odit aut odio ipsum aperiam in aut. Voluptatibus corporis et sit quibusdam et aliquid.\n\nNihil omnis molestiae quis accusamus vero qui. Dolore sed eius sit quis harum qui et. Distinctio iusto rem quae molestiae voluptas est incidunt. Nostrum alias ea sit corporis.\n\nEt nihil nemo est molestiae. Eveniet molestiae sint rerum vitae. Non minus ex aperiam fugit nisi doloremque. Quod ratione minima animi voluptatum minima.', 'https://via.placeholder.com/640x480.png/008800?text=technics+blanditiis', 'http://smith.org/', 1, '2025-05-30 05:48:43', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(7, 17, 12, 'Omnis eveniet aut est incidunt sit exercitationem sit.', 'omnis-eveniet-aut-est-incidunt-sit-exercitationem-sit', 'Incidunt officiis illo qui mollitia et quo tempore. Tempora voluptas sequi sint ut. Autem nesciunt error officiis similique id. In distinctio quaerat illum est.\n\nEt maiores corporis voluptas in provident nobis distinctio. Qui quaerat velit officiis voluptas sunt blanditiis ea magnam. Nobis a et quod odit.\n\nMagnam iure earum et dolore dolores adipisci repudiandae. Dolore sed nisi dolorum enim commodi. Veritatis totam molestiae eum vitae error qui. Ut asperiores voluptatem porro facere. Velit delectus rem optio facere aliquam earum distinctio.', 'https://via.placeholder.com/640x480.png/004422?text=technics+voluptatem', 'http://stoltenberg.org/qui-voluptatum-illum-fugiat-et-eum-voluptates', 4, '2025-05-30 16:25:03', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(8, 18, 13, 'Voluptatem sit aut vero esse id laborum.', 'voluptatem-sit-aut-vero-esse-id-laborum', 'Occaecati voluptates et voluptas voluptatem optio quis reprehenderit. Rerum aliquam sint aut quaerat velit voluptatem qui.\n\nDoloremque explicabo occaecati accusantium aliquid consectetur exercitationem. Est deserunt quidem laudantium beatae ad saepe sapiente distinctio. Blanditiis sit voluptate modi explicabo delectus.\n\nFugiat corrupti voluptatem dolor. Et ea temporibus praesentium maiores in. Numquam ea ab enim dolorem.', 'https://via.placeholder.com/640x480.png/00eeff?text=technics+eaque', 'http://streich.com/ipsa-eos-eligendi-cum-occaecati-nobis.html', 3, '2025-05-27 19:23:52', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(9, 19, 14, 'Animi assumenda earum provident quis dicta.', 'animi-assumenda-earum-provident-quis-dicta', 'Animi rerum autem illum molestiae tenetur voluptas consectetur. Quasi dolor illo modi similique dolor id et. Aliquam dignissimos non molestiae dolorem voluptas consequuntur enim asperiores.\n\nQui porro officiis voluptatem itaque et excepturi quidem. Qui numquam velit facilis sint suscipit. Dolore ad iste dolor mollitia itaque.\n\nEum magnam aperiam ea hic qui doloremque perferendis aut. Qui cumque dolorem alias occaecati. Iste neque voluptatem quia nobis quisquam harum. Ut quis modi ut rerum dolores dignissimos earum.', 'https://via.placeholder.com/640x480.png/00ddee?text=technics+quae', 'http://crona.biz/numquam-suscipit-enim-qui-accusantium-voluptas-quis', 3, '2025-05-29 07:04:18', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(10, 20, 15, 'Beatae odit eum et quo repellat excepturi et.', 'beatae-odit-eum-et-quo-repellat-excepturi-et', 'Temporibus architecto adipisci ut aut vero unde impedit. Recusandae ut vel ea amet aliquid totam et. Saepe exercitationem qui laudantium quod. Sed voluptatem facilis quo molestiae voluptates et quo.\n\nQuasi ad sed consequatur voluptatibus omnis. Est cupiditate nulla dolores error. Distinctio esse dolor qui ex maxime. Quis dolorum ad impedit eos voluptas.\n\nAccusantium dolor dolor consequatur in. Assumenda ducimus eius quae quo et hic adipisci. Iure quos ad excepturi quas dignissimos.', 'https://via.placeholder.com/640x480.png/0044dd?text=technics+libero', 'http://zieme.com/ut-temporibus-sequi-qui-pariatur-nemo.html', 1, '2025-05-27 16:23:48', NULL, '2025-05-31 17:06:14', '2025-05-31 17:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 2, 8, NULL, NULL),
(4, 3, 2, NULL, NULL),
(5, 3, 10, NULL, NULL),
(6, 3, 8, NULL, NULL),
(7, 4, 1, NULL, NULL),
(8, 4, 3, NULL, NULL),
(9, 4, 10, NULL, NULL),
(10, 5, 8, NULL, NULL),
(11, 6, 8, NULL, NULL),
(12, 6, 10, NULL, NULL),
(13, 6, 1, NULL, NULL),
(14, 7, 7, NULL, NULL),
(15, 7, 1, NULL, NULL),
(16, 8, 3, NULL, NULL),
(17, 9, 9, NULL, NULL),
(18, 9, 4, NULL, NULL),
(19, 10, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('like','dislike') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`id`, `user_id`, `post_id`, `comment_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 12, 7, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(2, 17, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(3, 20, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(4, 10, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(5, 8, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(6, 15, 5, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(7, 10, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(8, 5, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(9, 7, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(10, 9, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(11, 10, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(12, 19, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(13, 16, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(14, 10, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(15, 20, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(16, 15, 7, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(17, 2, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(18, 12, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(19, 5, 9, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(20, 16, 5, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(21, 16, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(22, 17, 6, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(23, 2, 7, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(24, 4, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(25, 10, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(26, 4, 8, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(27, 17, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(28, 14, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(29, 3, 4, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(30, 11, 7, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(31, 15, 6, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(32, 6, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(33, 3, 8, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(34, 6, 9, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(35, 9, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(36, 20, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(37, 16, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(38, 20, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(39, 17, 3, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(40, 10, 3, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(41, 8, 2, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(42, 9, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(43, 10, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(44, 12, 6, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(45, 3, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(46, 6, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(47, 16, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(48, 13, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(49, 13, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(50, 5, 5, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(51, 20, 9, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(52, 12, 10, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(53, 19, 4, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(54, 20, 10, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(55, 14, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(56, 1, 6, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(57, 5, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(58, 7, 5, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(59, 16, 3, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(60, 11, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(61, 9, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(62, 13, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(63, 11, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(64, 15, 8, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(65, 19, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(66, 14, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(67, 10, 10, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(68, 7, 2, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(69, 16, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(70, 8, 8, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(71, 3, 6, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(72, 18, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(73, 6, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(74, 1, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(75, 1, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(76, 9, 6, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(77, 11, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(78, 13, 2, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(79, 9, 4, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(80, 2, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(81, 12, 2, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(82, 18, 5, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(83, 7, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(84, 18, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(85, 3, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(86, 19, 7, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(87, 15, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(88, 1, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(89, 14, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(90, 2, 2, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(91, 8, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(92, 19, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(93, 8, 9, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(94, 14, 8, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(95, 15, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(96, 8, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(97, 2, 8, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(98, 5, 2, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(99, 13, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(100, 12, 8, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(101, 2, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(102, 4, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(103, 3, 3, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(104, 17, 10, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(105, 1, 8, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(106, 19, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(107, 20, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(108, 17, 2, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(109, 6, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(110, 2, 4, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(111, 3, 7, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(112, 11, 2, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(113, 14, 2, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(114, 20, 5, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(115, 16, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(116, 7, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(117, 7, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(118, 16, 2, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(119, 5, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(120, 20, 2, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(121, 7, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(122, 13, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(123, 6, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(124, 2, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(125, 5, 6, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(126, 6, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(127, 11, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(128, 11, 10, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(129, 12, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(130, 12, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(131, 19, 3, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(132, 20, 3, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(133, 18, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(134, 17, 5, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(135, 9, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(136, 19, 1, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(137, 1, 5, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(138, 11, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(139, 9, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(140, 12, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(141, 14, 6, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(142, 6, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(143, 4, 9, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(144, 18, 10, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(145, 7, 9, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(146, 7, 7, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(147, 18, 1, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(148, 7, 4, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(149, 1, 3, NULL, 'dislike', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(150, 12, 9, NULL, 'like', '2025-05-31 17:06:15', '2025-05-31 17:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saved_posts`
--

INSERT INTO `saved_posts` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(2, 1, 6, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(3, 1, 5, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(4, 1, 1, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(5, 2, 9, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(6, 3, 3, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(7, 4, 10, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(8, 4, 8, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(9, 5, 10, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(10, 6, 4, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(11, 6, 9, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(12, 7, 5, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(13, 7, 3, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(14, 7, 8, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(15, 7, 6, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(16, 7, 10, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(17, 8, 10, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(18, 8, 2, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(19, 8, 6, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(20, 8, 1, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(21, 9, 1, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(22, 10, 5, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(23, 11, 5, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(24, 11, 7, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(25, 12, 4, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(26, 13, 5, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(27, 13, 1, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(28, 14, 7, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(29, 14, 10, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(30, 14, 2, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(31, 14, 6, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(32, 15, 2, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(33, 16, 1, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(34, 16, 6, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(35, 17, 7, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(36, 17, 3, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(37, 18, 10, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(38, 18, 3, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(39, 18, 7, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(40, 18, 8, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(41, 19, 3, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(42, 20, 8, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(43, 20, 9, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(44, 20, 1, '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(45, 20, 2, '2025-05-31 17:06:15', '2025-05-31 17:06:15');

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
('FpcMczzzb1PvwPqeJVKbwgBuZQxHJ3DB4V4OMmmh', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibmlZWUZhb21FbWttbElZaE5OY2xHRk1GUTZoRGUwTTBndllZakl3ViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wb3N0cy8xMC9jaGVjay1zYXZlZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI5O30=', 1748737572);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'ullam', 'ullam', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(2, 'est', 'est', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(3, 'sed', 'sed', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(4, 'deleniti', 'deleniti', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(5, 'tenetur', 'tenetur', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(6, 'corporis', 'corporis', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(7, 'fugit', 'fugit', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(8, 'illo', 'illo', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(9, 'mollitia', 'mollitia', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(10, 'provident', 'provident', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(11, 'adadada', 'adadada', '2025-05-31 17:06:52', '2025-05-31 17:06:52'),
(12, 'ssssssss', 'ssssssss', '2025-05-31 17:07:32', '2025-05-31 17:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `google_id`, `email_verified_at`, `password`, `avatar`, `bio`, `work`, `education`, `location`, `website`, `is_banned`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Elwin Lang', 'herdman@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Soluta doloremque beatae voluptate aspernatur sunt. Asperiores iste maxime voluptatum occaecati. Sunt provident ad et qui est iusto suscipit vero.', 'Material Moving Worker', 'repellat', 'Albertaport, Bulgaria', 'http://hettinger.com/pariatur-libero-recusandae-qui-omnis-temporibus-repellendus', 0, 'Vl3B6Hmm9S', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(2, 'Prof. Dennis Swift PhD', 'ylarson@example.net', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Impedit ut est rem omnis quis accusamus natus. Labore est qui ut maxime eligendi. Ut iste nisi autem aut consequatur.', 'Rail Car Repairer', 'recusandae', 'New Florian, Vanuatu', 'http://www.muller.com/temporibus-sapiente-natus-error-repellendus-et-vel-voluptas.html', 0, 'de2ok61KIN', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(3, 'Damion Hyatt', 'nora.stokes@example.net', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Sequi itaque asperiores ullam in quia. Omnis voluptas architecto doloremque aut. Natus saepe similique veritatis necessitatibus rerum molestias.', 'Funeral Director', 'eaque', 'West Noemie, Italy', 'http://www.prohaska.com/asperiores-suscipit-aut-ipsam-ut-vitae-tempore-dolorum-quae', 0, 'A0bBFoc39f', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(4, 'Shannon Vandervort II', 'tatum.rosenbaum@example.net', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Pariatur magni animi totam nam eius perferendis laboriosam. Rem et suscipit earum eos doloremque. Et et quam ut quam.', 'Immigration Inspector OR Customs Inspector', 'et', 'Stoneberg, China', 'https://www.white.com/quidem-nulla-sapiente-soluta-doloribus-soluta-dolores-ipsa', 0, 'MM1A9vN4cv', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(5, 'Vern Gulgowski', 'aiden82@example.net', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Dolore odio quos iusto labore culpa eum perspiciatis. Eos mollitia odit voluptate doloribus beatae enim.', 'Receptionist and Information Clerk', 'ea', 'South Freddyfurt, Mauritania', 'http://www.maggio.org/incidunt-a-provident-accusantium-minus-repellat-ut-optio-tempore', 0, 'zOaniVsKyh', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(6, 'Katrina McLaughlin MD', 'torphy.foster@example.net', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Excepturi ut quis quia aspernatur quisquam ut ipsa assumenda. Eos id dignissimos quo qui. Rerum quis reiciendis cumque.', 'Central Office and PBX Installers', 'voluptatem', 'Joanneview, Kiribati', 'http://kub.info/eveniet-nemo-corrupti-dolorum-ratione-distinctio', 0, 'pktK07JKmj', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(7, 'Mrs. Alanna Bechtelar', 'cjones@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Quasi molestias rerum repellendus et consequatur eaque fugit. Officia laborum at necessitatibus est quisquam provident dolor.', 'Secondary School Teacher', 'aperiam', 'Dollyton, Cameroon', 'http://www.sanford.org/', 0, 'mGJDcKUvsU', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(8, 'Prof. Johnathon Osinski', 'vesta60@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Minus voluptas nobis distinctio id et ipsum. Non non doloremque odio nulla. Nihil esse blanditiis voluptatem assumenda.', 'Parking Enforcement Worker', 'ad', 'Cierrafurt, French Polynesia', 'http://jast.com/dolorum-possimus-dolorem-rem.html', 0, 'rPRkFf4pH5', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(9, 'Jarvis Cremin', 'fvolkman@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'In dolorem laborum quos adipisci laborum illum non. Necessitatibus est perferendis fugit possimus illum ut. Porro tenetur ipsam eaque.', 'Procurement Clerk', 'est', 'West Meredith, Equatorial Guinea', 'http://greenfelder.com/ut-accusantium-est-eligendi-eos-autem-eaque-autem.html', 0, 'ZBMrcX0hFP', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(10, 'Suzanne Mueller', 'gfahey@example.net', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Facilis iste nemo voluptate debitis aut voluptas quaerat. Aspernatur qui similique quae reiciendis vel.', 'Soil Conservationist', 'voluptates', 'Lake Abnerville, Guatemala', 'http://www.gislason.com/', 0, '3bZNXTkTR9', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(11, 'Marcelle Spencer', 'iortiz@example.com', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Sed unde et id. Ratione unde quo quidem autem dolor consequatur sit. Ab enim sequi voluptatem at.', 'Counselor', 'fugiat', 'South Brendan, Barbados', 'http://www.barton.com/beatae-officia-est-illo-et-repudiandae-consequatur', 0, '8V7EIsawBa', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(12, 'Filiberto Rath III', 'xrogahn@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Officiis sed dolor veritatis dolorum dignissimos ea. Eum necessitatibus et exercitationem id cum excepturi ut. Fuga aut nostrum in et.', 'Computer Security Specialist', 'dolore', 'South Korbinville, Equatorial Guinea', 'http://kerluke.net/assumenda-sit-voluptates-beatae-mollitia-et', 0, 'GlPDmU4OEc', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(13, 'Jazlyn Franecki III', 'paul53@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Qui beatae dignissimos et ut ut minus. Debitis asperiores aut laborum quod vero aut. Quia animi magni quis ea ex.', 'Radiologic Technologist and Technician', 'voluptatem', 'East Erich, Mexico', 'http://www.raynor.biz/voluptatem-consectetur-quae-a-fugit-aut-corporis.html', 0, 'zmyq5JtlpX', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(14, 'Fernando Lehner', 'theron48@example.net', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Et dolorem vel excepturi sit omnis. Aperiam deleniti fuga in eveniet. Sit eligendi dolor vel ea. Dolorum aspernatur fugit fuga alias.', 'Copy Writer', 'fugit', 'Waelchimouth, Bouvet Island (Bouvetoya)', 'https://www.ondricka.com/ipsa-consequatur-quis-numquam-labore-incidunt', 0, 'SmOfrbL2f6', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(15, 'Johanna Morar', 'dicki.micheal@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Iure praesentium ut ut et ea odio minus. Hic expedita deserunt ab provident distinctio. Explicabo magnam quasi ut.', 'Floor Layer', 'necessitatibus', 'East Clevelandbury, Serbia', 'http://pfeffer.com/non-a-reiciendis-totam-velit-numquam-velit-quam-nisi.html', 0, '3Umbr3iXLb', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(16, 'Sarai Keebler', 'emanuel69@example.org', NULL, '2025-05-31 17:06:13', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Ad reprehenderit non quia laudantium et. Sed est exercitationem facilis voluptatibus. Qui incidunt consequatur nobis sed.', 'Veterinary Assistant OR Laboratory Animal Caretaker', 'cum', 'South Christophe, Saint Helena', 'http://baumbach.com/minus-et-eius-ab-quod-esse', 0, 'LpOxLG6dH8', '2025-05-31 17:06:13', '2025-05-31 17:06:13'),
(17, 'Raphael Oberbrunner', 'aric25@example.org', NULL, '2025-05-31 17:06:14', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Sit animi voluptatibus cum. Dolores placeat provident eligendi dignissimos sed. Voluptatem nam sint est aut dolorem id ipsum.', 'Fishery Worker', 'voluptatibus', 'New Ansleyton, Micronesia', 'http://kuvalis.net/eum-vel-natus-id-asperiores-ipsam', 0, 'I0J0ZOYxtc', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(18, 'Abagail DuBuque', 'xcollier@example.com', NULL, '2025-05-31 17:06:14', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Quo vel ut ipsam aut dolores repudiandae dignissimos est. Voluptatem adipisci aut et et. Quod rerum unde rerum sunt.', 'Gas Compressor Operator', 'nemo', 'Ralphstad, Saint Martin', 'http://www.hodkiewicz.com/sit-quia-quidem-voluptatem-qui', 0, 'rNP2cnB9rV', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(19, 'Alexandro Cassin', 'murl.bradtke@example.net', NULL, '2025-05-31 17:06:14', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Quaerat quia voluptatum dolorem et est quia eum. Natus aut ipsam unde officia. Eos ea quis illum quis aliquam soluta.', 'Personal Care Worker', 'sint', 'Friesenfurt, Eritrea', 'http://kulas.com/dicta-nihil-ea-voluptatum-magnam-nam-cumque-commodi-sed', 0, 'nbv7KBqblf', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(20, 'Gudrun Macejkovic', 'ipfannerstill@example.com', NULL, '2025-05-31 17:06:14', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Quis quis quisquam cum ut omnis nostrum quo. Tenetur sapiente officia unde nam. Aliquid officia ut voluptatem ratione.', 'Gaming Cage Worker', 'quasi', 'Blickburgh, Germany', 'http://www.pagac.com/qui-hic-animi-dolorem-rerum-suscipit-velit.html', 0, 'xD6MY9XKgX', '2025-05-31 17:06:14', '2025-05-31 17:06:14'),
(21, 'Verner Quitzon PhD', 'sylvan28@example.com', NULL, '2025-05-31 17:06:15', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Blanditiis et commodi eos autem assumenda dolorum. Excepturi autem est ut quo. Et eaque recusandae eos saepe ex ad. Sequi rerum unde maxime eius qui.', 'Transportation and Material-Moving', 'vel', 'New Kenyabury, Ireland', 'https://prosacco.com/sequi-ut-nemo-rerum-dolorem-a-molestiae.html', 0, 'CPjQtZuu5R', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(22, 'Ms. Sister Predovic', 'demond58@example.com', NULL, '2025-05-31 17:06:15', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Aliquam aut quidem fugiat non. Reprehenderit ab asperiores pariatur distinctio molestiae. Veniam occaecati dolore rerum autem adipisci fugit.', 'Locksmith', 'iste', 'Lamontland, Qatar', 'http://www.mueller.biz/molestiae-et-quis-quibusdam-consequatur-dolor-numquam', 0, 'PZGMpJLEot', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(23, 'Arthur Powlowski', 'crawford98@example.org', NULL, '2025-05-31 17:06:15', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Voluptatem at iure non facere. Qui vitae ea sint impedit labore doloremque vero. Reiciendis repellat autem et esse.', 'Child Care', 'molestias', 'New Reillyton, Latvia', 'http://www.emard.com/', 0, 'sMcLDc0GHN', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(24, 'Vena Hettinger', 'icole@example.net', NULL, '2025-05-31 17:06:15', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Dolore exercitationem tenetur consequatur ipsa. In totam iste aut laborum.', 'Budget Analyst', 'reiciendis', 'Caterinachester, Palau', 'http://www.upton.com/inventore-sint-voluptatum-debitis-recusandae-quia-consequuntur-sit', 0, 'CP2NpLehvJ', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(25, 'Ms. Blanche Gleichner DDS', 'qwisoky@example.org', NULL, '2025-05-31 17:06:15', '$2y$12$mbWlFtpuqdRc0VB71GZHNOBhxPOzuLBjCoFyrhf1o.d2pyJ4CbIXK', NULL, 'Laboriosam non dolorem omnis nihil. Commodi qui beatae consequatur eos aut. Et ad dicta enim.', 'Hairdresser OR Cosmetologist', 'esse', 'Hayleystad, Mauritania', 'http://www.kirlin.com/est-fugit-facilis-quia-harum-ipsa-quaerat-quo-rerum.html', 0, 'hAx9Hv6wuP', '2025-05-31 17:06:15', '2025-05-31 17:06:15'),
(29, 'Briant Jasper', 'briantjasper5@gmail.com', '113690737438105296436', NULL, '$2y$12$YLe4iRG7PqLXurxYo9SvXekTREF.mgac5k4fJs.5eTXa2rybP0Xe6', 'https://lh3.googleusercontent.com/a/ACg8ocKLYq4xdHaLZwFpevicxHHKHcz5kKx5NQqb1xu3XHVUY-5vuFQ=s96-c', NULL, NULL, NULL, NULL, NULL, 0, NULL, '2025-05-31 17:25:54', '2025-05-31 17:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_follows`
--

CREATE TABLE `user_follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `followed_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `communities_name_unique` (`name`),
  ADD UNIQUE KEY `communities_slug_unique` (`slug`),
  ADD KEY `communities_user_id_foreign` (`user_id`);

--
-- Indexes for table `community_tags`
--
ALTER TABLE `community_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `community_tags_community_id_tag_id_unique` (`community_id`,`tag_id`),
  ADD KEY `community_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `community_users`
--
ALTER TABLE `community_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `community_users_community_id_user_id_unique` (`community_id`,`user_id`),
  ADD KEY `community_users_user_id_foreign` (`user_id`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_community_id_foreign` (`community_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reactions_user_id_post_id_unique` (`user_id`,`post_id`),
  ADD UNIQUE KEY `reactions_user_id_comment_id_unique` (`user_id`,`comment_id`),
  ADD KEY `reactions_post_id_foreign` (`post_id`),
  ADD KEY `reactions_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `saved_posts_user_id_post_id_unique` (`user_id`,`post_id`),
  ADD KEY `saved_posts_post_id_foreign` (`post_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_follows_follower_id_followed_id_unique` (`follower_id`,`followed_id`),
  ADD KEY `user_follows_follower_id_index` (`follower_id`),
  ADD KEY `user_follows_followed_id_index` (`followed_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `community_tags`
--
ALTER TABLE `community_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `community_users`
--
ALTER TABLE `community_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_follows`
--
ALTER TABLE `user_follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `communities`
--
ALTER TABLE `communities`
  ADD CONSTRAINT `communities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_tags`
--
ALTER TABLE `community_tags`
  ADD CONSTRAINT `community_tags_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `community_users`
--
ALTER TABLE `community_users`
  ADD CONSTRAINT `community_users_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `community_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_community_id_foreign` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reactions_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD CONSTRAINT `saved_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_follows`
--
ALTER TABLE `user_follows`
  ADD CONSTRAINT `user_follows_followed_id_foreign` FOREIGN KEY (`followed_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_follows_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
