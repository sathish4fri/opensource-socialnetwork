-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2014 at 01:19 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_annotations`
--

CREATE TABLE IF NOT EXISTS `ossn_annotations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_guid` bigint(20) NOT NULL,
  `subject_guid` bigint(20) NOT NULL,
  `type` text NOT NULL,
  `time_created` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_components`
--

CREATE TABLE IF NOT EXISTS `ossn_components` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `com_id` text NOT NULL,
  `active` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `ossn_components`
--

INSERT INTO `ossn_components` (`id`, `com_id`, `active`) VALUES
(1, 'OssnProfile', '1'),
(2, 'OssnWall', '1'),
(3, 'OssnComments', '1'),
(4, 'OssnLikes', '1'),
(5, 'OssnPhotos', '1'),
(6, 'OssnNotifications', '1'),
(7, 'OssnSearch', '1'),
(8, 'OssnMessages', '1'),
(10, 'OssnAds', '1'),
(12, 'OssnGroups', '1'),
(13, 'OssnSitePages', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ossn_entities`
--

CREATE TABLE IF NOT EXISTS `ossn_entities` (
  `guid` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_guid` bigint(20) NOT NULL,
  `type` text NOT NULL,
  `subtype` text NOT NULL,
  `time_created` int(11) NOT NULL,
  `time_updated` int(11) DEFAULT NULL,
  `premission` int(1) NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_entities_metadata`
--

CREATE TABLE IF NOT EXISTS `ossn_entities_metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` bigint(20) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_likes`
--

CREATE TABLE IF NOT EXISTS `ossn_likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NOT NULL,
  `guid` bigint(20) NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_messages`
--

CREATE TABLE IF NOT EXISTS `ossn_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_from` bigint(20) NOT NULL,
  `message_to` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `viewed` text,
  `time` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_notifications`
--

CREATE TABLE IF NOT EXISTS `ossn_notifications` (
  `guid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` text CHARACTER SET latin1 NOT NULL,
  `poster_guid` bigint(20) NOT NULL,
  `owner_guid` bigint(20) NOT NULL,
  `subject_guid` bigint(20) NOT NULL,
  `viewed` text,
  `time_created` text NOT NULL,
  `item_guid` bigint(20) NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_object`
--

CREATE TABLE IF NOT EXISTS `ossn_object` (
  `guid` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_guid` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `time_created` text NOT NULL,
  `title` longtext NOT NULL,
  `description` text NOT NULL,
  `subtype` text NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_relationships`
--

CREATE TABLE IF NOT EXISTS `ossn_relationships` (
  `relation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation_from` bigint(20) NOT NULL,
  `relation_to` bigint(20) NOT NULL,
  `type` text NOT NULL,
  `time` text NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ossn_site_settings`
--

CREATE TABLE IF NOT EXISTS `ossn_site_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf16 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ossn_site_settings`
--

INSERT INTO `ossn_site_settings` (`setting_id`, `name`, `value`) VALUES
(1, 'theme', 'default'),
(2, 'site_name', 'OSSN'),
(3, 'language', 'en'),
(4, 'cache', '0'),
(5, 'owner_email', '<<owner_email>>'),
(6, 'notification_email', '<<notification_email>>');

-- --------------------------------------------------------

--
-- Table structure for table `ossn_users`
--

CREATE TABLE IF NOT EXISTS `ossn_users` (
  `guid` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `salt` varchar(8) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `last_login` text NOT NULL,
  `last_activity` text NOT NULL,
  `activation` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

