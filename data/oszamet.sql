-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2011 at 04:05 PM
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'pauk960', '', '', 'pauk960@gmail.com', '412f58bde15d78d2c6e81d2bc4d5ba40', 1, 1, 1, '2011-05-15 19:53:53', '2011-05-15 19:37:04');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


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
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
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
  `naziv` varchar(100) NOT NULL,
  `opis` longtext NOT NULL,
  `razred` int(10) unsigned NOT NULL,
  `previdjen_broj_sati` int(11) NOT NULL,
  PRIMARY KEY (`id`)
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
  `oib` bigint(20) NOT NULL,
  `jmbg` bigint(20) NOT NULL,
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
(12345678901, 123, 'Pero', 'Perić', '2011-05-15', 'M', '', '', '', '', '', 0, 0, 0, 123, '', NULL, NULL, 0, 1, 1, NULL, NULL, NULL, NULL);

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
-- Table structure for table `osz_zanimanja`
--

CREATE TABLE IF NOT EXISTS `osz_zanimanja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `osz_zanimanja`
--

