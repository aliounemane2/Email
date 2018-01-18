-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 14 Avril 2017 à 21:33
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `email`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add destinataire', 7, 'add_destinataire'),
(20, 'Can change destinataire', 7, 'change_destinataire'),
(21, 'Can delete destinataire', 7, 'delete_destinataire'),
(22, 'Can add group', 8, 'add_group'),
(23, 'Can change group', 8, 'change_group'),
(24, 'Can delete group', 8, 'delete_group'),
(25, 'Can add destinataire_ group', 9, 'add_destinataire_group'),
(26, 'Can change destinataire_ group', 9, 'change_destinataire_group'),
(27, 'Can delete destinataire_ group', 9, 'delete_destinataire_group');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$jnQxVWA8vZse$lymBj4XQch8aCnhq37AM0+73gDkhPcwb0uE5ULtTKj0=', '2017-04-05 12:09:39.915509', 1, 'nema', '', '', 'aliounemane2@gmail.com', 1, 1, '2016-05-23 09:57:32.381906');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-05-23 11:13:37.804810', '1', 'MANE', 1, 'new through import_export', 7, 1),
(2, '2016-05-23 11:14:36.931762', '1', 'MANE', 2, 'Changed adresse.', 7, 1),
(3, '2016-05-23 12:20:59.050850', '2', 'MANE2', 1, 'Added.', 7, 1),
(4, '2016-05-23 12:34:24.554939', '3', 'KANE', 1, 'Added.', 7, 1),
(5, '2016-05-24 12:25:42.630472', '4', 'PAPE', 1, 'Added.', 7, 1),
(6, '2016-05-25 14:59:26.315759', '1', 'Groupe 1', 1, 'Added.', 8, 1),
(7, '2016-05-25 14:59:38.188533', '2', 'Groupe 2', 1, 'Added.', 8, 1),
(8, '2016-05-25 15:01:10.372401', '3', 'MANE', 1, 'Added.', 9, 1),
(9, '2016-05-27 09:36:44.994133', '5', 'LO', 1, 'Added.', 7, 1),
(10, '2016-05-27 09:44:59.968597', '4', 'ahmadou19@outlook.fr', 1, 'Added.', 9, 1),
(11, '2016-07-08 13:04:33.930325', '3', 'Mane 22', 2, 'Changed nom, prenom and adresse.', 7, 1),
(12, '2016-07-11 18:50:45.198194', '5', 'ahmadou19@outlook.fr', 1, 'Added.', 9, 1),
(13, '2016-07-11 18:51:41.275178', '6', 'Ismael', 1, 'Added.', 7, 1),
(14, '2016-07-11 18:51:53.521080', '3', 'Groupe 3', 1, 'Added.', 8, 1),
(15, '2016-07-11 18:52:06.852007', '6', 'ismomh@gmail.com', 1, 'Added.', 9, 1),
(16, '2016-07-11 18:54:32.855449', '6', 'Ismael', 2, 'No fields changed.', 7, 1),
(17, '2017-04-05 12:11:57.731445', '7', 'ba', 1, 'Added.', 7, 1),
(18, '2017-04-05 12:12:57.139658', '6', 'Ismael', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'mails', 'destinataire'),
(9, 'mails', 'destinataire_group'),
(8, 'mails', 'group'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-05-23 09:55:42.452190'),
(2, 'auth', '0001_initial', '2016-05-23 09:55:53.610464'),
(3, 'admin', '0001_initial', '2016-05-23 09:55:55.686351'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-05-23 09:55:55.970525'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-05-23 09:55:57.486939'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-05-23 09:55:58.399802'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-05-23 09:55:59.194862'),
(8, 'auth', '0004_alter_user_username_opts', '2016-05-23 09:55:59.253921'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-05-23 09:55:59.728538'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-05-23 09:55:59.762317'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-05-23 09:55:59.823707'),
(12, 'sessions', '0001_initial', '2016-05-23 09:56:00.748566'),
(13, 'mails', '0001_initial', '2016-05-23 11:01:21.497095');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('56apl760joxpqjsrmygh72ciu53bawer', 'Yzg5OGZmYjc1Y2ViZTMyZmU3N2NiYTkyZDE4MWJhNGJjODU3NzQyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5NGM2NjNkYTM5NjAwN2ExYTNiMjZkZTYzMDllZDg5OGY3YzM2ODUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-04-19 12:09:40.157560'),
('5lymj74mlo7e8ag92mqfpl8bjghi10sx', 'MTU4ODFiOGY5MTFjY2JmNDhiNzYyN2VjNDVhYWY1MzE0NzIyZDBhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5NGM2NjNkYTM5NjAwN2ExYTNiMjZkZTYzMDllZDg5OGY3YzM2ODUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-28 17:58:22.749265'),
('iedbph9h1jyke0csspin45suyy05iz67', 'MTU4ODFiOGY5MTFjY2JmNDhiNzYyN2VjNDVhYWY1MzE0NzIyZDBhZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5NGM2NjNkYTM5NjAwN2ExYTNiMjZkZTYzMDllZDg5OGY3YzM2ODUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-06-06 09:58:19.467844'),
('lws003l3ofy4fdeczz11oxldutj0aoab', 'Yzg5OGZmYjc1Y2ViZTMyZmU3N2NiYTkyZDE4MWJhNGJjODU3NzQyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5NGM2NjNkYTM5NjAwN2ExYTNiMjZkZTYzMDllZDg5OGY3YzM2ODUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-07-25 15:42:40.402128'),
('m7b6gajfw61or37mqmhodxf11xxjp7ir', 'MmZhN2VhZTFjMWJiNGQ4NTc0ZDI5ODA4NjBjYTJkNjJjYzZjYmY2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTk0YzY2M2RhMzk2MDA3YTFhM2IyNmRlNjMwOWVkODk4ZjdjMzY4NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-12 18:36:43.064899'),
('qjp1lwc83qwqlr4a7racz3yfvv6d675d', 'MmZhN2VhZTFjMWJiNGQ4NTc0ZDI5ODA4NjBjYTJkNjJjYzZjYmY2Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTk0YzY2M2RhMzk2MDA3YTFhM2IyNmRlNjMwOWVkODk4ZjdjMzY4NSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-25 18:40:06.027283'),
('ufb1cpcx8s7weno2gf4ifgt36p2wop1p', 'MmMyMmNjMjBlMzE1MjZkZjU3YzJlODgxNjIxYTczOWQxZmNiNzkzNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1OTRjNjYzZGEzOTYwMDdhMWEzYjI2ZGU2MzA5ZWQ4OThmN2MzNjg1In0=', '2016-07-22 13:03:58.972347');

-- --------------------------------------------------------

--
-- Structure de la table `mails_destinataire`
--

CREATE TABLE IF NOT EXISTS `mails_destinataire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(150) NOT NULL,
  `adresse` varchar(175) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `mails_destinataire`
--

INSERT INTO `mails_destinataire` (`id`, `nom`, `prenom`, `adresse`) VALUES
(1, 'MANE', 'ALIOUNE', 'aliounemane2@gmail.com'),
(2, 'MANE2', 'ALIOUNE2', 'aliounemane2@gmail.com'),
(3, 'Mane 22', 'Alioune 22', 'alioune.mane@live.com'),
(4, 'PAPE', 'MOR', 'pmnfils@hotmail.fr'),
(5, 'LO', 'Ahmadou', 'ahmadou19@outlook.fr'),
(7, 'ba', 'elias', 'elias.ba@qualshore.com');

-- --------------------------------------------------------

--
-- Structure de la table `mails_destinataire_group`
--

CREATE TABLE IF NOT EXISTS `mails_destinataire_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destinataire_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mails_destinat_destinataire_id_85bde07c_fk_mails_destinataire_id` (`destinataire_id`),
  KEY `mails_destinataire_group_0e939a4f` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `mails_destinataire_group`
--

INSERT INTO `mails_destinataire_group` (`id`, `destinataire_id`, `group_id`) VALUES
(3, 1, 1),
(4, 5, 2),
(5, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `mails_group`
--

CREATE TABLE IF NOT EXISTS `mails_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `mails_group`
--

INSERT INTO `mails_group` (`id`, `nom`) VALUES
(1, 'Groupe 1'),
(2, 'Groupe 2'),
(3, 'Groupe 3');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `mails_destinataire_group`
--
ALTER TABLE `mails_destinataire_group`
  ADD CONSTRAINT `mails_destinataire_group_group_id_d39c9f15_fk_mails_group_id` FOREIGN KEY (`group_id`) REFERENCES `mails_group` (`id`),
  ADD CONSTRAINT `mails_destinat_destinataire_id_85bde07c_fk_mails_destinataire_id` FOREIGN KEY (`destinataire_id`) REFERENCES `mails_destinataire` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
