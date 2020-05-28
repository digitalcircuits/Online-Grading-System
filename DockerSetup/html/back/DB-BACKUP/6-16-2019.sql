-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: sql1.njit.edu
-- Generation Time: Jun 16, 2019 at 05:43 PM
-- Server version: 5.5.29-log
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `df227`
--

-- --------------------------------------------------------

--
-- Table structure for table `exam_list`
--

CREATE TABLE IF NOT EXISTS `exam_list` (
`exam_id` int(11) NOT NULL,
  `exam_name` text NOT NULL,
  `question_list` text NOT NULL,
  `question_points` text NOT NULL,
  `max_points` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `exam_list`
--

INSERT INTO `exam_list` (`exam_id`, `exam_name`, `question_list`, `question_points`, `max_points`) VALUES
(41, 'lele', '[{"qid":"50"},{"qid":"58"},{"qid":"59"}]', '[{"point_value":"50"},{"point_value":"25"},{"point_value":"25"}]', 100),
(42, 'TestDisplay', '[{"qid":"50"},{"qid":"59"},{"qid":"62"}]', '[{"point_value":"25"},{"point_value":"25"},{"point_value":"50"}]', 100),
(43, 'TestWithOp', '[{"qid":"63"},{"qid":"67"},{"qid":"68"}]', '[{"point_value":"50"},{"point_value":"25"},{"point_value":"25"}]', 100);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
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

CREATE TABLE IF NOT EXISTS `question_bank` (
`qid` int(255) NOT NULL,
  `question` text NOT NULL,
  `q_type` text NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `q_difficulty` text NOT NULL,
  `q_cases` varchar(700) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `question_bank`
--

INSERT INTO `question_bank` (`qid`, `question`, `q_type`, `function_name`, `q_difficulty`, `q_cases`, `keyword`) VALUES
(50, 'MATHS, Do, it.', 'Lists', 'operation', 'hard', 'JysnLDEsMQ==,Mg==;Jy0nLDY5LDEy,NTc=', 'if'),
(58, 'constraint test', 'For Loops', 'forTest', 'easy', 'YSxi,Yw==;MSwy,Mw==', 'for'),
(59, 'Real for test', 'For Loops', 'forLoop', 'easy', 'MSwy,Mw==;YQ==,Yg==', 'for'),
(61, 'While constraint', 'While Loops', 'while()', 'easy', 'MSwy,Mw==;YQ==,Yg==', 'while'),
(62, 'Question about stuff', 'Lists', 'stop', 'easy', 'aGk=,MQ==;Ynll,Mg==', 'if'),
(63, 'Write a function that doubles a number when recieved. Function is called "doubleIt"', 'Lists', 'doubleIt', 'medium', 'Mg==,NA==;NA==,OA==', ''),
(65, 'Write an op 2', 'Lists', 'operation', 'easy', 'IisiLDIsMg==,NA==;Ii0iLDIsMg==,MA==', ''),
(67, 'Write a function called operation that takes 3 arguments, op, a, and b', 'Lists', 'operation', 'easy', 'IisiLDIsMg==,NA==;Ii0iLDIsMg==,MA==;IioiLDIsMg==,NA==;Ii8iLDIsMg==,MQ==', ''),
(68, 'Write a function called stringMultiply that multiplies a string', 'Lists', 'stringMultiply', 'easy', 'MiwiaGVsbG8i,ImhlbGxvaGVsbG8i;MywiaGki,ImhpaGloaSI=', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_ans_exam`
--

CREATE TABLE IF NOT EXISTS `student_ans_exam` (
`uniq_exam_solve_id` int(11) NOT NULL,
  `ucid` varchar(255) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `auto_grader_status` tinyint(1) NOT NULL DEFAULT '0',
  `graded_status` int(11) NOT NULL,
  `visible_status` int(11) NOT NULL,
  `student_ans` text NOT NULL,
  `grade` varchar(255) NOT NULL,
  `prof_comments` varchar(700) NOT NULL,
  `auto_grader_comments` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=162 ;

--
-- Dumping data for table `student_ans_exam`
--

INSERT INTO `student_ans_exam` (`uniq_exam_solve_id`, `ucid`, `exam_id`, `auto_grader_status`, `graded_status`, `visible_status`, `student_ans`, `grade`, `prof_comments`, `auto_grader_comments`) VALUES
(161, 'stud', 41, 1, 0, 0, 'YQ==,YQ==,YQ==', '[]', '', 'b:0;');

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
 ADD PRIMARY KEY (`uniq_exam_solve_id`), ADD KEY `ucid` (`ucid`), ADD KEY `exam_id` (`exam_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam_list`
--
ALTER TABLE `exam_list`
MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `question_bank`
--
ALTER TABLE `question_bank`
MODIFY `qid` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `student_ans_exam`
--
ALTER TABLE `student_ans_exam`
MODIFY `uniq_exam_solve_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=162;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_ans_exam`
--
ALTER TABLE `student_ans_exam`
ADD CONSTRAINT `student_ans_exam_ibfk_1` FOREIGN KEY (`ucid`) REFERENCES `login` (`ucid`),
ADD CONSTRAINT `student_ans_exam_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exam_list` (`exam_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
