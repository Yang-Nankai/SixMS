-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ssmy7gse
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','http://localhost:8080/ssmy7gse/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssmy7gse/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssmy7gse/upload/picture3.jpg'),(6,'homepage',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614217521800 DEFAULT CHARSET=utf8 COMMENT='试卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1614217309487,'2021-02-25 01:41:48','测试',60,1),(1614217521799,'2021-02-25 01:45:21','英语4级考试',60,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614217614582 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1614217323861,'2021-02-25 01:42:03',1614217309487,'测试','1','[{\"text\":\"A.1\",\"code\":\"A\"}]',1,'A','1',0,1),(1614217550428,'2021-02-25 01:45:49',1614217521799,'英语4级考试','1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',10,'B','测试',0,1),(1614217578905,'2021-02-25 01:46:18',1614217521799,'英语4级考试','1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',10,'A,C','测试',1,2),(1614217598138,'2021-02-25 01:46:37',1614217521799,'英语4级考试','1+1=3','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',10,'B','测试',2,3),(1614217614581,'2021-02-25 01:46:53',1614217521799,'英语4级考试','1+1=？','[]',10,'2','测试',3,4);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614217791127 DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1614217339360,'2021-02-25 01:42:18',1,NULL,1614217309487,'测试',1614217323861,'1','[{\"text\":\"A.1\",\"code\":\"A\"}]',1,'A','1',1,'A'),(1614217361672,'2021-02-25 01:42:41',11,NULL,1614217309487,'测试',1614217323861,'1','[{\"text\":\"A.1\",\"code\":\"A\"}]',1,'A','1',1,'A'),(1614217781467,'2021-02-25 01:49:41',1614217469798,NULL,1614217521799,'英语4级考试',1614217550428,'1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',10,'B','测试',10,'B'),(1614217784903,'2021-02-25 01:49:44',1614217469798,NULL,1614217521799,'英语4级考试',1614217578905,'1+1=？','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"},{\"text\":\"D.4\",\"code\":\"D\"}]',10,'A,C','测试',10,'A,C'),(1614217787910,'2021-02-25 01:49:47',1614217469798,NULL,1614217521799,'英语4级考试',1614217598138,'1+1=3','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',10,'B','测试',0,'A'),(1614217791126,'2021-02-25 01:49:50',1614217469798,NULL,1614217521799,'英语4级考试',1614217614581,'1+1=？','[]',10,'2','测试',0,'3');
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gonggaotongzhi`
--

DROP TABLE IF EXISTS `gonggaotongzhi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gonggaotongzhi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tongzhi` varchar(200) DEFAULT NULL COMMENT '通知',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `neirong` longtext COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614217720642 DEFAULT CHARSET=utf8 COMMENT='公告通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gonggaotongzhi`
--

