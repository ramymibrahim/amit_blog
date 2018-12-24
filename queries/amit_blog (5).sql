-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 24, 2018 at 08:09 PM
-- Server version: 5.7.23
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `amit_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Sports'),
(2, 'Politics'),
(3, 'News');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_comments_fk` (`post_id`),
  KEY `users_comments_fk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `created_at`) VALUES
(1, 1, 1, 'سنظل  أوفياء طول الدهر', '2018-12-17 18:03:20'),
(2, 2, 1, 'انا كنت بكدب', '2018-12-17 18:03:42'),
(3, 1, 2, 'يا كدابيييين', '2018-12-17 18:03:56'),
(4, 2, 2, 'اقرء الصحف الرسمية لو سمحت', '2018-12-17 18:04:11');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(4000) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_posts_fk` (`category_id`),
  KEY `users_posts_fk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `content`, `picture`, `created_at`, `is_active`) VALUES
(1, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(2, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(3, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(4, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(5, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(6, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(7, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(8, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(9, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(10, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(11, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(12, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(13, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(14, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(15, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(16, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(17, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(18, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(19, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(20, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(21, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(22, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(23, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(24, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(25, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(26, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(27, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(28, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(29, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(30, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(31, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(32, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `is_author` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `picture`, `is_author`, `is_admin`) VALUES
(1, 'abdallah', 'bf933e3d413bd3993ad7c9d9295cf58549f249ae', 'AbdAllah Ahmed', 'img/abdallah.jpg', 0, 0),
(2, 'ayman', '7679197429abe02a416360e317f999177335e60f', 'Ayman Abdeen', 'img/ayman.jpg', 1, 1),
(3, 'Test', '5a0a5d0b88a85dea5d1fb7c64f02012e358a221d', 'qasda', 'img/C:wamp64	mpphp94F2.tmp', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `posts_comments_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_comments_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `categories_posts_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_posts_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
