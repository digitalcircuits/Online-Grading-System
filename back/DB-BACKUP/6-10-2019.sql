-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: sql1.njit.edu
-- Generation Time: Jun 11, 2019 at 02:17 AM
-- Server version: 5.5.29-log
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mnz4`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `exam_list`
--

INSERT INTO `exam_list` (`exam_id`, `exam_name`, `question_list`, `question_points`, `max_points`) VALUES
(28, 'testcase', '[{"qid":"45"},{"qid":"46"}]', '[{"point_value":"50"},{"point_value":"50"}]', 100),
(29, 'examer2', '[{"qid":"45"},{"qid":"46"}]', '[{"point_value":"50"},{"point_value":"50"}]', 100);

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
  `q_cases` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `question_bank`
--

INSERT INTO `question_bank` (`qid`, `question`, `q_type`, `function_name`, `q_difficulty`, `q_cases`) VALUES
(45, 'def doubleIt(a):\n    return a*2', 'Lists', 'doubleIt', 'easy', 'Mg==,NA==;Lela,Sela'),
(46, 'def repeater(a):\n    return a', 'Lists', 'loler', 'easy', 'aGk=,aGk=');

-- --------------------------------------------------------

--
-- Table structure for table `student_ans_exam`
--

CREATE TABLE IF NOT EXISTS `student_ans_exam` (
`uniq_exam_solve_id` int(11) NOT NULL,
  `ucid` varchar(255) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `auto_grader_status` text NOT NULL,
  `graded_status` int(11) NOT NULL,
  `visible_status` int(11) NOT NULL,
  `student_ans` text NOT NULL,
  `student_ans_grade` text NOT NULL,
  `calc_grade` int(11) NOT NULL,
  `prof_comments` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `student_ans_exam`
--

INSERT INTO `student_ans_exam` (`uniq_exam_solve_id`, `ucid`, `exam_id`, `auto_grader_status`, `graded_status`, `visible_status`, `student_ans`, `student_ans_grade`, `calc_grade`, `prof_comments`) VALUES
(25, 'stud', 28, 'none', 0, 0, 'ZGVmIGRvdWJsZUl0KGEpOgogICAgcmV0dXJuIGEqMg==,ZGVmIHJlcGVhdGVyKGEpOgogICAgcmV0dXJuIGE=', '0', 0, ''),
(26, 'stud', 29, 'none', 0, 0, 'ZGVmIGRvdWJsZUl0KGEpOgogICAgcmV0dXJuIGEqMg==,ZGVmIGxvbGVyKGEpOgogICAgcmV0dXJuIGE=', '0', 0, '');

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
MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `question_bank`
--
ALTER TABLE `question_bank`
MODIFY `qid` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `student_ans_exam`
--
ALTER TABLE `student_ans_exam`
MODIFY `uniq_exam_solve_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
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
