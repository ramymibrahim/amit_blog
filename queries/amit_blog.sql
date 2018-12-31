-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 31 ديسمبر 2018 الساعة 20:00
-- إصدار الخادم: 5.7.23
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
CREATE DATABASE IF NOT EXISTS `amit_blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `amit_blog`;

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Sports'),
(2, 'Politics'),
(3, 'News');

-- --------------------------------------------------------

--
-- بنية الجدول `comments`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `post_id`, `content`, `created_at`) VALUES
(2, 2, 1, 'انا كنت بكدب', '2018-12-17 18:03:42'),
(3, 2, 4, 'Hi Abdo', '2018-12-31 19:31:27');

-- --------------------------------------------------------

--
-- بنية الجدول `posts`
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
  KEY `users_posts_fk` (`user_id`),
  KEY `categories_posts_fk` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `content`, `picture`, `created_at`, `is_active`) VALUES
(1, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(3, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 0),
(4, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(5, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(7, 1, 2, 'Zamalek wins last match', 'Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match Zamalek wins last match ', 'img/1.jpg', '2018-12-17 18:01:47', 1),
(8, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 0),
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
(32, 2, 2, 'إتجازات العاصمة الإدارية الجديدة', 'إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة إتجازات العاصمة الإدارية الجديدة ', 'img/1.jpg', '2018-12-17 18:02:36', 1),
(34, 1, 2, 'asd', 'asd', 'img/154628557515462855751897.jpg', '2018-12-31 19:46:15', 0),
(35, 2, 2, 'asdasd', '222', 'img/154628559415462855946696.jpg', '2018-12-31 19:46:34', 0);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
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
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `picture`, `is_author`, `is_admin`, `is_active`) VALUES
(2, 'ayman', '7679197429abe02a416360e317f999177335e60f', 'Ayman Abdeen', 'img/ayman.jpg', 1, 1, 1),
(4, 'fawzy', '19fa5110de8d66c7aa815ab42f4865b811e2b3f5', 'f', 'img/fawzy154584332315458433230519.jpg', 0, 0, 1),
(6, 'Ahmed', 'c61f6060db311d863b6097fec89f35acda8a2154', 'Ahmed', 'img/Ahmed154584338815458433889890.jpg', 0, 0, 1),
(7, 'Ramy', 'f693349fce2b971263649fa0c5c0d0856e12f56c', 'ramy', 'img/Ramy154584345415458434541455.jpg', 0, 0, 1),
(8, 'Kerolos', 'b6c32e1cc23a58c1722aeee564c5d66d43f53326', 'Kerolos', 'img/Kerolos154584350115458435019242.jpg', 0, 0, 1),
(13, 'Mohamed', '3359b063819ad122e7f8370ae9ac46374b902f26', 'Mohamed', 'img/Mohamed154584430315458443030534.jpg', 0, 0, 1);

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `posts_comments_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_comments_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- القيود للجدول `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `categories_posts_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `users_posts_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
