/*
Navicat MySQL Data Transfer

Source Server         : htc
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : bigevent

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2021-07-31 13:29:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ev_articles
-- ----------------------------
DROP TABLE IF EXISTS `ev_articles`;
CREATE TABLE `ev_articles` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `content` text COMMENT '文章内容',
  `cover_img` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `pub_date` date DEFAULT NULL COMMENT '发布时间',
  `state` varchar(255) DEFAULT NULL COMMENT '发布状态',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '数据是否被标记删除 \r\n0 没有被删除\r\n1 被删除',
  `cate_id` int(11) DEFAULT NULL COMMENT '文章分类id',
  `author_id` int(11) DEFAULT NULL COMMENT '作者id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ev_articles
-- ----------------------------
INSERT INTO `ev_articles` VALUES ('1', '1', '1', '\\uploads\\af5b3732ca9adb3c4e2ddb49b4b097ed', '2021-07-31', '发布', '0', '1', '6');

-- ----------------------------
-- Table structure for ev_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `ev_article_cate`;
CREATE TABLE `ev_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `alias` varchar(255) DEFAULT NULL COMMENT '分类别名',
  `is_delete` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '数据是否被标记删除\r\n0 没有被删除\r\n1 被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ev_article_cate
-- ----------------------------
INSERT INTO `ev_article_cate` VALUES ('1', '科技', 'KeJi', '0');
INSERT INTO `ev_article_cate` VALUES ('2', '历史', 'LiShi', '0');
INSERT INTO `ev_article_cate` VALUES ('3', '数学', 'ShuXue', '0');
INSERT INTO `ev_article_cate` VALUES ('4', '语文', 'YuWen', '0');
INSERT INTO `ev_article_cate` VALUES ('5', '英语', 'YingYu', '0');
INSERT INTO `ev_article_cate` VALUES ('6', '音乐', 'YinYue', '0');
INSERT INTO `ev_article_cate` VALUES ('7', 'Java', 'java', '0');
INSERT INTO `ev_article_cate` VALUES ('100', 'Java1', 'java1', '1');

-- ----------------------------
-- Table structure for ev_users
-- ----------------------------
DROP TABLE IF EXISTS `ev_users`;
CREATE TABLE `ev_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_pic` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ev_users
-- ----------------------------
INSERT INTO `ev_users` VALUES ('1', '123', '$2a$10$AkjwVLm92oci9zaWDIi32enjfk8SjUH7j55qoimc4wlNRdciIGUBq', '12', '199999999@qq.com', null);
INSERT INTO `ev_users` VALUES ('2', '1233', '$2a$10$AkjwVLm92oci9zaWDIi32enjfk8SjUH7j55qoimc4wlNRdciIGUBq', null, null, null);
INSERT INTO `ev_users` VALUES ('3', 'htc', '$2a$10$AkjwVLm92oci9zaWDIi32enjfk8SjUH7j55qoimc4wlNRdciIGUBq', null, null, null);
INSERT INTO `ev_users` VALUES ('4', 'htc1', '$2a$10$AkjwVLm92oci9zaWDIi32enjfk8SjUH7j55qoimc4wlNRdciIGUBq', null, null, null);
INSERT INTO `ev_users` VALUES ('5', 'htc12', '$2a$10$CE6xdOiKYigHzg/DNquKJuYX3K/y0dQ6WOkUYcCxHyzNdf81C3j66', null, null, null);
INSERT INTO `ev_users` VALUES ('6', 'htc396', '$2a$10$IID2pMglRdUtp90heCGe4.PICuLZmam4z4644oPSJhTpRutDke6oW', null, null, 'data:image/png;base64,VE9PTUFOWVNFQ1JFVFM=');
