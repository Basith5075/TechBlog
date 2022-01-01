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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Technology','Programming languages and other technological stuff should be discussed here.'),(2,'Java programming','Java is one of the most trusted programming language among the developers.'),(3,'Python','Python is the most popular language due to its easy to use syntax and wide range of applications in ML and AI.'),(4,'Web Technologies','New Web technologies such as react and express are developed to build modern apps.'),(5,'Django','Installed Django already? Good. Now try this tutorial, which walks you through creating a basic poll application. It’s got two parts:');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liked`
--

DROP TABLE IF EXISTS `liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liked` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `pid_idx` (`pid`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `posts` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liked`
--

LOCK TABLES `liked` WRITE;
/*!40000 ALTER TABLE `liked` DISABLE KEYS */;
INSERT INTO `liked` VALUES (1,12,7),(2,11,7),(3,10,7),(4,10,7),(5,2,7),(6,11,7),(7,13,5),(8,13,5),(9,13,5),(10,13,5),(11,13,5),(12,13,5),(13,13,5),(14,13,5),(15,13,5),(16,13,5),(17,13,5),(18,13,7),(19,13,7),(20,12,7),(21,10,7),(22,8,7);
/*!40000 ALTER TABLE `liked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `catID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `catID_idx` (`catID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `catID` FOREIGN KEY (`catID`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Java is one of the most interesting language -- This is why?','Java is a class-based, object-oriented programming language and is designed to have as few implementation dependencies as possible. A general-purpose programming language made for developers to write once run anywhere that is compiled Java code can run on all platforms that support Java. Java applications are compiled to byte code that can run on any Java Virtual Machine. The syntax of Java is similar to c/c++.','no code','java.jfif','2021-12-29 11:28:05',2,7),(2,'Python is one of the coolest language','Python requests are generally used to fetch the content from a particular resource URI. Whenever we make a request to a specified URI through Python, it returns a response object. Now, this response object would be used to access certain features such as content, headers, etc.','No Code','phython_pics.jfif','2021-12-29 15:20:36',3,1),(3,'Web Technologies are wonderful --Aren\'t they?','Web technologies refers to the way computers/devices communicate. with each other using mark up languages. It invo It is communication. across the web, and create, deliver or manage web content using hypertext markup language (HTML). ','','technology_pics.jfif','2021-12-29 16:42:17',4,7),(4,'Java Programming are wonderful --Aren\'t they?','Web technologies refer to the way computers/devices communicate. with each other using mark-up languages. It invo It is communication. across the web, and create, deliver or manage web content using a hypertext markup language (HTML). ','','technologies_pics.jfif','2021-12-29 16:46:42',2,7),(5,'testing the title','test','no code','500 - Copy.png','2021-12-29 16:49:02',4,7),(6,'java Collections','Java collection subject matter is wise.','No Code','404_1.png','2021-12-30 07:08:34',2,1),(8,'Latest Web Technologies','New Technologies are coming and on the way','No Code','technologies_pics.jfif','2021-12-30 07:31:08',4,17),(9,'Web technologies usage in world','Web Technology refers to the various tools and techniques that are utilized in the process of communication between different types of devices over the internet. A web browser is used to access web pages. Web browsers can be defined as programs that display text, data, pictures, animation, and video on the Internet. Hyperlinked resources on the World Wide Web can be accessed using software interfaces provided by Web browsers.','import java.util.Scanner;\r\n\r\npublic class HelloWorld {\r\n\r\n    public static void main(String[] args) {\r\n\r\n        // Creates a reader instance which takes\r\n        // input from standard input - keyboard\r\n        Scanner reader = new Scanner(System.in);\r\n        System.out.print(\"Enter a number: \");\r\n\r\n        // nextInt() reads the next integer from the keyboard\r\n        int number = reader.nextInt();\r\n\r\n        // println() prints the following line to the output screen\r\n        System.out.println(\"You entered: \" + number);\r\n    }\r\n}','technology_pics.jfif','2021-12-30 11:58:41',1,20),(10,'Django is cool','Django is taught by saba.','No Code will give after one week','python.png','2021-12-30 12:03:54',5,20),(11,'Django how and what?','Django is an awesome technology..','No code as of now','phython_pics.jfif','2021-12-31 11:52:38',5,7),(12,'New Web Technologies in 2022 !!','New latest tech are Flutter and other core techies...','Nothing ...','technology_pics3.jfif','2021-12-31 11:56:59',4,7),(13,'Java : ArrayList','The ArrayList class is a resizable array, which can be found in the java.util package.\r\n\r\nThe difference between a built-in array and an ArrayList in Java, is that the size of an array cannot be modified (if you want to add or remove elements to/from an array, you have to create a new one). While elements can be added and removed from an ArrayList whenever you want. The syntax is also slightly different:','import java.util.ArrayList;\r\n\r\npublic class Main {\r\n  public static void main(String[] args) {\r\n    ArrayList<String> cars = new ArrayList<String>();\r\n    cars.add(\"Volvo\");\r\n    cars.add(\"BMW\");\r\n    cars.add(\"Ford\");\r\n    cars.add(\"Mazda\");\r\n    System.out.println(cars);\r\n  }\r\n}','array_list.png','2022-01-01 16:27:18',2,5);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2022-01-01 23:13:56
