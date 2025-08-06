-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2025 at 02:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `full_name`) VALUES
(1, 'Ossai Ovie');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `drug_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `expiry_date` date NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `status` enum('OK','LOW STOCK','EXPIRED','OUT OF STOCK') DEFAULT 'OK',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `drug_name`, `quantity`, `unit`, `expiry_date`, `category`, `status`, `created_at`) VALUES
(1, 'Paracetamol', 3, 'vials', '2027-11-17', 'Antimalarial', 'LOW STOCK', '2025-07-23 14:18:43'),
(4, 'Panadol', 93, 'ampoules', '2028-12-29', 'Antifungal', 'OK', '2025-07-23 14:51:18'),
(6, 'Vitamin C', 70, 'tabs', '2027-12-08', 'Antifungal', 'OK', '2025-07-23 15:02:27'),
(7, 'Amoxicillin', 93, 'tabs', '2029-07-23', 'Antiviral', 'OK', '2025-07-23 22:47:33'),
(8, 'Ibruprofen', 12, 'caps', '2028-10-24', 'Antimalarial', 'LOW STOCK', '2025-07-25 10:38:09'),
(9, 'Penicillin', 10, 'ml', '2028-11-14', 'Antiviral', 'LOW STOCK', '2025-07-30 11:10:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `expires_at`, `created_at`) VALUES
(9, 'nat@gmail.com', 'f1d2173c1719a1ec0e4b8b030a9e6c0ebcafa5b70add6921e587aedd1b64543c', '2025-07-28 12:39:02', '2025-07-28 10:39:02'),
(11, 'one@gmail.com', '81c497bda6fdb2a5f1fc2923b62ec0c4965e4acbf592a81ed512ef9d7da90d31', '2025-07-28 12:39:36', '2025-07-28 10:39:36'),
(16, 'nathan14@gmail.com', '8ba8a10b34b19eac3ff4f0d9135f58ceb479edf31bdb28c3a33a70cd35097c08', '2025-07-28 12:46:29', '2025-07-28 10:46:29'),
(18, 'nathanegbedi14@gmail.com', '0683ef0484e4babca8933273fac8380c04b41309bcd00b636978c004d5084046', '2025-07-31 19:09:42', '2025-07-31 17:09:42'),
(19, 'nathanegbedi11@gmail.com', 'e9b47fa82f17902fcdb51de1dd844d64162d053e6431832cb3de71b5e72dd42b', '2025-08-01 19:18:10', '2025-08-01 17:18:10'),
(20, 'n@gmail.com', '111b3843f747647bfc6f630b5f864535e1568eaae9b7e0906ee42a50c59bf5cf', '2025-08-05 14:17:39', '2025-08-05 12:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_id`, `full_name`, `age`, `gender`, `phone`, `email`, `registered_at`) VALUES
(1, 'NHS001', 'Nathan Efe', 29, 'Male', '0987654321', 'nathan@gmail.com', '2025-07-23 21:46:57'),
(2, 'NHS002', 'Favour Ade', 22, 'Female', '1234567890', 'favour@gmail.com', '2025-07-23 22:26:27'),
(3, 'NHS003', 'John Ade', 29, 'Male', '0987654321', 'john@gmail.com', '2025-08-01 07:37:27'),
(4, 'NHS004', 'Angela Okafor', 18, 'Female', '1234567890', 'angela@gmail.com', '2025-08-01 07:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `prescribed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Dispensed','Partially Dispensed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `patient_id`, `drug_id`, `doctor_id`, `prescribed_at`, `status`) VALUES
(1, 1, 4, 1, '2025-07-23 21:53:05', 'Dispensed'),
(2, 1, 4, 1, '2025-07-23 21:55:54', 'Pending'),
(3, 1, 4, 1, '2025-07-23 21:55:54', 'Dispensed'),
(4, 1, 6, 1, '2025-07-23 21:56:58', 'Partially Dispensed'),
(5, 1, 6, 1, '2025-07-23 21:56:58', 'Pending'),
(6, 1, 1, 1, '2025-07-23 22:08:56', 'Dispensed'),
(7, 1, 4, 1, '2025-07-23 22:08:56', 'Dispensed'),
(8, 1, 4, 1, '2025-07-23 22:14:30', 'Dispensed'),
(9, 1, 1, 1, '2025-07-23 22:14:30', 'Pending'),
(10, 2, 4, 1, '2025-07-23 22:26:44', 'Dispensed'),
(11, 2, 4, 1, '2025-07-23 22:46:08', 'Dispensed'),
(12, 2, 7, 1, '2025-07-24 07:22:26', 'Pending'),
(13, 2, 1, 1, '2025-07-24 07:22:26', 'Partially Dispensed'),
(14, 1, 7, 1, '2025-07-24 07:23:35', 'Dispensed'),
(15, 1, 7, 1, '2025-07-24 07:24:06', 'Pending'),
(16, 2, 8, 1, '2025-07-31 12:50:31', 'Pending'),
(17, 2, 1, 1, '2025-07-31 12:50:31', 'Pending'),
(18, 3, 9, 1, '2025-08-01 07:39:34', 'Dispensed'),
(19, 3, 6, 1, '2025-08-01 07:39:34', 'Dispensed'),
(20, 4, 9, 1, '2025-08-01 07:45:50', 'Dispensed'),
(21, 4, 8, 1, '2025-08-01 07:45:50', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_items`
--

CREATE TABLE `prescription_items` (
  `id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `quantity_prescribed` int(11) NOT NULL,
  `quantity_dispensed` int(11) DEFAULT NULL,
  `status` enum('Pending','Dispensed') DEFAULT 'Pending',
  `dispensed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription_items`
--

INSERT INTO `prescription_items` (`id`, `prescription_id`, `drug_id`, `quantity_prescribed`, `quantity_dispensed`, `status`, `dispensed_at`) VALUES
(11, 1, 8, 2, 2, 'Pending', '0000-00-00 00:00:00'),
(12, 1, 6, 3, 3, 'Pending', '0000-00-00 00:00:00'),
(13, 2, 7, 2, 2, 'Pending', '0000-00-00 00:00:00'),
(14, 3, 8, 3, 3, 'Pending', '0000-00-00 00:00:00'),
(15, 12, 8, 2, 2, 'Pending', '0000-00-00 00:00:00'),
(16, 12, 1, 1, 1, 'Pending', '0000-00-00 00:00:00'),
(17, 13, 6, 1, 1, 'Pending', '0000-00-00 00:00:00'),
(18, 13, 7, 2, 2, 'Pending', '0000-00-00 00:00:00'),
(19, 5, 1, 1, 1, 'Pending', NULL),
(20, 9, 9, 3, 0, 'Pending', '0000-00-00 00:00:00'),
(22, 4, 1, 3, 3, 'Pending', '0000-00-00 00:00:00'),
(24, 4, 7, 2, 2, 'Pending', NULL),
(25, 11, 9, 10, 10, 'Pending', '0000-00-00 00:00:00'),
(26, 6, 6, 2, 2, 'Dispensed', '2025-08-06 11:03:18'),
(27, 4, 8, 1, 1, 'Pending', NULL),
(28, 18, 6, 2, 2, 'Pending', '0000-00-00 00:00:00'),
(29, 18, 7, 3, 3, 'Pending', '0000-00-00 00:00:00'),
(30, 19, 4, 3, 3, 'Pending', '0000-00-00 00:00:00'),
(31, 19, 8, 3, 3, 'Pending', '0000-00-00 00:00:00'),
(32, 20, 4, 3, 3, 'Pending', '0000-00-00 00:00:00'),
(33, 20, 8, 3, 3, 'Pending', '0000-00-00 00:00:00');

--
-- Triggers `prescription_items`
--
DELIMITER $$
CREATE TRIGGER `update_dispensed_at` BEFORE UPDATE ON `prescription_items` FOR EACH ROW BEGIN
    IF NEW.status = 'Dispensed' AND OLD.status != 'Dispensed' THEN
        SET NEW.dispensed_at = NOW();
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `staff_id` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `license_number` varchar(100) NOT NULL,
  `years_of_experience` int(11) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `profile_picture` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `user_id`, `staff_id`, `email`, `password_hash`, `full_name`, `phone_number`, `address`, `date_of_birth`, `gender`, `blood_group`, `job_title`, `department`, `license_number`, `years_of_experience`, `qualification`, `status`, `profile_picture`, `created_at`) VALUES
(1, 'U0001', 'PHARM/001', 'efe@y.com', '$2y$10$cSFPB6xLRp5rNxctD7q.BOn8Qua6BEOtPLsCFhiiI9.vGQ.qDpiIu', '', '', '', '0000-00-00', '', '', '', '', '', 0, '', '', '', '2025-07-23 13:19:20'),
(2, 'U0002', 'PHARM/002', 'n@gmail.com', '$2y$10$dgzmLxjhs35EU7tTr3VW7eYkxOv9Fkv8FCPhFl7wbJt/MOHjumQba', '', '', '', '0000-00-00', '', '', '', '', '', 0, '', '', '', '2025-07-23 13:19:59'),
(3, 'U0003', 'PHARM/003', 'nathanefe@y.com', '$2y$10$UEbio6ccudU/GnAlmi8pVO3QUkK7lcNCOJPVI41v6p79b55TxsojK', '', '', '', '0000-00-00', '', '', '', '', '', 0, '', '', '', '2025-07-23 13:28:56'),
(4, 'U0004', 'PHARM/004', 'nathan14@gmail.com', '$2y$10$EHGtbjW3iMUpioLprSk0IukSwpw4EGwWumsfmdQZ5nThRdFn7s7cW', 'Nathan Efe', '0987654321', 'Ivie Road, Abraka', '2025-07-01', 'Male', 'AB+', 'Pharmacist', 'Pharmacy', 'PHARM12345', 6, 'Degree', '', 'uploads/profile_688a006403546.jpg', '2025-07-23 13:39:55'),
(5, 'U0005', 'PHARM/005', 'nathanegbedi14@gmail.com', '$2y$10$nP2CjvWUHD1ebm2GXrn4k.NWI2yRAfLSj1UxMMWOt6iM2CIYYOwWG', '', '', '', '0000-00-00', '', '', '', '', '', 0, '', '', '', '2025-07-28 08:58:20'),
(6, 'U0006', 'PHARM/006', 'rossy@gmail.com', '$2y$10$31//6agW.dl/hk6S7qpzmOrbIPm.qiFzzsBthTuzQJ3eGHO9c/oFC', '', '', '', '0000-00-00', '', '', '', '', '', 0, '', '', '', '2025-07-30 12:11:56'),
(7, 'U0007', 'PHARM/007', 'nathanegbedi11@gmail.com', '$2y$10$s1spyHwkH8TkQGZyYnpnueYJT9SN90MqAZR8uHQ8qZqa3MjdtqMeG', '', '', '', '0000-00-00', '', '', '', '', '', 0, '', '', '', '2025-08-01 07:28:42'),
(8, 'U0008', 'ID/123', 'n@y.com', '$2y$10$EeYRW/5f5MDQi0TF7vu0o.ai5QU8zZyWa91jZI28SLPxwhsEvfEVy', '', '', '', '0000-00-00', '', '', '', '', '', 0, '', '', '', '2025-08-06 09:12:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_patient` (`patient_id`),
  ADD KEY `fk_drug` (`drug_id`),
  ADD KEY `fk_doctor` (`doctor_id`);

--
-- Indexes for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `fk_prescription` (`prescription_id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `prescription_items`
--
ALTER TABLE `prescription_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `fk_drug` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  ADD CONSTRAINT `fk_patient` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`);

--
-- Constraints for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD CONSTRAINT `fk_prescription` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prescription_items_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`),
  ADD CONSTRAINT `prescription_items_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
