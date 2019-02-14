/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : coursesys

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-02-14 09:30:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for classes
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(255) DEFAULT NULL,
  `major_name` varchar(255) DEFAULT NULL,
  `class_intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('154', '软件工程学院', '网络工程专业', '这是一个团结和谐的班集体');
INSERT INTO `classes` VALUES ('155', '软件工程学院', '软件工程', '软件工程');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '154', 'javaweb', '1', '第6周到第18周-周一上午34节');
INSERT INTO `course` VALUES ('2', '154', 'c++', '1', '第6周到第16周-周三上午34节');

-- ----------------------------
-- Table structure for designer
-- ----------------------------
DROP TABLE IF EXISTS `designer`;
CREATE TABLE `designer` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dname` varchar(255) DEFAULT NULL,
  `dphone` varchar(255) DEFAULT NULL,
  `demail` varchar(255) DEFAULT NULL,
  `dsex` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of designer
-- ----------------------------
INSERT INTO `designer` VALUES ('1', 'dd', 'dd', '张三', '1234567890', '123@qq.com', '1');
INSERT INTO `designer` VALUES ('2', 'des', 'des', '设计者', '12345678987', '123456@qq.com', '1');
INSERT INTO `designer` VALUES ('3', 'lisi', '123456', '李四', '13', '123', '1');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `hw_id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`hw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', '1', '实验一', '提交实验一的实验报告按流程来', '2018-05-16 17:12:00', '2018-04-02 17:12:09');
INSERT INTO `homework` VALUES ('2', '1', '实验二', '写一个jsp页面，提交压缩文件', '2018-04-18 17:12:05', '2018-04-02 17:12:12');
INSERT INTO `homework` VALUES ('3', '1', '实验三', '完成web网站的制作', '2018-04-30 10:40:33', '2018-04-11 10:40:49');

-- ----------------------------
-- Table structure for percent
-- ----------------------------
DROP TABLE IF EXISTS `percent`;
CREATE TABLE `percent` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `timecard_part` int(11) DEFAULT NULL,
  `homework_part` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of percent
-- ----------------------------
INSERT INTO `percent` VALUES ('1', '1', '10', '90');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `score_id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `timecard_part` int(11) DEFAULT NULL,
  `homework_part` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`score_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('4', '1', '1', '92', '90', 'A');
INSERT INTO `score` VALUES ('5', '1', '2', '74', '78', 'C');
INSERT INTO `score` VALUES ('6', '1', '3', '68', '66', 'D');
INSERT INTO `score` VALUES ('7', '1', '4', '88', '89', 'B');
INSERT INTO `score` VALUES ('8', '1', '5', '42', '45', 'E');

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(255) DEFAULT NULL,
  `skill_info` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `degree` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skill
-- ----------------------------
INSERT INTO `skill` VALUES ('1', '基础应用', '基础应用', '1', '278', '4');
INSERT INTO `skill` VALUES ('2', 'jsp的基础应用', 'jsp的基础应用', '1', '280', '4');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sname` varchar(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `classid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '2015081174', '123456', '陈洁', '17', '1', '154');
INSERT INTO `student` VALUES ('2', '2015081175', '123456', '何洁', '19', '1', '154');
INSERT INTO `student` VALUES ('3', '2015081179', '123456', '张杰', '20', '1', '154');
INSERT INTO `student` VALUES ('4', '2015081176', '123456', '李杰', '21', '1', '154');
INSERT INTO `student` VALUES ('5', '2015081180', '123456', '王杰', '22', '1', '154');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `hw_id` int(11) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '1', '1', 'D:\\MyEclipse\\workspace\\.metadata\\.me_tcat\\webapps\\CourseSystem\\WEB-INF\\upload\\1\\deaf331d-c9f4-4575-a2cf-63ccbbf1d425-1_uml.docx', '89', 'B');
INSERT INTO `task` VALUES ('2', '1', '2', 'D:\\MyEclipse\\workspace\\.metadata\\.me_tcat\\webapps\\CourseSystem\\WEB-INF\\upload\\2\\890132b0-0ad0-41b0-9607-c075943bbc5f_40037(1).JPG', '90', 'A');
INSERT INTO `task` VALUES ('3', '1', '3', 'D:\\MyEclipse\\workspace\\.metadata\\.me_tcat\\webapps\\CourseSystem\\WEB-INF\\upload\\3\\f0daa466-7639-40a2-949e-efe15c00c263_Chart.min.js', '88', 'B');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tphone` varchar(255) DEFAULT NULL,
  `temail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', 't001', '123456', '张震岳', '1', '12345678900', '123@qq.com');

-- ----------------------------
-- Table structure for timecard
-- ----------------------------
DROP TABLE IF EXISTS `timecard`;
CREATE TABLE `timecard` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `checkin` int(11) DEFAULT NULL,
  `checkout` int(11) DEFAULT NULL,
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timecard
-- ----------------------------
INSERT INTO `timecard` VALUES ('1', '1', '1', '5', '2');
INSERT INTO `timecard` VALUES ('2', '2', '1', '4', '3');
INSERT INTO `timecard` VALUES ('3', '3', '1', '6', '1');
INSERT INTO `timecard` VALUES ('4', '4', '1', '7', '0');
INSERT INTO `timecard` VALUES ('5', '5', '1', '3', '4');
