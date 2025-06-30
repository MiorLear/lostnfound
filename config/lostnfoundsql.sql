-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 30, 2025 at 07:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lostnfound`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Celulares'),
(2, 'Llaves'),
(3, 'Carteras'),
(4, 'Documentos'),
(5, 'Ropa'),
(6, 'Mochilas'),
(7, 'Laptops'),
(8, 'Cargadores'),
(9, 'Audífonos'),
(10, 'Gafas');

-- --------------------------------------------------------

--
-- Table structure for table `found_reports`
--

CREATE TABLE `found_reports` (
  `found_report_id` int(11) NOT NULL,
  `found_place` varchar(100) NOT NULL,
  `found_reporting_user_id` int(11) NOT NULL,
  `found_date` date NOT NULL DEFAULT current_timestamp(),
  `found_report_extra_comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lost_reports`
--

CREATE TABLE `lost_reports` (
  `lost_report_id` int(11) NOT NULL,
  `lost_place` varchar(100) NOT NULL,
  `lost_reporting_user_id` int(11) NOT NULL,
  `lost_date` date NOT NULL DEFAULT current_timestamp(),
  `lost_report_extra_comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `objects`
--

CREATE TABLE `objects` (
  `object_id` int(11) NOT NULL,
  `object_name` varchar(100) NOT NULL,
  `object_description` text NOT NULL,
  `object_category_id` int(11) NOT NULL,
  `object_photo` varchar(100) NOT NULL,
  `object_status` enum('lost','found','returned','pending_return') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `objects`
--

INSERT INTO `objects` (`object_id`, `object_name`, `object_description`, `object_category_id`, `object_photo`, `object_status`) VALUES
(1, 'Redmi Buds 6', 'Audífonos negro Redmi Buds 6 marca xiaomi', 1, '', 'lost'),
(2, 'redmi buds 6', 'redmi buds negros', 1, '', 'lost');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `rol_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`rol_id`, `rol_name`) VALUES
(1, 'admin'),
(2, 'student'),
(3, 'teacher'),
(4, 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_mail` varchar(200) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_profile_photo` varchar(200) NOT NULL DEFAULT 'default_photo.png',
  `user_registration_date` date NOT NULL DEFAULT current_timestamp(),
  `user_rol_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_mail`, `user_name`, `user_password`, `user_profile_photo`, `user_registration_date`, `user_rol_id`) VALUES
(1, 'renediaz@keyinstitute.edu.sv', 'Rene Díaz', '12345', 'default_photo.png', '2025-06-30', 1),
(2, 'orlandoarevalo@keyinstitute.edu.sv', 'Orlando Arévalo', '13245', 'default_photo.png', '2025-06-30', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `found_reports`
--
ALTER TABLE `found_reports`
  ADD PRIMARY KEY (`found_report_id`),
  ADD KEY `found_reporting_user_id_constraint` (`found_reporting_user_id`);

--
-- Indexes for table `lost_reports`
--
ALTER TABLE `lost_reports`
  ADD PRIMARY KEY (`lost_report_id`),
  ADD KEY `found_reporting_user_id_constraint` (`lost_reporting_user_id`);

--
-- Indexes for table `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `objects_category_constraint` (`object_category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_mail` (`user_mail`),
  ADD KEY `user_role_constraint` (`user_rol_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `found_reports`
--
ALTER TABLE `found_reports`
  MODIFY `found_report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lost_reports`
--
ALTER TABLE `lost_reports`
  MODIFY `lost_report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objects`
--
ALTER TABLE `objects`
  MODIFY `object_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `found_reports`
--
ALTER TABLE `found_reports`
  ADD CONSTRAINT `found_reporting_user_id_constraint` FOREIGN KEY (`found_reporting_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `objects`
--
ALTER TABLE `objects`
  ADD CONSTRAINT `objects_category_constraint` FOREIGN KEY (`object_category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_role_constraint` FOREIGN KEY (`user_rol_id`) REFERENCES `roles` (`rol_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