LOCK TABLES `gonggaotongzhi` WRITE;
/*!40000 ALTER TABLE `gonggaotongzhi` DISABLE KEYS */;
INSERT INTO `gonggaotongzhi` VALUES (31,'2021-02-25 01:40:06','通知1','系统通知','2021-02-25','内容1'),(32,'2021-02-25 01:40:06','通知2','系统通知','2021-02-25','内容2'),(33,'2021-02-25 01:40:06','通知3','系统通知','2021-02-25','内容3'),(34,'2021-02-25 01:40:06','通知4','系统通知','2021-02-25','内容4'),(35,'2021-02-25 01:40:06','通知5','系统通知','2021-02-25','内容5'),(36,'2021-02-25 01:40:06','通知6','系统通知','2021-02-25','内容6'),(1614217720641,'2021-02-25 01:48:40','英语4级考试考试注意事项','注意事项','2021-02-25','<p>编辑器测试</p><p>可传文字/图片<img src=\"http://localhost:8080/ssmy7gse/upload/1614217718286.jpg\"></p>');
/*!40000 ALTER TABLE `gonggaotongzhi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaoshengtongzhi`
--

DROP TABLE IF EXISTS `kaoshengtongzhi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaoshengtongzhi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `tongzhi` varchar(200) DEFAULT NULL COMMENT '通知',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `xiangqing` longtext COMMENT '详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614217735913 DEFAULT CHARSET=utf8 COMMENT='考生通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaoshengtongzhi`
--

LOCK TABLES `kaoshengtongzhi` WRITE;
/*!40000 ALTER TABLE `kaoshengtongzhi` DISABLE KEYS */;
INSERT INTO `kaoshengtongzhi` VALUES (41,'2021-02-25 01:40:06','账号1','姓名1','科目1','缺考','2021-02-25','详情1'),(42,'2021-02-25 01:40:06','账号2','姓名2','科目2','缺考','2021-02-25','详情2'),(43,'2021-02-25 01:40:06','账号3','姓名3','科目3','缺考','2021-02-25','详情3'),(44,'2021-02-25 01:40:06','账号4','姓名4','科目4','缺考','2021-02-25','详情4'),(45,'2021-02-25 01:40:06','账号5','姓名5','科目5','缺考','2021-02-25','详情5'),(46,'2021-02-25 01:40:06','账号6','姓名6','科目6','缺考','2021-02-25','详情6'),(1614217735912,'2021-02-25 01:48:54','002','李四','英语4级考试','取消资格','2021-02-25','<p>测试 </p>');
/*!40000 ALTER TABLE `kaoshengtongzhi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaoshichengji`
--

DROP TABLE IF EXISTS `kaoshichengji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaoshichengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `kemu` varchar(200) DEFAULT NULL COMMENT '科目',
  `chengji` int(11) DEFAULT NULL COMMENT '成绩',
  `zhuangtai` varchar(200) DEFAULT NULL COMMENT '状态',
  `riqi` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1614217668459 DEFAULT CHARSET=utf8 COMMENT='考试成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaoshichengji`
--

LOCK TABLES `kaoshichengji` WRITE;
/*!40000 ALTER TABLE `kaoshichengji` DISABLE KEYS */;
INSERT INTO `kaoshichengji` VALUES (21,'2021-02-25 01:40:06','账号1','姓名1','科目1',1,'及格','2021-02-25'),(22,'2021-02-25 01:40:06','账号2','姓名2','科目2',2,'及格','2021-02-25'),(23,'2021-02-25 01:40:06','账号3','姓名3','科目3',3,'及格','2021-02-25'),(24,'2021-02-25 01:40:06','账号4','姓名4','科目4',4,'及格','2021-02-25'),(25,'2021-02-25 01:40:06','账号5','姓名5','科目5',5,'及格','2021-02-25'),(26,'2021-02-25 01:40:06','账号6','姓名6','科目6',6,'及格','2021-02-25'),(1614217641328,'2021-02-25 01:47:20','002','李四','英语4级考试',60,'及格','2021-02-25'),(1614217655444,'2021-02-25 01:47:34','002','李四','英语5级考试',70,'及格','2021-02-25'),(1614217668458,'2021-02-25 01:47:48','002','李四','英语6级考试',50,'不及格','2021-02-25');
/*!40000 ALTER TABLE `kaoshichengji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'abo','users','管理员','vtc8r7kieujqio2jiyawexcw6hc0c7lg','2021-02-25 01:41:10','2021-02-25 02:44:52'),(2,11,'001','yonghu','用户','4wm78wdcm8ecgcbi15ne3c9nf5n4kdkr','2021-02-25 01:42:28','2021-02-25 02:42:29'),(3,1614217469798,'002','yonghu','用户','d6mygyu4ecyogsy2sg900vjd738d0oh9','2021-02-25 01:44:35','2021-02-25 02:49:09');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-02-25 01:40:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `nianling` int(11) DEFAULT NULL COMMENT '年龄',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1614217469799 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2021-02-25 01:40:06','001','001','张三','男',1,'13823888881','773890001@qq.com','440300199101010001','http://localhost:8080/ssmy7gse/upload/yonghu_zhaopian1.jpg'),(12,'2021-02-25 01:40:06','用户2','123456','姓名2','男',2,'13823888882','773890002@qq.com','440300199202020002','http://localhost:8080/ssmy7gse/upload/yonghu_zhaopian2.jpg'),(13,'2021-02-25 01:40:06','用户3','123456','姓名3','男',3,'13823888883','773890003@qq.com','440300199303030003','http://localhost:8080/ssmy7gse/upload/yonghu_zhaopian3.jpg'),(14,'2021-02-25 01:40:06','用户4','123456','姓名4','男',4,'13823888884','773890004@qq.com','440300199404040004','http://localhost:8080/ssmy7gse/upload/yonghu_zhaopian4.jpg'),(15,'2021-02-25 01:40:06','用户5','123456','姓名5','男',5,'13823888885','773890005@qq.com','440300199505050005','http://localhost:8080/ssmy7gse/upload/yonghu_zhaopian5.jpg'),(16,'2021-02-25 01:40:06','用户6','123456','姓名6','男',6,'13823888886','773890006@qq.com','440300199606060006','http://localhost:8080/ssmy7gse/upload/yonghu_zhaopian6.jpg'),(1614217469798,'2021-02-25 01:44:29','002','001','李四','男',23,'13800000000','123@qq.com','441400000000000000','http://localhost:8080/ssmy7gse/upload/1614217483528.png');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-26 16:25:33
