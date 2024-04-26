-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2024 at 06:10 PM
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
-- Database: `flight`
--

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `f_id` varchar(250) NOT NULL,
  `f_name` varchar(250) NOT NULL,
  `f_from` varchar(250) NOT NULL,
  `f_to` varchar(250) NOT NULL,
  `f_date` date NOT NULL,
  `f_time` varchar(250) NOT NULL,
  `adult_cost` varchar(250) NOT NULL,
  `available` int(11) NOT NULL,
  `child_cost` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`f_id`, `f_name`, `f_from`, `f_to`, `f_date`, `f_time`, `adult_cost`, `available`, `child_cost`) VALUES
('f0001', 'e001', 'Dhaka', 'London', '2024-04-25', '4.00.00', '$100', 100, '$50'),
('f0002', 'e002', 'Dhaka', 'London', '2024-04-26', '4.00.00', '$50', 100, '$15'),
('f0003', 'e003', 'Dhaka', 'London', '2024-04-27', '4.00.00', '$80', 100, '$30'),
('f0004', 'e001', 'Dhaka', 'London', '2024-04-28', '4.00.00', '$100', 100, '$50'),
('f0005', 'e002', 'Dhaka', 'London', '2024-04-29', '4.00.00', '$50', 100, '$15'),
('f0006', 'e003', 'Dhaka', 'London', '2024-04-30', '4.00.00', '$80', 100, '$30'),
('f0007', 'e001', 'Dhaka', 'London', '2024-04-25', '4.00.00', '$100', 92, '$50'),
('f0008', 'e002', 'Dhaka', 'London', '2024-04-26', '4.00.00', '$50', 90, '$15'),
('f0009', 'e005', 'Dhaka', 'Coxs Bazar', '2024-04-27', '09.30.00', '$200', 0, '$50');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `from` varchar(250) NOT NULL,
  `to` varchar(250) NOT NULL,
  `buy_date` varchar(250) NOT NULL,
  `payment` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `f_id` varchar(250) NOT NULL,
  `f_name` varchar(250) NOT NULL,
  `f_time` varchar(250) NOT NULL,
  `f_cost` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`from`, `to`, `buy_date`, `payment`, `email`, `f_id`, `f_name`, `f_time`, `f_cost`) VALUES
('Dhaka', 'London', '2024-04-24', 'Bkash', 'muntasir145@gmail.com', 'f001', 'e001', '04.00.00', '$100'),
('Dhaka', 'London', '2024-04-25', 'Bkash', 'muntasir145@gmail.com', 'f0007', 'e001', '4.00.00', '$600'),
('Dhaka', 'Coxs Bazar', '2024-04-27', 'Bkash', 'muntasir145@gmail.com', 'f0009', 'e005', '09.30.00', '$850'),
('Dhaka', 'London', '2024-04-26', 'Debit card', 'muntasir145@gmail.com', 'f0008', 'e002', '4.00.00', '$260'),
('Dhaka', 'London', '2024-04-26', 'Bkash', 'muntasir145@gmail.com', 'f0008', 'e002', '4.00.00', '$100');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_info`
--

CREATE TABLE `ticket_info` (
  `From` varchar(250) NOT NULL,
  `To` varchar(250) NOT NULL,
  `buy_date` varchar(250) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `Payment` varchar(250) NOT NULL,
  `Adult` int(11) NOT NULL,
  `Child` int(11) NOT NULL,
  `Email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `f_name` varchar(250) NOT NULL,
  `l_name` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `b_date` date NOT NULL,
  `Password` varchar(20) NOT NULL,
  `p_number` int(11) NOT NULL,
  `Gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `f_name`, `l_name`, `Email`, `b_date`, `Password`, `p_number`, `Gender`) VALUES
(1, 'Muntasir', 'Amit', 'admin47@gmail.com', '1999-06-13', 'Aabb@1234', 1711457876, 'Male'),
(2, 'Muntasir', 'Mahmud', 'muntasir145@gmail.com', '2003-05-10', 'Aabb@1234', 1721857708, 'Male'),
(3, 'Muntasir', 'Mahmud', 'muntasir147@gmail.com', '2013-05-26', 'Aabb@1234', 1721857799, 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `ticket_info`
--
ALTER TABLE `ticket_info`
  ADD PRIMARY KEY (`Email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `index` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
