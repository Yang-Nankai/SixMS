/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : ssmy7gse

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 02/07/2023 20:21:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'http://localhost:8080/ssmy7gse/upload/picture1.jpg');
INSERT INTO `config` VALUES (2, 'picture2', 'http://localhost:8080/ssmy7gse/upload/picture2.jpg');
INSERT INTO `config` VALUES (3, 'picture3', 'http://localhost:8080/ssmy7gse/upload/picture3.jpg');
INSERT INTO `config` VALUES (6, 'homepage', NULL);

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '试卷状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1614217521800 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (1614217309487, '2021-02-25 09:41:48', '测试', 60, 1);
INSERT INTO `exampaper` VALUES (1614217521799, '2021-02-25 09:45:21', '英语4级考试', 60, 1);

-- ----------------------------
-- Table structure for examquestion
-- ----------------------------
DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE `examquestion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题名称',
  `options` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项，json字符串',
  `score` bigint(20) NULL DEFAULT 0 COMMENT '分值',
  `answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案解析',
  `type` bigint(20) NULL DEFAULT 0 COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) NULL DEFAULT 100 COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1614217614582 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examquestion
-- ----------------------------
INSERT INTO `examquestion` VALUES (1614217323861, '2021-02-25 09:42:03', 1614217309487, '测试', '1', '[{\"text\":\"A.1\",\"code\":\"A\"}]', 1, 'A', '1', 0, 1);
INSERT INTO `examquestion` VALUES (1614217550428, '2021-02-25 09:45:49', 1614217521799, '英语4级考试', '1+1=？', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]', 10, 'B', '测试', 0, 1);
INSERT INTO `examquestion` VALUES (1614217578905, '2021-02-25 09:46:18', 1614217521799, '英语4级考试', '1+1=？', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]', 10, 'A,C', '测试', 1, 2);
INSERT INTO `examquestion` VALUES (1614217598138, '2021-02-25 09:46:37', 1614217521799, '英语4级考试', '1+1=3', '[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]', 10, 'B', '测试', 2, 3);
INSERT INTO `examquestion` VALUES (1614217614581, '2021-02-25 09:46:53', 1614217521799, '英语4级考试', '1+1=？', '[]', 10, '2', '测试', 3, 4);

-- ----------------------------
-- Table structure for examrecord
-- ----------------------------
DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE `examrecord`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题名称',
  `options` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项，json字符串',
  `score` bigint(20) NULL DEFAULT 0 COMMENT '分值',
  `answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT 0 COMMENT '试题得分',
  `myanswer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1685863180933 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examrecord
-- ----------------------------
INSERT INTO `examrecord` VALUES (1614217361672, '2021-02-25 09:42:41', 11, NULL, 1614217309487, '测试', 1614217323861, '1', '[{\"text\":\"A.1\",\"code\":\"A\"}]', 1, 'A', '1', 1, 'A');
INSERT INTO `examrecord` VALUES (1614217781467, '2021-02-25 09:49:41', 1614217469798, NULL, 1614217521799, '英语4级考试', 1614217550428, '1+1=？', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]', 10, 'B', '测试', 10, 'B');
INSERT INTO `examrecord` VALUES (1614217784903, '2021-02-25 09:49:44', 1614217469798, NULL, 1614217521799, '英语4级考试', 1614217578905, '1+1=？', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]', 10, 'A,C', '测试', 10, 'A,C');
INSERT INTO `examrecord` VALUES (1614217787910, '2021-02-25 09:49:47', 1614217469798, NULL, 1614217521799, '英语4级考试', 1614217598138, '1+1=3', '[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]', 10, 'B', '测试', 0, 'A');
INSERT INTO `examrecord` VALUES (1614217791126, '2021-02-25 09:49:50', 1614217469798, NULL, 1614217521799, '英语4级考试', 1614217614581, '1+1=？', '[]', 10, '2', '测试', 0, '3');
INSERT INTO `examrecord` VALUES (1685863180932, '2023-06-04 15:19:40', 1685813176915, NULL, 1614217521799, '英语4级考试', 1614217550428, '1+1=？', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]', 10, 'B', '测试', 0, '');
INSERT INTO `examrecord` VALUES (1688289512676, '2023-07-02 17:18:32', 1685813176915, NULL, 1614217309487, '测试', 1614217323861, '1', '[{\"text\":\"A.1\",\"code\":\"A\"}]', 1, 'A', '1', 1, 'A');

