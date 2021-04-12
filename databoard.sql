-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2021 at 05:36 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company_database`
--
CREATE DATABASE IF NOT EXISTS `company_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `company_database`;

-- --------------------------------------------------------

--
-- Table structure for table `account_table`
--

CREATE TABLE `account_table` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL,
  `realPassword` varchar(30) NOT NULL,
  `dateSignUp` datetime(6) NOT NULL,
  `lastLogin` datetime(6) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `isStaff` tinyint(1) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_table`
--

INSERT INTO `account_table` (`id`, `username`, `fullname`, `email`, `phone`, `photo`, `barcode`, `password`, `realPassword`, `dateSignUp`, `lastLogin`, `isAdmin`, `isStaff`, `isActive`) VALUES
(6, 'long0', 'Long0', 'long0@gmail.com', '01028898227', 'photoAccount/long0/Dragon0_FiHm9tE.jpg', 'barcodeAccount/long0/long0_aX95AaB.png', 'pbkdf2_sha256$150000$JsXLJPKAKiNc$MzNG+n7oINNE4m6K98+IaZ1NwTFjk4lRDmq4/aSeMek=', 'lnblong', '2021-04-03 23:06:00.062746', '2021-04-03 23:06:00.062746', 0, 0, 1),
(7, 'longadmin', 'Bao Long', 'lnblong1470@gmail.com', '01028898227', '', 'barcodeAccount/longadmin/longadmin.png', 'pbkdf2_sha256$150000$o1VgXQiil3PU$1wJKRKDylqH9ISjA/eNFhclwh94MXc+ciOhTt8SFQ6k=', 'lnblong1470', '2021-04-04 22:53:45.785445', '2021-04-04 22:53:45.785445', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add account', 7, 'add_account'),
(26, 'Can change account', 7, 'change_account'),
(27, 'Can delete account', 7, 'delete_account'),
(28, 'Can view account', 7, 'view_account'),
(29, 'Can add shipment', 8, 'add_shipment'),
(30, 'Can change shipment', 8, 'change_shipment'),
(31, 'Can delete shipment', 8, 'delete_shipment'),
(32, 'Can view shipment', 8, 'view_shipment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'Account', 'account'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'Shipment', 'shipment');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Account', '0001_initial', '2021-04-03 22:08:11.523904'),
(2, 'contenttypes', '0001_initial', '2021-04-03 22:08:11.604602'),
(3, 'auth', '0001_initial', '2021-04-03 22:08:11.807149'),
(4, 'admin', '0001_initial', '2021-04-03 22:08:12.241169'),
(5, 'admin', '0002_logentry_remove_auto_add', '2021-04-03 22:08:12.338917'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-03 22:08:12.344766'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-04-03 22:08:12.416811'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-04-03 22:08:12.461250'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-04-03 22:08:12.474134'),
(10, 'auth', '0004_alter_user_username_opts', '2021-04-03 22:08:12.480214'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-04-03 22:08:12.532185'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-04-03 22:08:12.534030'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-04-03 22:08:12.541014'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-04-03 22:08:12.555974'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-04-03 22:08:12.572978'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-04-03 22:08:12.587992'),
(17, 'auth', '0011_update_proxy_permissions', '2021-04-03 22:08:12.594973'),
(18, 'sessions', '0001_initial', '2021-04-03 22:08:12.630386'),
(19, 'Account', '0002_auto_20210403_2247', '2021-04-03 22:47:28.690493'),
(20, 'Account', '0003_auto_20210403_2301', '2021-04-03 23:01:16.581247'),
(21, 'Shipment', '0001_initial', '2021-04-03 23:20:21.854290'),
(22, 'Shipment', '0002_auto_20210404_1325', '2021-04-04 13:25:24.404383'),
(23, 'Shipment', '0003_auto_20210404_1326', '2021-04-04 13:26:02.187013'),
(24, 'Shipment', '0004_auto_20210404_1326', '2021-04-04 13:28:03.212501'),
(25, 'Shipment', '0005_auto_20210404_1326', '2021-04-04 13:28:03.228458'),
(26, 'Shipment', '0006_auto_20210404_1327', '2021-04-04 13:28:03.240425'),
(27, 'Account', '0002_auto_20210404_1839', '2021-04-04 18:39:28.486737'),
(28, 'Shipment', '0007_auto_20210404_1839', '2021-04-04 18:39:28.532159'),
(29, 'Shipment', '0008_auto_20210404_1840', '2021-04-04 18:40:26.838862'),
(30, 'Shipment', '0002_auto_20210404_1929', '2021-04-04 19:29:43.517721'),
(31, 'Shipment', '0003_auto_20210404_2050', '2021-04-04 20:50:09.321222');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0u8yo1hsfp20h0awqhtzyrgnbjmsg7cn', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 14:47:59.888485'),
('1gc5ow06crp0pioifbtrle1r3w8l0vww', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 14:44:39.134684'),
('5dx61yan7jrnrwtxhh4up0we6jr3np0h', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 14:52:17.138676'),
('5xz4c1llekshwliawqt8jrjv3ufyyd2w', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 13:53:10.670574'),
('8g56m6j0m5sm40rd77x9tta8o4u6tuls', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 00:25:54.820908'),
('keolx41yibufkshhtx4o86zrhqm1afyh', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 14:46:39.947025'),
('ksytshzzfyxnrm1io4kt5yx1cjylvofh', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-17 23:06:08.796984'),
('mgb6e0gitr50r7n3k2774fqq2kh33spa', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-17 23:23:41.366458'),
('pvyjxj156ec3l9ew9dg9wh5p54mnsmcf', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-17 22:54:36.146452'),
('smj42zuqpcm3z1lo9al3glktatca4lnx', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 14:53:06.948174'),
('vypkgq1yjkq6cjm132ea8nhv5ysyjn7l', 'YjU2M2Y1NDAxMjQ3NjQ4ODRjNjI0ZWI1YzgyYjgzODlhN2E0OGNiMjp7fQ==', '2021-04-18 00:06:02.354501');

-- --------------------------------------------------------

--
-- Table structure for table `pla_databoard`
--

CREATE TABLE `pla_databoard` (
  `no` bigint(20) NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `kantor_id` varchar(40) NOT NULL,
  `insert_org` varchar(100) NOT NULL,
  `correct_org` varchar(100) NOT NULL,
  `regdate` datetime(6) NOT NULL,
  `company` varchar(100) NOT NULL,
  `vessel` varchar(100) NOT NULL,
  `by1` varchar(50) NOT NULL,
  `blno` varchar(50) NOT NULL,
  `doc` longtext NOT NULL,
  `odr` longtext NOT NULL,
  `supplier` longtext NOT NULL,
  `qty` varchar(10) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `size` longtext NOT NULL,
  `weight` varchar(10) NOT NULL,
  `in1` datetime(6) DEFAULT NULL,
  `whouse` varchar(100) NOT NULL,
  `port` varchar(100) NOT NULL,
  `out1` datetime(6) DEFAULT NULL,
  `remark` longtext NOT NULL,
  `img` varchar(100) NOT NULL,
  `img1` varchar(100) NOT NULL,
  `img2` varchar(100) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `division` varchar(10) NOT NULL,
  `flg` varchar(10) NOT NULL,
  `jobno` varchar(50) NOT NULL,
  `work` varchar(10) NOT NULL,
  `work_regdate` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pla_databoard`
