-- OpenClinic MySQL-Dump
-- version 0.8.20160412
-- http://openclinic.sourceforge.net/
-- 
-- Type: Structure and data
-- Host: localhost
-- Generation Time: 2019-06-15 16:34:24
-- Server Version: 5.1.41
-- PHP Version: 5.3.1
-- Database: openclinic
-- Table Summary: All Tables
-- ---------------------------------------------

CREATE DATABASE openclinic;

USE openclinic;

-- 
-- Table structure for table `access_log_tbl`
-- 

DROP TABLE IF EXISTS `access_log_tbl`;

CREATE TABLE `access_log_tbl` (
  `id_user` int(10) unsigned NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `access_date` datetime NOT NULL,
  `id_profile` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_user`,`access_date`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `access_log_tbl`
-- 

INSERT INTO `access_log_tbl` (`id_user`, `login`, `access_date`, `id_profile`) VALUES ('2', 'admin', '2019-06-15 20:00:31', 1);

-- 
-- Table structure for table `connection_problem_tbl`
-- 

DROP TABLE IF EXISTS `connection_problem_tbl`;

CREATE TABLE `connection_problem_tbl` (
  `id_problem` int(10) unsigned NOT NULL,
  `id_connection` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_problem`,`id_connection`),
  KEY `id_connection` (`id_connection`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `deleted_patient_tbl`
-- 

DROP TABLE IF EXISTS `deleted_patient_tbl`;

CREATE TABLE `deleted_patient_tbl` (
  `id_patient` int(10) unsigned NOT NULL,
  `nif` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `surname1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `surname2` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `address` text COLLATE utf8_unicode_ci,
  `phone_contact` text COLLATE utf8_unicode_ci,
  `sex` enum('V','H') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'V',
  `race` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decease_date` date DEFAULT NULL,
  `nts` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nss` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_situation` text COLLATE utf8_unicode_ci,
  `labour_situation` text COLLATE utf8_unicode_ci,
  `education` text COLLATE utf8_unicode_ci,
  `insurance_company` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_member` int(10) unsigned DEFAULT NULL,
  `collegiate_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_growth` text COLLATE utf8_unicode_ci,
  `growth_sexuality` text COLLATE utf8_unicode_ci,
  `feed` text COLLATE utf8_unicode_ci,
  `habits` text COLLATE utf8_unicode_ci,
  `peristaltic_conditions` text COLLATE utf8_unicode_ci,
  `psychological` text COLLATE utf8_unicode_ci,
  `children_complaint` text COLLATE utf8_unicode_ci,
  `venereal_disease` text COLLATE utf8_unicode_ci,
  `accident_surgical_operation` text COLLATE utf8_unicode_ci,
  `medicinal_intolerance` text COLLATE utf8_unicode_ci,
  `mental_illness` text COLLATE utf8_unicode_ci,
  `parents_status_health` text COLLATE utf8_unicode_ci,
  `brothers_status_health` text COLLATE utf8_unicode_ci,
  `spouse_childs_status_health` text COLLATE utf8_unicode_ci,
  `family_illness` text COLLATE utf8_unicode_ci,
  `create_date` datetime NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM;

-- 
-- Table structure for table `deleted_problem_tbl`
-- 

DROP TABLE IF EXISTS `deleted_problem_tbl`;

CREATE TABLE `deleted_problem_tbl` (
  `id_problem` int(10) unsigned NOT NULL,
  `last_update_date` date NOT NULL,
  `id_patient` int(10) unsigned NOT NULL,
  `id_member` int(10) unsigned DEFAULT NULL,
  `collegiate_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_number` tinyint(3) unsigned NOT NULL,
  `opening_date` date NOT NULL,
  `closing_date` date DEFAULT NULL,
  `meeting_place` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wording` text COLLATE utf8_unicode_ci NOT NULL,
  `subjective` text COLLATE utf8_unicode_ci,
  `objective` text COLLATE utf8_unicode_ci,
  `appreciation` text COLLATE utf8_unicode_ci,
  `action_plan` text COLLATE utf8_unicode_ci,
  `prescription` text COLLATE utf8_unicode_ci,
  `create_date` datetime NOT NULL,
  `id_user` int(10) unsigned NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM;

-- 
-- Table structure for table `history_tbl`
-- 

DROP TABLE IF EXISTS `history_tbl`;

CREATE TABLE `history_tbl` (
  `id_patient` int(10) unsigned NOT NULL,
  `birth_growth` text COLLATE utf8_unicode_ci,
  `growth_sexuality` text COLLATE utf8_unicode_ci,
  `feed` text COLLATE utf8_unicode_ci,
  `habits` text COLLATE utf8_unicode_ci,
  `peristaltic_conditions` text COLLATE utf8_unicode_ci,
  `psychological` text COLLATE utf8_unicode_ci,
  `children_complaint` text COLLATE utf8_unicode_ci,
  `venereal_disease` text COLLATE utf8_unicode_ci,
  `accident_surgical_operation` text COLLATE utf8_unicode_ci,
  `medicinal_intolerance` text COLLATE utf8_unicode_ci,
  `mental_illness` text COLLATE utf8_unicode_ci,
  `parents_status_health` text COLLATE utf8_unicode_ci,
  `brothers_status_health` text COLLATE utf8_unicode_ci,
  `spouse_childs_status_health` text COLLATE utf8_unicode_ci,
  `family_illness` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_patient`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `medical_test_tbl`
-- 

DROP TABLE IF EXISTS `medical_test_tbl`;

CREATE TABLE `medical_test_tbl` (
  `id_test` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_problem` int(10) unsigned NOT NULL,
  `document_type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path_filename` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_test`),
  KEY `id_problem` (`id_problem`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `patient_tbl`
-- 

DROP TABLE IF EXISTS `patient_tbl`;

CREATE TABLE `patient_tbl` (
  `id_patient` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nif` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `surname1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `surname2` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `address` text COLLATE utf8_unicode_ci,
  `phone_contact` text COLLATE utf8_unicode_ci,
  `sex` enum('V','H') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'V',
  `race` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_place` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decease_date` date DEFAULT NULL,
  `nts` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nss` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_situation` text COLLATE utf8_unicode_ci,
  `labour_situation` text COLLATE utf8_unicode_ci,
  `education` text COLLATE utf8_unicode_ci,
  `insurance_company` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_member` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_patient`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `problem_tbl`
-- 

DROP TABLE IF EXISTS `problem_tbl`;

CREATE TABLE `problem_tbl` (
  `id_problem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_update_date` date NOT NULL,
  `id_patient` int(10) unsigned NOT NULL,
  `id_member` int(10) unsigned DEFAULT NULL,
  `order_number` tinyint(3) unsigned NOT NULL,
  `opening_date` date NOT NULL,
  `closing_date` date DEFAULT NULL,
  `meeting_place` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wording` text COLLATE utf8_unicode_ci NOT NULL,
  `subjective` text COLLATE utf8_unicode_ci,
  `objective` text COLLATE utf8_unicode_ci,
  `appreciation` text COLLATE utf8_unicode_ci,
  `action_plan` text COLLATE utf8_unicode_ci,
  `prescription` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_problem`),
  KEY `id_patient` (`id_patient`),
  KEY `id_member` (`id_member`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `record_log_tbl`
-- 

DROP TABLE IF EXISTS `record_log_tbl`;

CREATE TABLE `record_log_tbl` (
  `id_user` int(10) unsigned NOT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `access_date` datetime NOT NULL,
  `table_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `operation` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `affected_row` text COLLATE utf8_unicode_ci NOT NULL,
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `relative_tbl`
-- 

DROP TABLE IF EXISTS `relative_tbl`;

CREATE TABLE `relative_tbl` (
  `id_patient` int(10) unsigned NOT NULL,
  `id_relative` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_patient`,`id_relative`),
  KEY `id_relative` (`id_relative`)
) ENGINE=MyISAM;

-- 
-- Table structure for table `session_tbl`
-- 

DROP TABLE IF EXISTS `session_tbl`;

CREATE TABLE `session_tbl` (
  `login` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `token` int(11) NOT NULL
) ENGINE=MyISAM;

-- 
-- Dumping data for table `session_tbl`
-- 

INSERT INTO `session_tbl` (`login`, `last_updated_date`, `token`) VALUES ('admin', '2019-06-15 20:04:00', '8345');

-- 
-- Table structure for table `setting_tbl`
-- 

DROP TABLE IF EXISTS `setting_tbl`;

CREATE TABLE `setting_tbl` (
  `clinic_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinic_hours` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinic_address` text COLLATE utf8_unicode_ci,
  `clinic_phone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinic_url` text COLLATE utf8_unicode_ci,
  `session_timeout` smallint(5) unsigned NOT NULL DEFAULT '20',
  `items_per_page` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `version` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `id_theme` smallint(5) unsigned NOT NULL DEFAULT '1',
  KEY `id_theme` (`id_theme`)
) ENGINE=MyISAM MIN_ROWS=1 MAX_ROWS=1;

-- 
-- Dumping data for table `setting_tbl`
-- 

INSERT INTO `setting_tbl` (`clinic_name`, `clinic_hours`, `clinic_address`, `clinic_phone`, `clinic_url`, `session_timeout`, `items_per_page`, `version`, `language`, `id_theme`) VALUES ('My Clinic', 'L-V 9am-3pm, S 10am-1pm', 'Sesame Street', '999 66 66 66', 'http://www.example.com', 20, 10, '0.8.20160412', 'en', 1);

-- 
-- Table structure for table `staff_tbl`
-- 

DROP TABLE IF EXISTS `staff_tbl`;

CREATE TABLE `staff_tbl` (
  `id_member` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_type` enum('Administrative','Doctor') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Administrative',
  `collegiate_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nif` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `surname1` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `surname2` varchar(30) COLLATE utf8_unicode_ci DEFAULT '',
  `address` text COLLATE utf8_unicode_ci,
  `phone_contact` text COLLATE utf8_unicode_ci,
  `id_user` int(10) unsigned DEFAULT NULL,
  `login` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_member`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `staff_tbl`
-- 

INSERT INTO `staff_tbl` (`id_member`, `member_type`, `collegiate_number`, `nif`, `first_name`, `surname1`, `surname2`, `address`, `phone_contact`, `id_user`, `login`) VALUES ('4', 'Administrative', NULL, '123456785', 'Benito', 'Camelas', 'Unmontón', 'Camino de las Torres 777', '555-45 45 45', NULL, 'benito');
INSERT INTO `staff_tbl` (`id_member`, `member_type`, `collegiate_number`, `nif`, `first_name`, `surname1`, `surname2`, `address`, `phone_contact`, `id_user`, `login`) VALUES ('3', 'Doctor', '342343445', '34567123', 'Carmelo', 'Cotón', 'Cotón', 'Plaza España 222', '555-23 24 23', NULL, 'carmelo');
INSERT INTO `staff_tbl` (`id_member`, `member_type`, `collegiate_number`, `nif`, `first_name`, `surname1`, `surname2`, `address`, `phone_contact`, `id_user`, `login`) VALUES ('2', 'Administrative', NULL, 'no importa', 'Admin', 'Admin', 'Admin', 'No importa', 'No importa', '2', 'admin');
INSERT INTO `staff_tbl` (`id_member`, `member_type`, `collegiate_number`, `nif`, `first_name`, `surname1`, `surname2`, `address`, `phone_contact`, `id_user`, `login`) VALUES ('1', 'Administrative', NULL, 'no importa', 'Admin', 'Admin', 'Admin', 'No importa', 'No importa', '1', 'sysop');

-- 
-- Table structure for table `theme_tbl`
-- 

DROP TABLE IF EXISTS `theme_tbl`;

CREATE TABLE `theme_tbl` (
  `id_theme` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `css_file` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_theme`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `theme_tbl`
-- 

INSERT INTO `theme_tbl` (`id_theme`, `theme_name`, `css_file`) VALUES (1, 'OpenClinic', 'openclinic.css');

-- 
-- Table structure for table `user_tbl`
-- 

DROP TABLE IF EXISTS `user_tbl`;

CREATE TABLE `user_tbl` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pwd` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actived` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `id_theme` smallint(5) unsigned NOT NULL DEFAULT '1',
  `id_profile` smallint(5) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`id_user`),
  KEY `id_theme` (`id_theme`),
  KEY `id_profile` (`id_profile`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `user_tbl`
-- 

INSERT INTO `user_tbl` (`id_user`, `pwd`, `email`, `actived`, `id_theme`, `id_profile`) VALUES ('1', '73850afb68a28c03ef4d2e426634e041', NULL, 'Y', 1, 1);
INSERT INTO `user_tbl` (`id_user`, `pwd`, `email`, `actived`, `id_theme`, `id_profile`) VALUES ('2', '21232f297a57a5a743894a0e4a801fc3', NULL, 'Y', 1, 1);

