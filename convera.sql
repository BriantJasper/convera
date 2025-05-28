-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 12:29 PM
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
(1, 'Tenetur', 'tenetur', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(2, 'Tempora', 'tempora', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(3, 'Totam', 'totam', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(4, 'Aut', 'aut', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(5, 'Quos', 'quos', '2025-05-28 03:28:54', '2025-05-28 03:28:54');

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
(1, 3, 2, NULL, 'Molestiae amet fugit qui quisquam eos.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(2, 19, 3, NULL, 'Labore dolorum aut perferendis aut.', '2025-05-25 13:43:16', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(3, 12, 3, NULL, 'Mollitia nostrum id sed similique iste commodi.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(4, 10, 7, NULL, 'Deserunt quod cupiditate libero qui quibusdam velit quibusdam amet.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(5, 18, 6, NULL, 'Hic sapiente ab est ratione sunt.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(6, 11, 2, NULL, 'Explicabo beatae doloremque vitae laborum et aut laudantium rerum.', '2025-05-25 07:31:01', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(7, 18, 9, NULL, 'Quis nobis quae repudiandae ipsum sed doloremque voluptatum est.', '2025-05-26 10:23:18', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(8, 7, 9, NULL, 'Quos placeat omnis vel consequuntur.', '2025-05-25 07:18:06', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(9, 20, 6, NULL, 'Reprehenderit cum tempora quia.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(10, 4, 6, NULL, 'Praesentium cupiditate qui inventore ex cum.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(11, 1, 5, NULL, 'Exercitationem hic voluptatem dolore eum distinctio adipisci odit.', '2025-05-25 18:33:36', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(12, 13, 5, NULL, 'Mollitia odio consequatur ea dolores et eligendi.', '2025-05-25 23:20:17', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(13, 10, 6, NULL, 'Porro quia quam cum.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(14, 20, 3, NULL, 'Qui perspiciatis dolore doloribus voluptatem sunt nobis dolor placeat.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(15, 12, 10, NULL, 'Autem odio rerum quam perspiciatis repudiandae laboriosam asperiores.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(16, 8, 1, NULL, 'Ex suscipit dolor temporibus quis laboriosam.', '2025-05-27 19:14:39', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(17, 11, 4, NULL, 'Laboriosam eum aliquid omnis sed velit id et.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(18, 13, 1, NULL, 'Ipsam dolor distinctio ullam doloremque optio quisquam consequatur voluptas.', '2025-05-26 19:27:24', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(19, 9, 7, NULL, 'Dolorem esse molestiae dolores sed occaecati ullam accusantium consectetur.', '2025-05-26 17:52:52', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(20, 2, 5, NULL, 'Qui et ipsam quia eos expedita.', '2025-05-26 01:53:08', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(21, 6, 5, NULL, 'Deserunt voluptatibus eius est distinctio unde sit.', '2025-05-25 07:14:46', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(22, 10, 6, NULL, 'Beatae quia officiis consequatur quae quas odit.', '2025-05-26 14:57:02', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(23, 2, 10, NULL, 'Facere ea et fugiat quisquam dolorem ut tempora.', '2025-05-25 09:55:56', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(24, 9, 1, NULL, 'Doloremque beatae quis maiores iusto illum.', '2025-05-26 16:21:07', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(25, 9, 2, NULL, 'Repellendus beatae animi est blanditiis molestiae reprehenderit.', '2025-05-25 13:52:05', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(26, 6, 5, NULL, 'Ipsam mollitia neque et consequatur maxime provident.', '2025-05-25 16:09:00', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(27, 14, 9, NULL, 'Dolores excepturi distinctio voluptatem ipsum voluptatem dolorem.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(28, 11, 4, NULL, 'Quas tenetur corporis modi.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(29, 7, 7, NULL, 'Voluptatem eaque non voluptatem.', '2025-05-25 09:18:30', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(30, 7, 8, NULL, 'Ex tenetur iure nam eligendi rerum repudiandae.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(31, 5, 10, NULL, 'Cum occaecati quaerat quasi reiciendis vel quia sint.', '2025-05-27 06:08:45', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(32, 11, 4, NULL, 'Et deserunt pariatur velit consequuntur qui debitis exercitationem at.', '2025-05-26 00:15:30', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(33, 3, 10, NULL, 'Quisquam itaque quas omnis itaque eos.', '2025-05-26 14:49:43', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(34, 9, 7, NULL, 'Deserunt corporis molestiae sint sed enim nisi minus consectetur.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(35, 16, 9, NULL, 'Aperiam illo corporis veniam dicta aspernatur.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(36, 1, 5, NULL, 'Nihil dolorem omnis voluptas omnis quasi.', '2025-05-25 23:47:47', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(37, 7, 7, NULL, 'Nobis rem qui accusamus et.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(38, 15, 5, NULL, 'Et quam debitis optio vero molestias ad quibusdam.', '2025-05-25 05:39:05', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(39, 12, 1, NULL, 'Eligendi repellat quaerat magnam voluptatem est.', '2025-05-26 18:25:53', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(40, 6, 7, NULL, 'Voluptatibus totam repellendus sequi est saepe.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(41, 15, 1, NULL, 'Ea velit minima nobis ea quia.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(42, 4, 6, NULL, 'Dolore debitis sint rerum provident molestiae hic quia.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(43, 8, 2, NULL, 'Et est sequi autem fuga iusto nihil rem.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(44, 9, 7, NULL, 'Reiciendis quos nam exercitationem non soluta voluptatem.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(45, 2, 3, NULL, 'Voluptates qui mollitia odit atque unde.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(46, 10, 5, NULL, 'Voluptas excepturi dolores ad harum provident ea similique voluptates.', '2025-05-25 13:06:43', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(47, 15, 6, NULL, 'Quisquam consequatur magni voluptatem labore enim.', '2025-05-27 09:47:41', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(48, 2, 4, NULL, 'Expedita sit unde ea sequi.', '2025-05-25 10:19:54', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(49, 1, 3, NULL, 'Et sapiente odio vel laudantium.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(50, 8, 3, NULL, 'Modi impedit vel sit voluptatibus quia sunt soluta iusto.', NULL, '2025-05-28 03:28:55', '2025-05-28 03:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `rules` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `name`, `slug`, `description`, `tags`, `rules`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Ut reprehenderit', 'ut-reprehenderit', 'Ex expedita ad consequatur et nostrum velit rerum aut. Quis corporis totam autem voluptas incidunt voluptatem. Sunt sint est expedita. Dolorem voluptas vel aperiam ut.', NULL, 'Sunt nesciunt ut quibusdam pariatur. Ea eius quia reiciendis sunt aliquam et. Est error velit repudiandae eligendi quisquam. Aliquam aliquid sed doloribus suscipit minima repellendus. Tenetur est vitae vel fuga in sunt.\n\nNulla incidunt et aliquid harum. Consequatur necessitatibus iusto iure libero omnis pariatur iusto. Veniam voluptatem consequatur necessitatibus nostrum et nostrum. At dignissimos est eaque pariatur.', 6, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(2, 'Temporibus dolorem', 'temporibus-dolorem', 'Aut ut perspiciatis placeat consequatur ea. Eum eos suscipit praesentium hic magni ut aut. Et qui et et qui.', NULL, 'Qui minus veniam cum asperiores maiores incidunt sunt quibusdam. Consequuntur dolores ea numquam omnis ut distinctio. Delectus aut dolor placeat.\n\nAd porro id quia rerum ducimus at occaecati. Possimus animi dolores itaque consectetur. Consequatur incidunt aut quia labore.', 10, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(3, 'Commodi non', 'commodi-non', 'Vero molestiae earum nobis recusandae amet. Porro quae provident qui est porro animi. Qui aut qui hic corporis accusamus explicabo sapiente.', NULL, NULL, 5, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(4, 'Ratione iste', 'ratione-iste', 'Rerum explicabo ut nesciunt ut facere. Dolorem cum pariatur aut modi. Debitis facilis et accusantium. Voluptatem et pariatur harum neque.', NULL, NULL, 7, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(5, 'Sunt et', 'sunt-et', 'Error sapiente nobis aliquam adipisci nam perferendis nesciunt debitis. Voluptas dolor voluptatum quia sed est.', NULL, 'Maxime vel eius ipsa omnis fuga. Impedit qui quos quae ex. Consequuntur laborum provident pariatur aut.\n\nQuisquam et qui quia ex doloremque eaque. Et ut accusantium delectus aut deleniti voluptas neque. Non repellendus sit at delectus.', 10, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(6, 'Accusantium atque', 'accusantium-atque', 'Non soluta consequatur vitae labore mollitia ea quidem eaque. Dicta commodi molestiae quidem cum delectus voluptatem. Dolor consequatur sed beatae iusto atque ipsum expedita quod.', NULL, 'Eius et dolores ut dolore. Sunt mollitia dolorem vitae optio ex explicabo harum. Omnis quasi molestiae rerum aut dolores eum id.\n\nNobis velit sequi omnis officiis est corporis. Sit incidunt sint id et magni temporibus animi. Libero eveniet odit assumenda vel mollitia quidem. A velit debitis voluptatem totam.', 6, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(7, 'Molestias natus', 'molestias-natus', 'Et numquam voluptatibus dolorem animi velit nulla. Maiores libero itaque accusamus. Harum ut sit sunt est aut. Sit ut modi officia libero. Odit ab ad in non.', NULL, 'Sed et impedit architecto molestiae reprehenderit blanditiis blanditiis. Officia repellat vel harum dignissimos et dolorem. Optio temporibus dolor quae ea. Veniam pariatur harum atque quo voluptatem.\n\nVoluptatem expedita possimus rem et neque officiis. Optio molestiae ut pariatur amet. Earum eius quis odio ad consectetur.', 6, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(8, 'Quis nisi', 'quis-nisi', 'Quis sit sed blanditiis dicta enim voluptatum laborum. Fuga minima quod accusantium quod pariatur qui id. Natus eos optio suscipit autem dolores. Non omnis nesciunt et debitis sunt qui.', NULL, 'Temporibus libero et non sint quisquam saepe omnis. Vel qui eaque qui quia. Vel saepe itaque quia voluptatem minus id eveniet. Repellendus pariatur voluptatem totam fugiat non ipsa.\n\nDistinctio odio necessitatibus at. Voluptatem et ut suscipit inventore. Repudiandae omnis dolorum impedit dolores temporibus tenetur ex pariatur.', 8, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(9, 'Quae placeat', 'quae-placeat', 'Impedit quae distinctio quia animi reiciendis. Rerum iste excepturi eius saepe sint. Quisquam totam explicabo id dicta enim. In exercitationem accusamus odit iusto velit molestias ut.', NULL, 'Eos vel quas fugit nisi aut aut. Perferendis aut consequuntur dolores quae. Velit enim est nihil iure.\n\nQui quis sint quia. Esse repellat reiciendis sit eos. Quod excepturi dolores libero aut facere tempora placeat. Qui reprehenderit non illum voluptas labore.', 6, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(10, 'Molestiae porro', 'molestiae-porro', 'Cum aut impedit omnis doloremque rerum suscipit quod. Non porro qui ut odit possimus minus quo et. Ipsum dicta deleniti harum quaerat ea quis velit.', NULL, 'Quod consequatur consequatur exercitationem nihil quaerat vitae. Explicabo sit delectus voluptatem pariatur. Quisquam voluptatem voluptatem atque debitis. Blanditiis asperiores fugiat necessitatibus qui libero itaque.\n\nQuo corrupti rerum quia impedit quo nihil vitae nihil. Voluptatum tempora aperiam aut a. Voluptatibus enim fugit qui illo et asperiores. Eos repellendus ab sit quo ut consequuntur quia.', 3, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(11, 'Est tempora', 'est-tempora', 'Qui aut consectetur necessitatibus in beatae. Voluptas laudantium omnis sequi sed. Voluptatem et enim facere asperiores.', NULL, 'Assumenda iure voluptatem amet officiis. Inventore dolor et recusandae impedit qui consequuntur cum aliquam. Minus dolores nam vero ratione laudantium aut fuga ullam. Asperiores facilis optio ut quas atque quia autem. Sint vel ab hic.\n\nVeritatis illo est qui. Velit fugit fugit doloribus aperiam enim unde. Amet aut ut ut sed repellat.', 6, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(12, 'Unde ipsam', 'unde-ipsam', 'A nemo qui minima velit dicta. Error deserunt rem minus dolorem. Minus nihil sint magni officiis. Labore voluptas est necessitatibus aperiam temporibus ipsam eum.', NULL, NULL, 7, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(13, 'Esse aut', 'esse-aut', 'Aliquam id et molestiae quasi incidunt corrupti placeat. Et perferendis aut sapiente blanditiis est veniam magni. Quae aut consequatur reiciendis et. Sunt voluptate non et maxime.', NULL, 'Nihil beatae atque voluptas inventore qui repellat officia. Ea eligendi error voluptatem rerum dolores maxime. Architecto blanditiis iure laudantium impedit veniam molestiae. Velit qui cupiditate nam quia. Voluptatem omnis vel neque ab aliquid eaque molestiae.\n\nMagni eligendi id ut eligendi aliquam et occaecati. Sed vel natus ex delectus ducimus sequi quae. Et voluptas ut illum inventore enim iste voluptas. Consequatur nam officiis dolores.', 1, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(14, 'Earum aliquid', 'earum-aliquid', 'Animi laborum ducimus quos ipsa et a asperiores. Voluptatem quo id velit dolor enim. Quae quo culpa voluptatem doloribus rerum neque. Maxime ratione amet incidunt minus voluptas doloremque nesciunt.', NULL, NULL, 5, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(15, 'Vitae nobis', 'vitae-nobis', 'Aut ipsam iste enim quis quia magnam quos. Sit tempora praesentium eveniet ullam dicta optio. Autem dolorum fuga doloribus aperiam quisquam ipsa quod. Deleniti facilis rerum repudiandae illum officia dolores nihil. Aspernatur soluta quibusdam consectetur.', NULL, 'Qui ad qui voluptas et. Laboriosam eos adipisci nesciunt ut. Iste facilis libero amet quisquam.\n\nExercitationem molestiae vitae doloremque unde. Cum tenetur sequi quam aut qui ea in et. Voluptatem et inventore ipsa error inventore. Aut voluptas autem tempora corporis expedita.', 8, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(16, 'Assumenda facere', 'assumenda-facere', 'In quis amet voluptatem odio et aut eum necessitatibus. Animi quia commodi similique est dolorum quo occaecati. Dolor culpa tempore ut illo consectetur fugiat. Magni doloribus autem minus excepturi veniam autem voluptatibus.', NULL, 'Ducimus velit doloremque maxime dolore. Quaerat veritatis quia voluptatem. Ab quos maxime similique maxime.\n\nAspernatur et animi qui aspernatur ullam aliquid. Qui est qui itaque ut est sit. Et animi fugiat repellendus praesentium at et totam. Labore accusantium perferendis officiis vero.', 1, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(17, 'Quae nostrum', 'quae-nostrum', 'Est et incidunt maiores nisi aut ipsam nesciunt. Vel quia voluptas et dolor porro sint unde. Eum perferendis et culpa quos delectus. Laboriosam corporis ipsam inventore in.', NULL, 'Voluptas assumenda optio ad est modi inventore beatae dolor. Iure esse autem incidunt rerum voluptas. Quam ullam dolor optio rerum esse fugit nulla consequatur. Eius voluptas eos iure laudantium voluptatem praesentium.\n\nVoluptatem ea ea et similique. Accusamus aut culpa cupiditate facilis. Minus et totam qui.', 18, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(18, 'Et ad', 'et-ad', 'Doloremque nihil odit maiores itaque commodi nulla. Labore nihil eaque asperiores atque numquam. Cum enim libero facere voluptas fuga.', NULL, 'Eius eaque voluptatem quod pariatur. Delectus soluta cupiditate aut consequuntur reiciendis explicabo. Quas non ipsa ut inventore nihil qui. Inventore atque qui quaerat quia explicabo adipisci ut.\n\nIusto eveniet dolorem tempora maxime. Sit laborum voluptatem iure enim fugiat fugiat quibusdam. Facere eum deserunt laboriosam est quo eos blanditiis. Aliquam quam tempora dolor ut.', 2, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(19, 'Doloribus qui', 'doloribus-qui', 'Odio possimus ducimus et delectus at labore. Harum nostrum et dignissimos aut. Saepe odio consequatur quasi sunt tempora laudantium amet. Dicta esse omnis ducimus rerum necessitatibus.', NULL, NULL, 16, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(20, 'Consectetur non', 'consectetur-non', 'Et nobis est dolor placeat vero et. Qui reprehenderit earum beatae autem cupiditate quasi qui. Suscipit illum eum dolor quisquam. Quis velit nihil quidem nisi doloremque culpa vitae a.', NULL, NULL, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55');

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
(1, 1, 10, NULL, NULL),
(2, 2, 4, NULL, NULL),
(3, 2, 5, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 3, 1, NULL, NULL),
(6, 4, 3, NULL, NULL),
(7, 4, 4, NULL, NULL),
(8, 4, 6, NULL, NULL),
(9, 5, 7, NULL, NULL),
(10, 5, 1, NULL, NULL),
(11, 5, 3, NULL, NULL),
(12, 6, 2, NULL, NULL),
(13, 6, 3, NULL, NULL),
(14, 6, 8, NULL, NULL),
(15, 7, 9, NULL, NULL),
(16, 7, 7, NULL, NULL),
(17, 8, 1, NULL, NULL),
(18, 9, 10, NULL, NULL),
(19, 10, 8, NULL, NULL),
(20, 10, 2, NULL, NULL),
(21, 11, 7, NULL, NULL),
(22, 11, 9, NULL, NULL),
(23, 12, 7, NULL, NULL),
(24, 13, 2, NULL, NULL),
(25, 13, 3, NULL, NULL),
(26, 13, 6, NULL, NULL),
(27, 14, 10, NULL, NULL),
(28, 14, 1, NULL, NULL),
(29, 14, 6, NULL, NULL),
(30, 15, 6, NULL, NULL),
(31, 16, 9, NULL, NULL),
(32, 16, 7, NULL, NULL),
(33, 16, 8, NULL, NULL),
(34, 17, 10, NULL, NULL),
(35, 17, 4, NULL, NULL),
(36, 17, 6, NULL, NULL),
(37, 18, 6, NULL, NULL),
(38, 19, 2, NULL, NULL),
(39, 20, 5, NULL, NULL);

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
(1, 16, 21, 'mod', '2025-04-30 16:27:56', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(2, 17, 22, 'mod', '2024-10-07 17:47:47', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(3, 18, 23, 'mod', '2024-10-12 15:33:11', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(4, 19, 24, 'owner', '2025-03-23 15:57:42', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(5, 20, 25, 'member', '2024-12-11 19:12:11', '2025-05-28 03:28:55', '2025-05-28 03:28:55');

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
(13, '2025_05_28_102305_create_user_follows_table', 1);

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
(1, 11, 6, 'At dolorem vero maiores.', 'at-dolorem-vero-maiores', 'Soluta cumque mollitia iure fugiat maxime eum ea. Aut et autem quidem corporis occaecati aut. Aperiam quia omnis laboriosam qui quia aperiam.\n\nAutem consequatur ad sed porro sit sint reprehenderit. Officia eaque pariatur dolores est. Non distinctio assumenda dolor dicta est.\n\nNesciunt inventore reprehenderit facilis autem vel doloribus. Accusantium aut at qui culpa ut odit odio. Soluta rerum soluta voluptatem veritatis. Qui omnis dignissimos est quis.', 'https://via.placeholder.com/640x480.png/00ccdd?text=technics+illum', 'http://bartell.com/', 5, '2025-05-23 02:24:56', NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(2, 12, 7, 'Minima quidem voluptatem impedit consequuntur velit animi asperiores et.', 'minima-quidem-voluptatem-impedit-consequuntur-velit-animi-asperiores-et', 'Consectetur est voluptatem aut. Et nostrum aut id cumque nulla. Itaque mollitia est vel.\n\nConsectetur dolores rerum saepe quidem. Libero adipisci est nihil cum. Aut aut alias et fuga iusto rerum.\n\nId voluptatem dignissimos commodi quam nulla. Voluptas deleniti quos tempora.', 'https://via.placeholder.com/640x480.png/0099ff?text=technics+placeat', 'http://www.eichmann.info/unde-quis-ad-enim-iusto', 2, '2025-05-26 19:24:43', NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(3, 13, 8, 'Dolores perspiciatis quae perspiciatis ex quaerat eos recusandae consequuntur.', 'dolores-perspiciatis-quae-perspiciatis-ex-quaerat-eos-recusandae-consequuntur', 'Enim dolores nihil laudantium officia cumque sunt ipsum accusantium. Nostrum id mollitia error est.\n\nOmnis nostrum quas maxime. Exercitationem est consectetur nihil et unde rerum est. Doloribus quia voluptatem blanditiis qui consequatur ut expedita rerum.\n\nQuia consectetur omnis quia sit maiores. Consequuntur aliquid voluptas laboriosam non esse corporis. Commodi porro nostrum amet.', 'https://via.placeholder.com/640x480.png/009988?text=technics+sunt', 'http://stamm.info/excepturi-cumque-autem-laboriosam-est-cupiditate-fugiat.html', 4, NULL, NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(4, 14, 9, 'Et et enim fuga quo cupiditate ipsa.', 'et-et-enim-fuga-quo-cupiditate-ipsa', 'Ut eveniet quasi cum possimus recusandae. Qui eum ab consectetur. Et rerum mollitia illo facilis iure. Nihil velit quasi veritatis ut nobis.\n\nIllo eum autem voluptates repellendus. Voluptatem nihil repellendus molestias excepturi vel eaque. Quia consequuntur aut omnis assumenda neque tempore qui. Sunt odio in praesentium minima repudiandae saepe.\n\nAut velit libero esse vitae. Debitis repellendus omnis consequatur reiciendis quo. Nobis libero eos aliquam eos animi nihil.', 'https://via.placeholder.com/640x480.png/0011cc?text=technics+fugiat', 'https://yost.com/ut-cum-cum-enim-dolores-quia-incidunt-fugit.html', 2, '2025-05-22 20:00:08', NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(5, 15, 10, 'Voluptatem consectetur esse explicabo.', 'voluptatem-consectetur-esse-explicabo', 'Velit sit nostrum officiis eos deserunt. Recusandae voluptatem placeat vitae ut fugit. Nihil dolorum id velit recusandae doloribus. Ut totam quis qui.\n\nEarum facilis excepturi itaque nulla voluptatibus quam ut. Omnis omnis provident hic et et ex nostrum officiis. Sed dolorem est dolor eos.\n\nQuasi ad et consequatur ipsa. Molestiae perspiciatis dolorem aut omnis. Quia tempore ipsum numquam aperiam. Atque libero natus officia modi.', 'https://via.placeholder.com/640x480.png/008899?text=technics+veritatis', 'http://www.heathcote.net/doloremque-recusandae-illo-a-autem-sed.html', 1, '2025-05-24 03:54:27', NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(6, 16, 11, 'Est quis velit doloremque earum voluptas.', 'est-quis-velit-doloremque-earum-voluptas', 'Occaecati dolorum eum voluptatem consequuntur. Delectus enim sed soluta dolorum sint voluptatum laboriosam. Quo eligendi modi porro amet reprehenderit consequatur optio.\n\nDignissimos nihil voluptas aperiam. Omnis assumenda voluptatem harum facilis et sint placeat. Officiis quia totam ipsam qui eos harum.\n\nPorro officiis deleniti enim vel accusamus. Excepturi iusto magni et voluptatem totam beatae aut. Eos harum hic quis.', 'https://via.placeholder.com/640x480.png/0088ee?text=technics+quam', 'http://turner.net/', 4, NULL, NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(7, 17, 12, 'Explicabo eos blanditiis aspernatur esse ut perspiciatis tempora ipsum.', 'explicabo-eos-blanditiis-aspernatur-esse-ut-perspiciatis-tempora-ipsum', 'Occaecati quaerat magnam molestiae labore repudiandae cum quas. Sed dolores incidunt velit ratione adipisci. Expedita dolore architecto corporis sint laudantium quae.\n\nEum rerum soluta eos velit accusantium. Facilis aliquam tempora quas. Eum quis perferendis sunt sit et maiores. Molestiae laudantium sed temporibus delectus.\n\nAperiam voluptate explicabo nesciunt ut esse facilis. Asperiores rerum nostrum esse quam qui dolor laborum. Labore id sequi rerum omnis. Vel harum ipsa id quia perspiciatis.', 'https://via.placeholder.com/640x480.png/008844?text=technics+labore', 'http://waelchi.com/ea-consectetur-et-laborum-rerum-earum-voluptas-aspernatur', 3, '2025-05-27 09:25:31', NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(8, 18, 13, 'Cupiditate id atque voluptatem facere ea voluptatibus quos.', 'cupiditate-id-atque-voluptatem-facere-ea-voluptatibus-quos', 'Harum ipsam et et sed. Veniam animi aspernatur et rerum nemo adipisci praesentium. Voluptates necessitatibus consequatur aut voluptatem.\n\nIn est sed sit doloremque ullam distinctio qui necessitatibus. Itaque similique perspiciatis ex atque fuga facilis. Unde est voluptatem et. Ipsum ab reiciendis aut eum facilis quia enim.\n\nSit minus ut aliquid aut corrupti et. Occaecati fuga voluptatum numquam eos maiores et natus. Est sunt qui consequatur nisi veritatis. Et porro debitis animi est voluptatem.', 'https://via.placeholder.com/640x480.png/0066ee?text=technics+a', 'http://www.anderson.com/facilis-maxime-a-unde-minus-accusamus-aut-tenetur', 1, NULL, NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(9, 19, 14, 'Esse reiciendis voluptatem cumque et id quibusdam temporibus.', 'esse-reiciendis-voluptatem-cumque-et-id-quibusdam-temporibus', 'Dolores vitae autem sapiente voluptatem perspiciatis omnis. Accusamus fugit pariatur nulla nostrum sunt consequuntur.\n\nEst occaecati possimus ipsum iure ut ea. Ad animi rerum blanditiis vitae corporis assumenda. Occaecati in in voluptatem exercitationem vitae. Qui voluptatum corporis iure eum quas saepe fugit.\n\nVoluptatum repellendus ipsum repudiandae qui. Rerum magnam velit doloribus aut natus voluptas.', 'https://via.placeholder.com/640x480.png/00ee77?text=technics+et', 'https://www.schuppe.net/necessitatibus-laboriosam-rerum-necessitatibus', 5, '2025-05-23 16:36:50', NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(10, 20, 15, 'Nulla tempore perferendis iure sequi deserunt molestias.', 'nulla-tempore-perferendis-iure-sequi-deserunt-molestias', 'Sit illum reiciendis dolorem corrupti odit in occaecati. Et dolor pariatur voluptatum non omnis et omnis. Nobis eos cum et distinctio molestiae quia eius.\n\nDistinctio sint consequatur sapiente. Incidunt omnis incidunt ut aperiam quo molestiae excepturi. Molestiae id ut autem sint eum veritatis inventore.\n\nEt ipsam autem ducimus. Adipisci est dolores explicabo itaque distinctio atque distinctio. Hic ut molestias dolores provident.', 'https://via.placeholder.com/640x480.png/0000cc?text=technics+occaecati', 'http://gleason.org/', 5, NULL, NULL, '2025-05-28 03:28:54', '2025-05-28 03:28:54');

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
(1, 1, 6, NULL, NULL),
(2, 2, 4, NULL, NULL),
(3, 3, 9, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 4, 10, NULL, NULL),
(6, 4, 5, NULL, NULL),
(7, 5, 3, NULL, NULL),
(8, 5, 8, NULL, NULL),
(9, 5, 7, NULL, NULL),
(10, 6, 6, NULL, NULL),
(11, 6, 9, NULL, NULL),
(12, 6, 5, NULL, NULL),
(13, 7, 7, NULL, NULL),
(14, 7, 8, NULL, NULL),
(15, 8, 6, NULL, NULL),
(16, 8, 4, NULL, NULL),
(17, 8, 2, NULL, NULL),
(18, 9, 4, NULL, NULL),
(19, 10, 1, NULL, NULL);

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
(1, 16, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(2, 2, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(3, 19, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(4, 4, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(5, 18, 4, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(6, 18, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(7, 12, 5, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(8, 2, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(9, 8, 9, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(10, 4, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(11, 15, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(12, 1, 5, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(13, 1, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(14, 12, 3, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(15, 2, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(16, 20, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(17, 3, 3, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(18, 15, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(19, 7, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(20, 13, 5, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(21, 5, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(22, 7, 10, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(23, 14, 3, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(24, 18, 6, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(25, 5, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(26, 4, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(27, 20, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(28, 8, 7, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(29, 15, 3, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(30, 6, 4, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(31, 5, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(32, 15, 5, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(33, 6, 3, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(34, 18, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(35, 14, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(36, 2, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(37, 15, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(38, 13, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(39, 19, 6, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(40, 20, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(41, 3, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(42, 8, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(43, 8, 10, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(44, 7, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(45, 1, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(46, 10, 10, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(47, 12, 10, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(48, 15, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(49, 5, 3, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(50, 3, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(51, 16, 2, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(52, 3, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(53, 14, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(54, 9, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(55, 13, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(56, 15, 4, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(57, 6, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(58, 16, 10, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(59, 2, 3, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(60, 6, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(61, 12, 6, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(62, 17, 6, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(63, 10, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(64, 12, 8, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(65, 20, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(66, 10, 5, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(67, 13, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(68, 19, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(69, 17, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(70, 6, 5, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(71, 14, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(72, 10, 8, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(73, 10, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(74, 4, 1, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(75, 11, 4, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(76, 1, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(77, 6, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(78, 17, 7, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(79, 13, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(80, 8, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(81, 11, 5, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(82, 19, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(83, 13, 2, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(84, 14, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(85, 16, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(86, 1, 7, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(87, 19, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(88, 20, 2, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(89, 12, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(90, 18, 7, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(91, 11, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(92, 17, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(93, 5, 8, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(94, 2, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(95, 7, 8, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(96, 5, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(97, 9, 3, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(98, 20, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(99, 1, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(100, 11, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(101, 20, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(102, 2, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(103, 2, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(104, 11, 2, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(105, 7, 9, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(106, 15, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(107, 16, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(108, 19, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(109, 3, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(110, 13, 3, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(111, 8, 3, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(112, 18, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(113, 3, 6, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(114, 17, 4, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(115, 9, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(116, 5, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(117, 17, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(118, 3, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(119, 8, 1, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(120, 2, 7, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(121, 9, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(122, 7, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(123, 4, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(124, 12, 2, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(125, 20, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(126, 3, 9, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(127, 9, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(128, 7, 5, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(129, 12, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(130, 9, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(131, 7, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(132, 10, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(133, 14, 6, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(134, 4, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(135, 9, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(136, 16, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(137, 6, 9, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(138, 6, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(139, 17, 3, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(140, 15, 7, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(141, 19, 9, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(142, 16, 4, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(143, 11, 9, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(144, 11, 1, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(145, 20, 3, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(146, 13, 8, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(147, 20, 4, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(148, 1, 10, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(149, 14, 2, NULL, 'dislike', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(150, 17, 10, NULL, 'like', '2025-05-28 03:28:55', '2025-05-28 03:28:55');

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
(1, 1, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(2, 1, 4, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(3, 1, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(4, 1, 6, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(5, 1, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(6, 2, 2, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(7, 2, 4, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(8, 2, 3, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(9, 3, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(10, 4, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(11, 4, 1, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(12, 4, 2, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(13, 5, 4, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(14, 5, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(15, 5, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(16, 5, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(17, 6, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(18, 6, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(19, 6, 6, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(20, 6, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(21, 6, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(22, 7, 6, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(23, 7, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(24, 7, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(25, 7, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(26, 8, 2, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(27, 9, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(28, 9, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(29, 10, 6, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(30, 10, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(31, 10, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(32, 11, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(33, 11, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(34, 11, 4, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(35, 11, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(36, 11, 3, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(37, 12, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(38, 12, 3, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(39, 12, 6, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(40, 12, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(41, 12, 1, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(42, 13, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(43, 13, 1, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(44, 13, 2, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(45, 14, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(46, 14, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(47, 15, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(48, 15, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(49, 15, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(50, 15, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(51, 15, 3, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(52, 16, 6, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(53, 16, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(54, 16, 1, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(55, 16, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(56, 17, 4, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(57, 17, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(58, 17, 5, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(59, 17, 2, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(60, 17, 1, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(61, 18, 9, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(62, 18, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(63, 19, 10, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(64, 19, 2, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(65, 19, 6, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(66, 19, 8, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(67, 20, 4, '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(68, 20, 7, '2025-05-28 03:28:55', '2025-05-28 03:28:55');

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
(1, 'eum', 'eum', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(2, 'maiores', 'maiores', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(3, 'excepturi', 'excepturi', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(4, 'inventore', 'inventore', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(5, 'repudiandae', 'repudiandae', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(6, 'quis', 'quis', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(7, 'esse', 'esse', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(8, 'autem', 'autem', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(9, 'id', 'id', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(10, 'voluptas', 'voluptas', '2025-05-28 03:28:54', '2025-05-28 03:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `bio`, `is_banned`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Katherine O\'Connell', 'qharber@example.org', '2025-05-28 03:28:53', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Totam quo aut rem recusandae quasi ducimus nobis. Odio ipsam dolores maxime laboriosam similique qui.', 0, 'i4jWeF1sIK', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(2, 'Eloy Mitchell', 'pjohnston@example.org', '2025-05-28 03:28:53', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Assumenda totam velit est dolores ut id. Illo et provident quis sed neque nulla. Voluptatem ullam numquam necessitatibus modi voluptas quia.', 0, 'iZC2o9ByQo', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(3, 'Carlee Lakin', 'carole06@example.com', '2025-05-28 03:28:53', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Asperiores et doloremque reiciendis tenetur molestias doloribus quasi. Saepe sit non dolorum. Fugiat quisquam sint illum asperiores adipisci.', 0, 'J8bx2wckcn', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(4, 'Jayson Bogan IV', 'blick.simone@example.com', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Accusantium quod quibusdam illo. Laudantium illum molestiae in recusandae saepe. Esse reprehenderit laudantium sunt magnam quia suscipit.', 0, 'hsx8WqSxac', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(5, 'Price Nolan', 'owyman@example.com', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Nemo dolorem quia quibusdam rem. Quas at distinctio repellat blanditiis. Aspernatur ullam magni quia. Qui explicabo ut minus ut reprehenderit.', 0, 'DOlERJtNpb', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(6, 'Dr. Baylee Schulist DVM', 'liana.sauer@example.net', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Iure voluptates incidunt et repellat vero corrupti. Dolores reiciendis ut dignissimos aut. Nobis praesentium voluptas aperiam reiciendis.', 0, '03F1MJiwwM', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(7, 'Dr. Einar Kling', 'atorphy@example.com', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Et dolore tenetur voluptas ut ut voluptatem. Quo voluptas expedita expedita dolores. Reprehenderit quam in sit qui qui officiis delectus.', 0, '22tY4WCRT1', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(8, 'Kirstin Kohler', 'delia.hoeger@example.com', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Eos qui quas veniam ut fuga fugiat. Alias dolores adipisci sed consectetur modi id. Autem nesciunt cum rerum iusto.', 0, 'NrEmM0F1am', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(9, 'Mr. Lisandro Bayer III', 'vkris@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Veniam cumque sunt est et eum. Accusamus perferendis occaecati explicabo perspiciatis. Molestiae ipsa maxime quisquam atque est.', 0, 'T9jSlBfJq1', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(10, 'Enoch Bartoletti', 'angeline.bednar@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Quia corporis rerum fugiat sed voluptate ea magni. Repellendus perferendis aliquid enim.', 0, 'DXuGcWlOEq', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(11, 'Francesca Conroy I', 'gardner.nitzsche@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Distinctio esse voluptatem quas et. Quia nam expedita quae dolores perferendis exercitationem quas. Eaque laudantium optio at non.', 0, 'NFGtE5q4hN', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(12, 'Prof. Freda Sawayn', 'sdonnelly@example.com', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Voluptas quasi et cupiditate ut qui vero. Consequatur est sit voluptas eos qui expedita maxime.', 0, 'A7bGPr2vFP', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(13, 'Raphaelle Cruickshank MD', 'candelario66@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Cumque quia eum fuga labore. Est ullam quasi non quam nisi sunt. Aliquid quos ex nisi ea.', 0, '5itqMr8poR', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(14, 'Marge Yost', 'greenholt.coleman@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Fugit voluptas doloribus delectus ut quia ullam consequatur. Quia blanditiis cupiditate pariatur nam. Consequuntur pariatur omnis nihil aliquam.', 0, 'ae3pf97v4v', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(15, 'Emely Price', 'lemke.cristal@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Veniam molestiae amet amet ipsum necessitatibus. Repudiandae facere excepturi neque quibusdam. Iste quam optio id facere enim.', 0, 'GIEsdA0kOC', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(16, 'Mr. Kacey Crooks', 'lokeefe@example.com', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Corrupti a in omnis possimus et aspernatur cum facere. Molestiae voluptatem non velit nam. Excepturi non id laudantium assumenda sint natus aut est.', 0, 'qszBbhRYU7', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(17, 'Damion Gusikowski', 'janis49@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Neque eligendi corrupti ut rem voluptatibus. Vel sint sed minima animi qui et. Consequuntur facere quae consequatur quidem quaerat consequatur.', 0, 'iXAfTQILew', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(18, 'Elizabeth Balistreri', 'stroman.lilla@example.net', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Aut quasi quia sit ad adipisci nesciunt delectus esse. Tempore perspiciatis hic accusantium ut ex. Ut ut non reprehenderit dolore eaque.', 0, 'tWvG8gNfyd', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(19, 'Mr. Ariel McCullough', 'kstark@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Officia et quas voluptates placeat. Exercitationem beatae reiciendis dicta. Corporis molestiae rerum eos occaecati vel sit vitae.', 0, 'z0twEmmibt', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(20, 'Mohamed Collier', 'hoeger.dorthy@example.org', '2025-05-28 03:28:54', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Magni reprehenderit error et eligendi dolor. Deserunt ipsum blanditiis sed soluta sapiente nesciunt eligendi. Eos distinctio soluta quis et.', 0, 'FPqTjctVlg', '2025-05-28 03:28:54', '2025-05-28 03:28:54'),
(21, 'Mr. Bertha Conroy', 'chesley01@example.org', '2025-05-28 03:28:55', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Itaque quo nihil omnis molestiae aliquam. Aspernatur enim impedit eveniet qui eum. Omnis non explicabo voluptatem.', 0, 'dwRyFC18HT', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(22, 'Mathias Stoltenberg', 'tillman.meta@example.net', '2025-05-28 03:28:55', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Quos enim quam saepe enim. Hic quidem fugiat perspiciatis quia quidem. Dolores omnis eveniet praesentium soluta. Quos ratione est mollitia dolores.', 0, 'sonvda4yHs', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(23, 'Lelah Carter DDS', 'annabel39@example.com', '2025-05-28 03:28:55', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Quasi unde neque at tempore quod aliquam ab. Eius placeat maxime non voluptatibus omnis.', 0, 'j2GK98mfqw', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(24, 'Priscilla Gorczany', 'sidney.waters@example.org', '2025-05-28 03:28:55', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Officiis facere nihil iusto rerum. Dolore velit aut blanditiis dolores aut sint tempora. Rem officia praesentium aliquid et.', 0, 'oUxAnjVnQo', '2025-05-28 03:28:55', '2025-05-28 03:28:55'),
(25, 'Augusta Monahan', 'lorenz.brakus@example.org', '2025-05-28 03:28:55', '$2y$12$pBB4mFlLP97wQu5mfBf/FOughLOnPS6i9GZdEM0KyuTctryM6WgYy', NULL, 'Qui aut aut voluptatum nostrum. Magnam tempora saepe quaerat est est harum sunt. Sunt et dignissimos aliquid officiis labore natus perferendis.', 0, 'Nrye6HeviX', '2025-05-28 03:28:55', '2025-05-28 03:28:55');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `community_tags`
--
ALTER TABLE `community_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `community_users`
--
ALTER TABLE `community_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_follows`
--
ALTER TABLE `user_follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
