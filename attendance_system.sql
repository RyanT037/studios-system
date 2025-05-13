-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 13, 2025 at 01:23 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Late','Excused') NOT NULL,
  `remarks` text,
  `recorded_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `class_id` (`class_id`),
  KEY `recorded_by` (`recorded_by`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `student_id`, `class_id`, `date`, `status`, `remarks`, `recorded_by`) VALUES
(8, 3, 4, '2025-05-10', 'Present', '', 2),
(9, 3, 4, '2025-05-09', 'Absent', '', 2),
(10, 3, 4, '2025-05-08', 'Absent', '', 2),
(11, 3, 4, '2025-05-07', 'Absent', '', 2),
(12, 3, 4, '2025-05-06', 'Present', '', 2),
(13, 3, 4, '2025-05-13', 'Absent', '', 2),
(14, 1, 4, '2025-05-13', 'Absent', '', 2),
(15, 3, 4, '2025-05-11', 'Present', '', 2),
(16, 1, 4, '2025-05-11', 'Present', '', 2),
(17, 3, 4, '2025-05-12', 'Present', '', 2),
(18, 1, 4, '2025-05-12', 'Absent', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL,
  `description` text,
  `teacher_id` int DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `description`, `teacher_id`, `schedule`) VALUES
(1, 'SWE205', 'Mobile Application Development', 3, 'Wed 8-12'),
(2, 'SWE211', 'Object Oriented Programming 2', 5, 'Mon 8-12'),
(3, 'SWE212', 'Internet and Web Design', 4, 'Thur 12-4'),
(4, 'CS101', 'Introduction To Computer Science', 2, 'Tue 8-12'),
(5, 'SWE201', 'Object Oriented Programming 1', 3, 'Wed 12-4');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE IF NOT EXISTS `enrollment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id`, `student_id`, `class_id`, `enrollment_date`) VALUES
(1, 3, 4, '2025-05-08'),
(2, 1, 4, '2025-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires_at`, `created_at`) VALUES
(9, 'tseleryan37@gmail.com', 'cb2fac3d3513b94306b75dba01f0029b', '2025-05-12 21:55:52', '2025-05-12 20:55:52'),
(8, 'tseleryan37@gmail.com', 'c93622c9140993f7eb8720c84e3666f8', '2025-05-12 21:27:53', '2025-05-12 20:27:53'),
(7, 'raydough01@gmail.com', '6068095676d5d29af8bcfabc3a59da03', '2025-05-12 16:14:57', '2025-05-12 15:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `first_name`, `last_name`, `email`, `phone`) VALUES
(1, 'B231773B', 'Ryan', 'Tsele', 'raydough01@gmail.com', '0779948520'),
(2, 'B230528B', 'Peter', 'Mufudza', 'petermufudza06@gmail.com', '0778587309'),
(3, 'B227332B', 'Victor', 'Gomwe', 'vgomwe21@gmail.com', '0771412826'),
(4, 'B230004B', 'John', 'Doe', 'johndoe1@gmail.com', '+263771234001'),
(5, 'B230005B', 'Alice', 'Smith', 'alicesmith@yahoo.com', '+263771234002'),
(6, 'B230006B', 'Robert', 'Johnson', 'robertjohnson@gmail.com', '+263771234003'),
(7, 'B230007B', 'Emily', 'Clark', 'emilyclark@yahoo.com', '+263771234004'),
(8, 'B230008B', 'Michael', 'Brown', 'michaelbrown@gmail.com', '+263771234005'),
(9, 'B230009B', 'Jessica', 'Davis', 'jessicadavis@yahoo.com', '+263771234006'),
(10, 'B230010B', 'David', 'Miller', 'davidmiller@gmail.com', '+263771234007'),
(11, 'B230011B', 'Sarah', 'Wilson', 'sarahwilson@yahoo.com', '+263771234008'),
(12, 'B230012B', 'Daniel', 'Moore', 'danielmoore@gmail.com', '+263771234009'),
(13, 'B230013B', 'Sophia', 'Taylor', 'sophiataylor@yahoo.com', '+263771234010'),
(14, 'B230014B', 'James', 'Anderson', 'jamesanderson@gmail.com', '+263771234011'),
(15, 'B230015B', 'Olivia', 'Thomas', 'oliviathomas@yahoo.com', '+263771234012'),
(16, 'B230016B', 'Matthew', 'Lee', 'matthewlee@gmail.com', '+263771234013'),
(17, 'B230017B', 'Chloe', 'Harris', 'chloeharris@yahoo.com', '+263771234014'),
(18, 'B230018B', 'Andrew', 'Martin', 'andrewmartin@gmail.com', '+263771234015'),
(19, 'B230019B', 'Emma', 'White', 'emmawhite@yahoo.com', '+263771234016'),
(20, 'B230020B', 'Joshua', 'King', 'joshuaking@gmail.com', '+263771234017'),
(21, 'B230021B', 'Isabella', 'Scott', 'isabellascott@yahoo.com', '+263771234018'),
(22, 'B230022B', 'Ethan', 'Hall', 'ethanhall@gmail.com', '+263771234019'),
(23, 'B230023B', 'Mia', 'Young', 'miayoung@yahoo.com', '+263771234020');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `created_at`) VALUES
(1, 'admin', '$2y$10$J3zt7gJ8JzsOHQvQZNaexeOeyLgHtdvzhbza0RiemlRZiDtguDrOa', 'admin', 'tseleryan37@gmail.com', '2025-05-08 02:53:35'),
(2, 'Ndumiyana', '$2y$10$9cteJDGpHQorcER41P47HuiGP/hhVzCNkdOC/A04Qq1E2omVEvE92', 'teacher', 'dndumiyana@buse.ac.zw', '2025-05-08 06:57:16'),
(3, 'Mhlanganiso', '$2y$10$FfNINC0l9Y686p5uxwZjxuTjqcNbXvtQlfVlTZDU53T26qhwO36Nu', 'teacher', 'tmhlanganiso@buse.ac.zw', '2025-05-08 06:58:17'),
(4, 'Zano', '$2y$10$HPi7jyf77F6dTNaT9GcSDu0L7GcJ93a5lIYTIU3l.d2P63aphAjgy', 'teacher', 'czano@buse.ac.zw', '2025-05-08 06:59:38'),
(5, 'Chikwiriro', '$2y$10$8aJXkI5YYfWEP3xa20io1.JLmMbU5llxPBtNpKusV9Pg7IOJAR2fi', 'teacher', 'hchikwiriro@buse.ac.zw', '2025-05-08 07:00:29'),
(6, 'Nemure', '$2y$10$r3wzyQ9l4snuZe5dTVr4V.nI1EOsHyS6EqErQtuNSEgJOwiKWQAyO', 'teacher', 'tnemure@buse.ac.zw', '2025-05-08 07:06:56'),
(7, 'Ryie', '$2y$10$kxEx5hPOJWMF40WkR4x7EOuJrxoSlH3z5HT6G9uItc24xetPydMfG', 'teacher', 'raydough01@gmail.com', '2025-05-10 10:32:45');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