--

INSERT INTO `pla_databoard` (`no`, `barcode`, `kantor_id`, `insert_org`, `correct_org`, `regdate`, `company`, `vessel`, `by1`, `blno`, `doc`, `odr`, `supplier`, `qty`, `unit`, `size`, `weight`, `in1`, `whouse`, `port`, `out1`, `remark`, `img`, `img1`, `img2`, `pdf`, `division`, `flg`, `jobno`, `work`, `work_regdate`) VALUES
(11, 'barcodeShipment/457575/457575.png', '', '', '', '2021-04-04 21:18:45.792957', 'STX', '', '', '', '', '457575', '', '', '', '', '', NULL, '', '', NULL, '', '', '', '', '', '', '', '', '', NULL),
(12, 'barcodeShipment/512414/512414.png', '', '', '', '2021-04-04 21:20:23.187372', '보성상사', '', '', '', '', '512414', '', '', '', '', '', NULL, '', '', NULL, '', '', '', '', '', '', '', '', '', NULL),
(13, 'barcodeShipment/457575/457575.png', '', '', '', '2021-04-04 21:42:08.123092', 'STX', '', '', '', '', '457575', '', '', '', '', '', NULL, '', '', NULL, '', '', '', '', '', '', '', '', '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_table`
--
ALTER TABLE `account_table`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `pla_databoard`
--
ALTER TABLE `pla_databoard`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_table`
--
ALTER TABLE `account_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `pla_databoard`
--
ALTER TABLE `pla_databoard`
  MODIFY `no` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
