-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 17, 2021 at 04:53 AM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `w1715777_0`
--

-- --------------------------------------------------------

--
-- Table structure for table `genredata`
--

CREATE TABLE `genredata` (
  `genreid` int NOT NULL,
  `genretype` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Dumping data for table `genredata`
--

INSERT INTO `genredata` (`genreid`, `genretype`) VALUES
(1, 'Classic'),
(4, 'Country'),
(3, 'Pop'),
(2, 'Rock');

-- --------------------------------------------------------

--
-- Table structure for table `postdata`
--

CREATE TABLE `postdata` (
  `postid` int NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `postdescription` text COLLATE utf8_bin NOT NULL,
  `posttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `relationshipdata`
--

CREATE TABLE `relationshipdata` (
  `relationshipid` int NOT NULL,
  `requesterusername` varchar(50) COLLATE utf8_bin NOT NULL,
  `accepterusername` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Dumping data for table `relationshipdata`
--

INSERT INTO `relationshipdata` (`relationshipid`, `requesterusername`, `accepterusername`) VALUES
(1, 'rohanlekamge', 'kamalkre');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `userid` int NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `fname` varchar(40) COLLATE utf8_bin NOT NULL,
  `lname` varchar(40) COLLATE utf8_bin NOT NULL,
  `address` varchar(200) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`userid`, `username`, `fname`, `lname`, `address`, `password`) VALUES
(3, 'rohanlekamge', 'Rohan', 'Lekamge', '25/F, Pathakada, Ratnapura', '8cb2237d0679ca88db6464eac60da96345513964'),
(4, 'kamalkre', 'Sasanka ', 'Perera', '25/F, Pathakada, Ratnapura', '8cb2237d0679ca88db6464eac60da96345513964');

-- --------------------------------------------------------

--
-- Table structure for table `usergenredata`
--

CREATE TABLE `usergenredata` (
  `usergenreid` int NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `genretype` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Dumping data for table `usergenredata`
--

INSERT INTO `usergenredata` (`usergenreid`, `username`, `genretype`) VALUES
(1, 'rohanlekamge', 'Classic'),
(2, 'rohanlekamge', 'Rock'),
(3, 'sasankabishop', 'Rock'),
(4, 'sasankabishop', 'Pop'),
(5, 'rohanlekamge', 'Classic'),
(6, 'rohanlekamge', 'Country'),
(7, 'kamalkre', 'Classic'),
(8, 'kamalkre', 'Rock'),
(9, 'kamalkre', 'Country');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genredata`
--
ALTER TABLE `genredata`
  ADD PRIMARY KEY (`genretype`);

--
-- Indexes for table `postdata`
--
ALTER TABLE `postdata`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `relationshipdata`
--
ALTER TABLE `relationshipdata`
  ADD PRIMARY KEY (`relationshipid`),
  ADD KEY `requesterusername` (`requesterusername`),
  ADD KEY `accepterusername` (`accepterusername`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`userid`,`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `usergenredata`
--
ALTER TABLE `usergenredata`
  ADD PRIMARY KEY (`usergenreid`),
  ADD UNIQUE KEY `usergenreid` (`usergenreid`),
  ADD KEY `genretype` (`genretype`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `postdata`
--
ALTER TABLE `postdata`
  MODIFY `postid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `relationshipdata`
--
ALTER TABLE `relationshipdata`
  MODIFY `relationshipid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `userid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usergenredata`
--
ALTER TABLE `usergenredata`
  MODIFY `usergenreid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `postdata`
--
ALTER TABLE `postdata`
  ADD CONSTRAINT `postdata_ibfk_1` FOREIGN KEY (`username`) REFERENCES `userdata` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relationshipdata`
--
ALTER TABLE `relationshipdata`
  ADD CONSTRAINT `relationshipdata_ibfk_1` FOREIGN KEY (`requesterusername`) REFERENCES `userdata` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relationshipdata_ibfk_2` FOREIGN KEY (`accepterusername`) REFERENCES `userdata` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergenredata`
--
ALTER TABLE `usergenredata`
  ADD CONSTRAINT `usergenredata_ibfk_1` FOREIGN KEY (`genretype`) REFERENCES `genredata` (`genretype`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
