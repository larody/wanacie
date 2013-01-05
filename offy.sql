-- MySQL dump 10.13  Distrib 5.5.23, for Linux (i686)
--
-- Host: localhost    Database: offy
-- ------------------------------------------------------
-- Server version	5.5.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=980191119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (298486374,1,1,'MyString','2013-01-05 05:58:22','2013-01-05 05:58:22'),(980190962,1,1,'MyString','2013-01-05 05:58:22','2013-01-05 05:58:22');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(255) DEFAULT NULL,
  `held_datetime` datetime DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1018350812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (51848956,'食事','2013-01-05 07:58:21','東小金井','ご飯食べましょ！','2013-01-05 05:58:21','2013-01-05 05:58:21'),(113629430,'飲み','2013-01-05 08:28:21','有楽町','軽く飲みませんか？有楽町ですが、8時から2人の予定です。引き続き募集します。外出中Gmailが使えないのでこちらにお願いします。','2013-01-05 05:58:21','2013-01-05 05:58:21'),(281110143,'カラオケ','2013-01-05 06:58:21','新宿三丁目','オール出来る人','2013-01-05 05:58:21','2013-01-05 05:58:21'),(298486374,'飲み','2013-01-05 17:58:21','東京','軽く飲みませんか？','2013-01-05 05:58:21','2013-01-05 05:58:21'),(374648174,'食事','2013-01-05 17:58:21','池袋','誰かいませんか？池袋あたりHUBでサクッとどうでしょ。後は流れに任せます。','2013-01-05 05:58:21','2013-01-05 05:58:21'),(638205575,'お茶','2013-01-05 12:58:21','恵比寿','どなたか','2013-01-05 05:58:21','2013-01-05 05:58:21'),(980190962,'お茶','2013-01-05 15:58:21','木場',NULL,'2013-01-05 05:58:21','2013-01-05 05:58:21'),(991788158,'カラオケ','2013-01-05 10:58:21','青山','ディズニー好き、映画、音楽好き、という方歓迎です。１９時半からを予定してますが、途中参加でも大丈夫です。現在自分含め２人です。','2013-01-05 05:58:21','2013-01-05 05:58:21'),(1018350795,'お茶','2013-01-05 09:28:21','三軒茶屋','朝マックとか','2013-01-05 05:58:21','2013-01-05 05:58:21');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `organizer` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_participants_on_event_id` (`event_id`),
  KEY `index_participants_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1018350891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (51848956,51848956,700166136,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(113629430,113629430,61641870,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(281110143,281110143,301211864,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(298486374,298486374,559726263,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(374648174,374648174,700166136,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(638205575,638205575,301211864,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(980190962,980190962,503864916,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(991788158,991788158,559726263,1,'2013-01-05 05:58:22','2013-01-05 05:58:22'),(1018350795,1018350795,373349298,1,'2013-01-05 05:58:22','2013-01-05 05:58:22');
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120609114935'),('20120609133128'),('20120625144931'),('20120627140926'),('20120630193635'),('20120701025552'),('20120701042810'),('20120701043310'),('20120701045156'),('20120701045216'),('20120701095440'),('20120701110049'),('20120701112110'),('20120701173750'),('20120708014345');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700166143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (61641870,'0879caa1220bc09cb3b7fc73c17d8c26eb31233f','maomi.yuuki@gmail.com','2013-01-05 05:58:22','2013-01-05 05:58:22','maomi'),(156045710,NULL,'system.admin@gmail.com','2013-01-05 05:58:22','2013-01-05 05:58:22','system'),(301211864,'07877b393032ad4fc9cce7ed80f31d4ddc6c948a','angelina.jolie@gmail.com','2013-01-05 05:58:22','2013-01-05 05:58:22','angelina'),(373349298,'04d2b2b7d93d92f2b979f0819ff68b8b95a1c1f6','denise.richards@gmail.com','2013-01-05 05:58:22','2013-01-05 05:58:22','denise'),(503864916,'1e139c0ce55a079f4e7e2beb42c7659b57a6834b','jessica.alba@gmail.com','2013-01-05 05:58:22','2013-01-05 05:58:22','jessica'),(559726263,'94428b33d3f6e4bf8bce51513a58fda4ba1d9a5a','anna@gmail.com','2013-01-05 05:58:22','2013-01-05 05:58:22','anna'),(700166136,'d16c68a2ee6e7d0e6c639aa43a04432b6103aff5','victoria.justice@gmail.com','2013-01-05 05:58:22','2013-01-05 05:58:22','victoria');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-05 15:10:32
