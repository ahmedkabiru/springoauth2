-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2019 at 03:05 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oauth2_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `OAUTH_CLIENT_DETAILS`
--

CREATE TABLE IF NOT EXISTS `OAUTH_CLIENT_DETAILS` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `CLIENT_SECRET` varchar(255) NOT NULL,
  `RESOURCE_IDS` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  `AUTHORIZED_GRANT_TYPES` varchar(255) DEFAULT NULL,
  `WEB_SERVER_REDIRECT_URI` varchar(255) DEFAULT NULL,
  `AUTHORITIES` varchar(255) DEFAULT NULL,
  `ACCESS_TOKEN_VALIDITY` int(11) DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY` int(11) DEFAULT NULL,
  `ADDITIONAL_INFORMATION` varchar(4096) DEFAULT NULL,
  `AUTOAPPROVE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OAUTH_CLIENT_DETAILS`
--

INSERT INTO `OAUTH_CLIENT_DETAILS` (`CLIENT_ID`, `CLIENT_SECRET`, `RESOURCE_IDS`, `SCOPE`, `AUTHORIZED_GRANT_TYPES`, `WEB_SERVER_REDIRECT_URI`, `AUTHORITIES`, `ACCESS_TOKEN_VALIDITY`, `REFRESH_TOKEN_VALIDITY`, `ADDITIONAL_INFORMATION`, `AUTOAPPROVE`) VALUES
('USER_CLIENT_APP', '{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi', 'USER_CLIENT_RESOURCE,USER_ADMIN_RESOURCE', 'role_admin,role_user', 'authorization_code,password,refresh_token,implicit', NULL, NULL, 900, 3600, '{}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PERMISSION`
--

CREATE TABLE IF NOT EXISTS `PERMISSION` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(60) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PERMISSION`
--

INSERT INTO `PERMISSION` (`ID`, `NAME`) VALUES
(1, 'can_create_user'),
(4, 'can_delete_user'),
(3, 'can_read_user'),
(2, 'can_update_user');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `PERMISSION_ID` int(11) DEFAULT NULL,
  `ROLE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`PERMISSION_ID`, `ROLE_ID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ROLE`
--

CREATE TABLE IF NOT EXISTS `ROLE` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(60) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ROLE`
--

INSERT INTO `ROLE` (`ID`, `NAME`) VALUES
(1, 'role_admin'),
(2, 'role_user');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `ROLE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`ROLE_ID`, `USER_ID`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE IF NOT EXISTS `USER` (
  `ID` int(11) NOT NULL,
  `USERNAME` varchar(24) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  `ACCOUNT_EXPIRED` bit(1) NOT NULL,
  `CREDENTIALS_EXPIRED` bit(1) NOT NULL,
  `ACCOUNT_LOCKED` bit(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`ID`, `USERNAME`, `PASSWORD`, `EMAIL`, `ENABLED`, `ACCOUNT_EXPIRED`, `CREDENTIALS_EXPIRED`, `ACCOUNT_LOCKED`) VALUES
(1, 'admin', '{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi', 'opeyemi.kabiru@yahoo.com', b'1', b'0', b'0', b'0'),
(2, 'user', '{bcrypt}$2a$10$EOs8VROb14e7ZnydvXECA.4LoIhPOoFHKvVF/iBZ/ker17Eocz4Vi', 'opeyemi.kabiru@yahoo.com', b'1', b'0', b'0', b'0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `OAUTH_CLIENT_DETAILS`
--
ALTER TABLE `OAUTH_CLIENT_DETAILS`
  ADD PRIMARY KEY (`CLIENT_ID`);

--
-- Indexes for table `PERMISSION`
--
ALTER TABLE `PERMISSION`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `FK3tuvkbyi6wcytyg21hvpd6txw` (`PERMISSION_ID`),
  ADD KEY `FK50sfdcvbvdaclpn7wp4uop4ml` (`ROLE_ID`);

--
-- Indexes for table `ROLE`
--
ALTER TABLE `ROLE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NAME` (`NAME`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `FKiqpmjd2qb4rdkej916ymonic6` (`ROLE_ID`),
  ADD KEY `FK4320p8bgvumlxjkohtbj214qi` (`USER_ID`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `USERNAME` (`USERNAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `PERMISSION`
--
ALTER TABLE `PERMISSION`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ROLE`
--
ALTER TABLE `ROLE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `FK3tuvkbyi6wcytyg21hvpd6txw` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  ADD CONSTRAINT `FK50sfdcvbvdaclpn7wp4uop4ml` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  ADD CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `PERMISSION` (`ID`),
  ADD CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `FK4320p8bgvumlxjkohtbj214qi` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FKiqpmjd2qb4rdkej916ymonic6` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  ADD CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLE` (`ID`),
  ADD CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
