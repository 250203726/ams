/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : ams_db

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2017-01-03 15:01:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_assetchangeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_assetchangeinfo`;
CREATE TABLE `t_assetchangeinfo` (
  `aciId` varchar(32) NOT NULL COMMENT '资产调拨编号',
  `assetId` varchar(32) DEFAULT NULL COMMENT '资产编号，外键',
  `originalDepartment` varchar(50) DEFAULT NULL COMMENT '原使用部门',
  `originalPrincipal` varchar(50) DEFAULT NULL COMMENT '原负责人',
  `nowDepartment` varchar(50) DEFAULT NULL COMMENT '现使用部门',
  `nowPrincipal` varchar(50) DEFAULT NULL COMMENT '现负责人',
  `changeTmie` datetime DEFAULT NULL COMMENT '调拨时间',
  `assetStatus` varchar(50) DEFAULT NULL COMMENT '资产状态 1表示领用 0表示归还',
  `assetAttach` varchar(50) DEFAULT NULL COMMENT '资产附件',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`aciId`),
  KEY `FK_Reference_10` (`assetId`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`assetId`) REFERENCES `t_assetinfo` (`assetId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产调拨';

-- ----------------------------
-- Records of t_assetchangeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_assetdamageinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_assetdamageinfo`;
CREATE TABLE `t_assetdamageinfo` (
  `assetDamageID` varchar(32) NOT NULL COMMENT '资产报损编号',
  `assetId` varchar(32) DEFAULT NULL COMMENT '资产编号，外键',
  `assetDamageRemark` varchar(100) DEFAULT NULL COMMENT '损坏原因',
  `assetDamageReason` varchar(100) DEFAULT NULL COMMENT '报损理由',
  `assetDamageOpinion` varchar(100) DEFAULT NULL COMMENT '鉴定意见',
  `userId` int(11) DEFAULT NULL COMMENT '鉴定人编号',
  `appDate` datetime DEFAULT NULL COMMENT '鉴定时间',
  `lastOpinion` varchar(50) DEFAULT NULL COMMENT '审批意见',
  PRIMARY KEY (`assetDamageID`),
  KEY `FK_ASSETINFOID` (`assetId`),
  CONSTRAINT `FK_ASSETINFOID` FOREIGN KEY (`assetId`) REFERENCES `t_assetinfo` (`assetId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产报损表';

