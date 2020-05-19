/*
 Navicat Premium Data Transfer

 Source Server         : 182.92.103.85
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 182.92.103.85:3306
 Source Schema         : weixue

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 18/05/2020 19:25:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '$2a$10$F2BH5.EoqlfGJhwsTATuvewgpAfmQZbQfbeHmUzn/0hBe0MId299u', '13333333333', '12345678999@qq.com', '1');
INSERT INTO `admin` VALUES (2, 'user', '$2a$10$m7CaQMUha/.A.N0rnzRxF.4vQad8DCaWoLPYWbZjHduLGP4UIOpI.', '13333333333', '13333333333@qq.com', '1');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `adminId` int(0) NOT NULL,
  `roleId` int(0) NOT NULL,
  PRIMARY KEY (`adminId`, `roleId`) USING BTREE,
  INDEX `rid`(`roleId`) USING BTREE,
  CONSTRAINT `aid` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rid` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 1);
INSERT INTO `admin_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  `courseId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid_collect`(`userId`) USING BTREE,
  INDEX `cid_collect`(`courseId`) USING BTREE,
  CONSTRAINT `cid_collect` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `uid_collect` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 'Java', 'ArrayList集合-对象数组', '/upload/3/course/image/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.qeUnHI7s2dAzba757a3a37a92611354b6aa794e31382.jpg', '/upload/3/course/video/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.Z9djYqPtIYnr0e3c718872d41f2358924ab4063d1573.mp4', 2, 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publishedTime` datetime(0) NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  `courseId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid_com`(`userId`) USING BTREE,
  INDEX `courseid`(`courseId`) USING BTREE,
  CONSTRAINT `courseid` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `uid_com` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '123456', '2020-04-04 00:00:00', 2, 1);
INSERT INTO `comment` VALUES (2, '234567', '2020-04-04 00:00:00', 2, 1);
INSERT INTO `comment` VALUES (3, '666', '2020-05-17 00:00:00', 2, 1);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videoUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid_course`(`userId`) USING BTREE,
  CONSTRAINT `uid_course` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Java', 'ArrayList集合-对象数组', '/upload/3/course/image/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.qeUnHI7s2dAzba757a3a37a92611354b6aa794e31382.jpg', '/upload/3/course/video/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.Z9djYqPtIYnr0e3c718872d41f2358924ab4063d1573.mp4', 3);
INSERT INTO `course` VALUES (2, 'Java', 'Scanner类-使用步骤', '/upload/3/course/image/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.DrIhHJiWK8kYba757a3a37a92611354b6aa794e31382.jpg', '/upload/3/course/video/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.gNrdSUGGhoSv9acbc376ef1f7e6b7212e8e9a2ed4d14.mp4', 3);
INSERT INTO `course` VALUES (3, 'Java', '匿名对象-作为方法的参数', '/upload/3/course/image/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.RrklZ0TbFVtcba757a3a37a92611354b6aa794e31382.jpg', '/upload/3/course/video/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.G6gEM7XvvnGq572cb617a64191d1762c12efb4c30550.mp4', 3);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADMIN', 'supervip');
INSERT INTO `role` VALUES (2, 'USER', 'vip');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visitTime` datetime(0) NULL DEFAULT NULL,
  `executionTime` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (1, 'jyh', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:07:08', 42);
INSERT INTO `syslog` VALUES (2, 'jyh', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:16:09', 46);
INSERT INTO `syslog` VALUES (3, 'jyh', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:18:16', 19);
INSERT INTO `syslog` VALUES (4, 'jyh', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:19:10', 44);
INSERT INTO `syslog` VALUES (5, 'jyh', '0:0:0:0:0:0:0:1', '/admin/save.do', '[类名] com.jyh.controller.AdminController[方法名] save', '2020-03-18 21:21:06', 400);
INSERT INTO `syslog` VALUES (6, 'jyh', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:22:26', 42);
INSERT INTO `syslog` VALUES (7, 'jyh', '0:0:0:0:0:0:0:1', '/admin/save.do', '[类名] com.jyh.controller.AdminController[方法名] save', '2020-03-18 21:22:47', 313);
INSERT INTO `syslog` VALUES (8, 'jyh', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:27:52', 44);
INSERT INTO `syslog` VALUES (9, 'jyh', '0:0:0:0:0:0:0:1', '/admin/save.do', '[类名] com.jyh.controller.AdminController[方法名] save', '2020-03-18 21:28:16', 363);
INSERT INTO `syslog` VALUES (10, 'jyh', '0:0:0:0:0:0:0:1', '/admin/save.do', '[类名] com.jyh.controller.AdminController[方法名] save', '2020-03-18 21:30:56', 153);
INSERT INTO `syslog` VALUES (11, 'jyh', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:30:56', 13);
INSERT INTO `syslog` VALUES (12, 'admin', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:35:50', 41);
INSERT INTO `syslog` VALUES (13, 'admin', '0:0:0:0:0:0:0:1', '/admin/save.do', '[类名] com.jyh.controller.AdminController[方法名] save', '2020-03-18 21:36:42', 222);
INSERT INTO `syslog` VALUES (14, 'admin', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:36:43', 15);
INSERT INTO `syslog` VALUES (15, 'admin', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:37:50', 18);
INSERT INTO `syslog` VALUES (16, 'admin', '0:0:0:0:0:0:0:1', '/admin/findById.do', '[类名] com.jyh.controller.AdminController[方法名] findById', '2020-03-18 21:37:54', 14);
INSERT INTO `syslog` VALUES (17, 'admin', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:38:04', 14);
INSERT INTO `syslog` VALUES (18, 'admin', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:38:09', 9);
INSERT INTO `syslog` VALUES (19, 'admin', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:39:12', 9);
INSERT INTO `syslog` VALUES (20, 'admin', '0:0:0:0:0:0:0:1', '/admin/findAll.do', '[类名] com.jyh.controller.AdminController[方法名] findAll', '2020-03-18 21:39:16', 12);

-- ----------------------------
-- Table structure for u_c
-- ----------------------------
DROP TABLE IF EXISTS `u_c`;
CREATE TABLE `u_c`  (
  `userId` int(0) NOT NULL,
  `courseId` int(0) NOT NULL,
  PRIMARY KEY (`userId`, `courseId`) USING BTREE,
  INDEX `cid_uc`(`courseId`) USING BTREE,
  CONSTRAINT `cid_uc` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `uid_uc` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_c
-- ----------------------------
INSERT INTO `u_c` VALUES (4, 1);
INSERT INTO `u_c` VALUES (2, 2);
INSERT INTO `u_c` VALUES (2, 3);

-- ----------------------------
-- Table structure for u_u
-- ----------------------------
DROP TABLE IF EXISTS `u_u`;
CREATE TABLE `u_u`  (
  `userId_s` int(0) NOT NULL,
  `userId_t` int(0) NOT NULL,
  PRIMARY KEY (`userId_s`, `userId_t`) USING BTREE,
  INDEX `userId_t`(`userId_t`) USING BTREE,
  CONSTRAINT `userId_s` FOREIGN KEY (`userId_s`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userId_t` FOREIGN KEY (`userId_t`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_u
-- ----------------------------
INSERT INTO `u_u` VALUES (2, 3);
INSERT INTO `u_u` VALUES (4, 3);
INSERT INTO `u_u` VALUES (4, 7);
INSERT INTO `u_u` VALUES (5, 7);
INSERT INTO `u_u` VALUES (6, 7);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profession` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `specialty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `elucidation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, NULL, 'admin', '123456', '20161111', '管理员', '男', '1333333333', NULL, '管理员', NULL, NULL, NULL, '1347869060@qq.com', '我是tuo');
INSERT INTO `user` VALUES (2, '/upload/2/face/wxb5f4f932ad6c352f.o6zAJs8jz789moRGVcSCTYNxrtvk.xeXb3cxoSu3jba757a3a37a92611354b6aa794e31382.jpg', 'jyh', '123456', '201606571124', '蒋银航', '男', '1333333333', '大数据与智能工程学院', '学生', '2016级', '计算机科学与技术', NULL, '1347869060@qq.com', '我是学生');
INSERT INTO `user` VALUES (3, '', 'jls', '123456', '20161112', '蒋老师', '男', '1333333334', '大数据与智能工程学院', '教师', NULL, NULL, '计算机基础', '1347869060@qq.com', '我是教师');
INSERT INTO `user` VALUES (4, NULL, 'yx', '123456', '201606571112', '杨鑫', '男', '1333333333', '大数据与智能工程学院', '学生', '2016级', '计算机科学与技术', NULL, '1347869060@qq.com', '我是学生');
INSERT INTO `user` VALUES (5, NULL, 'lkm', '123456', '201606571121', '李科明', '男', '1333333333', '大数据与智能工程学院', '学生', '2016级', '计算机科学与技术', '', '1347869060@qq.com', '我是学生');
INSERT INTO `user` VALUES (6, NULL, 'yhb', '123456', '201606571118', '杨浩彬', '男', '1333333333', '大数据与智能工程学院', '学生', '2016级', '计算机科学与技术', '', '1347869060@qq.com', '我是学生');
INSERT INTO `user` VALUES (7, NULL, 'yls', '123456', '20161113', '杨老师', '男', '1333333333', '大数据与智能工程学院', '教师', '', '', 'Java', '1347869060@qq.com', '我是教师');
INSERT INTO `user` VALUES (8, NULL, 'ty', '123456', '201606571118', '田勇', '男', '13333333333', '大数据与智能工程学院', '学生', '2016级', '计算机科学与技术', NULL, '1347869060@qq.com', '我是学生');

SET FOREIGN_KEY_CHECKS = 1;