-- ----------------------------
-- Table structure for gonggaotongzhi
-- ----------------------------
DROP TABLE IF EXISTS `gonggaotongzhi`;
CREATE TABLE `gonggaotongzhi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `tongzhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知',
  `leixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `riqi` date NULL DEFAULT NULL COMMENT '日期',
  `neirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1614217720642 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gonggaotongzhi
-- ----------------------------
INSERT INTO `gonggaotongzhi` VALUES (31, '2021-02-25 09:40:06', '通知1', '系统通知', '2021-02-25', '内容1');
INSERT INTO `gonggaotongzhi` VALUES (32, '2021-02-25 09:40:06', '通知2', '系统通知', '2021-02-25', '内容2');
INSERT INTO `gonggaotongzhi` VALUES (33, '2021-02-25 09:40:06', '通知3', '系统通知', '2021-02-25', '内容3');
INSERT INTO `gonggaotongzhi` VALUES (34, '2021-02-25 09:40:06', '通知4', '系统通知', '2021-02-25', '内容4');
INSERT INTO `gonggaotongzhi` VALUES (35, '2021-02-25 09:40:06', '通知5', '系统通知', '2021-02-25', '内容5');
INSERT INTO `gonggaotongzhi` VALUES (36, '2021-02-25 09:40:06', '通知6', '系统通知', '2021-02-25', '内容6');
INSERT INTO `gonggaotongzhi` VALUES (1614217720641, '2021-02-25 09:48:40', '英语4级考试考试注意事项', '注意事项', '2021-02-25', '<p>编辑器测试</p><p>可传文字/图片<img src=\"http://localhost:8080/ssmy7gse/upload/1614217718286.jpg\"></p>');

-- ----------------------------
-- Table structure for kaoshengtongzhi
-- ----------------------------
DROP TABLE IF EXISTS `kaoshengtongzhi`;
CREATE TABLE `kaoshengtongzhi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `zhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `kemu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科目',
  `tongzhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知',
  `riqi` date NULL DEFAULT NULL COMMENT '日期',
  `xiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1614217735913 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考生通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kaoshengtongzhi
-- ----------------------------
INSERT INTO `kaoshengtongzhi` VALUES (41, '2021-02-25 09:40:06', '账号1', '姓名1', '科目1', '缺考', '2021-02-25', '详情1');
INSERT INTO `kaoshengtongzhi` VALUES (42, '2021-02-25 09:40:06', '账号2', '姓名2', '科目2', '缺考', '2021-02-25', '详情2');
INSERT INTO `kaoshengtongzhi` VALUES (43, '2021-02-25 09:40:06', '账号3', '姓名3', '科目3', '缺考', '2021-02-25', '详情3');
INSERT INTO `kaoshengtongzhi` VALUES (44, '2021-02-25 09:40:06', '账号4', '姓名4', '科目4', '缺考', '2021-02-25', '详情4');
INSERT INTO `kaoshengtongzhi` VALUES (45, '2021-02-25 09:40:06', '账号5', '姓名5', '科目5', '缺考', '2021-02-25', '详情5');
INSERT INTO `kaoshengtongzhi` VALUES (46, '2021-02-25 09:40:06', '账号6', '姓名6', '科目6', '缺考', '2021-02-25', '详情6');
INSERT INTO `kaoshengtongzhi` VALUES (1614217735912, '2021-02-25 09:48:54', '002', '李四', '英语4级考试', '取消资格', '2021-02-25', '<p>测试 </p>');

-- ----------------------------
-- Table structure for kaoshichengji
-- ----------------------------
DROP TABLE IF EXISTS `kaoshichengji`;
CREATE TABLE `kaoshichengji`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `zhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `kemu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科目',
  `chengji` int(11) NULL DEFAULT NULL COMMENT '成绩',
  `zhuangtai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `riqi` date NULL DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1614217668459 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试成绩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kaoshichengji