-- ----------------------------
-- Records of t_assetdamageinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_assetinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_assetinfo`;
CREATE TABLE `t_assetinfo` (
  `assetId` varchar(32) NOT NULL COMMENT '资产编号',
  `assetnameId` varchar(32) DEFAULT NULL COMMENT '资产名称编号',
  `assetserialCode` varchar(32) DEFAULT NULL COMMENT '资产序列号',
  `projectNumber` int(11) DEFAULT NULL COMMENT '所属项目编号',
  `assetBrand` varchar(100) DEFAULT NULL COMMENT '资产品牌',
  `assetinfoVersion` varchar(100) DEFAULT NULL COMMENT '资产型号',
  `assetinfoPrice` float DEFAULT NULL COMMENT '资产价格',
  `assetinfoPic` varchar(200) DEFAULT NULL COMMENT '图片',
  `assetStatus` varchar(50) DEFAULT NULL COMMENT '资产状态 1表示领用 0表示归还',
  `agentPurchaser` varchar(50) DEFAULT NULL COMMENT '采购人',
  `userId` varchar(32) DEFAULT NULL,
  `realName` varchar(50) DEFAULT NULL,
  `assetmadeTime` datetime DEFAULT NULL COMMENT '制造日期',
  `assetinfoTime` datetime DEFAULT NULL COMMENT '购买日期',
  `StartUseTime` datetime DEFAULT NULL COMMENT '启用日期',
  `assetfactoryId` varchar(32) DEFAULT NULL COMMENT '厂商编号',
  `supplierId` varchar(32) DEFAULT NULL COMMENT '供应商编号',
  `projectId` varchar(32) DEFAULT NULL COMMENT '项目编号',
  `maintenanceId` varchar(32) DEFAULT NULL COMMENT '维护公司编号',
  `instaLocation` varchar(100) DEFAULT NULL COMMENT '安装地点',
  `UsedYears` datetime DEFAULT NULL COMMENT '使用年限',
  `LifeYears` datetime DEFAULT NULL COMMENT '生命年限',
  `Remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`assetId`),
  KEY `FK_ASSETNAMEID` (`assetnameId`),
  KEY `FK_Reference_6` (`assetfactoryId`),
  KEY `FK_Reference_7` (`supplierId`),
  KEY `FK_Reference_8` (`projectId`),
  KEY `FK_Reference_9` (`maintenanceId`),
  KEY `FK_Reference_4` (`userId`) USING BTREE,
  KEY `FK_Reference_5` (`realName`),
  CONSTRAINT `FK_ASSETNAMEID` FOREIGN KEY (`assetnameId`) REFERENCES `t_assetname` (`assetnameId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`userId`) REFERENCES `t_user` (`user_Id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`realName`) REFERENCES `t_user` (`realName`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`assetfactoryId`) REFERENCES `t_factory` (`factoryId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`supplierId`) REFERENCES `t_supplier` (`supplierId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`projectId`) REFERENCES `t_project` (`projectId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`maintenanceId`) REFERENCES `t_maintenanceinfo` (`maintenanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产';

-- ----------------------------
-- Records of t_assetinfo
-- ----------------------------
INSERT INTO `t_assetinfo` VALUES ('BGZW2015SS001', '14821384404846037', '71434SE-06CN959', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', '01', 'admin', '2016-09-10 08:47:00', '2020-09-11 08:47:00', '2025-09-12 08:47:00', '1482138082920790', '14829705646892568', '14821931073053551', '14821381788966829', '厅通讯机房办公专网机柜25-28U', '2020-12-26 00:00:00', '2025-12-27 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('BGZW2015SS002', '14821384404846037', '71434SE-06CN960', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', '01', 'admin', '2016-09-11 08:47:00', '2020-09-12 08:47:00', '2025-09-13 08:47:00', '1482138082920790', '14829705646892568', '14821931073053551', '14821381788966829', '厅通讯机房办公专网机柜20-23U', '2020-12-27 00:00:00', '2025-12-28 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('BGZW2015SS003', '14821384404846037', '0', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '01', 'admin', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:56', '1482138082920790', '14829705646892568', '14827422418589632', '14821381788966829', '数据中心机房传输区2-16机柜15-18U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('LWSF2015SS001', '14821384404846037', '71434SE-06CN948', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', '12', '李文虎', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:47', '1482138082920790', '14829705646892568', '14821931073053551', '14821381788966829', '数据中心机房一区2-09机柜22-25U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('LWSF2015SS002', '14821384404846037', '71434SE-06CN951', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', '12', '李文虎', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:48', '1482138082920790', '14829705646892568', '14821931073053551', '14821381788966829', '数据中心机房一区2-09机柜27-30U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('LWSF2015SS003', '14821384404846037', '71434SE-06CN965', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', '12', '李文虎', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:49', '1482138082920790', '14829705646892568', '14821931073053551', '14821381788966829', '数据中心机房一区2-09机柜32-35U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('LWSF2015SS004', '14821384404846037', '38370KF-06EC360', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '12', '李文虎', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:50', '1482138082920790', '14829705646892568', '14827422231159708', '14821381788966829', '数据中心机房一区2-08机柜32-35U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('LWSF2015SS005', '14821384404846037', '38370KF-06EC357', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '12', '李文虎', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:51', '1482138082920790', '14829705646892568', '14827422231159708', '14821381788966829', '数据中心机房一区2-08机柜27-30U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('LWSF2015SS006', '14821384404846037', '38370KF-06EC355', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '12', '李文虎', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:52', '1482138082920790', '14829705646892568', '14827422231159708', '14821381788966829', '数据中心机房一区2-08机柜22-25U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2015SS001', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-12机柜34-37U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2015SS002', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-12机柜29-32U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2015SS003', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-12机柜24-27U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2015SS004', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-12机柜19-22U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2015SS005', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-11机柜19-22U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2015SS006', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-11机柜24-27U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2016SS007', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-04机柜33-34U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2016SS008', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-04机柜30-31U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2016SS009', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-04机柜27-28U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2016SS010', '14821384404846037', '0', '0', 'LENOVO', 'RQ940', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-04机柜22-25U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2016SS011', '14821384404846037', '0', '0', 'LENOVO', 'RQ941', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-04机柜17-20U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2016SS012', '14821384404846037', '0', '0', 'LENOVO', 'RQ942', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-04机柜12-15U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('SJXT2016SS013', '14821384404846037', '0', '0', 'LENOVO', 'RQ943', null, '', '在用', '肖珍军', '09', '运管局02', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '14824548903752879', '14829705646892568', '14821931250282791', '14821381788966829', '数据中心机房二区3-04机柜07-10U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS001', '14821384404846037', '71434SE-06CN963', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:41', '1482138082920790', '14829705646892568', '14827421771668467', '14821381788966829', '数据中心机房传输区2-18机柜22-25U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS002', '14821384404846037', '71434SE-06CN954', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:42', '1482138082920790', '14829705646892568', '14827421771668467', '14821381788966829', '数据中心机房传输区2-19机柜12-15U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS003', '14821384404846037', '71434SE-06CN969', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:43', '1482138082920790', '14829705646892568', '14827421771668467', '14821381788966829', '数据中心机房传输区2-18机柜17-20U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS004', '14821384404846037', '71434SE-06CN950', '0', 'IBM', 'X3850 X5', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:44', '1482138082920790', '14829705646892568', '14827421771668467', '14821381788966829', '数据中心机房传输区2-19机柜22-25U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS005', '14821384404846037', '38370KF-06EC360', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:53', '1482138082920790', '14829705646892568', '14827422231159708', '14821381788966829', '数据中心机房传输区2-19机柜32-35U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS006', '14821384404846037', '38370KF-06EC356', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:54', '1482138082920790', '14829705646892568', '14827422231159708', '14821381788966829', '数据中心机房传输区2-19机柜27-30U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS007', '14821384404846037', '6241AC1-06FH473', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:55', '1482138082920790', '14829705646892568', '14827422231159708', '14821381788966829', '数据中心机房传输区2-18机柜17-20U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS008', '14821384404846037', '6241AC1-06FW392', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '10', '公路局01', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:57', '1482138082920790', '14829705646892568', '14827422527478115', '14821381788966829', '数据中心机房传输区2-17机柜22-25U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS009', '14821384404846037', '6241AC1-06FW394', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:58', '1482138082920790', '14829705646892568', '14827422527478115', '14821381788966829', '数据中心机房传输区2-17机柜17-20U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS010', '14821384404846037', '6241AC1-06FX504', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '08', '高管局', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '1482138082920790', '14829705646892568', '14827422527478115', '14821381788966829', '厅通讯机房政务外网机柜05-08U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS011', '14821384404846037', '6241AC1-06FX503', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '11', '法规处', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '1482138082920790', '14829705646892568', '14827422527478115', '14821381788966829', '厅通讯机房政务外网机柜10-13U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS012', '14821384404846037', '3837AC1-06EC359', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', '11', '法规处', '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '1482138082920790', '14829705646892568', '14827421771668467', '14821381788966829', '厅通讯机房政务外网机柜15-18U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS013', '14821384404846037', '6241AC1-06FL312', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '1482138082920790', '14829705646892568', '14827422418589632', '14821381788966829', '数据中心机房传输区2-17机柜32-35U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');
INSERT INTO `t_assetinfo` VALUES ('ZWWW2015SS014', '14821384404846037', '6241AC1-06FL314', '0', 'IBM', 'X3850 X6', null, '', '在用', '肖珍军', null, null, '2016-09-10 08:47:41', '2020-09-10 08:47:41', '2025-09-10 08:47:59', '1482138082920790', '14829705646892568', '14827422418589632', '14821381788966829', '数据中心机房传输区2-17机柜27-30U', '2020-12-26 00:00:00', '2025-12-26 00:00:00', '');

-- ----------------------------
-- Table structure for `t_assetname`
-- ----------------------------
DROP TABLE IF EXISTS `t_assetname`;
CREATE TABLE `t_assetname` (
  `assetnameId` varchar(32) NOT NULL,
  `assetName` varchar(50) DEFAULT NULL,
  `assetType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`assetnameId`),
  KEY `FK_ASSETTYPEID` (`assetType`),
  CONSTRAINT `FK_ASSETTYPEID` FOREIGN KEY (`assetType`) REFERENCES `t_assettype` (`assettypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产名称';

-- ----------------------------
-- Records of t_assetname
-- ----------------------------
INSERT INTO `t_assetname` VALUES ('1423424323434', 'EMC扩展柜', '04');
INSERT INTO `t_assetname` VALUES ('14821384404846037', '机架式服务器', '01');
INSERT INTO `t_assetname` VALUES ('14821385065523126', '主交换路由设备', '01');
INSERT INTO `t_assetname` VALUES ('14821385174103575', '入侵检测', '01');
INSERT INTO `t_assetname` VALUES ('14821385271617048', '防火墙', '01');
INSERT INTO `t_assetname` VALUES ('14821385416547831', '安全网关', '01');
INSERT INTO `t_assetname` VALUES ('14821385520753843', '核心交换机', '01');
INSERT INTO `t_assetname` VALUES ('14824534278225704', '精密空调', '02');
INSERT INTO `t_assetname` VALUES ('14824540373435537', '数据库服务器', '04');
INSERT INTO `t_assetname` VALUES ('14824540542879543', '大数据分析服务器', '04');
INSERT INTO `t_assetname` VALUES ('14827435168793279', '电话网关', '01');
INSERT INTO `t_assetname` VALUES ('14827435358515526', '加密工控机', '01');
INSERT INTO `t_assetname` VALUES ('14827435410646045', '加密机', '02');
INSERT INTO `t_assetname` VALUES ('14827435731095464', '机架式存储', '01');
INSERT INTO `t_assetname` VALUES ('14827435798184183', 'EMC扩展柜', '02');
INSERT INTO `t_assetname` VALUES ('14827436955321203', '光纤交换机', '01');
INSERT INTO `t_assetname` VALUES ('14827437435363644', '大数据系统服务器', '04');
INSERT INTO `t_assetname` VALUES ('14827437588091696', '虚拟化资源服务器', '04');
INSERT INTO `t_assetname` VALUES ('14827437767362889', '接入交换机', '04');
INSERT INTO `t_assetname` VALUES ('14827437970333759', '虚拟磁带库', '04');
INSERT INTO `t_assetname` VALUES ('14828027284769466', 'UPS', '01');

-- ----------------------------
-- Table structure for `t_assetpurchaseapplication`
-- ----------------------------
DROP TABLE IF EXISTS `t_assetpurchaseapplication`;
CREATE TABLE `t_assetpurchaseapplication` (
  `purchaseapplicationId` varchar(32) NOT NULL,
  `userId` varchar(32) DEFAULT NULL,
  `purchaseDepartment` varchar(50) DEFAULT NULL,
  `Applicant` varchar(50) DEFAULT NULL,
  `applicationTime` datetime DEFAULT NULL,
  `assetnameId` varchar(32) DEFAULT NULL,
  `specificationModel` varchar(50) DEFAULT NULL,
  `purchaseQuantity` int(11) DEFAULT NULL,
  `budgetFunds` float DEFAULT NULL,
  `purchaseReason` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `approveOpinion` varchar(100) DEFAULT NULL,
  `Approver` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`purchaseapplicationId`),
  KEY `FK_Reference_11` (`userId`),
  KEY `FK_Reference_14` (`assetnameId`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`userId`) REFERENCES `t_user` (`user_Id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`assetnameId`) REFERENCES `t_assetname` (`assetnameId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产购置申请';

-- ----------------------------
-- Records of t_assetpurchaseapplication
-- ----------------------------
INSERT INTO `t_assetpurchaseapplication` VALUES ('14827138618723091', '01', '网络事业科', null, '2016-12-26 08:56:26', '14821385520753843', 'CE12808s', '1', '180000', '网络规划', '', '', '');
INSERT INTO `t_assetpurchaseapplication` VALUES ('14830647956421934', null, '通信管理科', '', '2016-12-30 10:25:30', '14827436955321203', 'BR6510', '1', '80000', '云数据中心', '', '通过', '');

-- ----------------------------
-- Table structure for `t_assettype`
-- ----------------------------
DROP TABLE IF EXISTS `t_assettype`;
CREATE TABLE `t_assettype` (
  `assettypeid` varchar(32) NOT NULL,
  `assettypename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`assettypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产类型';

-- ----------------------------
-- Records of t_assettype
-- ----------------------------
INSERT INTO `t_assettype` VALUES ('01', '湖北省交通运输厅通信信息中心');
INSERT INTO `t_assettype` VALUES ('02', '湖北省交通科学研究所');
INSERT INTO `t_assettype` VALUES ('04', '运管局');

-- ----------------------------
-- Table structure for `t_auth`
-- ----------------------------
DROP TABLE IF EXISTS `t_auth`;
CREATE TABLE `t_auth` (
  `auth_Id` varchar(32) NOT NULL,
  `parentId` varchar(32) NOT NULL COMMENT '父亲节点，根节点为0',
  `authName` varchar(50) NOT NULL COMMENT '权限名称',
  `authority` int(11) NOT NULL COMMENT '权限值',
  `sortCode` int(11) DEFAULT '0' COMMENT '显示顺序',
  `enable` varchar(11) NOT NULL COMMENT '是否启用',
  `base` char(1) DEFAULT '0' COMMENT '是否为基础权限',
  PRIMARY KEY (`auth_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='权限表';

-- ----------------------------
-- Records of t_auth
-- ----------------------------
INSERT INTO `t_auth` VALUES ('1420772233319582', '0', '基础管理', '17', '7', '1', '0');
INSERT INTO `t_auth` VALUES ('1420772254227721', '0', '系统设置', '18', '8', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774275777703', '1420772233319582', '客户', '1711', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774290241732', '1420772233319582', '施工单位', '1712', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774304817411', '1420772233319582', '项目经理', '1713', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774322970502', '1420774275777703', '编辑', '171111', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774335138882', '1420774275777703', '保存', '171112', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774351532614', '1420774275777703', '查询', '171113', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774377287220', '1420774275777703', '删除', '171114', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774396362234', '1420774290241732', '编辑', '171211', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774405744078', '1420774290241732', '保存', '171212', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774413825368', '1420774290241732', '删除', '171213', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774429615659', '1420774290241732', '查询', '171214', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774445780262', '1420774304817411', '编辑', '171311', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774455327507', '1420774304817411', '保存', '171312', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774465765368', '1420774304817411', '删除', '171313', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774474960970', '1420774304817411', '查询', '171314', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774520651678', '0', '个人信息', '19', '9', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774542863414', '1420772254227721', '用户', '1811', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774553720576', '1420772254227721', '角色', '1812', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774582018270', '1420772254227721', 'url过滤', '1813', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774613888712', '1420774542863414', '编辑', '181111', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774623216907', '1420774542863414', '保存', '181112', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774631600043', '1420774542863414', '删除', '181113', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774641375167', '1420774542863414', '查询', '181114', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774667698457', '1420774553720576', '编辑', '181211', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774700409999', '1420774542863414', '启用停用', '181115', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774714071975', '1420774553720576', '保存', '181212', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774724213717', '1420774553720576', '删除', '181213', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774737226827', '1420774553720576', '启用停用', '181214', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774745961527', '1420774553720576', '查询', '181215', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774769821826', '1420774582018270', '编辑', '181311', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774783343847', '1420774582018270', '保存', '181312', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774792080143', '1420774582018270', '删除', '181313', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774803540383', '1420774582018270', '查询', '181314', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774848247326', '1420774520651678', '修改密码', '1911', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1420774864855339', '1420774520651678', '修改个人信息', '1912', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1420775943320158', '1420774520651678', '个人详细', '1913', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('1420775963441954', '1420774542863414', '详细', '181116', '6', '1', '0');
INSERT INTO `t_auth` VALUES ('1420775979999883', '1420774553720576', '详细', '181216', '6', '1', '0');
INSERT INTO `t_auth` VALUES ('14207789119125323', '1420774304817411', '启用禁用', '171315', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14207789758687084', '1420774304817411', '详细', '171316', '6', '1', '0');
INSERT INTO `t_auth` VALUES ('14207810183426843', '1420774275777703', '详细', '171115', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14207810436186945', '1420774290241732', '详细', '171215', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('1420782568463801', '1420772254227721', '系统资源', '1814', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14207825834738015', '1420772254227721', '数据导入', '1815', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14207826192878641', '1420782568463801', '菜单列表', '181411', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14207826306574883', '1420782568463801', '权限列表', '181412', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14777143194701213', '1420772233319582', '部门', '1714', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14777143499375662', '14777143194701213', '编辑', '171411', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14777143750578757', '14777143194701213', '保存', '171412', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14777144360006547', '14777143194701213', '查询', '171413', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14777144572177847', '14777143194701213', '删除', '171414', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14777144706536288', '14777143194701213', '详细', '171415', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14777148581064596', '1420772233319582', '供应商', '1715', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14777149181067674', '14777148581064596', '编辑', '171511', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14777149288109088', '14777148581064596', '保存', '171512', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14777149392661832', '14777148581064596', '查询', '171513', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14777149513063257', '14777148581064596', '删除', '171514', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14777149643932508', '14777148581064596', '详细', '171515', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('1478486994792483', '1420772233319582', '厂商', '1716', '6', '1', '0');
INSERT INTO `t_auth` VALUES ('14784870074146684', '1478486994792483', '编辑', '171611', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1478487021885848', '1478486994792483', '保存', '171612', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14784873138778774', '1478486994792483', '查询', '171613', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14784873221686214', '1478486994792483', '删除', '171614', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14784873328314974', '1478486994792483', '详细', '171615', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14784873545301112', '1420772233319582', '项目', '1717', '7', '1', '0');
INSERT INTO `t_auth` VALUES ('14784873753116374', '1420772233319582', '维护公司', '1718', '8', '1', '0');
INSERT INTO `t_auth` VALUES ('14784874195752946', '0', '固定资产', '16', '6', '1', '0');
INSERT INTO `t_auth` VALUES ('14784874389606424', '14784874195752946', '资产信息', '1611', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14784874544381495', '14784874195752946', '资产名称', '1612', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14784874669413763', '14784874195752946', '资产类别', '1613', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14784874785412142', '14784874195752946', '资产购置', '1614', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14784874908492191', '14784874195752946', '资产报损', '1615', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14784875032477664', '14784874195752946', '资产维护', '1616', '6', '1', '0');
INSERT INTO `t_auth` VALUES ('14784875138754152', '14784874195752946', '资产调拨', '1617', '7', '1', '0');
INSERT INTO `t_auth` VALUES ('14784875722465491', '14784874389606424', '编辑', '161111', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14784875849733532', '14784874389606424', '保存', '161112', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14784875957984025', '14784874389606424', '查询', '161113', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14784876054547554', '14784874389606424', '删除', '161114', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14784876172349600', '14784874389606424', '详细', '161115', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14784876345205741', '14784874544381495', '编辑', '161211', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14784876522718348', '14784874544381495', '保存', '161212', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14784876616498650', '14784874544381495', '查询', '161213', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14784876722856535', '14784874544381495', '删除', '161214', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14784877440817947', '14784874544381495', '详情', '161215', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14785070950148522', '14784874669413763', '编辑', '161311', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14785071149222369', '14784874669413763', '保存', '161312', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785071325716626', '14784874669413763', '查询', '161313', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14785071518515794', '14784874669413763', '删除', '161314', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14785071689358439', '14784874669413763', '详情', '161315', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14785072161004562', '14784874785412142', '编辑', '161411', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14785072297496863', '14784874785412142', '保存', '161412', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785072436474249', '14784874785412142', '查询', '161413', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14785072582462239', '14784874785412142', '删除', '161414', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14785072707329018', '14784874785412142', '详情', '161415', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14785072919453138', '14784874908492191', '编辑', '161511', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14785073184264158', '14784874908492191', '保存', '161512', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785073386413010', '14784874908492191', '查询', '161513', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14785074153357410', '14784874908492191', '删除', '161514', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14785074297514576', '14784874908492191', '详情', '161515', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14785074445501110', '14784875032477664', '编辑', '161611', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14785074551537161', '14784875032477664', '保存', '161612', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785074712159745', '14784875032477664', '查询', '161613', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14785074848165802', '14784875032477664', '删除', '161614', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('14785074968001502', '14784875032477664', '详情', '161615', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14785075145455932', '14784875138754152', '编辑', '161711', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('1478507526195476', '14784875138754152', '保存', '161712', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785075372468672', '14784875138754152', '查询', '161713', '3', '1', '0');
INSERT INTO `t_auth` VALUES ('14785075497951182', '14784875138754152', '删除', '161714', '4', '1', '0');
INSERT INTO `t_auth` VALUES ('1478507561512614', '14784875138754152', '详情', '161715', '5', '1', '0');
INSERT INTO `t_auth` VALUES ('14785100090317796', '14784873545301112', '编辑', '171711', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785100223479638', '14784873545301112', '保存', '171712', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785100377978274', '14784873545301112', '查询', '171713', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785100933292913', '14784873545301112', '删除', '171714', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785101037749072', '14784873545301112', '详细', '171715', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785101288548767', '14784873753116374', '编辑', '171811', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('1478510151590919', '14784873753116374', '保存', '171812', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785101696905628', '14784873753116374', '查询', '171813', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785101803569413', '14784873753116374', '删除', '171814', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14785101902852840', '14784873753116374', '详细', '171815', '2', '1', '0');

-- ----------------------------
-- Table structure for `t_code`
-- ----------------------------
DROP TABLE IF EXISTS `t_code`;
CREATE TABLE `t_code` (
  `codeId` varchar(32) NOT NULL COMMENT '键',
  `code` varchar(32) NOT NULL COMMENT '简码',
  `codeName` varchar(32) NOT NULL COMMENT '简码名称',
  `modelType` varchar(11) NOT NULL COMMENT '模块类型',
  `codeType` varchar(11) NOT NULL COMMENT '简码类型',
  `sort` varchar(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`codeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='合同简码';

-- ----------------------------
-- Records of t_code
-- ----------------------------

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `company_Id` varchar(32) NOT NULL COMMENT '主键',
  `company_Name` varchar(100) NOT NULL COMMENT '单位名称',
  `company_Type` varchar(11) NOT NULL COMMENT '单位分类: 分公司、内部单位、外部单位、设备供应商',
  `person` varchar(20) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='施工单位';

-- ----------------------------
-- Records of t_company
-- ----------------------------

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `customer_Id` varchar(32) NOT NULL COMMENT '主键',
  `customer_Code` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `customer_Name` varchar(1024) NOT NULL COMMENT '客户名称',
  `customer_Type` varchar(11) DEFAULT NULL COMMENT '客户类型',
  `contact_Person` varchar(50) DEFAULT NULL COMMENT '联系人',
  `contatct_Phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `contatct_Address` varchar(1024) DEFAULT NULL COMMENT '地址',
  `customer_Note` text COMMENT '说明',
  PRIMARY KEY (`customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='客户表';

-- ----------------------------
-- Records of t_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `t_depart`
-- ----------------------------
DROP TABLE IF EXISTS `t_depart`;
CREATE TABLE `t_depart` (
  `departId` varchar(32) NOT NULL COMMENT '部门编号',
  `departName` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `departAdd` varchar(100) DEFAULT NULL COMMENT '部门地址',
  `departOwner` varchar(50) DEFAULT NULL COMMENT '部门负责人',
  PRIMARY KEY (`departId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='部门信息';

-- ----------------------------
-- Records of t_depart
-- ----------------------------
INSERT INTO `t_depart` VALUES ('0', '财务科', null, '唐颖');
INSERT INTO `t_depart` VALUES ('1', '综合科', null, '戚飞');
INSERT INTO `t_depart` VALUES ('2', '网络事业科', null, '黄晋');
INSERT INTO `t_depart` VALUES ('3', '信息开发科', null, '王三军');
INSERT INTO `t_depart` VALUES ('4', '通信管理科', null, '龚季辉');
INSERT INTO `t_depart` VALUES ('5', '工程部', null, '沈毅');
INSERT INTO `t_depart` VALUES ('6', '领导成员', null, '周文卫');
INSERT INTO `t_depart` VALUES ('7', '总工办', null, '彭阳');
INSERT INTO `t_depart` VALUES ('8', '政务处理中心', null, '姚元梅');
INSERT INTO `t_depart` VALUES ('9', '外部单位', null, '外部单位');

-- ----------------------------
-- Table structure for `t_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary` (
  `id` varchar(32) NOT NULL,
  `Groupname` varchar(32) NOT NULL COMMENT '组名',
  `GroupTranslate` varchar(32) DEFAULT NULL COMMENT '组名翻译',
  `Code` varchar(128) DEFAULT NULL COMMENT '编码',
  `Name` varchar(128) DEFAULT NULL COMMENT '名称',
  `value` varchar(255) DEFAULT NULL COMMENT '值',
  `sortCode` int(11) DEFAULT NULL COMMENT '排序',
  `filter` varchar(10) DEFAULT NULL COMMENT '值分组,大于，等于，小于某个值来分组',
  `exesql` varchar(1024) DEFAULT NULL COMMENT '执行的sql语句',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for `t_factory`
-- ----------------------------
DROP TABLE IF EXISTS `t_factory`;
CREATE TABLE `t_factory` (
  `factoryId` varchar(32) NOT NULL COMMENT '厂商编号',
  `factoryName` varchar(100) DEFAULT NULL COMMENT '厂商名称',
  `factoryContacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `factorycontactsPhone` varchar(11) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`factoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_factory
-- ----------------------------
INSERT INTO `t_factory` VALUES ('14821380703448387', '华为', '', '');
INSERT INTO `t_factory` VALUES ('1482138082920790', 'IBM', '', '');
INSERT INTO `t_factory` VALUES ('14821381009866679', '思科', '', '');
INSERT INTO `t_factory` VALUES ('14824548903752879', '联想', '', '');
INSERT INTO `t_factory` VALUES ('14827431825705536', 'EMC', '', '');
INSERT INTO `t_factory` VALUES ('14827432170979860', '博科', '', '');
INSERT INTO `t_factory` VALUES ('1482743273416340', '网神', '', '');
INSERT INTO `t_factory` VALUES ('14827432875836762', 'WESTONE', '', '');
INSERT INTO `t_factory` VALUES ('14827432995968737', 'AVAYA', '', '');

-- ----------------------------
-- Table structure for `t_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `loginLog_Id` varchar(32) NOT NULL COMMENT '编码',
  `userName` varchar(100) NOT NULL COMMENT '用户登录名',
  `loginTime` datetime NOT NULL COMMENT '登录时间',
  `loginIp` varchar(100) NOT NULL COMMENT '登录IP',
  `loginMessage` varchar(50) DEFAULT NULL COMMENT '登录反馈消息',
  PRIMARY KEY (`loginLog_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户登录日志';

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES ('14228649158833041', 'admin', '2015-02-02 16:15:15', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228651511077814', 'admin', '2015-02-02 16:19:11', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228657687758989', 'admin', '2015-02-02 16:29:28', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228660818569936', 'admin', '2015-02-02 16:34:41', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228664099873255', 'admin', '2015-02-02 16:40:09', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228667106157166', 'admin', '2015-02-02 16:45:10', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228668255565491', '涂蕾', '2015-02-02 16:47:05', '192.168.1.104', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14228668322644472', 'admin', '2015-02-02 16:47:12', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('1422867083351027', 'admin', '2015-02-02 16:51:23', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228671730815318', 'admin', '2015-02-02 16:52:53', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228799365348996', 'admin', '2015-02-02 20:25:36', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14228803158334058', 'admin', '2015-02-02 20:31:55', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258843574221268', '涂蕾', '2015-03-09 14:59:17', '192.168.1.112', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258843645612141', 'admin', '2015-03-09 14:59:24', '192.168.1.112', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258844723267687', 'admin', '2015-03-09 15:01:12', '192.168.1.112', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258849060386742', 'admin', '2015-03-09 15:08:26', '192.168.1.116', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258854048389633', 'admin', '2015-03-09 15:16:44', '192.168.1.116', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258855576552187', 'admin', '2015-03-09 15:19:17', '192.168.1.116', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258856384027321', '张家吉', '2015-03-09 15:20:38', '192.168.1.116', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258857015582450', 'admin', '2015-03-09 15:21:41', '192.168.1.116', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258857079835780', 'admin', '2015-03-09 15:21:47', '192.168.1.116', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258860871084983', '涂蕾', '2015-03-09 15:28:07', '192.168.1.112', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258865022838813', 'admin', '2015-03-09 15:35:02', '192.168.1.115', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258866575152554', '文友同', '2015-03-09 15:37:37', '192.168.1.115', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258866696745246', '文友同', '2015-03-09 15:37:49', '192.168.1.115', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258866898564631', '文友同', '2015-03-09 15:38:09', '192.168.1.115', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258866965661357', 'admin', '2015-03-09 15:38:16', '192.168.1.115', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258867407055565', '文友同', '2015-03-09 15:39:00', '192.168.1.115', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258868645579249', '文友同', '2015-03-09 15:41:04', '192.168.1.115', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258868758407841', '文友同', '2015-03-09 15:41:15', '192.168.1.115', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14258868956551498', '文友同', '2015-03-09 15:41:35', '192.168.1.115', '登录成功');
INSERT INTO `t_login_log` VALUES ('14258869337293118', '文友同', '2015-03-09 15:42:13', '192.168.1.115', '登录成功');
INSERT INTO `t_login_log` VALUES ('1425901644801856', 'admin', '2015-03-09 19:47:24', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14260784038359254', 'admin', '2015-03-11 20:53:23', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14260787830844897', 'admin', '2015-03-11 20:59:43', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14260789967008136', 'admin', '2015-03-11 21:03:16', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271855982873917', 'admin', '2015-03-24 16:26:38', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271856060294845', 'admin', '2015-03-24 16:26:46', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271858480566696', '涂蕾', '2015-03-24 16:30:48', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271864328078363', '涂蕾', '2015-03-24 16:40:32', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271864668002859', '涂蕾', '2015-03-24 16:41:06', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271865371403442', '涂蕾', '2015-03-24 16:42:17', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271882793516178', '涂蕾', '2015-03-24 17:11:19', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271886111643671', 'admin', '2015-03-24 17:16:51', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14271887102862858', '涂蕾', '2015-03-24 17:18:30', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14272450039064502', '涂蕾', '2015-03-25 08:56:43', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14272476555525951', '涂蕾', '2015-03-25 09:40:55', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14272486061552039', '涂蕾', '2015-03-25 09:56:46', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273553246381897', 'admin', '2015-03-26 15:35:24', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273556762586464', '涂蕾', '2015-03-26 15:41:16', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273561218853682', '涂蕾', '2015-03-26 15:48:41', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273563952605523', '涂蕾', '2015-03-26 15:53:15', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273565122731953', 'admin', '2015-03-26 15:55:12', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273567533281477', 'admin', '2015-03-26 15:59:13', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273569299361537', '涂蕾', '2015-03-26 16:02:09', '192.168.1.109', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273631540608756', 'admin', '2015-03-26 17:45:54', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14273635601221735', 'admin', '2015-03-26 17:52:40', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14280236114454199', '涂蕾', '2015-04-03 09:13:31', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14280312553186583', '涂蕾', '2015-04-03 11:20:55', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14332337813727203', '涂蕾', '2015-06-02 16:29:41', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14332928839634329', '涂蕾', '2015-06-03 08:54:43', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14332938444266006', '涂蕾', '2015-06-03 09:10:44', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('1433294388836335', '涂蕾', '2015-06-03 09:19:48', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14332977032336591', '涂蕾', '2015-06-03 10:15:03', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14333016850461081', '涂蕾', '2015-06-03 11:21:25', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14333152833411623', '涂蕾', '2015-06-03 15:08:03', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('1433380192621184', '涂蕾', '2015-06-04 09:09:52', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('1433386054581964', '涂蕾', '2015-06-04 10:47:34', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('1433401218494173', '涂蕾', '2015-06-04 15:00:18', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14334013262599890', '涂蕾', '2015-06-04 15:02:06', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14334028494149753', '涂蕾', '2015-06-04 15:27:29', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14334053072866983', 'admin', '2015-06-04 16:08:27', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14334053774265531', '涂蕾', '2015-06-04 16:09:37', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14337456907818969', '涂蕾', '2015-06-08 14:41:30', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14342678243648433', 'admin', '2015-06-14 15:43:44', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14342690701024868', 'admin', '2015-06-14 16:04:30', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14353059503472666', '涂蕾', '2015-06-26 16:05:50', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14353071163974758', 'admin', '2015-06-26 16:25:16', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14355865797156713', 'admin', '2015-06-29 22:02:59', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14404216697718196', 'admin', '2015-08-24 21:07:49', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14470353851997245', '涂蕾', '2015-11-09 10:16:25', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('1447747394972739', '涂蕾', '2015-11-17 16:03:14', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14477484538559485', '涂蕾', '2015-11-17 16:20:53', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14478120215653402', '涂蕾', '2015-11-18 10:00:21', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14478182691572444', 'admin', '2015-11-18 11:44:29', '192.168.1.135', '登录成功');
INSERT INTO `t_login_log` VALUES ('14478214233586387', '涂蕾', '2015-11-18 12:37:03', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('1448939003427670', 'admin', '2015-12-01 11:03:23', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14489461584278679', 'admin', '2015-12-01 13:02:38', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1448954650347010', '涂蕾', '2015-12-01 15:24:10', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14491142994238863', 'admin', '2015-12-03 11:44:59', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14491166117621109', 'admin', '2015-12-03 12:23:31', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14491247118695500', '涂蕾', '2015-12-03 14:38:31', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14491272066929813', '涂蕾', '2015-12-03 15:20:06', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14491302621034933', '涂蕾', '2015-12-03 16:11:02', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14492003828929379', '涂蕾', '2015-12-04 11:39:42', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14494563309683673', '涂蕾', '2015-12-07 10:45:30', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14494693971596234', '涂蕾', '2015-12-07 14:23:17', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14495441887614009', '涂蕾', '2015-12-08 11:09:48', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14495476125915902', 'admin', '2015-12-08 12:06:52', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1449837351104548', 'admin', '2015-12-11 20:35:51', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14498378290648231', 'admin', '2015-12-11 20:43:49', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14498379972167971', 'admin', '2015-12-11 20:46:37', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14498383738792859', 'admin', '2015-12-11 20:52:53', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14500659674645979', '涂蕾', '2015-12-14 12:06:07', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14500794601727152', '涂蕾', '2015-12-14 15:51:00', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14500814448856940', '涂蕾', '2015-12-14 16:24:04', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14500866887328062', 'admin', '2015-12-14 17:51:28', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14501012226308885', 'admin', '2015-12-14 21:53:42', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14501049294447924', 'admin', '2015-12-14 22:55:29', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14508345646398592', '涂蕾', '2015-12-23 09:36:04', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14508583101734729', '涂蕾', '2015-12-23 16:11:50', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14509196143916715', '涂蕾', '2015-12-24 09:13:34', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('1450924541735429', '涂蕾', '2015-12-24 10:35:41', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14509384459782710', '涂蕾', '2015-12-24 14:27:25', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14512343603618747', 'admin', '2015-12-28 00:39:20', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14512754116842930', '涂蕾', '2015-12-28 12:03:31', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514358803337511', 'admin', '2015-12-30 08:38:00', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514397820128474', 'admin', '2015-12-30 09:43:02', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514464995558830', '涂蕾', '2015-12-30 11:34:59', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514465055389832', 'wangzhen', '2015-12-30 11:35:05', '192.168.1.114', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14514465191051013', '王桢', '2015-12-30 11:35:19', '192.168.1.114', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14514465377905643', '王桢', '2015-12-30 11:35:37', '192.168.1.114', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14514465589753602', '王晓云', '2015-12-30 11:35:58', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514465664492324', '王桢', '2015-12-30 11:36:06', '192.168.1.114', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('1451446582072447', '王祯', '2015-12-30 11:36:22', '192.168.1.114', '登录成功');
INSERT INTO `t_login_log` VALUES ('1451446646601720', '王祯', '2015-12-30 11:37:26', '192.168.1.114', '登录成功');
INSERT INTO `t_login_log` VALUES ('1451447058684673', '张家吉', '2015-12-30 11:44:18', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514471072964356', '王祯', '2015-12-30 11:45:07', '192.168.1.114', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514471142249098', '涂蕾', '2015-12-30 11:45:14', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514471199422570', 'admin', '2015-12-30 11:45:19', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514472346652264', '张家吉', '2015-12-30 11:47:14', '192.168.1.119', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14514472645267298', '张家吉', '2015-12-30 11:47:44', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514472763653430', '王祯 ', '2015-12-30 11:47:56', '192.168.1.114', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514472801489493', 'admin', '2015-12-30 11:48:00', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514472955289989', '张家吉', '2015-12-30 11:48:15', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514473619308837', '张家吉', '2015-12-30 11:49:21', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514474840612640', 'admin', '2015-12-30 11:51:24', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514497194687617', '张家吉', '2015-12-30 12:28:39', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514565432141326', '王祯', '2015-12-30 14:22:23', '192.168.1.114', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514601945342636', 'admin', '2015-12-30 15:23:14', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14514605140989954', 'admin', '2015-12-30 15:28:34', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518702661831922', '涂蕾', '2016-01-04 09:17:46', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518827784034214', '张家吉', '2016-01-04 12:46:18', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518828074934067', '张家吉', '2016-01-04 12:46:47', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518916158957350', 'admin', '2016-01-04 15:13:35', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518919350082965', '张家吉', '2016-01-04 15:18:55', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1451892167221615', '涂蕾', '2016-01-04 15:22:47', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518923287207743', '张家吉', '2016-01-04 15:25:28', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518924970069993', 'admin', '2016-01-04 15:28:17', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14518958637148079', 'admin', '2016-01-04 16:24:23', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519239516601840', 'admin', '2016-01-05 00:12:31', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519557122115011', 'admin', '2016-01-05 09:01:52', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519560951963743', 'admin', '2016-01-05 09:08:15', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519605984382535', '涂蕾', '2016-01-05 10:23:18', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519631113534609', '王祯', '2016-01-05 11:05:11', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('1451963150899608', '王祯', '2016-01-05 11:05:50', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519633697365513', '王祯', '2016-01-05 11:09:29', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519639058154866', '张家吉', '2016-01-05 11:18:25', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519645389264602', 'admin', '2016-01-05 11:28:58', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519649494903920', '王祯', '2016-01-05 11:35:49', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519652146442135', '涂蕾', '2016-01-05 11:40:14', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('1451973876076556', '王祯', '2016-01-05 14:04:36', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519742283161882', '王晓云', '2016-01-05 14:10:28', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519784328234362', '王祯', '2016-01-05 15:20:32', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519789451894438', '王祯', '2016-01-05 15:29:05', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519808828532317', '张家吉', '2016-01-05 16:01:22', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519820649385674', 'admin', '2016-01-05 16:21:04', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519859445402971', 'admin', '2016-01-05 17:25:44', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14519859675526577', '张家吉', '2016-01-05 17:26:07', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520507498278282', '涂蕾', '2016-01-06 11:25:49', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520605446747953', '王祯', '2016-01-06 14:09:04', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520624073749172', '涂蕾', '2016-01-06 14:40:07', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520625477533482', '张家吉', '2016-01-06 14:42:27', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520627946908093', '王晓云', '2016-01-06 14:46:34', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520635062377526', 'admin', '2016-01-06 14:58:26', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520635757899744', '王祯', '2016-01-06 14:59:35', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452063630717702', 'admin', '2016-01-06 15:00:30', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520636718288981', '王祯', '2016-01-06 15:01:11', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520639008421014', 'admin', '2016-01-06 15:05:00', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520640059749594', '王桢', '2016-01-06 15:06:45', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520641204596212', '张家吉', '2016-01-06 15:08:40', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520643028766854', 'admin', '2016-01-06 15:11:42', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520645625882261', '王桢', '2016-01-06 15:16:02', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520655092132978', '王晓云', '2016-01-06 15:31:49', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520657218824289', 'admin', '2016-01-06 15:35:21', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520657961196793', 'admin', '2016-01-06 15:36:36', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452065944523046', '王晓云', '2016-01-06 15:39:04', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520660224232472', '张家吉', '2016-01-06 15:40:22', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520666667635573', 'admin', '2016-01-06 15:51:06', '192.168.1.107', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520666991425520', '文友同', '2016-01-06 15:51:39', '192.168.1.107', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14520667273962393', 'admin', '2016-01-06 15:52:07', '192.168.1.107', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452066844063707', '文友同', '2016-01-06 15:54:04', '192.168.1.107', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520668648079461', '王晓云', '2016-01-06 15:54:24', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520673940395103', '王晓云', '2016-01-06 16:03:14', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520687146551360', '王晓云', '2016-01-06 16:25:14', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14520875427336369', 'admin', '2016-01-06 21:39:02', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14521277212473120', '涂蕾', '2016-01-07 08:48:41', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14521308844167594', 'admin', '2016-01-07 09:41:24', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14521332347108382', '张家吉', '2016-01-07 10:20:34', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14521354035457593', '涂蕾', '2016-01-07 10:56:43', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14522152284252295', '涂蕾', '2016-01-08 09:07:08', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14522186191729851', '涂蕾', '2016-01-08 10:03:39', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14522186192244209', '涂蕾', '2016-01-08 10:03:39', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14522360173583374', '涂蕾', '2016-01-08 14:53:37', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14522373087309676', '涂蕾', '2016-01-08 15:15:08', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14522395330042639', '涂蕾', '2016-01-08 15:52:13', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524799959948892', '涂蕾', '2016-01-11 10:39:55', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524805158159983', '张家吉', '2016-01-11 10:48:35', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524934056988059', '涂蕾', '2016-01-11 14:23:25', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524952139254328', '王桢', '2016-01-11 14:53:33', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524952592964082', '涂蕾', '2016-01-11 14:54:19', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524954900024227', '张家吉', '2016-01-11 14:58:10', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524970287654707', 'admin', '2016-01-11 15:23:48', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524971833883003', '张家吉', '2016-01-11 15:26:23', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14524972633461113', '张家吉', '2016-01-11 15:27:43', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452498747578538', '王桢', '2016-01-11 15:52:27', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14525651568409378', '涂蕾', '2016-01-12 10:19:16', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14525712103777310', '涂蕾', '2016-01-12 12:00:10', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14525801476135823', '涂蕾', '2016-01-12 14:29:07', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14525807892467211', '王晓云', '2016-01-12 14:39:49', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452581072820473', '王晓云', '2016-01-12 14:44:32', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14525858922618156', '涂蕾', '2016-01-12 16:04:52', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526464509971052', '涂蕾', '2016-01-13 08:54:10', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452648452900341', '涂蕾', '2016-01-13 09:27:32', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526520452492715', 'admin', '2016-01-13 10:27:25', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526522359363432', '王晓云', '2016-01-13 10:30:35', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526537916727597', 'admin', '2016-01-13 10:56:31', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526541772355716', 'admin', '2016-01-13 11:02:57', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526542768187063', 'admin', '2016-01-13 11:04:36', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452654516710719', 'admin', '2016-01-13 11:08:36', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526549458092766', '涂蕾', '2016-01-13 11:15:45', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526554961069095', 'admin', '2016-01-13 11:24:56', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526666370245100', 'admin', '2016-01-13 14:30:37', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526671861477867', 'admin', '2016-01-13 14:39:46', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526672630414739', 'admin', '2016-01-13 14:41:03', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526672783135931', '涂蕾', '2016-01-13 14:41:18', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526677862459283', '王晓云', '2016-01-13 14:49:46', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526679203376637', 'admin', '2016-01-13 14:52:00', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526679418241140', '涂蕾', '2016-01-13 14:52:21', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526681434886386', 'admin', '2016-01-13 14:55:43', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526706540554792', 'admin', '2016-01-13 15:37:34', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526707453362552', 'admin', '2016-01-13 15:39:05', '127.0.0.1', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14526707536601702', 'admin', '2016-01-13 15:39:13', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526708917996640', '涂蕾', '2016-01-13 15:41:31', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526718629223584', 'admin', '2016-01-13 15:57:42', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526725074635463', 'admin', '2016-01-13 16:08:27', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526728600945645', '王晓云', '2016-01-13 16:14:20', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14526732250597466', '涂蕾', '2016-01-13 16:20:25', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14527381945764671', '涂蕾', '2016-01-14 10:23:14', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('1452758906121064', '张家吉', '2016-01-14 16:08:26', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14528226202285637', '张家吉', '2016-01-15 09:50:20', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530070867915265', 'admin', '2016-01-17 13:04:46', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530792772611114', '涂蕾', '2016-01-18 09:07:57', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530809807702981', '王晓云', '2016-01-18 09:36:20', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530821011907180', '王晓云', '2016-01-18 09:55:01', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530829931291963', '涂蕾', '2016-01-18 10:09:53', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530865650775314', '涂蕾', '2016-01-18 11:09:25', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530891594554462', '涂蕾', '2016-01-18 11:52:39', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14530977199934186', '涂蕾', '2016-01-18 14:15:19', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14531059017624387', '涂蕾', '2016-01-18 16:31:41', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14531648934102350', '王晓云', '2016-01-19 08:54:53', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14531650316206507', '涂蕾', '2016-01-19 08:57:11', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14531666214521850', '涂蕾', '2016-01-19 09:23:41', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14531698378952650', '文友同', '2016-01-19 10:17:17', '192.168.1.107', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14531698701511110', '文友同', '2016-01-19 10:17:50', '192.168.1.107', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14531698913499510', '文友同', '2016-01-19 10:18:11', '192.168.1.107', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14531699225508618', '涂蕾', '2016-01-19 10:18:42', '192.168.1.107', '登录成功');
INSERT INTO `t_login_log` VALUES ('1453171352728439', '涂蕾', '2016-01-19 10:42:32', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14531738472191250', '涂蕾', '2016-01-19 11:24:07', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14531772089666835', 'admin', '2016-01-19 12:20:08', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14532067633265576', 'admin', '2016-01-19 20:32:43', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14532517678435260', '涂蕾', '2016-01-20 09:02:47', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14532563066099203', '涂蕾', '2016-01-20 10:18:26', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14532611540737040', '涂蕾', '2016-01-20 11:39:14', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14532708631424757', '涂蕾', '2016-01-20 14:21:03', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14532755489205808', '涂蕾', '2016-01-20 15:39:08', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14533377615952178', '涂蕾', '2016-01-21 08:56:01', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14533426609632528', '涂蕾', '2016-01-21 10:17:40', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14533591529266880', '涂蕾', '2016-01-21 14:52:32', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14533850110939887', 'admin', '2016-01-21 22:03:31', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14534285835784236', '张家吉', '2016-01-22 10:09:43', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14534449024719853', '涂蕾', '2016-01-22 14:41:42', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14534477559218115', '张家吉', '2016-01-22 15:29:15', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14536870100417537', '涂蕾', '2016-01-25 09:56:50', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14536900307402235', '涂蕾', '2016-01-25 10:47:10', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14536928563746462', '涂蕾', '2016-01-25 11:34:16', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('1453697142271995', '涂蕾', '2016-01-25 12:45:42', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('1453702952368731', '涂蕾', '2016-01-25 14:22:32', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537056587098323', '文友同', '2016-01-25 15:07:38', '192.168.1.100', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14537056994195572', '涂蕾', '2016-01-25 15:08:19', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537064773609431', 'admin', '2016-01-25 15:21:17', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537067139598719', '文友同', '2016-01-25 15:25:13', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537083666966914', '涂蕾', '2016-01-25 15:52:46', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537088573793052', '文友同', '2016-01-25 16:00:57', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537089033843528', '涂蕾', '2016-01-25 16:01:43', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537100048712227', '张家吉', '2016-01-25 16:20:04', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537119532985957', '涂蕾', '2016-01-25 16:52:33', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537788391658316', '涂蕾', '2016-01-26 11:27:19', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537905321965370', '张家吉', '2016-01-26 14:42:12', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537930540663680', '张家吉', '2016-01-26 15:24:14', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537957923707577', '涂蕾', '2016-01-26 16:09:52', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14537958442083706', '张家吉', '2016-01-26 16:10:44', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14538036049227103', '张家吉', '2016-01-26 18:20:04', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14538791899687836', '涂蕾', '2016-01-27 15:19:49', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14539462259467713', '涂蕾', '2016-01-28 09:57:05', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14539714818459660', '张家吉', '2016-01-28 16:58:01', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14539714869157637', '涂蕾', '2016-01-28 16:58:06', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14542939747538294', '涂蕾', '2016-02-01 10:32:54', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14543779471111639', '涂蕾', '2016-02-02 09:52:27', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14543801047198832', '涂蕾', '2016-02-02 10:28:24', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14543861944558628', '张家吉', '2016-02-02 12:09:54', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14543878422867350', '张家吉', '2016-02-02 12:37:22', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14546413126546507', '张家吉', '2016-02-05 11:01:52', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14556762761395236', '涂蕾', '2016-02-17 10:31:16', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14556789199388065', '张家吉', '2016-02-17 11:15:19', '192.168.1.119', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14556789456636450', '张家吉', '2016-02-17 11:15:45', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14556890610179988', '张家吉', '2016-02-17 14:04:21', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14557630922262047', '张家吉', '2016-02-18 10:38:12', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14557639861083366', '涂蕾', '2016-02-18 10:53:06', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14557648347187658', '张家吉', '2016-02-18 11:07:14', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14561961383939339', '张家吉', '2016-02-23 10:55:38', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14561964653835351', '涂蕾', '2016-02-23 11:01:05', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14562094368374520', '涂蕾', '2016-02-23 14:37:16', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14563635944358972', '涂蕾', '2016-02-25 09:26:34', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14563685046226875', '涂蕾', '2016-02-25 10:48:24', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14564506893264101', '张家吉', '2016-02-26 09:38:09', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('1456452726533422', '涂蕾', '2016-02-26 10:12:06', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14564594885841818', '王晓云', '2016-02-26 12:04:48', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14564676477739598', '涂蕾', '2016-02-26 14:20:47', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('1456469308115807', '王晓云', '2016-02-26 14:48:28', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('1456469610748227', 'admin', '2016-02-26 14:53:30', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14564698043649592', 'admin', '2016-02-26 14:56:44', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14564731087168308', '涂蕾', '2016-02-26 15:51:48', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14564731500276690', 'admin', '2016-02-26 15:52:30', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14567078147812694', '涂蕾', '2016-02-29 09:03:34', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14567089917228746', '涂蕾', '2016-02-29 09:23:11', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14567093223108191', '王晓云', '2016-02-29 09:28:42', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14567111675749077', '涂蕾', '2016-02-29 09:59:27', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14567280961282812', '涂蕾', '2016-02-29 14:41:36', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14568149162198073', '涂蕾', '2016-03-01 14:48:36', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14569686924625652', '王晓云', '2016-03-03 09:31:32', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14569687539996485', '王晓云', '2016-03-03 09:32:33', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14569687804547284', '王晓云', '2016-03-03 09:33:00', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14569688083303549', '王晓云', '2016-03-03 09:33:28', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14569698509289455', '涂蕾', '2016-03-03 09:50:50', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14570525459675445', '王晓云', '2016-03-04 08:49:05', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14570567153082173', '涂蕾', '2016-03-04 09:58:35', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14570581224713903', '张家吉', '2016-03-04 10:22:02', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14570606188374819', '涂蕾', '2016-03-04 11:03:38', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('1457072839465976', '王晓云', '2016-03-04 14:27:19', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573123961898096', '张家吉', '2016-03-07 08:59:56', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573153841771242', '文友同', '2016-03-07 09:49:44', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573154717593235', '张家吉', '2016-03-07 09:51:11', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573162318596039', '涂蕾', '2016-03-07 10:03:51', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573163065334338', '张家吉', '2016-03-07 10:05:06', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573192311239381', '文友同', '2016-03-07 10:53:51', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573196980336874', '王晓云', '2016-03-07 11:01:38', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('1457319765073184', '张家吉', '2016-03-07 11:02:45', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573205671545684', '张家吉', '2016-03-07 11:16:07', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573215120851685', '涂蕾', '2016-03-07 11:31:52', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573220289207347', '王晓云', '2016-03-07 11:40:28', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573234173949833', '文友同', '2016-03-07 12:03:37', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573244869138179', '张家吉', '2016-03-07 12:21:26', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573277912504584', '张家吉', '2016-03-07 13:16:31', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573384065033764', '王晓云', '2016-03-07 16:13:26', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573390771751565', '王晓云', '2016-03-07 16:24:37', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573391313425197', 'admin', '2016-03-07 16:25:31', '192.168.1.196', '登录成功');
INSERT INTO `t_login_log` VALUES ('14573992660408500', '涂蕾', '2016-03-08 09:07:46', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574013887639237', '张家吉', '2016-03-08 09:43:08', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574047792798299', '张家吉', '2016-03-08 10:39:39', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574062955596056', '张家吉', '2016-03-08 11:04:55', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574087570989501', '张家吉', '2016-03-08 11:45:57', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574090746313732', '张家吉', '2016-03-08 11:51:14', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574108060913726', '张家吉', '2016-03-08 12:20:06', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574142937467652', '张家吉', '2016-03-08 13:18:13', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574159808425526', '张家吉', '2016-03-08 13:46:20', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574868737448300', '张家吉', '2016-03-09 09:27:53', '192.168.1.127', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574874073017535', '涂蕾', '2016-03-09 09:36:47', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14574904370592687', '涂蕾', '2016-03-09 10:27:17', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14575050931551067', '涂蕾', '2016-03-09 14:31:33', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14575797021015600', '涂蕾', '2016-03-10 11:15:02', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('1457659482365882', '涂蕾', '2016-03-11 09:24:42', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576635216091065', '涂蕾', '2016-03-11 10:32:01', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576779322085622', 'admin', '2016-03-11 14:32:12', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576780985364269', '王晓云', '2016-03-11 14:34:58', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1457679550887694', '王晓云', '2016-03-11 14:59:10', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576798116495243', '涂蕾', '2016-03-11 15:03:31', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576800244922469', '王晓云', '2016-03-11 15:07:04', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576805129268615', '王晓云', '2016-03-11 15:15:12', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576808232104574', '王晓云', '2016-03-11 15:20:23', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576810179768091', '王晓云', '2016-03-11 15:23:37', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14576814148745979', '王晓云', '2016-03-11 15:30:14', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14579164967963859', '涂蕾', '2016-03-14 08:48:16', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14579171166659613', '涂蕾', '2016-03-14 08:58:36', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14579182579946931', '王晓云', '2016-03-14 09:17:37', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14579192281514705', '王晓云', '2016-03-14 09:33:48', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14579228156069065', '涂蕾', '2016-03-14 10:33:35', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14579263364667422', '涂蕾', '2016-03-14 11:32:16', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14579360916607860', '涂蕾', '2016-03-14 14:14:51', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14580019773261321', '涂蕾', '2016-03-15 08:32:57', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14580064964208071', '涂蕾', '2016-03-15 09:48:16', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14580888317733090', '涂蕾', '2016-03-16 08:40:31', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14580902876884232', '涂蕾', '2016-03-16 09:04:47', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14580913120727022', '张家吉', '2016-03-16 09:21:52', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14580915715745318', '涂蕾', '2016-03-16 09:26:11', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14580944900428491', '涂蕾', '2016-03-16 10:14:50', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14581153362685439', '张家吉', '2016-03-16 16:02:16', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14581155024753418', '张家吉', '2016-03-16 16:05:02', '192.168.1.100', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14581155225804385', '张家吉', '2016-03-16 16:05:22', '192.168.1.100', '登录成功');
INSERT INTO `t_login_log` VALUES ('14581802823444443', '涂蕾', '2016-03-17 10:04:42', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14582729449227662', '涂蕾', '2016-03-18 11:49:04', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14585331986361818', '涂蕾', '2016-03-21 12:06:38', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14585445082704198', '涂蕾', '2016-03-21 15:15:08', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14585474600349846', '张家吉', '2016-03-21 16:04:20', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14585492234448163', '张家吉', '2016-03-21 16:33:43', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14586069777996261', '涂蕾', '2016-03-22 08:36:17', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14586099647229181', '张家吉', '2016-03-22 09:26:04', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14586100575933285', '张家吉', '2016-03-22 09:27:37', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14586101142714883', '张家吉', '2016-03-22 09:28:34', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14586944741007473', '涂蕾', '2016-03-23 08:54:34', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14586961116993579', '张家吉', '2016-03-23 09:21:51', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14586972424112577', '涂蕾', '2016-03-23 09:40:42', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14587167078955593', '张家吉', '2016-03-23 15:05:07', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14587203742294421', '涂蕾', '2016-03-23 16:06:14', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14587837164378093', '张家吉', '2016-03-24 09:41:56', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14588776078867465', '涂蕾', '2016-03-25 11:46:47', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14591349317196393', '张家吉', '2016-03-28 11:15:31', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14591355625759353', '王晓云', '2016-03-28 11:26:02', '192.168.1.107', '登录成功');
INSERT INTO `t_login_log` VALUES ('14591360508635635', '王晓云', '2016-03-28 11:34:10', '192.168.1.107', '登录成功');
INSERT INTO `t_login_log` VALUES ('14591361363273856', '王晓云', '2016-03-28 11:35:36', '192.168.1.107', '登录成功');
INSERT INTO `t_login_log` VALUES ('14593218188539309', '涂蕾', '2016-03-30 15:10:18', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14593923298773169', '涂蕾', '2016-03-31 10:45:29', '192.168.1.155', '登录成功');
INSERT INTO `t_login_log` VALUES ('14598199348976526', '王晓云', '2016-04-05 09:32:14', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('14598260842119082', '王晓云', '2016-04-05 11:14:44', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599068167494418', '涂蕾', '2016-04-06 09:40:16', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599074330762372', '张家吉', '2016-04-06 09:50:33', '192.168.1.132', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599108045463361', '文友同', '2016-04-06 10:46:44', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599110046374868', '文友同', '2016-04-06 10:50:04', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599120208921605', '涂lei', '2016-04-06 11:07:00', '192.168.1.130', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14599120363211220', '涂蕾', '2016-04-06 11:07:16', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599133421516443', '王晓云', '2016-04-06 11:29:02', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599143047367661', '文友同', '2016-04-06 11:45:04', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599155151553570', '文友同', '2016-04-06 12:05:15', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599238106454883', '文友同', '2016-04-06 14:23:30', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599250823812791', '涂蕾', '2016-04-06 14:44:42', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599259612257567', '王晓云', '2016-04-06 14:59:21', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('1459926856309069', '王晓云', '2016-04-06 15:14:16', '192.168.1.111', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599276183907562', '涂lei', '2016-04-06 15:26:58', '192.168.1.130', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('1459927634436510', '涂蕾', '2016-04-06 15:27:14', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599917188978865', '王桢', '2016-04-07 09:15:18', '192.168.1.133', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599917753003470', '涂蕾', '2016-04-07 09:16:15', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14599978320234798', '涂蕾', '2016-04-07 10:57:12', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('1460076843396435', '涂蕾', '2016-04-08 08:54:03', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14600799118872165', '涂蕾', '2016-04-08 09:45:11', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14603363343631569', '涂蕾', '2016-04-11 08:58:54', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14603364155941820', '王桢', '2016-04-11 09:00:15', '192.168.1.133', '登录成功');
INSERT INTO `t_login_log` VALUES ('14603426667355701', '王桢', '2016-04-11 10:44:26', '192.168.1.133', '登录成功');
INSERT INTO `t_login_log` VALUES ('14603426940091937', '王桢', '2016-04-11 10:44:54', '192.168.1.133', '登录成功');
INSERT INTO `t_login_log` VALUES ('14605087099097652', 'tulei', '2016-04-13 08:51:49', '192.168.1.122', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14605087170478762', 'tulei', '2016-04-13 08:51:57', '192.168.1.122', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14605087303304265', '涂蕾', '2016-04-13 08:52:10', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14605133717204667', '涂蕾', '2016-04-13 10:09:31', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14605291866314775', '涂蕾', '2016-04-13 14:33:06', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1460534122283855', '王晓云', '2016-04-13 15:55:22', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14605344693741193', '王桢', '2016-04-13 16:01:09', '192.168.1.133', '登录成功');
INSERT INTO `t_login_log` VALUES ('14605346940933697', '文友同', '2016-04-13 16:04:54', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14605347460802973', '王桢', '2016-04-13 16:05:46', '192.168.1.133', '登录成功');
INSERT INTO `t_login_log` VALUES ('14605350949388085', '文友同', '2016-04-13 16:11:34', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14606149773908982', '涂蕾', '2016-04-14 14:22:57', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14606178801486387', '张家吉', '2016-04-14 15:11:20', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14606200261205139', '张家吉', '2016-04-14 15:47:06', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14606833625587852', '张家吉', '2016-04-15 09:22:42', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14606868108192976', '涂蕾', '2016-04-15 10:20:10', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14609430752457737', '张家吉', '2016-04-18 09:31:15', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14610300945982941', '张家吉', '2016-04-19 09:41:34', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14610334636619568', '涂蕾', '2016-04-19 10:37:43', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14610340030173174', '张家吉', '2016-04-19 10:46:43', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14610491653898337', '涂蕾', '2016-04-19 14:59:25', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14611189044298116', '王晓云', '2016-04-20 10:21:44', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14611992430312541', '王桢', '2016-04-21 08:40:43', '192.168.1.115', '登录成功');
INSERT INTO `t_login_log` VALUES ('14611993425136945', '王晓云', '2016-04-21 08:42:22', '192.168.1.115', '登录成功');
INSERT INTO `t_login_log` VALUES ('14611999497951483', '涂蕾', '2016-04-21 08:52:29', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14612062680206675', '涂蕾', '2016-04-21 10:37:48', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14612863894279216', 'tul涂蕾', '2016-04-22 08:53:09', '192.168.1.122', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('1461286400939472', '涂蕾 ', '2016-04-22 08:53:20', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1461291148335871', '涂蕾', '2016-04-22 10:12:28', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14612960402577688', '张家吉', '2016-04-22 11:34:00', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14612969406934267', '涂蕾', '2016-04-22 11:49:00', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14615518699501813', '涂蕾', '2016-04-25 10:37:49', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14615552318959880', '涂蕾', '2016-04-25 11:33:51', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1461565998941958', '涂蕾', '2016-04-25 14:33:18', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14615696200631855', '张家吉', '2016-04-25 15:33:40', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14615698410423900', '涂蕾', '2016-04-25 15:37:21', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14615708602398826', '涂蕾', '2016-04-25 15:54:20', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14616566247806939', '王晓云', '2016-04-26 15:43:44', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617201055822237', '涂蕾', '2016-04-27 09:21:45', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617230658944660', '涂蕾', '2016-04-27 10:11:05', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617234823414858', '文友同', '2016-04-27 10:18:02', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617254682646542', '王晓云', '2016-04-27 10:51:08', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617262048489688', '张家吉', '2016-04-27 11:03:24', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617275693884419', '文友同', '2016-04-27 11:26:09', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617286408623942', '涂蕾', '2016-04-27 11:44:00', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617412855399675', '涂蕾', '2016-04-27 15:14:45', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617450261713431', '涂蕾', '2016-04-27 16:17:06', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617455992313239', '涂蕾', '2016-04-27 16:26:39', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14617490433634018', '张家吉', '2016-04-27 17:24:03', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14618096812441303', '涂蕾', '2016-04-28 10:14:41', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14618146769969146', '涂蕾', '2016-04-28 11:37:56', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14618155683459237', '王晓云', '2016-04-28 11:52:48', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14618243134629750', '涂蕾', '2016-04-28 14:18:33', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14618927314743465', '张家吉', '2016-04-29 09:18:51', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14618939650246898', '涂蕾', '2016-04-29 09:39:25', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1461898714313992', '涂蕾', '2016-04-29 10:58:34', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14619106414245282', 'tulei', '2016-04-29 14:17:21', '192.168.1.122', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14619106493448559', '涂蕾', '2016-04-29 14:17:29', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14619107739426492', '张家吉', '2016-04-29 14:19:33', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14619121304413261', '张家吉', '2016-04-29 14:42:10', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14619188749426898', '涂蕾', '2016-04-29 16:34:34', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14622399264143534', '涂蕾', '2016-05-03 09:45:26', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14622626554241968', '张家吉', '2016-05-03 16:04:15', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14622630766811899', '王晓云', '2016-05-03 16:11:16', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14622631376221748', '王晓云', '2016-05-03 16:12:17', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14623257809941948', '张家吉', '2016-05-04 09:36:20', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14623266929932801', '涂蕾', '2016-05-04 09:51:32', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14623477445249690', '张家吉', '2016-05-04 15:42:24', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14623501563737255', '张家吉', '2016-05-04 16:22:36', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14624099229203369', '涂蕾', '2016-05-05 08:58:42', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14624103167788285', '文友同', '2016-05-05 09:05:16', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14624105584362984', '张家吉', '2016-05-05 09:09:18', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14624122607959515', '张家吉', '2016-05-05 09:37:40', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14624152982068296', '涂蕾', '2016-05-05 10:28:18', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14624181217537285', '涂蕾', '2016-05-05 11:15:21', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1462497210279511', '涂蕾', '2016-05-06 09:13:30', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14627570076829355', '王晓云', '2016-05-09 09:23:27', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14627584214715830', '涂蕾', '2016-05-09 09:47:01', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1462760936737882', '涂蕾', '2016-05-09 10:28:56', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14627631251317595', '涂蕾', '2016-05-09 11:05:25', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14627759500704382', '涂蕾', '2016-05-09 14:39:10', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14628410889064500', '涂蕾', '2016-05-10 08:44:48', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1462847300364156', '涂蕾', '2016-05-10 10:28:20', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14629324254874721', '王晓云', '2016-05-11 10:07:05', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14629498664668162', '涂蕾', '2016-05-11 14:57:46', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14629506509296670', '文友同', '2016-05-11 15:10:50', '192.168.1.129', '登录成功');
INSERT INTO `t_login_log` VALUES ('14629522691048584', '涂蕾', '2016-05-11 15:37:49', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14629541644925543', '文友同', '2016-05-11 16:09:24', '192.168.1.129', '登录成功');
INSERT INTO `t_login_log` VALUES ('14630138422098592', '涂蕾', '2016-05-12 08:44:02', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14630177742271116', '涂蕾', '2016-05-12 09:49:34', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14630211654395958', '涂蕾', '2016-05-12 10:46:05', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1463043093410218', 'admin', '2016-05-12 16:51:33', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1463104314481724', '涂蕾', '2016-05-13 09:51:54', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14631221309611669', '王晓晕', '2016-05-13 14:48:50', '192.168.1.117', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14631221603989882', '王晓云', '2016-05-13 14:49:20', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14631230294441989', '王晓云', '2016-05-13 15:03:49', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633599993296203', '涂蕾', '2016-05-16 08:53:19', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633676693638125', '张家吉', '2016-05-16 11:01:09', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633677750535699', '张家吉', '2016-05-16 11:02:55', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633680876475248', '张家吉', '2016-05-16 11:08:07', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633705401749371', 'admin', '2016-05-16 11:49:00', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('1463370726797604', 'admin', '2016-05-16 11:52:06', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633708656375477', 'admin', '2016-05-16 11:54:25', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633711190285396', 'admin', '2016-05-16 11:58:39', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633824534003390', '张家吉', '2016-05-16 15:07:33', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14633826990228964', '涂蕾', '2016-05-16 15:11:39', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14634469039308911', '涂蕾', '2016-05-17 09:01:43', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14634483041118274', '张家吉', '2016-05-17 09:25:04', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14634487779775025', '涂蕾', '2016-05-17 09:32:57', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14634571837714341', '涂蕾', '2016-05-17 11:53:03', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14634727902105426', '涂蕾', '2016-05-17 16:13:10', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14635347299015705', '涂蕾', '2016-05-18 09:25:29', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14635396007918716', '涂蕾', '2016-05-18 10:46:40', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14635426590361707', '涂蕾', '2016-05-18 11:37:39', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14635558889048162', '涂蕾', '2016-05-18 15:18:08', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14635599413232741', '张家吉', '2016-05-18 16:25:41', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14636306037077740', '张家吉', '2016-05-19 12:03:23', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14636421052323715', '涂蕾', '2016-05-19 15:15:05', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14637255787338933', '张家吉', '2016-05-20 14:26:18', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14639648682081635', '涂蕾', '2016-05-23 08:54:28', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14640529507671214', 'tulei', '2016-05-24 09:22:30', '192.168.1.122', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14640529807822924', '涂蕾', '2016-05-24 09:23:00', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14641439555719149', '张家吉', '2016-05-25 10:39:15', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14641633011803356', '涂蕾', '2016-05-25 16:01:41', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14642296497501076', '张家吉', '2016-05-26 10:27:29', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14642339957156986', '涂蕾', '2016-05-26 11:39:55', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14643147574948949', '涂蕾', '2016-05-27 10:05:57', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14645706475199429', '涂蕾', '2016-05-30 09:10:47', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1464741131358261', '涂蕾', '2016-06-01 08:32:11', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14647425547517665', '涂蕾', '2016-06-01 08:55:54', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14647460590168217', '涂蕾', '2016-06-01 09:54:19', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14648297378292303', '涂蕾', '2016-06-02 09:08:57', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1465175098465141', '涂蕾', '2016-06-06 09:04:58', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14651780828134031', '王晓云', '2016-06-06 09:54:42', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14651781307058083', '王晓云', '2016-06-06 09:55:30', '192.168.1.117', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14651781582861639', '王晓云', '2016-06-06 09:55:58', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14651785033273887', '王晓云', '2016-06-06 10:01:43', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14651796667933505', '涂蕾', '2016-06-06 10:21:06', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14653699648504363', '涂蕾', '2016-06-08 15:12:44', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14653704916163934', '文友同', '2016-06-08 15:21:31', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('14656934490075156', '涂蕾', '2016-06-12 09:04:09', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('1465703377114536', '文友同', '2016-06-12 11:49:37', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('14657041788622598', '文友同', '2016-06-12 12:02:58', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('14657149523086380', '涂蕾', '2016-06-12 15:02:32', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14657170586543301', '文友同', '2016-06-12 15:37:38', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('1465721023121724', '文友同', '2016-06-12 16:43:43', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('14657787948274867', '文友同', '2016-06-13 08:46:34', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('14657794549739147', '涂蕾', '2016-06-13 08:57:34', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14657989276725101', '文友同', '2016-06-13 14:22:07', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658001695434315', '王晓云', '2016-06-13 14:42:49', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658003482885321', '王晓云', '2016-06-13 14:45:48', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658003801595109', '王晓云', '2016-06-13 14:46:20', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658004987828094', '王晓云', '2016-06-13 14:48:18', '192.168.1.117', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658008208605960', '涂蕾', '2016-06-13 14:53:40', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658047964802839', '文友同', '2016-06-13 15:59:56', '192.168.1.123', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658693105033460', '涂蕾', '2016-06-14 09:55:10', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658699058005884', '文友同', '2016-06-14 10:05:05', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14658737495684560', '涂蕾', '2016-06-14 11:09:09', '192.168.1.122', '登录成功');
INSERT INTO `t_login_log` VALUES ('14659563116671362', '涂蕾', '2016-06-15 10:05:11', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14659612199355624', '涂蕾', '2016-06-15 11:26:59', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14660408890418616', '涂蕾', '2016-06-16 09:34:49', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14660438386638212', '涂蕾', '2016-06-16 10:23:58', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14660468178316049', '涂蕾', '2016-06-16 11:13:37', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14660577521407795', '涂蕾', '2016-06-16 14:15:52', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14660622898457786', '涂蕾', '2016-06-16 15:31:29', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14663865876608334', '涂蕾', '2016-06-20 09:36:27', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14664059857489829', '涂蕾', '2016-06-20 14:59:45', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14664694073164433', '涂蕾', '2016-06-21 08:36:47', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14665666402438016', '涂蕾', '2016-06-22 11:37:20', '192.168.1.104', '登录成功');
INSERT INTO `t_login_log` VALUES ('14667378893574963', '涂蕾', '2016-06-24 11:11:29', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('1466995420124149', '涂蕾', '2016-06-27 10:43:40', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14670156800985611', '涂蕾', '2016-06-27 16:21:20', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14670758085471988', '涂蕾', '2016-06-28 09:03:28', '192.168.1.101', '登录成功');
INSERT INTO `t_login_log` VALUES ('14670763150334726', '王晓云', '2016-06-28 09:11:55', '192.168.1.106', '登录成功');
INSERT INTO `t_login_log` VALUES ('14671856187598603', '文友同', '2016-06-29 15:33:38', '192.168.1.120', '登录成功');
INSERT INTO `t_login_log` VALUES ('14673526805607207', '涂蕾', '2016-07-01 13:58:00', '192.168.1.121', '登录成功');
INSERT INTO `t_login_log` VALUES ('14675939806923592', '涂蕾', '2016-07-04 08:59:40', '192.168.1.103', '登录成功');
INSERT INTO `t_login_log` VALUES ('14678557848403104', '涂蕾', '2016-07-07 09:43:04', '192.168.1.112', '登录成功');
INSERT INTO `t_login_log` VALUES ('14678735054893689', '文友同', '2016-07-07 14:38:25', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14678735495908683', '涂蕾', '2016-07-07 14:39:09', '192.168.1.112', '登录成功');
INSERT INTO `t_login_log` VALUES ('14682971152971048', '文友同', '2016-07-12 12:18:35', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14682981116636609', '张家吉', '2016-07-12 12:35:11', '192.168.1.102', '登录成功');
INSERT INTO `t_login_log` VALUES ('14684612935816014', '王晓云', '2016-07-14 09:54:53', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14688102920283101', '涂蕾', '2016-07-18 10:51:32', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14688221245084872', '文友同', '2016-07-18 14:08:44', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('1468823639131542', '涂蕾', '2016-07-18 14:33:59', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14688259088723175', '涂蕾', '2016-07-18 15:11:48', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('1468890341416719', '王晓云', '2016-07-19 09:05:41', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14688903702605113', '王晓云', '2016-07-19 09:06:10', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14688924055021119', '王晓云', '2016-07-19 09:40:05', '192.168.1.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14688932568111798', 'J18082686', '2016-07-19 09:54:16', '192.168.1.114', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14688933171991705', 'J18082686', '2016-07-19 09:55:17', '192.168.1.114', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14688937354208201', 'J18082686', '2016-07-19 10:02:15', '192.168.1.114', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14688980125428735', '涂蕾', '2016-07-19 11:13:32', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14689088679935640', '涂蕾', '2016-07-19 14:14:27', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14689116287768476', '涂蕾', '2016-07-19 15:00:28', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14689116517868898', '涂蕾', '2016-07-19 15:00:51', '192.168.1.130', '登录成功');
INSERT INTO `t_login_log` VALUES ('14689118881117832', '文友同', '2016-07-19 15:04:48', '192.168.1.105', '登录成功');
INSERT INTO `t_login_log` VALUES ('14694946039861552', 'admin', '2016-07-26 08:56:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1469497071888570', 'admin', '2016-07-26 09:37:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14695175589393737', 'admin', '2016-07-26 15:19:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14709942207203011', 'admin', '2016-08-12 17:30:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14709946758796744', 'admin', '2016-08-12 17:37:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14709947829656040', 'admin', '2016-08-12 17:39:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14709964337891473', 'admin', '2016-08-12 18:07:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14709965978717456', 'admin', '2016-08-12 18:09:57', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1471163957023470', 'admin', '2016-08-14 16:39:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14711654394474184', '张家吉', '2016-08-14 17:03:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1471166443565843', 'admin', '2016-08-14 17:20:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1474419613592117', 'admin', '2016-09-21 09:00:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14744196145751002', 'admin', '2016-09-21 09:00:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14753709549171829', 'admin', '2016-10-02 09:15:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14753724659095517', 'admin', '2016-10-02 09:41:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14753727562259953', 'admin', '2016-10-02 09:45:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14753733840073553', 'admin', '2016-10-02 09:56:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14754698718936186', 'admin', '2016-10-03 12:44:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14754703217455956', 'admin', '2016-10-03 12:52:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14754735467521398', 'admin', '2016-10-03 13:45:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14754738436869150', 'admin', '2016-10-03 13:50:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14758214056038682', 'admin', '2016-10-07 14:23:25', '0:0:0:0:0:0:0:1', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14758214248915411', 'admin', '2016-10-07 14:23:44', '0:0:0:0:0:0:0:1', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14758214351361520', 'admin', '2016-10-07 14:23:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14771183567122308', 'admin', '2016-10-22 14:39:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14771214902835336', 'admin', '2016-10-22 15:31:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14771215510425997', 'admin', '2016-10-22 15:32:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772271278939458', 'admin', '2016-10-23 20:52:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772271556853818', 'admin', '2016-10-23 20:52:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772827833104046', '涂蕾', '2016-10-24 12:19:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772828334399302', '王晓云', '2016-10-24 12:20:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772840487477287', 'admin', '2016-10-24 12:40:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772846112101043', 'admin', '2016-10-24 12:50:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772848051477930', 'admin', '2016-10-24 12:53:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772856236145528', 'admin', '2016-10-24 13:07:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772862120593772', 'admin', '2016-10-24 13:16:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772873008482209', 'admin', '2016-10-24 13:35:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772873418978741', 'admin', '2016-10-24 13:35:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772873752191897', 'admin', '2016-10-24 13:36:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14772874760779320', 'admin', '2016-10-24 13:37:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14773156287279777', 'admin', '2016-10-24 21:27:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14773649425594042', 'admin', '2016-10-25 11:09:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14773839710404459', 'admin', '2016-10-25 16:26:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774638237479255', 'admin', '2016-10-26 14:37:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774722407328900', 'admin', '2016-10-26 16:57:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774777627279231', 'admin', '2016-10-26 18:29:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774779708174216', 'admin', '2016-10-26 18:32:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774782998236832', 'admin', '2016-10-26 18:38:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774789610049541', 'admin', '2016-10-26 18:49:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774791634866486', 'admin', '2016-10-26 18:52:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774831545348628', 'admin', '2016-10-26 19:59:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774833077388603', 'admin', '2016-10-26 20:01:47', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774838434525800', 'admin', '2016-10-26 20:10:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774839908184912', 'admin', '2016-10-26 20:13:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14774865464191916', 'admin', '2016-10-26 20:55:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775432526826220', 'admin', '2016-10-27 12:40:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775438784423473', 'admin', '2016-10-27 12:51:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775532974886187', 'admin', '2016-10-27 15:28:17', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775533736774544', 'admin', '2016-10-27 15:29:33', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775536479806265', 'admin', '2016-10-27 15:34:07', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775536532133548', 'admin', '2016-10-27 15:34:13', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775537210074542', 'admin', '2016-10-27 15:35:21', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775551803283095', 'admin', '2016-10-27 15:59:40', '0:0:0:0:0:0:0:1', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14775551998808876', 'admin', '2016-10-27 15:59:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775554417804691', 'admin', '2016-10-27 16:04:01', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775555485687606', 'admin', '2016-10-27 16:05:48', '172.16.12.119', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14775555643234921', 'admin', '2016-10-27 16:06:04', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775556360911917', 'admin', '2016-10-27 16:07:16', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775763865746385', 'admin', '2016-10-27 21:53:06', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775764269229455', 'admin', '2016-10-27 21:53:46', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775775539985828', 'admin', '2016-10-27 22:12:33', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14775776757358828', 'admin', '2016-10-27 22:14:35', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776199148404718', 'admin', '2016-10-28 09:58:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776201562933729', 'admin', '2016-10-28 10:02:36', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776207122784374', 'admin', '2016-10-28 10:11:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477621189462478', 'admin', '2016-10-28 10:19:49', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776232901742379', 'admin', '2016-10-28 10:54:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776234933522366', 'admin', '2016-10-28 10:58:13', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776235182029574', 'admin', '2016-10-28 10:58:38', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776235359935520', 'admin', '2016-10-28 10:58:55', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776238471532938', 'admin', '2016-10-28 11:04:07', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776410872685144', 'admin', '2016-10-28 15:51:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776417634165298', 'admin', '2016-10-28 16:02:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776434363454442', 'admin', '2016-10-28 16:30:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776443903427922', 'admin', '2016-10-28 16:46:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776449215645263', 'admin', '2016-10-28 16:55:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776452242727185', 'admin', '2016-10-28 17:00:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776454760835109', 'admin', '2016-10-28 17:04:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776458663198824', 'admin', '2016-10-28 17:11:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776461962902452', 'admin', '2016-10-28 17:16:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776463598537753', 'admin', '2016-10-28 17:19:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776467603676033', 'admin', '2016-10-28 17:26:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776507432375009', 'admin', '2016-10-28 18:32:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776510758105464', 'admin', '2016-10-28 18:37:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776515678198123', 'admin', '2016-10-28 18:46:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776518522646284', 'admin', '2016-10-28 18:50:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477652078922467', 'admin', '2016-10-28 18:54:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776520792733818', 'admin', '2016-10-28 18:54:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776523031245946', 'admin', '2016-10-28 18:58:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776533970666274', 'admin', '2016-10-28 19:16:37', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776542045503502', 'admin', '2016-10-28 19:30:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776543689641074', 'admin', '2016-10-28 19:32:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776548791715169', 'admin', '2016-10-28 19:41:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776555724271625', 'admin', '2016-10-28 19:52:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776565938765009', 'admin', '2016-10-28 20:09:53', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776566954405420', 'admin', '2016-10-28 20:11:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776567680205088', 'admin', '2016-10-28 20:12:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776569723802532', 'admin', '2016-10-28 20:16:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776572987262244', 'admin', '2016-10-28 20:21:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477657405301396', 'admin', '2016-10-28 20:23:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776576482794216', 'admin', '2016-10-28 20:27:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776592521259678', 'admin', '2016-10-28 20:54:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477661483847379', 'admin', '2016-10-28 21:31:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776617641282560', 'admin', '2016-10-28 21:36:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776619724708902', 'admin', '2016-10-28 21:39:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776622734657274', 'admin', '2016-10-28 21:44:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776625282415692', 'admin', '2016-10-28 21:48:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776628107836174', 'admin', '2016-10-28 21:53:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776630010695597', 'admin', '2016-10-28 21:56:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776643365817010', 'admin', '2016-10-28 22:18:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776648316325050', 'admin', '2016-10-28 22:27:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14776653095817427', 'admin', '2016-10-28 22:35:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777122000693922', 'admin', '2016-10-29 11:36:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777123203661358', 'admin', '2016-10-29 11:38:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777126119699763', 'admin', '2016-10-29 11:43:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777126280182397', 'admin', '2016-10-29 11:43:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777130509311639', 'admin', '2016-10-29 11:50:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777131201207625', 'admin', '2016-10-29 11:52:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777142178419753', 'admin', '2016-10-29 12:10:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777144844933406', 'admin', '2016-10-29 12:14:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777146484926246', 'admin', '2016-10-29 12:17:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777147706073471', 'admin', '2016-10-29 12:19:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777148284809152', 'admin', '2016-10-29 12:20:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777153899507380', 'admin', '2016-10-29 12:29:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777157325551326', 'admin', '2016-10-29 12:35:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777158269051271', 'admin', '2016-10-29 12:37:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777159042133834', 'admin', '2016-10-29 12:38:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777160628798336', 'admin', '2016-10-29 12:41:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777161822671703', 'admin', '2016-10-29 12:43:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777162494083770', 'admin', '2016-10-29 12:44:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777163345939560', 'admin', '2016-10-29 12:45:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777164631952406', 'admin', '2016-10-29 12:47:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777166618221946', 'admin', '2016-10-29 12:51:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777167816546511', 'admin', '2016-10-29 12:53:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777168504284756', 'admin', '2016-10-29 12:54:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777171545824339', 'admin', '2016-10-29 12:59:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777171549059026', 'admin', '2016-10-29 12:59:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777173302531161', 'admin', '2016-10-29 13:02:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777179479874703', 'admin', '2016-10-29 13:12:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777181033757612', 'admin', '2016-10-29 13:15:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777182043442203', 'admin', '2016-10-29 13:16:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777186192909500', 'admin', '2016-10-29 13:23:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777187291954255', 'admin', '2016-10-29 13:25:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777189474972202', 'admin', '2016-10-29 13:29:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477719054332673', 'admin', '2016-10-29 13:30:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777192092187177', 'admin', '2016-10-29 13:33:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777194142896086', 'admin', '2016-10-29 13:36:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777195323479572', 'admin', '2016-10-29 13:38:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777197585236780', 'admin', '2016-10-29 13:42:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777200982162848', 'admin', '2016-10-29 13:48:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777210773148012', 'admin', '2016-10-29 14:04:37', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777213095561415', 'admin', '2016-10-29 14:08:29', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777217176364181', 'admin', '2016-10-29 14:15:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777217854182564', 'admin', '2016-10-29 14:16:25', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777225710491882', 'admin', '2016-10-29 14:29:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777229299762247', 'admin', '2016-10-29 14:35:29', '172.16.12.119', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777234700505559', 'admin', '2016-10-29 14:44:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477723531432797', 'admin', '2016-10-29 14:45:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777238024092801', 'admin', '2016-10-29 14:50:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777242037005662', 'admin', '2016-10-29 14:56:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777262625048949', 'admin', '2016-10-29 15:31:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777269474558190', 'admin', '2016-10-29 15:42:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777295566602031', 'admin', '2016-10-29 16:25:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14777296457859901', 'admin', '2016-10-29 16:27:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14778119200094424', 'admin', '2016-10-30 15:18:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14778125564081252', 'admin', '2016-10-30 15:29:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14778168610445740', 'admin', '2016-10-30 16:41:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14778190205356753', 'admin', '2016-10-30 17:17:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14778826085554900', 'admin', '2016-10-31 10:56:48', '127.0.0.1', '鐧诲綍鎴愬姛');
INSERT INTO `t_login_log` VALUES ('14779063848695013', 'admin', '2016-10-31 17:33:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477906571710111', 'admin', '2016-10-31 17:36:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779120592683250', 'admin', '2016-10-31 19:07:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779133383512717', 'admin', '2016-10-31 19:28:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779142628251234', 'admin', '2016-10-31 19:44:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779149146907761', 'admin', '2016-10-31 19:55:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779199547506697', 'admin', '2016-10-31 21:19:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779649291725001', 'admin', '2016-11-01 09:48:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1477970902543279', 'admin', '2016-11-01 11:28:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779796167628184', 'admin', '2016-11-01 13:53:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779799395289609', 'admin', '2016-11-01 13:58:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779839458414974', 'admin', '2016-11-01 15:05:45', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779865834059052', 'admi', '2016-11-01 15:49:43', '0:0:0:0:0:0:0:1', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14779865890089157', 'admin', '2016-11-01 15:49:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779868855752745', 'admin', '2016-11-01 15:54:45', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779977549936578', 'admin', '2016-11-01 18:55:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779982428864755', 'admin', '2016-11-01 19:04:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779982534157824', 'admin', '2016-11-01 19:04:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779985759077081', 'admin', '2016-11-01 19:09:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779992082481968', 'admin', '2016-11-01 19:20:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779996597264051', 'admin', '2016-11-01 19:27:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14779997300782052', 'admin', '2016-11-01 19:28:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780001740619642', 'admin', '2016-11-01 19:36:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780006890752620', 'admin', '2016-11-01 19:44:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780011283927448', 'admin', '2016-11-01 19:52:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780017174559718', 'admin', '2016-11-01 20:01:57', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478003771256693', 'admin', '2016-11-01 20:36:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780037714566796', 'admin', '2016-11-01 20:36:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780041325936481', 'admin', '2016-11-01 20:42:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780065366149323', 'admin', '2016-11-01 21:22:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780068499677368', 'admin', '2016-11-01 21:27:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780085886264022', 'admin', '2016-11-01 21:56:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780095430673262', 'admin', '2016-11-01 22:12:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780099320577212', 'admin', '2016-11-01 22:18:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780106965055438', 'admin', '2016-11-01 22:31:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780523793603962', 'admin', '2016-11-02 10:06:19', '0:0:0:0:0:0:0:1', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14780524079719543', 'admin', '2016-11-02 10:06:47', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780526775787449', 'admin', '2016-11-02 10:11:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478053153855617', 'admin', '2016-11-02 10:19:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780542006985717', 'admin', '2016-11-02 10:36:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780554956703816', 'admin', '2016-11-02 10:58:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780560445823236', 'admin', '2016-11-02 11:07:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780564623172357', 'admin', '2016-11-02 11:14:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780566207516046', 'admin', '2016-11-02 11:17:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780578195745977', 'admin', '2016-11-02 11:36:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478057992920343', 'admin', '2016-11-02 11:39:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780592640741329', 'admin', '2016-11-02 12:01:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780621082928599', 'admin', '2016-11-02 12:48:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780644385891376', 'admin', '2016-11-02 13:27:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780652111128984', 'admin', '2016-11-02 13:40:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780661424355928', 'admin', '2016-11-02 13:55:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780662662866231', 'admin', '2016-11-02 13:57:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780666156615702', 'admin', '2016-11-02 14:03:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780670830089045', 'admin', '2016-11-02 14:11:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780681534432494', 'admin', '2016-11-02 14:29:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780685600836722', 'admin', '2016-11-02 14:36:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780689314562867', 'admin', '2016-11-02 14:42:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780690670813370', 'admin', '2016-11-02 14:44:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780692023229221', 'admin', '2016-11-02 14:46:42', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780698470167255', 'admin', '2016-11-02 14:57:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780698920846886', 'admin', '2016-11-02 14:58:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780702153374454', 'admin', '2016-11-02 15:03:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780705483542548', 'admin', '2016-11-02 15:09:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780707295453001', 'admin', '2016-11-02 15:12:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478071222963482', 'admin', '2016-11-02 15:20:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780715499466568', 'admin', '2016-11-02 15:25:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780720790361437', 'admin', '2016-11-02 15:34:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478072443474397', 'admin', '2016-11-02 15:40:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780727124483775', 'admin', '2016-11-02 15:45:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780729305333686', 'admin', '2016-11-02 15:48:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478073077608169', 'admin', '2016-11-02 15:51:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780741774509768', 'admin', '2016-11-02 16:09:37', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780742268478358', 'admin', '2016-11-02 16:10:26', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780742305508422', 'admin', '2016-11-02 16:10:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780753212407575', 'admin', '2016-11-02 16:28:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780761464483112', 'admin', '2016-11-02 16:42:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780761589426056', 'admin', '2016-11-02 16:42:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780771901834650', 'admin', '2016-11-02 16:59:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780772345686302', 'admin', '2016-11-02 17:00:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780774816921048', 'admin', '2016-11-02 17:04:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780781439631404', 'admin', '2016-11-02 17:15:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478081898074035', 'admin', '2016-11-02 18:18:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780819915967313', 'admin', '2016-11-02 18:19:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780820658666211', 'admin', '2016-11-02 18:21:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780825315241922', 'admin', '2016-11-02 18:28:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478082853838244', 'admin', '2016-11-02 18:34:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780834281448419', 'admin', '2016-11-02 18:43:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780846783528875', 'admin', '2016-11-02 19:04:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478084795447193', 'admin', '2016-11-02 19:06:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780853811494373', 'admin', '2016-11-02 19:16:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780855042683091', 'admin', '2016-11-02 19:18:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780856294108853', 'admin', '2016-11-02 19:20:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780864119141645', 'admin', '2016-11-02 19:33:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780874078984814', 'admin', '2016-11-02 19:50:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14780878685602024', 'admin', '2016-11-02 19:57:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782605931511249', 'admin', '2016-11-04 19:56:33', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782607945785340', 'admin', '2016-11-04 19:59:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782610237323731', 'admin', '2016-11-04 20:03:43', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782612911207291', 'admin', '2016-11-04 20:08:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478261548967902', 'admin', '2016-11-04 20:12:28', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478261880036690', 'admin', '2016-11-04 20:18:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782622184385787', 'admin', '2016-11-04 20:23:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782624219067461', 'admin', '2016-11-04 20:27:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478263237487966', 'admin', '2016-11-04 20:40:37', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782635769772025', 'admin', '2016-11-04 20:46:16', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782648603617814', 'admin', '2016-11-04 21:07:40', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782654839623112', 'admin', '2016-11-04 21:18:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782654957841068', 'admin', '2016-11-04 21:18:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782661466174361', 'admin', '2016-11-04 21:29:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782661643657540', 'admin', '2016-11-04 21:29:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478266248123575', 'admin', '2016-11-04 21:30:48', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14782663496112111', 'admin', '2016-11-04 21:32:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784824095272144', 'admin', '2016-11-07 09:33:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784827244104108', 'admin', '2016-11-07 09:38:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784827706241176', 'admin', '2016-11-07 09:39:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784835366378642', 'admin', '2016-11-07 09:52:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784840787294679', 'admin', '2016-11-07 10:01:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784842504774498', 'admin', '2016-11-07 10:04:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478484338749757', 'admin', '2016-11-07 10:05:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784844129478845', 'admin', '2016-11-07 10:06:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784846235362859', 'admin', '2016-11-07 10:10:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784853374479409', 'admin', '2016-11-07 10:22:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784856531859836', 'admin', '2016-11-07 10:27:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784857670661372', 'admin', '2016-11-07 10:29:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784865801962652', 'admin', '2016-11-07 10:43:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784868547934370', 'admin', '2016-11-07 10:47:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784868982656429', 'admin', '2016-11-07 10:48:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784869425322373', 'admin', '2016-11-07 10:49:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784870565424501', 'admin', '2016-11-07 10:50:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784881980672554', 'admin', '2016-11-07 11:09:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784896204979963', 'admin', '2016-11-07 11:33:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784898862121043', 'admin', '2016-11-07 11:38:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784936322165037', 'admin', '2016-11-07 12:40:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784941697557150', 'admin', '2016-11-07 12:49:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478494215827142', 'admin', '2016-11-07 12:50:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784945002139399', 'admin', '2016-11-07 12:55:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784996408862353', 'admin', '2016-11-07 14:20:40', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14784998816191965', 'admin', '2016-11-07 14:24:41', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785009783903975', 'admin', '2016-11-07 14:42:58', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785014098592380', 'admin', '2016-11-07 14:50:09', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785016478144313', 'admin', '2016-11-07 14:54:07', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785018310515048', 'admin', '2016-11-07 14:57:11', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785044373921944', 'admin', '2016-11-07 15:40:37', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785049980419100', 'admin', '2016-11-07 15:49:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785051401615241', 'admin', '2016-11-07 15:52:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785053788957440', 'admin', '2016-11-07 15:56:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785055012257655', 'admin', '2016-11-07 15:58:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785057814569106', 'admin', '2016-11-07 16:03:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785068546895928', 'admin', '2016-11-07 16:20:54', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785086422309775', 'admin', '2016-11-07 16:50:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785089195485366', 'admin', '2016-11-07 16:55:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785091406212443', 'admin', '2016-11-07 16:59:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785092799302867', 'admin', '2016-11-07 17:01:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785095792639149', 'admin', '2016-11-07 17:06:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785097178692104', 'admin', '2016-11-07 17:08:37', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785097355578487', 'admin', '2016-11-07 17:08:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785131812326269', 'admin', '2016-11-07 18:06:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785133850904735', 'admin', '2016-11-07 18:09:45', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785135162463599', 'admin', '2016-11-07 18:11:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785138186597571', 'admin', '2016-11-07 18:16:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785152270023363', 'admin', '2016-11-07 18:40:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785152764776751', 'admin', '2016-11-07 18:41:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478568763252954', 'admin', '2016-11-08 09:32:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785860852705796', 'admin', '2016-11-08 14:21:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785888433834531', 'admin', '2016-11-08 15:07:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785939837952520', 'admin', '2016-11-08 16:33:03', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785951923257672', 'admin', '2016-11-08 16:53:12', '172.25.5.222', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785953259963346', 'admin', '2016-11-08 16:55:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785953536654051', 'admin', '2016-11-08 16:55:53', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785956225377701', 'admin', '2016-11-08 17:00:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785960270042564', 'admin', '2016-11-08 17:07:07', 'fe80:0:0:0:956b:6f7d:636a:833c%11', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785963330948222', 'admin', '2016-11-08 17:12:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785963585919783', 'admin', '2016-11-08 17:12:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14785968059364343', 'admin', '2016-11-08 17:20:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786073788001533', 'admin', '2016-11-08 20:16:18', 'fe80:0:0:0:956b:6f7d:636a:833c%11', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786591675274632', 'admin', '2016-11-09 10:39:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786616604438413', 'admin', '2016-11-09 11:21:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786622598435455', 'admin', '2016-11-09 11:30:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786625102269576', 'admin', '2016-11-09 11:35:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786626250213731', 'admin', '2016-11-09 11:37:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786739482782000', 'admin', '2016-11-09 14:45:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786759927121821', 'admin', '2016-11-09 15:19:52', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786814006479104', 'admin', '2016-11-09 16:50:00', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786834080974195', 'admin', '2016-11-09 17:23:28', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786835682207155', 'admin', '2016-11-09 17:26:08', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786837500012488', 'admin', '2016-11-09 17:29:10', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786889327285490', 'admin', '2016-11-09 18:55:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14786955898187752', 'admin', '2016-11-09 20:46:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478747219177972', 'admin', '2016-11-10 11:06:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787614563927941', 'admin', '2016-11-10 15:04:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787621927879793', 'admin', '2016-11-10 15:16:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787623238629057', 'admin', '2016-11-10 15:18:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787625091919207', 'admin', '2016-11-10 15:21:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787625826621631', 'admin', '2016-11-10 15:23:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787626649854810', 'admin', '2016-11-10 15:24:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787629411457129', 'admin', '2016-11-10 15:29:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787633531109326', 'admin', '2016-11-10 15:35:53', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787635023679073', 'admin', '2016-11-10 15:38:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787635941006191', 'admin', '2016-11-10 15:39:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787638121233049', 'admin', '2016-11-10 15:43:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787657594959417', 'admin', '2016-11-10 16:15:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787667439791273', 'admin', '2016-11-10 16:32:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787668100459735', 'admin', '2016-11-10 16:33:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787673430713815', 'admin', '2016-11-10 16:42:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787674013598946', 'admin', '2016-11-10 16:43:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787696515367026', 'admin', '2016-11-10 17:20:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787698732577766', 'admin', '2016-11-10 17:24:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787703475014666', 'admin', '2016-11-10 17:32:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478770502154465', 'admin', '2016-11-10 17:35:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787707261096466', 'admin', '2016-11-10 17:38:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787736150323811', 'admin', '2016-11-10 18:26:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787740207723591', 'admin', '2016-11-10 18:33:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787749069165410', 'admin', '2016-11-10 18:48:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787750202692028', 'admin', '2016-11-10 18:50:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787755912968712', 'admin', '2016-11-10 18:59:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787761664377212', 'admin', '2016-11-10 19:09:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787764523923422', 'admin', '2016-11-10 19:14:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787768149594149', 'admin', '2016-11-10 19:20:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787769308218767', 'admin', '2016-11-10 19:22:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478777318259591', 'admin', '2016-11-10 19:28:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787780874136535', 'admin', '2016-11-10 19:41:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787786061508622', 'admin', '2016-11-10 19:50:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787791690815642', 'admin', '2016-11-10 19:59:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787798014959302', 'admin', '2016-11-10 20:10:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787805484089608', 'admin', '2016-11-10 20:22:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787806434962334', 'admin', '2016-11-10 20:24:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787819065863896', 'admin', '2016-11-10 20:45:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787822614963126', 'admin', '2016-11-10 20:51:01', 'fe80:0:0:0:4077:9ab6:1b16:47a0%25', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787824065173834', 'admin', '2016-11-10 20:53:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787825207589913', 'admin', '2016-11-10 20:55:20', 'fe80:0:0:0:4077:9ab6:1b16:47a0%25', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787827094745959', 'admin', '2016-11-10 20:58:29', 'fe80:0:0:0:64c5:cbc0:661c:cfd2%23', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478782770184708', 'admin', '2016-11-10 20:59:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478783176568305', 'admin', '2016-11-10 21:06:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787840028103382', 'admin', '2016-11-10 21:20:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14787840237737652', 'admin', '2016-11-10 21:20:23', 'fe80:0:0:0:4077:9ab6:1b16:47a0%25', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788247063534632', 'admin', '2016-11-11 08:38:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788253741002491', 'admin', '2016-11-11 08:49:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788258069083897', 'admin', '2016-11-11 08:56:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788260015019475', 'admin', '2016-11-11 09:00:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788279512382933', 'admin', '2016-11-11 09:32:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788280281442338', 'admin', '2016-11-11 09:33:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478828591493829', 'admin', '2016-11-11 09:43:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788286111125476', 'admin', '2016-11-11 09:43:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788294650235673', 'admin', '2016-11-11 09:57:45', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788312344763290', 'admin', '2016-11-11 10:27:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788324939025362', 'admin', '2016-11-11 10:48:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788474178938715', 'admin', '2016-11-11 14:56:57', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788474182683245', 'admin', '2016-11-11 14:56:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788477831916481', 'admin', '2016-11-11 15:03:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788478021588755', 'admin', '2016-11-11 15:03:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788527263045635', 'admin', '2016-11-11 16:25:26', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788532304396169', 'admin', '2016-11-11 16:33:50', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788541502947564', 'admin', '2016-11-11 16:49:10', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788543465066003', 'admin', '2016-11-11 16:52:26', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788557603881192', 'admin', '2016-11-11 17:16:00', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788558059087064', 'admin', '2016-11-11 17:16:45', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788558582913007', 'admin', '2016-11-11 17:17:38', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788621702604184', 'admin', '2016-11-11 19:02:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788657590284649', 'admin', '2016-11-11 20:02:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788668188402077', 'admin', '2016-11-11 20:20:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478867244483435', 'admin', '2016-11-11 20:27:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788672671887300', 'admin', '2016-11-11 20:27:47', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788684406725556', 'admin', '2016-11-11 20:47:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788687686452838', 'admin', '2016-11-11 20:52:48', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788692297454140', 'admin', '2016-11-11 21:00:29', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788692944107710', 'admin', '2016-11-11 21:01:34', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478869497997255', 'admin', '2016-11-11 21:04:57', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788706115859685', 'admin', '2016-11-11 21:23:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14788721206921377', 'admin', '2016-11-11 21:48:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789365980467452', 'admin', '2016-11-12 15:43:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789370589792977', 'admin', '2016-11-12 15:50:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789472569205475', 'admin', '2016-11-12 18:40:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789491747828856', 'admin', '2016-11-12 19:12:54', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789512855324913', 'admin', '2016-11-12 19:48:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789512861729832', 'admin', '2016-11-12 19:48:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789524862211121', 'admin', '2016-11-12 20:08:06', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789526875063017', 'admin', '2016-11-12 20:11:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789526997009060', 'admin', '2016-11-12 20:11:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789544657483585', 'admin', '2016-11-12 20:41:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789559824433225', 'admin', '2016-11-12 21:06:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789562427772342', 'admin', '2016-11-12 21:10:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789570532452396', 'admin', '2016-11-12 21:24:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789574339545656', 'admin', '2016-11-12 21:30:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789579062103584', 'admin', '2016-11-12 21:38:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789579137429953', 'admin', '2016-11-12 21:38:33', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1478958325150117', 'admin', '2016-11-12 21:45:25', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789593310179321', 'admin', '2016-11-12 22:02:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789593831181776', 'admin', '2016-11-12 22:03:03', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789595319334654', 'admin', '2016-11-12 22:05:31', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789597966236631', 'admin', '2016-11-12 22:09:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14789604371539281', 'admin', '2016-11-12 22:20:37', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790008447662814', 'admin', '2016-11-13 09:34:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790017106246069', 'admin', '2016-11-13 09:48:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790032687589963', 'admin', '2016-11-13 10:14:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479003280078341', 'admin', '2016-11-13 10:14:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790036044669893', 'admin', '2016-11-13 10:20:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790038590143920', 'admin', '2016-11-13 10:24:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790047148284352', 'admin', '2016-11-13 10:38:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790071022841339', 'admin', '2016-11-13 11:18:22', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790078126552719', 'admin', '2016-11-13 11:30:12', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790079660339460', 'admin', '2016-11-13 11:32:46', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790083476985754', 'admin', '2016-11-13 11:39:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790085253133530', 'admin', '2016-11-13 11:42:05', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790086273771732', 'admin', '2016-11-13 11:43:47', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790089370165283', 'admin', '2016-11-13 11:48:57', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790089858704327', 'admin', '2016-11-13 11:49:45', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790092461015169', 'admin', '2016-11-13 11:54:06', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790102984791957', 'admin', '2016-11-13 12:11:38', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790103155661278', 'admin', '2016-11-13 12:11:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790105148355297', 'admin', '2016-11-13 12:15:14', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790109174186565', 'admin', '2016-11-13 12:21:57', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790109970432704', 'admin', '2016-11-13 12:23:17', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790118361963297', 'admin', '2016-11-13 12:37:16', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790120357082718', 'admin', '2016-11-13 12:40:35', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790123730046429', 'admin', '2016-11-13 12:46:13', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790123875209552', 'admin', '2016-11-13 12:46:27', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790123966992105', 'admin', '2016-11-13 12:46:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790124840056064', 'admin', '2016-11-13 12:48:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790125405089302', 'admin', '2016-11-13 12:49:00', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479012615611723', 'admin', '2016-11-13 12:50:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790128383482234', 'admin', '2016-11-13 12:53:58', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790128980486181', 'admin', '2016-11-13 12:54:58', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790129384938476', 'admin', '2016-11-13 12:55:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479012966946316', 'admin', '2016-11-13 12:56:06', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790129815641131', 'admin', '2016-11-13 12:56:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790130639537942', 'admin', '2016-11-13 12:57:43', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479013157114710', 'admin', '2016-11-13 12:59:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790131823316028', 'admin', '2016-11-13 12:59:42', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790132605025945', 'admin', '2016-11-13 13:01:00', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790133107137758', 'admin', '2016-11-13 13:01:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790133597362072', 'admin', '2016-11-13 13:02:39', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790134070607779', 'admin', '2016-11-13 13:03:27', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479013628178888', 'admin', '2016-11-13 13:07:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790137237584511', 'admin', '2016-11-13 13:08:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790139470244172', 'admin', '2016-11-13 13:12:27', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790140575609888', 'admin', '2016-11-13 13:14:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790141901332894', 'admin', '2016-11-13 13:16:30', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790142233162301', 'admin', '2016-11-13 13:17:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790145793122316', 'admin', '2016-11-13 13:22:59', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790148411208582', 'admin', '2016-11-13 13:27:21', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790151532981878', 'admin', '2016-11-13 13:32:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790153208118989', 'admin', '2016-11-13 13:35:20', 'fe80:0:0:0:4077:9ab6:1b16:47a0%24', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790153306343046', 'admin', '2016-11-13 13:35:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790154226917910', 'admin', '2016-11-13 13:37:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790155068104264', 'admin', '2016-11-13 13:38:26', 'fe80:0:0:0:4077:9ab6:1b16:47a0%24', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790155182067092', 'admin', '2016-11-13 13:38:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790193213375720', 'admin', '2016-11-13 14:42:01', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790193213379112', 'admin', '2016-11-13 14:42:01', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790194052441710', 'admin', '2016-11-13 14:43:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790196352913248', 'admin', '2016-11-13 14:47:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790213865372176', 'admin', '2016-11-13 15:16:26', 'fe80:0:0:0:4077:9ab6:1b16:47a0%24', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790260794982159', 'admin', '2016-11-13 16:34:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790263003074394', 'admin', '2016-11-13 16:38:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790287594761319', 'admin', '2016-11-13 17:19:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790287652603629', 'admin', '2016-11-13 17:19:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790295830638694', 'admin', '2016-11-13 17:33:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790399847368952', 'admin', '2016-11-13 20:26:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790401537712644', 'admin', '2016-11-13 20:29:13', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790437376898290', 'admin', '2016-11-13 21:28:57', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790439349718858', 'admin', '2016-11-13 21:32:14', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790440852232046', 'admin', '2016-11-13 21:34:45', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790448791786983', 'admin', '2016-11-13 21:47:59', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790461093089040', 'admin', '2016-11-13 22:08:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790462471747131', 'admin', '2016-11-13 22:10:47', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790885050955969', 'admin', '2016-11-14 09:55:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790886897221365', 'admin', '2016-11-14 09:58:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790910386063077', 'admin', '2016-11-14 10:37:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790912614495477', 'admin', '2016-11-14 10:41:01', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790914049348549', 'admin', '2016-11-14 10:43:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790915118395814', 'admin', '2016-11-14 10:45:11', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790921178796199', 'admin', '2016-11-14 10:55:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790926906332563', 'admin', '2016-11-14 11:04:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790927468596780', 'admin', '2016-11-14 11:05:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14790930931267297', 'admin', '2016-11-14 11:11:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791031598924592', 'admin', '2016-11-14 13:59:19', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791033139506245', 'admin', '2016-11-14 14:01:53', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791048011599673', 'admin', '2016-11-14 14:26:41', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791048674168121', 'admin', '2016-11-14 14:27:47', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791051249867676', 'admin', '2016-11-14 14:32:04', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791053104287938', 'admin', '2016-11-14 14:35:10', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479105392577581', 'admin', '2016-11-14 14:36:32', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791060754496257', 'admin', '2016-11-14 14:47:55', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791062085361447', 'admin', '2016-11-14 14:50:08', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791065593416031', 'admin', '2016-11-14 14:55:59', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791066210804861', 'admin', '2016-11-14 14:57:01', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479106695889682', 'admin', '2016-11-14 14:58:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791066966385888', 'admin', '2016-11-14 14:58:16', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791071550797755', 'admin', '2016-11-14 15:05:55', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791076054223851', 'admin', '2016-11-14 15:13:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791080836979437', 'admin', '2016-11-14 15:21:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791085595163942', 'admin', '2016-11-14 15:29:19', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791086444696658', 'admin', '2016-11-14 15:30:44', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791086686191173', 'admin', '2016-11-14 15:31:08', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791090095318823', 'admin', '2016-11-14 15:36:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791090993729094', 'admin', '2016-11-14 15:38:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791092767918738', 'admin', '2016-11-14 15:41:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791096512118559', 'admin', '2016-11-14 15:47:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479109873940331', 'admin', '2016-11-14 15:51:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479110525426667', 'admin', '2016-11-14 16:02:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791111065296968', 'admin', '2016-11-14 16:11:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791112821634416', 'admin', '2016-11-14 16:14:42', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479111956863500', 'admin', '2016-11-14 16:25:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791120889254514', 'admin', '2016-11-14 16:28:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791123059431873', 'admin', '2016-11-14 16:31:45', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791124768983762', 'admin', '2016-11-14 16:34:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791127312456517', 'admin', '2016-11-14 16:38:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791128820163851', 'admin', '2016-11-14 16:41:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791133839139350', 'admin', '2016-11-14 16:49:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791149301181157', 'admin', '2016-11-14 17:15:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791152461665101', 'admin', '2016-11-14 17:20:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791153729401285', 'admin', '2016-11-14 17:22:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791161289081819', 'admin', '2016-11-14 17:35:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791222062633442', 'admin', '2016-11-14 19:16:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479122342645860', 'admin', '2016-11-14 19:19:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791225896733767', 'admin', '2016-11-14 19:23:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791230349489530', 'admin', '2016-11-14 19:30:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791232286453770', 'admin', '2016-11-14 19:33:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791238048535992', 'admin', '2016-11-14 19:43:24', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791239481187086', 'admin', '2016-11-14 19:45:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791242168877259', 'admin', '2016-11-14 19:50:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791243713737189', 'admin', '2016-11-14 19:52:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479124408903808', 'admin', '2016-11-14 19:53:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791248424833955', 'admin', '2016-11-14 20:00:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791251470124719', 'admin', '2016-11-14 20:05:47', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479125367881239', 'admin', '2016-11-14 20:09:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791253703216164', 'admin', '2016-11-14 20:09:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791254784219105', 'admin', '2016-11-14 20:11:18', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791256545566243', 'admin', '2016-11-14 20:14:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791257518344508', 'admin', '2016-11-14 20:15:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791259952876685', 'admin', '2016-11-14 20:19:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791260076764197', 'admin', '2016-11-14 20:20:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791261120145113', 'admin', '2016-11-14 20:21:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791265844431497', 'admin', '2016-11-14 20:29:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791267142215769', 'admin', '2016-11-14 20:31:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791267300774521', 'admin', '2016-11-14 20:32:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791267746449267', 'admin', '2016-11-14 20:32:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791268530425068', 'admin', '2016-11-14 20:34:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791268786343467', 'admin', '2016-11-14 20:34:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791270501946752', 'admin', '2016-11-14 20:37:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791271492528093', 'admin', '2016-11-14 20:39:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791272385453165', 'admin', '2016-11-14 20:40:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791283446714277', 'admin', '2016-11-14 20:59:04', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791288960721243', 'admin', '2016-11-14 21:08:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791290406866399', 'admin', '2016-11-14 21:10:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791292184611673', 'admin', '2016-11-14 21:13:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791292262118837', 'admin', '2016-11-14 21:13:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791300889017864', 'admin', '2016-11-14 21:28:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791316909114597', 'admin', '2016-11-14 21:54:50', 'fe80:0:0:0:64c5:cbc0:661c:cfd2%22', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791317122466627', 'admin', '2016-11-14 21:55:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791327629212004', 'admin', '2016-11-14 22:12:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791754666127397', 'admin', '2016-11-15 10:04:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791755876045206', 'admin', '2016-11-15 10:06:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791763019314853', 'admin', '2016-11-15 10:18:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791777509058031', 'admin', '2016-11-15 10:42:30', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791786067214610', 'admin', '2016-11-15 10:56:46', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791787271747253', 'admin', '2016-11-15 10:58:47', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791789978941832', 'admin', '2016-11-15 11:03:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791800600952796', 'admin', '2016-11-15 11:21:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479180325649456', 'admin', '2016-11-15 11:25:25', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791804110294529', 'admin', '2016-11-15 11:26:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791804718484960', 'admin', '2016-11-15 11:27:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791805572816286', 'admin', '2016-11-15 11:29:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479180695638705', 'admin', '2016-11-15 11:31:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791846520908003', 'admin', '2016-11-15 12:37:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791852519575662', 'admin', '2016-11-15 12:47:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791860737835480', 'admin', '2016-11-15 13:01:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791861553902398', 'admin', '2016-11-15 13:02:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791865561426211', 'admin', '2016-11-15 13:09:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791866229224789', 'admin', '2016-11-15 13:10:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791871329787864', 'admin', '2016-11-15 13:18:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791873690613890', 'admin', '2016-11-15 13:22:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791876582995772', 'admin', '2016-11-15 13:27:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791923072762704', 'admin', '2016-11-15 14:45:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791927223564761', 'admin', '2016-11-15 14:52:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791938317001805', 'admin', '2016-11-15 15:10:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791946542115928', 'admin', '2016-11-15 15:24:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791948723051080', 'admin', '2016-11-15 15:27:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479197393269194', 'admin', '2016-11-15 16:09:53', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14791985556774567', 'admin', '2016-11-15 16:29:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792011508855023', 'admin', '2016-11-15 17:12:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792055194172209', 'admin', '2016-11-15 18:25:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792058824631729', 'admin', '2016-11-15 18:31:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792067077938208', 'admin', '2016-11-15 18:45:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792067893902608', 'admin', '2016-11-15 18:46:29', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479206827252274', 'admin', '2016-11-15 18:47:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792069244809732', 'admin', '2016-11-15 18:48:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792069406036637', 'admin', '2016-11-15 18:49:00', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792096418122823', 'admin', '2016-11-15 19:34:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792099842219941', 'admin', '2016-11-15 19:39:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792104866434995', 'admin', '2016-11-15 19:48:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792107308145667', 'admin', '2016-11-15 19:52:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792109094369735', 'admin', '2016-11-15 19:55:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792111702227766', 'admin', '2016-11-15 19:59:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792119133317185', 'admin', '2016-11-15 20:11:53', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792122177954207', 'admin', '2016-11-15 20:16:57', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479212783472131', 'admin', '2016-11-15 20:26:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792130300601998', 'admin', '2016-11-15 20:30:30', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792132553961779', 'admin', '2016-11-15 20:34:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792138266169089', 'admin', '2016-11-15 20:43:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792140225726604', 'admin', '2016-11-15 20:47:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792140226236821', 'admin', '2016-11-15 20:47:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792144356346315', 'admin', '2016-11-15 20:53:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792157482615116', 'admin', '2016-11-15 21:15:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479261722194476', 'admin', '2016-11-16 10:02:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792619069341249', 'admin', '2016-11-16 10:05:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792622419401500', 'admin', '2016-11-16 10:10:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792639893093966', 'admin', '2016-11-16 10:39:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792667591641390', 'admin', '2016-11-16 11:25:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14792783195127067', 'admin', '2016-11-16 14:38:39', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793481042114819', 'admin', '2016-11-17 10:01:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793528345262736', 'admin', '2016-11-17 11:20:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793532409496696', 'admin', '2016-11-17 11:27:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793607864602088', 'admin', '2016-11-17 13:33:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793610956222873', 'admin', '2016-11-17 13:38:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793617322366022', 'admin', '2016-11-17 13:48:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479361954271638', 'admin', '2016-11-17 13:52:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479362257497784', 'admin', '2016-11-17 13:57:37', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793624285656146', 'admin', '2016-11-17 14:00:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793625556259374', 'admin', '2016-11-17 14:02:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793627564411683', 'admin', '2016-11-17 14:05:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793640641834668', 'admin', '2016-11-17 14:27:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793647457789934', 'admin', '2016-11-17 14:39:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793648734689511', 'admin', '2016-11-17 14:41:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793651706529743', 'admin', '2016-11-17 14:46:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793653420189182', 'admin', '2016-11-17 14:49:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793656241517904', 'admin', '2016-11-17 14:53:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793730813175099', 'admin', '2016-11-17 16:58:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793731603652844', 'admin', '2016-11-17 16:59:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793737743664368', 'admin', '2016-11-17 17:09:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793769306964138', 'admin', '2016-11-17 18:02:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793770829976829', 'admin', '2016-11-17 18:04:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479377701167022', 'admin', '2016-11-17 18:15:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793783468989179', 'admin', '2016-11-17 18:25:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793787138557961', 'admin', '2016-11-17 18:31:53', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793788736081332', 'admin', '2016-11-17 18:34:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793793713361548', 'admin', '2016-11-17 18:42:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793797632237408', 'admin', '2016-11-17 18:49:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793798916747112', 'admin', '2016-11-17 18:51:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793799906309157', 'admin', '2016-11-17 18:53:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793802068908793', 'admin', '2016-11-17 18:56:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479380503195883', 'admin', '2016-11-17 19:01:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793809750117685', 'admin', '2016-11-17 19:09:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793818468017658', 'admin', '2016-11-17 19:24:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793820277366854', 'admin', '2016-11-17 19:27:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793823186547309', 'admin', '2016-11-17 19:31:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793827940655534', 'admin', '2016-11-17 19:39:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793831655524058', 'admin', '2016-11-17 19:46:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793832748961520', 'admin', '2016-11-17 19:47:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793837552241642', 'admin', '2016-11-17 19:55:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793840822475192', 'admin', '2016-11-17 20:01:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793842235397291', 'admin', '2016-11-17 20:03:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793842769708367', 'admin', '2016-11-17 20:04:36', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479385067644609', 'admin', '2016-11-17 20:17:47', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793852819518022', 'admin', '2016-11-17 20:21:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793858469364558', 'admin', '2016-11-17 20:30:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793864066876187', 'admin', '2016-11-17 20:40:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793865374032829', 'admin', '2016-11-17 20:42:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793866790181797', 'admin', '2016-11-17 20:44:39', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14793869289944613', 'admin', '2016-11-17 20:48:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794372910979655', 'admin', '2016-11-18 10:48:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794374170253901', 'admin', '2016-11-18 10:50:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794492364391007', 'admin', '2016-11-18 14:07:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794688964888791', 'admin', '2016-11-18 19:34:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794696049761758', 'admin', '2016-11-18 19:46:44', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794705033178890', 'admin', '2016-11-18 20:01:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794707569743380', 'admin', '2016-11-18 20:05:56', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14794719865079400', 'admin', '2016-11-18 20:26:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14796953003122182', 'admin', '2016-11-21 10:28:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14796954110046222', 'admin', '2016-11-21 10:30:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14796954637856706', 'admin', '2016-11-21 10:31:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14797985957808535', 'admin', '2016-11-22 15:09:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798023344251028', 'admin', '2016-11-22 16:12:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798067707452713', 'admin', '2016-11-22 17:26:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798184095082764', 'admin', '2016-11-22 20:40:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479818534553816', 'admin', '2016-11-22 20:42:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798186129059960', 'admin', '2016-11-22 20:43:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798186465548074', 'admin', '2016-11-22 20:44:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798188026104811', 'admin', '2016-11-22 20:46:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798190589962270', 'admin', '2016-11-22 20:50:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479819183446316', 'admin', '2016-11-22 20:53:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798193706106073', 'admin', '2016-11-22 20:56:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798195752435485', 'admin', '2016-11-22 20:59:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479819693745076', 'admin', '2016-11-22 21:01:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479871288828497', 'admin', '2016-11-23 11:21:28', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798724718969598', 'admin', '2016-11-23 11:41:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798726660352521', 'admin', '2016-11-23 11:44:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479872703255361', 'admin', '2016-11-23 11:45:03', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798729295437959', 'admin', '2016-11-23 11:48:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798787276425309', 'admin', '2016-11-23 13:25:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798904499222795', 'admin', '2016-11-23 16:40:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798925200778072', 'admin', '2016-11-23 17:15:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798930247938752', 'admin', '2016-11-23 17:23:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14798937160093017', 'admin', '2016-11-23 17:35:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479955006904842', 'admin', '2016-11-24 10:36:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799573587103779', 'admin', '2016-11-24 11:15:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799576737374342', 'admin', '2016-11-24 11:21:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799672064519858', 'admin', '2016-11-24 14:00:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799707957808898', 'admin', '2016-11-24 14:59:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799724705052639', 'admin', '2016-11-24 15:27:50', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799725507307686', 'admin', '2016-11-24 15:29:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799725958646356', 'admin', '2016-11-24 15:29:55', '172.25.5.223', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799729473346350', 'admin', '2016-11-24 15:35:47', '210.42.41.45', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799746816835717', 'admin', '2016-11-24 16:04:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799750213997928', 'admin', '2016-11-24 16:10:21', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799760583978587', 'admin', '2016-11-24 16:27:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799761853253999', 'admin', '2016-11-24 16:29:45', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799763784432627', 'admin', '2016-11-24 16:32:58', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799765662406096', 'admin', '2016-11-24 16:36:06', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799772190421144', 'admin', '2016-11-24 16:46:59', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799774718466087', 'admin', '2016-11-24 16:51:11', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799783615527000', 'admin', '2016-11-24 17:06:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799787885205317', 'admin', '2016-11-24 17:13:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799803239839165', 'admin', '2016-11-24 17:38:43', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799843876077944', 'admin', '2016-11-24 18:46:27', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799860975681450', 'admin', '2016-11-24 19:14:57', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799867320804671', 'admin', '2016-11-24 19:25:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799874356324281', 'admin', '2016-11-24 19:37:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799877930328355', 'admin', '2016-11-24 19:43:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799885747974380', 'admin', '2016-11-24 19:56:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479988790647464', 'admin', '2016-11-24 19:59:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799890212555042', 'admin', '2016-11-24 20:03:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799892272605307', 'admin', '2016-11-24 20:07:07', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799893424259994', 'admin', '2016-11-24 20:09:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1479989553225709', 'admin', '2016-11-24 20:12:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14799906480123537', 'admin', '2016-11-24 20:30:48', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800403904935624', 'admin', '2016-11-25 10:19:50', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800406813942640', 'admin', '2016-11-25 10:24:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800428634205020', 'admin', '2016-11-25 11:01:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800429223697901', 'admin', '2016-11-25 11:02:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800441225259185', 'admin', '2016-11-25 11:22:02', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800442828862806', 'admin', '2016-11-25 11:24:42', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800476542319600', 'admin', '2016-11-25 12:20:54', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800478782894710', 'admin', '2016-11-25 12:24:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800483614499687', 'admin', '2016-11-25 12:32:41', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800531605791336', 'admin', '2016-11-25 13:52:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800559621665985', 'admin', '2016-11-25 14:39:22', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800562008981698', 'admin', '2016-11-25 14:43:20', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800571122746046', 'admin', '2016-11-25 14:58:32', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800614551122334', 'admin', '2016-11-25 16:10:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800619570034990', 'admin', '2016-11-25 16:19:17', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800629637264361', 'admin', '2016-11-25 16:36:03', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800632795006522', 'admin', '2016-11-25 16:41:19', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14800634502819942', 'admin', '2016-11-25 16:44:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14802334606524275', 'admin', '2016-11-27 15:57:40', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14804792268523621', 'admin', '2016-11-30 12:13:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14804804668316822', 'admin', '2016-11-30 12:34:26', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14804840454803459', 'admin', '2016-11-30 13:34:05', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14804870058333372', 'admin', '2016-11-30 14:23:25', '127.0.0.1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14804962888979294', 'admin', '2016-11-30 16:58:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480558720220223', 'admin', '2016-12-01 10:18:40', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480626171167131', 'admin', '2016-12-02 05:02:51', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480626912824449', 'admin', '2016-12-02 05:15:12', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808266268276281', 'admin', '2016-12-04 12:43:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480850794406024', 'admin', '2016-12-04 19:26:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808510614341278', 'admin', '2016-12-04 19:31:01', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808513945732377', 'admin', '2016-12-04 19:36:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808515502596707', 'admin', '2016-12-04 19:39:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808519558282163', 'admin', '2016-12-04 19:45:55', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808530630891944', 'admin', '2016-12-04 20:04:23', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808531358093436', 'admin', '2016-12-04 20:05:35', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808532885438117', 'admin', '2016-12-04 20:08:08', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808536492808869', 'admin', '2016-12-04 20:14:09', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808538330412911', 'admin', '2016-12-04 20:17:13', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808542136061444', 'admin', '2016-12-04 20:23:33', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808542540809793', 'admin', '2016-12-04 20:24:14', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808542854315627', 'admin', '2016-12-04 20:24:45', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808543381237756', 'admin', '2016-12-04 20:25:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480854409093292', 'admin', '2016-12-04 20:26:49', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808545119696094', 'admin', '2016-12-04 20:28:31', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808548780099878', 'admin', '2016-12-04 20:34:38', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480856134505628', 'admin', '2016-12-04 20:55:34', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808569269562504', 'admin', '2016-12-04 21:08:46', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808582100037977', 'admin', '2016-12-04 21:30:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808584174535285', 'admin', '2016-12-04 21:33:37', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480859217871914', 'admin', '2016-12-04 21:46:57', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('1480860044983629', 'admin', '2016-12-04 22:00:44', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808600451147299', 'admin', '2016-12-04 22:00:45', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14808605321306093', 'admin', '2016-12-04 22:08:52', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14809000903409916', 'admin', '2016-12-05 09:08:10', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14809281754549428', 'admin', '2016-12-05 16:56:15', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14809281765848458', 'admin', '2016-12-05 16:56:16', '0:0:0:0:0:0:0:1', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821124441768111', 'admin', '2016-12-19 09:54:04', '172.18.17.96', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821124659818218', 'admin', '2016-12-19 09:54:26', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821133785905578', 'admin', '2016-12-19 10:09:39', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821137916778573', 'admin', '2016-12-19 10:16:32', '172.18.17.96', '登录成功');
INSERT INTO `t_login_log` VALUES ('1482116684403338', 'admin', '2016-12-19 11:04:44', '172.18.17.96', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821190301912807', 'admin', '2016-12-19 11:43:50', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821219586529323', 'admin', '2016-12-19 12:32:39', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821225823073870', 'admin', '2016-12-19 12:43:02', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821337604191153', 'admin', '2016-12-19 15:49:20', '172.16.6.98', '登录成功');
INSERT INTO `t_login_log` VALUES ('1482136030022688', 'admin', '2016-12-19 16:27:10', '172.16.6.98', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821916223354649', 'admin', '2016-12-20 07:53:42', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14821961415246164', 'sjzx01', '2016-12-20 09:09:02', '172.16.23.197', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822012908106121', 'admin', '2016-12-20 10:34:51', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822015004027605', 'admin', '2016-12-20 10:38:20', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('1482201863133474', 'admin', '2016-12-20 10:44:23', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822175897288573', 'admin', '2016-12-20 15:06:30', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822196779946020', 'admin', '2016-12-20 15:41:18', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822204705214224', 'admin', '2016-12-20 15:54:31', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822208844906982', 'admin', '2016-12-20 16:01:24', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822215897716878', 'admin', '2016-12-20 16:13:10', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822217400087281', 'admin', '2016-12-20 16:15:40', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822790021195312', 'admin', '2016-12-21 08:10:02', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822819764853535', 'admin', '2016-12-21 08:59:36', 'fe80:0:0:0:1c5:41c3:144a:faf2%11', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822825931567533', 'admin', '2016-12-21 09:09:53', 'fe80:0:0:0:1c5:41c3:144a:faf2%11', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822883825525473', 'admin', '2016-12-21 10:46:23', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822887221996103', 'admin', '2016-12-21 10:52:02', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14822887975679745', 'guest', '2016-12-21 10:53:18', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14823696884841791', 'admin', '2016-12-22 09:21:28', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14823698396226732', 'admin', '2016-12-22 09:24:00', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14823698396235539', 'admin', '2016-12-22 09:24:00', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14823705657453316', 'admin', '2016-12-22 09:36:06', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14823941019667579', 'admin', '2016-12-22 16:08:22', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14824523227172326', 'admin', '2016-12-23 08:18:43', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14824523227176074', 'admin', '2016-12-23 08:18:43', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14824617494396375', 'admin', '2016-12-23 10:55:49', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827107748004767', 'admin', '2016-12-26 08:06:15', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827112501533866', 'admin', '2016-12-26 08:14:10', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827115187383171', 'admin', '2016-12-26 08:18:39', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('1482713383581104', 'zy60006', '2016-12-26 08:49:44', '172.16.23.72', '用户名或密码不正确');
INSERT INTO `t_login_log` VALUES ('14827134659063461', 'zy60006', '2016-12-26 08:51:06', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827134825257733', 'admin', '2016-12-26 08:51:23', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827135367589121', 'zy60006', '2016-12-26 08:52:17', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827135696918773', 'admin', '2016-12-26 08:52:50', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827137387531916', 'zy60006', '2016-12-26 08:55:39', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827140482784517', 'admin', '2016-12-26 09:00:48', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827145532597307', 'admin', '2016-12-26 09:09:13', '172.16.23.42', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827147907459879', 'admin', '2016-12-26 09:13:11', '172.16.23.42', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827152034431826', 'admin', '2016-12-26 09:20:03', '172.16.23.42', '登录成功');
INSERT INTO `t_login_log` VALUES ('1482717269663597', 'zy60006', '2016-12-26 09:54:30', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827342910544339', 'admin', '2016-12-26 14:38:11', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827347852058477', 'admin', '2016-12-26 14:46:25', '172.16.23.69', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827368413081416', 'admin', '2016-12-26 15:20:41', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827403307857141', 'admin', '2016-12-26 16:18:51', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14827969455853045', 'admin', '2016-12-27 08:02:26', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14828017068785058', 'admin', '2016-12-27 09:21:47', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14828022897913913', 'admin', '2016-12-27 09:31:30', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('1482802700342118', 'admin', '2016-12-27 09:38:20', '172.16.23.72', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829102035268497', 'admin', '2016-12-28 15:30:04', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829704692453117', 'admin', '2016-12-29 08:14:29', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829752796196128', 'admin', '2016-12-29 09:34:40', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829769718418064', 'admin', '2016-12-29 10:02:52', '172.16.23.197', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829772450723201', 'xzj60022', '2016-12-29 10:07:25', '172.16.23.197', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829776885949594', 'xzj60022', '2016-12-29 10:14:49', '172.16.23.197', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829934904209372', 'admin', '2016-12-29 14:38:10', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829934905307658', 'admin', '2016-12-29 14:38:11', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829935463865755', 'xzj60022', '2016-12-29 14:39:06', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('1482993562022708', 'admin', '2016-12-29 14:39:22', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829947269349085', 'admin', '2016-12-29 14:58:47', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829965977076493', 'admin', '2016-12-29 15:29:58', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829973057946507', 'admin', '2016-12-29 15:41:46', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14829980339205320', 'admin', '2016-12-29 15:53:54', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830031394258265', 'admin', '2016-12-29 17:18:59', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830640095062274', 'admin', '2016-12-30 10:13:30', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830640397701442', 'xzj60022', '2016-12-30 10:14:00', '172.16.23.197', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830653126864304', 'admin', '2016-12-30 10:35:13', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830657738525857', 'admin', '2016-12-30 10:42:54', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830671716808893', 'admin', '2016-12-30 11:06:12', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830801926451722', 'admin', '2016-12-30 14:43:13', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830809961081298', 'ty60016', '2016-12-30 14:56:36', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830822295222438', 'admin', '2016-12-30 15:17:10', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830828415293926', 'wlk2017', '2016-12-30 15:27:22', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830828665215479', 'admin', '2016-12-30 15:27:47', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830828996226817', 'wlk2017', '2016-12-30 15:28:20', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830840987621512', 'ty60016', '2016-12-30 15:48:19', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830841316375745', 'wlk2017', '2016-12-30 15:48:52', '172.16.6.96', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830843012792301', 'wlk2017', '2016-12-30 15:51:41', '172.16.6.55', '登录成功');
INSERT INTO `t_login_log` VALUES ('1483084417828044', 'admin', '2016-12-30 15:53:38', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14830886912576059', 'admin', '2016-12-30 17:04:51', '172.16.28.97', '登录成功');
INSERT INTO `t_login_log` VALUES ('14834016670975031', 'admin', '2017-01-03 08:01:07', '172.16.28.97', '登录成功');

-- ----------------------------
-- Table structure for `t_maintenanceinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_maintenanceinfo`;
CREATE TABLE `t_maintenanceinfo` (
  `maintenanceId` varchar(32) NOT NULL,
  `maintenanceName` varchar(100) DEFAULT NULL,
  `maintenanceContacts` varchar(100) DEFAULT NULL,
  `maintenancecontactsPhone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`maintenanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='维护公司信息';

-- ----------------------------
-- Records of t_maintenanceinfo
-- ----------------------------
INSERT INTO `t_maintenanceinfo` VALUES ('14821381473214680', '鸿商机电', '明庭望', '15827536860');
INSERT INTO `t_maintenanceinfo` VALUES ('14821381640762763', '明道泰和', '徐近琳', '18627180615');
INSERT INTO `t_maintenanceinfo` VALUES ('14821381788966829', '信易达科技', '龙加飞', '13343436511');
INSERT INTO `t_maintenanceinfo` VALUES ('14821382192406642', '真视通', '肖源', '');

-- ----------------------------
-- Table structure for `t_maintenancerecord`
-- ----------------------------
DROP TABLE IF EXISTS `t_maintenancerecord`;
CREATE TABLE `t_maintenancerecord` (
  `maintenancerecordId` varchar(32) NOT NULL,
  `assetId` varchar(32) DEFAULT NULL,
  `recordPeople` varchar(50) DEFAULT NULL,
  `recordInfo` varchar(200) DEFAULT NULL,
  `repairTime` datetime DEFAULT NULL,
  `repairExstatus` varchar(200) DEFAULT NULL,
  `repairContent` varchar(200) DEFAULT NULL,
  `repairAftstatus` varchar(200) DEFAULT NULL,
  `acceptancePerson` varchar(50) DEFAULT NULL,
  `recordTime` datetime DEFAULT NULL,
  `AcceptanceEvaluation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`maintenancerecordId`),
  KEY `FK_Reference_13` (`assetId`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`assetId`) REFERENCES `t_assetinfo` (`assetId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产维护记录';

-- ----------------------------
-- Records of t_maintenancerecord
-- ----------------------------

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `managerId` varchar(32) NOT NULL COMMENT '主键',
  `managerName` varchar(50) NOT NULL COMMENT '姓名',
  `code` char(2) DEFAULT '01' COMMENT '工号',
  `enable` varchar(11) NOT NULL DEFAULT '1',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `refuser` varchar(32) DEFAULT NULL COMMENT '关联的登陆用户',
  `createUser` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='项目经理';

-- ----------------------------
-- Records of t_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `menuId` varchar(32) NOT NULL COMMENT '主键',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `parentId` varchar(32) NOT NULL COMMENT '父亲节点',
  `name` varchar(25) NOT NULL COMMENT '中文名称',
  `code` varchar(25) DEFAULT NULL COMMENT '简码',
  `url` varchar(200) DEFAULT NULL COMMENT '请求url',
  `params` varchar(200) DEFAULT NULL COMMENT '参数',
  `icon` varchar(200) DEFAULT NULL COMMENT '菜单图标',
  `levels` int(11) DEFAULT '0' COMMENT '菜单层级',
  `sortCode` int(11) DEFAULT '0' COMMENT '顺序',
  `moduleId` varchar(32) DEFAULT NULL COMMENT '模块编码',
  `enable` varchar(11) DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1420711336094951', '3', '0', '基础信息', '', '', null, '', '1', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714976353939', '5', '0', '系统设置', '', '', null, '', '1', '4', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420714987907349', '1', '1420714976353939', '用户', '', '', null, '', '2', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715003825582', '1', '1420714976353939', '角色', '', '', null, '', '2', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715080055842', '1', '1420714976353939', 'url过滤', '', '', null, '', '2', '3', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715096172014', '1', '1420714976353939', '系统资源', '', '', null, '', '2', '4', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715154089567', '1', '1420714987907349', '用户新建', '', '/userRole/add', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715180833246', '2', '1420714987907349', '用户列表', 'yhlb', '/user/toList', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715229679779', '1', '1420715003825582', '角色新建', '', '/role/add', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715239271120', '1', '1420715003825582', '角色列表', '', '/role/toList', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715259164060', '1', '1420715080055842', 'url新建', '', '/urlFilter/add', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715277527339', '2', '1420715080055842', 'url列表', 'ljlb', '/urlFilter/toList', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715296434232', '2', '1420715096172014', '菜单', 'cdlb', '/menu/list', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715311385655', '2', '1420715096172014', '权限', 'qxlb', '/auth/list', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('14772850175791039', '4', '0', '固定资产', 'gdzc', '', null, '', '1', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772852154601912', '5', '14772850175791039', '资产信息', '', '', null, '', '2', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772852690089630', '2', '1420711336094951', '部门', '', '', null, '', '2', '3', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772852925375921', '1', '1420711336094951', '供应商', '', '', null, '', '2', '4', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772854018894844', '3', '14772852690089630', '部门信息录入', '', '/infomanage/depart/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772854190891008', '3', '14772852925375921', '供应商信息录入', '', '/infomanage/supplier/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772864882915599', '3', '14772852690089630', '部门信息列表', '', '/infomanage/depart/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865108746357', '2', '14772852925375921', '供应商信息列表', '', '/infomanage/supplier/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865293066423', '1', '1420711336094951', '厂商', '', '', null, '', '2', '5', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865535855333', '1', '1420711336094951', '项目', '', '', null, '', '2', '6', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865656659681', '1', '1420711336094951', '维护公司', '', '', null, '', '2', '7', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866301533281', '2', '14772865293066423', '厂商信息列表', '', '/infomanage/factory/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866557058439', '3', '14772865535855333', '项目信息录入', '', '/infomanage/project/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866691464823', '2', '14772865535855333', '项目信息列表', '', '/infomanage/project/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1477286681754305', '3', '14772865656659681', '维护公司信息录入', '', '/infomanage/maintenanceinfo/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866946501411', '2', '14772865656659681', '维护公司信息列表', '', '/infomanage/maintenanceinfo/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772867720972587', '0', '14772850175791039', '资产购置', '', '', null, '', '2', '4', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772868833544411', '0', '14772850175791039', '资产报损', '', '', null, '', '2', '5', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772869040906982', '0', '14772850175791039', '资产维护', '', '', null, '', '2', '6', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772869338986538', '3', '14772850175791039', '资产分配', '', '', null, '', '2', '7', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14776646808332094', '3', '14772852154601912', '资产信息录入', '', '/assetmanage/assetinf/add', null, '', '3', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14776653739281452', '1', '14772852154601912', '资产信息查询', '', '/assetmanage/assetinf/toList', null, '', '3', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('1477715034403106', '2', '14772865293066423', '厂商信息录入', '', '/infomanage/factory/add', null, '', '4', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14780065880442581', '5', '14772869338986538', '资产调拨', '', '/assetmanage/assetchange/toList', null, '', '3', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14780066093199238', '3', '14772869338986538', '资产领用录入', '', '/assetmanage/assetchange/add', null, '', '3', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14782606966832601', '3', '14772869040906982', '资产维护记录录入', '', '/assetmanage/maintenancerecord/add', null, '', '3', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14782607424387931', '2', '14772869040906982', '资产检修结果查询', '', '/assetmanage/maintenancerecord/toList', null, '', '3', '3', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14782633352623820', '1', '14772868833544411', '资产报损申请', '', '/assetmanage/assetdamage/add', null, '', '3', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14782633829122057', '1', '14772868833544411', '资产报损审批', '', '/assetmanage/assetdamage/toList', null, '', '3', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14785045271273603', '1', '14772867720972587', '资产购置申请', '', '/assetmanage/assetpurchaseapplication/add', null, '', '3', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14785045598538851', '1', '14772867720972587', '资产购置审批', '', '/assetmanage/assetpurchaseapplication/toList', null, '', '3', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14791878843775339', '1', '0', '运维管理', '', '', null, '', '1', '3', 'yw', '1');
INSERT INTO `t_menu` VALUES ('14791879007831607', '0', '14791878843775339', '机房巡检', '', '', null, '', '2', '1', 'yw', '1');
INSERT INTO `t_menu` VALUES ('14791879129308478', '0', '14791878843775339', '运维计划', '', '', null, '', '2', '2', 'yw', '1');
INSERT INTO `t_menu` VALUES ('14791879252345703', '0', '14791878843775339', '机柜管理', '', '', null, '', '2', '3', 'yw', '1');
INSERT INTO `t_menu` VALUES ('14800420921314586', '3', '1420711336094951', '资产类别', '', '', null, '', '2', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14800422049112745', '4', '14800420921314586', '资产类别录入', '', '/assetmanage/assetcla/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14800422713788163', '3', '14800420921314586', '资产类别列表', '', '/assetmanage/assetcla/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14804871453306101', '0', '14772852690089630', '部门组织结构', '', '', null, '', '3', '3', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14808271283548721', '1', '14772852154601912', '资产名称录入', '', '/assetmanage/assetnam/add', null, '', '3', '3', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14808272251136452', '1', '14772852154601912', '资产名称列表', '', '/assetmanage/assetnam/toList', null, '', '3', '4', 'asset', '1');

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `projectId` varchar(32) NOT NULL,
  `projectName` varchar(100) DEFAULT NULL,
  `projectHead` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='项目';

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('14821931073053551', '安全应急畅通', '肖珍军');
INSERT INTO `t_project` VALUES ('14821931250282791', '四级协同', '李聪');
INSERT INTO `t_project` VALUES ('14827421771668467', '统计分析', '计划统计');
INSERT INTO `t_project` VALUES ('14827422231159708', '房屋租赁', '机房租赁');
INSERT INTO `t_project` VALUES ('14827422418589632', '信用评价', '信用评价');
INSERT INTO `t_project` VALUES ('14827422527478115', '12328平台', '12328');
INSERT INTO `t_project` VALUES ('14827422673984346', '2016政府采购', '龚季辉');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_Id` varchar(32) NOT NULL COMMENT '角色编码',
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('10001', '系统管理员');
INSERT INTO `t_role` VALUES ('1422880482333465', '部门负责人');
INSERT INTO `t_role` VALUES ('14228805802388332', '中心领导');
INSERT INTO `t_role` VALUES ('14258850553263939', '项目负责人');
INSERT INTO `t_role` VALUES ('14258851133783221', '资产管理员');
INSERT INTO `t_role` VALUES ('14821390374697312', '一般用户');

-- ----------------------------
-- Table structure for `t_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_auth`;
CREATE TABLE `t_role_auth` (
  `roleAuth_Id` varchar(32) NOT NULL COMMENT '编码',
  `roleId` varchar(32) NOT NULL COMMENT '角色编码',
  `authId` varchar(32) NOT NULL COMMENT '权限编码',
  PRIMARY KEY (`roleAuth_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='角色权限表';

-- ----------------------------
-- Records of t_role_auth
-- ----------------------------
INSERT INTO `t_role_auth` VALUES ('14514480668851433', '14228805608164580', '1420772567611964');
INSERT INTO `t_role_auth` VALUES ('14514480668861890', '14228805608164580', '1420772124693379');
INSERT INTO `t_role_auth` VALUES ('1451448066886394', '14228805608164580', '1420773694450030');
INSERT INTO `t_role_auth` VALUES ('14514480668865609', '14228805608164580', '1420773659157244');
INSERT INTO `t_role_auth` VALUES ('1451448066887464', '14228805608164580', '1420773711773276');
INSERT INTO `t_role_auth` VALUES ('14514480668874762', '14228805608164580', '1420773742294509');
INSERT INTO `t_role_auth` VALUES ('1451448066887490', '14228805608164580', '1420773788413401');
INSERT INTO `t_role_auth` VALUES ('14514480668876054', '14228805608164580', '1420773726030363');
INSERT INTO `t_role_auth` VALUES ('14514480668882961', '14228805608164580', '14207798603537179');
INSERT INTO `t_role_auth` VALUES ('14514480668885969', '14228805608164580', '1420773672158823');
INSERT INTO `t_role_auth` VALUES ('14514480668887812', '14228805608164580', '1420773869301261');
INSERT INTO `t_role_auth` VALUES ('14514480668893856', '14228805608164580', '1420779368218445');
INSERT INTO `t_role_auth` VALUES ('14514480668896764', '14228805608164580', '14207793973677986');
INSERT INTO `t_role_auth` VALUES ('14514480668897367', '14228805608164580', '14207792181559705');
INSERT INTO `t_role_auth` VALUES ('14514480668897672', '14228805608164580', '14207793349437128');
INSERT INTO `t_role_auth` VALUES ('14514480668903631', '14228805608164580', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14514480668904311', '14228805608164580', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14514480668908605', '14228805608164580', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14514480668912829', '14228805608164580', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14785964200498460', '10001', '1420772233319582');
INSERT INTO `t_role_auth` VALUES ('14785964200508031', '10001', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14785964200508521', '10001', '1420774275777703');
INSERT INTO `t_role_auth` VALUES ('14785964200512884', '10001', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('14785964200513259', '10001', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14785964200521003', '10001', '1420774377287220');
INSERT INTO `t_role_auth` VALUES ('14785964200525953', '10001', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('14785964200531579', '10001', '1420774290241732');
INSERT INTO `t_role_auth` VALUES ('14785964200536708', '10001', '1420774405744078');
INSERT INTO `t_role_auth` VALUES ('1478596420053770', '10001', '1420774396362234');
INSERT INTO `t_role_auth` VALUES ('1478596420054152', '10001', '1420774413825368');
INSERT INTO `t_role_auth` VALUES ('14785964200542191', '10001', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('14785964200553483', '10001', '14207810436186945');
INSERT INTO `t_role_auth` VALUES ('14785964200559027', '10001', '1420774304817411');
INSERT INTO `t_role_auth` VALUES ('14785964200568316', '10001', '1420774445780262');
INSERT INTO `t_role_auth` VALUES ('14785964200578012', '10001', '1420774455327507');
INSERT INTO `t_role_auth` VALUES ('14785964200582488', '10001', '1420774474960970');
INSERT INTO `t_role_auth` VALUES ('14785964200588611', '10001', '1420774465765368');
INSERT INTO `t_role_auth` VALUES ('14785964200593827', '10001', '14207789119125323');
INSERT INTO `t_role_auth` VALUES ('1478596420059966', '10001', '14207789758687084');
INSERT INTO `t_role_auth` VALUES ('14785964200602604', '10001', '14777143194701213');
INSERT INTO `t_role_auth` VALUES ('1478596420060969', '10001', '14777143499375662');
INSERT INTO `t_role_auth` VALUES ('14785964200615070', '10001', '14777144360006547');
INSERT INTO `t_role_auth` VALUES ('14785964200615862', '10001', '14777143750578757');
INSERT INTO `t_role_auth` VALUES ('14785964200626897', '10001', '14777144706536288');
INSERT INTO `t_role_auth` VALUES ('1478596420062905', '10001', '14777144572177847');
INSERT INTO `t_role_auth` VALUES ('14785964200631178', '10001', '14777148581064596');
INSERT INTO `t_role_auth` VALUES ('14785964200638749', '10001', '14777149181067674');
INSERT INTO `t_role_auth` VALUES ('14785964200644845', '10001', '14777149513063257');
INSERT INTO `t_role_auth` VALUES ('14785964200645287', '10001', '14777149288109088');
INSERT INTO `t_role_auth` VALUES ('14785964200648327', '10001', '14777149392661832');
INSERT INTO `t_role_auth` VALUES ('14785964200652752', '10001', '14777149643932508');
INSERT INTO `t_role_auth` VALUES ('14785964200661025', '10001', '1478487021885848');
INSERT INTO `t_role_auth` VALUES ('14785964200666154', '10001', '14784870074146684');
INSERT INTO `t_role_auth` VALUES ('14785964200668562', '10001', '1478486994792483');
INSERT INTO `t_role_auth` VALUES ('14785964200678336', '10001', '14784873138778774');
INSERT INTO `t_role_auth` VALUES ('14785964200679165', '10001', '14784873221686214');
INSERT INTO `t_role_auth` VALUES ('14785964200686799', '10001', '14784873328314974');
INSERT INTO `t_role_auth` VALUES ('14785964200689082', '10001', '14784873545301112');
INSERT INTO `t_role_auth` VALUES ('14785964200691231', '10001', '14785100090317796');
INSERT INTO `t_role_auth` VALUES ('14785964200696197', '10001', '14785100223479638');
INSERT INTO `t_role_auth` VALUES ('14785964200696698', '10001', '14785100377978274');
INSERT INTO `t_role_auth` VALUES ('1478596420070449', '10001', '14785101037749072');
INSERT INTO `t_role_auth` VALUES ('14785964200704717', '10001', '14785100933292913');
INSERT INTO `t_role_auth` VALUES ('14785964200713651', '10001', '14785101288548767');
INSERT INTO `t_role_auth` VALUES ('14785964200718872', '10001', '14784873753116374');
INSERT INTO `t_role_auth` VALUES ('1478596420072645', '10001', '1478510151590919');
INSERT INTO `t_role_auth` VALUES ('14785964200727465', '10001', '14785101696905628');
INSERT INTO `t_role_auth` VALUES ('14785964200733002', '10001', '14785101803569413');
INSERT INTO `t_role_auth` VALUES ('14785964200736688', '10001', '14785101902852840');
INSERT INTO `t_role_auth` VALUES ('1478596420074494', '10001', '1420774542863414');
INSERT INTO `t_role_auth` VALUES ('14785964200746386', '10001', '1420772254227721');
INSERT INTO `t_role_auth` VALUES ('14785964200751122', '10001', '1420774613888712');
INSERT INTO `t_role_auth` VALUES ('1478596420075465', '10001', '1420774623216907');
INSERT INTO `t_role_auth` VALUES ('14785964200762169', '10001', '1420774631600043');
INSERT INTO `t_role_auth` VALUES ('1478596420076633', '10001', '1420774641375167');
INSERT INTO `t_role_auth` VALUES ('14785964200772211', '10001', '1420774700409999');
INSERT INTO `t_role_auth` VALUES ('14785964200772431', '10001', '1420775963441954');
INSERT INTO `t_role_auth` VALUES ('14785964200781515', '10001', '1420774667698457');
INSERT INTO `t_role_auth` VALUES ('14785964200787635', '10001', '1420774553720576');
INSERT INTO `t_role_auth` VALUES ('14785964200791524', '10001', '1420774714071975');
INSERT INTO `t_role_auth` VALUES ('1478596420079992', '10001', '1420774724213717');
INSERT INTO `t_role_auth` VALUES ('14785964200801049', '10001', '1420775979999883');
INSERT INTO `t_role_auth` VALUES ('14785964200801750', '10001', '1420774745961527');
INSERT INTO `t_role_auth` VALUES ('14785964200802069', '10001', '1420774737226827');
INSERT INTO `t_role_auth` VALUES ('1478596420081723', '10001', '1420774582018270');
INSERT INTO `t_role_auth` VALUES ('14785964200819226', '10001', '1420774769821826');
INSERT INTO `t_role_auth` VALUES ('14785964200826276', '10001', '1420774792080143');
INSERT INTO `t_role_auth` VALUES ('14785964200829939', '10001', '1420774783343847');
INSERT INTO `t_role_auth` VALUES ('14785964200836345', '10001', '1420774803540383');
INSERT INTO `t_role_auth` VALUES ('14785964200836452', '10001', '1420782568463801');
INSERT INTO `t_role_auth` VALUES ('14785964200845320', '10001', '14207826192878641');
INSERT INTO `t_role_auth` VALUES ('14785964200845591', '10001', '14207826306574883');
INSERT INTO `t_role_auth` VALUES ('14785964200854789', '10001', '14211382908723036');
INSERT INTO `t_role_auth` VALUES ('1478596420085570', '10001', '14207825834738015');
INSERT INTO `t_role_auth` VALUES ('14785964200863216', '10001', '14211383048565271');
INSERT INTO `t_role_auth` VALUES ('14785964200872249', '10001', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14785964200874417', '10001', '14211383168242947');
INSERT INTO `t_role_auth` VALUES ('14785964200883365', '10001', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14785964200884008', '10001', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('1478596420089272', '10001', '14784874195752946');
INSERT INTO `t_role_auth` VALUES ('14785964200894099', '10001', '14784874389606424');
INSERT INTO `t_role_auth` VALUES ('14785964200897448', '10001', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14785964200908796', '10001', '14784875849733532');
INSERT INTO `t_role_auth` VALUES ('1478596420090955', '10001', '14784875722465491');
INSERT INTO `t_role_auth` VALUES ('14785964200912680', '10001', '14784876054547554');
INSERT INTO `t_role_auth` VALUES ('14785964200915581', '10001', '14784875957984025');
INSERT INTO `t_role_auth` VALUES ('14785964200921679', '10001', '14784874544381495');
INSERT INTO `t_role_auth` VALUES ('14785964200924696', '10001', '14784876172349600');
INSERT INTO `t_role_auth` VALUES ('14785964200928354', '10001', '14784876345205741');
INSERT INTO `t_role_auth` VALUES ('14785964200933663', '10001', '14784876616498650');
INSERT INTO `t_role_auth` VALUES ('14785964200935954', '10001', '14784876522718348');
INSERT INTO `t_role_auth` VALUES ('14785964200946413', '10001', '14784876722856535');
INSERT INTO `t_role_auth` VALUES ('14785964200949921', '10001', '14784877440817947');
INSERT INTO `t_role_auth` VALUES ('14785964200954762', '10001', '14785070950148522');
INSERT INTO `t_role_auth` VALUES ('14785964200957863', '10001', '14785071149222369');
INSERT INTO `t_role_auth` VALUES ('14785964200959396', '10001', '14784874669413763');
INSERT INTO `t_role_auth` VALUES ('14785964200963203', '10001', '14785071518515794');
INSERT INTO `t_role_auth` VALUES ('14785964200969298', '10001', '14785071325716626');
INSERT INTO `t_role_auth` VALUES ('14785964200971318', '10001', '14784874785412142');
INSERT INTO `t_role_auth` VALUES ('14785964200975678', '10001', '14785071689358439');
INSERT INTO `t_role_auth` VALUES ('14785964200982351', '10001', '14785072161004562');
INSERT INTO `t_role_auth` VALUES ('14785964200983949', '10001', '14785072436474249');
INSERT INTO `t_role_auth` VALUES ('14785964200986644', '10001', '14785072297496863');
INSERT INTO `t_role_auth` VALUES ('14785964200997577', '10001', '14785072707329018');
INSERT INTO `t_role_auth` VALUES ('14785964200998730', '10001', '14785072582462239');
INSERT INTO `t_role_auth` VALUES ('14785964201001407', '10001', '14785072919453138');
INSERT INTO `t_role_auth` VALUES ('14785964201004957', '10001', '14784874908492191');
INSERT INTO `t_role_auth` VALUES ('14785964201012198', '10001', '14785074153357410');
INSERT INTO `t_role_auth` VALUES ('14785964201015708', '10001', '14785073184264158');
INSERT INTO `t_role_auth` VALUES ('14785964201016209', '10001', '14785073386413010');
INSERT INTO `t_role_auth` VALUES ('14785964201023270', '10001', '14784875032477664');
INSERT INTO `t_role_auth` VALUES ('14785964201024655', '10001', '14785074297514576');
INSERT INTO `t_role_auth` VALUES ('14785964201033515', '10001', '14785074551537161');
INSERT INTO `t_role_auth` VALUES ('14785964201035955', '10001', '14785074445501110');
INSERT INTO `t_role_auth` VALUES ('14785964201036463', '10001', '14785074712159745');
INSERT INTO `t_role_auth` VALUES ('1478596420104018', '10001', '14785075145455932');
INSERT INTO `t_role_auth` VALUES ('14785964201043737', '10001', '1478507526195476');
INSERT INTO `t_role_auth` VALUES ('14785964201047053', '10001', '14785074968001502');
INSERT INTO `t_role_auth` VALUES ('14785964201047401', '10001', '14785074848165802');
INSERT INTO `t_role_auth` VALUES ('1478596420104767', '10001', '14784875138754152');
INSERT INTO `t_role_auth` VALUES ('14785964201056061', '10001', '14785075497951182');
INSERT INTO `t_role_auth` VALUES ('14785964201056529', '10001', '14785075372468672');
INSERT INTO `t_role_auth` VALUES ('14785964201057814', '10001', '1478507561512614');
INSERT INTO `t_role_auth` VALUES ('14821390374695732', '14821390374697312', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14821390374841000', '14821390374697312', '14785072297496863');
INSERT INTO `t_role_auth` VALUES ('14821390374841027', '14821390374697312', '14785074848165802');
INSERT INTO `t_role_auth` VALUES ('14821390374841862', '14821390374697312', '14785074551537161');
INSERT INTO `t_role_auth` VALUES ('14821390374842007', '14821390374697312', '14785074712159745');
INSERT INTO `t_role_auth` VALUES ('14821390374842842', '14821390374697312', '14784874785412142');
INSERT INTO `t_role_auth` VALUES ('14821390374843599', '14821390374697312', '14785072582462239');
INSERT INTO `t_role_auth` VALUES ('14821390374843685', '14821390374697312', '14785072161004562');
INSERT INTO `t_role_auth` VALUES ('14821390374844063', '14821390374697312', '14785074445501110');
INSERT INTO `t_role_auth` VALUES ('14821390374844209', '14821390374697312', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14821390374844828', '14821390374697312', '14784875032477664');
INSERT INTO `t_role_auth` VALUES ('14821390374844830', '14821390374697312', '14785074153357410');
INSERT INTO `t_role_auth` VALUES ('14821390374845141', '14821390374697312', '14784876172349600');
INSERT INTO `t_role_auth` VALUES ('14821390374846113', '14821390374697312', '14785073386413010');
INSERT INTO `t_role_auth` VALUES ('14821390374846827', '14821390374697312', '14785072436474249');
INSERT INTO `t_role_auth` VALUES ('14821390374846989', '14821390374697312', '14785072707329018');
INSERT INTO `t_role_auth` VALUES ('14821390374847133', '14821390374697312', '14785074297514576');
INSERT INTO `t_role_auth` VALUES ('1482139037484732', '14821390374697312', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14821390374847682', '14821390374697312', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14821390374849315', '14821390374697312', '14785072919453138');
INSERT INTO `t_role_auth` VALUES ('14821390374849605', '14821390374697312', '14784874908492191');
INSERT INTO `t_role_auth` VALUES ('14821390374849704', '14821390374697312', '14784875957984025');
INSERT INTO `t_role_auth` VALUES ('14821390374849773', '14821390374697312', '14785073184264158');
INSERT INTO `t_role_auth` VALUES ('14821390374849993', '14821390374697312', '14785074968001502');
INSERT INTO `t_role_auth` VALUES ('14827977642251084', '14258850553263939', '1420774413825368');
INSERT INTO `t_role_auth` VALUES ('1482797764225240', '14258850553263939', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14827977642252427', '14258850553263939', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14827977642252457', '14258850553263939', '1420774445780262');
INSERT INTO `t_role_auth` VALUES ('14827977642252520', '14258850553263939', '1420774465765368');
INSERT INTO `t_role_auth` VALUES ('14827977642253988', '14258850553263939', '1420774290241732');
INSERT INTO `t_role_auth` VALUES ('14827977642254246', '14258850553263939', '1420774455327507');
INSERT INTO `t_role_auth` VALUES ('14827977642254386', '14258850553263939', '14207810436186945');
INSERT INTO `t_role_auth` VALUES ('14827977642254484', '14258850553263939', '1420774405744078');
INSERT INTO `t_role_auth` VALUES ('14827977642254785', '14258850553263939', '1420774396362234');
INSERT INTO `t_role_auth` VALUES ('14827977642254868', '14258850553263939', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14827977642255109', '14258850553263939', '14207789758687084');
INSERT INTO `t_role_auth` VALUES ('14827977642255239', '14258850553263939', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14827977642256674', '14258850553263939', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14827977642256742', '14258850553263939', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14827977642257186', '14258850553263939', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('14827977642257276', '14258850553263939', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('14827977642257296', '14258850553263939', '14207789119125323');
INSERT INTO `t_role_auth` VALUES ('14827977642257406', '14258850553263939', '1420774304817411');
INSERT INTO `t_role_auth` VALUES ('14827977642257735', '14258850553263939', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('1482797764225791', '14258850553263939', '1420774474960970');
INSERT INTO `t_role_auth` VALUES ('14827977642258161', '14258850553263939', '1420774377287220');
INSERT INTO `t_role_auth` VALUES ('1482797764225878', '14258850553263939', '1420774275777703');
INSERT INTO `t_role_auth` VALUES ('14827977642258923', '14258850553263939', '1420772233319582');
INSERT INTO `t_role_auth` VALUES ('14827977843883348', '14258851133783221', '14784874195752946');
INSERT INTO `t_role_auth` VALUES ('1482797784404020', '14258851133783221', '14777143194701213');
INSERT INTO `t_role_auth` VALUES ('14827977844041046', '14258851133783221', '14785072161004562');
INSERT INTO `t_role_auth` VALUES ('1482797784404113', '14258851133783221', '14784877440817947');
INSERT INTO `t_role_auth` VALUES ('14827977844041696', '14258851133783221', '14785072436474249');
INSERT INTO `t_role_auth` VALUES ('14827977844041736', '14258851133783221', '14785071325716626');
INSERT INTO `t_role_auth` VALUES ('14827977844041824', '14258851133783221', '14785072582462239');
INSERT INTO `t_role_auth` VALUES ('14827977844042779', '14258851133783221', '1420774290241732');
INSERT INTO `t_role_auth` VALUES ('1482797784404301', '14258851133783221', '14785071149222369');
INSERT INTO `t_role_auth` VALUES ('14827977844043087', '14258851133783221', '14785072297496863');
INSERT INTO `t_role_auth` VALUES ('14827977844043154', '14258851133783221', '14784875138754152');
INSERT INTO `t_role_auth` VALUES ('14827977844043330', '14258851133783221', '14784874389606424');
INSERT INTO `t_role_auth` VALUES ('14827977844043388', '14258851133783221', '1420772233319582');
INSERT INTO `t_role_auth` VALUES ('14827977844043403', '14258851133783221', '1420774275777703');
INSERT INTO `t_role_auth` VALUES ('14827977844043453', '14258851133783221', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14827977844043680', '14258851133783221', '14784876522718348');
INSERT INTO `t_role_auth` VALUES ('1482797784404369', '14258851133783221', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14827977844043879', '14258851133783221', '14784873753116374');
INSERT INTO `t_role_auth` VALUES ('14827977844043987', '14258851133783221', '14784875849733532');
INSERT INTO `t_role_auth` VALUES ('14827977844044565', '14258851133783221', '14784875722465491');
INSERT INTO `t_role_auth` VALUES ('14827977844044674', '14258851133783221', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14827977844044878', '14258851133783221', '14785073184264158');
INSERT INTO `t_role_auth` VALUES ('14827977844045320', '14258851133783221', '14777148581064596');
INSERT INTO `t_role_auth` VALUES ('14827977844045363', '14258851133783221', '14784874544381495');
INSERT INTO `t_role_auth` VALUES ('14827977844045771', '14258851133783221', '14784876054547554');
INSERT INTO `t_role_auth` VALUES ('1482797784404582', '14258851133783221', '14784875032477664');
INSERT INTO `t_role_auth` VALUES ('14827977844046208', '14258851133783221', '1420774304817411');
INSERT INTO `t_role_auth` VALUES ('14827977844046569', '14258851133783221', '14784873545301112');
INSERT INTO `t_role_auth` VALUES ('14827977844046573', '14258851133783221', '14785071518515794');
INSERT INTO `t_role_auth` VALUES ('14827977844046610', '14258851133783221', '14785072919453138');
INSERT INTO `t_role_auth` VALUES ('14827977844046633', '14258851133783221', '14784876616498650');
INSERT INTO `t_role_auth` VALUES ('14827977844046871', '14258851133783221', '1478486994792483');
INSERT INTO `t_role_auth` VALUES ('14827977844046926', '14258851133783221', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14827977844047165', '14258851133783221', '14784876172349600');
INSERT INTO `t_role_auth` VALUES ('14827977844048441', '14258851133783221', '14785072707329018');
INSERT INTO `t_role_auth` VALUES ('14827977844048849', '14258851133783221', '14784874669413763');
INSERT INTO `t_role_auth` VALUES ('14827977844048986', '14258851133783221', '14784874908492191');
INSERT INTO `t_role_auth` VALUES ('14827977844049310', '14258851133783221', '14784876722856535');
INSERT INTO `t_role_auth` VALUES ('14827977844049502', '14258851133783221', '14784875957984025');
INSERT INTO `t_role_auth` VALUES ('14827977844049548', '14258851133783221', '14784874785412142');
INSERT INTO `t_role_auth` VALUES ('14827977844049643', '14258851133783221', '14785071689358439');
INSERT INTO `t_role_auth` VALUES ('14827977844049670', '14258851133783221', '14784876345205741');
INSERT INTO `t_role_auth` VALUES ('14827977844049825', '14258851133783221', '14785070950148522');
INSERT INTO `t_role_auth` VALUES ('14827977844191142', '14258851133783221', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('14827977844191175', '14258851133783221', '1420774474960970');
INSERT INTO `t_role_auth` VALUES ('14827977844191181', '14258851133783221', '1478487021885848');
INSERT INTO `t_role_auth` VALUES ('1482797784419129', '14258851133783221', '14777144360006547');
INSERT INTO `t_role_auth` VALUES ('14827977844191859', '14258851133783221', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14827977844192305', '14258851133783221', '14207789758687084');
INSERT INTO `t_role_auth` VALUES ('14827977844192418', '14258851133783221', '14777143750578757');
INSERT INTO `t_role_auth` VALUES ('14827977844192585', '14258851133783221', '14785074153357410');
INSERT INTO `t_role_auth` VALUES ('14827977844193135', '14258851133783221', '14785074445501110');
INSERT INTO `t_role_auth` VALUES ('14827977844193190', '14258851133783221', '14777144706536288');
INSERT INTO `t_role_auth` VALUES ('14827977844193496', '14258851133783221', '14207810436186945');
INSERT INTO `t_role_auth` VALUES ('14827977844193572', '14258851133783221', '1420774413825368');
INSERT INTO `t_role_auth` VALUES ('14827977844193678', '14258851133783221', '14784873221686214');
INSERT INTO `t_role_auth` VALUES ('14827977844193745', '14258851133783221', '1478507561512614');
INSERT INTO `t_role_auth` VALUES ('14827977844194005', '14258851133783221', '14777144572177847');
INSERT INTO `t_role_auth` VALUES ('1482797784419403', '14258851133783221', '14207789119125323');
INSERT INTO `t_role_auth` VALUES ('14827977844194505', '14258851133783221', '14784873328314974');
INSERT INTO `t_role_auth` VALUES ('14827977844194606', '14258851133783221', '1420774455327507');
INSERT INTO `t_role_auth` VALUES ('14827977844194639', '14258851133783221', '14785074297514576');
INSERT INTO `t_role_auth` VALUES ('14827977844194734', '14258851133783221', '14777149181067674');
INSERT INTO `t_role_auth` VALUES ('14827977844194783', '14258851133783221', '14785074712159745');
INSERT INTO `t_role_auth` VALUES ('14827977844194986', '14258851133783221', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14827977844195660', '14258851133783221', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('14827977844195878', '14258851133783221', '14777149643932508');
INSERT INTO `t_role_auth` VALUES ('14827977844196046', '14258851133783221', '14785073386413010');
INSERT INTO `t_role_auth` VALUES ('14827977844196127', '14258851133783221', '1420774377287220');
INSERT INTO `t_role_auth` VALUES ('14827977844196213', '14258851133783221', '14777149288109088');
INSERT INTO `t_role_auth` VALUES ('14827977844196490', '14258851133783221', '14777149513063257');
INSERT INTO `t_role_auth` VALUES ('14827977844196592', '14258851133783221', '1420774445780262');
INSERT INTO `t_role_auth` VALUES ('14827977844196602', '14258851133783221', '14785074848165802');
INSERT INTO `t_role_auth` VALUES ('14827977844196739', '14258851133783221', '1420774396362234');
INSERT INTO `t_role_auth` VALUES ('14827977844196744', '14258851133783221', '14785075145455932');
INSERT INTO `t_role_auth` VALUES ('14827977844197635', '14258851133783221', '14785075372468672');
INSERT INTO `t_role_auth` VALUES ('14827977844197841', '14258851133783221', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('14827977844198102', '14258851133783221', '14785074551537161');
INSERT INTO `t_role_auth` VALUES ('14827977844198478', '14258851133783221', '1420774405744078');
INSERT INTO `t_role_auth` VALUES ('14827977844198534', '14258851133783221', '14784873138778774');
INSERT INTO `t_role_auth` VALUES ('14827977844198906', '14258851133783221', '1420774465765368');
INSERT INTO `t_role_auth` VALUES ('14827977844199257', '14258851133783221', '1478507526195476');
INSERT INTO `t_role_auth` VALUES ('14827977844199404', '14258851133783221', '14785074968001502');
INSERT INTO `t_role_auth` VALUES ('14827977844199443', '14258851133783221', '14784870074146684');
INSERT INTO `t_role_auth` VALUES ('14827977844199761', '14258851133783221', '14777149392661832');
INSERT INTO `t_role_auth` VALUES ('14827977844199802', '14258851133783221', '14785075497951182');
INSERT INTO `t_role_auth` VALUES ('14827977844199910', '14258851133783221', '14777143499375662');
INSERT INTO `t_role_auth` VALUES ('1482797784435115', '14258851133783221', '14785100377978274');
INSERT INTO `t_role_auth` VALUES ('14827977844351889', '14258851133783221', '14785100223479638');
INSERT INTO `t_role_auth` VALUES ('14827977844352066', '14258851133783221', '14785101902852840');
INSERT INTO `t_role_auth` VALUES ('14827977844355612', '14258851133783221', '14785100090317796');
INSERT INTO `t_role_auth` VALUES ('14827977844356465', '14258851133783221', '1478510151590919');
INSERT INTO `t_role_auth` VALUES ('1482797784435699', '14258851133783221', '14785101037749072');
INSERT INTO `t_role_auth` VALUES ('14827977844357518', '14258851133783221', '14785100933292913');
INSERT INTO `t_role_auth` VALUES ('14827977844357953', '14258851133783221', '14785101288548767');
INSERT INTO `t_role_auth` VALUES ('1482797784435798', '14258851133783221', '14785101803569413');
INSERT INTO `t_role_auth` VALUES ('14827977844358301', '14258851133783221', '14785101696905628');
INSERT INTO `t_role_auth` VALUES ('14830808073761627', '1422880482333465', '1420772233319582');
INSERT INTO `t_role_auth` VALUES ('14830808073763906', '1422880482333465', '1420774275777703');
INSERT INTO `t_role_auth` VALUES ('14830808073765774', '1422880482333465', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('14830808073769770', '1422880482333465', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14830808073916513', '1422880482333465', '1420774377287220');
INSERT INTO `t_role_auth` VALUES ('14830808073917354', '1422880482333465', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14830808073922131', '1422880482333465', '14777149392661832');
INSERT INTO `t_role_auth` VALUES ('14830808073922529', '1422880482333465', '1420774455327507');
INSERT INTO `t_role_auth` VALUES ('1483080807392288', '1422880482333465', '1420774445780262');
INSERT INTO `t_role_auth` VALUES ('14830808073923183', '1422880482333465', '14777143194701213');
INSERT INTO `t_role_auth` VALUES ('14830808073923343', '1422880482333465', '14777149643932508');
INSERT INTO `t_role_auth` VALUES ('14830808073923445', '1422880482333465', '14785100223479638');
INSERT INTO `t_role_auth` VALUES ('14830808073923496', '1422880482333465', '1420774405744078');
INSERT INTO `t_role_auth` VALUES ('14830808073923509', '1422880482333465', '1420774304817411');
INSERT INTO `t_role_auth` VALUES ('14830808073923717', '1422880482333465', '14777143750578757');
INSERT INTO `t_role_auth` VALUES ('14830808073923931', '1422880482333465', '14207789119125323');
INSERT INTO `t_role_auth` VALUES ('14830808073924031', '1422880482333465', '1420774413825368');
INSERT INTO `t_role_auth` VALUES ('14830808073924251', '1422880482333465', '14784873138778774');
INSERT INTO `t_role_auth` VALUES ('14830808073924716', '1422880482333465', '1478487021885848');
INSERT INTO `t_role_auth` VALUES ('14830808073925476', '1422880482333465', '14777149288109088');
INSERT INTO `t_role_auth` VALUES ('14830808073925666', '1422880482333465', '1420774290241732');
INSERT INTO `t_role_auth` VALUES ('14830808073925826', '1422880482333465', '1420774465765368');
INSERT INTO `t_role_auth` VALUES ('14830808073925954', '1422880482333465', '1420774474960970');
INSERT INTO `t_role_auth` VALUES ('14830808073926123', '1422880482333465', '1478486994792483');
INSERT INTO `t_role_auth` VALUES ('14830808073926255', '1422880482333465', '1420774396362234');
INSERT INTO `t_role_auth` VALUES ('14830808073926626', '1422880482333465', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('14830808073926779', '1422880482333465', '14777144706536288');
INSERT INTO `t_role_auth` VALUES ('14830808073926894', '1422880482333465', '14785100090317796');
INSERT INTO `t_role_auth` VALUES ('14830808073927021', '1422880482333465', '14784873328314974');
INSERT INTO `t_role_auth` VALUES ('14830808073927654', '1422880482333465', '14777144572177847');
INSERT INTO `t_role_auth` VALUES ('1483080807392788', '1422880482333465', '14784873221686214');
INSERT INTO `t_role_auth` VALUES ('14830808073928034', '1422880482333465', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('14830808073928142', '1422880482333465', '14777149181067674');
INSERT INTO `t_role_auth` VALUES ('1483080807392854', '1422880482333465', '14784873545301112');
INSERT INTO `t_role_auth` VALUES ('14830808073928769', '1422880482333465', '14777148581064596');
INSERT INTO `t_role_auth` VALUES ('14830808073929017', '1422880482333465', '14777143499375662');
INSERT INTO `t_role_auth` VALUES ('14830808073929281', '1422880482333465', '14777149513063257');
INSERT INTO `t_role_auth` VALUES ('1483080807392959', '1422880482333465', '14784870074146684');
INSERT INTO `t_role_auth` VALUES ('14830808073929602', '1422880482333465', '14207810436186945');
INSERT INTO `t_role_auth` VALUES ('14830808073929919', '1422880482333465', '14207789758687084');
INSERT INTO `t_role_auth` VALUES ('14830808073929973', '1422880482333465', '14777144360006547');
INSERT INTO `t_role_auth` VALUES ('1483080807408019', '1422880482333465', '14785072161004562');
INSERT INTO `t_role_auth` VALUES ('14830808074081112', '1422880482333465', '14784876522718348');
INSERT INTO `t_role_auth` VALUES ('14830808074081188', '1422880482333465', '14784874785412142');
INSERT INTO `t_role_auth` VALUES ('14830808074081362', '1422880482333465', '14785071149222369');
INSERT INTO `t_role_auth` VALUES ('1483080807408176', '1422880482333465', '14784874669413763');
INSERT INTO `t_role_auth` VALUES ('14830808074082062', '1422880482333465', '14785101037749072');
INSERT INTO `t_role_auth` VALUES ('1483080807408231', '1422880482333465', '14785101803569413');
INSERT INTO `t_role_auth` VALUES ('14830808074082392', '1422880482333465', '14784876054547554');
INSERT INTO `t_role_auth` VALUES ('14830808074082457', '1422880482333465', '1478510151590919');
INSERT INTO `t_role_auth` VALUES ('14830808074082719', '1422880482333465', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14830808074082782', '1422880482333465', '14785072436474249');
INSERT INTO `t_role_auth` VALUES ('14830808074082840', '1422880482333465', '14785070950148522');
INSERT INTO `t_role_auth` VALUES ('14830808074083074', '1422880482333465', '14784874389606424');
INSERT INTO `t_role_auth` VALUES ('14830808074083642', '1422880482333465', '14784877440817947');
INSERT INTO `t_role_auth` VALUES ('14830808074083702', '1422880482333465', '14784875722465491');
INSERT INTO `t_role_auth` VALUES ('14830808074083893', '1422880482333465', '14785101288548767');
INSERT INTO `t_role_auth` VALUES ('14830808074083929', '1422880482333465', '14784876616498650');
INSERT INTO `t_role_auth` VALUES ('1483080807408394', '1422880482333465', '14785072707329018');
INSERT INTO `t_role_auth` VALUES ('14830808074084611', '1422880482333465', '14784874544381495');
INSERT INTO `t_role_auth` VALUES ('14830808074084708', '1422880482333465', '14785071325716626');
INSERT INTO `t_role_auth` VALUES ('14830808074085464', '1422880482333465', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14830808074086214', '1422880482333465', '14785072297496863');
INSERT INTO `t_role_auth` VALUES ('14830808074086217', '1422880482333465', '14784874908492191');
INSERT INTO `t_role_auth` VALUES ('14830808074086257', '1422880482333465', '14785100377978274');
INSERT INTO `t_role_auth` VALUES ('14830808074086444', '1422880482333465', '14784873753116374');
INSERT INTO `t_role_auth` VALUES ('14830808074086562', '1422880482333465', '14784876722856535');
INSERT INTO `t_role_auth` VALUES ('14830808074086962', '1422880482333465', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14830808074087066', '1422880482333465', '14785101696905628');
INSERT INTO `t_role_auth` VALUES ('14830808074087188', '1422880482333465', '14784875849733532');
INSERT INTO `t_role_auth` VALUES ('14830808074087293', '1422880482333465', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14830808074087633', '1422880482333465', '14785101902852840');
INSERT INTO `t_role_auth` VALUES ('14830808074087728', '1422880482333465', '14784876172349600');
INSERT INTO `t_role_auth` VALUES ('1483080807408782', '1422880482333465', '14784875957984025');
INSERT INTO `t_role_auth` VALUES ('14830808074087909', '1422880482333465', '14785072919453138');
INSERT INTO `t_role_auth` VALUES ('14830808074088319', '1422880482333465', '14785073184264158');
INSERT INTO `t_role_auth` VALUES ('1483080807408918', '1422880482333465', '14785071689358439');
INSERT INTO `t_role_auth` VALUES ('14830808074089222', '1422880482333465', '14785100933292913');
INSERT INTO `t_role_auth` VALUES ('1483080807408949', '1422880482333465', '14785071518515794');
INSERT INTO `t_role_auth` VALUES ('14830808074089873', '1422880482333465', '14784874195752946');
INSERT INTO `t_role_auth` VALUES ('14830808074089898', '1422880482333465', '14785072582462239');
INSERT INTO `t_role_auth` VALUES ('14830808074089928', '1422880482333465', '14784876345205741');
INSERT INTO `t_role_auth` VALUES ('14830808074232057', '1422880482333465', '14784875138754152');
INSERT INTO `t_role_auth` VALUES ('14830808074232176', '1422880482333465', '14785074551537161');
INSERT INTO `t_role_auth` VALUES ('14830808074232597', '1422880482333465', '14785074153357410');
INSERT INTO `t_role_auth` VALUES ('14830808074232976', '1422880482333465', '14785074445501110');
INSERT INTO `t_role_auth` VALUES ('14830808074233256', '1422880482333465', '14785074848165802');
INSERT INTO `t_role_auth` VALUES ('14830808074233784', '1422880482333465', '14785074968001502');
INSERT INTO `t_role_auth` VALUES ('14830808074235559', '1422880482333465', '14785075372468672');
INSERT INTO `t_role_auth` VALUES ('14830808074236969', '1422880482333465', '14785074297514576');
INSERT INTO `t_role_auth` VALUES ('14830808074237199', '1422880482333465', '14785075145455932');
INSERT INTO `t_role_auth` VALUES ('14830808074237235', '1422880482333465', '14785075497951182');
INSERT INTO `t_role_auth` VALUES ('14830808074237749', '1422880482333465', '14785073386413010');
INSERT INTO `t_role_auth` VALUES ('14830808074238716', '1422880482333465', '14784875032477664');
INSERT INTO `t_role_auth` VALUES ('14830808074238746', '1422880482333465', '14785074712159745');
INSERT INTO `t_role_auth` VALUES ('14830808074239630', '1422880482333465', '1478507526195476');
INSERT INTO `t_role_auth` VALUES ('14830808074239652', '1422880482333465', '1478507561512614');
INSERT INTO `t_role_auth` VALUES ('14830824581752599', '14228805802388332', '1420772233319582');
INSERT INTO `t_role_auth` VALUES ('14830824581764117', '14228805802388332', '1420774275777703');
INSERT INTO `t_role_auth` VALUES ('14830824581772560', '14228805802388332', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14830824581772743', '14228805802388332', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('1483082458178667', '14228805802388332', '1420774377287220');
INSERT INTO `t_role_auth` VALUES ('14830824581786725', '14228805802388332', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14830824581796675', '14228805802388332', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('14830824581807608', '14228805802388332', '1420774396362234');
INSERT INTO `t_role_auth` VALUES ('14830824581809504', '14228805802388332', '1420774290241732');
INSERT INTO `t_role_auth` VALUES ('14830824581813604', '14228805802388332', '1420774405744078');
INSERT INTO `t_role_auth` VALUES ('14830824581819866', '14228805802388332', '1420774413825368');
INSERT INTO `t_role_auth` VALUES ('14830824581822930', '14228805802388332', '14207810436186945');
INSERT INTO `t_role_auth` VALUES ('14830824581824274', '14228805802388332', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('14830824581832301', '14228805802388332', '1420774445780262');
INSERT INTO `t_role_auth` VALUES ('14830824581837646', '14228805802388332', '1420774304817411');
INSERT INTO `t_role_auth` VALUES ('14830824581847407', '14228805802388332', '1420774455327507');
INSERT INTO `t_role_auth` VALUES ('14830824581873430', '14228805802388332', '1420774465765368');
INSERT INTO `t_role_auth` VALUES ('14830824581883961', '14228805802388332', '1420774474960970');
INSERT INTO `t_role_auth` VALUES ('14830824581885428', '14228805802388332', '14207789119125323');
INSERT INTO `t_role_auth` VALUES ('1483082458189861', '14228805802388332', '14777143194701213');
INSERT INTO `t_role_auth` VALUES ('14830824581898880', '14228805802388332', '14207789758687084');
INSERT INTO `t_role_auth` VALUES ('14830824581904757', '14228805802388332', '14777143750578757');
INSERT INTO `t_role_auth` VALUES ('14830824581907713', '14228805802388332', '14777143499375662');
INSERT INTO `t_role_auth` VALUES ('14830824581915085', '14228805802388332', '14777144360006547');
INSERT INTO `t_role_auth` VALUES ('14830824581915126', '14228805802388332', '14777144572177847');
INSERT INTO `t_role_auth` VALUES ('14830824581921326', '14228805802388332', '14777148581064596');
INSERT INTO `t_role_auth` VALUES ('14830824581925240', '14228805802388332', '14777144706536288');
INSERT INTO `t_role_auth` VALUES ('14830824581934913', '14228805802388332', '14777149181067674');
INSERT INTO `t_role_auth` VALUES ('14830824581943525', '14228805802388332', '14777149288109088');
INSERT INTO `t_role_auth` VALUES ('14830824581946966', '14228805802388332', '14777149392661832');
INSERT INTO `t_role_auth` VALUES ('14830824581952840', '14228805802388332', '14777149513063257');
INSERT INTO `t_role_auth` VALUES ('14830824581955353', '14228805802388332', '14777149643932508');
INSERT INTO `t_role_auth` VALUES ('14830824581964758', '14228805802388332', '1478486994792483');
INSERT INTO `t_role_auth` VALUES ('14830824581969530', '14228805802388332', '14784870074146684');
INSERT INTO `t_role_auth` VALUES ('14830824581978561', '14228805802388332', '1478487021885848');
INSERT INTO `t_role_auth` VALUES ('14830824581978669', '14228805802388332', '14784873138778774');
INSERT INTO `t_role_auth` VALUES ('14830824581989121', '14228805802388332', '14784873221686214');
INSERT INTO `t_role_auth` VALUES ('14830824581989451', '14228805802388332', '14784873328314974');
INSERT INTO `t_role_auth` VALUES ('14830824581991652', '14228805802388332', '14785100090317796');
INSERT INTO `t_role_auth` VALUES ('14830824581999043', '14228805802388332', '14784873545301112');
INSERT INTO `t_role_auth` VALUES ('14830824582001091', '14228805802388332', '14785100377978274');
INSERT INTO `t_role_auth` VALUES ('14830824582004229', '14228805802388332', '14785100223479638');
INSERT INTO `t_role_auth` VALUES ('14830824582012385', '14228805802388332', '14785101037749072');
INSERT INTO `t_role_auth` VALUES ('14830824582012995', '14228805802388332', '14785100933292913');
INSERT INTO `t_role_auth` VALUES ('14830824582022473', '14228805802388332', '14784873753116374');
INSERT INTO `t_role_auth` VALUES ('14830824582023708', '14228805802388332', '14785101288548767');
INSERT INTO `t_role_auth` VALUES ('14830824582031506', '14228805802388332', '14785101696905628');
INSERT INTO `t_role_auth` VALUES ('14830824582038728', '14228805802388332', '1478510151590919');
INSERT INTO `t_role_auth` VALUES ('14830824582042460', '14228805802388332', '14785101803569413');
INSERT INTO `t_role_auth` VALUES ('14830824582045916', '14228805802388332', '14785101902852840');
INSERT INTO `t_role_auth` VALUES ('14830824582053054', '14228805802388332', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14830824582056940', '14228805802388332', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14830824582061027', '14228805802388332', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14830824582061681', '14228805802388332', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14830824582074634', '14228805802388332', '14784874389606424');
INSERT INTO `t_role_auth` VALUES ('14830824582074886', '14228805802388332', '14784874195752946');
INSERT INTO `t_role_auth` VALUES ('14830824582081805', '14228805802388332', '14784875722465491');
INSERT INTO `t_role_auth` VALUES ('14830824582083426', '14228805802388332', '14784875849733532');
INSERT INTO `t_role_auth` VALUES ('14830824582097857', '14228805802388332', '14784876054547554');
INSERT INTO `t_role_auth` VALUES ('14830824582099409', '14228805802388332', '14784875957984025');
INSERT INTO `t_role_auth` VALUES ('14830824582101143', '14228805802388332', '14784876172349600');
INSERT INTO `t_role_auth` VALUES ('14830824582104376', '14228805802388332', '14784874544381495');
INSERT INTO `t_role_auth` VALUES ('14830824582117745', '14228805802388332', '14784876345205741');
INSERT INTO `t_role_auth` VALUES ('14830824582117797', '14228805802388332', '14784876522718348');
INSERT INTO `t_role_auth` VALUES ('14830824582121079', '14228805802388332', '14784876616498650');
INSERT INTO `t_role_auth` VALUES ('14830824582125486', '14228805802388332', '14784876722856535');
INSERT INTO `t_role_auth` VALUES ('14830824582134557', '14228805802388332', '14784874669413763');
INSERT INTO `t_role_auth` VALUES ('1483082458213521', '14228805802388332', '14784877440817947');
INSERT INTO `t_role_auth` VALUES ('14830824582144560', '14228805802388332', '14785070950148522');
INSERT INTO `t_role_auth` VALUES ('14830824582149426', '14228805802388332', '14785071149222369');
INSERT INTO `t_role_auth` VALUES ('1483082458215983', '14228805802388332', '14785071325716626');
INSERT INTO `t_role_auth` VALUES ('14830824582165084', '14228805802388332', '14785071689358439');
INSERT INTO `t_role_auth` VALUES ('1483082458216933', '14228805802388332', '14785071518515794');
INSERT INTO `t_role_auth` VALUES ('1483082458217434', '14228805802388332', '14784874785412142');
INSERT INTO `t_role_auth` VALUES ('14830824582178082', '14228805802388332', '14785072161004562');
INSERT INTO `t_role_auth` VALUES ('14830824582184077', '14228805802388332', '14785072436474249');
INSERT INTO `t_role_auth` VALUES ('14830824582187649', '14228805802388332', '14785072297496863');
INSERT INTO `t_role_auth` VALUES ('14830824582191640', '14228805802388332', '14785072582462239');
INSERT INTO `t_role_auth` VALUES ('14830824582198803', '14228805802388332', '14785072707329018');
INSERT INTO `t_role_auth` VALUES ('14830824582201661', '14228805802388332', '14784874908492191');
INSERT INTO `t_role_auth` VALUES ('14830824582203010', '14228805802388332', '14785072919453138');
INSERT INTO `t_role_auth` VALUES ('14830824582212329', '14228805802388332', '14785073184264158');
INSERT INTO `t_role_auth` VALUES ('14830824582216845', '14228805802388332', '14785073386413010');
INSERT INTO `t_role_auth` VALUES ('14830824582223615', '14228805802388332', '14785074153357410');
INSERT INTO `t_role_auth` VALUES ('14830824582224170', '14228805802388332', '14785074297514576');
INSERT INTO `t_role_auth` VALUES ('14830824582235849', '14228805802388332', '14784875032477664');
INSERT INTO `t_role_auth` VALUES ('1483082458223627', '14228805802388332', '14785074445501110');
INSERT INTO `t_role_auth` VALUES ('1483082458224606', '14228805802388332', '14785074712159745');
INSERT INTO `t_role_auth` VALUES ('14830824582247732', '14228805802388332', '14785074551537161');
INSERT INTO `t_role_auth` VALUES ('14830824582253455', '14228805802388332', '14785074968001502');
INSERT INTO `t_role_auth` VALUES ('14830824582258104', '14228805802388332', '14785074848165802');
INSERT INTO `t_role_auth` VALUES ('14830824582261075', '14228805802388332', '14784875138754152');
INSERT INTO `t_role_auth` VALUES ('14830824582261442', '14228805802388332', '14785075145455932');
INSERT INTO `t_role_auth` VALUES ('14830824582272670', '14228805802388332', '14785075372468672');
INSERT INTO `t_role_auth` VALUES ('14830824582277283', '14228805802388332', '1478507526195476');
INSERT INTO `t_role_auth` VALUES ('14830824582283495', '14228805802388332', '1478507561512614');
INSERT INTO `t_role_auth` VALUES ('14830824582289471', '14228805802388332', '14785075497951182');

-- ----------------------------
-- Table structure for `t_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `supplierId` varchar(32) NOT NULL COMMENT '供应商编号',
  `supplierName` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `supplierContacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `suppliercontactsPhone` varchar(11) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES ('14821378218575139', '明道泰和', '徐近琳', '18627180615');
INSERT INTO `t_supplier` VALUES ('14821379369404649', '信易达科技', '龙加飞', '13343436511');
INSERT INTO `t_supplier` VALUES ('14821379847856172', '鸿商机电', '明庭望', '15827536860');
INSERT INTO `t_supplier` VALUES ('14829705646892568', '武汉科普', '', '');

-- ----------------------------
-- Table structure for `t_upload`
-- ----------------------------
DROP TABLE IF EXISTS `t_upload`;
CREATE TABLE `t_upload` (
  `fileId` varchar(32) NOT NULL,
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  `suffix` varchar(20) DEFAULT NULL COMMENT '文件后缀',
  `fileName` varchar(50) DEFAULT NULL COMMENT '本地文件名',
  `contentType` varchar(100) DEFAULT NULL COMMENT '媒体类型',
  `originalFileName` varchar(500) DEFAULT NULL COMMENT '真实文件名',
  `path` varchar(500) DEFAULT NULL COMMENT '文件路径',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='文件上传';

-- ----------------------------
-- Records of t_upload
-- ----------------------------

-- ----------------------------
-- Table structure for `t_urlfilter`
-- ----------------------------
DROP TABLE IF EXISTS `t_urlfilter`;
CREATE TABLE `t_urlfilter` (
  `urlId` varchar(32) NOT NULL,
  `vesion` bigint(20) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `name` varchar(25) NOT NULL COMMENT '名称',
  `url` varchar(200) NOT NULL COMMENT '请求url',
  `returnUrl` varchar(200) DEFAULT NULL COMMENT '请求失败返回的url',
  `authoritys` varchar(200) DEFAULT NULL COMMENT '权限值,多个用‘，’隔开',
  `params` varchar(200) DEFAULT NULL COMMENT '请求参数',
  `rowFilter` char(1) DEFAULT '1' COMMENT '是否过滤,即登录验证',
  `privilegess` char(1) DEFAULT '0' COMMENT '是否需要权限验证',
  `formtoken` char(1) DEFAULT '0' COMMENT '是否表单验证重复提交',
  `pvtype` char(1) DEFAULT '0' COMMENT '是否加入流量统计',
  `version` bigint(20) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`urlId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='url请求';

-- ----------------------------
-- Records of t_urlfilter
-- ----------------------------
INSERT INTO `t_urlfilter` VALUES ('1420444123991080', '0', null, '验证码', '/authImg', '', '', '', '0', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444143147484', '0', null, '主页', '/main', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444710308055', '0', null, '首页', '/index', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444742064750', '0', null, '登录界面', '/logon', '', '', '', '0', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444767375469', '0', null, '登录验证', '/signIn', '', '', '', '0', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444784697317', '0', null, '退出系统', '/logonOut', '', '', '', '0', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444867421847', '0', null, '用户列表', '/user/list', '', '181114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444893259133', '0', null, '个人资料保存', '/user/save', '', '1912', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444905284429', '0', null, '用户删除', '/user/delete', '', '181114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444917836833', '0', null, '用户停用', '/user/disable', '', '181115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444930858896', '0', null, '用户启用', '/user/enable', '', '181115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444976903186', '0', null, '个人信息详细', '/user/userInfo', '', '1913', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420444994842566', '0', null, '用户列表跳转', '/user/toList', '', '181114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445051762566', '0', null, '个人资料编辑', '/user/edit', '', '1912', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445064360923', '0', null, '用户详细', '/user/detail', '', '181116', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445079982601', '0', null, '修改密码', '/user/changePwd', '', '1911', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445092556950', '0', null, '保存密码', '/user/savePwd', '', '1911', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445130234911', '0', null, '检查旧密码', '/user/checkOld', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445145741173', '0', null, '用户角色保存', '/userRole/save', '', '181112', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445500180522', '0', null, '用户角色新建', '/userRole/add', '', '181211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445513698184', '0', null, '用户角色编辑', '/userRole/edit', '', '181211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445531635875', '0', null, '角色列表', '/role/list', '', '181215', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445547509927', '0', null, '角色保存', '/role/save', '', '181212', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445561272460', '0', null, '角色删除', '/role/delete', '', '181213', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445572912416', '0', null, '角色详细', '/role/detail', '', '181216', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445658757011', '0', null, '跳转到角色列表', '/role/toList', '', '181215', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445686565227', '0', null, '角色新建', '/role/add', '', '181211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445712626141', '0', null, '角色编辑', '/role/edit', '', '181211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445731654229', '0', null, 'url新建', '/urlFilter/add', '', '181311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445742957476', '0', null, 'url列表', '/urlFilter/list', '', '181314', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445751959787', '0', null, 'url保存', '/urlFilter/save', '', '181312', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445762948431', '0', null, 'url删除', '/urlFilter/delete', '', '181313', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445776774557', '0', null, 'url缓存刷新', '/urlFilter/refresh', '', '181314', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445914419196', '0', null, '跳转到url列表', '/urlFilter/toList', '', '181314', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445931971304', '0', null, 'url编辑', '/urlFilter/edit', '', '181311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445945019877', '0', null, '检查url是否重复', '/urlfilter/check', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445970068673', '0', null, '项目经理新建', '/manager/add', '', '171311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445984470917', '0', null, '项目经理列表', '/manager/list', '', '171314', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420445995953239', '0', null, '项目经理保存', '/manager/save', '', '171312', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446010889006', '0', null, '项目经理删除', '/manager/delete', '', '171313', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446035080052', '0', null, '禁用项目经理', '/manager/disable', '', '171315', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446054567499', '0', null, '启用项目经理', '/manager/enable', '', '171315', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446068282614', '0', null, '跳转到项目经理列表', '/manager/toList', '', '171314', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446083825255', '0', null, '项目经理编辑', '/manager/edit', '', '171311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446094977990', '0', null, '项目经理详细', '/manager/detail', '', '171316', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446139973458', '0', null, '任务登记台账报表', '/report/taizhang', '', '161311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446163025941', '0', null, '工程项目清单报表', '/report/qingdan', '', '161411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446193586942', '0', null, '报装工程统计报表', '/report/bzgctj', '', '161111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446211895255', '0', null, '分包单位统计报表', '/report/company', '', '161211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446249525331', '0', null, '分包单位统计报表详细', '/report/dwDetail', '', '161212', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446286274315', '0', null, '跳转到分包单位统计页面', '/report/toCompany', '', '161211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446304899720', '0', null, '跳转到工程进度列表', '/process/toList', '', '141215', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446322584557', '0', null, '工程进度详细', '/process/detail', '', '141213', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446334866998', '0', null, '工程进度删除', '/process/delete', '', '141212', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446345903351', '0', null, '工程进度保存', '/process/save', '', '141214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446360234283', '0', null, '工程进度列表', '/process/list', '', '141215', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446371405682', '0', null, '工程进度新增', '/process/add', '', '141211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446390689451', '0', null, '工单编辑', '/gongdan/edit', '', '141211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446399564371', '0', null, '工单新建', '/gongdan/add', '', '141111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446419548725', '0', null, '检查工单号', '/gongdan/checkCode', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446445265728', '0', null, '工单列表弹出选择框', '/gongdan/popList', '', '141115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446470965611', '0', null, '跳转到工单列表选择框', '/gongdan/toPopList', '', '141115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446634577718', '0', null, '跳转到工单列表', '/gongdan/toList', '', '141115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446649191264', '0', null, '工单详细', '/gongdan/detail', '', '141114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446689848852', '0', null, '获取工单号', '/gongdan/getCode', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446699090062', '0', null, '工单删除', '/gongdan/delete', '', '141113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446707158837', '0', null, '工单保存', '/gongdan/save', '', '141112', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446717126061', '0', null, '工单列表', '/gongdan/list', '', '141115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446734813028', '0', null, '打印切块', '/print/qiekuai', '', '1117', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446743085060', '0', null, '打印工单', '/print/gongdan', '', '141116', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446751798489', '0', null, '打印会签表', '/print/huiqian', '', '1018', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446765361256', '0', null, '资金收款计划', '/fund/receipt/add', '', '1311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446799720354', '0', null, '跳转到资金收款列表', '/fund/receipt/toList', '', '1311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446809720134', '0', null, '资金收款删除', '/fund/receipt/delete', '', '1311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446964393515', '0', null, '资金收款保存', '/fund/receipt/save', '', '1311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446979631422', '0', null, '资金收款列表', '/fund/receipt/list', '', '1311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420446992481056', '0', null, '资金付款执行', '/fund/pay/execute', '', '131212', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447011777247', '0', null, '资金付款计划保存', '/fund/pay/save', '', '131211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447051966972', '0', null, '资金付款计划新建', '/fund/pay/add', '', '131212', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447076372681', '0', null, '资金付款计划修改', '/fund/pay/edit', '', '131213', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447094399977', '0', null, '跳转资金付款列表', '/fund/pay/toList', '', '131214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447116461088', '0', null, '资金付款列表', '/fund/pay/list', '', '131214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447297348066', '0', null, '资金付款记录删除', '/fund/pay/delete', '', '131211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447308810413', '0', null, '资金列表', '/fund/list', '', '1316', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447316817972', '0', null, '资金删除', '/fund/delete', '', '1313', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447328617360', '0', null, '切块保存', '/division/save', '', '1114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447347486670', '0', null, '切块关联合同保存', '/division/refSave', '', '1116', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447355297321', '0', null, '切块修改', '/division/edit', '', '1113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447371208517', '0', null, '切块', '/division/add', '', '1112', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447476188948', '0', null, '关联合同选择框', '/division/popList', '', '1116', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447501778673', '0', null, '跳转到关联合同选择框', '/division/toPopList', '', '1116', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447516973815', '0', null, '跳转到待切块合同', '/division/toList', '', '1111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447524893601', '0', null, '切块查看', '/division/detail', '', '1115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447540709346', '0', null, '切块信息更新', '/division/update', '', '1114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447553129223', '0', null, '切块删除', '/division/delete', '', '1118', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447561712126', '0', null, '待切块合同列表', '/division/list', '', '1111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447577666779', '0', null, '检查客户是否存在', '/customer/checkCustomer', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447592251217', '0', null, '客户编辑', '/customer/edit', '', '171111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447610998840', '0', null, '客户选择框', '/customer/popList', '', '171113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447647795771', '0', null, '打开客户选择框', '/customer/toPopList', '', '171113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447668563988', '0', null, '跳转到客户列表', '/customer/toList', '', '171113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447694606617', '0', null, '客户详细', '/customer/detail', '', '171115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447704819785', '0', null, '客户删除', '/customer/delete', '', '171114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447713623154', '0', null, '客户保存', '/customer/save', '', '171112', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447723431971', '0', null, '客户列表', '/customer/list', '', '171113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447732139235', '0', null, '客户新建', '/customer/add', '', '171111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447746836217', '0', null, '跳转到会签列表', '/huiqian/toList', '', '1019', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447756421186', '0', null, '会签保存', '/huiqian/save', '', '1017', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447767493629', '0', null, '会签列表', '/huiqian/list', '', '1019', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447781733569', '0', null, '合同上传', '/upload/contract', '', '1020', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447789883118', '0', null, '合同编辑', '/contract/edit', '', '1011', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447803776032', '0', null, '分包合同保存', '/contract/subSave', '', '1012', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447814618138', '0', null, '分包合同新建', '/contract/subAdd', '', '1011', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447826104942', '0', null, '总分明细', '/contract/zfDetail', '', '1015', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447838122491', '0', null, '检查合同编号是否存在', '/contract/checkCode', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447861930559', '0', null, '合同选择框列表', '/contract/popList', '', '1016', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447878939490', '0', null, '打开合同选择框', '/contract/toPopList', '', '1016', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447907585147', '0', null, '跳转到合同列表', '/contract/toList', '', '1016', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447914608645', '0', null, '合同详细', '/contract/detail', '', '1014', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447929060566', '0', null, '获取合同编号', '/contract/getCode', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447936394043', '0', null, '删除合同', '/contract/delete', '', '1013', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447945871765', '0', null, '合同保存', '/contract/save', '', '1012', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447953836248', '0', null, '合同列表', '/contract/list', '', '1016', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420447966719189', '0', null, '合同新建', '/contract/add', '', '1011', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448028609784', '0', null, '施工单位编辑', '/company/edit', '', '171211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448351135799', '0', null, '施工单位选择框', '/company/popList', '', '171214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448367602943', '0', null, '打开施工单位选择框', '/company/toPopList', '', '171214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448389633497', '0', null, '跳转到施工单位列表', '/company/toList', '', '171214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448399553008', '0', null, '施工单位详细', '/company/detail', '', '171215', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448415787768', '0', null, '检查施工单位是否存在', '/company/checkCompany', '', '', '', '1', '0', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448426047946', '0', null, '施工单位删除', '/company/delete', '', '171213', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448435470199', '0', null, '施工单位保存', '/company/save', '', '171212', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448444419976', '0', null, '施工单位列表', '/company/list', '', '171214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420448455286307', '0', null, '施工单位新建', '/company/add', '', '171211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420467770927199', '0', null, '合同下载', '/contract/download', '', '1021', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420467804090345', '0', null, '合同文件删除', '/upload/delete', '', '1023', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420467822090612', '0', null, '合同在线预览', '/upload/view', '', '1022', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771220732040', '0', null, '权限添加', '/auth/add', '', '181412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771234139300', '0', null, '权限编辑', '/auth/edit', '', '181412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771247073316', '0', null, '权限保存', '/auth/save', '', '181412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771261553657', '0', null, '权限详细', '/auth/detail', '', '181412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771272331779', '0', null, '权限删除', '/auth/delete', '', '181412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771284891003', '0', null, '权限列表', '/auth/list', '', '181412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771327147525', '0', null, '菜单新建', '/menu/add', '', '181411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771337161797', '0', null, '菜单编辑', '/menu/edit', '', '181411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771346187740', '0', null, '菜单保存', '/menu/save', '', '181411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771356326942', '0', null, '菜单详细', '/menu/detail', '', '181411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771366005217', '0', null, '菜单删除', '/menu/delete', '', '181411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1420771377571156', '0', null, '菜单列表', '/menu/list', '', '181411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14207846265871722', '0', null, '资金导出', 'export/fund', '', '1317', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14208682717917330', '0', null, '报装工程导出', '/export/bzgctj', '', '161111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14208686334366860', '0', null, '任务登记台账导出', '/export/taizhang', '', '161311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14209635414398294', '0', null, '导出总分明细', '/export/zfDetail', '', '1024', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14211383784108403', '0', null, '资金导入预览', '/import/fundView', '', '181513', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14211384086652138', '0', null, '资金导入保存', '/import/fundImport', '', '181513', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14211414418734796', '0', null, '跳转到资金导入页面', '/import/fund', '', '181513', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14224322572028603', '0', null, '合同统计', '/report/contractCountByModule', '', '161511', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14224323088017707', '0', null, '项目盈余统计', '/report/profit', '', '161611', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1422432343540366', '0', null, '切块盈余统计', '/report/divisionProfit', '', '161711', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14224323872242573', '0', null, '质保金预警', '/zhibaojin/list', '', '1511', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14224324121025494', '0', null, '工期预警', '/gongqi/list', '', '1512', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14225128026067850', '0', null, '质保金信息综合查询', '/report/zhibaojinQuery', '', '1620', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14225139381332301', '0', null, '跳转到工单信息综合查询', '/report/toGongdanQuery', '', '1621', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14225139676695704', '0', null, '工单信息综合查询', '/report/gongdanQuery', '', '1621', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14498387630787734', '0', null, '跳转到公建合同列表', '/contract/toList?moduleType=1', '', '1016', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14498387987171431', '0', null, '跳转到住建合同列表', '/contract/toList?moduleType=2', '', '1016', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14512345215625565', '0', null, '资金收款明细', '/fund/receipt/detail', '', '1311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14512345488595997', '0', null, '资金付款分包列表', '/fund/pay/sublist', '', '1312', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14512345734167711', '0', null, '资金付款明细', '/fund/pay/detail', '', '1312', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1451440048603777', '0', null, '跳转到结算列表', '/settleAmount/toList', '', '1119', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14514400711934848', '0', null, '项目结算保存', '/settleAmount/save', '', '1119', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14514400975472053', '0', null, '结算刷新', '/settleAmount/list', '', '1119', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14774747938151991', '0', null, '部门新建', '/infomanage/depart/add', '', '171411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14774780944025778', '0', null, '部门列表', '/infomanage/depart/list', '', '171413', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14774781644418710', '0', null, '部门保存', '/infomanage/depart/save', '', '171412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14774782052177432', '0', null, '部门删除', '/infomanage/depart/delete', '', '171414', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14774782397834445', '0', null, '部门详细', '/infomanage/depart/detail', '', '171415', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14774782724239497', '0', null, '跳转到部门列表', '/infomanage/depart/toList', '', '171413', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14784938109357265', '0', null, '供应商新建', '/infomanage/supplier/add', '', '171511', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14784938931715840', '0', null, '供应商列表', '/infomanage/supplier/list', '', '171513', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14784939281221401', '0', null, '供应商保存', '/infomanage/supplier/save', '', '171512', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14784939515326715', '0', null, '供应商删除', '/infomanage/supplier/delete', '', '171514', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14784939917096875', '0', null, '供应商详细', '/infomanage/supplier/detail', '', '171515', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1478494077372939', '0', null, '跳转到供应商列表', '/infomanage/supplier/toList', '', '171513', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785078856294420', '0', null, '资产信息新建', '/assetmanage/assetinf/add', '', '161111', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785079357058628', '0', null, '资产信息保存', '/assetmanage/assetinf/save', '', '161112', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785080177246444', '0', null, '资产信息列表', '/assetmanage/assetinf/list', '', '161113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785081048435153', '0', null, '跳转到资产信息列表', '/assetmanage/assetinf/toList', '', '161113', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1478508178231968', '0', null, '资产信息删除', '/assetmanage/assetinf/delete', '', '161114', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785082022958402', '0', null, '资产信息详细', '/assetmanage/assetinf/detail', '', '161115', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785082774934563', '0', null, '资产名称新建', '/assetmanage/assetnam/add', '', '161211', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785083036792156', '0', null, '资产名称保存', '/assetmanage/assetnam/save', '', '161212', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785083245785642', '0', null, '资产名称列表', '/assetmanage/assetnam/list', '', '161213', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1478508350128388', '0', null, '跳转到资产名称列表', '/assetmanage/assetnam/toList', '', '161213', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785083696336247', '0', null, '资产名称删除', '/assetmanage/assetnam/delete', '', '161214', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785083921529410', '0', null, '资产名称详细', '/assetmanage/assetnam/detail', '', '161215', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785084927627905', '0', null, '资产类别新建', '/assetmanage/assetcla/add', '', '161311', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785085237484896', '0', null, '资产类别保存', '/assetmanage/assetcla/save', '', '161312', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785085778708658', '0', null, '资产类别列表', '/assetmanage/assetcla/list', '', '161313', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785086049047358', '0', null, '跳转到资产类别列表', '/assetmanage/assetcla/toList', '', '161313', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785086790816122', '0', null, '资产类别删除', '/assetmanage/assetcla/delete', '', '161314', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785087922975602', '0', null, '资产类别详细', '/assetmanage/assetcla/detail', '', '161315', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785088738416808', '0', null, '资产购置新建', '/assetmanage/assetpurchaseapplication/add', '', '161411', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785089030672199', '0', null, '资产购置保存', '/assetmanage/assetpurchaseapplication/save', '', '161412', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785089224397349', '0', null, '资产购置列表', '/assetmanage/assetpurchaseapplication/list', '', '161413', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785089518902474', '0', null, '跳转到资产购置列表', '/assetmanage/assetpurchaseapplication/toList', '', '161413', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785089747432111', '0', null, '资产购置删除', '/assetmanage/assetpurchaseapplication/delete', '', '161414', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785089998851333', '0', null, '资产购置详细', '/assetmanage/assetpurchaseapplication/detail', '', '161415', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785091544205926', '0', null, '资产调拨新建', '/assetmanage/assetchange/add', '', '161711', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785091724607880', '0', null, '资产调拨保存', '/assetmanage/assetchange/save', '', '161712', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785092011723939', '0', null, '资产调拨列表', '/assetmanage/assetchange/list', '', '161713', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785092217001426', '0', null, '跳转到资产调拨列表', '/assetmanage/assetchange/toList', '', '161713', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1478509244030243', '0', null, '资产调拨删除', '/assetmanage/assetchange/delete', '', '161714', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785092638509412', '0', null, '资产调拨详细', '/assetmanage/assetchange/detail', '', '161715', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785093758686930', '0', null, '资产维护新建', '/assetmanage/maintenancerecord/add', '', '161611', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785094023646077', '0', null, '资产维护保存', '/assetmanage/maintenancerecord/save', '', '161612', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785094235428090', '0', null, '资产维护列表', '/assetmanage/maintenancerecord/list', '', '161613', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785094535973339', '0', null, '跳转到资产维护列表', '/assetmanage/maintenancerecord/toList', '', '161613', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785094855223448', '0', null, '资产维护删除', '/assetmanage/maintenancerecord/delete', '', '161614', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785095169703320', '0', null, '资产维护详细', '/assetmanage/maintenancerecord/detail', '', '161615', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785097960195008', '0', null, '资产报损新建', '/assetmanage/assetdamage/add', '', '161511', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785098216036753', '0', null, '资产报损保存', '/assetmanage/assetdamage/save', '', '161512', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785098401809848', '0', null, '资产报损列表', '/assetmanage/assetdamage/list', '', '161513', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785098783674977', '0', null, '跳转到资产报损列表', '/assetmanage/assetdamage/toList', '', '161513', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785098985974308', '0', null, '资产报损删除', '/assetmanage/assetdamage/delete', '', '161514', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1478509914469465', '0', null, '资产报损详细', '/assetmanage/assetdamage/detail', '', '161515', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785102503251106', '0', null, '项目新建', '/infomanage/project/add', '', '171711', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785102737773640', '0', null, '项目保存', '/infomanage/project/save', '', '171712', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785102891319958', '0', null, '项目列表', '/infomanage/project/list', '', '171713', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785103125622371', '0', null, '跳转到项目列表', '/infomanage/project/toList', '', '171713', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785103289872523', '0', null, '项目删除', '/infomanage/project/delete', '', '171714', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785103782649602', '0', null, '项目详细', '/infomanage/project/detail', '', '171715', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785104479734422', '0', null, '维护公司新建', '/infomanage/maintenanceinfo/add', '', '171811', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785104748645014', '0', null, '维护公司保存', '/infomanage/maintenanceinfo/save', '', '171812', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785104933691453', '0', null, '维护公司列表', '/infomanage/maintenanceinfo/list', '', '171813', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785105312442440', '0', null, '跳转到维护公司列表', '/infomanage/maintenanceinfo/toList', '', '171813', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785105474107140', '0', null, '维护公司删除', '/infomanage/maintenanceinfo/delete', '', '171814', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1478510562736954', '0', null, '维护公司详细', '/infomanage/maintenanceinfo/detail', '', '171815', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785132666831015', '0', null, '厂商新建', '/infomanage/factory/add', '', '171611', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785132845287189', '0', null, '厂商保存', '/infomanage/factory/save', '', '171612', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('1478513300592933', '0', null, '厂商列表', '/infomanage/factory/list', '', '171613', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785133282968964', '0', null, '跳转到厂商列表', '/infomanage/factory/toList', '', '171613', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785133546542581', '0', null, '厂商删除', '/infomanage/factory/delete', '', '171614', '', '1', '1', '0', '0', null);
INSERT INTO `t_urlfilter` VALUES ('14785133736144248', '0', null, '厂商详细', '/infomanage/factory/detail', '', '171615', '', '1', '1', '0', '0', null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_Id` varchar(32) NOT NULL COMMENT '编码',
  `userName` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `realName` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `enable` varchar(11) DEFAULT NULL COMMENT '是否启用',
  `departId` varchar(32) NOT NULL,
  PRIMARY KEY (`user_Id`),
  KEY `FK_departId` (`departId`),
  KEY `userName` (`userName`),
  KEY `realName` (`realName`),
  CONSTRAINT `FK_departId` FOREIGN KEY (`departId`) REFERENCES `t_depart` (`departId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('01', 'admin', '21232F297A57A5A743894A0E4A801FC3', 'admin', '13971640123', '1', '1');
INSERT INTO `t_user` VALUES ('02', 'guest', 'E10ADC3949BA59ABBE56E057F20F883E', '张三', '83460022', '1', '1');
INSERT INTO `t_user` VALUES ('03', 'ty60012', 'E10ADC3949BA59ABBE56E057F20F883E', '唐颖', '13971439225', '1', '0');
INSERT INTO `t_user` VALUES ('04', 'xzj60022', 'E10ADC3949BA59ABBE56E057F20F883E', '肖珍军', '15927148941', '1', '4');
INSERT INTO `t_user` VALUES ('05', 'hj60022', 'E10ADC3949BA59ABBE56E057F20F883E', '何  景', '13971640123', '1', '2');
INSERT INTO `t_user` VALUES ('06', 'zy60006', 'E10ADC3949BA59ABBE56E057F20F883E', '朱  严', '13607129420', '1', '6');
INSERT INTO `t_user` VALUES ('07', 'ygj001', 'E10ADC3949BA59ABBE56E057F20F883E', '运管局01', null, '1', '9');
INSERT INTO `t_user` VALUES ('08', 'ggj001', 'E10ADC3949BA59ABBE56E057F20F883E', '高管局', null, '1', '9');
INSERT INTO `t_user` VALUES ('09', 'sjxt001', 'E10ADC3949BA59ABBE56E057F20F883E', '运管局02', null, '1', '9');
INSERT INTO `t_user` VALUES ('10', 'glj001', 'E10ADC3949BA59ABBE56E057F20F883E', '公路局01', null, '1', '9');
INSERT INTO `t_user` VALUES ('11', 'fgc001', 'E10ADC3949BA59ABBE56E057F20F883E', '法规处', null, '1', '9');
INSERT INTO `t_user` VALUES ('12', 'lwzx001', 'E10ADC3949BA59ABBE56E057F20F883E', '李文虎', '', '1', '9');
INSERT INTO `t_user` VALUES ('13', 'gjh60020', 'E10ADC3949BA59ABBE56E057F20F883E', '龚季辉', '', '1', '4');
INSERT INTO `t_user` VALUES ('14830807504035401', 'ty60016', 'E10ADC3949BA59ABBE56E057F20F883E', '唐颖', '13971439225', '1', '0');
INSERT INTO `t_user` VALUES ('14830828158447826', 'wlk2017', 'E10ADC3949BA59ABBE56E057F20F883E', '网络科测试账号', '60033', '1', '2');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `userRole_Id` varchar(32) NOT NULL COMMENT '用户角色编码',
  `userId` varchar(32) NOT NULL COMMENT '用户编码',
  `roleId` varchar(32) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`userRole_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户角色表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('0000001', '01', '10001');
INSERT INTO `t_user_role` VALUES ('1425885826020174', '14258858260202893', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('14808537097916232', '14258857449954149', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('1480858448310417', '14808584483093390', '10001');
INSERT INTO `t_user_role` VALUES ('14808586163547891', '14258855140014114', '14258850553263939');
INSERT INTO `t_user_role` VALUES ('14809001260751634', '14808585851461383', '10001');
INSERT INTO `t_user_role` VALUES ('14815068620521066', '01', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('14815068620523345', '01', '1422880524297216');
INSERT INTO `t_user_role` VALUES ('14815068620525710', '01', '10001');
INSERT INTO `t_user_role` VALUES ('14815068620533864', '01', '14258851133783221');
INSERT INTO `t_user_role` VALUES ('14815068620536555', '09', '14228805802388332');
INSERT INTO `t_user_role` VALUES ('1481506862053705', '01', '14258850553263939');
INSERT INTO `t_user_role` VALUES ('14821364256277233', '14821364256272967', '14258851133783221');
INSERT INTO `t_user_role` VALUES ('14821366445965929', '14821366445965413', '14258851133783221');
INSERT INTO `t_user_role` VALUES ('14821960688567109', '14821960688569774', '10001');
INSERT INTO `t_user_role` VALUES ('14822887757575435', '14822887757574846', '14821390374697312');
INSERT INTO `t_user_role` VALUES ('1482977319339434', '04', '10001');
INSERT INTO `t_user_role` VALUES ('14829936463169353', '14829936463166755', '14258851133783221');
INSERT INTO `t_user_role` VALUES ('14830807504033210', '14830807504035401', '14258851133783221');
INSERT INTO `t_user_role` VALUES ('14830807504033952', '14830807504035401', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('1483082420337809', '06', '14228805802388332');
INSERT INTO `t_user_role` VALUES ('14830828863868151', '14830828158447826', '10001');
