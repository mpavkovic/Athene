-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2011 at 08:13 PM
-- Server version: 5.1.54
-- PHP Version: 5.3.5-1ubuntu7.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oszamet`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'administrator'),
(2, 'superadmin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_message`
--

CREATE TABLE IF NOT EXISTS `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_fbfc09f1` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add message', 4, 'add_message'),
(11, 'Can change message', 4, 'change_message'),
(12, 'Can delete message', 4, 'delete_message'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add log entry', 8, 'add_logentry'),
(23, 'Can change log entry', 8, 'change_logentry'),
(24, 'Can delete log entry', 8, 'delete_logentry'),
(25, 'Can add fk model', 9, 'add_fkmodel'),
(26, 'Can change fk model', 9, 'change_fkmodel'),
(27, 'Can delete fk model', 9, 'delete_fkmodel'),
(28, 'Can add model', 10, 'add_model'),
(29, 'Can change model', 10, 'change_model'),
(30, 'Can delete model', 10, 'delete_model'),
(31, 'Can add ext direct store model', 11, 'add_extdirectstoremodel'),
(32, 'Can change ext direct store model', 11, 'change_extdirectstoremodel'),
(33, 'Can delete ext direct store model', 11, 'delete_extdirectstoremodel'),
(34, 'Can add meta model', 12, 'add_metamodel'),
(35, 'Can change meta model', 12, 'change_metamodel'),
(36, 'Can delete meta model', 12, 'delete_metamodel'),
(37, 'Can add meta model custom field', 13, 'add_metamodelcustomfield'),
(38, 'Can change meta model custom field', 13, 'change_metamodelcustomfield'),
(39, 'Can delete meta model custom field', 13, 'delete_metamodelcustomfield'),
(40, 'Can add perm model', 14, 'add_permmodel'),
(41, 'Can change perm model', 14, 'change_permmodel'),
(42, 'Can delete perm model', 14, 'delete_permmodel'),
(43, 'My Permission', 14, 'my_permission'),
(44, 'Can add učenik', 15, 'add_ucenik'),
(45, 'Can change učenik', 15, 'change_ucenik'),
(46, 'Can delete učenik', 15, 'delete_ucenik'),
(47, 'Can add škola', 16, 'add_skola'),
(48, 'Can change škola', 16, 'change_skola'),
(49, 'Can delete škola', 16, 'delete_skola'),
(50, 'Can add država', 17, 'add_drzava'),
(51, 'Can change država', 17, 'change_drzava'),
(52, 'Can delete država', 17, 'delete_drzava'),
(53, 'Can add mjesto', 18, 'add_mjesto'),
(54, 'Can change mjesto', 18, 'change_mjesto'),
(55, 'Can delete mjesto', 18, 'delete_mjesto'),
(56, 'Can add razredno odjeljenje', 19, 'add_razrednoodjeljenje'),
(57, 'Can change razredno odjeljenje', 19, 'change_razrednoodjeljenje'),
(58, 'Can delete razredno odjeljenje', 19, 'delete_razrednoodjeljenje'),
(59, 'Can add predmet razrednog odjeljenja', 20, 'add_predmetrazrednogodjeljenja'),
(60, 'Can change predmet razrednog odjeljenja', 20, 'change_predmetrazrednogodjeljenja'),
(61, 'Can delete predmet razrednog odjeljenja', 20, 'delete_predmetrazrednogodjeljenja'),
(62, 'Can add predmet', 21, 'add_predmet'),
(63, 'Can change predmet', 21, 'change_predmet'),
(64, 'Can delete predmet', 21, 'delete_predmet'),
(65, 'Can add ocjena', 22, 'add_ocjena'),
(66, 'Can change ocjena', 22, 'change_ocjena'),
(67, 'Can delete ocjena', 22, 'delete_ocjena'),
(68, 'Can add predmetna cjelina', 23, 'add_predmetnacjelina'),
(69, 'Can change predmetna cjelina', 23, 'change_predmetnacjelina'),
(70, 'Can delete predmetna cjelina', 23, 'delete_predmetnacjelina'),
(71, 'Can add učitelj', 24, 'add_ucitelj'),
(72, 'Can change učitelj', 24, 'change_ucitelj'),
(73, 'Can delete učitelj', 24, 'delete_ucitelj'),
(74, 'Can add školska godina', 25, 'add_skolskagodina'),
(75, 'Can change školska godina', 25, 'change_skolskagodina'),
(76, 'Can delete školska godina', 25, 'delete_skolskagodina'),
(77, 'Can add titula', 26, 'add_titula'),
(78, 'Can change titula', 26, 'change_titula'),
(79, 'Can delete titula', 26, 'delete_titula'),
(80, 'Can add izostanak', 27, 'add_izostanak'),
(81, 'Can change izostanak', 27, 'change_izostanak'),
(82, 'Can delete izostanak', 27, 'delete_izostanak'),
(83, 'Can add događaj', 28, 'add_dogadjaj'),
(84, 'Can change događaj', 28, 'change_dogadjaj'),
(85, 'Can delete događaj', 28, 'delete_dogadjaj'),
(86, 'Can add vrsta poteškoće', 29, 'add_vrstapoteskoce'),
(87, 'Can change vrsta poteškoće', 29, 'change_vrstapoteskoce'),
(88, 'Can delete vrsta poteškoće', 29, 'delete_vrstapoteskoce'),
(89, 'Can add dodijeljena poteškoća', 30, 'add_dodijeljenapoteskoca'),
(90, 'Can change dodijeljena poteškoća', 30, 'change_dodijeljenapoteskoca'),
(91, 'Can delete dodijeljena poteškoća', 30, 'delete_dodijeljenapoteskoca'),
(92, 'Can add slobodna aktivnost', 31, 'add_slobodnaaktivnost'),
(93, 'Can change slobodna aktivnost', 31, 'change_slobodnaaktivnost'),
(94, 'Can delete slobodna aktivnost', 31, 'delete_slobodnaaktivnost'),
(95, 'Can add zanimanje', 32, 'add_zanimanja'),
(96, 'Can change zanimanje', 32, 'change_zanimanja'),
(97, 'Can delete zanimanje', 32, 'delete_zanimanja'),
(98, 'Can add vrsta putnika', 33, 'add_vrstaputnika'),
(99, 'Can change vrsta putnika', 33, 'change_vrstaputnika'),
(100, 'Can delete vrsta putnika', 33, 'delete_vrstaputnika'),
(101, 'Can add nacionalna manjina', 34, 'add_nacionalnamanjina'),
(102, 'Can change nacionalna manjina', 34, 'change_nacionalnamanjina'),
(103, 'Can delete nacionalna manjina', 34, 'delete_nacionalnamanjina'),
(104, 'Can add narodnost', 35, 'add_narodnost'),
(105, 'Can change narodnost', 35, 'change_narodnost'),
(106, 'Can delete narodnost', 35, 'delete_narodnost'),
(107, 'Can add razlog boravišta', 36, 'add_razlogboravista'),
(108, 'Can change razlog boravišta', 36, 'change_razlogboravista'),
(109, 'Can delete razlog boravišta', 36, 'delete_razlogboravista'),
(110, 'Can add adresa', 37, 'add_adresa'),
(111, 'Can change adresa', 37, 'change_adresa'),
(112, 'Can delete adresa', 37, 'delete_adresa'),
(113, 'Can add nastavni plan', 38, 'add_nastavniplan'),
(114, 'Can change nastavni plan', 38, 'change_nastavniplan'),
(115, 'Can delete nastavni plan', 38, 'delete_nastavniplan'),
(116, 'Can add nastavna jedinica', 39, 'add_nastavnajedinica'),
(117, 'Can change nastavna jedinica', 39, 'change_nastavnajedinica'),
(118, 'Can delete nastavna jedinica', 39, 'delete_nastavnajedinica'),
(119, 'Can add metodska jedinica', 40, 'add_metodskajedinica'),
(120, 'Can change metodska jedinica', 40, 'change_metodskajedinica'),
(121, 'Can delete metodska jedinica', 40, 'delete_metodskajedinica'),
(122, 'Can add nastavni sat', 41, 'add_nastavnisat'),
(123, 'Can change nastavni sat', 41, 'change_nastavnisat'),
(124, 'Can delete nastavni sat', 41, 'delete_nastavnisat'),
(125, 'Can add najava ispita', 42, 'add_najavaispita'),
(126, 'Can change najava ispita', 42, 'change_najavaispita'),
(127, 'Can delete najava ispita', 42, 'delete_najavaispita'),
(128, 'Can add kategorija ocjena', 43, 'add_kategorijaocjena'),
(129, 'Can change kategorija ocjena', 43, 'change_kategorijaocjena'),
(130, 'Can delete kategorija ocjena', 43, 'delete_kategorijaocjena');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` char(32) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'pauk960', '', '', 'pauk960@gmail.com', '412f58bde15d78d2c6e81d2bc4d5ba40', 1, 1, 1, '2011-05-15 19:53:53', '2011-05-15 19:37:04'),
(3, 'zugrina', 'Zoran', 'Ugrina', 'mail@preo.com', '75d32b3aa6f034695e950f1edbc88c74', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'zugrin', 'dask', 'daks', 'jdka', 'd8da8eb207624fa1ca45d0f0ff39c742', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'ure', '', '', 'u', '7b774effe4a349c6dd82ad4f4f21d34c', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'sdas', '', '', 'fg', 'b2f5ff47436671b6e533d8dc3614845d', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `debug`
--

CREATE TABLE IF NOT EXISTS `debug` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `file` varchar(300) NOT NULL,
  `line` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=887 ;

--
-- Dumping data for table `debug`
--

INSERT INTO `debug` (`id`, `time`, `title`, `message`, `file`, `line`) VALUES
(1, '2011-05-25 20:31:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(2, '2011-05-25 21:02:49', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(3, '2011-05-25 21:03:24', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(4, '2011-05-25 21:04:15', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(5, '2011-05-25 21:06:34', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(6, '2011-05-25 21:06:37', 'JSON request', '{"action":"Mjesto","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(7, '2011-05-25 21:08:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(8, '2011-05-25 21:08:39', 'JSON request', '{"action":"Mjesto","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(9, '2011-05-26 11:56:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(10, '2011-05-26 11:57:03', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(11, '2011-05-26 11:59:59', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(12, '2011-05-26 12:00:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(13, '2011-05-26 12:00:25', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(14, '2011-05-26 12:02:57', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(15, '2011-05-26 12:03:38', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(16, '2011-05-26 12:03:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(17, '2011-05-26 12:04:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(18, '2011-05-26 12:08:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(19, '2011-05-26 12:10:58', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(20, '2011-05-26 12:15:15', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(21, '2011-05-26 12:20:14', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(22, '2011-05-26 12:20:24', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(23, '2011-05-26 12:20:45', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(24, '2011-05-26 12:21:16', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(25, '2011-05-26 12:21:26', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(26, '2011-05-26 12:21:31', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(27, '2011-05-26 12:21:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(28, '2011-05-26 12:22:10', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(29, '2011-05-26 12:22:16', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(30, '2011-05-26 12:24:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(31, '2011-05-26 12:24:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(32, '2011-05-26 12:29:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(33, '2011-05-26 12:33:17', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(34, '2011-05-26 12:33:50', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(35, '2011-05-26 12:34:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(36, '2011-05-26 12:35:21', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(37, '2011-05-26 12:36:19', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(38, '2011-05-26 12:38:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(39, '2011-05-26 12:39:26', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(40, '2011-05-26 12:40:28', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(41, '2011-05-26 12:40:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(42, '2011-05-26 12:40:44', 'JSON request', '{"action":"MetodskaJedinica","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 136),
(43, '2011-05-26 12:40:44', 'JSON request', '{"action":"KategorijaOcjena","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 136),
(44, '2011-05-26 12:43:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(45, '2011-05-26 12:43:57', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(46, '2011-05-26 12:44:17', 'JSON request', '{"action":"Mjesto","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 136),
(47, '2011-05-26 12:45:07', 'JSON request', '{"action":"KategorijaOcjena","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 136),
(48, '2011-05-26 12:45:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(49, '2011-05-26 12:45:50', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(50, '2011-05-26 12:46:03', 'JSON request', '{"action":"Izostanak","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 136),
(51, '2011-05-26 12:47:59', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(52, '2011-05-26 12:48:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(53, '2011-05-26 12:48:28', 'JSON request', '{"action":"NastavnaJedinica","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 136),
(54, '2011-05-26 14:22:17', 'JSON request', '{"action":"NastavniSat","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 136),
(55, '2011-05-26 14:22:23', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 136),
(56, '2011-05-26 14:22:33', 'JSON request', '{"action":"MetodskaJedinica","method":"getAll","data":null,"type":"rpc","tid":6}', '/var/www/Athene/ext.php', 136),
(57, '2011-05-26 14:22:35', 'JSON request', '{"action":"PredmetRazrednogOdjeljenja","method":"getAll","data":null,"type":"rpc","tid":7}', '/var/www/Athene/ext.php', 136),
(58, '2011-05-26 14:22:47', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":8}', '/var/www/Athene/ext.php', 136),
(59, '2011-05-26 14:24:49', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":9}', '/var/www/Athene/ext.php', 136),
(60, '2011-05-26 14:24:59', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":10}', '/var/www/Athene/ext.php', 136),
(61, '2011-05-26 14:25:44', 'JSON request', '{"action":"NastavniPlan","method":"getAll","data":null,"type":"rpc","tid":11}', '/var/www/Athene/ext.php', 136),
(62, '2011-05-26 14:25:51', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":12}', '/var/www/Athene/ext.php', 136),
(63, '2011-05-26 14:26:05', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":13}', '/var/www/Athene/ext.php', 136),
(64, '2011-05-26 14:28:12', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":14}', '/var/www/Athene/ext.php', 136),
(65, '2011-05-26 14:28:27', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":15}', '/var/www/Athene/ext.php', 136),
(66, '2011-05-26 17:20:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(67, '2011-05-26 17:37:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(68, '2011-05-26 17:38:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(69, '2011-05-26 17:41:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(70, '2011-05-26 17:42:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(71, '2011-05-26 17:44:58', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(72, '2011-05-26 17:45:23', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(73, '2011-05-26 17:46:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(74, '2011-05-26 17:46:08', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(75, '2011-05-26 17:47:33', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(76, '2011-05-26 17:47:38', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(77, '2011-05-26 17:49:51', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(78, '2011-05-26 17:49:53', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(79, '2011-05-26 17:58:08', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(80, '2011-05-26 17:58:11', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(81, '2011-05-26 18:01:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(82, '2011-05-26 18:01:21', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(83, '2011-05-26 22:47:56', 'JSON request', '{"action":"DodijeljenaPoteskoca","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 136),
(84, '2011-05-26 22:48:07', 'JSON request', '{"action":"Dogadjaj","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 136),
(85, '2011-05-26 22:48:32', 'JSON request', '{"action":"Ocjena","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 136),
(86, '2011-05-26 23:00:29', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(87, '2011-05-26 23:03:03', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(88, '2011-05-26 23:03:05', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(89, '2011-05-26 23:04:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(90, '2011-05-26 23:11:33', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(91, '2011-05-26 23:16:58', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(92, '2011-05-26 23:17:04', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(93, '2011-05-26 23:19:29', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(94, '2011-05-26 23:20:28', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(95, '2011-05-26 23:26:17', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(96, '2011-05-26 23:26:26', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(97, '2011-05-26 23:36:57', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 136),
(98, '2011-05-26 23:37:00', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 136),
(99, '2011-05-27 00:03:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(100, '2011-05-27 00:21:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(101, '2011-05-27 00:21:05', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(102, '2011-05-27 00:21:34', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(103, '2011-05-27 00:21:36', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(104, '2011-05-27 00:21:57', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(105, '2011-05-27 00:21:59', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(106, '2011-05-27 00:24:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(107, '2011-05-27 00:24:15', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(108, '2011-05-27 00:28:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(109, '2011-05-27 00:28:14', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(110, '2011-05-27 00:28:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(111, '2011-05-27 00:28:44', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(112, '2011-05-27 00:31:46', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(113, '2011-05-27 00:31:48', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(114, '2011-05-27 00:34:29', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(115, '2011-05-27 00:34:32', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(116, '2011-05-27 00:35:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(117, '2011-05-27 00:35:08', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(118, '2011-05-27 00:41:25', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(119, '2011-05-27 00:41:29', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(120, '2011-05-27 00:42:33', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(121, '2011-05-27 00:42:36', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(122, '2011-05-27 00:42:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(123, '2011-05-27 00:43:06', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(124, '2011-05-27 00:43:43', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(125, '2011-05-27 00:43:46', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(126, '2011-05-27 00:44:10', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(127, '2011-05-27 00:44:16', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(128, '2011-05-27 00:55:05', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(129, '2011-05-27 00:55:09', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(130, '2011-05-27 11:03:41', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(131, '2011-05-27 14:24:45', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(132, '2011-05-27 14:33:52', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(133, '2011-05-27 14:34:20', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(134, '2011-05-27 14:34:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(135, '2011-05-27 14:34:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(136, '2011-05-27 14:35:28', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(137, '2011-05-27 14:36:19', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(138, '2011-05-27 14:36:31', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(139, '2011-05-27 14:39:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(140, '2011-05-27 14:39:15', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(141, '2011-05-27 15:15:50', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(142, '2011-05-27 15:16:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(143, '2011-05-27 15:17:17', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(144, '2011-05-27 15:19:21', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(145, '2011-05-27 15:20:30', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(146, '2011-05-27 15:21:00', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(147, '2011-05-27 15:21:32', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(148, '2011-05-27 15:21:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(149, '2011-05-27 15:21:59', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(150, '2011-05-27 15:22:40', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(151, '2011-05-27 15:23:09', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(152, '2011-05-27 15:25:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(153, '2011-05-27 15:25:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(154, '2011-05-27 15:26:17', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(155, '2011-05-27 15:26:39', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(156, '2011-05-27 15:29:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(157, '2011-05-27 15:29:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(158, '2011-05-27 15:29:22', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(159, '2011-05-27 15:29:36', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(160, '2011-05-27 15:30:29', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(161, '2011-05-27 15:31:09', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(162, '2011-05-27 15:31:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(163, '2011-05-27 15:32:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(164, '2011-05-27 15:33:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(165, '2011-05-27 15:33:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(166, '2011-05-27 15:36:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(167, '2011-05-27 15:38:21', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(168, '2011-05-27 15:40:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(169, '2011-05-27 15:47:21', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(170, '2011-05-27 15:49:27', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(171, '2011-05-27 15:49:31', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(172, '2011-05-27 15:50:26', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(173, '2011-05-27 15:50:40', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(174, '2011-05-27 15:50:59', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(175, '2011-05-27 15:51:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(176, '2011-05-27 15:52:20', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(177, '2011-05-27 15:53:34', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(178, '2011-05-27 15:54:03', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(179, '2011-05-27 15:54:28', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(180, '2011-05-27 15:55:54', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(181, '2011-05-27 15:58:27', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(182, '2011-05-27 15:58:41', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(183, '2011-05-27 15:58:56', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(184, '2011-05-27 15:59:09', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(185, '2011-05-27 16:00:14', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(186, '2011-05-27 16:00:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(187, '2011-05-27 16:02:43', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(188, '2011-05-27 16:03:46', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(189, '2011-05-27 16:04:05', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(190, '2011-05-27 16:04:37', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(191, '2011-05-27 16:05:04', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(192, '2011-05-27 16:08:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(193, '2011-05-27 16:08:50', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(194, '2011-05-27 16:08:55', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(195, '2011-05-27 16:09:05', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(196, '2011-05-27 16:09:08', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(197, '2011-05-27 16:09:09', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(198, '2011-05-27 16:10:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(199, '2011-05-27 16:10:08', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(200, '2011-05-27 16:10:11', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(201, '2011-05-27 16:11:29', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(202, '2011-05-27 16:11:32', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(203, '2011-05-27 16:11:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(204, '2011-05-27 16:11:58', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(205, '2011-05-27 16:14:02', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(206, '2011-05-27 16:14:24', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(207, '2011-05-27 16:14:26', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(208, '2011-05-27 16:14:43', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(209, '2011-05-27 16:14:45', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(210, '2011-05-27 16:15:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(211, '2011-05-27 16:15:21', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(212, '2011-05-27 16:15:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(213, '2011-05-27 16:15:44', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(214, '2011-05-27 16:16:22', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(215, '2011-05-27 16:16:24', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(216, '2011-05-27 16:16:40', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(217, '2011-05-27 16:16:42', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(218, '2011-05-27 16:16:44', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(219, '2011-05-27 16:17:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(220, '2011-05-27 16:17:15', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(221, '2011-05-27 16:17:28', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(222, '2011-05-27 16:17:31', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(223, '2011-05-27 16:18:46', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(224, '2011-05-27 16:18:49', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(225, '2011-05-27 16:19:09', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(226, '2011-05-27 16:19:12', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(227, '2011-05-27 16:23:57', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(228, '2011-05-27 16:24:03', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(229, '2011-05-27 16:24:05', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(230, '2011-05-27 16:24:19', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(231, '2011-05-27 16:24:21', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(232, '2011-05-27 16:24:24', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(233, '2011-05-27 16:24:33', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(234, '2011-05-27 16:24:35', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(235, '2011-05-27 16:25:59', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(236, '2011-05-27 16:26:02', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(237, '2011-05-27 16:26:24', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(238, '2011-05-27 16:26:26', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(239, '2011-05-27 16:27:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(240, '2011-05-27 16:27:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(241, '2011-05-27 16:27:14', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(242, '2011-05-27 16:27:39', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(243, '2011-05-27 16:27:41', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(244, '2011-05-27 16:28:24', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(245, '2011-05-27 16:28:26', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(246, '2011-05-27 16:30:43', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(247, '2011-05-27 16:31:02', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(248, '2011-05-27 16:31:28', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(249, '2011-05-27 16:31:58', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(250, '2011-05-27 16:32:01', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(251, '2011-05-27 16:33:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(252, '2011-05-27 16:34:23', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(253, '2011-05-27 16:34:37', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(254, '2011-05-27 16:35:04', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(255, '2011-05-27 16:35:40', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(256, '2011-05-27 16:36:33', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(257, '2011-05-27 16:36:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(258, '2011-05-27 16:36:57', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(259, '2011-05-27 16:37:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(260, '2011-05-27 16:37:37', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(261, '2011-05-27 16:38:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(262, '2011-05-27 16:38:15', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(263, '2011-05-27 16:38:50', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(264, '2011-05-27 16:38:53', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(265, '2011-05-27 16:39:40', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(266, '2011-05-27 16:40:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(267, '2011-05-27 16:40:20', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(268, '2011-05-27 16:41:54', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(269, '2011-05-27 16:41:55', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(270, '2011-05-27 16:46:46', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(271, '2011-05-27 16:46:48', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(272, '2011-05-27 16:47:05', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(273, '2011-05-27 16:47:08', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(274, '2011-05-27 16:48:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(275, '2011-05-27 16:48:55', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(276, '2011-05-27 16:49:07', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(277, '2011-05-27 16:49:22', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(278, '2011-05-27 16:49:23', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(279, '2011-05-27 16:49:29', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(280, '2011-05-27 16:49:39', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 137),
(281, '2011-05-27 16:50:39', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(282, '2011-05-27 16:50:41', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(283, '2011-05-27 16:51:02', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(284, '2011-05-27 16:51:03', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(285, '2011-05-27 16:51:16', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(286, '2011-05-27 16:51:18', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(287, '2011-05-27 16:51:27', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(288, '2011-05-27 16:53:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(289, '2011-05-27 16:53:02', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(290, '2011-05-27 16:53:30', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(291, '2011-05-27 16:53:31', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(292, '2011-05-27 16:53:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(293, '2011-05-27 16:53:49', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(294, '2011-05-27 16:54:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(295, '2011-05-27 16:54:02', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(296, '2011-05-27 16:54:50', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(297, '2011-05-27 16:54:51', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(298, '2011-05-27 16:55:16', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(299, '2011-05-27 16:55:18', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(300, '2011-05-27 16:55:37', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(301, '2011-05-27 16:55:38', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(302, '2011-05-27 16:55:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(303, '2011-05-27 16:55:48', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(304, '2011-05-27 16:56:37', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(305, '2011-05-27 16:56:38', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(306, '2011-05-27 16:56:49', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(307, '2011-05-27 16:56:50', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(308, '2011-05-27 16:57:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(309, '2011-05-27 16:57:13', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(310, '2011-05-27 16:57:22', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(311, '2011-05-27 16:57:23', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(312, '2011-05-27 16:57:37', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(313, '2011-05-27 16:57:38', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(314, '2011-05-27 16:57:48', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(315, '2011-05-27 16:57:49', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(316, '2011-05-27 16:58:08', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(317, '2011-05-27 16:58:10', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(318, '2011-05-27 16:58:20', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(319, '2011-05-27 16:58:21', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(320, '2011-05-27 16:58:32', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(321, '2011-05-27 16:58:45', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(322, '2011-05-27 16:58:46', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(323, '2011-05-27 16:59:15', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(324, '2011-05-27 16:59:16', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(325, '2011-05-27 16:59:26', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(326, '2011-05-27 16:59:27', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(327, '2011-05-27 16:59:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(328, '2011-05-27 16:59:48', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(329, '2011-05-27 16:59:55', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(330, '2011-05-27 17:00:00', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 137),
(331, '2011-05-27 17:00:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(332, '2011-05-27 17:00:48', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(333, '2011-05-27 17:01:34', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137);
INSERT INTO `debug` (`id`, `time`, `title`, `message`, `file`, `line`) VALUES
(334, '2011-05-27 17:01:35', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(335, '2011-05-27 17:01:50', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(336, '2011-05-27 17:01:51', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(337, '2011-05-27 17:02:41', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(338, '2011-05-27 17:02:43', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(339, '2011-05-27 17:02:54', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(340, '2011-05-27 17:02:55', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(341, '2011-05-27 17:03:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(342, '2011-05-27 17:03:14', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(343, '2011-05-27 17:03:20', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(344, '2011-05-27 17:03:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(345, '2011-05-27 17:03:43', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(346, '2011-05-27 17:03:58', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(347, '2011-05-27 17:03:59', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(348, '2011-05-27 17:04:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(349, '2011-05-27 17:04:13', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(350, '2011-05-27 17:04:24', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(351, '2011-05-27 17:04:25', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(352, '2011-05-27 17:05:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(353, '2011-05-27 17:05:56', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(354, '2011-05-27 17:06:04', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(355, '2011-05-27 17:06:05', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(356, '2011-05-27 17:06:13', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(357, '2011-05-27 17:07:02', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(358, '2011-05-27 17:07:03', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(359, '2011-05-27 17:07:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(360, '2011-05-27 17:07:12', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(361, '2011-05-27 17:07:20', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(362, '2011-05-27 17:07:21', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(363, '2011-05-27 17:07:31', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(364, '2011-05-27 17:07:32', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(365, '2011-05-27 17:07:35', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(366, '2011-05-27 17:07:54', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(367, '2011-05-27 17:07:55', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(368, '2011-05-27 17:08:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(369, '2011-05-27 17:08:07', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(370, '2011-05-27 17:08:15', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(371, '2011-05-27 17:08:17', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(372, '2011-05-27 17:08:27', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(373, '2011-05-27 17:08:48', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(374, '2011-05-27 17:08:49', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(375, '2011-05-27 17:09:31', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(376, '2011-05-27 17:09:32', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(377, '2011-05-27 17:09:48', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(378, '2011-05-27 17:09:49', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(379, '2011-05-27 17:09:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(380, '2011-05-27 17:09:56', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(381, '2011-05-27 17:10:44', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(382, '2011-05-27 17:10:45', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(383, '2011-05-27 17:10:52', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(384, '2011-05-27 17:10:53', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(385, '2011-05-27 17:11:14', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(386, '2011-05-27 17:11:15', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(387, '2011-05-27 17:11:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(388, '2011-05-27 17:11:37', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(389, '2011-05-27 17:13:17', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(390, '2011-05-27 17:13:20', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(391, '2011-05-27 17:13:22', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(392, '2011-05-27 17:14:17', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(393, '2011-05-27 17:14:18', 'JSON request', '{"action":"Adresa","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(394, '2011-05-27 17:14:21', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(395, '2011-05-27 17:17:33', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 137),
(396, '2011-05-27 17:18:29', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 137),
(397, '2011-05-27 17:18:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(398, '2011-05-27 17:18:53', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(399, '2011-05-27 17:18:54', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(400, '2011-05-27 17:20:17', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(401, '2011-05-27 17:20:20', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(402, '2011-05-27 17:20:29', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(403, '2011-05-27 17:21:03', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(404, '2011-05-27 17:21:05', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(405, '2011-05-27 17:21:14', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(406, '2011-05-27 17:21:19', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 137),
(407, '2011-05-27 17:21:41', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(408, '2011-05-27 17:21:43', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(409, '2011-05-27 17:21:48', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(410, '2011-05-27 17:22:56', 'JSON request', '[{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}]', '/var/www/Athene/ext.php', 137),
(411, '2011-05-27 17:22:58', 'JSON request', '[{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":4}]', '/var/www/Athene/ext.php', 137),
(412, '2011-05-27 17:23:06', 'JSON request', '[{"action":"User","method":"getAll","data":null,"type":"rpc","tid":5},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":6}]', '/var/www/Athene/ext.php', 137),
(413, '2011-05-27 17:24:27', 'JSON request', '[{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}]', '/var/www/Athene/ext.php', 137),
(414, '2011-05-27 17:24:31', 'JSON request', '[{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":4}]', '/var/www/Athene/ext.php', 137),
(415, '2011-05-27 17:24:36', 'JSON request', '[{"action":"User","method":"getAll","data":null,"type":"rpc","tid":5},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":6}]', '/var/www/Athene/ext.php', 137),
(416, '2011-05-27 17:24:48', 'JSON request', '[{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}]', '/var/www/Athene/ext.php', 137),
(417, '2011-05-27 17:24:50', 'JSON request', '[{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3},{"action":"User","method":"getAll","data":null,"type":"rpc","tid":4}]', '/var/www/Athene/ext.php', 137),
(418, '2011-05-27 17:25:12', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(419, '2011-05-27 17:25:15', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(420, '2011-05-27 17:25:20', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(421, '2011-05-27 17:25:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(422, '2011-05-27 17:26:58', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(423, '2011-05-27 17:27:14', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(424, '2011-05-27 17:27:46', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(425, '2011-05-27 17:27:49', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(426, '2011-05-27 17:28:08', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(427, '2011-05-27 17:28:12', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(428, '2011-05-27 17:46:11', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(429, '2011-05-27 17:46:15', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(430, '2011-05-27 17:47:05', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(431, '2011-05-27 17:47:43', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(432, '2011-05-27 17:47:45', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(433, '2011-05-27 17:48:05', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(434, '2011-05-27 17:49:24', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 137),
(435, '2011-05-27 17:49:27', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 137),
(436, '2011-05-27 17:49:33', 'JSON request', '{"action":"VrstaPutnika","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 137),
(437, '2011-05-27 17:49:34', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 137),
(438, '2011-05-27 17:49:35', 'JSON request', '{"action":"Titula","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 137),
(439, '2011-05-27 17:49:37', 'JSON request', '{"action":"SlobodnaAktivnost","method":"getAll","data":null,"type":"rpc","tid":6}', '/var/www/Athene/ext.php', 137),
(440, '2011-05-27 17:49:37', 'JSON request', '{"action":"RazlogBoravista","method":"getAll","data":null,"type":"rpc","tid":7}', '/var/www/Athene/ext.php', 137),
(441, '2011-05-27 17:51:48', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":8}', '/var/www/Athene/ext.php', 137),
(442, '2011-05-27 18:02:47', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":9}', '/var/www/Athene/ext.php', 137),
(443, '2011-05-27 18:02:52', 'JSON request', '{"action":"Poteskoca","method":"getAll","data":null,"type":"rpc","tid":10}', '/var/www/Athene/ext.php', 137),
(444, '2011-05-27 18:03:05', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":11}', '/var/www/Athene/ext.php', 137),
(445, '2011-05-27 18:26:28', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 144),
(446, '2011-05-27 18:26:32', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 144),
(447, '2011-05-27 18:46:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(448, '2011-05-27 18:46:09', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(449, '2011-05-27 18:50:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(450, '2011-05-27 18:50:04', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(451, '2011-05-27 18:50:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(452, '2011-05-27 18:50:58', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(453, '2011-05-27 18:51:22', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(454, '2011-05-27 18:51:25', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(455, '2011-05-27 18:57:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(456, '2011-05-27 18:57:58', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(457, '2011-05-27 18:58:41', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(458, '2011-05-27 18:58:43', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(459, '2011-05-27 18:59:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(460, '2011-05-27 18:59:37', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(461, '2011-05-27 18:59:39', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(462, '2011-05-27 19:00:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(463, '2011-05-27 19:00:08', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(464, '2011-05-27 19:00:28', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(465, '2011-05-27 19:00:30', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(466, '2011-05-27 19:01:48', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(467, '2011-05-27 19:01:52', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(468, '2011-05-27 19:04:29', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(469, '2011-05-27 19:04:31', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(470, '2011-05-27 19:05:02', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(471, '2011-05-27 19:05:05', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(472, '2011-05-27 19:12:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(473, '2011-05-27 19:12:15', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(474, '2011-05-27 19:12:45', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(475, '2011-05-27 19:12:47', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(476, '2011-05-27 19:19:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(477, '2011-05-27 19:19:16', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(478, '2011-05-27 19:21:19', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(479, '2011-05-27 19:21:21', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(480, '2011-05-27 19:21:52', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(481, '2011-05-27 19:21:54', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(482, '2011-05-27 19:22:16', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(483, '2011-05-27 19:22:18', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(484, '2011-05-27 19:25:20', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(485, '2011-05-27 19:25:23', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(486, '2011-05-27 19:26:31', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(487, '2011-05-27 19:26:33', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(488, '2011-05-27 19:26:59', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(489, '2011-05-27 19:27:01', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(490, '2011-05-27 19:28:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(491, '2011-05-27 19:28:49', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(492, '2011-05-27 19:32:35', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(493, '2011-05-27 19:32:38', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(494, '2011-05-27 19:33:15', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(495, '2011-05-27 19:33:17', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(496, '2011-05-27 19:34:42', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(497, '2011-05-27 19:34:44', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(498, '2011-05-27 19:34:47', 'JSON request', '{"action":"User","method":"delete","data":["15"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(499, '2011-05-27 19:38:52', 'JSON request', '{"action":"User","method":"delete","data":["15"],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 158),
(500, '2011-05-27 19:39:00', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(501, '2011-05-27 19:39:02', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(502, '2011-05-27 19:39:10', 'JSON request', '{"action":"User","method":"delete","data":["5"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(503, '2011-05-27 19:46:41', 'JSON request', '{"action":"User","method":"delete","data":["7"],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 158),
(504, '2011-05-27 19:48:02', 'JSON request', '{"action":"User","method":"delete","data":["9"],"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 158),
(505, '2011-05-27 19:48:28', 'JSON request', '{"action":"User","method":"delete","data":["6"],"type":"rpc","tid":6}', '/var/www/Athene/ext.php', 158),
(506, '2011-05-27 19:53:18', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(507, '2011-05-27 19:53:21', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(508, '2011-05-27 19:53:24', 'JSON request', '{"action":"User","method":"delete","data":["10"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(509, '2011-05-27 19:54:40', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(510, '2011-05-27 19:54:49', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(511, '2011-05-27 19:54:51', 'JSON request', '{"action":"User","method":"delete","data":["8"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(512, '2011-05-27 19:57:00', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(513, '2011-05-27 19:57:03', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(514, '2011-05-27 19:57:05', 'JSON request', '{"action":"User","method":"delete","data":["12"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(515, '2011-05-27 19:59:57', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(516, '2011-05-27 20:00:03', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(517, '2011-05-27 20:00:05', 'JSON request', '{"action":"User","method":"delete","data":["16"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(518, '2011-05-28 11:22:44', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(519, '2011-05-28 11:22:52', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(520, '2011-05-28 11:23:17', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(521, '2011-05-28 11:24:36', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(522, '2011-05-28 11:24:40', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(523, '2011-05-28 11:25:48', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(524, '2011-05-28 11:25:51', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(525, '2011-05-28 11:29:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(526, '2011-05-28 11:29:03', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(527, '2011-05-28 11:34:21', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(528, '2011-05-28 11:34:24', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(529, '2011-05-28 11:34:44', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(530, '2011-05-28 11:34:46', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(531, '2011-05-28 11:36:33', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(532, '2011-05-28 11:36:36', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(533, '2011-05-28 11:38:57', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(534, '2011-05-28 11:38:59', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(535, '2011-05-28 11:40:47', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(536, '2011-05-28 11:40:49', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(537, '2011-05-28 11:40:57', 'JSON request', '{"action":"User","method":"delete","data":["11"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(538, '2011-05-28 11:42:37', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(539, '2011-05-28 11:42:40', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(540, '2011-05-28 11:49:59', 'JSON request', '{"action":"Help","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(541, '2011-05-28 11:50:06', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 158),
(542, '2011-05-28 11:50:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(543, '2011-05-28 11:50:57', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(544, '2011-05-28 11:51:39', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(545, '2011-05-28 11:51:43', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(546, '2011-05-28 12:56:27', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(547, '2011-05-28 12:56:32', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(548, '2011-05-28 12:56:55', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(549, '2011-05-28 12:56:57', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(550, '2011-05-28 12:57:01', 'JSON request', '{"action":"User","method":"delete","data":["17"],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(551, '2011-05-28 12:59:15', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(552, '2011-05-28 13:05:53', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(553, '2011-05-28 13:08:36', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(554, '2011-05-28 13:09:06', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(555, '2011-05-28 13:11:04', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(556, '2011-05-28 13:11:05', 'JSON request', '{"action":"Mjesto","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(557, '2011-05-28 13:12:37', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(558, '2011-05-28 13:13:32', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(559, '2011-05-28 13:14:00', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(560, '2011-05-28 13:15:13', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(561, '2011-05-28 13:16:48', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(562, '2011-05-28 13:17:01', 'JSON request', '{"action":"Drzava","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(563, '2011-05-28 15:33:28', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(564, '2011-05-28 15:42:42', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(565, '2011-05-28 15:43:40', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(566, '2011-05-28 15:45:53', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(567, '2011-05-28 15:48:11', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(568, '2011-05-28 16:04:00', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(569, '2011-05-28 16:07:56', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(570, '2011-05-28 16:08:56', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(571, '2011-05-28 16:09:29', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(572, '2011-05-28 16:09:43', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(573, '2011-05-28 16:10:55', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(574, '2011-05-28 16:14:08', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(575, '2011-05-28 16:14:48', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(576, '2011-05-28 16:15:25', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(577, '2011-05-28 16:20:58', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(578, '2011-05-28 16:26:21', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(579, '2011-05-28 16:26:36', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(580, '2011-05-28 16:26:39', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(581, '2011-05-28 16:28:02', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(582, '2011-05-28 16:28:32', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(583, '2011-05-28 16:32:20', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(584, '2011-05-28 16:32:24', 'JSON request', '{"action":"Group","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(585, '2011-05-28 16:34:00', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(586, '2011-05-29 13:15:00', 'JSON request', '{"action":"User","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(587, '2011-05-29 14:16:09', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(588, '2011-05-29 14:21:38', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(589, '2011-05-29 14:21:46', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(590, '2011-05-29 14:21:54', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 158),
(591, '2011-05-29 14:22:14', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 158),
(592, '2011-05-29 14:22:38', 'JSON request', '{"action":"Ucenik","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 158),
(593, '2011-05-29 14:25:14', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(594, '2011-05-29 14:26:50', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(595, '2011-05-29 14:28:49', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(596, '2011-05-29 14:29:46', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(597, '2011-05-29 14:30:21', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(598, '2011-05-29 14:34:41', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(599, '2011-05-29 14:36:03', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(600, '2011-05-29 14:36:06', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(601, '2011-05-29 14:39:25', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(602, '2011-05-29 14:39:28', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(603, '2011-05-29 14:39:53', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(604, '2011-05-29 14:39:56', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(605, '2011-05-29 14:40:12', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(606, '2011-05-29 14:40:14', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(607, '2011-05-29 14:41:41', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(608, '2011-05-29 14:42:11', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(609, '2011-05-29 14:42:31', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 158),
(610, '2011-05-29 14:42:52', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 158),
(611, '2011-05-29 14:47:40', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(612, '2011-05-29 14:47:59', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(613, '2011-05-29 14:48:53', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(614, '2011-05-29 14:49:16', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(615, '2011-05-29 14:49:51', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(616, '2011-05-29 14:52:06', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(617, '2011-05-29 14:53:17', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(618, '2011-05-29 14:54:18', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(619, '2011-05-29 14:56:55', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(620, '2011-05-29 15:00:39', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(621, '2011-05-29 15:01:11', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(622, '2011-05-29 15:01:45', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(623, '2011-05-29 15:04:04', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(624, '2011-05-29 15:04:39', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(625, '2011-05-29 15:05:10', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(626, '2011-05-29 15:06:30', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20},null],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(627, '2011-05-29 15:07:31', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":{"params":{"start":0,"limit":20}},"start":null,"limit":20},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(628, '2011-05-29 15:08:09', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":25},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(629, '2011-05-29 15:08:32', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":25},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(630, '2011-05-29 15:09:01', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":25},null],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(631, '2011-05-29 15:09:57', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":25}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(632, '2011-05-29 15:10:29', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(633, '2011-05-29 15:10:45', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(634, '2011-05-29 15:10:47', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(635, '2011-05-29 15:11:07', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(636, '2011-05-29 15:13:27', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(637, '2011-05-29 15:14:07', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(638, '2011-05-29 15:14:08', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(639, '2011-05-29 15:14:10', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(640, '2011-05-29 15:14:38', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(641, '2011-05-29 15:15:18', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(642, '2011-05-29 15:15:40', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(643, '2011-05-29 15:16:01', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(644, '2011-05-29 15:17:16', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(645, '2011-05-29 15:18:58', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(646, '2011-05-29 15:19:49', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(647, '2011-05-29 15:20:02', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(648, '2011-05-29 15:20:16', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(649, '2011-05-29 15:21:14', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(650, '2011-05-29 15:21:21', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162);
INSERT INTO `debug` (`id`, `time`, `title`, `message`, `file`, `line`) VALUES
(651, '2011-05-29 15:22:30', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(652, '2011-05-29 15:22:43', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(653, '2011-05-29 15:23:07', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(654, '2011-05-29 15:23:12', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(655, '2011-05-29 15:23:18', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(656, '2011-05-29 15:23:19', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":4,"start":60,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(657, '2011-05-29 15:24:08', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":5,"start":80,"limit":20}],"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(658, '2011-05-29 15:24:11', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":6,"start":100,"limit":20}],"type":"rpc","tid":6}', '/var/www/Athene/ext.php', 162),
(659, '2011-05-29 15:25:54', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(660, '2011-05-29 15:25:55', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(661, '2011-05-29 15:25:56', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(662, '2011-05-29 15:26:02', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":50,"start":980,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(663, '2011-05-29 15:34:26', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(664, '2011-05-29 15:34:49', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(665, '2011-05-29 15:39:53', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(666, '2011-05-29 15:40:13', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(667, '2011-05-29 16:02:00', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(668, '2011-05-29 16:03:42', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(669, '2011-05-29 16:04:03', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(670, '2011-05-29 16:04:28', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(671, '2011-05-29 16:07:16', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(672, '2011-05-29 16:11:53', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(673, '2011-05-29 16:11:59', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":4,"start":60,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(674, '2011-05-29 16:12:09', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(675, '2011-05-29 16:12:58', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(676, '2011-05-29 16:19:25', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(677, '2011-05-29 16:19:42', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(678, '2011-05-29 16:21:09', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":4,"start":60,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(679, '2011-05-29 16:21:55', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":5,"start":80,"limit":20}],"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(680, '2011-05-29 18:12:05', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(681, '2011-05-29 18:12:58', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(682, '2011-05-29 18:13:04', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(683, '2011-05-29 18:13:08', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(684, '2011-05-29 18:13:37', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(685, '2011-05-29 18:13:39', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20}],"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(686, '2011-05-29 18:13:44', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":6}', '/var/www/Athene/ext.php', 162),
(687, '2011-05-29 18:13:45', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":7}', '/var/www/Athene/ext.php', 162),
(688, '2011-05-29 18:14:28', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(689, '2011-05-29 18:24:11', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(690, '2011-05-29 18:30:18', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(691, '2011-05-29 18:30:34', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(692, '2011-05-29 18:31:45', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":4,"start":60,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(693, '2011-05-29 18:32:35', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":5,"start":80,"limit":20}],"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(694, '2011-05-29 18:34:09', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":6,"start":100,"limit":20}],"type":"rpc","tid":6}', '/var/www/Athene/ext.php', 162),
(695, '2011-05-29 18:34:35', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(696, '2011-05-29 18:34:43', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(697, '2011-05-29 18:37:59', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(698, '2011-05-29 18:40:02', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":4,"start":60,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(699, '2011-05-29 18:41:14', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(700, '2011-05-29 18:41:28', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(701, '2011-05-29 18:42:17', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(702, '2011-05-29 18:45:05', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(703, '2011-05-29 18:47:00', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(704, '2011-05-29 18:47:13', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(705, '2011-05-29 18:47:35', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(706, '2011-05-29 18:48:11', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(707, '2011-05-29 18:48:13', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(708, '2011-05-29 18:49:23', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(709, '2011-05-29 18:49:29', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(710, '2011-05-29 18:49:37', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(711, '2011-05-29 18:50:00', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(712, '2011-05-29 18:50:03', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(713, '2011-05-29 18:50:05', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(714, '2011-05-29 18:50:10', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(715, '2011-05-29 18:50:23', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(716, '2011-05-29 18:50:34', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(717, '2011-05-29 18:50:44', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(718, '2011-05-29 18:50:53', 'JSON request', '{"action":"Razred","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(719, '2011-05-29 18:50:55', 'JSON request', '{"action":"Ucitelj","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(720, '2011-05-29 18:51:01', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(721, '2011-05-29 18:51:46', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(722, '2011-05-29 18:52:23', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(723, '2011-05-29 19:01:27', 'JSON request', '{"action":"SkolskaGodina","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(724, '2011-05-29 19:01:39', 'JSON request', '{"action":"Mjesto","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(725, '2011-05-29 19:01:40', 'JSON request', '{"action":"Skola","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(726, '2011-05-29 19:02:01', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(727, '2011-05-29 19:02:17', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(728, '2011-05-29 19:07:32', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(729, '2011-05-29 19:07:51', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(730, '2011-05-29 19:07:53', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(731, '2011-05-29 19:07:55', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(732, '2011-05-29 19:08:19', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":5}', '/var/www/Athene/ext.php', 162),
(733, '2011-05-29 19:11:55', 'JSON request', '{"action":"Mjesto","method":"getAll","data":null,"type":"rpc","tid":6}', '/var/www/Athene/ext.php', 162),
(734, '2011-05-29 19:11:55', 'JSON request', '{"action":"Skola","method":"getAll","data":null,"type":"rpc","tid":7}', '/var/www/Athene/ext.php', 162),
(735, '2011-05-29 19:13:36', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":8}', '/var/www/Athene/ext.php', 162),
(736, '2011-05-29 19:23:05', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(737, '2011-05-29 19:27:31', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(738, '2011-05-29 19:28:37', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(739, '2011-05-29 19:29:00', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(740, '2011-05-29 19:29:49', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(741, '2011-05-29 19:30:05', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(742, '2011-05-29 19:31:03', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(743, '2011-05-29 19:31:26', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(744, '2011-05-29 19:31:57', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(745, '2011-05-29 19:32:23', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(746, '2011-05-29 19:33:11', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(747, '2011-05-29 19:34:02', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(748, '2011-05-29 19:34:04', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":null}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(749, '2011-05-29 19:34:04', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":null}]}],"type":"rpc","tid":5}]', '/var/www/Athene/ext.php', 162),
(750, '2011-05-29 19:35:02', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(751, '2011-05-29 19:35:04', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(752, '2011-05-29 19:38:30', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"ko"}]}],"type":"rpc","tid":5}]', '/var/www/Athene/ext.php', 162),
(753, '2011-05-29 19:42:59', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":6},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kor"}]}],"type":"rpc","tid":7}]', '/var/www/Athene/ext.php', 162),
(754, '2011-05-29 19:43:31', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":8},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kora"}]}],"type":"rpc","tid":9}]', '/var/www/Athene/ext.php', 162),
(755, '2011-05-29 19:44:10', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":10},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kor"}]}],"type":"rpc","tid":11}]', '/var/www/Athene/ext.php', 162),
(756, '2011-05-29 19:44:49', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":12},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"ko"}]}],"type":"rpc","tid":13}]', '/var/www/Athene/ext.php', 162),
(757, '2011-05-29 19:45:30', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(758, '2011-05-29 19:45:41', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(759, '2011-05-29 19:46:43', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(760, '2011-05-29 19:46:50', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(761, '2011-05-29 19:46:56', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"},{"property":"prezime","value":"ko"}]}],"type":"rpc","tid":3}', '/var/www/Athene/ext.php', 162),
(762, '2011-05-29 19:49:35', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(763, '2011-05-29 19:50:05', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(764, '2011-05-29 19:50:07', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(765, '2011-05-29 19:50:16', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"ko"}]}],"type":"rpc","tid":5}]', '/var/www/Athene/ext.php', 162),
(766, '2011-05-29 19:50:18', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":6},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kor"}]}],"type":"rpc","tid":7}]', '/var/www/Athene/ext.php', 162),
(767, '2011-05-29 19:50:35', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(768, '2011-05-29 19:50:39', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"m"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(769, '2011-05-29 19:53:51', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(770, '2011-05-29 19:53:53', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"m"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(771, '2011-05-29 19:54:17', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"ma"}]}],"type":"rpc","tid":5}]', '/var/www/Athene/ext.php', 162),
(772, '2011-05-29 19:55:08', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":6},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"m"}]}],"type":"rpc","tid":7}]', '/var/www/Athene/ext.php', 162),
(773, '2011-05-29 19:55:08', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":8},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":""}]}],"type":"rpc","tid":9}]', '/var/www/Athene/ext.php', 162),
(774, '2011-05-29 19:57:07', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(775, '2011-05-29 19:57:11', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"m"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(776, '2011-05-29 19:57:13', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"ma"}]}],"type":"rpc","tid":5}]', '/var/www/Athene/ext.php', 162),
(777, '2011-05-29 19:57:19', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":6},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"mar"}]}],"type":"rpc","tid":7}]', '/var/www/Athene/ext.php', 162),
(778, '2011-05-29 19:57:21', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":8},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"mari"}]}],"type":"rpc","tid":9}]', '/var/www/Athene/ext.php', 162),
(779, '2011-05-29 19:57:23', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":10},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":11}]', '/var/www/Athene/ext.php', 162),
(780, '2011-05-29 19:57:36', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":12}', '/var/www/Athene/ext.php', 162),
(781, '2011-05-29 19:57:39', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":13}', '/var/www/Athene/ext.php', 162),
(782, '2011-05-29 19:57:42', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":14}', '/var/www/Athene/ext.php', 162),
(783, '2011-05-29 19:57:43', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":15}', '/var/www/Athene/ext.php', 162),
(784, '2011-05-29 19:57:44', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":4,"start":60,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":16}', '/var/www/Athene/ext.php', 162),
(785, '2011-05-29 19:57:45', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":5,"start":80,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":17}', '/var/www/Athene/ext.php', 162),
(786, '2011-05-29 19:57:47', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":4,"start":60,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":18}', '/var/www/Athene/ext.php', 162),
(787, '2011-05-29 19:57:47', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":3,"start":40,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":19}', '/var/www/Athene/ext.php', 162),
(788, '2011-05-29 19:57:47', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":20}', '/var/www/Athene/ext.php', 162),
(789, '2011-05-29 19:57:47', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"mariu0107"}]}],"type":"rpc","tid":21}', '/var/www/Athene/ext.php', 162),
(790, '2011-05-29 19:58:55', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(791, '2011-05-29 19:59:21', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(792, '2011-05-29 19:59:43', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(793, '2011-05-29 19:59:48', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(794, '2011-05-29 20:00:19', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(795, '2011-05-29 20:00:38', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(796, '2011-05-29 20:01:34', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(797, '2011-05-29 20:01:34', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''page'' => 1,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(798, '2011-05-29 20:01:39', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(799, '2011-05-29 20:01:39', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(800, '2011-05-29 20:01:39', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''k'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(801, '2011-05-29 20:02:02', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"ko"}]}],"type":"rpc","tid":5}]', '/var/www/Athene/ext.php', 162),
(802, '2011-05-29 20:02:02', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(803, '2011-05-29 20:02:02', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''ko'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(804, '2011-05-29 20:02:51', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":6},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kor"}]}],"type":"rpc","tid":7}]', '/var/www/Athene/ext.php', 162),
(805, '2011-05-29 20:03:16', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":8},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kora"}]}],"type":"rpc","tid":9}]', '/var/www/Athene/ext.php', 162),
(806, '2011-05-29 20:03:16', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(807, '2011-05-29 20:03:16', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(808, '2011-05-29 20:03:16', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''kora'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(809, '2011-05-29 20:03:16', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(810, '2011-05-29 20:03:34', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":10},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kor"}]}],"type":"rpc","tid":11}]', '/var/www/Athene/ext.php', 162),
(811, '2011-05-29 20:03:34', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(812, '2011-05-29 20:03:34', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(813, '2011-05-29 20:03:34', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''kor'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(814, '2011-05-29 20:03:34', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(815, '2011-05-29 20:03:46', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":12},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kora"}]}],"type":"rpc","tid":13}]', '/var/www/Athene/ext.php', 162),
(816, '2011-05-29 20:03:46', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(817, '2011-05-29 20:03:46', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(818, '2011-05-29 20:03:46', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''kora'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(819, '2011-05-29 20:03:46', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(820, '2011-05-29 20:04:54', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":14},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"korac"}]}],"type":"rpc","tid":15}]', '/var/www/Athene/ext.php', 162),
(821, '2011-05-29 20:04:54', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(822, '2011-05-29 20:04:54', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(823, '2011-05-29 20:04:54', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''korac'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(824, '2011-05-29 20:04:54', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''korac%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(825, '2011-05-29 20:05:04', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"korac"}]}],"type":"rpc","tid":16}', '/var/www/Athene/ext.php', 162),
(826, '2011-05-29 20:05:04', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''korac'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(827, '2011-05-29 20:05:04', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''korac%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(828, '2011-05-29 20:05:21', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":17},{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"kora"}]}],"type":"rpc","tid":18}]', '/var/www/Athene/ext.php', 162),
(829, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(830, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(831, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''kora'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(832, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''kora%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(833, '2011-05-29 20:05:21', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":19},{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"kor"}]}],"type":"rpc","tid":20},{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":21},{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"ko"}]}],"type":"rpc","tid":22}]', '/var/www/Athene/ext.php', 162),
(834, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(835, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(836, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''kor'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(837, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''kor%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(838, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(839, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(840, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''ko'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(841, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''ko%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(842, '2011-05-29 20:05:21', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":23},{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":24}]', '/var/www/Athene/ext.php', 162),
(843, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(844, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(845, '2011-05-29 20:05:21', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''k'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(846, '2011-05-29 20:05:21', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''k%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(847, '2011-05-29 20:05:22', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20}],"type":"rpc","tid":25},{"action":"Ucenik","method":"getAll","data":[{"page":2,"start":20,"limit":20,"filter":[{"property":"prezime","value":""}]}],"type":"rpc","tid":26}]', '/var/www/Athene/ext.php', 162),
(848, '2011-05-29 20:05:22', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(849, '2011-05-29 20:05:22', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(850, '2011-05-29 20:05:22', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 2,\n     ''start'' => 20,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => '''',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(851, '2011-05-29 20:05:22', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(852, '2011-05-29 20:06:09', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(853, '2011-05-29 20:06:09', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''page'' => 1,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(854, '2011-05-29 20:06:09', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(855, '2011-05-29 20:06:14', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":2},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":3}]', '/var/www/Athene/ext.php', 162),
(856, '2011-05-29 20:06:14', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(857, '2011-05-29 20:06:14', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(858, '2011-05-29 20:06:14', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''k'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(859, '2011-05-29 20:06:14', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''k%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(860, '2011-05-29 20:06:18', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":4}', '/var/www/Athene/ext.php', 162),
(861, '2011-05-29 20:06:18', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(862, '2011-05-29 20:06:18', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(863, '2011-05-29 20:07:19', 'JSON request', '{"action":"Ucenik","method":"getAll","data":[{"start":0,"limit":20,"page":1}],"type":"rpc","tid":1}', '/var/www/Athene/ext.php', 162),
(864, '2011-05-29 20:07:19', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''page'' => 1,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(865, '2011-05-29 20:07:19', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(866, '2011-05-29 20:07:29', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":2}', '/var/www/Athene/ext.php', 162),
(867, '2011-05-29 20:07:29', 'Params for total', 'NULL', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(868, '2011-05-29 20:07:29', 'Count query', 'SELECT COUNT(*) AS total FROM osz_zanimanja', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(869, '2011-05-29 20:08:42', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":3},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"k"}]}],"type":"rpc","tid":4}]', '/var/www/Athene/ext.php', 162),
(870, '2011-05-29 20:08:42', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(871, '2011-05-29 20:08:42', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(872, '2011-05-29 20:08:42', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''k'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(873, '2011-05-29 20:08:42', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''k%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(874, '2011-05-29 20:08:52', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":5},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"ko"}]}],"type":"rpc","tid":6}]', '/var/www/Athene/ext.php', 162),
(875, '2011-05-29 20:08:52', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(876, '2011-05-29 20:08:52', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(877, '2011-05-29 20:08:52', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''ko'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(878, '2011-05-29 20:08:52', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''ko%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(879, '2011-05-29 20:08:55', 'JSON request', '[{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20}],"type":"rpc","tid":7},{"action":"Ucenik","method":"getAll","data":[{"page":1,"start":0,"limit":20,"filter":[{"property":"prezime","value":"kor"}]}],"type":"rpc","tid":8}]', '/var/www/Athene/ext.php', 162);
INSERT INTO `debug` (`id`, `time`, `title`, `message`, `file`, `line`) VALUES
(880, '2011-05-29 20:08:55', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(881, '2011-05-29 20:08:55', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(882, '2011-05-29 20:08:55', 'Params for total', 'array (\n  0 => \n  stdClass::__set_state(array(\n     ''page'' => 1,\n     ''start'' => 0,\n     ''limit'' => 20,\n     ''filter'' => \n    array (\n      0 => \n      stdClass::__set_state(array(\n         ''property'' => ''prezime'',\n         ''value'' => ''kor'',\n      )),\n    ),\n  )),\n)', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(883, '2011-05-29 20:08:55', 'Count query', 'SELECT COUNT(*) AS total FROM osz_ucenik WHERE prezime LIKE ''kor%''', '/var/www/Athene/lib/Athene/Model/Model.php', 103),
(884, '2011-05-29 20:09:09', 'JSON request', '{"action":"Zanimanje","method":"getAll","data":null,"type":"rpc","tid":9}', '/var/www/Athene/ext.php', 162),
(885, '2011-05-29 20:09:09', 'Params for total', 'NULL', '/var/www/Athene/lib/Athene/Model/Model.php', 99),
(886, '2011-05-29 20:09:09', 'Count query', 'SELECT COUNT(*) AS total FROM osz_zanimanja', '/var/www/Athene/lib/Athene/Model/Model.php', 103);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2011-05-15 22:52:18', 1, 17, '1', 'Hrvatska', 1, ''),
(2, '2011-05-15 22:52:20', 1, 18, '1', 'Rijeka', 1, ''),
(3, '2011-05-15 22:52:30', 1, 35, '1', 'Hrvat', 1, ''),
(4, '2011-05-15 22:54:02', 1, 15, '12345678901', 'Pero Perić', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'message', 'auth', 'message'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'site', 'sites', 'site'),
(8, 'log entry', 'admin', 'logentry'),
(9, 'fk model', 'django', 'fkmodel'),
(10, 'model', 'django', 'model'),
(11, 'ext direct store model', 'django', 'extdirectstoremodel'),
(12, 'meta model', 'django', 'metamodel'),
(13, 'meta model custom field', 'django', 'metamodelcustomfield'),
(14, 'perm model', 'django', 'permmodel'),
(15, 'učenik', 'osz', 'ucenik'),
(16, 'škola', 'osz', 'skola'),
(17, 'država', 'osz', 'drzava'),
(18, 'mjesto', 'osz', 'mjesto'),
(19, 'razredno odjeljenje', 'osz', 'razrednoodjeljenje'),
(20, 'predmet razrednog odjeljenja', 'osz', 'predmetrazrednogodjeljenja'),
(21, 'predmet', 'osz', 'predmet'),
(22, 'ocjena', 'osz', 'ocjena'),
(23, 'predmetna cjelina', 'osz', 'predmetnacjelina'),
(24, 'učitelj', 'osz', 'ucitelj'),
(25, 'školska godina', 'osz', 'skolskagodina'),
(26, 'titula', 'osz', 'titula'),
(27, 'izostanak', 'osz', 'izostanak'),
(28, 'događaj', 'osz', 'dogadjaj'),
(29, 'vrsta poteškoće', 'osz', 'vrstapoteskoce'),
(30, 'dodijeljena poteškoća', 'osz', 'dodijeljenapoteskoca'),
(31, 'slobodna aktivnost', 'osz', 'slobodnaaktivnost'),
(32, 'zanimanje', 'osz', 'zanimanja'),
(33, 'vrsta putnika', 'osz', 'vrstaputnika'),
(34, 'nacionalna manjina', 'osz', 'nacionalnamanjina'),
(35, 'narodnost', 'osz', 'narodnost'),
(36, 'razlog boravišta', 'osz', 'razlogboravista'),
(37, 'adresa', 'osz', 'adresa'),
(38, 'nastavni plan', 'osz', 'nastavniplan'),
(39, 'nastavna jedinica', 'osz', 'nastavnajedinica'),
(40, 'metodska jedinica', 'osz', 'metodskajedinica'),
(41, 'nastavni sat', 'osz', 'nastavnisat'),
(42, 'najava ispita', 'osz', 'najavaispita'),
(43, 'kategorija ocjena', 'osz', 'kategorijaocjena');

-- --------------------------------------------------------

--
-- Table structure for table `django_extdirectstoremodel`
--

CREATE TABLE IF NOT EXISTS `django_extdirectstoremodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_extdirectstoremodel`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_fkmodel`
--

CREATE TABLE IF NOT EXISTS `django_fkmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attr` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_fkmodel`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_metamodel`
--

CREATE TABLE IF NOT EXISTS `django_metamodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `nickname` longtext NOT NULL,
  `age` int(11) NOT NULL,
  `creation_date` date NOT NULL,
  `fk_model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_metamodel_947b2d93` (`fk_model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_metamodel`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_metamodelcustomfield`
--

CREATE TABLE IF NOT EXISTS `django_metamodelcustomfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_metamodelcustomfield`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_model`
--

CREATE TABLE IF NOT EXISTS `django_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_model_947b2d93` (`fk_model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_model`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_permmodel`
--

CREATE TABLE IF NOT EXISTS `django_permmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `django_permmodel`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('52ca4c20f06f408879ac4b6aaaa28ca6', 'NTQwMmQ3NzVmMDJiY2UxNWZkM2U4NGExYTk3MTQ4NzFiOTMxNjljODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2011-05-29 19:53:53'),
('9ff86c1608e337e863c5a7cd0df611a5', 'NTQwMmQ3NzVmMDJiY2UxNWZkM2U4NGExYTk3MTQ4NzFiOTMxNjljODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2011-05-29 19:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE IF NOT EXISTS `help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `last_edit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `help`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_adresa`
--

CREATE TABLE IF NOT EXISTS `osz_adresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_adrese` varchar(100) NOT NULL,
  `ulica` varchar(100) NOT NULL,
  `broj` int(11) NOT NULL,
  `datum_od` date DEFAULT NULL,
  `datum_do` date DEFAULT NULL,
  `telefon` varchar(30) NOT NULL,
  `mobitel` varchar(30) NOT NULL,
  `stanuje_s` varchar(30) NOT NULL,
  `ucenik_id` bigint(20) NOT NULL,
  `mjesto_id` int(11) NOT NULL,
  `razlog_boravista_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_adresa_d2fead4f` (`ucenik_id`),
  KEY `osz_adresa_67bcdba0` (`mjesto_id`),
  KEY `osz_adresa_ce8d213` (`razlog_boravista_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_adresa`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_boraviste`
--

CREATE TABLE IF NOT EXISTS `osz_boraviste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ematica_id` int(11) NOT NULL,
  `naziv` int(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ematica_id` (`ematica_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_boraviste`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_dodijeljenapoteskoca`
--

CREATE TABLE IF NOT EXISTS `osz_dodijeljenapoteskoca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum_od` date NOT NULL,
  `datum_do` date DEFAULT NULL,
  `klasa` varchar(200) NOT NULL,
  `urudzbeni_broj` varchar(200) NOT NULL,
  `ucenik_id` bigint(20) NOT NULL,
  `vrsta_poteskoce_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_dodijeljenapoteskoca_d2fead4f` (`ucenik_id`),
  KEY `osz_dodijeljenapoteskoca_fca8e7cb` (`vrsta_poteskoce_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_dodijeljenapoteskoca`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_dogadjaj`
--

CREATE TABLE IF NOT EXISTS `osz_dogadjaj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(200) NOT NULL,
  `opis` longtext NOT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_dogadjaj`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_drzava`
--

CREATE TABLE IF NOT EXISTS `osz_drzava` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `drzavljanstvo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `osz_drzava`
--

INSERT INTO `osz_drzava` (`id`, `naziv`, `drzavljanstvo`) VALUES
(1, 'Hrvatska', 'hrvatsko'),
(2, 'jdsha', 'hjda');

-- --------------------------------------------------------

--
-- Table structure for table `osz_izostanak`
--

CREATE TABLE IF NOT EXISTS `osz_izostanak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ucenik_id` bigint(20) NOT NULL,
  `predmet_id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `opravdano` int(11) NOT NULL,
  `opravdanje` longtext,
  PRIMARY KEY (`id`),
  KEY `osz_izostanak_d2fead4f` (`ucenik_id`),
  KEY `osz_izostanak_44841af2` (`predmet_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_izostanak`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_kategorijaocjena`
--

CREATE TABLE IF NOT EXISTS `osz_kategorijaocjena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_kategorijaocjena`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_metodskajedinica`
--

CREATE TABLE IF NOT EXISTS `osz_metodskajedinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` longtext NOT NULL,
  `nastavna_jedinica_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_metodskajedinica_de232bbb` (`nastavna_jedinica_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_metodskajedinica`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_mjesto`
--

CREATE TABLE IF NOT EXISTS `osz_mjesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_br` varchar(10) NOT NULL,
  `naziv` varchar(200) NOT NULL,
  `drzava_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_mjesto_a62fda90` (`drzava_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `osz_mjesto`
--

INSERT INTO `osz_mjesto` (`id`, `post_br`, `naziv`, `drzava_id`) VALUES
(1, '51000', 'Rijeka', 1),
(2, '52000', 'Pula', 1),
(3, '10000', 'Zagreb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `osz_nacionalnamanjina`
--

CREATE TABLE IF NOT EXISTS `osz_nacionalnamanjina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ematica_id` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ematica_id` (`ematica_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_nacionalnamanjina`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_najavaispita`
--

CREATE TABLE IF NOT EXISTS `osz_najavaispita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `predmet_razrednog_odjeljenja_id` int(11) NOT NULL,
  `nastavni_sat_id` int(11) NOT NULL,
  `kategorija_ocjena_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_najavaispita_2dd58f9d` (`predmet_razrednog_odjeljenja_id`),
  KEY `osz_najavaispita_c90b44b7` (`nastavni_sat_id`),
  KEY `osz_najavaispita_8f1a1e5d` (`kategorija_ocjena_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_najavaispita`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_narodnost`
--

CREATE TABLE IF NOT EXISTS `osz_narodnost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `osz_narodnost`
--

INSERT INTO `osz_narodnost` (`id`, `naziv`) VALUES
(1, 'Hrvat');

-- --------------------------------------------------------

--
-- Table structure for table `osz_nastavnajedinica`
--

CREATE TABLE IF NOT EXISTS `osz_nastavnajedinica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` longtext NOT NULL,
  `nastavni_plan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_nastavnajedinica_7608849f` (`nastavni_plan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_nastavnajedinica`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_nastavniplan`
--

CREATE TABLE IF NOT EXISTS `osz_nastavniplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_nastavniplan`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_nastavnisat`
--

CREATE TABLE IF NOT EXISTS `osz_nastavnisat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `napomena` varchar(250) NOT NULL,
  `opis` longtext NOT NULL,
  `datum` date NOT NULL,
  `metodska_jedinica_id` int(11) NOT NULL,
  `predmet_razrednog_odjeljenja_id` int(11) NOT NULL,
  `ucitelj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_nastavnisat_ba420135` (`metodska_jedinica_id`),
  KEY `osz_nastavnisat_2dd58f9d` (`predmet_razrednog_odjeljenja_id`),
  KEY `osz_nastavnisat_3decf345` (`ucitelj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_nastavnisat`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_ocjena`
--

CREATE TABLE IF NOT EXISTS `osz_ocjena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ocjena` int(10) unsigned NOT NULL,
  `ucenik_id` bigint(20) NOT NULL,
  `predmetna_cjelina_id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `opaska` longtext NOT NULL,
  `kategorija_ocjena_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_ocjena_d2fead4f` (`ucenik_id`),
  KEY `osz_ocjena_b3bb16fc` (`predmetna_cjelina_id`),
  KEY `osz_ocjena_8f1a1e5d` (`kategorija_ocjena_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_ocjena`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_predmet`
--

CREATE TABLE IF NOT EXISTS `osz_predmet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ematica_id` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `opis` longtext NOT NULL,
  `razred` int(10) unsigned NOT NULL,
  `previdjen_broj_sati` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ematica_id` (`ematica_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_predmet`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_predmetnacjelina`
--

CREATE TABLE IF NOT EXISTS `osz_predmetnacjelina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `predmet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_predmetnacjelina_44841af2` (`predmet_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_predmetnacjelina`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_predmetrazrednogodjeljenja`
--

CREATE TABLE IF NOT EXISTS `osz_predmetrazrednogodjeljenja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razredno_odjeljenje_id` int(11) NOT NULL,
  `predmet_id` int(11) NOT NULL,
  `ucitelj_id` int(11) NOT NULL,
  `polugodiste` int(10) unsigned NOT NULL,
  `realiziran_broj_sati` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_predmetrazrednogodjeljenja_aa3235df` (`razredno_odjeljenje_id`),
  KEY `osz_predmetrazrednogodjeljenja_44841af2` (`predmet_id`),
  KEY `osz_predmetrazrednogodjeljenja_3decf345` (`ucitelj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_predmetrazrednogodjeljenja`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_predmetrazrednogodjeljenja_nastavni_plan`
--

CREATE TABLE IF NOT EXISTS `osz_predmetrazrednogodjeljenja_nastavni_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predmetrazrednogodjeljenja_id` int(11) NOT NULL,
  `nastavniplan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `predmetrazrednogodjeljenja_id` (`predmetrazrednogodjeljenja_id`,`nastavniplan_id`),
  KEY `osz_predmetrazrednogodjeljenja_nastavni_plan_59dc5589` (`predmetrazrednogodjeljenja_id`),
  KEY `osz_predmetrazrednogodjeljenja_nastavni_plan_2759920b` (`nastavniplan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_predmetrazrednogodjeljenja_nastavni_plan`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_predmet_skolska_godina`
--

CREATE TABLE IF NOT EXISTS `osz_predmet_skolska_godina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predmet_id` int(11) NOT NULL,
  `skolskagodina_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `predmet_id` (`predmet_id`,`skolskagodina_id`),
  KEY `osz_predmet_skolska_godina_44841af2` (`predmet_id`),
  KEY `osz_predmet_skolska_godina_4710281d` (`skolskagodina_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_predmet_skolska_godina`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_predmet_ucitelj`
--

CREATE TABLE IF NOT EXISTS `osz_predmet_ucitelj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predmet_id` int(11) NOT NULL,
  `ucitelj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `predmet_id` (`predmet_id`,`ucitelj_id`),
  KEY `osz_predmet_ucitelj_44841af2` (`predmet_id`),
  KEY `osz_predmet_ucitelj_3decf345` (`ucitelj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_predmet_ucitelj`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_razlogboravista`
--

CREATE TABLE IF NOT EXISTS `osz_razlogboravista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_razlogboravista`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_razrednoodjeljenje`
--

CREATE TABLE IF NOT EXISTS `osz_razrednoodjeljenje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) NOT NULL,
  `skolska_godina_id` int(10) unsigned NOT NULL,
  `razred` int(10) unsigned NOT NULL,
  `razrednik_id` int(11) NOT NULL,
  `klasa` varchar(200) NOT NULL,
  `urudzbeni_broj` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_razrednoodjeljenje_5f5789fb` (`skolska_godina_id`),
  KEY `osz_razrednoodjeljenje_67072381` (`razrednik_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `osz_razrednoodjeljenje`
--

INSERT INTO `osz_razrednoodjeljenje` (`id`, `naziv`, `skolska_godina_id`, `razred`, `razrednik_id`, `klasa`, `urudzbeni_broj`) VALUES
(1, '1.a', 2010, 1, 0, 'klasa12345', 'ub12345'),
(2, '1.b', 2011, 1, 1, 'klasa12346', 'ub12348');

-- --------------------------------------------------------

--
-- Table structure for table `osz_razrednoodjeljenje_dogadjaj`
--

CREATE TABLE IF NOT EXISTS `osz_razrednoodjeljenje_dogadjaj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razrednoodjeljenje_id` int(11) NOT NULL,
  `dogadjaj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `razrednoodjeljenje_id` (`razrednoodjeljenje_id`,`dogadjaj_id`),
  KEY `osz_razrednoodjeljenje_dogadjaj_b2c230d3` (`razrednoodjeljenje_id`),
  KEY `osz_razrednoodjeljenje_dogadjaj_a16270c4` (`dogadjaj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_razrednoodjeljenje_dogadjaj`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_skola`
--

CREATE TABLE IF NOT EXISTS `osz_skola` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(200) NOT NULL,
  `ravnatelj` varchar(100) NOT NULL,
  `ulica` varchar(100) NOT NULL,
  `broj` int(11) NOT NULL,
  `telefon` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `web` varchar(255) NOT NULL,
  `mjesto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_skola_67bcdba0` (`mjesto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_skola`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_skolskagodina`
--

CREATE TABLE IF NOT EXISTS `osz_skolskagodina` (
  `godina` int(10) unsigned NOT NULL,
  `pocetak_sk_godine` date NOT NULL,
  `kraj_sk_godine` date NOT NULL,
  `kraj_prvog_polugodista` date NOT NULL,
  `pocetak_drugog_polugodista` date NOT NULL,
  PRIMARY KEY (`godina`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `osz_skolskagodina`
--

INSERT INTO `osz_skolskagodina` (`godina`, `pocetak_sk_godine`, `kraj_sk_godine`, `kraj_prvog_polugodista`, `pocetak_drugog_polugodista`) VALUES
(2010, '2010-09-01', '2011-06-21', '2010-12-17', '2011-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `osz_skolskagodina_nastavni_plan`
--

CREATE TABLE IF NOT EXISTS `osz_skolskagodina_nastavni_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skolskagodina_id` int(10) unsigned NOT NULL,
  `nastavniplan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skolskagodina_id` (`skolskagodina_id`,`nastavniplan_id`),
  KEY `osz_skolskagodina_nastavni_plan_4710281d` (`skolskagodina_id`),
  KEY `osz_skolskagodina_nastavni_plan_2759920b` (`nastavniplan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_skolskagodina_nastavni_plan`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_slobodnaaktivnost`
--

CREATE TABLE IF NOT EXISTS `osz_slobodnaaktivnost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_slobodnaaktivnost`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_titula`
--

CREATE TABLE IF NOT EXISTS `osz_titula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) NOT NULL,
  `tip` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_titula`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_ucenik`
--

CREATE TABLE IF NOT EXISTS `osz_ucenik` (
  `oib` bigint(11) unsigned zerofill NOT NULL,
  `jmbg` bigint(13) unsigned zerofill NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `spol` varchar(1) NOT NULL,
  `otac_ime_nom` varchar(50) NOT NULL,
  `otac_ime_gen` varchar(50) NOT NULL,
  `majka_ime_nom` varchar(50) NOT NULL,
  `majka_ime_gen` varchar(50) NOT NULL,
  `majka_djevojacko` varchar(50) NOT NULL,
  `stranac` int(11) NOT NULL,
  `skolovanje_izvan_rh` int(11) NOT NULL,
  `sportas` int(11) NOT NULL,
  `broj_domovnice` int(10) unsigned NOT NULL,
  `smb` varchar(200) NOT NULL,
  `smb_datum_od` date DEFAULT NULL,
  `smb_datum_do` date DEFAULT NULL,
  `hospitant` int(11) NOT NULL,
  `mjesto_rodjenja_id` int(11) NOT NULL,
  `narodnost_id` int(11) NOT NULL,
  `nacionalna_manjina_id` int(11) DEFAULT NULL,
  `vrsta_putnika_id` int(11) DEFAULT NULL,
  `otac_zanimanje_id` int(11) DEFAULT NULL,
  `majka_zanimanje_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`oib`),
  UNIQUE KEY `jmbg` (`jmbg`),
  KEY `osz_ucenik_8a0cf847` (`mjesto_rodjenja_id`),
  KEY `osz_ucenik_fc1865ed` (`narodnost_id`),
  KEY `osz_ucenik_d17cc147` (`nacionalna_manjina_id`),
  KEY `osz_ucenik_e8b8647e` (`vrsta_putnika_id`),
  KEY `osz_ucenik_bf0e2743` (`otac_zanimanje_id`),
  KEY `osz_ucenik_3f3dba55` (`majka_zanimanje_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `osz_ucenik`
--

INSERT INTO `osz_ucenik` (`oib`, `jmbg`, `ime`, `prezime`, `datum_rodjenja`, `spol`, `otac_ime_nom`, `otac_ime_gen`, `majka_ime_nom`, `majka_ime_gen`, `majka_djevojacko`, `stranac`, `skolovanje_izvan_rh`, `sportas`, `broj_domovnice`, `smb`, `smb_datum_od`, `smb_datum_do`, `hospitant`, `mjesto_rodjenja_id`, `narodnost_id`, `nacionalna_manjina_id`, `vrsta_putnika_id`, `otac_zanimanje_id`, `majka_zanimanje_id`) VALUES
(12345678901, 0000000000123, 'Pero', 'Perić', '2011-05-15', 'M', '', '', '', '', '', 0, 0, 0, 123, '', NULL, NULL, 0, 1, 1, NULL, NULL, NULL, NULL),
(466066025690, 2903990360586, 'Ivan', 'Sušanj', '1990-03-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(374149578784, 0904993360886, 'Željko', 'Mandić', '1993-04-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(538434157496, 0703997360260, 'Ines', 'Koraca', '1997-03-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(881622134317, 2902999360416, 'Viktor', 'Pavković', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(379247946041, 1110989360518, 'Marko', 'Graovac', '1989-10-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(891069433238, 1706994360711, 'Natko', 'Kostrenčić', '1994-06-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(136445660127, 2407995360668, 'Petar', 'Bokulić', '1995-07-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(216501789256, 0211998360481, 'Ivana', 'Štajduhar', '1998-11-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(985165345230, 2203997360357, 'Nataša', 'Kostrenčić', '1997-03-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(489942779052, 3007999360658, 'Ines', 'Nekić', '1999-07-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(586880369856, 0401992360422, 'Marko', 'Todeskini', '1992-01-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(671290671605, 1011997360076, 'Mila', 'Vincetić', '1997-11-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(422985348229, 0110991360359, 'Nataša', 'Mandić', '1991-10-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(724786606339, 0212990360712, 'Pero', 'Ugrina', '1990-12-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(962261261188, 2307998360062, 'Igor', 'Mandić', '1998-07-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(155453071551, 1812998360183, 'Zoran', 'Kostrenčić', '1998-12-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(661450585577, 2511994360009, 'Jakov', 'Perić', '1994-11-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(586092340190, 0210996360118, 'Jakov', 'Sušanj', '1996-10-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(172858089850, 0703991360745, 'Viktor', 'Hasić', '1991-03-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(898706428646, 1105999360656, 'Mila', 'Nekić', '1999-05-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(573176450847, 1709997360580, 'Natko', 'Štajduhar', '1997-09-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(704161356032, 1306991360809, 'Marin', 'Vincetić', '1991-06-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(330706260789, 2210992360171, 'Milan', 'Graovac', '1992-10-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(218444401233, 1808994360879, 'Diana', 'Sušanj', '1994-08-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(511305331980, 0711989360435, 'Ana', 'Sušanj', '1989-11-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(551886618422, 1606993360947, 'Karmen', 'Petrović', '1993-06-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(716516501041, 1205989360692, 'Nikola', 'Perić', '1989-05-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(974104547844, 1110998360935, 'Diana', 'Kostrenčić', '1998-10-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(997302325115, 0510997360752, 'Igor', 'Ugrina', '1997-10-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(516952564341, 1012992360823, 'Diana', 'Petrović', '1992-12-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(671822715744, 2005990360982, 'Petra', 'Petrović', '1990-05-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(870293589909, 0403992360673, 'Valentina', 'Ugrina', '1992-03-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(398730341588, 1301992360158, 'Slaven', 'Ugrina', '1992-01-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(411417211252, 2107991360239, 'Valentina', 'Petrović', '1991-07-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(340134620243, 0710991360548, 'Ines', 'Hasić', '1991-10-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(934469882717, 0109991360226, 'Igor', 'Frančić', '1991-09-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(230665216948, 0412991360810, 'Valentina', 'Bokulić', '1991-12-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(459529110138, 1007992360210, 'Vanja', 'Sušanj', '1992-07-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(601090923455, 2906994360170, 'Ana', 'Štajduhar', '1994-06-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(556839628070, 1305994360560, 'Zoran', 'Frančić', '1994-05-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(161610774019, 2510991360720, 'Vanja', 'Hasić', '1991-10-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(441148966783, 1501995360097, 'Viktor', 'Graovac', '1995-01-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(491597162223, 1208995360081, 'Marko', 'Vincetić', '1995-08-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(704532996656, 2301992360700, 'Igor', 'Marković', '1992-01-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(189315963090, 1606995360695, 'Marin', 'Štajduhar', '1995-06-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(328898383840, 0805996360226, 'Pero', 'Marković', '1996-05-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(191098030403, 0706995360156, 'Jakov', 'Pavković', '1995-06-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(237646948300, 1805989360902, 'Ivan', 'Hasić', '1989-05-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(210248663962, 1711989360611, 'Diana', 'Hasić', '1989-11-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(941946861768, 2606995360775, 'Karmen', 'Marić', '1995-06-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(808430438896, 0703996360847, 'Željko', 'Štajduhar', '1996-03-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(562142824092, 2311993360573, 'Ivan', 'Todeskini', '1993-11-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(695553930886, 0904990360697, 'Pero', 'Ugrina', '1990-04-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(254182095302, 1411990360341, 'Mila', 'Petrović', '1990-11-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(923886281194, 1808990360530, 'Karmen', 'Bokulić', '1990-08-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(369289265880, 1305990360513, 'Ines', 'Štajduhar', '1990-05-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(810763348653, 2212989360939, 'Zoran', 'Antić', '1989-12-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(763572609618, 0701990360498, 'Natko', 'Mandić', '1990-01-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(411940172287, 0711992360521, 'Petra', 'Marić', '1992-11-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(438422724659, 1703993360174, 'Mario', 'Hasić', '1993-03-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(953722247589, 3003991360087, 'Iva', 'Koraca', '1991-03-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(747248057278, 1207999360131, 'Jakov', 'Todeskini', '1999-07-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(116915289780, 2708993360142, 'Petra', 'Koraca', '1993-08-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(349120449080, 2510996360791, 'Petra', 'Bokulić', '1996-10-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(120825212970, 0202992360284, 'Diana', 'Todeskini', '1992-02-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(808619690723, 1406990360853, 'Ivana', 'Ugrina', '1990-06-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(819622836345, 2309998360939, 'Marko', 'Antić', '1998-09-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(643871308097, 2709993360513, 'Valentina', 'Antić', '1993-09-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(657109647482, 2005999360462, 'Zoran', 'Valentić', '1999-05-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(153033109494, 3012996360300, 'Ivana', 'Vincetić', '1996-12-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(193823183156, 0707990360900, 'Ines', 'Mandić', '1990-07-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(437388800419, 0505993360265, 'Karmen', 'Pavković', '1993-05-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(195657658091, 1104995360474, 'Karmen', 'Mandić', '1995-04-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(260364488743, 2502996360625, 'Petra', 'Štajduhar', '1996-02-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(551466754920, 1412995360103, 'Ivan', 'Štajduhar', '1995-12-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(445873267128, 1307995360832, 'Diana', 'Ugrina', '1995-07-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(117218122781, 0406996360886, 'Slaven', 'Pavković', '1996-06-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(673960771140, 3101989360224, 'Ivana', 'Valentić', '1989-01-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(903715075087, 1509997360660, 'Ines', 'Štajduhar', '1997-09-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(934346921508, 1904991360293, 'Igor', 'Koraca', '1991-04-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(922799305628, 0802997360266, 'Karmen', 'Mandić', '1997-02-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(414399412594, 3101989360898, 'Igor', 'Sušanj', '1989-01-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(222418048147, 1002997360640, 'Petar', 'Todeskini', '1997-02-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(849784867943, 2908991360329, 'Igor', 'Mandić', '1991-08-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(338804433056, 2011994360729, 'Iva', 'Graovac', '1994-11-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(574816672420, 1910989360479, 'Mile', 'Vincetić', '1989-10-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(161529485380, 1909992360037, 'Igor', 'Štajduhar', '1992-09-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(647845531261, 2210990360297, 'Igor', 'Frančić', '1990-10-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(486284841654, 2807991360382, 'Ivana', 'Kostrenčić', '1991-07-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(797311639163, 0206997360555, 'Karmen', 'Mandić', '1997-06-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(872324344720, 2405995360612, 'Marin', 'Ugrina', '1995-05-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(797323830197, 3004999360592, 'Natko', 'Bokulić', '1999-04-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(484689869255, 1012992360668, 'Viktor', 'Petrović', '1992-12-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(272042735672, 0910995360086, 'Marin', 'Sušanj', '1995-10-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(168617140801, 2405996360633, 'Ines', 'Valentić', '1996-05-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(615345813279, 0403995360843, 'Ana', 'Antić', '1995-03-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(158168909168, 2707994360955, 'Mila', 'Todeskini', '1994-07-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(421113592141, 0304998360923, 'Vanja', 'Sušanj', '1998-04-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(793370201590, 0809999360159, 'Karmen', 'Pavković', '1999-09-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(387699601393, 0204995360623, 'Petar', 'Hasić', '1995-04-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(781680801167, 1408996360666, 'Nataša', 'Graovac', '1996-08-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(550481345912, 0106993360709, 'Ines', 'Marković', '1993-06-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(951525075412, 0810993360068, 'Pero', 'Perić', '1993-10-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(106122164915, 1307994360717, 'Viktor', 'Sušanj', '1994-07-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(788818542099, 1312992360402, 'Viktor', 'Todeskini', '1992-12-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(832981665599, 0803998360342, 'Diana', 'Vincetić', '1998-03-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(387278130313, 0411995360655, 'Ana', 'Todeskini', '1995-11-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(133926607563, 0505997360776, 'Ines', 'Valentić', '1997-05-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(696838390778, 0504998360309, 'Marin', 'Koraca', '1998-04-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(449088599882, 2105997360346, 'Zoran', 'Koraca', '1997-05-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(183860977350, 1002997360649, 'Ana', 'Petrović', '1997-02-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(871606499576, 2511998360355, 'Pero', 'Pavković', '1998-11-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(188595593477, 1704990360516, 'Igor', 'Pavković', '1990-04-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(668424029335, 2608995360265, 'Valentina', 'Petrović', '1995-08-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(139801400062, 3102999360561, 'Ivana', 'Antić', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(754108347433, 0207995360097, 'Jakov', 'Ugrina', '1995-07-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(858484795246, 1210994360788, 'Željko', 'Sušanj', '1994-10-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(569894528376, 0601998360494, 'Karmen', 'Pavković', '1998-01-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(146406408583, 2102999360393, 'Petra', 'Marković', '1999-02-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(766438774878, 2606997360336, 'Marin', 'Sušanj', '1997-06-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(304144572055, 1303991360874, 'Petar', 'Frančić', '1991-03-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(358937181309, 0606989360935, 'Petar', 'Mandić', '1989-06-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(302759971470, 2107997360252, 'Petar', 'Antić', '1997-07-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(571676713386, 2108995360814, 'Nikola', 'Štajduhar', '1995-08-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(296003390958, 1106998360272, 'Mile', 'Štajduhar', '1998-06-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(102967941333, 0412996360888, 'Jakov', 'Marić', '1996-12-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(348833135103, 1905993360909, 'Nikola', 'Ugrina', '1993-05-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(254490796145, 0708993360116, 'Karmen', 'Vincetić', '1993-08-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(635577639270, 0903998360399, 'Nataša', 'Perić', '1998-03-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(127581424608, 2702995360621, 'Ivana', 'Vincetić', '1995-02-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(506110369425, 2602989360413, 'Mila', 'Sušanj', '1989-02-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(681763191306, 0305993360488, 'Mario', 'Kostrenčić', '1993-05-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(928174704149, 3103992360362, 'Petar', 'Kostrenčić', '1992-03-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(970038158381, 1612994360694, 'Jakov', 'Koraca', '1994-12-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(992390605652, 1511993360191, 'Manuela', 'Pavković', '1993-11-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(290013117059, 1807990360688, 'Jakov', 'Kostrenčić', '1990-07-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(596011347854, 1206992360038, 'Marin', 'Kostrenčić', '1992-06-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(862352986326, 0208998360224, 'Ines', 'Marković', '1998-08-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(720370821503, 2804994360179, 'Petar', 'Sušanj', '1994-04-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(259328456718, 2304998360637, 'Iva', 'Graovac', '1998-04-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(403446004390, 2802999360794, 'Ivan', 'Petrović', '1999-02-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(350446835933, 2709998360313, 'Ines', 'Pavković', '1998-09-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(871886384078, 2410992360821, 'Mila', 'Valentić', '1992-10-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(106339797635, 2609994360668, 'Petra', 'Štajduhar', '1994-09-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(886669958604, 0912992360571, 'Manuela', 'Nekić', '1992-12-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(485739902848, 0406990360900, 'Zoran', 'Koraca', '1990-06-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(529576687096, 1112993360266, 'Nikola', 'Perić', '1993-12-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(330717061903, 0803990360158, 'Ana', 'Koraca', '1990-03-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(967922744956, 0101999360659, 'Petra', 'Kostrenčić', '1999-01-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(858893123219, 2802993360898, 'Diana', 'Valentić', '1993-02-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(537109068207, 0302999360821, 'Ana', 'Nekić', '1999-02-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(722924795883, 2707998360026, 'Valentina', 'Vincetić', '1998-07-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(987057616106, 1504989360552, 'Ivana', 'Ugrina', '1989-04-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(483227522727, 2706992360572, 'Jakov', 'Petrović', '1992-06-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(795764053489, 2208992360338, 'Zoran', 'Frančić', '1992-08-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(224500657281, 0412989360635, 'Željko', 'Kostrenčić', '1989-12-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(943831563469, 2606990360839, 'Ana', 'Valentić', '1990-06-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(521331109518, 0712993360831, 'Mile', 'Sušanj', '1993-12-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(763351383231, 1101992360903, 'Igor', 'Koraca', '1992-01-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(138113827856, 0312993360258, 'Mario', 'Kostrenčić', '1993-12-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(644961582525, 2809990360198, 'Natko', 'Pavković', '1990-09-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(143618817529, 2310997360527, 'Igor', 'Antić', '1997-10-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(282438075850, 0605995360753, 'Ana', 'Perić', '1995-05-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(309600342700, 1702992360341, 'Milan', 'Perić', '1992-02-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(163572517640, 1304990360467, 'Vanja', 'Sušanj', '1990-04-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(936035879184, 1907989360952, 'Mario', 'Marić', '1989-07-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(569979475074, 2204999360251, 'Valentina', 'Todeskini', '1999-04-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(270022699991, 0207997360923, 'Manuela', 'Hasić', '1997-07-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(259809020599, 1205989360866, 'Valentina', 'Koraca', '1989-05-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(913837441840, 2612991360459, 'Željko', 'Marić', '1991-12-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(494381080004, 2702999360897, 'Zoran', 'Petrović', '1999-02-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(980480489678, 2407996360219, 'Natko', 'Štajduhar', '1996-07-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(444493681153, 1207994360443, 'Iva', 'Kostrenčić', '1994-07-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(137727340995, 1903994360076, 'Petra', 'Perić', '1994-03-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(346877113364, 2305992360413, 'Mila', 'Marić', '1992-05-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(794647044478, 0503998360546, 'Karmen', 'Koraca', '1998-03-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(260804816001, 1712991360684, 'Natko', 'Frančić', '1991-12-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(889676821858, 1406993360489, 'Pero', 'Graovac', '1993-06-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(408316380715, 2703993360720, 'Manuela', 'Petrović', '1993-03-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(139520618855, 0910990360119, 'Milan', 'Marković', '1990-10-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(617763816537, 2010989360961, 'Valentina', 'Perić', '1989-10-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(157519155965, 0611996360869, 'Viktor', 'Nekić', '1996-11-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(527893565344, 1105996360156, 'Željko', 'Kostrenčić', '1996-05-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(771326059421, 3103990360156, 'Diana', 'Hasić', '1990-03-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(287521541752, 2606992360328, 'Marko', 'Štajduhar', '1992-06-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(294313802225, 2708989360950, 'Petra', 'Antić', '1989-08-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(843477706316, 0105993360566, 'Manuela', 'Kostrenčić', '1993-05-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(360514644080, 2803993360728, 'Zoran', 'Pavković', '1993-03-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(272238336584, 0801990360961, 'Nikola', 'Sušanj', '1990-01-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(139937260289, 0908998360914, 'Marko', 'Perić', '1998-08-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(475112565244, 2012989360956, 'Valentina', 'Kostrenčić', '1989-12-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(916710236246, 0703990360406, 'Nataša', 'Perić', '1990-03-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(995448380594, 2405993360332, 'Natko', 'Koraca', '1993-05-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(676042250693, 0504990360432, 'Manuela', 'Koraca', '1990-04-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(188023234458, 0304997360375, 'Vanja', 'Štajduhar', '1997-04-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(281127918282, 0809998360517, 'Petra', 'Vincetić', '1998-09-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(380772034719, 1211993360593, 'Iva', 'Koraca', '1993-11-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(372196809745, 0303998360060, 'Milan', 'Koraca', '1998-03-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(435625646837, 2402998360834, 'Ivan', 'Valentić', '1998-02-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(168528886975, 1112995360170, 'Karmen', 'Pavković', '1995-12-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(735006100062, 0105996360661, 'Karmen', 'Ugrina', '1996-05-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(464118229595, 2007989360485, 'Petra', 'Koraca', '1989-07-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(486007313818, 1404997360536, 'Ivana', 'Ugrina', '1997-04-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(310164478753, 1012991360522, 'Ana', 'Sušanj', '1991-12-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(511693436451, 0205997360350, 'Petra', 'Pavković', '1997-05-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(150690900374, 2804996360304, 'Igor', 'Kostrenčić', '1996-04-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(364772300673, 1811999360031, 'Mile', 'Vincetić', '1999-11-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(456195050940, 1005993360276, 'Ivan', 'Perić', '1993-05-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(989726169412, 2911997360268, 'Manuela', 'Vincetić', '1997-11-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(249650700682, 3008992360981, 'Viktor', 'Štajduhar', '1992-08-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(779807587127, 1201998360490, 'Slaven', 'Hasić', '1998-01-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(373109822907, 2902997360674, 'Valentina', 'Graovac', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(721994563630, 1711994360040, 'Vanja', 'Nekić', '1994-11-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(458435201161, 0202991360947, 'Petar', 'Sušanj', '1991-02-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(509908049168, 2311996360251, 'Mile', 'Sušanj', '1996-11-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(644252189061, 0107992360301, 'Natko', 'Todeskini', '1992-07-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(287873043686, 1610999360528, 'Viktor', 'Koraca', '1999-10-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(717333048743, 1811991360729, 'Ivana', 'Pavković', '1991-11-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(674437643560, 2502993360862, 'Ivan', 'Koraca', '1993-02-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(704244562700, 2104991360697, 'Nataša', 'Štajduhar', '1991-04-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(679272169386, 2302993360424, 'Ana', 'Vincetić', '1993-02-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(176089847081, 1206995360985, 'Diana', 'Koraca', '1995-06-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(133994908368, 2605993360935, 'Mario', 'Koraca', '1993-05-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(724640258597, 1804994360429, 'Mila', 'Frančić', '1994-04-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(348823378532, 1803995360460, 'Jakov', 'Ugrina', '1995-03-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(558434639894, 0112997360221, 'Valentina', 'Nekić', '1997-12-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(449673243225, 0208995360344, 'Petra', 'Kostrenčić', '1995-08-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(576428758312, 0502997360805, 'Slaven', 'Antić', '1997-02-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(878035867945, 1305994360657, 'Mario', 'Hasić', '1994-05-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(180118622078, 2906989360703, 'Ivana', 'Hasić', '1989-06-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(507052271778, 2911992360804, 'Marin', 'Todeskini', '1992-11-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(106785264192, 2910997360612, 'Viktor', 'Marić', '1997-10-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(347035735511, 2207992360996, 'Milan', 'Pavković', '1992-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(776692699229, 0901991360524, 'Petar', 'Todeskini', '1991-01-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(589694777892, 2203992360447, 'Slaven', 'Todeskini', '1992-03-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(621927794939, 0709991360906, 'Željko', 'Petrović', '1991-09-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(917942634253, 0303993360893, 'Ivana', 'Štajduhar', '1993-03-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(985270461690, 2912992360658, 'Željko', 'Vincetić', '1992-12-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(843383142079, 1507989360100, 'Zoran', 'Nekić', '1989-07-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(964860934435, 1004994360778, 'Valentina', 'Marković', '1994-04-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(159849492649, 2209992360828, 'Nataša', 'Marić', '1992-09-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(199352250888, 1509993360469, 'Zoran', 'Perić', '1993-09-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(889385430174, 2611996360228, 'Marko', 'Nekić', '1996-11-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(876656034997, 1804997360797, 'Iva', 'Perić', '1997-04-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(118769515783, 0809990360668, 'Vanja', 'Valentić', '1990-09-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(522491263070, 0702997360277, 'Igor', 'Ugrina', '1997-02-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(731577179351, 2708998360368, 'Diana', 'Bokulić', '1998-08-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(395096084668, 0809995360537, 'Željko', 'Perić', '1995-09-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(654172825570, 3110996360154, 'Karmen', 'Marić', '1996-10-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(567151241912, 3009991360023, 'Željko', 'Graovac', '1991-09-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(750559229949, 2107989360529, 'Željko', 'Nekić', '1989-07-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(289315081697, 2308997360949, 'Petar', 'Valentić', '1997-08-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(371666834403, 2701997360133, 'Mila', 'Bokulić', '1997-01-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(196979358439, 3002997360019, 'Pero', 'Kostrenčić', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(916052071162, 1208997360174, 'Milan', 'Ugrina', '1997-08-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(869155169831, 0404997360487, 'Valentina', 'Bokulić', '1997-04-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(810442023308, 2701989360915, 'Mario', 'Nekić', '1989-01-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(823231710719, 1303992360547, 'Iva', 'Todeskini', '1992-03-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(974067630876, 0209992360090, 'Nikola', 'Pavković', '1992-09-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(623619010750, 2706990360601, 'Milan', 'Pavković', '1990-06-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(232999098414, 2410991360430, 'Natko', 'Vincetić', '1991-10-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(774282439264, 2207997360704, 'Ivan', 'Todeskini', '1997-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(949188565042, 1512996360485, 'Milan', 'Nekić', '1996-12-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(497032017072, 3112999360440, 'Petar', 'Nekić', '1999-12-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(757184264258, 0602989360690, 'Ivana', 'Koraca', '1989-02-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(167888099196, 2212998360744, 'Mario', 'Graovac', '1998-12-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(135622289276, 0106998360304, 'Mario', 'Perić', '1998-06-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(222191731124, 0403992360128, 'Mila', 'Marković', '1992-03-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(713486837068, 2810991360141, 'Valentina', 'Pavković', '1991-10-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(231473972804, 0910991360989, 'Nataša', 'Ugrina', '1991-10-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(417998801621, 2901993360742, 'Ivana', 'Todeskini', '1993-01-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(290135314352, 0905996360255, 'Igor', 'Sušanj', '1996-05-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(602921554826, 2308998360593, 'Igor', 'Marić', '1998-08-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(778295892488, 0507991360448, 'Ivana', 'Nekić', '1991-07-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(674834005630, 0202992360578, 'Nataša', 'Hasić', '1992-02-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(179850671706, 1801993360454, 'Manuela', 'Štajduhar', '1993-01-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(219522608753, 0802995360304, 'Ana', 'Koraca', '1995-02-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(549603326489, 1810992360232, 'Natko', 'Mandić', '1992-10-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(496834059882, 0904990360936, 'Milan', 'Štajduhar', '1990-04-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(618315498718, 0204995360411, 'Ivana', 'Hasić', '1995-04-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(989704024388, 3105998360070, 'Manuela', 'Marković', '1998-05-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(224205355746, 1002993360747, 'Milan', 'Todeskini', '1993-02-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(748537510748, 1605999360522, 'Nikola', 'Vincetić', '1999-05-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(332709054459, 0510998360489, 'Željko', 'Kostrenčić', '1998-10-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(579958689464, 2005995360197, 'Karmen', 'Štajduhar', '1995-05-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(719210296658, 1502996360506, 'Zoran', 'Nekić', '1996-02-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(751309473538, 0211995360714, 'Petra', 'Todeskini', '1995-11-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(643124405262, 1608998360763, 'Ines', 'Bokulić', '1998-08-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(973255740428, 1003992360767, 'Natko', 'Perić', '1992-03-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(928647781928, 0412996360570, 'Viktor', 'Mandić', '1996-12-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(984163885750, 0707997360004, 'Mile', 'Hasić', '1997-07-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(281370292762, 1303997360184, 'Željko', 'Petrović', '1997-03-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(955463166338, 2801989360724, 'Marin', 'Nekić', '1989-01-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(848476944052, 2711990360112, 'Petar', 'Ugrina', '1990-11-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(478753962773, 1110989360486, 'Zoran', 'Nekić', '1989-10-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(430859922727, 0312998360014, 'Natko', 'Mandić', '1998-12-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(226962182163, 2907989360823, 'Diana', 'Graovac', '1989-07-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(850032001609, 1007992360287, 'Karmen', 'Sušanj', '1992-07-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(810445578001, 2512997360984, 'Nikola', 'Vincetić', '1997-12-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(155053311391, 2801993360906, 'Igor', 'Hasić', '1993-01-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(470049330405, 2712996360417, 'Milan', 'Marić', '1996-12-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(276892881855, 0411999360448, 'Viktor', 'Perić', '1999-11-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(250108850744, 0910995360618, 'Mila', 'Vincetić', '1995-10-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(152604067813, 2102993360492, 'Natko', 'Koraca', '1993-02-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(337786992137, 0610992360008, 'Ana', 'Marković', '1992-10-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(626766418348, 2512995360827, 'Nataša', 'Ugrina', '1995-12-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(644925833792, 1208991360328, 'Slaven', 'Vincetić', '1991-08-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(948424288801, 0211995360534, 'Ivana', 'Petrović', '1995-11-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(359182372238, 1411991360222, 'Valentina', 'Graovac', '1991-11-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(997012677499, 2001990360895, 'Ana', 'Valentić', '1990-01-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(244426192101, 2705990360206, 'Mario', 'Štajduhar', '1990-05-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(991989577989, 0403991360719, 'Karmen', 'Marić', '1991-03-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(428449540768, 1607989360662, 'Petra', 'Antić', '1989-07-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(361162497904, 2207998360241, 'Igor', 'Marić', '1998-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(331918515007, 2810991360403, 'Petra', 'Kostrenčić', '1991-10-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(308242671395, 1504991360888, 'Iva', 'Marić', '1991-04-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(601674278597, 1606994360057, 'Nikola', 'Valentić', '1994-06-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(201157422873, 0506998360732, 'Pero', 'Graovac', '1998-06-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(369247208796, 0207998360348, 'Ana', 'Perić', '1998-07-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(772406247820, 3007994360372, 'Pero', 'Nekić', '1994-07-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(563332301855, 1305997360695, 'Diana', 'Pavković', '1997-05-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(720931836213, 0204994360284, 'Jakov', 'Todeskini', '1994-04-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(213668949192, 0502999360472, 'Slaven', 'Nekić', '1999-02-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(810947719803, 2707994360747, 'Natko', 'Kostrenčić', '1994-07-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(357276405952, 2011995360566, 'Petar', 'Nekić', '1995-11-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(293232309264, 2401989360496, 'Igor', 'Kostrenčić', '1989-01-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(942561198203, 2612999360311, 'Natko', 'Kostrenčić', '1999-12-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(581237465358, 1806999360951, 'Karmen', 'Valentić', '1999-06-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(711755811210, 2609991360971, 'Diana', 'Hasić', '1991-09-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `osz_ucenik` (`oib`, `jmbg`, `ime`, `prezime`, `datum_rodjenja`, `spol`, `otac_ime_nom`, `otac_ime_gen`, `majka_ime_nom`, `majka_ime_gen`, `majka_djevojacko`, `stranac`, `skolovanje_izvan_rh`, `sportas`, `broj_domovnice`, `smb`, `smb_datum_od`, `smb_datum_do`, `hospitant`, `mjesto_rodjenja_id`, `narodnost_id`, `nacionalna_manjina_id`, `vrsta_putnika_id`, `otac_zanimanje_id`, `majka_zanimanje_id`) VALUES
(157640659288, 0106999360433, 'Milan', 'Mandić', '1999-06-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(778876806391, 2306995360560, 'Pero', 'Ugrina', '1995-06-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(588378386841, 3111999360602, 'Ines', 'Štajduhar', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(835849339235, 1111996360241, 'Zoran', 'Pavković', '1996-11-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(792107200173, 0312992360402, 'Natko', 'Perić', '1992-12-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(874122373307, 2807998360231, 'Karmen', 'Štajduhar', '1998-07-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(177807996478, 0901996360561, 'Diana', 'Petrović', '1996-01-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(591562455420, 1610995360867, 'Ines', 'Antić', '1995-10-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(928711256115, 1301995360347, 'Pero', 'Bokulić', '1995-01-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(250455349393, 0508999360583, 'Milan', 'Nekić', '1999-08-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(905051123828, 0505992360446, 'Ivana', 'Hasić', '1992-05-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(751785906431, 1305994360776, 'Ana', 'Petrović', '1994-05-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(213404198546, 1411998360589, 'Petra', 'Valentić', '1998-11-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(894117482367, 0110992360006, 'Diana', 'Todeskini', '1992-10-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(846209289019, 3111995360155, 'Slaven', 'Hasić', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(138713533394, 3003990360441, 'Zoran', 'Antić', '1990-03-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(207305445659, 1505990360679, 'Mila', 'Hasić', '1990-05-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(443395700117, 1502990360001, 'Pero', 'Todeskini', '1990-02-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(748345310420, 2304999360152, 'Ivana', 'Perić', '1999-04-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(601875112414, 0808999360996, 'Viktor', 'Perić', '1999-08-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(283381034634, 1912998360903, 'Valentina', 'Kostrenčić', '1998-12-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(337389805884, 0601990360282, 'Petra', 'Vincetić', '1990-01-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(930274536648, 1108999360426, 'Željko', 'Nekić', '1999-08-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(709649322916, 0708994360094, 'Vanja', 'Graovac', '1994-08-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(584972734385, 0602991360761, 'Marko', 'Todeskini', '1991-02-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(670649121249, 2205993360059, 'Nataša', 'Frančić', '1993-05-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(317168025366, 2112995360397, 'Jakov', 'Sušanj', '1995-12-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(180478605669, 2110996360791, 'Ivan', 'Valentić', '1996-10-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(714374741518, 0206995360075, 'Slaven', 'Valentić', '1995-06-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(733322193654, 0208998360719, 'Mile', 'Marić', '1998-08-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(841037928615, 2506992360567, 'Iva', 'Štajduhar', '1992-06-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(655199777213, 2309990360926, 'Mila', 'Štajduhar', '1990-09-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(106250647366, 0410991360061, 'Ines', 'Marković', '1991-10-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(801932483204, 0501991360938, 'Manuela', 'Kostrenčić', '1991-01-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(286756987917, 1809990360246, 'Manuela', 'Ugrina', '1990-09-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(343387593205, 2206990360122, 'Petar', 'Štajduhar', '1990-06-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(450427514025, 0607997360076, 'Diana', 'Hasić', '1997-07-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(604668680160, 2308996360247, 'Ana', 'Marić', '1996-08-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(636990697269, 0106998360612, 'Natko', 'Koraca', '1998-06-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(134640850346, 1904992360251, 'Viktor', 'Marković', '1992-04-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(609208953286, 3109992360635, 'Ana', 'Sušanj', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(212573302039, 3108989360881, 'Manuela', 'Ugrina', '1989-08-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(101864074582, 3107996360910, 'Marko', 'Bokulić', '1996-07-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(816103693152, 0909998360610, 'Pero', 'Vincetić', '1998-09-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(126953816692, 3104998360008, 'Valentina', 'Antić', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(263694234514, 1903992360227, 'Manuela', 'Štajduhar', '1992-03-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(100925111343, 1711993360435, 'Ivan', 'Koraca', '1993-11-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(369315721665, 0412990360398, 'Karmen', 'Valentić', '1990-12-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(120555526540, 2112990360763, 'Željko', 'Graovac', '1990-12-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(565122989896, 0503995360921, 'Zoran', 'Pavković', '1995-03-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(195492594753, 1510992360018, 'Natko', 'Todeskini', '1992-10-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(312271456286, 1506991360367, 'Ivana', 'Marić', '1991-06-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(790233527941, 2309994360256, 'Ana', 'Hasić', '1994-09-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(923786403155, 1905995360082, 'Valentina', 'Antić', '1995-05-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(276689225686, 0511999360644, 'Marin', 'Graovac', '1999-11-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(189648109095, 0912994360734, 'Milan', 'Petrović', '1994-12-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(865621713671, 2408990360979, 'Iva', 'Mandić', '1990-08-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(175037864474, 1301998360553, 'Igor', 'Pavković', '1998-01-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(853661265250, 3009990360698, 'Mila', 'Pavković', '1990-09-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(486029529146, 1509992360281, 'Petra', 'Valentić', '1992-09-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(371875149982, 2208990360902, 'Diana', 'Pavković', '1990-08-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(280541558167, 1111999360864, 'Valentina', 'Marić', '1999-11-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(633466069858, 1002993360475, 'Mila', 'Štajduhar', '1993-02-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(482057440584, 1911989360124, 'Mila', 'Petrović', '1989-11-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(555035421332, 1911994360629, 'Ivana', 'Štajduhar', '1994-11-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(227079355101, 2310991360164, 'Natko', 'Frančić', '1991-10-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(334661718540, 2312991360157, 'Igor', 'Nekić', '1991-12-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(933050627649, 2705997360158, 'Viktor', 'Bokulić', '1997-05-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(648056634006, 1606995360304, 'Vanja', 'Antić', '1995-06-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(173572317860, 0211989360727, 'Mila', 'Marić', '1989-11-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(902072473370, 1608995360197, 'Manuela', 'Marić', '1995-08-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(441056151713, 3004996360326, 'Ines', 'Perić', '1996-04-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(613327967230, 2112998360077, 'Natko', 'Vincetić', '1998-12-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(104131397378, 1906998360729, 'Vanja', 'Mandić', '1998-06-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(875280016594, 1203989360301, 'Pero', 'Kostrenčić', '1989-03-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(373063096299, 2205989360065, 'Milan', 'Štajduhar', '1989-05-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(729765752053, 1108995360448, 'Ana', 'Marković', '1995-08-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(967868612276, 1401989360495, 'Mila', 'Valentić', '1989-01-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(345879243248, 2309991360467, 'Milan', 'Valentić', '1991-09-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(179739807521, 0311994360724, 'Ivana', 'Graovac', '1994-11-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(102485646593, 2407996360007, 'Željko', 'Nekić', '1996-07-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(197315193653, 1201992360176, 'Viktor', 'Sušanj', '1992-01-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(973909532664, 0506990360829, 'Mario', 'Graovac', '1990-06-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(708245806314, 0410997360215, 'Viktor', 'Hasić', '1997-10-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(313950671454, 0512997360724, 'Nataša', 'Štajduhar', '1997-12-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(146299180067, 1601997360353, 'Valentina', 'Kostrenčić', '1997-01-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(144686201284, 1104991360976, 'Iva', 'Koraca', '1991-04-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(106680394623, 1703989360646, 'Petra', 'Koraca', '1989-03-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(557301626823, 1006994360524, 'Igor', 'Bokulić', '1994-06-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(345482075510, 1803989360911, 'Ivan', 'Pavković', '1989-03-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(169398794903, 1311999360046, 'Ana', 'Bokulić', '1999-11-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(162262056857, 2105990360743, 'Ines', 'Štajduhar', '1990-05-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(199021618925, 0902994360006, 'Petar', 'Valentić', '1994-02-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(272651814964, 1108990360378, 'Diana', 'Bokulić', '1990-08-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(146307380994, 0212995360643, 'Igor', 'Marković', '1995-12-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(435185735792, 2604998360653, 'Ana', 'Nekić', '1998-04-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(365216984271, 0705995360540, 'Ivan', 'Štajduhar', '1995-05-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(382200682048, 2612991360578, 'Zoran', 'Nekić', '1991-12-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(147764932857, 1603999360486, 'Manuela', 'Sušanj', '1999-03-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(341624869064, 1405990360077, 'Petra', 'Ugrina', '1990-05-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(176558963374, 2809995360799, 'Manuela', 'Koraca', '1995-09-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(280821930698, 0807999360030, 'Jakov', 'Frančić', '1999-07-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(974710962562, 0804993360182, 'Željko', 'Frančić', '1993-04-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(150046799030, 1509994360383, 'Marko', 'Sušanj', '1994-09-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(980517042706, 2004995360597, 'Petar', 'Vincetić', '1995-04-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(926336592858, 2812992360661, 'Mario', 'Graovac', '1992-12-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(191069528555, 1207997360381, 'Ivan', 'Marić', '1997-07-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(112599993467, 2802998360392, 'Slaven', 'Mandić', '1998-02-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(565111949023, 1404997360016, 'Iva', 'Bokulić', '1997-04-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(390864548729, 2104995360576, 'Petra', 'Vincetić', '1995-04-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(554795152418, 1502995360407, 'Diana', 'Marković', '1995-02-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(219402357411, 1809992360108, 'Milan', 'Bokulić', '1992-09-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(344321407038, 2709991360997, 'Ana', 'Graovac', '1991-09-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(274285043763, 2008999360989, 'Ines', 'Nekić', '1999-08-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(478750236836, 1104999360744, 'Zoran', 'Bokulić', '1999-04-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(300940023320, 1011996360339, 'Karmen', 'Koraca', '1996-11-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(867127240114, 1707999360831, 'Pero', 'Petrović', '1999-07-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(887195180778, 1208994360404, 'Manuela', 'Marković', '1994-08-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(141285339973, 2609992360038, 'Ivan', 'Graovac', '1992-09-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(469155513253, 0107995360176, 'Igor', 'Koraca', '1995-07-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(208937547109, 1710989360894, 'Diana', 'Marković', '1989-10-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(563007942851, 2004992360161, 'Ana', 'Bokulić', '1992-04-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(445430126458, 2911996360480, 'Mario', 'Marić', '1996-11-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(718227827791, 3103999360993, 'Natko', 'Mandić', '1999-03-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(141631751941, 1611997360662, 'Ines', 'Todeskini', '1997-11-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(244165530416, 3011996360752, 'Mario', 'Petrović', '1996-11-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(508915415382, 0412999360897, 'Iva', 'Bokulić', '1999-12-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(325490081070, 1811992360156, 'Ivana', 'Nekić', '1992-11-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(202936202034, 1301995360888, 'Vanja', 'Marić', '1995-01-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(528233027186, 2308989360790, 'Iva', 'Marić', '1989-08-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(475718316023, 0804994360467, 'Nataša', 'Bokulić', '1994-04-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(229981874128, 2311994360819, 'Marin', 'Mandić', '1994-11-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(496731258006, 0603992360578, 'Karmen', 'Perić', '1992-03-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(920105257483, 0503997360983, 'Petra', 'Graovac', '1997-03-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(698660921101, 1801989360800, 'Željko', 'Petrović', '1989-01-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(859787483581, 0905997360477, 'Ivana', 'Kostrenčić', '1997-05-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(729740962347, 2506989360745, 'Ana', 'Pavković', '1989-06-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(789500308816, 2911994360409, 'Karmen', 'Valentić', '1994-11-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(486858927761, 0910994360269, 'Ivan', 'Frančić', '1994-10-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(602677020872, 0107991360408, 'Ines', 'Koraca', '1991-07-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(458063573007, 0502997360057, 'Valentina', 'Petrović', '1997-02-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(171803395575, 1010997360331, 'Zoran', 'Marić', '1997-10-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(705781884657, 2811997360446, 'Natko', 'Perić', '1997-11-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(484142381266, 1506992360877, 'Ivan', 'Štajduhar', '1992-06-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(461947332761, 2207991360499, 'Željko', 'Koraca', '1991-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(790350077692, 1111997360735, 'Mila', 'Frančić', '1997-11-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(430042405383, 3002990360280, 'Viktor', 'Sušanj', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(200120750862, 1405992360473, 'Ana', 'Sušanj', '1992-05-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(512343187512, 1207995360866, 'Karmen', 'Sušanj', '1995-07-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(135668792251, 2806992360669, 'Natko', 'Kostrenčić', '1992-06-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(949166395721, 0403996360308, 'Željko', 'Antić', '1996-03-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(394802533706, 1704996360240, 'Igor', 'Todeskini', '1996-04-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(179297862135, 2602991360149, 'Marin', 'Vincetić', '1991-02-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(754721279391, 0704991360762, 'Ivana', 'Marić', '1991-04-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(315669862189, 1908998360456, 'Iva', 'Ugrina', '1998-08-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(451375171765, 2008995360859, 'Marko', 'Perić', '1995-08-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(137936472041, 2206990360597, 'Ana', 'Hasić', '1990-06-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(597157874380, 2809998360984, 'Diana', 'Sušanj', '1998-09-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(478793721401, 1207994360779, 'Ivana', 'Štajduhar', '1994-07-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(312126319967, 0208996360931, 'Milan', 'Petrović', '1996-08-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(612632622292, 0304999360813, 'Mila', 'Graovac', '1999-04-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(500183544832, 2405989360128, 'Zoran', 'Perić', '1989-05-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(100926063475, 0310997360765, 'Ines', 'Frančić', '1997-10-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(144469929797, 0208999360603, 'Željko', 'Vincetić', '1999-08-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(882531282888, 2403993360821, 'Pero', 'Bokulić', '1993-03-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(229197074223, 1012991360217, 'Jakov', 'Sušanj', '1991-12-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(297076319332, 1904997360901, 'Karmen', 'Vincetić', '1997-04-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(348479425804, 1807998360642, 'Ines', 'Hasić', '1998-07-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(997212737224, 0410999360453, 'Diana', 'Kostrenčić', '1999-10-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(683633654458, 0105992360508, 'Igor', 'Sušanj', '1992-05-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(965101741166, 1808998360324, 'Ines', 'Valentić', '1998-08-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(574968433026, 1311992360040, 'Mario', 'Marić', '1992-11-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(450028522462, 0612993360953, 'Nataša', 'Kostrenčić', '1993-12-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(484654486425, 2801994360357, 'Ivan', 'Nekić', '1994-01-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(468097466419, 2503994360360, 'Mile', 'Valentić', '1994-03-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(544801779823, 1608998360987, 'Zoran', 'Perić', '1998-08-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(542631676366, 1110998360781, 'Nataša', 'Koraca', '1998-10-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(922155068846, 2003991360337, 'Petar', 'Ugrina', '1991-03-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(189747853087, 2904990360584, 'Nataša', 'Petrović', '1990-04-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(230693482798, 0707993360236, 'Karmen', 'Petrović', '1993-07-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(984755757399, 1704994360398, 'Slaven', 'Todeskini', '1994-04-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(163052827171, 0403993360610, 'Ivana', 'Pavković', '1993-03-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(789673975111, 2603990360586, 'Valentina', 'Graovac', '1990-03-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(643354922238, 0904996360155, 'Nataša', 'Marković', '1996-04-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(766978720092, 1912990360509, 'Natko', 'Nekić', '1990-12-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(322501787792, 0201989360027, 'Ivan', 'Vincetić', '1989-01-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(672509950950, 1405996360190, 'Valentina', 'Štajduhar', '1996-05-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(822747332704, 2512993360562, 'Nataša', 'Kostrenčić', '1993-12-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(569061999845, 3111996360962, 'Nataša', 'Valentić', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(585529399259, 1402995360821, 'Igor', 'Bokulić', '1995-02-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(804251835994, 2311989360638, 'Natko', 'Štajduhar', '1989-11-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(996483670676, 3101999360373, 'Ana', 'Marić', '1999-01-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(796630430434, 2504992360665, 'Ana', 'Hasić', '1992-04-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(841516334660, 2701993360548, 'Ivana', 'Ugrina', '1993-01-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(388532830876, 3012998360384, 'Valentina', 'Nekić', '1998-12-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(681394963847, 0705993360501, 'Natko', 'Todeskini', '1993-05-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(283840122467, 2209997360515, 'Mila', 'Vincetić', '1997-09-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(262633080765, 1406991360371, 'Ines', 'Štajduhar', '1991-06-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(323904589912, 2501989360898, 'Mario', 'Marić', '1989-01-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(996655253252, 2602998360860, 'Ana', 'Frančić', '1998-02-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(799921679767, 1511989360981, 'Vanja', 'Vincetić', '1989-11-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(728244108008, 1403999360664, 'Igor', 'Perić', '1999-03-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(182669314501, 2303999360433, 'Pero', 'Bokulić', '1999-03-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(737815802096, 1710993360674, 'Petra', 'Pavković', '1993-10-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(635748043780, 2407998360069, 'Nataša', 'Petrović', '1998-07-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(442312100790, 1105991360152, 'Natko', 'Nekić', '1991-05-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(279074248679, 0409994360140, 'Petra', 'Valentić', '1994-09-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(442356517368, 1004993360505, 'Natko', 'Hasić', '1993-04-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(705405618964, 2103991360939, 'Marko', 'Bokulić', '1991-03-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(805491977197, 2008992360231, 'Karmen', 'Graovac', '1992-08-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(379812989501, 1201998360001, 'Milan', 'Sušanj', '1998-01-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(768737761851, 2601998360724, 'Manuela', 'Nekić', '1998-01-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(334448516503, 3106993360928, 'Petra', 'Koraca', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(716237547086, 0201989360799, 'Iva', 'Mandić', '1989-01-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(858892512510, 2408999360313, 'Manuela', 'Koraca', '1999-08-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(210083191884, 1509993360984, 'Mila', 'Valentić', '1993-09-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(675778142882, 1605994360029, 'Marko', 'Sušanj', '1994-05-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(870616151502, 0111995360212, 'Karmen', 'Kostrenčić', '1995-11-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(188918048800, 2708995360987, 'Ana', 'Todeskini', '1995-08-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(590511390950, 1212997360523, 'Slaven', 'Ugrina', '1997-12-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(958065879844, 0107996360026, 'Mila', 'Štajduhar', '1996-07-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(571082472042, 2807997360235, 'Mila', 'Frančić', '1997-07-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(367710169732, 0407997360939, 'Diana', 'Hasić', '1997-07-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(788119130609, 1001995360793, 'Manuela', 'Antić', '1995-01-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(576898031009, 2310998360875, 'Viktor', 'Nekić', '1998-10-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(477377044833, 3001997360095, 'Mile', 'Bokulić', '1997-01-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(592580470441, 0702997360232, 'Manuela', 'Marić', '1997-02-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(511854956039, 0612996360253, 'Natko', 'Petrović', '1996-12-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(830358540512, 0402992360554, 'Jakov', 'Mandić', '1992-02-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(457753974100, 2511998360716, 'Nikola', 'Perić', '1998-11-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(483513851748, 1011998360843, 'Mila', 'Pavković', '1998-11-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(339339743621, 2708999360837, 'Karmen', 'Graovac', '1999-08-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(990482540139, 1505998360329, 'Natko', 'Frančić', '1998-05-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(512831086369, 2602998360565, 'Ana', 'Štajduhar', '1998-02-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(834128916002, 2406992360278, 'Iva', 'Ugrina', '1992-06-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(428021739151, 1407995360462, 'Natko', 'Perić', '1995-07-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(411337582146, 0603994360116, 'Pero', 'Vincetić', '1994-03-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(354974836087, 1912996360307, 'Željko', 'Frančić', '1996-12-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(294659305378, 2405996360336, 'Diana', 'Petrović', '1996-05-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(644418315789, 1702997360399, 'Ivan', 'Antić', '1997-02-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(492188524608, 1804993360917, 'Željko', 'Antić', '1993-04-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(877567303642, 2008990360034, 'Ines', 'Kostrenčić', '1990-08-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(583565091601, 0404993360634, 'Ivan', 'Marković', '1993-04-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(409829270517, 0205997360368, 'Ana', 'Marić', '1997-05-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(562587388761, 1908994360610, 'Diana', 'Pavković', '1994-08-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(718989894441, 0112990360294, 'Iva', 'Koraca', '1990-12-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(996518228131, 1901990360921, 'Manuela', 'Antić', '1990-01-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(432742988907, 2706998360725, 'Mario', 'Marić', '1998-06-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(407717315702, 1302991360604, 'Pero', 'Antić', '1991-02-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(757726760986, 2811997360822, 'Mila', 'Frančić', '1997-11-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(272203652420, 0401990360448, 'Diana', 'Perić', '1990-01-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(757610552676, 0202994360847, 'Ana', 'Bokulić', '1994-02-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(942254035183, 0406991360721, 'Marko', 'Štajduhar', '1991-06-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(248806397714, 1907991360163, 'Ivan', 'Hasić', '1991-07-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(572312727259, 0203991360108, 'Viktor', 'Nekić', '1991-03-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(123271842063, 0901993360591, 'Diana', 'Todeskini', '1993-01-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(860354237373, 3107997360755, 'Ivan', 'Vincetić', '1997-07-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(215741101689, 2009998360515, 'Karmen', 'Nekić', '1998-09-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(414158125810, 2501993360099, 'Mila', 'Marić', '1993-01-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(796581979020, 2609997360985, 'Ivana', 'Vincetić', '1997-09-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(294294452122, 1511993360581, 'Mila', 'Frančić', '1993-11-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(804007352298, 1401989360429, 'Natko', 'Petrović', '1989-01-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(492611805819, 2010996360090, 'Nataša', 'Mandić', '1996-10-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(733727643414, 2203990360081, 'Zoran', 'Perić', '1990-03-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(332339476687, 1503997360344, 'Milan', 'Valentić', '1997-03-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(911059024207, 0406997360731, 'Petra', 'Ugrina', '1997-06-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(469233534012, 2809999360342, 'Ivan', 'Pavković', '1999-09-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(283168567160, 3111993360075, 'Nikola', 'Antić', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(993012352293, 2607993360344, 'Natko', 'Ugrina', '1993-07-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(132647845399, 1605995360027, 'Ana', 'Nekić', '1995-05-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(689523398758, 1101995360722, 'Nataša', 'Kostrenčić', '1995-01-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(746739662620, 1304998360264, 'Vanja', 'Ugrina', '1998-04-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(310897701984, 2905992360263, 'Manuela', 'Marić', '1992-05-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(427630729152, 1509989360080, 'Nikola', 'Ugrina', '1989-09-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(629567872472, 1008989360009, 'Iva', 'Kostrenčić', '1989-08-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(613138861461, 1505990360254, 'Milan', 'Pavković', '1990-05-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(219937042355, 1906998360417, 'Nataša', 'Hasić', '1998-06-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(694215121616, 0601997360030, 'Iva', 'Petrović', '1997-01-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(251601393474, 2509992360816, 'Nikola', 'Frančić', '1992-09-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(160239587215, 1110994360472, 'Iva', 'Petrović', '1994-10-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(728479162917, 0309998360460, 'Iva', 'Nekić', '1998-09-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(940094765450, 0902997360825, 'Slaven', 'Bokulić', '1997-02-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(216286069147, 2007998360740, 'Nataša', 'Štajduhar', '1998-07-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(584086972559, 0710992360937, 'Nataša', 'Bokulić', '1992-10-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(212684566395, 3107991360080, 'Viktor', 'Graovac', '1991-07-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(473079639260, 2809995360805, 'Slaven', 'Marić', '1995-09-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(439397186844, 0309997360581, 'Ana', 'Sušanj', '1997-09-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(461976706482, 1012996360979, 'Ivana', 'Nekić', '1996-12-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(952495668638, 0702998360398, 'Natko', 'Hasić', '1998-02-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(932750973067, 3110996360777, 'Milan', 'Pavković', '1996-10-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(747126126994, 1402994360073, 'Ivana', 'Marić', '1994-02-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(615385580630, 2011997360544, 'Jakov', 'Nekić', '1997-11-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(317265432317, 1801994360732, 'Ana', 'Todeskini', '1994-01-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(994208084031, 0902999360798, 'Nikola', 'Sušanj', '1999-02-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(563743075173, 1803994360030, 'Ines', 'Štajduhar', '1994-03-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(615928414654, 1309996360452, 'Iva', 'Bokulić', '1996-09-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(570111895569, 2809990360898, 'Ivana', 'Bokulić', '1990-09-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(270622901610, 0101993360454, 'Ana', 'Frančić', '1993-01-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(976577327361, 0912991360084, 'Nataša', 'Ugrina', '1991-12-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(767868770791, 0508994360091, 'Mila', 'Kostrenčić', '1994-08-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(729343765416, 0906994360602, 'Željko', 'Todeskini', '1994-06-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(325242915461, 0107990360774, 'Nataša', 'Sušanj', '1990-07-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(196258088505, 1605993360271, 'Diana', 'Pavković', '1993-05-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(884595501843, 0209993360008, 'Jakov', 'Koraca', '1993-09-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(867825146776, 0412998360177, 'Ivan', 'Ugrina', '1998-12-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(775114525417, 0808996360738, 'Viktor', 'Ugrina', '1996-08-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(579236948506, 0302989360184, 'Ana', 'Frančić', '1989-02-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(323306156268, 1301996360924, 'Nataša', 'Mandić', '1996-01-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(235298012081, 0109994360974, 'Ivan', 'Bokulić', '1994-09-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(780477757507, 2103990360791, 'Manuela', 'Frančić', '1990-03-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(549362419637, 2705990360909, 'Ivan', 'Sušanj', '1990-05-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(431407846155, 2611994360626, 'Manuela', 'Todeskini', '1994-11-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(771055223070, 0108997360482, 'Milan', 'Frančić', '1997-08-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(658105155740, 2903999360724, 'Manuela', 'Koraca', '1999-03-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(918713822019, 1909996360788, 'Natko', 'Hasić', '1996-09-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(496892917685, 2410993360928, 'Željko', 'Bokulić', '1993-10-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(493599277016, 1301997360271, 'Pero', 'Perić', '1997-01-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(239995930002, 0912994360263, 'Karmen', 'Sušanj', '1994-12-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(721786818871, 2812994360121, 'Karmen', 'Vincetić', '1994-12-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(378492451402, 2912996360865, 'Milan', 'Ugrina', '1996-12-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(395005014083, 3002989360766, 'Petra', 'Perić', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(257288527625, 2507993360263, 'Valentina', 'Hasić', '1993-07-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(401235853305, 0203996360118, 'Petar', 'Koraca', '1996-03-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(698848069220, 2305990360222, 'Mario', 'Kostrenčić', '1990-05-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(401366993306, 2910997360769, 'Ivan', 'Mandić', '1997-10-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(220436755523, 2406993360766, 'Pero', 'Marković', '1993-06-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(855914862300, 1012991360241, 'Nikola', 'Frančić', '1991-12-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(222461714736, 2809996360673, 'Petra', 'Pavković', '1996-09-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(897892100867, 1502997360358, 'Mile', 'Kostrenčić', '1997-02-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(760125050124, 1708990360304, 'Diana', 'Marić', '1990-08-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `osz_ucenik` (`oib`, `jmbg`, `ime`, `prezime`, `datum_rodjenja`, `spol`, `otac_ime_nom`, `otac_ime_gen`, `majka_ime_nom`, `majka_ime_gen`, `majka_djevojacko`, `stranac`, `skolovanje_izvan_rh`, `sportas`, `broj_domovnice`, `smb`, `smb_datum_od`, `smb_datum_do`, `hospitant`, `mjesto_rodjenja_id`, `narodnost_id`, `nacionalna_manjina_id`, `vrsta_putnika_id`, `otac_zanimanje_id`, `majka_zanimanje_id`) VALUES
(347928923536, 2503992360953, 'Jakov', 'Hasić', '1992-03-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(836075393633, 1304992360476, 'Diana', 'Valentić', '1992-04-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(232505479704, 2512999360714, 'Željko', 'Koraca', '1999-12-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(106434152140, 2102996360015, 'Ivan', 'Ugrina', '1996-02-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(560515912082, 2511997360283, 'Nataša', 'Mandić', '1997-11-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(768261098861, 1803993360731, 'Nataša', 'Štajduhar', '1993-03-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(609431327554, 3106997360898, 'Petra', 'Mandić', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(824448868247, 1611993360550, 'Ivana', 'Kostrenčić', '1993-11-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(161604839774, 1111998360640, 'Mario', 'Nekić', '1998-11-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(261640213000, 0307998360883, 'Milan', 'Petrović', '1998-07-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(164810801380, 2509996360693, 'Iva', 'Mandić', '1996-09-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(265267885652, 0812991360463, 'Mario', 'Hasić', '1991-12-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(397192615649, 1603997360356, 'Petar', 'Valentić', '1997-03-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(675192267441, 0309991360958, 'Milan', 'Frančić', '1991-09-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(562950911630, 2805990360553, 'Ivan', 'Bokulić', '1990-05-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(760278657972, 1202998360617, 'Manuela', 'Graovac', '1998-02-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(160473537623, 1412994360404, 'Petra', 'Marković', '1994-12-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(392027371235, 2109992360267, 'Diana', 'Perić', '1992-09-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(179313250082, 2309989360287, 'Diana', 'Valentić', '1989-09-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(848102169862, 1002991360641, 'Nataša', 'Frančić', '1991-02-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(155888731868, 0807994360546, 'Marko', 'Hasić', '1994-07-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(787406828374, 2602998360928, 'Zoran', 'Nekić', '1998-02-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(698275343442, 1103998360070, 'Petra', 'Marić', '1998-03-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(658393786977, 1904996360464, 'Ivana', 'Pavković', '1996-04-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(954376682947, 2306990360072, 'Iva', 'Graovac', '1990-06-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(854529297707, 2811998360582, 'Pero', 'Vincetić', '1998-11-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(226691650546, 0305999360702, 'Mario', 'Kostrenčić', '1999-05-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(287264895282, 2704990360072, 'Karmen', 'Koraca', '1990-04-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(612075094305, 0301989360705, 'Manuela', 'Štajduhar', '1989-01-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(528352533540, 2607997360650, 'Mile', 'Kostrenčić', '1997-07-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(436482310896, 0805998360316, 'Valentina', 'Kostrenčić', '1998-05-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(118510143536, 2509997360282, 'Ivana', 'Frančić', '1997-09-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(755629877560, 1107994360668, 'Viktor', 'Kostrenčić', '1994-07-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(429788412069, 0712999360386, 'Željko', 'Štajduhar', '1999-12-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(318814606590, 1306993360255, 'Jakov', 'Marković', '1993-06-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(212809053596, 2301999360190, 'Petar', 'Pavković', '1999-01-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(359169366358, 2403998360380, 'Zoran', 'Perić', '1998-03-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(430299346520, 1310989360513, 'Željko', 'Ugrina', '1989-10-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(267742556351, 0107999360338, 'Vanja', 'Pavković', '1999-07-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(399598408991, 0111991360378, 'Mile', 'Kostrenčić', '1991-11-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(677194024948, 2801990360422, 'Valentina', 'Bokulić', '1990-01-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(442353942056, 2605996360264, 'Petra', 'Bokulić', '1996-05-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(547829217670, 2403999360789, 'Nikola', 'Perić', '1999-03-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(383849197384, 1210995360323, 'Natko', 'Mandić', '1995-10-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(695495619472, 2207990360952, 'Jakov', 'Mandić', '1990-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(920878095514, 1801995360681, 'Igor', 'Vincetić', '1995-01-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(258986542698, 2201995360369, 'Karmen', 'Ugrina', '1995-01-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(921073180144, 1412997360507, 'Natko', 'Petrović', '1997-12-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(215101396371, 1110999360925, 'Diana', 'Kostrenčić', '1999-10-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(667011034734, 1410995360581, 'Diana', 'Mandić', '1995-10-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(588192116982, 0507990360514, 'Marin', 'Marić', '1990-07-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(953392794219, 1607989360516, 'Ines', 'Marić', '1989-07-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(169884379984, 2811989360056, 'Mile', 'Bokulić', '1989-11-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(453540429329, 0806990360020, 'Marko', 'Bokulić', '1990-06-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(646495878388, 1110993360703, 'Diana', 'Marić', '1993-10-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(110314208055, 0810991360705, 'Nikola', 'Hasić', '1991-10-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(652449752579, 0211997360943, 'Mile', 'Hasić', '1997-11-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(232688599478, 3001994360231, 'Mile', 'Pavković', '1994-01-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(437133132184, 1410990360170, 'Petra', 'Koraca', '1990-10-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(959749054875, 2912995360506, 'Manuela', 'Todeskini', '1995-12-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(787530609674, 1505995360590, 'Karmen', 'Kostrenčić', '1995-05-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(372935069425, 1009993360369, 'Jakov', 'Antić', '1993-09-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(521177410153, 2505992360472, 'Karmen', 'Sušanj', '1992-05-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(318470508843, 1208990360414, 'Petra', 'Graovac', '1990-08-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(610054318032, 1606990360944, 'Iva', 'Perić', '1990-06-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(301634489899, 2403991360257, 'Ines', 'Hasić', '1991-03-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(839262679802, 1809994360946, 'Manuela', 'Pavković', '1994-09-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(481376471221, 2706998360281, 'Manuela', 'Antić', '1998-06-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(138050199671, 1003992360983, 'Valentina', 'Ugrina', '1992-03-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(119220833063, 1004999360784, 'Mario', 'Sušanj', '1999-04-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(418238761169, 0407992360245, 'Diana', 'Mandić', '1992-07-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(433073995427, 1301999360239, 'Ana', 'Štajduhar', '1999-01-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(550141935938, 0510993360926, 'Marko', 'Graovac', '1993-10-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(407676037987, 0906994360254, 'Iva', 'Koraca', '1994-06-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(244526249692, 1811999360474, 'Mila', 'Nekić', '1999-11-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(147811286071, 2408995360843, 'Nataša', 'Marić', '1995-08-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(927858745414, 2607992360060, 'Ivana', 'Vincetić', '1992-07-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(595218576007, 0908992360505, 'Ines', 'Hasić', '1992-08-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(380424937562, 2710992360610, 'Petra', 'Marković', '1992-10-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(638608957873, 1011996360823, 'Iva', 'Bokulić', '1996-11-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(350981664532, 1811998360483, 'Valentina', 'Antić', '1998-11-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(376007643428, 2609999360822, 'Iva', 'Koraca', '1999-09-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(438760478276, 2209999360359, 'Vanja', 'Štajduhar', '1999-09-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(945223100804, 1507990360100, 'Mila', 'Sušanj', '1990-07-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(716481826436, 0112992360490, 'Mila', 'Kostrenčić', '1992-12-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(165018438473, 1912996360707, 'Iva', 'Kostrenčić', '1996-12-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(178342078935, 1910990360469, 'Diana', 'Pavković', '1990-10-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(678200206020, 0103998360452, 'Zoran', 'Ugrina', '1998-03-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(293553663748, 1105990360360, 'Diana', 'Petrović', '1990-05-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(338538431855, 2103996360857, 'Ivana', 'Valentić', '1996-03-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(659132309577, 1701991360150, 'Ines', 'Štajduhar', '1991-01-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(877327812844, 1306994360854, 'Zoran', 'Valentić', '1994-06-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(555234308857, 2105996360995, 'Pero', 'Antić', '1996-05-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(746182128588, 3007990360804, 'Jakov', 'Perić', '1990-07-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(873340699107, 0810998360566, 'Marko', 'Perić', '1998-10-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(657537980775, 0305996360245, 'Mario', 'Marković', '1996-05-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(997076517980, 2912999360567, 'Marin', 'Marić', '1999-12-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(667323813718, 0310995360039, 'Ivan', 'Bokulić', '1995-10-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(902817198959, 2310992360255, 'Zoran', 'Graovac', '1992-10-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(534621788511, 2605989360635, 'Petar', 'Nekić', '1989-05-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(394889957364, 1005990360496, 'Petra', 'Sušanj', '1990-05-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(287392525930, 1604999360215, 'Milan', 'Štajduhar', '1999-04-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(825463548740, 0603993360178, 'Petra', 'Marković', '1993-03-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(658951303545, 0804989360842, 'Nikola', 'Bokulić', '1989-04-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(821230612911, 2604993360335, 'Iva', 'Pavković', '1993-04-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(442996604948, 1405990360754, 'Ana', 'Marić', '1990-05-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(225330134442, 0101999360642, 'Željko', 'Petrović', '1999-01-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(963340031137, 2511991360399, 'Mile', 'Frančić', '1991-11-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(382601569483, 2212992360816, 'Valentina', 'Sušanj', '1992-12-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(389662299128, 2512997360850, 'Ines', 'Valentić', '1997-12-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(821655023002, 0403991360706, 'Manuela', 'Ugrina', '1991-03-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(544728830067, 0107994360260, 'Diana', 'Hasić', '1994-07-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(786709629172, 1605994360590, 'Vanja', 'Petrović', '1994-05-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(853422317763, 1407994360313, 'Natko', 'Valentić', '1994-07-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(889606870324, 0508999360792, 'Ines', 'Marić', '1999-08-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(387822423011, 2301989360049, 'Ana', 'Todeskini', '1989-01-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(797939716817, 1701997360381, 'Pero', 'Koraca', '1997-01-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(514623648622, 3104997360411, 'Karmen', 'Frančić', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(660731781065, 1306999360193, 'Manuela', 'Marić', '1999-06-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(514738832334, 0701992360807, 'Slaven', 'Marić', '1992-01-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(275831533661, 2204996360474, 'Mile', 'Frančić', '1996-04-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(571810767032, 2803993360769, 'Ana', 'Vincetić', '1993-03-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(813424283331, 0306998360676, 'Manuela', 'Todeskini', '1998-06-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(806229399886, 2503992360576, 'Milan', 'Mandić', '1992-03-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(276485413649, 0204994360258, 'Milan', 'Marić', '1994-04-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(658425525868, 2308994360075, 'Marko', 'Graovac', '1994-08-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(545840207958, 1305989360890, 'Marko', 'Marković', '1989-05-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(583163517916, 0304992360574, 'Zoran', 'Todeskini', '1992-04-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(105691761097, 0901991360570, 'Valentina', 'Hasić', '1991-01-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(621785408424, 2106994360261, 'Slaven', 'Koraca', '1994-06-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(929904711263, 0604989360905, 'Nikola', 'Marić', '1989-04-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(705040342651, 2009990360060, 'Vanja', 'Vincetić', '1990-09-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(966595451172, 2010994360393, 'Slaven', 'Ugrina', '1994-10-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(609116922776, 2803997360297, 'Željko', 'Nekić', '1997-03-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(997616385568, 0805997360649, 'Marko', 'Kostrenčić', '1997-05-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(260926359735, 1211993360297, 'Iva', 'Todeskini', '1993-11-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(343925609542, 1206999360768, 'Nikola', 'Sušanj', '1999-06-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(188346670167, 2306999360113, 'Petar', 'Kostrenčić', '1999-06-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(565993120511, 1105997360015, 'Manuela', 'Koraca', '1997-05-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(277841964334, 3006996360625, 'Milan', 'Ugrina', '1996-06-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(344460469835, 2401993360884, 'Zoran', 'Ugrina', '1993-01-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(391549647685, 2708993360789, 'Manuela', 'Sušanj', '1993-08-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(797057185833, 1212989360816, 'Ivan', 'Pavković', '1989-12-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(219079472480, 2009993360296, 'Ivana', 'Frančić', '1993-09-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(312652808541, 0705994360402, 'Ana', 'Todeskini', '1994-05-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(236937719173, 2405989360189, 'Igor', 'Koraca', '1989-05-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(465882499801, 0405997360974, 'Nataša', 'Frančić', '1997-05-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(940674425805, 0109994360824, 'Petra', 'Todeskini', '1994-09-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(524445825573, 0307992360575, 'Iva', 'Ugrina', '1992-07-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(244206817342, 0411998360591, 'Manuela', 'Antić', '1998-11-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(477112343239, 1103991360183, 'Željko', 'Nekić', '1991-03-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(979498171393, 2111999360558, 'Nataša', 'Antić', '1999-11-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(466760597492, 3111992360338, 'Željko', 'Koraca', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(522450160003, 2509989360946, 'Iva', 'Mandić', '1989-09-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(371304022732, 0604989360711, 'Iva', 'Marić', '1989-04-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(868803504801, 1902995360795, 'Valentina', 'Frančić', '1995-02-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(202533189247, 1512997360494, 'Nataša', 'Kostrenčić', '1997-12-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(341363197162, 2603999360338, 'Manuela', 'Valentić', '1999-03-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(982462631734, 2802998360006, 'Ana', 'Frančić', '1998-02-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(376909758849, 1105999360530, 'Ana', 'Graovac', '1999-05-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(456696350755, 1001993360895, 'Nikola', 'Koraca', '1993-01-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(804202515554, 2904991360625, 'Jakov', 'Mandić', '1991-04-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(686146365681, 1701998360912, 'Zoran', 'Hasić', '1998-01-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(146695610799, 2012998360146, 'Diana', 'Graovac', '1998-12-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(875689655547, 1603991360884, 'Nataša', 'Graovac', '1991-03-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(996999754083, 0711999360911, 'Mile', 'Perić', '1999-11-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(947323265054, 1806998360174, 'Mario', 'Petrović', '1998-06-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(157896481973, 3107990360748, 'Ines', 'Ugrina', '1990-07-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(195535145653, 0706993360453, 'Natko', 'Ugrina', '1993-06-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(989728930374, 1902996360045, 'Petar', 'Ugrina', '1996-02-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(517054159220, 3101995360099, 'Valentina', 'Pavković', '1995-01-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(783428128189, 0106997360988, 'Ivana', 'Marić', '1997-06-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(200402603183, 1908989360760, 'Zoran', 'Graovac', '1989-08-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(235121187784, 1112994360445, 'Igor', 'Valentić', '1994-12-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(911740313368, 1311998360079, 'Vanja', 'Frančić', '1998-11-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(926775529400, 2102994360837, 'Mile', 'Antić', '1994-02-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(868444380439, 0509992360557, 'Ivana', 'Mandić', '1992-09-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(602716938663, 0605989360790, 'Valentina', 'Frančić', '1989-05-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(677061613021, 2810996360234, 'Ivana', 'Kostrenčić', '1996-10-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(799334652325, 1205989360331, 'Nikola', 'Perić', '1989-05-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(976182426839, 3109993360628, 'Milan', 'Mandić', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(269419539275, 3008992360573, 'Jakov', 'Petrović', '1992-08-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(616002201837, 1005994360774, 'Ines', 'Hasić', '1994-05-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(553215738186, 1802996360102, 'Diana', 'Nekić', '1996-02-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(169340316477, 2501994360081, 'Mile', 'Mandić', '1994-01-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(941709627678, 0807995360022, 'Ivan', 'Ugrina', '1995-07-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(948718120780, 0211998360386, 'Ivan', 'Bokulić', '1998-11-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(597284664558, 1304991360074, 'Jakov', 'Mandić', '1991-04-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(452268482713, 1002994360486, 'Pero', 'Nekić', '1994-02-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(607083056211, 1812994360268, 'Manuela', 'Ugrina', '1994-12-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(341384490342, 2805991360367, 'Viktor', 'Sušanj', '1991-05-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(903019748161, 0205993360107, 'Marin', 'Ugrina', '1993-05-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(975405815256, 2301997360180, 'Manuela', 'Sušanj', '1997-01-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(272896023005, 1109999360115, 'Valentina', 'Marić', '1999-09-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(115587180872, 1211995360265, 'Vanja', 'Ugrina', '1995-11-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(848898702664, 2707989360876, 'Valentina', 'Marković', '1989-07-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(582302950469, 0809997360373, 'Vanja', 'Pavković', '1997-09-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(195742644328, 0601996360916, 'Karmen', 'Štajduhar', '1996-01-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(736328410489, 0803991360154, 'Petar', 'Pavković', '1991-03-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(713992005226, 1103997360008, 'Slaven', 'Frančić', '1997-03-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(121827670841, 1111990360737, 'Igor', 'Kostrenčić', '1990-11-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(727996529437, 1408997360470, 'Viktor', 'Marković', '1997-08-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(677082737301, 0911996360898, 'Valentina', 'Petrović', '1996-11-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(559923516385, 0104995360563, 'Petra', 'Štajduhar', '1995-04-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(821842232588, 0206995360776, 'Igor', 'Kostrenčić', '1995-06-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(989738369826, 3109991360525, 'Mila', 'Bokulić', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(432223703428, 1601990360742, 'Mario', 'Štajduhar', '1990-01-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(252429004021, 0306995360445, 'Karmen', 'Todeskini', '1995-06-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(817090171636, 2110997360352, 'Valentina', 'Perić', '1997-10-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(323437083857, 0902997360294, 'Mile', 'Štajduhar', '1997-02-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(476734627700, 2608995360984, 'Viktor', 'Marković', '1995-08-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(543010768318, 1408989360478, 'Jakov', 'Antić', '1989-08-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(678687912527, 1404999360053, 'Mile', 'Frančić', '1999-04-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(591688532833, 0211990360753, 'Iva', 'Pavković', '1990-11-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(115385086803, 0311999360005, 'Karmen', 'Koraca', '1999-11-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(254598609499, 3111992360563, 'Diana', 'Marković', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(878811861697, 2912990360952, 'Zoran', 'Vincetić', '1990-12-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(404300469478, 1205989360966, 'Marin', 'Hasić', '1989-05-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(305183697006, 0208998360859, 'Ines', 'Nekić', '1998-08-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(707590970669, 2802990360378, 'Petar', 'Koraca', '1990-02-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(547512621845, 3106997360656, 'Viktor', 'Perić', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(337835575051, 0407992360093, 'Mario', 'Sušanj', '1992-07-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(535981412943, 0202990360727, 'Pero', 'Petrović', '1990-02-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(815331321548, 0202995360571, 'Nataša', 'Ugrina', '1995-02-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(782224025281, 2707995360319, 'Željko', 'Marković', '1995-07-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(693983732295, 1604998360860, 'Karmen', 'Nekić', '1998-04-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(384195170559, 0701992360266, 'Nataša', 'Bokulić', '1992-01-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(780640522555, 0305996360773, 'Ines', 'Sušanj', '1996-05-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(267658199557, 0306995360280, 'Marko', 'Pavković', '1995-06-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(100669160523, 3111998360514, 'Mila', 'Todeskini', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(491964444229, 1306989360574, 'Mile', 'Koraca', '1989-06-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(608845759255, 0301989360218, 'Mila', 'Pavković', '1989-01-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(652956357359, 1903990360024, 'Marin', 'Valentić', '1990-03-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(628174640851, 2601992360591, 'Igor', 'Todeskini', '1992-01-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(281681269395, 1607990360821, 'Zoran', 'Perić', '1990-07-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(495901045564, 0212998360694, 'Natko', 'Antić', '1998-12-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(969818059046, 1204996360670, 'Marko', 'Vincetić', '1996-04-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(980527080357, 1306992360417, 'Mila', 'Hasić', '1992-06-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(953418832366, 0605996360267, 'Ivana', 'Todeskini', '1996-05-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(743216498750, 2911992360980, 'Valentina', 'Graovac', '1992-11-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(743406975705, 0605991360996, 'Petar', 'Perić', '1991-05-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(639146388618, 2309994360130, 'Ines', 'Štajduhar', '1994-09-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(436491888539, 2708997360813, 'Valentina', 'Hasić', '1997-08-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(134128736415, 1203994360708, 'Iva', 'Štajduhar', '1994-03-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(306698381538, 0606991360070, 'Mario', 'Koraca', '1991-06-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(489536148669, 2401990360517, 'Slaven', 'Kostrenčić', '1990-01-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(653949776781, 1709993360848, 'Željko', 'Vincetić', '1993-09-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(565154819558, 2401997360926, 'Iva', 'Koraca', '1997-01-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(276098705785, 0507990360888, 'Karmen', 'Hasić', '1990-07-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(358830951460, 1202994360240, 'Ines', 'Ugrina', '1994-02-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(411263877929, 2305994360438, 'Ivan', 'Valentić', '1994-05-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(794390767012, 0202997360975, 'Ana', 'Bokulić', '1997-02-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(644846627707, 2411997360554, 'Ivana', 'Antić', '1997-11-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(695719057932, 2312991360447, 'Diana', 'Koraca', '1991-12-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(527592509524, 1304994360027, 'Slaven', 'Todeskini', '1994-04-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(169394268418, 2906998360971, 'Ivana', 'Petrović', '1998-06-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(486627917306, 1704998360113, 'Nikola', 'Valentić', '1998-04-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(394474749031, 2608989360009, 'Iva', 'Graovac', '1989-08-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(623797455065, 0306995360980, 'Ivana', 'Todeskini', '1995-06-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(854169339899, 2205994360448, 'Valentina', 'Ugrina', '1994-05-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(765328935289, 0503990360562, 'Ivana', 'Sušanj', '1990-03-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(433338560675, 0801993360583, 'Mila', 'Marković', '1993-01-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(150950393339, 2609999360741, 'Mila', 'Koraca', '1999-09-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(711476984681, 0102990360521, 'Željko', 'Sušanj', '1990-02-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(862259089095, 2011992360955, 'Ivan', 'Hasić', '1992-11-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(778695912841, 1111992360248, 'Petar', 'Nekić', '1992-11-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(440499562404, 3107993360979, 'Milan', 'Marković', '1993-07-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(816234383923, 2709999360829, 'Ana', 'Antić', '1999-09-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(457300148937, 2409992360325, 'Ana', 'Perić', '1992-09-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(823056804537, 0312997360421, 'Mario', 'Antić', '1997-12-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(543811452336, 0901995360457, 'Pero', 'Frančić', '1995-01-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(205584537591, 0802996360051, 'Valentina', 'Pavković', '1996-02-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(196368960031, 2806996360306, 'Petra', 'Frančić', '1996-06-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(688498857320, 2403990360298, 'Mila', 'Valentić', '1990-03-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(466788156369, 2310995360628, 'Manuela', 'Nekić', '1995-10-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(945258325182, 1206996360208, 'Marin', 'Bokulić', '1996-06-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(947546029591, 1005997360420, 'Mario', 'Petrović', '1997-05-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(322148731115, 2312995360106, 'Marko', 'Nekić', '1995-12-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(493318785746, 2201999360764, 'Valentina', 'Sušanj', '1999-01-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(590651288386, 0702997360934, 'Iva', 'Marić', '1997-02-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(836206998177, 0211997360828, 'Slaven', 'Petrović', '1997-11-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(388045835714, 0805989360505, 'Slaven', 'Štajduhar', '1989-05-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(558234027322, 2607996360790, 'Marin', 'Pavković', '1996-07-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(923169667135, 2208995360577, 'Petar', 'Ugrina', '1995-08-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(563789896452, 2803999360923, 'Mile', 'Perić', '1999-03-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(123479328617, 1806994360190, 'Ana', 'Vincetić', '1994-06-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(660184930481, 2508999360605, 'Ana', 'Ugrina', '1999-08-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(239200018714, 0111994360371, 'Zoran', 'Frančić', '1994-11-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(989705865709, 1707998360541, 'Ana', 'Marković', '1998-07-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(679713468954, 0606999360246, 'Ivan', 'Štajduhar', '1999-06-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(243132524016, 2207999360572, 'Marko', 'Antić', '1999-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(788227764250, 1302999360848, 'Pero', 'Valentić', '1999-02-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(701878842940, 1706995360130, 'Karmen', 'Antić', '1995-06-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(219712857219, 3107996360696, 'Jakov', 'Petrović', '1996-07-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(426723022599, 2612999360647, 'Natko', 'Koraca', '1999-12-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(796885093090, 1703990360366, 'Milan', 'Petrović', '1990-03-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(727525610824, 0606999360210, 'Manuela', 'Graovac', '1999-06-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(294098269651, 1102995360401, 'Jakov', 'Ugrina', '1995-02-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(163308512676, 3012994360561, 'Ana', 'Marić', '1994-12-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(388801591546, 2809998360142, 'Željko', 'Pavković', '1998-09-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(311079788460, 2802999360464, 'Zoran', 'Ugrina', '1999-02-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(516982091185, 1907989360152, 'Marin', 'Bokulić', '1989-07-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(656263749251, 1510996360187, 'Diana', 'Nekić', '1996-10-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(419263248010, 2207999360753, 'Viktor', 'Todeskini', '1999-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(899306983481, 2805989360659, 'Željko', 'Valentić', '1989-05-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(133239908305, 0508994360376, 'Pero', 'Ugrina', '1994-08-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(159868879423, 1503990360454, 'Karmen', 'Marković', '1990-03-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(969011165380, 2312997360665, 'Mario', 'Todeskini', '1997-12-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(784910597473, 0701998360042, 'Petra', 'Marić', '1998-01-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(200003305386, 1707994360692, 'Petra', 'Antić', '1994-07-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(881525950407, 0411990360640, 'Iva', 'Koraca', '1990-11-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(274045756663, 2203991360047, 'Zoran', 'Bokulić', '1991-03-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(404481568788, 0410999360031, 'Mario', 'Perić', '1999-10-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(655381822622, 0201998360858, 'Viktor', 'Sušanj', '1998-01-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(878758488477, 1703998360111, 'Petra', 'Nekić', '1998-03-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(460681066247, 1402993360339, 'Petra', 'Kostrenčić', '1993-02-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(737408732876, 2710993360252, 'Ivana', 'Graovac', '1993-10-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(842313571324, 3103997360991, 'Mila', 'Valentić', '1997-03-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(921694054234, 1607999360248, 'Ines', 'Koraca', '1999-07-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(703844469961, 1511999360018, 'Ana', 'Graovac', '1999-11-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(418760424325, 1810997360610, 'Mile', 'Sušanj', '1997-10-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(423032968744, 3010992360361, 'Petra', 'Štajduhar', '1992-10-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(587737017740, 2603992360312, 'Valentina', 'Sušanj', '1992-03-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(748189717941, 0801996360139, 'Iva', 'Perić', '1996-01-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(830232984945, 0708995360224, 'Petra', 'Bokulić', '1995-08-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(925430712374, 2610993360552, 'Mile', 'Perić', '1993-10-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(314771629464, 1506996360431, 'Karmen', 'Marković', '1996-06-15', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(330972927401, 2802989360663, 'Nataša', 'Pavković', '1989-02-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(264719518714, 1212996360037, 'Natko', 'Vincetić', '1996-12-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(643660714784, 3104997360970, 'Marin', 'Frančić', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL);
INSERT INTO `osz_ucenik` (`oib`, `jmbg`, `ime`, `prezime`, `datum_rodjenja`, `spol`, `otac_ime_nom`, `otac_ime_gen`, `majka_ime_nom`, `majka_ime_gen`, `majka_djevojacko`, `stranac`, `skolovanje_izvan_rh`, `sportas`, `broj_domovnice`, `smb`, `smb_datum_od`, `smb_datum_do`, `hospitant`, `mjesto_rodjenja_id`, `narodnost_id`, `nacionalna_manjina_id`, `vrsta_putnika_id`, `otac_zanimanje_id`, `majka_zanimanje_id`) VALUES
(779929479758, 2008998360229, 'Marin', 'Marić', '1998-08-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(874623110702, 3008992360753, 'Diana', 'Kostrenčić', '1992-08-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(705299228856, 1312990360830, 'Ana', 'Hasić', '1990-12-13', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(742777590409, 1007994360474, 'Nikola', 'Koraca', '1994-07-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(425991204759, 1402993360675, 'Manuela', 'Frančić', '1993-02-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(792794948085, 0810998360747, 'Karmen', 'Hasić', '1998-10-08', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(273678680478, 1101991360577, 'Manuela', 'Ugrina', '1991-01-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(148992006131, 3008994360862, 'Ana', 'Ugrina', '1994-08-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(740421131889, 2710993360559, 'Karmen', 'Frančić', '1993-10-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(379692750596, 2703990360881, 'Jakov', 'Štajduhar', '1990-03-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(996796084203, 2008998360834, 'Mila', 'Valentić', '1998-08-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(364126582171, 0710994360926, 'Slaven', 'Sušanj', '1994-10-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(592428250019, 3008993360994, 'Iva', 'Todeskini', '1993-08-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(822634213963, 1712989360082, 'Ana', 'Antić', '1989-12-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(441545280281, 2810994360154, 'Ines', 'Graovac', '1994-10-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(729363822673, 2307998360013, 'Manuela', 'Antić', '1998-07-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(519321468948, 1608989360749, 'Natko', 'Vincetić', '1989-08-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(634274439136, 3104990360827, 'Viktor', 'Todeskini', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(463840429738, 2909997360373, 'Marin', 'Valentić', '1997-09-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(762128698361, 2006996360136, 'Iva', 'Kostrenčić', '1996-06-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(958332068539, 1809994360050, 'Nikola', 'Frančić', '1994-09-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(194711067827, 1403990360069, 'Diana', 'Kostrenčić', '1990-03-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(767060984104, 0502998360208, 'Slaven', 'Graovac', '1998-02-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(889167829001, 0203990360135, 'Karmen', 'Petrović', '1990-03-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(329371372583, 2605998360797, 'Slaven', 'Štajduhar', '1998-05-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(604612400888, 1804990360434, 'Iva', 'Sušanj', '1990-04-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(624459194409, 1812999360929, 'Manuela', 'Todeskini', '1999-12-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(361143228128, 2503995360249, 'Karmen', 'Antić', '1995-03-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(969960097250, 1001991360446, 'Marko', 'Kostrenčić', '1991-01-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(831019542566, 2008994360920, 'Petar', 'Hasić', '1994-08-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(947442669218, 1412995360479, 'Mila', 'Graovac', '1995-12-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(212886141106, 0608998360680, 'Ines', 'Marić', '1998-08-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(653734136823, 1812995360171, 'Ines', 'Antić', '1995-12-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(631692137199, 2503991360988, 'Nikola', 'Frančić', '1991-03-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(244384732852, 1410998360625, 'Marko', 'Antić', '1998-10-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(245142576362, 0711996360383, 'Mile', 'Perić', '1996-11-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(354880722685, 2812991360610, 'Petar', 'Todeskini', '1991-12-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(608124303239, 2910992360501, 'Nikola', 'Koraca', '1992-10-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(868726135970, 1308994360164, 'Vanja', 'Marković', '1994-08-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(172367211863, 2112993360991, 'Iva', 'Marić', '1993-12-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(935640337377, 1707997360669, 'Jakov', 'Koraca', '1997-07-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(498925231717, 2303997360942, 'Ines', 'Marić', '1997-03-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(318082579759, 0911993360587, 'Marin', 'Antić', '1993-11-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(141227750696, 0409992360352, 'Mila', 'Nekić', '1992-09-04', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(773274645379, 3112997360561, 'Zoran', 'Vincetić', '1997-12-31', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(990959019095, 2006998360373, 'Ivana', 'Ugrina', '1998-06-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(999683899383, 3006992360605, 'Željko', 'Štajduhar', '1992-06-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(533481270606, 1005992360378, 'Ana', 'Antić', '1992-05-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(984717450884, 0912999360160, 'Milan', 'Vincetić', '1999-12-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(706862825826, 2601999360012, 'Ivana', 'Štajduhar', '1999-01-26', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(807750839939, 1304999360901, 'Zoran', 'Hasić', '1999-04-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(432509613912, 1801998360434, 'Ivan', 'Vincetić', '1998-01-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(192399745839, 1409990360339, 'Petar', 'Pavković', '1990-09-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(853970175888, 2409990360415, 'Iva', 'Mandić', '1990-09-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(368660287991, 0810990360011, 'Vanja', 'Koraca', '1990-10-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(118807719529, 2704995360007, 'Marin', 'Frančić', '1995-04-27', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(456375834194, 1407998360711, 'Mile', 'Bokulić', '1998-07-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(393581465943, 0202999360817, 'Karmen', 'Kostrenčić', '1999-02-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(297148269367, 2311995360603, 'Manuela', 'Pavković', '1995-11-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(184518615571, 0205992360475, 'Marin', 'Koraca', '1992-05-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(874449950385, 2902997360136, 'Željko', 'Štajduhar', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(232950649821, 0212997360722, 'Ana', 'Marić', '1997-12-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(953808508585, 0205994360012, 'Mile', 'Vincetić', '1994-05-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(290306256616, 1809999360203, 'Petar', 'Štajduhar', '1999-09-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(775531727429, 1409999360997, 'Viktor', 'Ugrina', '1999-09-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(726892507297, 2602995360068, 'Petar', 'Petrović', '1995-02-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(406591690840, 1702993360256, 'Željko', 'Mandić', '1993-02-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(771641367409, 1408989360940, 'Željko', 'Todeskini', '1989-08-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(188584268868, 1102997360021, 'Petar', 'Graovac', '1997-02-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(588586649820, 0611990360482, 'Marko', 'Marić', '1990-11-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(614290791516, 1112992360568, 'Zoran', 'Štajduhar', '1992-12-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(411610703739, 2211991360379, 'Karmen', 'Vincetić', '1991-11-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(659720777691, 2007993360350, 'Valentina', 'Antić', '1993-07-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(463866393936, 2505992360569, 'Manuela', 'Kostrenčić', '1992-05-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(936957185511, 0703996360994, 'Pero', 'Graovac', '1996-03-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(441716778948, 2405990360155, 'Slaven', 'Perić', '1990-05-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(275285033444, 2805991360052, 'Vanja', 'Frančić', '1991-05-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(893282131452, 2102990360418, 'Mile', 'Vincetić', '1990-02-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(664013060084, 2904992360976, 'Ivan', 'Bokulić', '1992-04-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(928555934263, 0808989360387, 'Slaven', 'Todeskini', '1989-08-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(110959732446, 2906990360935, 'Nikola', 'Bokulić', '1990-06-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(631379669078, 3004999360903, 'Ana', 'Marković', '1999-04-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(903376126315, 0507998360900, 'Diana', 'Štajduhar', '1998-07-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(950742733312, 1005996360945, 'Igor', 'Valentić', '1996-05-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(291441014384, 2101992360779, 'Petra', 'Vincetić', '1992-01-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(202434691629, 0611996360924, 'Mila', 'Marković', '1996-11-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(877610152021, 1009991360321, 'Natko', 'Ugrina', '1991-09-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(700099202935, 2010998360308, 'Mila', 'Perić', '1998-10-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(755078414107, 1503992360585, 'Milan', 'Kostrenčić', '1992-03-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(280448562708, 2902996360153, 'Petar', 'Nekić', '1996-02-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(561540719781, 1605991360931, 'Valentina', 'Marković', '1991-05-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(826811466785, 1402989360951, 'Viktor', 'Hasić', '1989-02-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(263073797896, 2701996360564, 'Valentina', 'Valentić', '1996-01-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(106869438403, 1505994360903, 'Jakov', 'Sušanj', '1994-05-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(472348673922, 2106989360375, 'Viktor', 'Nekić', '1989-06-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(468305081585, 2801998360359, 'Petra', 'Petrović', '1998-01-28', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(899129418401, 1102995360944, 'Igor', 'Todeskini', '1995-02-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(677427100160, 0610994360246, 'Željko', 'Pavković', '1994-10-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(971999691453, 0711999360678, 'Valentina', 'Marić', '1999-11-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(508109891698, 1807999360659, 'Ivana', 'Hasić', '1999-07-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(607148364850, 1908999360306, 'Viktor', 'Marić', '1999-08-19', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(690477173766, 1907998360425, 'Valentina', 'Petrović', '1998-07-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(877381977462, 1603992360873, 'Ana', 'Perić', '1992-03-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(234898533762, 1705999360700, 'Valentina', 'Kostrenčić', '1999-05-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(992513148545, 2902990360811, 'Nikola', 'Marić', '0000-00-00', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(928544943051, 1808998360117, 'Viktor', 'Ugrina', '1998-08-18', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(162429135826, 1708997360682, 'Marin', 'Perić', '1997-08-17', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(423932578154, 1112999360242, 'Marko', 'Frančić', '1999-12-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(727995448330, 2406996360937, 'Ivana', 'Nekić', '1996-06-24', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(844397565044, 2412996360299, 'Igor', 'Antić', '1996-12-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(155463000073, 2308996360165, 'Viktor', 'Hasić', '1996-08-23', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(816254971543, 0502995360692, 'Natko', 'Štajduhar', '1995-02-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(730378550627, 0108991360065, 'Pero', 'Štajduhar', '1991-08-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(602149139759, 2511998360732, 'Nikola', 'Perić', '1998-11-25', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(290375713600, 2507999360331, 'Nataša', 'Ugrina', '1999-07-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(812316224827, 1207991360479, 'Karmen', 'Antić', '1991-07-12', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(166178202737, 1112992360031, 'Natko', 'Todeskini', '1992-12-11', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(900179453383, 3009995360203, 'Marin', 'Marić', '1995-09-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(314580080742, 1803998360779, 'Ines', 'Marić', '1998-03-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(857681187475, 2904991360333, 'Marin', 'Mandić', '1991-04-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(611138657970, 0810989360346, 'Mile', 'Pavković', '1989-10-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(170727629433, 1503999360650, 'Nikola', 'Todeskini', '1999-03-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(408116490587, 0910992360930, 'Ines', 'Perić', '1992-10-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(255586029858, 1311994360088, 'Igor', 'Todeskini', '1994-11-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(643529103054, 1109993360753, 'Valentina', 'Todeskini', '1993-09-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(267759332070, 2511996360866, 'Karmen', 'Pavković', '1996-11-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(573025123002, 0606993360338, 'Natko', 'Antić', '1993-06-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(622229561904, 3004999360259, 'Iva', 'Pavković', '1999-04-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(487419119301, 1702994360696, 'Nataša', 'Štajduhar', '1994-02-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(356301287334, 0808993360732, 'Nikola', 'Marković', '1993-08-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(507516868406, 0705990360329, 'Natko', 'Hasić', '1990-05-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(518855077481, 0708994360458, 'Mario', 'Sušanj', '1994-08-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(637695227972, 1301994360278, 'Vanja', 'Bokulić', '1994-01-13', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(348156941093, 1007996360395, 'Diana', 'Ugrina', '1996-07-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(555279282756, 1203997360642, 'Jakov', 'Hasić', '1997-03-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(130967180467, 0308991360059, 'Milan', 'Marković', '1991-08-03', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(851321362982, 0712991360427, 'Petar', 'Kostrenčić', '1991-12-07', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(715394527441, 2911989360110, 'Natko', 'Sušanj', '1989-11-29', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(969799928839, 2003993360005, 'Diana', 'Kostrenčić', '1993-03-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(679081018268, 3006989360461, 'Marin', 'Frančić', '1989-06-30', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(467763213717, 3003997360921, 'Ivana', 'Bokulić', '1997-03-30', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(978559839018, 1410998360531, 'Diana', 'Nekić', '1998-10-14', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(532715680475, 0705989360506, 'Ana', 'Graovac', '1989-05-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(538512385780, 3101992360835, 'Ines', 'Antić', '1992-01-31', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(280934474512, 0105998360648, 'Ivana', 'Mandić', '1998-05-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(497290420707, 1907993360961, 'Mila', 'Koraca', '1993-07-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(170100516166, 3104991360492, 'Nataša', 'Todeskini', '0000-00-00', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(849810790014, 2407993360209, 'Mario', 'Antić', '1993-07-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(128694121763, 0611995360736, 'Nataša', 'Vincetić', '1995-11-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(241381143000, 1204993360099, 'Zoran', 'Antić', '1993-04-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(655291334675, 2104992360849, 'Mila', 'Petrović', '1992-04-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(513523910258, 0401998360277, 'Zoran', 'Valentić', '1998-01-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(301069130113, 0412995360502, 'Zoran', 'Marković', '1995-12-04', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(793281332387, 0507999360067, 'Nikola', 'Graovac', '1999-07-05', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(889025387987, 2207998360821, 'Mile', 'Štajduhar', '1998-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(147824810399, 0109991360378, 'Vanja', 'Ugrina', '1991-09-01', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(916793603327, 1001993360684, 'Nataša', 'Štajduhar', '1993-01-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(194097870926, 0712998360050, 'Iva', 'Marković', '1998-12-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(305579221111, 2104996360264, 'Ivan', 'Sušanj', '1996-04-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(839008435707, 0701992360064, 'Manuela', 'Graovac', '1992-01-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(240252324455, 2111991360896, 'Karmen', 'Antić', '1991-11-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(395276302131, 1111993360773, 'Nataša', 'Frančić', '1993-11-11', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(594056909847, 1805994360973, 'Ana', 'Mandić', '1994-05-18', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(228541267617, 1002999360659, 'Mila', 'Sušanj', '1999-02-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(780250684780, 0909997360211, 'Manuela', 'Koraca', '1997-09-09', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(284356468141, 1606989360800, 'Zoran', 'Petrović', '1989-06-16', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(766565660178, 0611991360838, 'Jakov', 'Koraca', '1991-11-06', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(782292504432, 2002999360112, 'Ines', 'Sušanj', '1999-02-20', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(355948474565, 2308994360397, 'Diana', 'Štajduhar', '1994-08-23', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(555887764418, 1906990360149, 'Ines', 'Štajduhar', '1990-06-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(866520016527, 2002991360122, 'Viktor', 'Antić', '1991-02-20', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(351438174296, 2908989360731, 'Ana', 'Antić', '1989-08-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(191272011628, 1911992360646, 'Iva', 'Sušanj', '1992-11-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(836797432369, 1001999360424, 'Željko', 'Ugrina', '1999-01-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(653741545539, 2106992360686, 'Iva', 'Koraca', '1992-06-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(150754360897, 0710992360663, 'Ana', 'Vincetić', '1992-10-07', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(472766528355, 0611991360679, 'Ines', 'Ugrina', '1991-11-06', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(303287799615, 0508999360534, 'Manuela', 'Vincetić', '1999-08-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(936490552147, 2408994360320, 'Mile', 'Bokulić', '1994-08-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(479539427070, 2106998360367, 'Valentina', 'Koraca', '1998-06-21', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(601085692086, 1401997360978, 'Petar', 'Nekić', '1997-01-14', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(224834008088, 2912995360360, 'Valentina', 'Vincetić', '1995-12-29', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(783547106050, 2209995360321, 'Mile', 'Marić', '1995-09-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(371167064827, 0303999360092, 'Nataša', 'Marković', '1999-03-03', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(562164015205, 0206999360158, 'Milan', 'Hasić', '1999-06-02', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(296371392883, 2207994360792, 'Vanja', 'Nekić', '1994-07-22', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(347302280737, 1702999360520, 'Ines', 'Vincetić', '1999-02-17', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(175819374579, 0802995360648, 'Nikola', 'Perić', '1995-02-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(202482824981, 0804989360518, 'Natko', 'Nekić', '1989-04-08', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(507295478773, 2610995360207, 'Igor', 'Graovac', '1995-10-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(830649307069, 1008998360097, 'Slaven', 'Graovac', '1998-08-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(419047810491, 2608992360226, 'Viktor', 'Nekić', '1992-08-26', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(784480058780, 0209989360357, 'Petra', 'Koraca', '1989-09-02', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(684598808512, 0506997360017, 'Diana', 'Pavković', '1997-06-05', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(454265166646, 2211996360761, 'Karmen', 'Valentić', '1996-11-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(380403470347, 2203989360520, 'Ivana', 'Hasić', '1989-03-22', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(447718935131, 2809997360081, 'Milan', 'Kostrenčić', '1997-09-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(155532551232, 2704994360296, 'Manuela', 'Koraca', '1994-04-27', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(244559667910, 1211998360341, 'Slaven', 'Marić', '1998-11-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(502838632515, 1512999360027, 'Viktor', 'Graovac', '1999-12-15', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(879979634524, 1002999360992, 'Mario', 'Pavković', '1999-02-10', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(172230733933, 0109995360668, 'Mila', 'Valentić', '1995-09-01', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(258400870526, 2110990360275, 'Milan', 'Kostrenčić', '1990-10-21', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(725052189892, 2805999360672, 'Milan', 'Petrović', '1999-05-28', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(319585574961, 1608990360338, 'Valentina', 'Ugrina', '1990-08-16', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(397217822436, 2406999360874, 'Mile', 'Nekić', '1999-06-24', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(968675543041, 0903990360884, 'Marko', 'Vincetić', '1990-03-09', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(708066519737, 1907997360458, 'Mila', 'Petrović', '1997-07-19', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(159562968433, 1208991360920, 'Mile', 'Graovac', '1991-08-12', 'M', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(275553426146, 1001998360839, 'Mila', 'Mandić', '1998-01-10', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(372604027016, 2508998360739, 'Diana', 'Vincetić', '1998-08-25', 'Z', '', '', '', '', '', 0, 0, 0, 0, '', NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `osz_ucenik_dogadjaj`
--

CREATE TABLE IF NOT EXISTS `osz_ucenik_dogadjaj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ucenik_id` bigint(20) NOT NULL,
  `dogadjaj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ucenik_id` (`ucenik_id`,`dogadjaj_id`),
  KEY `osz_ucenik_dogadjaj_d2fead4f` (`ucenik_id`),
  KEY `osz_ucenik_dogadjaj_a16270c4` (`dogadjaj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_ucenik_dogadjaj`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_ucenik_drzavljanstvo`
--

CREATE TABLE IF NOT EXISTS `osz_ucenik_drzavljanstvo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ucenik_id` bigint(20) NOT NULL,
  `drzava_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ucenik_id` (`ucenik_id`,`drzava_id`),
  KEY `osz_ucenik_drzavljanstvo_d2fead4f` (`ucenik_id`),
  KEY `osz_ucenik_drzavljanstvo_a62fda90` (`drzava_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `osz_ucenik_drzavljanstvo`
--

INSERT INTO `osz_ucenik_drzavljanstvo` (`id`, `ucenik_id`, `drzava_id`) VALUES
(1, 12345678901, 1);

-- --------------------------------------------------------

--
-- Table structure for table `osz_ucenik_razrednoodjeljenje`
--

CREATE TABLE IF NOT EXISTS `osz_ucenik_razrednoodjeljenje` (
  `ucenik_id` int(11) NOT NULL,
  `razrednoodjeljenje_id` int(11) NOT NULL,
  `skolska_godina_id` int(11) NOT NULL,
  PRIMARY KEY (`ucenik_id`,`razrednoodjeljenje_id`,`skolska_godina_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `osz_ucenik_razrednoodjeljenje`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_ucenik_slobodna_aktivnost`
--

CREATE TABLE IF NOT EXISTS `osz_ucenik_slobodna_aktivnost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ucenik_id` bigint(20) NOT NULL,
  `slobodnaaktivnost_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ucenik_id` (`ucenik_id`,`slobodnaaktivnost_id`),
  KEY `osz_ucenik_slobodna_aktivnost_d2fead4f` (`ucenik_id`),
  KEY `osz_ucenik_slobodna_aktivnost_70c5878c` (`slobodnaaktivnost_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_ucenik_slobodna_aktivnost`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_ucitelj`
--

CREATE TABLE IF NOT EXISTS `osz_ucitelj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `titula_prefix_id` int(11) DEFAULT NULL,
  `titula_sufix_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `osz_ucitelj_cb4f08b` (`titula_prefix_id`),
  KEY `osz_ucitelj_bb46e741` (`titula_sufix_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `osz_ucitelj`
--

INSERT INTO `osz_ucitelj` (`id`, `ime`, `prezime`, `telefon`, `email`, `titula_prefix_id`, `titula_sufix_id`) VALUES
(1, 'Marin', 'Kaluža', '060500500', 'mkaluza@veleri.hr', 1, 1),
(2, 'Miro', 'Frančić', '050123456', 'mfrancic@veleri.hr', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `osz_vrstapoteskoce`
--

CREATE TABLE IF NOT EXISTS `osz_vrstapoteskoce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_vrstapoteskoce`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_vrstaputnika`
--

CREATE TABLE IF NOT EXISTS `osz_vrstaputnika` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_vrstaputnika`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_vrstavladanja`
--

CREATE TABLE IF NOT EXISTS `osz_vrstavladanja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ematica_id` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ematica_id` (`ematica_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_vrstavladanja`
--


-- --------------------------------------------------------

--
-- Table structure for table `osz_zanimanja`
--

CREATE TABLE IF NOT EXISTS `osz_zanimanja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `osz_zanimanja`
--

INSERT INTO `osz_zanimanja` (`id`, `naziv`) VALUES
(1, 'kovinotokar');