-- ----------------------------
INSERT INTO `kaoshichengji` VALUES (21, '2021-02-25 09:40:06', '账号1', '姓名1', '科目1', 1, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (22, '2021-02-25 09:40:06', '账号2', '姓名2', '科目2', 2, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (23, '2021-02-25 09:40:06', '账号3', '姓名3', '科目3', 3, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (24, '2021-02-25 09:40:06', '账号4', '姓名4', '科目4', 4, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (25, '2021-02-25 09:40:06', '账号5', '姓名5', '科目5', 5, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (26, '2021-02-25 09:40:06', '账号6', '姓名6', '科目6', 6, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (1614217641328, '2021-02-25 09:47:20', '002', '李四', '英语4级考试', 60, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (1614217655444, '2021-02-25 09:47:34', '002', '李四', '英语5级考试', 70, '及格', '2021-02-25');
INSERT INTO `kaoshichengji` VALUES (1614217668458, '2021-02-25 09:47:48', '002', '李四', '英语6级考试', 50, '不及格', '2021-02-25');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `zhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `nianling` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `dianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `youxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `zhaopian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '教师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, '2023-06-04 14:28:09', 'bbb', '123', '123', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '新增时间',
  `expiratedtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'abo', 'users', '管理员', 'd80d24fhn5hv9xqepjs8j4d5a47vs6yq', '2021-02-25 09:41:10', '2023-06-29 18:49:03');
INSERT INTO `token` VALUES (2, 11, '001', 'yonghu', '用户', '4wm78wdcm8ecgcbi15ne3c9nf5n4kdkr', '2021-02-25 09:42:28', '2021-02-25 10:42:29');
INSERT INTO `token` VALUES (3, 1614217469798, '002', 'yonghu', '用户', 'd6mygyu4ecyogsy2sg900vjd738d0oh9', '2021-02-25 09:44:35', '2021-02-25 10:49:09');
INSERT INTO `token` VALUES (4, 1685813176915, 'abc', 'yonghu', '用户', '7k5wpk0cn9byyehpasm0hecuhpqvxs6b', '2023-06-04 01:26:21', '2023-07-02 17:42:31');
INSERT INTO `token` VALUES (5, 1, 'bbb', 'Teacher', '用户', 'q2cdgilzxwq8ue6ybds1o936jh47ftza', '2023-06-04 14:48:37', '2023-07-02 18:18:55');
INSERT INTO `token` VALUES (6, 1, 'bbb', 'Teacher', '用户', 'v43auvl53xcbhpshtba7qo7h86f4y2db', '2023-06-04 14:48:37', '2023-06-04 15:48:38');
INSERT INTO `token` VALUES (7, 1685859186660, '123', 'yonghu', '用户', 'g9wev3wxuiezoe3mmn1vtd4tle084j43', '2023-06-04 15:36:30', '2023-06-04 16:47:42');

-- ----------------------------
-- Table structure for userexam
-- ----------------------------
DROP TABLE IF EXISTS `userexam`;
CREATE TABLE `userexam`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `cost` decimal(10, 2) NOT NULL COMMENT '考试费用',
  `signup` tinyint(1) NOT NULL COMMENT '是否报名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '学生报名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userexam
-- ----------------------------
INSERT INTO `userexam` VALUES (1688285926531, '2023-07-02 16:18:47', 123, ' ', 123, ' ', 0.00, 1);
INSERT INTO `userexam` VALUES (1688288155585, '2023-07-02 16:55:56', 1685813176915, ' ', 1614217309487, ' ', 0.00, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'abo', 'abo', '管理员', '2021-02-25 09:40:06');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `zhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `nianling` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `dianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `youxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `zhaopian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `zhanghao`(`zhanghao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1685860416470 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (1685813176915, '2023-06-04 01:26:16', 'abc', '123', '123', NULL, 123, '', '', '', 'http://localhost:8080/ssmy7gse/upload/1685884169741.png');
INSERT INTO `yonghu` VALUES (1685859186660, '2023-06-04 14:13:06', '123', '123', '王老四', '', NULL, '', '', '', '');
INSERT INTO `yonghu` VALUES (1685860059408, '2023-06-04 14:27:39', 'aaa', 'abc', '123', '', NULL, '', '', '', '');
INSERT INTO `yonghu` VALUES (1685860128447, '2023-06-04 14:28:48', 'ccc', 'ccc', '13123', '', NULL, '', '', '', '');
INSERT INTO `yonghu` VALUES (1685860416469, '2023-06-04 14:34:15', 'ddd', 'ddd', 'ddd', '', NULL, '', '', '', '');

SET FOREIGN_KEY_CHECKS = 1;
