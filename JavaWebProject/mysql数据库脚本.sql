-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(20)  NOT NULL COMMENT 'user_name',
  `password` varchar(20)  NULL COMMENT '����',
  `realName` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthday` varchar(20)  NULL COMMENT '��������',
  `cardNumber` varchar(20)  NOT NULL COMMENT '���֤',
  `city` varchar(20)  NULL COMMENT '����',
  `photo` varchar(60)  NOT NULL COMMENT '��Ƭ',
  `address` varchar(50)  NULL COMMENT '��ͥ��ַ',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_busStation` (
  `stationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `stationName` varchar(20)  NOT NULL COMMENT 'վ������',
  `longitude` float NOT NULL COMMENT '����',
  `latitude` float NOT NULL COMMENT 'γ��',
  PRIMARY KEY (`stationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_busLine` (
  `lineId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `name` varchar(40)  NOT NULL COMMENT '��·����',
  `startStation` int(11) NOT NULL COMMENT '���վ',
  `endStation` int(11) NOT NULL COMMENT '�յ�վ',
  `startTime` varchar(20)  NOT NULL COMMENT '�װ೵ʱ��',
  `endTime` varchar(20)  NOT NULL COMMENT 'ĩ�೵ʱ��',
  `company` varchar(60)  NOT NULL COMMENT '������˾',
  `tjzd` varchar(500)  NOT NULL COMMENT ';��վ��',
  `polylinePoints` varchar(200)  NOT NULL COMMENT '��ͼ��·����',
  PRIMARY KEY (`lineId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_stationToStation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `startStation` int(11) NOT NULL COMMENT '��ʼվ',
  `endStation` int(11) NOT NULL COMMENT '�յ�վ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_guestBook` (
  `guestBookId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `title` varchar(40)  NOT NULL COMMENT '���Ա���',
  `content` varchar(200)  NOT NULL COMMENT '��������',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `addTime` varchar(20)  NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`guestBookId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_newsInfo` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `newsTitle` varchar(20)  NOT NULL COMMENT '����',
  `newsContent` varchar(200)  NOT NULL COMMENT '��������',
  `newsDate` varchar(20)  NULL COMMENT '��������',
  PRIMARY KEY (`newsId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_busLine ADD CONSTRAINT FOREIGN KEY (startStation) REFERENCES t_busStation(stationId);
ALTER TABLE t_busLine ADD CONSTRAINT FOREIGN KEY (endStation) REFERENCES t_busStation(stationId);
ALTER TABLE t_stationToStation ADD CONSTRAINT FOREIGN KEY (startStation) REFERENCES t_busStation(stationId);
ALTER TABLE t_stationToStation ADD CONSTRAINT FOREIGN KEY (endStation) REFERENCES t_busStation(stationId);
ALTER TABLE t_guestBook ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


