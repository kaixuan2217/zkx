/*
 Navicat Premium Data Transfer

 Source Server         : 1909e
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 12/08/2020 17:13:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `attachmentId` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `attachmentName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `attachmentPath` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `attachmentTime` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`attachmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES (1, '手动备份20171129142347.xls', 'logs/backup', '2017-11-29 14:23:47');
INSERT INTO `attachment` VALUES (2, '手动备份20171129142641.xls', 'logs/backup', '2017-11-29 14:26:41');
INSERT INTO `attachment` VALUES (3, '手动备份20171129142920.xls', 'logs/backup', '2017-11-29 14:29:20');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `contentId` int(11) NOT NULL AUTO_INCREMENT,
  `contentCategoryId` int(11) NULL DEFAULT NULL,
  `contenttitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contenturl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contentId`) USING BTREE,
  INDEX `wj222`(`contentCategoryId`) USING BTREE,
  CONSTRAINT `wj222` FOREIGN KEY (`contentCategoryId`) REFERENCES `contentcategory` (`contentCategoryId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (2, 2, '销量冠军', 'www.jiyun.cn', '1.jpg', 500.00, '2020-08-12 14:35:18', '启用');
INSERT INTO `content` VALUES (4, 1, '未来之星', 'www.jiyun.cn', '66.jpg', 600.00, '2020-08-12 14:43:49', '禁用');
INSERT INTO `content` VALUES (6, 1, '啥也不是', 'www.ccc.com', '33.jpg', 4444.00, '2020-08-12 16:56:37', '启用');
INSERT INTO `content` VALUES (7, 1, '333', '333', '333', 333.00, '2020-08-12 17:02:07', '启用');
INSERT INTO `content` VALUES (8, 2, '3331', '3331', '3331', 3331.00, '2020-08-12 17:02:18', '启用');
INSERT INTO `content` VALUES (9, 3, '333', '333.com', 'asd.jpg', 113.00, '2020-08-12 17:03:58', '启用');

-- ----------------------------
-- Table structure for contentcategory
-- ----------------------------
DROP TABLE IF EXISTS `contentcategory`;
CREATE TABLE `contentcategory`  (
  `contentCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`contentCategoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contentcategory
-- ----------------------------
INSERT INTO `contentcategory` VALUES (1, '产品广告', '启用', '2020-08-12 14:32:31');
INSERT INTO `contentcategory` VALUES (2, '品牌广告', '禁用', '2020-08-12 14:32:48');
INSERT INTO `contentcategory` VALUES (3, '公益广告', '启用', '2020-08-12 14:33:01');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wj_34`(`typeid`) USING BTREE,
  CONSTRAINT `wj_34` FOREIGN KEY (`typeid`) REFERENCES `goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 1, '0001', '联想电脑', 4000.00, '上架', '2020-08-19 17:06:28');
INSERT INTO `goods` VALUES (2, 2, '0002', '卫衣', 500.00, '上架', '2020-08-03 17:08:37');
INSERT INTO `goods` VALUES (3, 3, '0003', '嘎啦果', 8000.00, '下架', '2020-08-24 17:09:22');
INSERT INTO `goods` VALUES (4, 2, '0004', 'nike帽衫', 699.00, '下架', '2020-08-12 10:27:11');

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES (1, '电子产品', '启用', '2020-07-28 17:04:24');
INSERT INTO `goodstype` VALUES (2, '服装鞋帽', '启用', '2020-08-05 17:04:59');
INSERT INTO `goodstype` VALUES (3, '水果蔬菜', '启用', '2020-01-29 17:05:12');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志',
  `userName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `createTime` datetime NULL DEFAULT NULL COMMENT '时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细',
  `operation` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型（增删改）',
  `ip` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `module` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属模块',
  PRIMARY KEY (`logId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 'test', '2017-11-29 14:31:04', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (2, 'test', '2017-11-29 14:31:14', NULL, '登录', '192.168.1.17', NULL);
INSERT INTO `log` VALUES (3, 'admin', '2020-07-29 09:43:34', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (4, 'admin', '2020-07-29 10:42:21', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (5, 'admin', '2020-07-29 14:02:58', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (6, 'admin', '2020-07-29 14:27:12', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (7, 'admin', '2020-07-29 14:27:18', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (8, 'admin', '2020-07-29 15:00:14', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (9, 'admin', '2020-07-30 08:19:54', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (10, 'admin', '2020-07-30 09:04:19', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (11, 'admin', '2020-07-30 09:06:30', 'intercept the method: com.xiaoshu.controller.StuController.sturListnested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'role\' in \'class com.xiaoshu.entity.Stu\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (12, 'admin', '2020-07-30 09:08:08', 'intercept the method: com.xiaoshu.controller.StuController.sturListnested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'role\' in \'class com.xiaoshu.entity.Stu\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (13, 'admin', '2020-07-30 09:16:50', 'intercept the method: com.xiaoshu.controller.StuController.sturList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StuMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StuMapper.queryAllStu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,m.* from tb_stu_day s,tb_major_day m      WHERE s.mid=m.md_id             and start <= ?) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (14, 'admin', '2020-07-30 09:16:53', 'intercept the method: com.xiaoshu.controller.StuController.sturList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StuMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StuMapper.queryAllStu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,m.* from tb_stu_day s,tb_major_day m      WHERE s.mid=m.md_id             and start <= ?) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (15, 'admin', '2020-07-30 09:27:58', 'intercept the method: com.xiaoshu.controller.StuController.sturList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StuMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StuMapper.queryAllStu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,m.* from tb_stu_day s,tb_major_day m      WHERE s.mid=m.md_id             and start <= ?) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (16, 'admin', '2020-07-30 09:28:10', 'intercept the method: com.xiaoshu.controller.StuController.sturList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StuMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StuMapper.queryAllStu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,m.* from tb_stu_day s,tb_major_day m      WHERE s.mid=m.md_id             and start <= ?) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (17, 'admin', '2020-07-30 09:28:11', 'intercept the method: com.xiaoshu.controller.StuController.sturList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StuMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StuMapper.queryAllStu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,m.* from tb_stu_day s,tb_major_day m      WHERE s.mid=m.md_id             and start <= ?) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (18, 'admin', '2020-07-30 09:28:19', 'intercept the method: com.xiaoshu.controller.StuController.sturList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StuMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StuMapper.queryAllStu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,m.* from tb_stu_day s,tb_major_day m      WHERE s.mid=m.md_id             and start <= ?) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (19, 'admin', '2020-07-30 09:32:01', 'intercept the method: com.xiaoshu.controller.StuController.sturList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\StuMapper.xml]\r\n### The error may involve com.xiaoshu.dao.StuMapper.queryAllStu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (select s.*,m.* from tb_stu_day s,tb_major_day m      WHERE s.mid=m.md_id             and start <= ?) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'start\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (20, 'admin', '2020-07-30 09:47:24', 'intercept the method: com.xiaoshu.controller.StuController.indexInvalid bound statement (not found): com.xiaoshu.dao.StuMapper.queryAllMajor', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (21, 'admin', '2020-07-30 09:59:34', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (22, 'admin', '2020-07-30 09:59:39', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (23, 'admin', '2020-07-30 10:02:31', 'intercept the method: com.xiaoshu.controller.StuController.indexInvalid bound statement (not found): com.xiaoshu.dao.StuMapper.queryAllMajor', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (24, 'admin', '2020-07-30 10:02:44', 'intercept the method: com.xiaoshu.controller.StuController.indexInvalid bound statement (not found): com.xiaoshu.dao.StuMapper.queryAllMajor', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (25, 'admin', '2020-07-30 10:06:05', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (26, 'admin', '2020-07-30 10:06:10', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (27, 'admin', '2020-07-30 10:31:30', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (28, 'admin', '2020-07-30 10:31:34', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (29, 'admin', '2020-07-30 13:52:16', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (30, 'admin', '2020-07-30 14:27:25', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (31, 'admin', '2020-07-30 14:27:34', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (32, 'admin', '2020-08-02 20:36:16', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (33, 'admin', '2020-08-11 17:36:41', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (34, 'admin', '2020-08-11 18:34:20', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (35, 'admin', '2020-08-11 18:44:08', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (36, 'admin', '2020-08-11 18:44:45', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (37, 'admin', '2020-08-11 18:45:08', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (38, 'admin', '2020-08-11 18:48:40', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (39, 'admin', '2020-08-11 18:55:33', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (40, 'admin', '2020-08-11 18:55:41', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (41, 'admin', '2020-08-11 18:57:22', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (42, 'admin', '2020-08-11 19:12:26', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (43, 'admin', '2020-08-11 19:12:32', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (44, 'admin', '2020-08-11 19:29:32', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (45, 'admin', '2020-08-11 19:32:06', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (46, 'admin', '2020-08-11 19:35:05', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (47, 'admin', '2020-08-11 19:38:03', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (48, 'admin', '2020-08-11 19:39:27', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (49, 'admin', '2020-08-11 19:39:30', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (50, 'admin', '2020-08-11 19:40:15', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (51, 'admin', '2020-08-11 19:40:55', 'intercept the method: com.xiaoshu.controller.GoodsController.index\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\r\n### The error may exist in com/xiaoshu/dao/GoodsTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT id,typename,status,createtime  FROM goods_type\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'ssm.goods_type\' doesn\'t exist', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (52, 'admin', '2020-08-11 22:51:18', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (53, 'admin', '2020-08-12 10:20:55', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (54, 'admin', '2020-08-12 10:24:09', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (55, 'admin', '2020-08-12 10:24:14', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (56, 'admin', '2020-08-12 10:30:12', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (57, 'admin', '2020-08-12 10:30:21', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (58, 'admin', '2020-08-12 13:57:34', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (59, 'admin', '2020-08-12 15:07:09', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (60, 'admin', '2020-08-12 15:07:52', 'intercept the method: com.xiaoshu.controller.ContentController.contentListInvalid bound statement (not found): com.xiaoshu.dao.ContentMapper.findPage', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (61, 'admin', '2020-08-12 15:24:51', 'intercept the method: com.xiaoshu.controller.ContentController.contentList\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'t.contenttitle\' in \'where clause\'\r\n### The error may exist in file [E:\\java\\xsx\\test3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ssm\\WEB-INF\\classes\\mapper\\ContentMapper.xml]\r\n### The error may involve com.xiaoshu.dao.ContentMapper.findPage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM content c, contentcategory t WHERE c.contentCategoryId = t.contentCategoryId AND t.contenttitle LIKE \'%{contenttitle}\'\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'t.contenttitle\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'t.contenttitle\' in \'where clause\'', '拦截到异常', '0:0:0:0:0:0:0:1', '/ssm');
INSERT INTO `log` VALUES (62, 'admin', '2020-08-12 15:57:51', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (63, 'admin', '2020-08-12 15:57:56', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (64, 'admin', '2020-08-12 16:17:23', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (65, 'admin', '2020-08-12 16:17:37', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (66, 'admin', '2020-08-12 16:42:24', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (67, 'admin', '2020-08-12 16:42:29', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);
INSERT INTO `log` VALUES (68, 'admin', '2020-08-12 16:53:22', NULL, '退出', NULL, NULL);
INSERT INTO `log` VALUES (69, 'admin', '2020-08-12 16:53:27', NULL, '登录', '0:0:0:0:0:0:0:1', NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuId` int(10) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `menuUrl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法',
  `parentId` int(11) NULL DEFAULT NULL COMMENT '父ID',
  `menuDescription` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态/OPEN/CLOSED',
  `iconCls` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `seq` int(11) NULL DEFAULT NULL COMMENT '顺序排序',
  PRIMARY KEY (`menuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'SSM系统', '', -1, '主菜单', 'isParent', 'fa fa-university', 1);
INSERT INTO `menu` VALUES (2, '系统管理', '', 1, '', 'isParent', 'fa fa-desktop', 1);
INSERT INTO `menu` VALUES (3, '修改密码', 'javascript:editPassword();//', 1, '', 'close', 'fa fa-key', 4);
INSERT INTO `menu` VALUES (4, '安全退出', 'logout.htm', 1, '', 'close', 'fa fa-user-times', 5);
INSERT INTO `menu` VALUES (5, '菜单管理', 'menu/menuIndex.htm', 2, '', '', 'fa fa-sliders', 4);
INSERT INTO `menu` VALUES (6, '角色管理', 'role/roleIndex.htm', 2, '', '', 'fa fa-users', 3);
INSERT INTO `menu` VALUES (7, '用户管理', 'user/userIndex.htm', 2, '', '', 'fa fa-user', 2);
INSERT INTO `menu` VALUES (8, '日志管理', 'log/logIndex.htm', 2, '', '', 'fa fa-tags', 4);
INSERT INTO `menu` VALUES (10, '商品管理', 'goods/goodsIndex.htm', 2, '', NULL, '', 6);
INSERT INTO `menu` VALUES (11, '广告管理', 'content/contentIndex.htm', 2, '', NULL, '', 6);

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation`  (
  `operationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '具体的方法',
  `operationName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `menuId` int(11) NULL DEFAULT NULL COMMENT '所属菜单',
  `menuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `operationCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`operationId`) USING BTREE,
  INDEX `menuId`(`menuId`) USING BTREE,
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menu` (`menuId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10025 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '具体的页面按钮上的方法\r\n（此自增ID至少从10000开始）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES (10000, '添加', 5, '菜单管理', 'add', '');
INSERT INTO `operation` VALUES (10001, '修改', 5, '菜单管理', 'edit', '');
INSERT INTO `operation` VALUES (10002, '删除', 5, '菜单管理', 'del', '');
INSERT INTO `operation` VALUES (10003, '添加', 7, '用户管理', 'btn_add', 'glyphicon glyphicon-plus');
INSERT INTO `operation` VALUES (10004, '修改', 7, '用户管理', 'btn_edit', 'glyphicon glyphicon-pencil');
INSERT INTO `operation` VALUES (10005, '删除', 7, '用户管理', 'btn_delete', 'glyphicon glyphicon-remove');
INSERT INTO `operation` VALUES (10006, '添加', 6, '角色管理', 'btn_add', 'glyphicon glyphicon-plus');
INSERT INTO `operation` VALUES (10007, '修改', 6, '角色管理', 'btn_edit', 'glyphicon glyphicon-pencil');
INSERT INTO `operation` VALUES (10008, '删除', 6, '角色管理', 'btn_delete', 'glyphicon glyphicon-remove');
INSERT INTO `operation` VALUES (10009, '授权', 6, '角色管理', 'btn_rightCtrl', 'glyphicon glyphicon-eye-open');
INSERT INTO `operation` VALUES (10010, '下载后台日志（log4j）', 8, '日志管理', 'btn_downloadLog4j', 'glyphicon glyphicon-download-alt');
INSERT INTO `operation` VALUES (10011, '手动备份（业务操作）', 8, '日志管理', 'btn_manualBackup', 'glyphicon glyphicon-inbox');
INSERT INTO `operation` VALUES (10012, '删除', 8, '日志管理', 'btn_delete', 'glyphicon glyphicon-remove');
INSERT INTO `operation` VALUES (10013, '按钮管理', 5, '菜单管理', 'btnCtrl', '');
INSERT INTO `operation` VALUES (10014, '备份日志记录', 8, '日志管理', 'btn_downloadLogBus', 'glyphicon glyphicon-download');
INSERT INTO `operation` VALUES (10015, '添加商品', 10, '商品管理', 'btn_add', '');
INSERT INTO `operation` VALUES (10016, '修改商品', 10, '商品管理', 'btn_edit', '');
INSERT INTO `operation` VALUES (10017, '添加商品分类', 10, '商品管理', 'btn_addType', '');
INSERT INTO `operation` VALUES (10018, '导出', 10, '商品管理', 'btn_export', '');
INSERT INTO `operation` VALUES (10019, '报表', 10, '商品管理', 'btn_echarts', '');
INSERT INTO `operation` VALUES (10020, '添加', 11, '广告管理', 'btn_add', '');
INSERT INTO `operation` VALUES (10021, '修改', 11, '广告管理', 'btn_edit', '');
INSERT INTO `operation` VALUES (10022, '删除', 11, '广告管理', 'btn_delete', '');
INSERT INTO `operation` VALUES (10023, '导出', 11, '广告管理', 'btn_export', '');
INSERT INTO `operation` VALUES (10024, '报表', 11, '广告管理', 'btn_echarts', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `roleName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `menuIds` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单IDs',
  `operationIds` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮IDS',
  `roleDescription` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '1,2,3,4,5,6,7,8,10,11', '10000,10001,10002,10013,10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014,10015,10016,10017,10018,10019,10020,10021,10022,10023,10024', '拥有全部权限的超级管理员角色');
INSERT INTO `role` VALUES (2, '测试员', '1,2,3,4,6,7,8', '10006,10007,10008,10009,10003,10004,10005,10010,10011,10012,10014', '拥有系统所有业务功能的角色');

-- ----------------------------
-- Table structure for tb_major_day
-- ----------------------------
DROP TABLE IF EXISTS `tb_major_day`;
CREATE TABLE `tb_major_day`  (
  `md_id` int(11) NOT NULL AUTO_INCREMENT,
  `mdname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`md_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_major_day
-- ----------------------------
INSERT INTO `tb_major_day` VALUES (1, '大数据');
INSERT INTO `tb_major_day` VALUES (2, '物联网');
INSERT INTO `tb_major_day` VALUES (3, '全栈');

-- ----------------------------
-- Table structure for tb_stu_day
-- ----------------------------
DROP TABLE IF EXISTS `tb_stu_day`;
CREATE TABLE `tb_stu_day`  (
  `sd_id` int(11) NOT NULL AUTO_INCREMENT,
  `sdname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdsex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdhobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sdbirth` date NULL DEFAULT NULL,
  `mid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sd_id`) USING BTREE,
  INDEX `mid`(`mid`) USING BTREE,
  CONSTRAINT `wj_2` FOREIGN KEY (`mid`) REFERENCES `tb_major_day` (`md_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_stu_day
-- ----------------------------
INSERT INTO `tb_stu_day` VALUES (2, '李武', '女', '排球', '2020-07-05', 1);
INSERT INTO `tb_stu_day` VALUES (3, '张三', '男', '篮球', '2020-07-22', 3);
INSERT INTO `tb_stu_day` VALUES (4, '王五', '男', '足球', '2020-07-22', 1);
INSERT INTO `tb_stu_day` VALUES (7, '阿怪', '女', '排球', '2020-07-07', 1);
INSERT INTO `tb_stu_day` VALUES (8, '444', '男', '篮球,排球', '2020-07-22', 3);
INSERT INTO `tb_stu_day` VALUES (9, '李四22', '男', '足球', '2020-07-12', 1);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `tokenId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `userAgent` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户（md5）',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'md5(username+md5(useragent))',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `expireTime` datetime NULL DEFAULT NULL COMMENT '到期时间',
  PRIMARY KEY (`tokenId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录信息（用于自动登录）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, '0b239ed7c13c034f6b834897f0b54bba', '66895df164cf660402ab453a53496cd6', '2017-11-29 14:26:21', '2017-12-13 14:26:21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `userType` tinyint(4) NULL DEFAULT NULL COMMENT '用户类型',
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `userDescription` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', NULL, 1, '超级管理员，供开发方使用');
INSERT INTO `user` VALUES (2, 'test', 'test', NULL, 2, '测试员，供测试方使用');

SET FOREIGN_KEY_CHECKS = 1;
