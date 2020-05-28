-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2020 at 07:13 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs490`
--

-- --------------------------------------------------------

--
-- Table structure for table `exam_list`
--

CREATE TABLE `exam_list` (
  `exam_id` int(11) NOT NULL,
  `exam_name` text NOT NULL,
  `question_list` text NOT NULL,
  `question_points` text NOT NULL,
  `max_points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_list`
--

INSERT INTO `exam_list` (`exam_id`, `exam_name`, `question_list`, `question_points`, `max_points`) VALUES
(66, 'Sample Exam', '[{\"qid\":\"73\"},{\"qid\":\"74\"}]', '[{\"point_value\":\"50\"},{\"point_value\":\"50\"}]', 100),
(67, 'Sample Exam 2', '[{\"qid\":\"75\"},{\"qid\":\"77\"}]', '[{\"point_value\":\"50\"},{\"point_value\":\"50\"}]', 100);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `ucid` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ucid`, `password`, `id`) VALUES
('stud', '264c8c381bf16c982a4e59b0dd4c6f7808c51a05f64c35db42cc78a2a72875bb', 0),
('teach', '1057a9604e04b274da5a4de0c8f4b4868d9b230989f8c8c6a28221143cc5a755', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_bank`
--

CREATE TABLE `question_bank` (
  `qid` int(255) NOT NULL,
  `question` text NOT NULL,
  `q_type` text NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `q_difficulty` text NOT NULL,
  `q_cases` varchar(700) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_bank`
--

INSERT INTO `question_bank` (`qid`, `question`, `q_type`, `function_name`, `q_difficulty`, `q_cases`, `keyword`) VALUES
(73, 'Write a function named doubleIt that takes in a number and returns twice the amount.', 'Other', 'doubleIt', 'easy', 'Mg==,NA==;Mw==,Ng==', ''),
(74, 'Write a function named stringMult that takes a number and a string. It must return the string printed that number of times.', 'Strings', 'stringMult', 'easy', 'J2hlbGxvJywy,aGVsbG9oZWxsbw==;J2hpJywz,aGloaWhp', ''),
(75, 'Write a function named plusTen that takes in a number and adds 10 to it. However it MUST use a for loop.', 'For Loops', 'plusTen', 'easy', 'MTA=,MjA=;MTU=,MjU=', 'for'),
(76, 'Write a function called op that takes in an operation and two numbers. The operations can be addition, multiplication, subtraction, or division. The program must be able to account for these possibilities.', 'If Statements', 'op', 'easy', 'JysnLDIsMw==,NQ==;Jy0nLDMsMg==,MQ==;JyonLDQsMw==,MTI=;Jy8nLDE1LDU=,Mw==', ''),
(77, 'Write a function named minusFive that takes a number and subtracts it by 1 five times. It MUST use a while loop.', 'While Loops', 'minusFive', 'easy', 'NQ==,MA==;MTA=,NQ==', 'while');

-- --------------------------------------------------------

--
-- Table structure for table `student_ans_exam`
--

CREATE TABLE `student_ans_exam` (
  `uniq_exam_solve_id` int(11) NOT NULL,
  `ucid` varchar(255) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `auto_grader_status` tinyint(1) NOT NULL DEFAULT 0,
  `graded_status` int(11) NOT NULL,
  `visible_status` int(11) NOT NULL,
  `student_ans` text NOT NULL,
  `grade` varchar(255) NOT NULL,
  `prof_comments` varchar(700) NOT NULL,
  `auto_grader_comments` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_ans_exam`
--

INSERT INTO `student_ans_exam` (`uniq_exam_solve_id`, `ucid`, `exam_id`, `auto_grader_status`, `graded_status`, `visible_status`, `student_ans`, `grade`, `prof_comments`, `auto_grader_comments`) VALUES
(204, 'stud', 66, 1, 0, 1, 'ZGVmIGRvdWJsZUl0KGEpOgoJcmV0dXJuIGEqMg==,ZGVmIFN0cmluZ211bHRpKGEsIGIpOgoJcmV0dXJuIGEqYg==', '[[12.5,12.5,12.5,0,12.5],[0,12.5,12.5,0,12.5]]', '[\"Very Good!\",\"Please double check your variable naming next time!\"]', '[[{\"function\":true,\"compile\":true,\"print\":false,\"return\":true,\"keywords expected\":[\"\"],\"keywords hit\":[],\"test cases passed\":2,\"score\":[12.5,12.5,12.5,0,12.5],\"python\":[{\"function\":\"doubleIt\",\"expected\":\"4\",\"result\":\"4\",\"points\":6.25},{\"function\":\"doubleIt\",\"expected\":\"6\",\"result\":\"6\",\"points\":6.25}]}],[{\"function\":false,\"compile\":true,\"print\":false,\"return\":true,\"keywords expected\":[\"\"],\"keywords hit\":[],\"test cases passed\":2,\"score\":[0,12.5,12.5,0,12.5],\"python\":[{\"function\":\"stringMult\",\"expected\":\"hellohello\",\"result\":\"hellohello\",\"points\":6.25},{\"function\":\"stringMult\",\"expected\":\"hihihi\",\"result\":\"hihihi\",\"points\":6.25}]}]]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exam_list`
--
ALTER TABLE `exam_list`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ucid`);

--
-- Indexes for table `question_bank`
--
ALTER TABLE `question_bank`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `student_ans_exam`
--
ALTER TABLE `student_ans_exam`
  ADD PRIMARY KEY (`uniq_exam_solve_id`),
  ADD KEY `ucid` (`ucid`),
  ADD KEY `exam_id` (`exam_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam_list`
--
ALTER TABLE `exam_list`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `question_bank`
--
ALTER TABLE `question_bank`
  MODIFY `qid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `student_ans_exam`
--
ALTER TABLE `student_ans_exam`
  MODIFY `uniq_exam_solve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_ans_exam`
--
ALTER TABLE `student_ans_exam`
  ADD CONSTRAINT `student_ans_exam_ibfk_1` FOREIGN KEY (`ucid`) REFERENCES `login` (`ucid`),
  ADD CONSTRAINT `student_ans_exam_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exam_list` (`exam_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
