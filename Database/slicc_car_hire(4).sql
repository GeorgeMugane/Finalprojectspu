-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2020 at 11:47 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slicc car hire`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `year` int(10) NOT NULL,
  `regno` varchar(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Available'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `type`, `model`, `year`, `regno`, `file`, `title`, `description`, `date`, `status`) VALUES
(19, 'Automatic', 'Sedan', 2010, 'KCA001G', 'car4.jpg', 'TOYOTA CAMRY', 'Transmission : Automatic\r\nPrice : Ksh.4000 per day\r\nPassengers : 5 ', '2016-04-13', 'Available'),
(20, 'Automatic', 'SUV', 2005, 'KCA001H', 'Car3.jpg', 'HIGHLANDER', 'Transmission : Automatic\r\nPrice : Ksh.8000 per day\r\nPassengers : 7 ', '2016-04-13', 'Available'),
(21, 'Manual', 'SUV', 2015, 'KCA001I', 'Car2.jpg', 'LANDCRUISER', 'Transmission : Automatic/Manual\r\nPrice : Ksh.11000 per day\r\nPassengers : 8 ', '2016-04-13', 'Available'),
(22, 'Automatic', 'SUV', 2010, 'KCA001J', 'Car2_1.jpg', 'LANDCRUISER', 'Transmission :Manual\r\nPrice : Ksh.11000 per day\r\nPassengers : 8 ', '2016-04-13', 'Available'),
(23, 'Automatic', 'SUV', 2005, 'KCA001K', 'Car1.jpg', '4RUNNER', 'Transmission : Automatic\r\nPrice : Ksh.8000 per day\r\nPassengers : 5 ', '2016-04-13', 'Available'),
(13, 'Manual', 'Bus', 2015, 'KCA001A', 'car9.png', 'TOYOTA COASTER BUS', 'Transmission : manual\r\nPrice : Ksh.15000 per day\r\nPassengers : up to 20 ', '2016-04-13', 'Available'),
(14, 'Manual', 'Bus', 2015, 'KCA001B', 'Car8_1.jpg', 'TOYOTA HIACE MINIBUS', 'Transmission : Manual\r\nPrice : Ksh.10000 per day\r\nPassengers : 12 ', '2016-04-13', 'Available'),
(15, 'Automatic', 'Bus', 2015, 'KCA001C', 'Car8.JPG', 'TOYOTA HIACE MINIBUS', 'Transmission : Automatic\r\nPrice : Ksh.10000 per day\r\nPassengers : 12 ', '2016-04-13', 'Available'),
(16, 'Manual', 'Truck', 2015, 'KCA001D', 'Car7_1.jpg', 'TOYOTA TUNDRA', 'ransmission : Manual\r\nPrice : Ksh.7000 per day\r\nPassengers : up to 6', '2016-04-13', 'Available'),
(17, 'Automatic', 'Hatch', 2005, 'KCA001E', 'Car6.jpg', 'TOYOTA YARIS', 'Transmission : Automatic\r\nPrice : Ksh.3500 per day\r\nPassengers : up to 5 ', '2016-04-13', 'Available'),
(18, 'Automatic', 'Sedan', 2010, 'KCA001F', 'Car5.jpg', 'TOYOTA COROLLA', 'Transmission : Automatic\r\nPrice : Ksh.4200 per day\r\nPassengers : 5 ', '2016-04-13', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(100) NOT NULL,
  `login_username` varchar(100) NOT NULL,
  `login_password` varchar(100) NOT NULL,
  `login_rank` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_username`, `login_password`, `login_rank`) VALUES
(1, 'mugane george', 'george@2020', 'staff'),
(2, 'hassan njeri', 'njerihassan', 'staff'),
(3, 'faith nanaa', 'nanaa 2020', 'customer'),
(4, 'ann njeri', 'njeri1990', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_name` text NOT NULL,
  `owner_id` int(20) NOT NULL,
  `owner_email` varchar(30) NOT NULL,
  `owner_residence` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_name`, `owner_id`, `owner_email`, `owner_residence`) VALUES
('martin mwangi', 1, 'mwangimartin@gmail.com', 'lavington'),
('paul mwangi', 2, 'mwangipaul@gmail.com', 'kitusuru');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `payment_amount` int(255) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_reservation_id` int(50) NOT NULL,
  `payment_reference_no` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `payment_method`, `payment_amount`, `payment_date`, `payment_reservation_id`, `payment_reference_no`) VALUES
(1, 'mpesa', 3500, '2020-03-02', 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `regno` varchar(20) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `national_ID` int(12) NOT NULL,
  `phone` int(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `regno`, `fullname`, `national_ID`, `phone`, `email`, `date`) VALUES
(10, '23', 'John Doe', 22232323, 789345673, 'john@doe.com', '2020-07-31');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_name` varchar(100) NOT NULL,
  `staff_id` int(100) NOT NULL,
  `staff_email` varchar(50) NOT NULL,
  `staff_phone` int(20) NOT NULL,
  `staff_residence` varchar(100) NOT NULL,
  `staff_marital_status` tinyint(1) NOT NULL,
  `staff_log_in` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_name`, `staff_id`, `staff_email`, `staff_phone`, `staff_residence`, `staff_marital_status`, `staff_log_in`) VALUES
('hassan njeri', 1, 'hassannjeri@gmail.com', 745978232, 'progressive', 1, 2),
('mugane george', 2, 'muganegeorge@gmail.com', 724635448, 'githurai', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `type`) VALUES
(9, 'Dennis Kibe', 'denniskibe254@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Admin'),
(10, 'kim kamau', 'kim@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Admin'),
(11, 'nancy kibe', 'nancy@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Level B'),
(12, 'allan langat', 'allan@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Level B'),
(13, 'wera', 'john@doe.com', 'e10adc3949ba59abbe56e057f20f883e', ''),
(14, 'Jane Doe', 'jane@doe.com', 'e10adc3949ba59abbe56e057f20f883e', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_ibfk_1` (`payment_reference_no`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `staff_ibfk_1` (`staff_log_in`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`payment_reference_no`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`staff_log_in`) REFERENCES `login` (`login_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
