-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: techblog
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(1000) DEFAULT 'hey ! I am on TechBlog',
  `rdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(100) DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mohammed Abdul Basith','basith.5075@gmail.com','xyz','Male','I am a good programmer..','2021-12-26 10:55:01','default.png'),(3,'Imad Uddin','imad@gmail.com','Imad@123','Male','I am a good manager. I am working hard to become a best manager','2021-12-26 11:03:58','500 - Copy (2).png'),(4,'Mohammed Abdul Wahed','wahed@outlook.com','Wahed@321','Male','I am a good general manager.','2021-12-26 11:06:45','default.png'),(5,'Saba Khalid','saba@rediffmail.com','Rediff@123','Female','I am a good cook.','2021-12-26 11:14:13','girl_profile.jfif'),(6,'Mr Hunk','basith@email.com','email@123','Male','I am a big builder.','2021-12-26 11:58:17','500 - Copy (2).png'),(7,'MD Noor Bhai','noorbhai@gmail.com','abcd','Male','Updated About of MD Noor Bhai.','2021-12-26 12:03:48','man_profile.jfif'),(8,'Basith','redis@gmail.com','gertyhs@123','Male','dasdasdas','2021-12-26 12:11:43','default.png'),(10,'Mr Khalid','khalid@khalid.com','Khalid123','Male','I am a good dancer','2021-12-26 12:13:42','filename.png'),(11,'Mohammed Hamed','hamed@gmail.com','Hamed','Male','Good Man and Good Heart !!','2021-12-26 16:46:31','default.png'),(17,'Mohammed Abdul Basith','basith.507576@gmail.com','BigBoss','Male','Hello I know something !!','2021-12-26 18:51:49','default.png'),(20,'Saba Anwar','khalidzeeba@gmail.com','Saba@321','Female','I like bigboss.','2021-12-30 11:51:58','girl_profile.jfif');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-01 23:10:52
