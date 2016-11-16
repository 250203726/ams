/*
Navicat MySQL Data Transfer

Source Server         : ams
Source Server Version : 50505
Source Host           : 172.25.5.222:3306
Source Database       : ams_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-10-30 12:34:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_assetchangeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_assetchangeinfo`;
CREATE TABLE `t_assetchangeinfo` (
  `aciId` varchar(32) NOT NULL COMMENT '资产调拨编码',
  `assetId` varchar(32) DEFAULT NULL COMMENT '资产编号，外键',
  `originalDepartment` varchar(50) DEFAULT NULL COMMENT '原使用部门',
  `originalPrincipal` varchar(50) DEFAULT NULL COMMENT '原负责人',
  `nowDepartment` varchar(50) DEFAULT NULL COMMENT '现使用人',
  `nowPrincipal` varchar(50) DEFAULT NULL COMMENT '现负责人',
  `changeTmie` datetime DEFAULT NULL COMMENT '调拨时间',
  `assetStatus` varchar(50) DEFAULT NULL COMMENT '资产状态',
  `asseAttach` varchar(50) DEFAULT NULL COMMENT '资产附件',
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
  `assetId` varchar(32) NOT NULL,
  `assetnameId` varchar(32) DEFAULT NULL,
  `assetserialCode` int(11) DEFAULT NULL,
  `projectNumber` int(11) DEFAULT NULL,
  `assetBrand` varchar(100) DEFAULT NULL,
  `assetinfoVersion` varchar(100) DEFAULT NULL,
  `assetinfoPrice` float DEFAULT NULL,
  `assetinfoPic` longblob,
  `assetStatus` varchar(50) DEFAULT NULL,
  `agentPurchaser` varchar(50) DEFAULT NULL,
  `userId` varchar(32) DEFAULT NULL,
  `assetmadeTime` datetime DEFAULT NULL,
  `assetinfoTime` datetime DEFAULT NULL,
  `StartUseTime` datetime DEFAULT NULL,
  `assetfactoryId` varchar(32) DEFAULT NULL,
  `supplierId` varchar(32) DEFAULT NULL,
  `projectId` varchar(32) DEFAULT NULL,
  `maintenanceId` varchar(32) DEFAULT NULL,
  `instaLocation` varchar(100) DEFAULT NULL,
  `UsedYears` datetime DEFAULT NULL,
  `LifeYears` datetime DEFAULT NULL,
  `Remark` varchar(100) DEFAULT NULL,
  `asset_Id` varchar(32) NOT NULL,
  PRIMARY KEY (`assetId`),
  KEY `FK_ASSETNAMEID` (`assetnameId`),
  KEY `FK_Reference_4` (`userId`),
  KEY `FK_Reference_6` (`assetfactoryId`),
  KEY `FK_Reference_7` (`supplierId`),
  KEY `FK_Reference_8` (`projectId`),
  KEY `FK_Reference_9` (`maintenanceId`),
  CONSTRAINT `FK_ASSETNAMEID` FOREIGN KEY (`assetnameId`) REFERENCES `t_assetname` (`assetnameId`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`userId`) REFERENCES `t_user` (`user_Id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`assetfactoryId`) REFERENCES `t_factoryinfo` (`factoryId`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`supplierId`) REFERENCES `t_supplierinfo` (`supplierId`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`projectId`) REFERENCES `t_project` (`projectId`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`maintenanceId`) REFERENCES `t_maintenanceinfo` (`maintenanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='资产';

-- ----------------------------
-- Records of t_assetinfo
-- ----------------------------

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
INSERT INTO `t_auth` VALUES ('14211382908723036', '14207825834738015', '总包导入', '181511', '1', '1', '0');
INSERT INTO `t_auth` VALUES ('14211383048565271', '14207825834738015', '分包导入', '181512', '2', '1', '0');
INSERT INTO `t_auth` VALUES ('14211383168242947', '14207825834738015', '资金导入', '181513', '3', '1', '0');
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
INSERT INTO `t_code` VALUES ('1', 'SS-GJ', '公建', '1', '1', '1');
INSERT INTO `t_code` VALUES ('2', 'SS-ZJ', '住建', '2', '1', '2');

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
INSERT INTO `t_company` VALUES ('14260784599892905', '宜昌三峡送变电工程有限责任公司', '2', '', '', '', '');
INSERT INTO `t_company` VALUES ('14333884087509249', '宜昌三峡送变电工程有限责任公司工程分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14333884202635004', '宜昌三峡送变电工程有限责任公司开发区分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14333884275322399', '宜昌三峡送变电工程有限责任公司检修分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14333884334604856', '宜昌三峡送变电工程有限责任公司计量分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('1433388466314812', '客户服务中心', '2', '', '', '', '');
INSERT INTO `t_company` VALUES ('14489476610239013', '宜昌三峡送变电工程有限责任公司兴山分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14489477350136917', '南瑞永光', '4', '', '', '', '');
INSERT INTO `t_company` VALUES ('14489477421501279', '昌耀电工', '4', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490296552468038', '光源电业', '3', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490296956583326', '龙腾红旗电缆', '4', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490297407548470', '上海中塑管业', '4', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490354295994861', '调控中心', '2', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490365899461246', '宜电电气', '4', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490382257904589', '宜昌三峡送变电工程有限责任公司五峰分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490396119511052', '湖北盛业', '3', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490414202249570', '宜昌三峡送变电工程有限责任公司物资分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490424985628260', '宜昌三峡送变电工程有限责任公司通信分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490425856584360', '变电运维', '2', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490481897333542', '宜昌三峡送变电工程有限责任公司夷陵分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('1449048351803318', '江北设计院', '2', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490523867803789', '宜昌三峡送变电工程有限责任公司电网建设分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14490553404317341', '宜昌三峡送变电工程有限责任公司供电分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14491089503989490', '宜昌三峡送变电工程有限责任公司当阳分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14491115796143207', '宜电监理公司', '2', '', '', '', '');
INSERT INTO `t_company` VALUES ('14520672923567749', '楚能变压器', '4', '', '', '', '');
INSERT INTO `t_company` VALUES ('14531753085434433', '宜昌三峡送变电工程有限责任公司秭归分公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14599138428723288', '宜昌三峡送变电工程有限责任公司远安分公司 ', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14599269635597780', '上海华明电力设备制造有限公司', '4', '', '', '', '');
INSERT INTO `t_company` VALUES ('14599269926248804', '浙江恒大科技电气有限公司', '1', '', '', '', '');
INSERT INTO `t_company` VALUES ('14651832184046629', '宜昌电力勘测设计院有限公司', '2', '', '', '', '');
INSERT INTO `t_company` VALUES ('14771195617974143', '看见就好看', '1', '多的地方', '13242345656', '阿斯蒂芬发', ' 范德萨发');

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
INSERT INTO `t_customer` VALUES ('14260784747268879', '', '国网湖北省电力公司宜昌供电公司', null, '', '', '', '');
INSERT INTO `t_customer` VALUES ('14260785331307413', '', '宜昌三峡送变电工程有限责任公司', null, '', '', '', '');
INSERT INTO `t_customer` VALUES ('14272460359414554', '', '湖北昌隆达电力工程有限公司  ', null, '肖', '15871657732 ', '', '');
INSERT INTO `t_customer` VALUES ('14280242413583470', null, '湖南湘江电力建设有限公司宜昌分公司', '3', '张', '15971672917', null, null);
INSERT INTO `t_customer` VALUES ('14280245956975975', null, '湖北伟悦食品有限公司', '3', '付', '675777', null, null);
INSERT INTO `t_customer` VALUES ('14280257765109998', null, '宜昌生物产业园建设管理办公室', '3', '付', '675777', null, null);
INSERT INTO `t_customer` VALUES ('14280260113066896', null, '宜昌长和置业有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14332342152094137', null, '宜昌市公安局西陵区分局', '3', '18972591591（陆）', '', null, null);
INSERT INTO `t_customer` VALUES ('14332343770595526', null, '宜昌昌耀电业集团有限公司', '3', '13972033855（朱青海） ', '', null, null);
INSERT INTO `t_customer` VALUES ('14332346238365108', null, '盛隆电气集团电力工程有限公司', '3', '13971226079（杜） ', '', null, null);
INSERT INTO `t_customer` VALUES ('14332929949738524', null, '五峰土家族自治县洋虎投资开发有限责任公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14332930801344175', null, '宜昌明通送变电工程有限公司', '3', '13972582345（翟耀天）', '', null, null);
INSERT INTO `t_customer` VALUES ('14332932027197400', null, '宜昌恒鼎徽达再生资源利用科技发展有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14332933265058674', null, '宜昌南瑞永光电气设备有限公司', '3', '18671782372', '', null, null);
INSERT INTO `t_customer` VALUES ('14332934538483902', null, '宜昌九坤置业有限公司', '3', '（张）', '13886671289', null, null);
INSERT INTO `t_customer` VALUES ('1433293558680713', null, '宜昌市永绅送变电工程有限公司', '3', '', '13972604543', null, null);
INSERT INTO `t_customer` VALUES ('14332937304051444', null, '宜昌迪瑞华森新能源科技有限公司', '3', '', '18608665435', null, null);
INSERT INTO `t_customer` VALUES ('14332938247859697', null, '湖北鹏发送变电工程有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14332941524809438', null, '中国湖北石油有限公司湖北宜昌石油分公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14332978370666389', null, '宜昌宏信房地产有限公司', '3', '万', '13477861847', null, null);
INSERT INTO `t_customer` VALUES ('14333018100344674', null, '湖北盛业送变电工程有限公司', '3', '尚', '15171587619', null, null);
INSERT INTO `t_customer` VALUES ('14333019008734421', null, '宜昌电力勘测设计院有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14333019843176858', null, '宜昌中发电力工程有限公司', '3', '黄庭华', '', null, null);
INSERT INTO `t_customer` VALUES ('14333020887447761', null, '宜昌市西陵区高技术产业孵化中心', '3', '邓', '13872477935 ', null, null);
INSERT INTO `t_customer` VALUES ('14333023763933710', null, '宜昌市猇亭区农民拆迁还建办公室', '3', '曾', '13872662568', null, null);
INSERT INTO `t_customer` VALUES ('14333024602596409', null, '湖北长江电气有限公司', '3', '邹', '18671754096', null, null);
INSERT INTO `t_customer` VALUES ('14333027577513551', null, '宜昌诚友电气设备有限公司', '3', '付', '675777', null, null);
INSERT INTO `t_customer` VALUES ('14333029144695289', null, '宜昌兴旺送变电工程有限公司', '3', '宋', '15272149715', null, null);
INSERT INTO `t_customer` VALUES ('1433303032670333', null, '中国长江航运集团宜昌船厂', '3', '杨', '15926961558', null, null);
INSERT INTO `t_customer` VALUES ('14333031105616972', null, '宜昌市嘉禾置业有限公司', '3', '李', '18995888696', null, null);
INSERT INTO `t_customer` VALUES ('14333038471638094', null, '宜昌市猇亭区红联砂石场', '3', '杨', '13972590506', null, null);
INSERT INTO `t_customer` VALUES ('14333153677999801', null, '宜昌市城市建设投资开发有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14333154618521720', null, '湖北省宜昌监狱', '3', '王', '18571016580', null, null);
INSERT INTO `t_customer` VALUES ('14333155980568154', null, '葛洲坝当阳水泥二期项目建设领导小组办公室', '3', '曹主任', '13872669555', null, null);
INSERT INTO `t_customer` VALUES ('14333158100762445', null, '湖北悦和创业投资有限公司', '3', '黄', '15972716008', null, null);
INSERT INTO `t_customer` VALUES ('14333159564978073', null, '宜昌住邦资产管理有限公司', '3', '15972716008', '黄', null, null);
INSERT INTO `t_customer` VALUES ('14333163698203446', null, '湖北永兴机电科技工程有限公司', '3', '魏', '13085150301', null, null);
INSERT INTO `t_customer` VALUES ('14333164656671328', null, '宜昌宜景房地产开发有限公司', '3', '18271360501', '田', null, null);
INSERT INTO `t_customer` VALUES ('14333165809821002', null, '宜昌领兴建筑工程有限公司', '3', '李', '0717-2582727', null, null);
INSERT INTO `t_customer` VALUES ('14333166758156313', null, '湖北迅算创业园投资有限公司', '3', '', '13886741888', null, null);
INSERT INTO `t_customer` VALUES ('14333168051549491', null, '宜昌桑德三峡水务有限公司', '3', '张', '13972520369', null, null);
INSERT INTO `t_customer` VALUES ('14333169474421195', null, '湖北省宜昌市中级人民法院', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14333170147561861', null, '宜昌国诚涂镀板有限公司', '3', '崔', '13618680139', null, null);
INSERT INTO `t_customer` VALUES ('14333171016025181', null, '宜昌中南自动化研究所有限公司', '3', '李', '13277175808', null, null);
INSERT INTO `t_customer` VALUES ('14333173535118440', null, '宜昌鑫安达玻璃制品有限公司', '3', '付', '675777', null, null);
INSERT INTO `t_customer` VALUES ('14333174400139217', null, '宜昌市经济技术开发区万年村村民委员会', '3', '付', '675777', null, null);
INSERT INTO `t_customer` VALUES ('14333805550889536', null, '宜昌市葛洲坝人民检察院', '3', '魏', '18008606759', null, null);
INSERT INTO `t_customer` VALUES ('14333806882505388', null, '湖北盛业送变电工程有限公司', '3', '易', '13872465748   ', null, null);
INSERT INTO `t_customer` VALUES ('1433387294502925', null, '宜昌华鹏置业有限公司', '3', '汪勇', '13329809918', null, null);
INSERT INTO `t_customer` VALUES ('14333874522507826', null, '宜昌嘉得照明设计工程有限责任公司', '3', '任', '15071780999', null, null);
INSERT INTO `t_customer` VALUES ('14333875432296079', null, '宜昌均瑞房地产开发有限公司', '3', '刘昌学', '612911  ', null, null);
INSERT INTO `t_customer` VALUES ('14333876175168337', null, '宜昌市东明电气有限责任公司', '3', '胡', '13872457818', null, null);
INSERT INTO `t_customer` VALUES ('14333879595945006', null, '宜昌三峡日报传媒集团有限责任公司', '3', '张士忠', '13886700079 ', null, null);
INSERT INTO `t_customer` VALUES ('1449202603229222', null, '湖北国电众恒电气有限公司', '3', '', '15872579358（文） ', null, null);
INSERT INTO `t_customer` VALUES ('1449203405426172', null, '湖北益通建设股份有限公司', '3', '', '13971577236（宁） ', null, null);
INSERT INTO `t_customer` VALUES ('14494625132535422', null, '宜昌高新区建设管理办公室', '3', '车军', '13907208699  ', null, null);
INSERT INTO `t_customer` VALUES ('1450920557691387', null, '宜昌蓝天蓝太阳能电站建设有限公司', '3', '18120186388 (唐)  ', '', null, null);
INSERT INTO `t_customer` VALUES ('14509260886905655', null, '宜昌均瑞房地产开发有限公司', '3', '（柯）       ', ' 15571758096', null, null);
INSERT INTO `t_customer` VALUES ('14509390679406014', null, '宜昌市易中物流有限责任公司', '3', '（姚） ', '13908605535', null, null);
INSERT INTO `t_customer` VALUES ('14509391591553129', null, '宜昌明通送变电工程有限公司', '3', '', '692345', null, null);
INSERT INTO `t_customer` VALUES ('14509393748783615', null, '宜昌长楹置业有限公司', '3', '15872536099', '（黄）', null, null);
INSERT INTO `t_customer` VALUES ('14509400088017506', null, '宜昌宏业气体有限公司', '3', '13972001336', '（程）', null, null);
INSERT INTO `t_customer` VALUES ('14509400906195396', null, '宜昌市宏泰运输有限公司', '3', '（张）', ' 13507201920', null, null);
INSERT INTO `t_customer` VALUES ('14509401708706643', null, '宜昌东能电力工程有限公司', '3', '（冯）', '13886655759', null, null);
INSERT INTO `t_customer` VALUES ('14509402633406265', null, '湖北电易通电气有限公司', '3', '（钟）', '15307138328', null, null);
INSERT INTO `t_customer` VALUES ('1450940334288021', null, '中国葛洲坝集团公司宜昌基地管理局', '3', '（邓）', '13407166522', null, null);
INSERT INTO `t_customer` VALUES ('14509404215999888', null, '秭归县公安局', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14509404928608381', null, '宜昌富豪科技开发有限责任公司', '3', '（李） ', '13807205692', null, null);
INSERT INTO `t_customer` VALUES ('14509407332281877', null, '宜昌市伍家岗区伍家乡村村民委员会', '3', '（刘官超）', '18972035669', null, null);
INSERT INTO `t_customer` VALUES ('14518944990342698', null, '宜昌市正泰房地产开发有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14519616026279799', null, '宜昌鸿泰置业有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14519621518739716', null, '湖北伟悦食品有限公司', '3', '（付）', '675777', null, null);
INSERT INTO `t_customer` VALUES ('14519623398856772', null, '宜昌长和置业有限公司', '3', '（杨）', '13997748114', null, null);
INSERT INTO `t_customer` VALUES ('14519631303074628', null, '武警交通六支队', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14519750338988547', null, '国网宜昌供电公司', '3', '田宝奎', '18271360501', null, null);
INSERT INTO `t_customer` VALUES ('14520513037023448', null, '凌云（宜昌）飞机维修工程有限公司', '3', '钟', '13667163599', null, null);
INSERT INTO `t_customer` VALUES ('1452051411969793', null, '宜昌葛洲坝物业管理有限公司', '3', '（杨） ', '15572728008', null, null);
INSERT INTO `t_customer` VALUES ('14521369166396597', null, '湖北远大华瑞电力工程有限责任公司', '3', '骆扬', '13986272175', null, null);
INSERT INTO `t_customer` VALUES ('14522189042266485', null, '湖北中能电力安装有限公司', '3', '', '13308601028', null, null);
INSERT INTO `t_customer` VALUES ('14522374845303761', null, '宜昌市东山开发区南苑企业发展总公司', '3', '付', '15872655777 ', null, null);
INSERT INTO `t_customer` VALUES ('14525725958043047', null, '宜昌市富豪科技开发有限责任公司', '3', '（李） ', '13807205692', null, null);
INSERT INTO `t_customer` VALUES ('14525864142835057', null, '中铁大桥局第七工程有限公司', '3', '祝良红', '', null, null);
INSERT INTO `t_customer` VALUES ('14526550648763447', null, '宜昌鑫大兴混凝土有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('1452738428607752', null, '宜昌三峡鑫物保税物流有限公司', '3', '杨洋', '13872551830', null, null);
INSERT INTO `t_customer` VALUES ('1453166902161552', null, '宜昌春华俊源房地产开发有限公司', '3', '朱', '15172389197', null, null);
INSERT INTO `t_customer` VALUES ('14562095393297998', '73790499-5', '', null, '', '', '', '');
INSERT INTO `t_customer` VALUES ('14563637656613576', null, '宜昌鸿铭置业有限公司', '3', '', '13437108779', null, null);
INSERT INTO `t_customer` VALUES ('14573226881927274', null, '宜昌昌瑞送变电工程有限公司', '3', '杨', '13997748114', null, null);
INSERT INTO `t_customer` VALUES ('14576805012761842', '', '宜昌供电公司', null, '', '', '', '');
INSERT INTO `t_customer` VALUES ('14576812699414919', null, '宜昌南玻硅材料有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14579183880476847', null, '远安县盘棚一级公路改建工程建设管理办公室', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('1458090764483594', null, '宜昌慈馨庭置业有限责任公司', '3', '李守凤', '13507200369', null, null);
INSERT INTO `t_customer` VALUES ('14593219938656196', null, '宜昌市公安局高新区分局', '3', '肖', '18871592602', null, null);
INSERT INTO `t_customer` VALUES ('1459907215798333', '91420500309887703G', '湖北绿萝文化创意产业运营管理有限公司', null, '', '', '', '');
INSERT INTO `t_customer` VALUES ('14599129127527767', null, '湖北兴润置业有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14605363903444695', null, '葛洲坝小区', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14610339774407201', null, '武汉天仕达电气有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14610502778883205', null, '湖北鹏发送变电工程有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14610503592294785', null, '湖北鹏发送变电工程有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14612000956537777', null, '宜昌市天立房地产开发有限公司', '3', '赵华', '13997658899', null, null);
INSERT INTO `t_customer` VALUES ('1461206365928531', null, '宜昌信合置业有限公司', '3', '（吴） ', ' 13972046048', null, null);
INSERT INTO `t_customer` VALUES ('14617205271516627', null, '宜昌清能广源置业有限责任公司', '3', '（寇）   ', '18671786685', null, null);
INSERT INTO `t_customer` VALUES ('14617242203316090', null, '宜昌市妇幼保健医院', '3', '郑宗军', '', null, null);
INSERT INTO `t_customer` VALUES ('14617422200006594', null, '宜昌市经济技术开发区万年村村民委员会', '3', '（付）', '675777', null, null);
INSERT INTO `t_customer` VALUES ('14617422660368273', null, '宜昌虎牙滩旅游度假村有限公司', '3', '（袁）', '15171838099', null, null);
INSERT INTO `t_customer` VALUES ('14628477237538944', null, '武汉华源红琦电力工程有限公司', '3', '（陈） ', '18986236123', null, null);
INSERT INTO `t_customer` VALUES ('14628490409587179', null, '湖北鹏发送变电工程有限公司', '3', '', '', null, null);
INSERT INTO `t_customer` VALUES ('14633601215086309', '', '宜昌市开发区张家村村民委员会', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('1463370858570366', '', '测试单位', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('1463371110074163', '0000000000', '北宜化猇亭置业有限公司', '3', '张', '', '北宜化猇亭置业有限公司', '');
INSERT INTO `t_customer` VALUES ('14635560737807963', '', '宜昌恒信德龙商业开发管理有限公司', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('14640534877674831', '', '宜昌市猇亭工业园投资开发有限公司', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('14641634522666135', '', '宜昌兴立置业有限公司 ', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('14648297974369539', '', '宜昌南玻显示器件有限公司', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('14651817722816787', '', '宜昌鄂中化工有限公司 ', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('1465693529456490', '', '武汉新阳电力工程有限公司', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('14673528593525151', '', '湖北新中太电力电子工程有限公司 ', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('14688116925056084', '', ' 宜昌中发电力工程有限公司', '3', '', '', '', '');
INSERT INTO `t_customer` VALUES ('14688119357723939', '', '宜昌市长江初级中学 ', '3', '', '', '', '');

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
INSERT INTO `t_depart` VALUES ('0', '未知', '未知', '未知');

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
INSERT INTO `t_dictionary` VALUES ('110000001', 'dic_page_size', '分页常量', 'small', '小', '10', '5', '5', null, '小');
INSERT INTO `t_dictionary` VALUES ('110000002', 'dic_page_size', '分页常量', 'middle', '中', '20', '10', '10', null, '中');
INSERT INTO `t_dictionary` VALUES ('110000003', 'dic_page_size', '分页常量', 'big', '大', '50', '15', '15', null, '大');
INSERT INTO `t_dictionary` VALUES ('120000001', 'dic_state', '是否启用', 'invalid', '停用', '0', '0', '0', null, '停用');
INSERT INTO `t_dictionary` VALUES ('120000002', 'dic_state', '是否启用', 'valid', '启用', '1', '1', '1', null, '启用');
INSERT INTO `t_dictionary` VALUES ('130000001', 'dic_company_type', '单位类型', 'fgs', '分公司', '1', '1', '1', null, '分公司');
INSERT INTO `t_dictionary` VALUES ('130000002', 'dic_company_type', '单位类型', 'nbdw', '内部单位', '2', '2', '2', null, '内部单位');
INSERT INTO `t_dictionary` VALUES ('130000003', 'dic_company_type', '单位类型', 'wbdw', '外部单位', '3', '3', '3', null, '外部单位');
INSERT INTO `t_dictionary` VALUES ('130000004', 'dic_company_type', '单位类型', 'gys', '设备供应商', '4', '4', '4', null, '设备供应商');
INSERT INTO `t_dictionary` VALUES ('140000001', 'dic_fund_type', '资金类型', 'receipt', '收款', '1', '1', '1', null, '收款');
INSERT INTO `t_dictionary` VALUES ('140000002', 'dic_fund_type', '资金类型', 'pay', '付款', '2', '2', '2', null, '付款');
INSERT INTO `t_dictionary` VALUES ('150000001', 'dic_fund_state', '资金计划执行状态', 'plan', '计划', '1', '1', '1', null, '计划');
INSERT INTO `t_dictionary` VALUES ('150000002', 'dic_fund_state', '资金计划执行状态', 'execute', '执行', '2', '2', '2', null, '执行');
INSERT INTO `t_dictionary` VALUES ('160000001', 'dic_module_type', '模块分类', 'GJ', '公建', '1', '1', '1', null, '公建项目');
INSERT INTO `t_dictionary` VALUES ('160000002', 'dic_module_type', '模块分类', 'ZJ', '住建', '2', '2', '2', null, '住建项目');
INSERT INTO `t_dictionary` VALUES ('160000003', 'dic_module_type', '模块分类', '107', '107项目', '3', '3', '3', null, '107项目');
INSERT INTO `t_dictionary` VALUES ('160000004', 'dic_module_type', '模块分类', '非107', '非107项目', '4', '4', '3', null, '非107项目');
INSERT INTO `t_dictionary` VALUES ('170000001', 'dic_contract_type', '合同分类', 'ZBHT', '总包合同', '1', '1', '1', null, '总包');
INSERT INTO `t_dictionary` VALUES ('170000002', 'dic_contract_type', '合同分类', 'NBHT', '内部合同', '2', '2', '2', null, '内部合同');
INSERT INTO `t_dictionary` VALUES ('170000003', 'dic_contract_type', '合同分类', 'SBCG', '设备采购合同', '3', '3', '2', null, '设备采购合同');
INSERT INTO `t_dictionary` VALUES ('170000004', 'dic_contract_type', '合同分类', 'QTHT', '其他合同', '4', '4', '2', null, '其他合同');
INSERT INTO `t_dictionary` VALUES ('170000005', 'dic_contract_type', '合同分类', 'RWS', '施工任务书', '5', '5', '2', null, '施工任务书');
INSERT INTO `t_dictionary` VALUES ('180000001', 'dic_project_type', '工程类型', 'WZ', '物资', '1', '2', '1', null, '物资');
INSERT INTO `t_dictionary` VALUES ('180000002', 'dic_project_type', '工程类型', 'SY', '试验', '2', '3', '2', null, '试验');
INSERT INTO `t_dictionary` VALUES ('180000003', 'dic_project_type', '工程类型', 'SG', '施工', '3', '1', '3', null, '施工');
INSERT INTO `t_dictionary` VALUES ('180000004', 'dic_project_type', '工程类型', 'QT', '其他', '4', '4', '4', null, '其他');
INSERT INTO `t_dictionary` VALUES ('190000001', 'dic_contract_state', '合同状态', 'DDHQ', '等待会签', '1', '1', '1', null, '等待会签');
INSERT INTO `t_dictionary` VALUES ('190000002', 'dic_contract_state', '合同状态', 'HQ', '会签', '2', '2', '2', null, '会签');
INSERT INTO `t_dictionary` VALUES ('190000003', 'dic_contract_state', '合同状态', 'ZX', '执行', '3', '3', '3', null, '执行');
INSERT INTO `t_dictionary` VALUES ('190000004', 'dic_contract_state', '合同状态', 'JG', '竣工', '4', '4', '4', null, '竣工');
INSERT INTO `t_dictionary` VALUES ('190000005', 'dic_contract_state', '合同状态', 'DSY', '待试验', '5', '5', '5', null, '待试验');
INSERT INTO `t_dictionary` VALUES ('190000006', 'dic_contract_state', '合同状态', 'DZB', '待装表', '6', '6', '6', null, '待装表');
INSERT INTO `t_dictionary` VALUES ('190000007', 'dic_contract_state', '合同状态', 'DYS', '待验收', '7', '7', '7', null, '待验收');
INSERT INTO `t_dictionary` VALUES ('190000008', 'dic_contract_state', '合同状态', 'TGZT', '停工状态', '8', '8', '8', null, '停工状态');
INSERT INTO `t_dictionary` VALUES ('210000001', 'dic_contract_nature', '合同性质', 'YBHT', '一般合同', '1', '1', '1', null, '一般合同');
INSERT INTO `t_dictionary` VALUES ('210000002', 'dic_contract_nature', '合同性质', 'DLHT', '代理合同', '2', '2', '2', null, '代理合同');
INSERT INTO `t_dictionary` VALUES ('220000001', 'dic_selfbuying', '是否', 'false', '否', '0', '2', '0', null, 'false');
INSERT INTO `t_dictionary` VALUES ('220000002', 'dic_selfbuying', '是否', 'true', '是', '1', '1', '1', null, 'true');
INSERT INTO `t_dictionary` VALUES ('230000001', 'dic_process_state', '工程进度状态', 'GDSD', '工单送达', '1', '1', '1', null, '工单送达');
INSERT INTO `t_dictionary` VALUES ('230000002', 'dic_process_state', '工程进度状态', 'SBCG', '设备采购', '2', '2', '2', null, '设备采购');
INSERT INTO `t_dictionary` VALUES ('230000003', 'dic_process_state', '工程进度状态', 'SJWT', '设计委托', '3', '3', '3', null, '设计委托');
INSERT INTO `t_dictionary` VALUES ('230000004', 'dic_process_state', '工程进度状态', 'SJWB', '设计完毕', '4', '4', '4', null, '设计完毕');
INSERT INTO `t_dictionary` VALUES ('230000005', 'dic_process_state', '工程进度状态', 'SG', '施工', '5', '5', '5', null, '施工');
INSERT INTO `t_dictionary` VALUES ('230000006', 'dic_process_state', '工程进度状态', 'JG', '竣工', '6', '6', '6', null, '竣工');
INSERT INTO `t_dictionary` VALUES ('230000007', 'dic_process_state', '工程进度状态', 'ZB', '装表', '7', '7', '7', null, '装表');
INSERT INTO `t_dictionary` VALUES ('230000008', 'dic_process_state', '工程进度状态', 'SY', '实验', '8', '8', '8', null, '实验');
INSERT INTO `t_dictionary` VALUES ('230000009', 'dic_process_state', '工程进度状态', 'dYS', '待验收', '9', '9', '9', null, '待验收');
INSERT INTO `t_dictionary` VALUES ('230000010', 'dic_process_state', '工程进度状态', 'YSWC', '验收完成', '10', '10', '10', null, '验收完成');
INSERT INTO `t_dictionary` VALUES ('230000011', 'dic_process_state', '工程进度状态', 'SD', '送电', '11', '11', '11', null, '送电');
INSERT INTO `t_dictionary` VALUES ('230000012', 'dic_process_state', '工程进度状态', 'ZT', '暂停', '12', '12', '12', null, '暂停');
INSERT INTO `t_dictionary` VALUES ('230000013', 'dic_process_state', '工程进度状态', 'FJ', '复检', '13', '13', '13', null, '复检');
INSERT INTO `t_dictionary` VALUES ('240000001', 'dic_zhibaojin_state', '质保金付款状态', 'false', '未付', '0', '0', '0', null, 'false');
INSERT INTO `t_dictionary` VALUES ('240000002', 'dic_zhibaojin_state', '质保金付款状态', 'true', '已付', '1', '1', '1', null, 'true');
INSERT INTO `t_dictionary` VALUES ('250000001', 'dic_contract_virtual', '是否为虚拟合同', 'false', '否', '0', '0', '0', null, 'false');
INSERT INTO `t_dictionary` VALUES ('250000002', 'dic_contract_virtual', '是否为虚拟合同', 'true', '是', '1', '1', '1', null, 'true');

-- ----------------------------
-- Table structure for `t_factory`
-- ----------------------------
DROP TABLE IF EXISTS `t_factory`;
CREATE TABLE `t_factory` (
  `factoryId` varchar(32) NOT NULL COMMENT '厂商编号',
  `factoryName` varchar(100) DEFAULT NULL COMMENT '厂商名称',
  `factoryContacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `factorycontactsPhone` int(11) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`factoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_factory
-- ----------------------------

-- ----------------------------
-- Table structure for `t_factoryinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_factoryinfo`;
CREATE TABLE `t_factoryinfo` (
  `factoryId` varchar(32) NOT NULL,
  `factoryName` varchar(100) DEFAULT NULL,
  `factoryContacts` varchar(100) DEFAULT NULL,
  `factorycontactsPhone` int(11) DEFAULT NULL,
  PRIMARY KEY (`factoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='厂商信息';

-- ----------------------------
-- Records of t_factoryinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `t_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log` (
  `loginLog_Id` varchar(32) NOT NULL COMMENT '编码',
  `userName` varchar(100) NOT NULL COMMENT '用户登录名',
  `loginTime` datetime NOT NULL COMMENT '登录时间',
  `loginIp` varchar(20) NOT NULL COMMENT '登录IP',
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
INSERT INTO `t_maintenanceinfo` VALUES ('14775782621592214', '123qwe', 'qwe123', '123');
INSERT INTO `t_maintenanceinfo` VALUES ('14776218155121648', 'HBBF', 'WE', '2342');
INSERT INTO `t_maintenanceinfo` VALUES ('14776218270793983', 'EYTE', '5646', '463546');
INSERT INTO `t_maintenanceinfo` VALUES ('14776218342675030', 'TDYR', '35463', '356546');
INSERT INTO `t_maintenanceinfo` VALUES ('14776218392175958', '43653', '4365', '3456345');
INSERT INTO `t_maintenanceinfo` VALUES ('14776218431186342', '5356', '34535', '34535');
INSERT INTO `t_maintenanceinfo` VALUES ('14776218486902184', '354', '3453', '99990000999');
INSERT INTO `t_maintenanceinfo` VALUES ('14776219891059270', 'JT', 'TOM', '1999234123');
INSERT INTO `t_maintenanceinfo` VALUES ('1477721108967950', 'aaa', 'aaa', '1221234123');
INSERT INTO `t_maintenanceinfo` VALUES ('1477721357504366', 'asd', 'asd', '1231234123');
INSERT INTO `t_maintenanceinfo` VALUES ('14777218051633107', 'qwe', 'qwe', '1231234123');
INSERT INTO `t_maintenanceinfo` VALUES ('14777229563168536', 'qqqqww', 'qqqqww', '18690009000');
INSERT INTO `t_maintenanceinfo` VALUES ('14777233365903279', 'aaab', 'aaab', '18799009999');

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
INSERT INTO `t_manager` VALUES ('1420182779174449', '文友同', '06', '1', '', '14228806599085282', '1', '2015-01-02 15:12:59');
INSERT INTO `t_manager` VALUES ('1420182837603580', '张家吉', '01', '1', '', '14258854774364884', '1', '2015-01-02 15:13:57');
INSERT INTO `t_manager` VALUES ('1420182858298480', '朱忠宜', '02', '1', '', '14258855140014114', '1', '2015-01-02 15:14:18');
INSERT INTO `t_manager` VALUES ('1420182932829111', '王祯', '04', '1', '', '1425885533745966', '1', '2015-01-02 15:15:32');
INSERT INTO `t_manager` VALUES ('1420182951852417', '涂蕾', '03', '1', '', '1420184117110586', '1', '2015-01-02 15:15:51');
INSERT INTO `t_manager` VALUES ('1420183184460125', '王晓云', '05', '1', '', '14258857449954149', '1', '2015-01-02 15:19:44');

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
INSERT INTO `t_menu` VALUES ('1420711336094951', '2', '0', '基础信息', '', '', null, '', '1', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714763978062', '3', '1420711336094951', '客户（模板）', '', '', null, '', '2', '6', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714774585853', '3', '1420711336094951', '施工单位（模板）', '', '', null, '', '2', '7', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714784255032', '3', '1420711336094951', '项目经理（模板）', '', '', null, '', '2', '8', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714805866899', '1', '1420714763978062', '客户新建', '', '/customer/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714835269892', '2', '1420714763978062', '客户列表', 'khlb', '/customer/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714861773820', '1', '1420714774585853', '单位新建', '', '/company/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714878474292', '2', '1420714774585853', '单位列表', 'dwlb', '/company/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714906132844', '1', '1420714784255032', '项目经理新建', '', '/manager/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714929015955', '1', '1420714784255032', '项目经理列表', '', '/manager/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1420714976353939', '3', '0', '系统设置', '', '', null, '', '1', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420714987907349', '1', '1420714976353939', '用户', '', '', null, '', '2', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715003825582', '1', '1420714976353939', '角色', '', '', null, '', '2', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715080055842', '1', '1420714976353939', 'url过滤', '', '', null, '', '2', '3', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715096172014', '1', '1420714976353939', '系统资源', '', '', null, '', '2', '4', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715114059104', '1', '1420714976353939', '数据导入', '', '', null, '', '2', '5', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715154089567', '1', '1420714987907349', '用户新建', '', '/userRole/add', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715180833246', '2', '1420714987907349', '用户列表', 'yhlb', '/user/toList', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715229679779', '1', '1420715003825582', '角色新建', '', '/role/add', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715239271120', '1', '1420715003825582', '角色列表', '', '/role/toList', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715259164060', '1', '1420715080055842', 'url新建', '', '/urlFilter/add', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715277527339', '2', '1420715080055842', 'url列表', 'ljlb', '/urlFilter/toList', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715296434232', '2', '1420715096172014', '菜单', 'cdlb', '/menu/list', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715311385655', '2', '1420715096172014', '权限', 'qxlb', '/auth/list', null, '', '3', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715328320527', '3', '1420715114059104', '总包导入', '', '/import/zb', null, '', '3', '1', 'admin', '1');
INSERT INTO `t_menu` VALUES ('1420715342703513', '3', '1420715114059104', '资金导入', 'zjdr', '/import/fund', null, '', '3', '3', 'admin', '1');
INSERT INTO `t_menu` VALUES ('14211187290244018', '2', '1420715114059104', '分包导入', 'fbdr', '/import/fb', null, '', '2', '2', 'admin', '1');
INSERT INTO `t_menu` VALUES ('14772850175791039', '2', '0', '固定资产', 'gdzc', '', null, '', '1', '3', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772852154601912', '5', '14772850175791039', '资产信息', '', '', null, '', '2', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772852690089630', '0', '1420711336094951', '部门', '', '', null, '', '2', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772852925375921', '0', '1420711336094951', '供应商', '', '', null, '', '2', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772854018894844', '1', '14772852690089630', '部门新建', '', '/infomanage/depart/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772854190891008', '1', '14772852925375921', '供应商新建', '', '/infomanage/supplier/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772864882915599', '2', '14772852690089630', '部门列表', '', '/infomanage/depart/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865108746357', '1', '14772852925375921', '供应商列表', '', '/infomanage/supplier/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865293066423', '0', '1420711336094951', '厂商', '', '', null, '', '2', '3', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865535855333', '0', '1420711336094951', '项目', '', '', null, '', '2', '4', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772865656659681', '0', '1420711336094951', '维护公司', '', '', null, '', '2', '5', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866301533281', '1', '14772865293066423', '厂商列表', '', '/infomanage/factory/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866557058439', '1', '14772865535855333', '项目新建', '', '/infomanage/project/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866691464823', '1', '14772865535855333', '项目列表', '', '/infomanage/project/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('1477286681754305', '1', '14772865656659681', '维护公司新建', '', '/infomanage/maintenanceinfo/add', null, '', '3', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772866946501411', '1', '14772865656659681', '维护公司列表', '', '/infomanage/maintenanceinfo/toList', null, '', '3', '2', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14772867720972587', '0', '14772850175791039', '资产购置', '', '', null, '', '2', '4', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772868833544411', '0', '14772850175791039', '资产报损', '', '', null, '', '2', '5', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772869040906982', '0', '14772850175791039', '资产维护', '', '', null, '', '2', '6', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14772869338986538', '0', '14772850175791039', '资产调拨', '', '', null, '', '2', '7', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14776646808332094', '2', '14772852154601912', '资产信息新建', '', '/assetmanage/assetinf/add', null, '', '3', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14776653739281452', '0', '14772852154601912', '资产信息列表', '', '/assetmanage/assetinf/toList', null, '', '3', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('1477715034403106', '0', '14772865293066423', '厂商新建', '', '/infomanage/factory/add', null, '', '4', '1', 'basic', '1');
INSERT INTO `t_menu` VALUES ('14777190920004178', '1', '14772850175791039', '资产名称', '', '', null, '', '2', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('1477719637229924', '1', '14772850175791039', '资产类别', '', '', null, '', '3', '3', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14777196867707091', '1', '1477719637229924', '资产类别新建', '', '/assetmanage/assetcla/add', null, '', '3', '1', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14777197369553224', '1', '1477719637229924', '资产类别列表', '', '/assetmanage/assetcla/toList', null, '', '3', '2', 'asset', '1');
INSERT INTO `t_menu` VALUES ('14777211280368582', '0', '14777190920004178', '资产名称列表', '', '/assetmanage/assetnam/toList', null, '', '3', '2', 'asset', '1');

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
INSERT INTO `t_project` VALUES ('14775557899721602', 'project2', 'pro220');
INSERT INTO `t_project` VALUES ('1477555859911314', 'proj3', 'pro333');
INSERT INTO `t_project` VALUES ('14775559134805945', 'pro1', 'pro1');
INSERT INTO `t_project` VALUES ('14775559376983906', 'pro110', 'pro11');
INSERT INTO `t_project` VALUES ('14775559768521486', 'pro2', 'pro2000');
INSERT INTO `t_project` VALUES ('14775783670361399', 'pro111', 'pro112');
INSERT INTO `t_project` VALUES ('14775783782744522', 'pro234', 'pro234');

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
INSERT INTO `t_role` VALUES ('1422880482333465', '合同管理人员');
INSERT INTO `t_role` VALUES ('1422880524297216', '资金管理人员');
INSERT INTO `t_role` VALUES ('14228805608164580', '施工单管理人员');
INSERT INTO `t_role` VALUES ('14228805802388332', '领导');
INSERT INTO `t_role` VALUES ('14258850553263939', '项目经理');
INSERT INTO `t_role` VALUES ('14258851133783221', '财务人员');

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
INSERT INTO `t_role_auth` VALUES ('14258851133787322', '14258851133783221', '1420772109742853');
INSERT INTO `t_role_auth` VALUES ('14258851133791875', '14258851133783221', '1420773093949823');
INSERT INTO `t_role_auth` VALUES ('14258851133793592', '14258851133783221', '1420773314453033');
INSERT INTO `t_role_auth` VALUES ('14258851133805325', '14258851133783221', '1420773493666583');
INSERT INTO `t_role_auth` VALUES ('14258851133813441', '14258851133783221', '1420773565145124');
INSERT INTO `t_role_auth` VALUES ('14258851133814278', '14258851133783221', '1420773534380203');
INSERT INTO `t_role_auth` VALUES ('14258851133821612', '14258851133783221', '1420773636017638');
INSERT INTO `t_role_auth` VALUES ('14258851133829131', '14258851133783221', '1420773613643754');
INSERT INTO `t_role_auth` VALUES ('14258851133829230', '14258851133783221', '1420773589043511');
INSERT INTO `t_role_auth` VALUES ('14258851133831078', '14258851133783221', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14258851133831497', '14258851133783221', '14207834198593056');
INSERT INTO `t_role_auth` VALUES ('14258851133838784', '14258851133783221', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14258851133844552', '14258851133783221', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('1425885113384823', '14258851133783221', '1420775943320158');
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
INSERT INTO `t_role_auth` VALUES ('14514494414783845', '14258850553263939', '1420772567611964');
INSERT INTO `t_role_auth` VALUES ('1451449441479297', '14258850553263939', '14207822387818396');
INSERT INTO `t_role_auth` VALUES ('14514494414795170', '14258850553263939', '1420772124693379');
INSERT INTO `t_role_auth` VALUES ('14514494414798349', '14258850553263939', '14207830733092149');
INSERT INTO `t_role_auth` VALUES ('14514494414803706', '14258850553263939', '1420773694450030');
INSERT INTO `t_role_auth` VALUES ('14514494414804815', '14258850553263939', '1420773659157244');
INSERT INTO `t_role_auth` VALUES ('14514494414806904', '14258850553263939', '1420773711773276');
INSERT INTO `t_role_auth` VALUES ('14514494414807555', '14258850553263939', '1420773726030363');
INSERT INTO `t_role_auth` VALUES ('1451449441481139', '14258850553263939', '1420773788413401');
INSERT INTO `t_role_auth` VALUES ('14514494414815325', '14258850553263939', '1420773672158823');
INSERT INTO `t_role_auth` VALUES ('14514494414817272', '14258850553263939', '14207798603537179');
INSERT INTO `t_role_auth` VALUES ('14514494414819311', '14258850553263939', '1420773742294509');
INSERT INTO `t_role_auth` VALUES ('1451449441482148', '14258850553263939', '14207793349437128');
INSERT INTO `t_role_auth` VALUES ('14514494414826391', '14258850553263939', '14207792181559705');
INSERT INTO `t_role_auth` VALUES ('14514494414827779', '14258850553263939', '1420773869301261');
INSERT INTO `t_role_auth` VALUES ('14514494414831634', '14258850553263939', '1420779368218445');
INSERT INTO `t_role_auth` VALUES ('14514494414833752', '14258850553263939', '14224322031769575');
INSERT INTO `t_role_auth` VALUES ('14514494414835384', '14258850553263939', '1420772147666154');
INSERT INTO `t_role_auth` VALUES ('14514494414836936', '14258850553263939', '14207793973677986');
INSERT INTO `t_role_auth` VALUES ('1451449441484167', '14258850553263939', '1422432215483779');
INSERT INTO `t_role_auth` VALUES ('1451449441484639', '14258850553263939', '1420772221464153');
INSERT INTO `t_role_auth` VALUES ('14514494414849521', '14258850553263939', '1420774002502579');
INSERT INTO `t_role_auth` VALUES ('14514494414851751', '14258850553263939', '1420774140321299');
INSERT INTO `t_role_auth` VALUES ('14514494414854900', '14258850553263939', '1420774113507456');
INSERT INTO `t_role_auth` VALUES ('14514494414855926', '14258850553263939', '1420774101283702');
INSERT INTO `t_role_auth` VALUES ('1451449441485914', '14258850553263939', '1420774016157821');
INSERT INTO `t_role_auth` VALUES ('14514494414861716', '14258850553263939', '1420774193556914');
INSERT INTO `t_role_auth` VALUES ('14514494414862977', '14258850553263939', '1420774067874118');
INSERT INTO `t_role_auth` VALUES ('14514494414865412', '14258850553263939', '1420774206470840');
INSERT INTO `t_role_auth` VALUES ('14514494414865785', '14258850553263939', '1420774157700576');
INSERT INTO `t_role_auth` VALUES ('14514494414871305', '14258850553263939', '1420774251048339');
INSERT INTO `t_role_auth` VALUES ('14514494414874412', '14258850553263939', '1422431957081816');
INSERT INTO `t_role_auth` VALUES ('14514494414874450', '14258850553263939', '1420774086118231');
INSERT INTO `t_role_auth` VALUES ('1451449441487723', '14258850553263939', '1420774228866884');
INSERT INTO `t_role_auth` VALUES ('14514494414881236', '14258850553263939', '14224320526396286');
INSERT INTO `t_role_auth` VALUES ('14514494414885205', '14258850553263939', '14224320680503951');
INSERT INTO `t_role_auth` VALUES ('14514494414885436', '14258850553263939', '14224320813886436');
INSERT INTO `t_role_auth` VALUES ('14514494414887796', '14258850553263939', '14224319917178042');
INSERT INTO `t_role_auth` VALUES ('14514494414889788', '14258850553263939', '14224320346636359');
INSERT INTO `t_role_auth` VALUES ('14514494414891403', '14258850553263939', '1422432150997948');
INSERT INTO `t_role_auth` VALUES ('14514494414894542', '14258850553263939', '1420772233319582');
INSERT INTO `t_role_auth` VALUES ('1451449441489663', '14258850553263939', '14224321288951151');
INSERT INTO `t_role_auth` VALUES ('14514494414897680', '14258850553263939', '14224321088278810');
INSERT INTO `t_role_auth` VALUES ('14514494414899226', '14258850553263939', '14224321673729426');
INSERT INTO `t_role_auth` VALUES ('14514494414901449', '14258850553263939', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('14514494414905209', '14258850553263939', '1420774275777703');
INSERT INTO `t_role_auth` VALUES ('14514494414905918', '14258850553263939', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14514494414909524', '14258850553263939', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14514494414913894', '14258850553263939', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('14514494414916509', '14258850553263939', '1420774377287220');
INSERT INTO `t_role_auth` VALUES ('14514494414917567', '14258850553263939', '1420774290241732');
INSERT INTO `t_role_auth` VALUES ('14514494414918003', '14258850553263939', '1420774405744078');
INSERT INTO `t_role_auth` VALUES ('14514494414919483', '14258850553263939', '1420774396362234');
INSERT INTO `t_role_auth` VALUES ('14514494414922209', '14258850553263939', '14207810436186945');
INSERT INTO `t_role_auth` VALUES ('14514494414923684', '14258850553263939', '1420774413825368');
INSERT INTO `t_role_auth` VALUES ('14514494414925032', '14258850553263939', '1420774304817411');
INSERT INTO `t_role_auth` VALUES ('14514494414925236', '14258850553263939', '1420774445780262');
INSERT INTO `t_role_auth` VALUES ('1451449441492885', '14258850553263939', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('14514494414931682', '14258850553263939', '14207789119125323');
INSERT INTO `t_role_auth` VALUES ('14514494414932825', '14258850553263939', '14207789758687084');
INSERT INTO `t_role_auth` VALUES ('14514494414933316', '14258850553263939', '1420774465765368');
INSERT INTO `t_role_auth` VALUES ('14514494414936853', '14258850553263939', '1420774455327507');
INSERT INTO `t_role_auth` VALUES ('14514494414939116', '14258850553263939', '1420774474960970');
INSERT INTO `t_role_auth` VALUES ('14514494414943199', '14258850553263939', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14514494414943833', '14258850553263939', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14514494414945056', '14258850553263939', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14514494414947472', '14258850553263939', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14514495344192179', '1422880524297216', '1420772567611964');
INSERT INTO `t_role_auth` VALUES ('14514495344193557', '1422880524297216', '1420772636759604');
INSERT INTO `t_role_auth` VALUES ('14514495344194349', '1422880524297216', '1420772100203442');
INSERT INTO `t_role_auth` VALUES ('14514495344202305', '1422880524297216', '1420772873463524');
INSERT INTO `t_role_auth` VALUES ('14514495344203077', '1422880524297216', '1420772816426164');
INSERT INTO `t_role_auth` VALUES ('14514495344204104', '1422880524297216', '1420772841344168');
INSERT INTO `t_role_auth` VALUES ('14514495344208479', '1422880524297216', '1420772791006108');
INSERT INTO `t_role_auth` VALUES ('14514495344216311', '1422880524297216', '14207807222611412');
INSERT INTO `t_role_auth` VALUES ('14514495344216378', '1422880524297216', '1420772889288042');
INSERT INTO `t_role_auth` VALUES ('1451449534421938', '1422880524297216', '14514398294787009');
INSERT INTO `t_role_auth` VALUES ('1451449534421954', '1422880524297216', '14207798327022352');
INSERT INTO `t_role_auth` VALUES ('14514495344224680', '1422880524297216', '1420773093949823');
INSERT INTO `t_role_auth` VALUES ('14514495344225060', '1422880524297216', '1420773314453033');
INSERT INTO `t_role_auth` VALUES ('14514495344226444', '1422880524297216', '1420772109742853');
INSERT INTO `t_role_auth` VALUES ('14514495344234970', '1422880524297216', '1420773565145124');
INSERT INTO `t_role_auth` VALUES ('14514495344235690', '1422880524297216', '1420773493666583');
INSERT INTO `t_role_auth` VALUES ('1451449534423587', '1422880524297216', '1420773589043511');
INSERT INTO `t_role_auth` VALUES ('14514495344236917', '1422880524297216', '1420773534380203');
INSERT INTO `t_role_auth` VALUES ('14514495344241516', '1422880524297216', '1420773636017638');
INSERT INTO `t_role_auth` VALUES ('14514495344244925', '1422880524297216', '14207834198593056');
INSERT INTO `t_role_auth` VALUES ('14514495344245993', '1422880524297216', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14514495344249220', '1422880524297216', '1420773613643754');
INSERT INTO `t_role_auth` VALUES ('14514495344254634', '1422880524297216', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14514495344254676', '1422880524297216', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14514495344258387', '1422880524297216', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14514495708745560', '14228805802388332', '1420772221464153');
INSERT INTO `t_role_auth` VALUES ('14514495708748144', '14228805802388332', '1420772567611964');
INSERT INTO `t_role_auth` VALUES ('14514495708753795', '14228805802388332', '1420774113507456');
INSERT INTO `t_role_auth` VALUES ('14514495708756458', '14228805802388332', '1420774016157821');
INSERT INTO `t_role_auth` VALUES ('14514495708758762', '14228805802388332', '1420774101283702');
INSERT INTO `t_role_auth` VALUES ('14514495708759268', '14228805802388332', '1420774002502579');
INSERT INTO `t_role_auth` VALUES ('14514495708763062', '14228805802388332', '1420774067874118');
INSERT INTO `t_role_auth` VALUES ('14514495708767393', '14228805802388332', '1420774140321299');
INSERT INTO `t_role_auth` VALUES ('14514495708768021', '14228805802388332', '1420774157700576');
INSERT INTO `t_role_auth` VALUES ('14514495708768379', '14228805802388332', '1420774193556914');
INSERT INTO `t_role_auth` VALUES ('14514495708771129', '14228805802388332', '1420774206470840');
INSERT INTO `t_role_auth` VALUES ('14514495708776304', '14228805802388332', '1420774228866884');
INSERT INTO `t_role_auth` VALUES ('14514495708777694', '14228805802388332', '1420774086118231');
INSERT INTO `t_role_auth` VALUES ('14514495708784173', '14228805802388332', '1422431957081816');
INSERT INTO `t_role_auth` VALUES ('14514495708787199', '14228805802388332', '14224320346636359');
INSERT INTO `t_role_auth` VALUES ('14514495708788890', '14228805802388332', '1420774251048339');
INSERT INTO `t_role_auth` VALUES ('14514495708788967', '14228805802388332', '14224319917178042');
INSERT INTO `t_role_auth` VALUES ('14514495708791731', '14228805802388332', '14224320813886436');
INSERT INTO `t_role_auth` VALUES ('14514495708794318', '14228805802388332', '14224321088278810');
INSERT INTO `t_role_auth` VALUES ('14514495708796496', '14228805802388332', '14224320680503951');
INSERT INTO `t_role_auth` VALUES ('14514495708797188', '14228805802388332', '14224320526396286');
INSERT INTO `t_role_auth` VALUES ('14514495708801655', '14228805802388332', '14224321288951151');
INSERT INTO `t_role_auth` VALUES ('1451449570880712', '14228805802388332', '14224321673729426');
INSERT INTO `t_role_auth` VALUES ('14514495708809398', '14228805802388332', '1422432150997948');
INSERT INTO `t_role_auth` VALUES ('1451449570881348', '14228805802388332', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14514495708815898', '14228805802388332', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14514495708816447', '14228805802388332', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14514495708818600', '14228805802388332', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('1457678045101121', '1422880482333465', '1420772078423503');
INSERT INTO `t_role_auth` VALUES ('14576780451017950', '1422880482333465', '1420772409967940');
INSERT INTO `t_role_auth` VALUES ('14576780451018926', '1422880482333465', '1420772388247997');
INSERT INTO `t_role_auth` VALUES ('14576780451021180', '1422880482333465', '1420772486436817');
INSERT INTO `t_role_auth` VALUES ('14576780451022442', '1422880482333465', '1420772501393606');
INSERT INTO `t_role_auth` VALUES ('1457678045102276', '1422880482333465', '1420772567611964');
INSERT INTO `t_role_auth` VALUES ('14576780451026296', '1422880482333465', '1420772705319225');
INSERT INTO `t_role_auth` VALUES ('1457678045102637', '1422880482333465', '1420772522188659');
INSERT INTO `t_role_auth` VALUES ('14576780451031217', '1422880482333465', '14207826734493707');
INSERT INTO `t_role_auth` VALUES ('14576780451032098', '1422880482333465', '14207822387818396');
INSERT INTO `t_role_auth` VALUES ('14576780451034529', '1422880482333465', '1420772745323510');
INSERT INTO `t_role_auth` VALUES ('1457678045103561', '1422880482333465', '14207830733092149');
INSERT INTO `t_role_auth` VALUES ('14576780451035837', '1422880482333465', '14207830633095572');
INSERT INTO `t_role_auth` VALUES ('1457678045104466', '1422880482333465', '14207831337311781');
INSERT INTO `t_role_auth` VALUES ('14576780451045070', '1422880482333465', '1420772100203442');
INSERT INTO `t_role_auth` VALUES ('14576780451047261', '1422880482333465', '14209635279725186');
INSERT INTO `t_role_auth` VALUES ('14576780451064852', '1422880482333465', '1420772636759604');
INSERT INTO `t_role_auth` VALUES ('14576780451069612', '1422880482333465', '1420772816426164');
INSERT INTO `t_role_auth` VALUES ('14576780451069626', '1422880482333465', '1420772791006108');
INSERT INTO `t_role_auth` VALUES ('14576780451071811', '1422880482333465', '14207798327022352');
INSERT INTO `t_role_auth` VALUES ('14576780451074842', '1422880482333465', '1420772873463524');
INSERT INTO `t_role_auth` VALUES ('14576780451075442', '1422880482333465', '1420772841344168');
INSERT INTO `t_role_auth` VALUES ('14576780451076771', '1422880482333465', '14207807222611412');
INSERT INTO `t_role_auth` VALUES ('14576780451079208', '1422880482333465', '1420772889288042');
INSERT INTO `t_role_auth` VALUES ('14576780451083388', '1422880482333465', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('14576780451085810', '1422880482333465', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14576780451087396', '1422880482333465', '14514398294787009');
INSERT INTO `t_role_auth` VALUES ('14576780451088676', '1422880482333465', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14576780451089573', '1422880482333465', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('14576780451091059', '1422880482333465', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14576780451091167', '1422880482333465', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14576780451092813', '1422880482333465', '1420774520651678');
INSERT INTO `t_role_auth` VALUES ('14576780451095211', '1422880482333465', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14576780451095833', '1422880482333465', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('14777147552852834', '10001', '1420774275777703');
INSERT INTO `t_role_auth` VALUES ('14777147552857044', '10001', '1420772233319582');
INSERT INTO `t_role_auth` VALUES ('14777147552865084', '10001', '1420774351532614');
INSERT INTO `t_role_auth` VALUES ('14777147552866638', '10001', '1420774322970502');
INSERT INTO `t_role_auth` VALUES ('14777147552869239', '10001', '1420774335138882');
INSERT INTO `t_role_auth` VALUES ('14777147552873447', '10001', '1420774377287220');
INSERT INTO `t_role_auth` VALUES ('14777147552873653', '10001', '14207810183426843');
INSERT INTO `t_role_auth` VALUES ('14777147552883177', '10001', '1420774405744078');
INSERT INTO `t_role_auth` VALUES ('14777147552885012', '10001', '1420774290241732');
INSERT INTO `t_role_auth` VALUES ('14777147552885794', '10001', '1420774396362234');
INSERT INTO `t_role_auth` VALUES ('14777147552895960', '10001', '1420774413825368');
INSERT INTO `t_role_auth` VALUES ('14777147552897863', '10001', '14207810436186945');
INSERT INTO `t_role_auth` VALUES ('14777147552898366', '10001', '1420774429615659');
INSERT INTO `t_role_auth` VALUES ('1477714755290455', '10001', '1420774304817411');
INSERT INTO `t_role_auth` VALUES ('14777147552907085', '10001', '1420774445780262');
INSERT INTO `t_role_auth` VALUES ('14777147552915257', '10001', '1420774455327507');
INSERT INTO `t_role_auth` VALUES ('14777147552932182', '10001', '1420774474960970');
INSERT INTO `t_role_auth` VALUES ('14777147552935244', '10001', '1420774465765368');
INSERT INTO `t_role_auth` VALUES ('14777147552939682', '10001', '14207789119125323');
INSERT INTO `t_role_auth` VALUES ('14777147552946363', '10001', '14207789758687084');
INSERT INTO `t_role_auth` VALUES ('14777147552946631', '10001', '14777143194701213');
INSERT INTO `t_role_auth` VALUES ('14777147552947773', '10001', '14777144360006547');
INSERT INTO `t_role_auth` VALUES ('14777147552948600', '10001', '14777143499375662');
INSERT INTO `t_role_auth` VALUES ('14777147552948948', '10001', '14777143750578757');
INSERT INTO `t_role_auth` VALUES ('14777147552954630', '10001', '1420772254227721');
INSERT INTO `t_role_auth` VALUES ('1477714755295498', '10001', '1420774623216907');
INSERT INTO `t_role_auth` VALUES ('14777147552956314', '10001', '14777144572177847');
INSERT INTO `t_role_auth` VALUES ('14777147552956465', '10001', '1420774542863414');
INSERT INTO `t_role_auth` VALUES ('14777147552957912', '10001', '14777144706536288');
INSERT INTO `t_role_auth` VALUES ('14777147552958249', '10001', '1420774613888712');
INSERT INTO `t_role_auth` VALUES ('14777147552963291', '10001', '1420774641375167');
INSERT INTO `t_role_auth` VALUES ('14777147552964998', '10001', '1420774700409999');
INSERT INTO `t_role_auth` VALUES ('14777147552968096', '10001', '1420775963441954');
INSERT INTO `t_role_auth` VALUES ('14777147552968801', '10001', '1420774631600043');
INSERT INTO `t_role_auth` VALUES ('1477714755296920', '10001', '1420774553720576');
INSERT INTO `t_role_auth` VALUES ('14777147552971188', '10001', '1420775979999883');
INSERT INTO `t_role_auth` VALUES ('14777147552972622', '10001', '1420774737226827');
INSERT INTO `t_role_auth` VALUES ('14777147552972899', '10001', '1420774724213717');
INSERT INTO `t_role_auth` VALUES ('14777147552974578', '10001', '1420774714071975');
INSERT INTO `t_role_auth` VALUES ('14777147552977166', '10001', '1420774745961527');
INSERT INTO `t_role_auth` VALUES ('14777147552977495', '10001', '1420774667698457');
INSERT INTO `t_role_auth` VALUES ('14777147552982135', '10001', '1420774769821826');
INSERT INTO `t_role_auth` VALUES ('14777147552982261', '10001', '1420782568463801');
INSERT INTO `t_role_auth` VALUES ('1477714755298291', '10001', '1420774792080143');
INSERT INTO `t_role_auth` VALUES ('14777147552985171', '10001', '1420774582018270');
INSERT INTO `t_role_auth` VALUES ('14777147552985659', '10001', '1420774803540383');
INSERT INTO `t_role_auth` VALUES ('14777147552989427', '10001', '1420774783343847');
INSERT INTO `t_role_auth` VALUES ('14777147552992654', '10001', '14207826192878641');
INSERT INTO `t_role_auth` VALUES ('14777147552994590', '10001', '14207826306574883');
INSERT INTO `t_role_auth` VALUES ('1477714755299597', '10001', '14211383048565271');
INSERT INTO `t_role_auth` VALUES ('14777147552996459', '10001', '14211382908723036');
INSERT INTO `t_role_auth` VALUES ('1477714755299888', '10001', '14207825834738015');
INSERT INTO `t_role_auth` VALUES ('1477714755300425', '10001', '1420775943320158');
INSERT INTO `t_role_auth` VALUES ('14777147553004711', '10001', '1420774848247326');
INSERT INTO `t_role_auth` VALUES ('14777147553004827', '10001', '1420774864855339');
INSERT INTO `t_role_auth` VALUES ('14777147553005065', '10001', '14211383168242947');
INSERT INTO `t_role_auth` VALUES ('14777147553005220', '10001', '1420774520651678');

-- ----------------------------
-- Table structure for `t_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier` (
  `supplierId` varchar(32) NOT NULL COMMENT '供应商编号',
  `supplierName` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `supplierContacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `suppliercontactsPhone` int(11) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------

-- ----------------------------
-- Table structure for `t_supplierinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_supplierinfo`;
CREATE TABLE `t_supplierinfo` (
  `supplierId` varchar(32) NOT NULL COMMENT '供应商编号',
  `supplierName` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `supplierContacts` varchar(100) DEFAULT NULL COMMENT '供应商联系人',
  `suppliercontactsPhone` int(11) DEFAULT NULL COMMENT '供应商联系人电话',
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='供应商信息';

-- ----------------------------
-- Records of t_supplierinfo
-- ----------------------------

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
INSERT INTO `t_upload` VALUES ('14272462630629172', '0', 'doc', '20150325091743_913.doc', null, '01宜昌市市房地产新街坊保障房141224.doc', '20150325091743_913.doc');
INSERT INTO `t_upload` VALUES ('14280241980216576', '0', 'doc', '20150403092318_627.doc', null, '02五环钻机具141225.doc', '20150403092318_627.doc');
INSERT INTO `t_upload` VALUES ('14280245920782706', '0', 'doc', '20150403092952_47.doc', null, '03（试）湖北伟悦食品有限公司10kV施工电源工程141226-Z.doc', '20150403092952_47.doc');
INSERT INTO `t_upload` VALUES ('14280257719553837', '0', 'doc', '20150403094931_834.doc', null, '04（试）宜昌生物产业园建设管理办公室10kV施工电源工程141226-Z.doc', '20150403094931_834.doc');
INSERT INTO `t_upload` VALUES ('14332341972539903', '0', 'doc', '20150602163637_918.doc', null, '06宜昌市公安局西陵区分局141224.doc', '20150602163637_918.doc');
INSERT INTO `t_upload` VALUES ('14332343698215803', '0', 'doc', '20150602163929_794.doc', null, '07宜昌市房投“平湖馨苑三期”10kV施工电源工程141230.doc', '20150602163929_794.doc');
INSERT INTO `t_upload` VALUES ('14332346197021263', '0', 'doc', '20150602164339_987.doc', null, '08凌云（宜昌）飞机维修工程有限公司10kV施工电源工程141231.doc', '20150602164339_987.doc');
INSERT INTO `t_upload` VALUES ('14332348710494809', '0', 'doc', '20150602164751_478.doc', null, '09武警交通管网工程施工承包合同20141218.doc', '20150602164751_478.doc');
INSERT INTO `t_upload` VALUES ('14332348780232301', '0', 'doc', '20150602164758_36.doc', null, '09-1武警六支队协议1218nn.doc', '20150602164758_36.doc');
INSERT INTO `t_upload` VALUES ('14332930662185971', '0', 'doc', '20150603085746_687.doc', null, '11宜昌市第十一中学增容改造150104.doc', '20150603085746_687.doc');
INSERT INTO `t_upload` VALUES ('14332931938421754', '0', 'doc', '20150603085953_141.doc', null, '12（试）恒鼎徽达再生资源10kV配电工程141226-Y.doc', '20150603085953_141.doc');
INSERT INTO `t_upload` VALUES ('14332933149304726', '0', 'doc', '20150603090154_521.doc', null, '13（试）凯旋置业“凯旋名门”酒店10kV配电工程150112.doc', '20150603090154_521.doc');
INSERT INTO `t_upload` VALUES ('14332934308224350', '0', 'doc', '20150603090350_201.doc', null, '14九坤置业“易家居建材馆”10kV施工电源工程150112.doc', '20150603090350_201.doc');
INSERT INTO `t_upload` VALUES ('14332935212569467', '0', 'doc', '20150603090521_17.doc', null, '15宜昌市窑湾乡唐家湾村村民委员会“2#村民安置房”141222.doc', '20150603090521_17.doc');
INSERT INTO `t_upload` VALUES ('14332936293332505', '0', 'doc', '20150603090709_570.doc', null, '16宜昌迪瑞华森新能源公司150106.doc', '20150603090709_570.doc');
INSERT INTO `t_upload` VALUES ('14332938636296508', '0', 'doc', '20150603091103_337.doc', null, '17葛洲坝集团第六工程公司“居住组团B#楼”商业及公建141119.doc', '20150603091103_337.doc');
INSERT INTO `t_upload` VALUES ('14332941416221704', '0', 'doc', '20150603091541_435.doc', null, '19湖北石油宜昌石油分公司“龙盘湖油气站”10kV配电工程131012.doc', '20150603091541_435.doc');
INSERT INTO `t_upload` VALUES ('14332978335871008', '0', 'doc', '20150603101713_720.doc', null, '20宏信房地产“宏信依山郡”公建专变10kV配电工程150112.doc', '20150603101713_720.doc');
INSERT INTO `t_upload` VALUES ('14333005118623579', '0', 'doc', '20150603110151_555.doc', null, '21伍家岗区教育局“第三十中学”10kV施工电源工程150128.doc', '20150603110151_555.doc');
INSERT INTO `t_upload` VALUES ('14333016520378478', '0', 'doc', '20150603112052_980.doc', null, '21伍家岗区教育局“第三十中学”10kV施工电源工程150128.doc', '20150603112052_980.doc');
INSERT INTO `t_upload` VALUES ('14333016647514030', '0', 'doc', '20150603112104_317.doc', null, '21伍家岗区教育局“第三十中学”10kV施工电源工程150128.doc', '20150603112104_317.doc');
INSERT INTO `t_upload` VALUES ('14333018027172286', '0', 'doc', '20150603112322_972.doc', null, '21伍家岗区教育局“第三十中学”10kV施工电源工程150128.doc', '20150603112322_972.doc');
INSERT INTO `t_upload` VALUES ('14333019814311450', '0', 'doc', '20150603112621_626.doc', null, '23安置房建设公司“上合园安置房”商业及公建10kV配电工程150127.doc', '20150603112621_626.doc');
INSERT INTO `t_upload` VALUES ('14333020859831604', '0', 'doc', '20150603112805_568.doc', null, '24西陵区高新技术产业孵化中心10kV配电工程150205.doc', '20150603112805_568.doc');
INSERT INTO `t_upload` VALUES ('14333022751954470', '0', 'doc', '20150603113115_250.doc', null, '25宜昌市房投公司“东锦苑-东站路”10kV施工用电工程150212.doc', '20150603113115_250.doc');
INSERT INTO `t_upload` VALUES ('14333023721346232', '0', 'doc', '20150603113252_743.doc', null, '26猇亭农民还迁房七里冲10kV配电工程150202.doc', '20150603113252_743.doc');
INSERT INTO `t_upload` VALUES ('14333024511799701', '0', 'doc', '20150603113411_955.doc', null, '27新华园“新华国际广场”10kV临时施工电源工程150302.doc', '20150603113411_955.doc');
INSERT INTO `t_upload` VALUES ('1433302620720792', '0', 'doc', '20150603113700_208.doc', null, '建行福绥路（安装）0304.doc', '20150603113700_208.doc');
INSERT INTO `t_upload` VALUES ('14333026261024243', '0', 'doc', '20150603113706_197.doc', null, '物资采购合同(三送).doc', '20150603113706_197.doc');
INSERT INTO `t_upload` VALUES ('14333027541639522', '0', 'doc', '20150603113914_37.doc', null, '29（试）宜昌市伍家乡旭光村“旭光村村民安置房”10kV施工电源工程150311.doc', '20150603113914_37.doc');
INSERT INTO `t_upload` VALUES ('14333028382637120', '0', 'doc', '20150603114038_761.doc', null, '30（试）宜昌市伍家城投“伍建SOUH中心”10kV配电工程150311.doc', '20150603114038_761.doc');
INSERT INTO `t_upload` VALUES ('14333029085884229', '0', 'doc', '20150603114148_189.doc', null, '31虎牙柑桔专业合作社150126.doc', '20150603114148_189.doc');
INSERT INTO `t_upload` VALUES ('14333030143719588', '0', 'doc', '20150603114334_929.doc', null, '32中国长江航运集团宜昌船厂“临江溪码头”10kV配电减容工程150316.doc', '20150603114334_929.doc');
INSERT INTO `t_upload` VALUES ('14333031012952876', '0', 'doc', '20150603114501_639.doc', null, '33嘉禾置业“美岸长堤三期（ABC区）”10kV施工电源工程150317.doc', '20150603114501_639.doc');
INSERT INTO `t_upload` VALUES ('14333038416414436', '0', 'doc', '20150603115721_867.doc', null, '34（试）宜昌市猇亭区红联砂石厂10kV配电工程150323.doc', '20150603115721_867.doc');
INSERT INTO `t_upload` VALUES ('14333039241491148', '0', 'doc', '20150603115844_965.doc', null, '35猇亭农民还迁房七里冲三期公建及商业10kV配电工程150306.doc', '20150603115844_965.doc');
INSERT INTO `t_upload` VALUES ('14333154588579297', '0', 'doc', '20150603151058_623.doc', null, '38宜昌监狱“胜利四路经济适用房”公建及商业10kV配电工程150324.doc', '20150603151058_623.doc');
INSERT INTO `t_upload` VALUES ('14333156872887311', '0', 'doc', '20150603151447_791.doc', null, '40沙河村村民委员会“沙河村村民安置房四期”10kV施工电源工程150317.doc', '20150603151447_791.doc');
INSERT INTO `t_upload` VALUES ('14333159473879913', '0', 'doc', '20150603151907_551.doc', null, '42（试）宜昌住邦资产管理有限公司10kV配电增容改造工程150402.doc', '20150603151907_551.doc');
INSERT INTO `t_upload` VALUES ('14333160223618075', '0', 'doc', '20150603152022_970.doc', null, '43湖北一致嘉纤生物科技有限公司“生物产业园”10kV配电工程150407.doc', '20150603152022_970.doc');
INSERT INTO `t_upload` VALUES ('14333161726051965', '0', 'doc', '20150603152252_371.doc', null, '44宜昌市农产品质量安全监督检测站10kV配电工程150408.doc', '20150603152252_371.doc');
INSERT INTO `t_upload` VALUES ('14333164586319311', '0', 'doc', '20150603152738_696.doc', null, '45宜化新天地电缆沟150112.doc', '20150603152738_696.doc');
INSERT INTO `t_upload` VALUES ('14333165387538810', '0', 'doc', '20150603152858_196.doc', null, '46宜都兴发110kV变电站定值合同2.doc', '20150603152858_196.doc');
INSERT INTO `t_upload` VALUES ('14333166685763867', '0', 'doc', '20150603153108_405.doc', null, '47讯算创业园“半山雲庭”10kV临时施工电源工程150402.doc', '20150603153108_405.doc');
INSERT INTO `t_upload` VALUES ('14333167930804211', '0', 'doc', '20150603153313_506.doc', null, '一水厂（安装）1124.doc', '20150603153313_506.doc');
INSERT INTO `t_upload` VALUES ('14333168023937098', '0', 'doc', '20150603153322_393.doc', null, '物资采购合同(三送).doc', '20150603153322_393.doc');
INSERT INTO `t_upload` VALUES ('14333169348228204', '0', 'doc', '20150603153534_407.doc', null, '49-1湖北省宜昌市中级人民法院双电源改造工程150331.doc', '20150603153534_407.doc');
INSERT INTO `t_upload` VALUES ('14333169445257490', '0', 'doc', '20150603153544_408.doc', null, '49-2湖北省宜昌市中级人民法院双电源改造工程（增补）150331.doc', '20150603153544_408.doc');
INSERT INTO `t_upload` VALUES ('14333170120113248', '0', 'doc', '20150603153651_281.doc', null, '50宜昌三峡全通涂镀板有限公司“国诚涂镀板有限公司”临时调试电源工程150421.doc', '20150603153651_281.doc');
INSERT INTO `t_upload` VALUES ('14333170918831118', '0', 'doc', '20150603153811_147.doc', null, '51（试）中国长江航运集团宜昌船厂10kV配电工程150422.doc', '20150603153811_147.doc');
INSERT INTO `t_upload` VALUES ('14333171867625872', '0', 'doc', '20150603153946_689.doc', null, '52中建三局宜昌建设发展有限公司“中铁-宜昌滨江中央商务区（A地块）”10k施工电源工程150422.doc', '20150603153946_689.doc');
INSERT INTO `t_upload` VALUES ('14333173506098726', '0', 'doc', '20150603154230_408.doc', null, '54（试）宜昌鑫安达玻璃制品有限公司10kV配电增容改造工程150424.doc', '20150603154230_408.doc');
INSERT INTO `t_upload` VALUES ('14333174332906403', '0', 'doc', '20150603154353_248.doc', null, '55（试）宜昌市经济技术开发区万年村村民委员会“万年村失地农民安置房”10kV配电工程150424.doc', '20150603154353_248.doc');
INSERT INTO `t_upload` VALUES ('14333180684299678', '0', 'doc', '20150603155428_541.doc', null, '57共联村村民委员会“四季花城棚户区改造”150427.doc', '20150603155428_541.doc');
INSERT INTO `t_upload` VALUES ('14333182495616721', '0', 'doc', '20150603155729_501.doc', null, '58中铁上海工程局集团有限公司“东山二路项目（旭光七组）”150427.doc', '20150603155729_501.doc');
INSERT INTO `t_upload` VALUES ('14333803212908398', '0', 'doc', '20150604091201_241.doc', null, '59中铁上海工程局集团有限公司“东山二路项目（联丰村四组T2)”150427.doc', '20150604091201_241.doc');
INSERT INTO `t_upload` VALUES ('14333804285562239', '0', 'doc', '20150604091348_475.doc', null, '60中铁上海工程局集团有限公司“东山二路项目（旭光四组)”150429.doc', '20150604091348_475.doc');
INSERT INTO `t_upload` VALUES ('14333805522958261', '0', 'doc', '20150604091552_481.doc', null, '61葛洲坝人民检察院10kV配电工程150429.doc', '20150604091552_481.doc');
INSERT INTO `t_upload` VALUES ('14333806673302014', '0', 'doc', '20150604091747_714.doc', null, '62伍家工业园区消防站10kV配电工程150430.doc', '20150604091747_714.doc');
INSERT INTO `t_upload` VALUES ('14333810684537340', '0', 'doc', '20150604092428_230.doc', null, '63中建三局“西陵二路“项目（珍珠路交汇口）”150506.doc', '20150604092428_230.doc');
INSERT INTO `t_upload` VALUES ('14333811401352657', '0', 'doc', '20150604092540_994.doc', null, '64中建三局“西陵二路“项目（城东大道交汇口）”150506.doc', '20150604092540_994.doc');
INSERT INTO `t_upload` VALUES ('14333813541686575', '0', 'doc', '20150604092914_281.doc', null, '65中建三局“西陵二路“项目（体育场路交汇口）”150506.doc', '20150604092914_281.doc');
INSERT INTO `t_upload` VALUES ('14333860311504384', '0', 'doc', '20150604104711_593.doc', null, '66中建三局“西陵二路“项目（东山四路交汇口）”150506.doc', '20150604104711_593.doc');
INSERT INTO `t_upload` VALUES ('14333860403547372', '0', 'doc', '20150604104720_424.doc', null, '66中建三局“西陵二路“项目（东山四路交汇口）”150506.doc', '20150604104720_424.doc');
INSERT INTO `t_upload` VALUES ('14333868341773108', '0', 'doc', '20150604110034_95.doc', null, '66中建三局“西陵二路“项目（东山四路交汇口）”150506.doc', '20150604110034_95.doc');
INSERT INTO `t_upload` VALUES ('14333870397699660', '0', 'doc', '20150604110359_225.doc', null, '67华鹏置业“梧桐邑一期”商业及公建10kV配电工程150413.doc', '20150604110359_225.doc');
INSERT INTO `t_upload` VALUES ('14333874269477996', '0', 'doc', '20150604111026_406.doc', null, '68山水房地产上水华庭住宅公建专变10kV配电工程150507.doc', '20150604111026_406.doc');
INSERT INTO `t_upload` VALUES ('14333875405464221', '0', 'doc', '20150604111220_180.doc', null, '69均瑞地产“环城南路B3”10kV施工电源工程150430.doc', '20150604111220_180.doc');
INSERT INTO `t_upload` VALUES ('14333876146467876', '0', 'doc', '20150604111334_762.doc', null, '70城投“夷陵中学新校区”10kV施工电源工程150514.doc', '20150604111334_762.doc');
INSERT INTO `t_upload` VALUES ('14333878549493000', '0', 'doc', '20150604111734_718.doc', null, '71宜昌宜景地产宜化新天地一期150212.doc', '20150604111734_718.doc');
INSERT INTO `t_upload` VALUES ('14333879543216393', '0', 'doc', '20150604111914_954.doc', null, '72宜昌三峡日报社户表150527.doc', '20150604111914_954.doc');
INSERT INTO `t_upload` VALUES ('14509200035863618', '0', 'doc', '20151224092003_457.doc', null, '126湖北益通建设工程有限责任公司“益通总部经济园”10kV配电工程151119.doc', '20151224092003_457.doc');
INSERT INTO `t_upload` VALUES ('14509205194666344', '0', 'doc', '20151224092839_149.doc', null, '127-1三峡物流园光伏发电项目10kV上网工程151119.doc', '20151224092839_149.doc');
INSERT INTO `t_upload` VALUES ('14509213504483295', '0', 'doc', '20151224094230_979.doc', null, '128易中物流150713.doc', '20151224094230_979.doc');
INSERT INTO `t_upload` VALUES ('14509260842904537', '0', 'doc', '20151224110124_726.doc', null, '01均瑞地产“御景天地”10kV施工电源工程151215.doc', '20151224110124_726.doc');
INSERT INTO `t_upload` VALUES ('14509390636683831', '0', 'doc', '20151224143743_261.doc', null, '128易中物流150713.doc', '20151224143743_261.doc');
INSERT INTO `t_upload` VALUES ('1450939152191714', '0', 'doc', '20151224143912_618.doc', null, '129长江航运公安局宜昌分局“船舶安检”10kV配电工程151019.doc', '20151224143912_618.doc');
INSERT INTO `t_upload` VALUES ('14509393531398810', '0', 'doc', '20151224144233_52.doc', null, '130-1长楹官邸151126.doc', '20151224144233_52.doc');
INSERT INTO `t_upload` VALUES ('14509393649504706', '0', 'doc', '20151224144244_490.doc', null, '130-2长楹官邸151126补充协议151217.doc', '20151224144244_490.doc');
INSERT INTO `t_upload` VALUES ('14509399968273732', '0', 'doc', '20151224145316_295.doc', null, '131宜昌宏业气体有限公司（猇亭站前路）10kV配电工程151203.doc', '20151224145316_295.doc');
INSERT INTO `t_upload` VALUES ('14509400746496329', '0', 'doc', '20151224145434_503.doc', null, '132宜昌市宏泰运输有限公司“猇亭”10kV配电工程151205.doc', '20151224145434_503.doc');
INSERT INTO `t_upload` VALUES ('14509401679613019', '0', 'doc', '20151224145607_898.doc', null, '133（试）宜昌高新投资开发有限公司“梅花村安置房（一期）”151210.doc', '20151224145607_898.doc');
INSERT INTO `t_upload` VALUES ('14509402560994317', '0', 'doc', '20151224145736_82.doc', null, '134中建三局第一建设工程有限责任公司10kV施工电源工程（T1、T2））151210.doc', '20151224145736_82.doc');
INSERT INTO `t_upload` VALUES ('1450940331272869', '0', 'doc', '20151224145851_308.doc', null, '135葛洲坝集团宜昌基地管理局“望州岗棚改”10kV施工电源工程151210.doc', '20151224145851_308.doc');
INSERT INTO `t_upload` VALUES ('14509404902171582', '0', 'doc', '20151224150130_118.doc', null, '137（试）盛发置业“总部鑫苑”公建及商业151216.doc', '20151224150130_118.doc');
INSERT INTO `t_upload` VALUES ('14509407252777505', '0', 'doc', '20151224150525_241.doc', null, '138（试）伍家乡火光村“村民安置房二期”公建及商业151221.doc', '20151224150525_241.doc');
INSERT INTO `t_upload` VALUES ('14514484743909197', '0', 'doc', '20151230120754_243.doc', null, '华强化工151223.doc', '20151230120754_243.doc');
INSERT INTO `t_upload` VALUES ('14514484817449382', '0', 'doc', '20151230120801_837.doc', null, '物资合同华强化工.doc', '20151230120801_837.doc');
INSERT INTO `t_upload` VALUES ('14518927925823061', '0', 'doc', '20160104153312_431.doc', null, '01宜昌市市房地产新街坊保障房141224.doc', '20160104153312_431.doc');
INSERT INTO `t_upload` VALUES ('14518944902119115', '0', 'doc', '20160104160130_476.doc', null, '正泰“玫瑰园”二期专变10kV配电工程160104.doc', '20160104160130_476.doc');
INSERT INTO `t_upload` VALUES ('14519615950155117', '0', 'doc', '20160105103954_150.doc', null, '04鸿泰置业天域水岸151223.doc', '20160105103954_150.doc');
INSERT INTO `t_upload` VALUES ('14519617790649132', '0', 'doc', '20160105104258_248.doc', null, '02五环钻机具141225.doc', '20160105104258_248.doc');
INSERT INTO `t_upload` VALUES ('1451962144604087', '0', 'doc', '20160105104904_811.doc', null, '03（试）湖北伟悦食品有限公司10kV施工电源工程141226-Z.doc', '20160105104904_811.doc');
INSERT INTO `t_upload` VALUES ('14519622522598797', '0', 'doc', '20160105105052_717.doc', null, '04（试）宜昌生物产业园建设管理办公室10kV施工电源工程141226-Z.doc', '20160105105052_717.doc');
INSERT INTO `t_upload` VALUES ('14519623369363944', '0', 'doc', '20160105105216_200.doc', null, '05长和置业“长和梦幻城市广场”10kV施工电源工程141230.doc', '20160105105216_200.doc');
INSERT INTO `t_upload` VALUES ('14519624979294536', '0', 'doc', '20160105105457_83.doc', null, '06宜昌市公安局西陵区分局141224.doc', '20160105105457_83.doc');
INSERT INTO `t_upload` VALUES ('14519626046801783', '0', 'doc', '20160105105644_715.doc', null, '07宜昌市房投“平湖馨苑三期”10kV施工电源工程141230.doc', '20160105105644_715.doc');
INSERT INTO `t_upload` VALUES ('14519626602948119', '0', 'doc', '20160105105740_873.doc', null, '08凌云（宜昌）飞机维修工程有限公司10kV施工电源工程141231.doc', '20160105105740_873.doc');
INSERT INTO `t_upload` VALUES ('14519631080775234', '0', 'doc', '20160105110508_311.doc', null, '09-1武警六支队协议1218nn.doc', '20160105110508_311.doc');
INSERT INTO `t_upload` VALUES ('1451963124644951', '0', 'doc', '20160105110524_538.doc', null, '09武警交通管网工程施工承包合同20141218.doc', '20160105110524_538.doc');
INSERT INTO `t_upload` VALUES ('14519660366671807', '0', 'doc', '20160105115356_773.doc', null, '11宜昌市第十一中学增容改造150104.doc', '20160105115356_773.doc');
INSERT INTO `t_upload` VALUES ('1451966123797402', '0', 'doc', '20160105115523_669.doc', null, '12（试）恒鼎徽达再生资源10kV配电工程141226-Y.doc', '20160105115523_669.doc');
INSERT INTO `t_upload` VALUES ('14519661673039130', '0', 'doc', '20160105115607_342.doc', null, '13（试）凯旋置业“凯旋名门”酒店10kV配电工程150112.doc', '20160105115607_342.doc');
INSERT INTO `t_upload` VALUES ('14520512995415137', '0', 'doc', '20160106113459_174.doc', null, '05（试验）凌云（宜昌）飞机维修工程有限公司10kV配电工程160106.doc', '20160106113459_174.doc');
INSERT INTO `t_upload` VALUES ('1452064700507397', '0', 'doc', '20160106151820_327.doc', null, '宏信-依山郡.doc', '20160106151820_327.doc');
INSERT INTO `t_upload` VALUES ('14520649839196073', '0', 'doc', '20160106152303_788.doc', null, '生物产业园.doc', '20160106152303_788.doc');
INSERT INTO `t_upload` VALUES ('14521369407487292', '0', 'doc', '20160107112220_548.doc', null, '湖北远大华瑞电力工程有限责任公司城投博物馆160107.doc', '20160107112220_548.doc');
INSERT INTO `t_upload` VALUES ('14522188958025038', '0', 'doc', '20160108100815_449.doc', null, '（试）宜昌金东方学校（小学）160108.doc', '20160108100815_449.doc');
INSERT INTO `t_upload` VALUES ('14522374758874677', '0', 'doc', '20160108151755_519.doc', null, '（试）宜昌市东山开发区南苑企业发展总公司160108.doc', '20160108151755_519.doc');
INSERT INTO `t_upload` VALUES ('14525863934953521', '0', 'doc', '20160112161313_173.doc', null, '香溪长江大桥输变电工程合同151222.doc', '20160112161313_173.doc');
INSERT INTO `t_upload` VALUES ('1452586399801876', '0', 'doc', '20160112161319_299.doc', null, '香溪长江公路大桥材料采购合同（大桥局）151222.doc', '20160112161319_299.doc');
INSERT INTO `t_upload` VALUES ('14526550617435778', '0', 'doc', '20160113111741_964.doc', null, '（试）宜昌鑫大兴混凝土有限公司160112.doc', '20160113111741_964.doc');
INSERT INTO `t_upload` VALUES ('14527384203004517', '0', 'doc', '20160114102700_80.doc', null, '宜昌三峡鑫物保税物流有限公司160112.doc', '20160114102700_80.doc');
INSERT INTO `t_upload` VALUES ('14530814685568658', '0', 'doc', '20160118094428_794.doc', null, '三送-凤凰山变综自合同(南瑞自己做的合同）.doc', '20160118094428_794.doc');
INSERT INTO `t_upload` VALUES ('14530818102453559', '0', 'doc', '20160118095010_349.doc', null, '玫瑰园二期.doc', '20160118095010_349.doc');
INSERT INTO `t_upload` VALUES ('14530821654228807', '0', 'doc', '20160118095605_466.doc', null, '玫瑰园二期.doc', '20160118095605_466.doc');
INSERT INTO `t_upload` VALUES ('14531649752751587', '0', 'doc', '20160119085615_264.doc', null, '玫瑰园二期.doc', '20160119085615_264.doc');
INSERT INTO `t_upload` VALUES ('14531669997109833', '0', 'doc', '20160119092959_288.doc', null, '12宜昌春华俊源房地产开发有限公司“春华星运城”公建及商业160118.doc', '20160119092959_288.doc');
INSERT INTO `t_upload` VALUES ('14532521324143202', '0', 'doc', '20160120090852_98.doc', null, '宜昌市葛洲坝物业管理有限公司锦绣泽园公建专变160106.doc', '20160120090852_98.doc');
INSERT INTO `t_upload` VALUES ('14563636990187436', '0', 'doc', '20160225092818_706.doc', null, '“龙盘湖世纪山水”10kV住宅配电工程20160126.doc', '20160225092818_706.doc');
INSERT INTO `t_upload` VALUES ('14567094042268151', '0', 'doc', '20160229093004_339.doc', null, '鑫物保税物流.doc', '20160229093004_339.doc');
INSERT INTO `t_upload` VALUES ('14567094442286499', '0', 'doc', '20160229093044_135.doc', null, '鑫物保税物流.doc', '20160229093044_135.doc');
INSERT INTO `t_upload` VALUES ('14567095819479566', '0', 'doc', '20160229093301_450.doc', null, '锦绣泽园.doc', '20160229093301_450.doc');
INSERT INTO `t_upload` VALUES ('14567097125134066', '0', 'doc', '20160229093512_283.doc', null, '锦绣泽园.doc', '20160229093512_283.doc');
INSERT INTO `t_upload` VALUES ('14567098335796810', '0', 'doc', '20160229093713_902.doc', null, '春华星运城.doc', '20160229093713_902.doc');
INSERT INTO `t_upload` VALUES ('1457052921973515', '0', 'doc', '20160304085521_109.doc', null, '博物馆.doc', '20160304085521_109.doc');
INSERT INTO `t_upload` VALUES ('14570730510926031', '0', 'doc', '20160304143051_34.doc', null, '博物馆项目.doc', '20160304143051_34.doc');
INSERT INTO `t_upload` VALUES ('14573226824865655', '0', 'doc', '20160307115122_952.doc', null, '16宜昌城投“城乡路综合楼”10kV双电源配电工程160303.doc', '20160307115122_952.doc');
INSERT INTO `t_upload` VALUES ('14573395918143064', '0', 'doc', '20160307163311_129.doc', null, '西坝棚户胡改造“安置房一期”住宅部分配电项目承包合同.doc', '20160307163311_129.doc');
INSERT INTO `t_upload` VALUES ('1457579942445393', '0', 'doc', '20160310111902_63.doc', null, '18均瑞地产环城南路片区旧城改造A地块公建及商业10kV配电工程160301.doc', '20160310111902_63.doc');
INSERT INTO `t_upload` VALUES ('14576812570841616', '0', 'doc', '20160311152737_638.doc', null, '宜昌南玻110kV变电站扩建工程（签字版）.doc', '20160311152737_638.doc');
INSERT INTO `t_upload` VALUES ('1457681264360831', '0', 'doc', '20160311152744_168.doc', null, '供货合同（签字版）.doc', '20160311152744_168.doc');
INSERT INTO `t_upload` VALUES ('14580906806075720', '0', 'doc', '20160316091120_395.doc', null, '20慈馨庭置业“中南皇庭”公建专变160315.doc', '20160316091120_395.doc');
INSERT INTO `t_upload` VALUES ('1458694851447664', '0', 'doc', '20160323090051_811.doc', null, '21（试）湖北楚天高速公路股份有限公司供电配套配电工程160321.doc', '20160323090051_811.doc');
INSERT INTO `t_upload` VALUES ('14591360116601683', '0', 'doc', '20160328113331_278.doc', null, '环城南路片区A块地.doc', '20160328113331_278.doc');
INSERT INTO `t_upload` VALUES ('14591363106055122', '0', 'doc', '20160328113830_44.doc', null, '中南皇庭.doc', '20160328113830_44.doc');
INSERT INTO `t_upload` VALUES ('14593219817892148', '0', 'doc', '20160330151301_806.doc', null, '22宜昌市公安局高新区分局160328.doc', '20160330151301_806.doc');
INSERT INTO `t_upload` VALUES ('14598262300997646', '0', 'doc', '20160405111710_239.doc', null, '南玻变.doc', '20160405111710_239.doc');
INSERT INTO `t_upload` VALUES ('14599072399847191', '0', 'doc', '20160406094719_710.doc', null, '湖北绿萝文化创意产业运营管理有限公司“绿萝路43号”160405.doc', '20160406094719_710.doc');
INSERT INTO `t_upload` VALUES ('14599129089661949', '0', 'doc', '20160406112148_324.doc', null, '24湖北兴润置业有限公司“秋雨台”商业及公建160329.doc', '20160406112148_324.doc');
INSERT INTO `t_upload` VALUES ('14599136336742319', '0', 'doc', '20160406113353_792.doc', null, '城乡综合楼.doc', '20160406113353_792.doc');
INSERT INTO `t_upload` VALUES ('14605088791835604', '0', 'doc', '20160413085439_655.doc', null, '90中铁上海工程局集团有限公司“东山二路项目（旭光五组)”150723.doc', '20160413085439_655.doc');
INSERT INTO `t_upload` VALUES ('14605343201058093', '0', 'doc', '20160413155840_320.doc', null, '公安局高新分局.doc', '20160413155840_320.doc');
INSERT INTO `t_upload` VALUES ('14606152382605573', '0', 'doc', '20160414142718_664.doc', null, '（枝江-省化线路）设备材料采购合同.doc', '20160414142718_664.doc');
INSERT INTO `t_upload` VALUES ('1460615250025039', '0', 'doc', '20160414142730_115.doc', null, '枝省线增容改造（枝江-省化线路）施工分包合同.doc', '20160414142730_115.doc');
INSERT INTO `t_upload` VALUES ('14606161741229503', '0', 'doc', '20160414144254_734.doc', null, '乙二醇变工程设备材料采购合同.doc', '20160414144254_734.doc');
INSERT INTO `t_upload` VALUES ('14606161785175703', '0', 'doc', '20160414144258_593.doc', null, '乙二醇变进线电源改造工程施工分包合同.doc', '20160414144258_593.doc');
INSERT INTO `t_upload` VALUES ('14606164029816117', '0', 'doc', '20160414144642_983.doc', null, '枝江省化新增110千伏电源改造项目（顾醇线）工程建筑安装分包.doc', '20160414144642_983.doc');
INSERT INTO `t_upload` VALUES ('1460616410846388', '0', 'doc', '20160414144650_485.doc', null, '枝江省化新增110千伏电源改造项目（顾醇线）工程设备材料采购分包.doc', '20160414144650_485.doc');
INSERT INTO `t_upload` VALUES ('1461033967847248', '0', 'doc', '20160419104607_665.doc', null, '28武汉天仕达电器中建三局沿江大道延伸段160419.doc', '20160419104607_665.doc');
INSERT INTO `t_upload` VALUES ('14610501591773328', '0', 'doc', '20160419151559_870.doc', null, '29宜昌市园林绿化管理局“城东运动公园”扩容项目承包合同160414.doc', '20160419151559_870.doc');
INSERT INTO `t_upload` VALUES ('14610502588991911', '0', 'doc', '20160419151738_14.doc', null, '30湖北益通建设股份有限公司“三峡摄影博物馆”临时施工用电项目承包合同160414.doc', '20160419151738_14.doc');
INSERT INTO `t_upload` VALUES ('14610503560793114', '0', 'doc', '20160419151916_213.doc', null, '31宜昌泰和建筑工程有限公司（花艳一路）10kV施工用电项目承包合同160419.doc', '20160419151916_213.doc');
INSERT INTO `t_upload` VALUES ('14611192371184000', '0', 'doc', '20160420102717_270.doc', null, '绿萝路43号.doc', '20160420102717_270.doc');
INSERT INTO `t_upload` VALUES ('14612000928718300', '0', 'doc', '20160421085452_193.doc', null, '32宜昌市天立房地产开发有限公司“宜昌中兴广场”商住楼（公建及商业）10kV配电工程160317.doc', '20160421085452_193.doc');
INSERT INTO `t_upload` VALUES ('14612063630714145', '0', 'doc', '20160421103923_863.doc', null, '33宜昌信合置业有限公司“三江至喜”商住项目10kV施工电源工程160420.doc', '20160421103923_863.doc');
INSERT INTO `t_upload` VALUES ('14617205234243847', '0', 'doc', '20160427092843_46.doc', null, '34清能广源置业“清江月亮湾“公建及商业10kV配电工程160422.doc', '20160427092843_46.doc');
INSERT INTO `t_upload` VALUES ('1461724215175704', '0', 'doc', '20160427103015_721.doc', null, '宜昌市妇幼保健医院程1604141(1).doc', '20160427103015_721.doc');
INSERT INTO `t_upload` VALUES ('14618157496724146', '0', 'doc', '20160428115549_53.doc', null, '三江至喜.doc', '20160428115549_53.doc');
INSERT INTO `t_upload` VALUES ('14618159935674607', '0', 'doc', '20160428115953_126.doc', null, '园林绿化等.doc', '20160428115953_126.doc');
INSERT INTO `t_upload` VALUES ('14618160994762508', '0', 'doc', '20160428120139_514.doc', null, '园林绿化等.doc', '20160428120139_514.doc');
INSERT INTO `t_upload` VALUES ('14618161676196131', '0', 'doc', '20160428120247_240.doc', null, '园林绿化等.doc', '20160428120247_240.doc');
INSERT INTO `t_upload` VALUES ('14619120405901970', '0', 'doc', '20160429144040_486.doc', null, '36宜昌宏信房地产有限公司“宏信依山郡”住宅小区二期公建专变10kV配电工程160419.doc', '20160429144040_486.doc');
INSERT INTO `t_upload` VALUES ('1462847709626706', '0', 'doc', '20160510103509_754.doc', null, '37宜昌保利金盛房地产开发有限公司“保利时代”商住项目10kV配电工程160420.doc', '20160510103509_754.doc');
INSERT INTO `t_upload` VALUES ('14628490337737112', '0', 'doc', '20160510105713_140.doc', null, '38宜昌凯普奥包装材料有限公司承包合同160418.doc', '20160510105713_140.doc');
INSERT INTO `t_upload` VALUES ('1463360094271365', '0', 'doc', '20160516085454_780.doc', null, '39宜昌市开发区张家村村民委员会“张家村安置房”公建及商业配套项目10kV配电工程160512.doc', '20160516085454_780.doc');
INSERT INTO `t_upload` VALUES ('1463370775375806', '0', 'doc', '20160516115255_721.doc', null, '宜昌中兴广场.doc', '20160516115255_721.doc');
INSERT INTO `t_upload` VALUES ('14635560524714299', '0', 'doc', '20160518152052_466.doc', null, '40（试）宜昌恒信德龙商业开发管理有限公司“恒信山水”公建转变160518.doc', '20160518152052_466.doc');
INSERT INTO `t_upload` VALUES ('14640534507321791', '0', 'doc', '20160524093050_41.doc', null, '41宜昌猇亭农民还迁办公室“民主路安置房”10kV施工电源工程160505.doc', '20160524093050_41.doc');
INSERT INTO `t_upload` VALUES ('14641634834678622', '0', 'doc', '20160525160443_303.doc', null, '42宜昌兴立置业有限公司“马克公寓”项目10kV施工电源工程160525.doc', '20160525160443_303.doc');
INSERT INTO `t_upload` VALUES ('1464163509690653', '0', 'doc', '20160525160509_235.doc', null, '42宜昌兴立置业有限公司“马克公寓”项目10kV施工电源工程160525.doc', '20160525160509_235.doc');
INSERT INTO `t_upload` VALUES ('14647413132541470', '0', 'doc', '20160601083513_630.doc', null, '43夜明珠路BRT电力下地合同（三送改）.doc', '20160601083513_630.doc');
INSERT INTO `t_upload` VALUES ('14647419183956388', '0', 'doc', '20160601084518_357.doc', null, '44葛洲坝第二工程有限公司桥北小区12#13#住宅公建及商业承包合同16526.doc', '20160601084518_357.doc');
INSERT INTO `t_upload` VALUES ('14647424287192896', '0', 'doc', '20160601085348_676.doc', null, '45宜昌市伍家岗区共强村村民委员会“安置房四期A区”商业及公建承包合同16526.doc', '20160601085348_676.doc');
INSERT INTO `t_upload` VALUES ('14648298231451507', '0', 'doc', '20160602091023_965.doc', null, '46黄光玻璃Sensor产业化项目高压供电增容工程.doc', '20160602091023_965.doc');
INSERT INTO `t_upload` VALUES ('1465178366016772', '0', 'doc', '20160606095926_78.doc', null, '马克公寓.doc', '20160606095926_78.doc');
INSERT INTO `t_upload` VALUES ('1465178710573079', '0', 'doc', '20160606100510_875.doc', null, '宜昌中兴广场.doc', '20160606100510_875.doc');
INSERT INTO `t_upload` VALUES ('14651817430473080', '0', 'doc', '20160606105543_401.doc', null, '47鄂中化工160509(1).doc', '20160606105543_401.doc');
INSERT INTO `t_upload` VALUES ('14656936548338076', '0', 'doc', '20160612090734_548.doc', null, '49龙盘湖世纪山水开闭所及10kV外部电源工程20160526.doc', '20160612090734_548.doc');
INSERT INTO `t_upload` VALUES ('1467352829072946', '0', 'doc', '20160701140029_896.doc', null, '51葛洲坝集团机械船舶有限公司“锦绣江东”住宅公建及商业承包合同16621.doc', '20160701140029_896.doc');
INSERT INTO `t_upload` VALUES ('1468811740085001', '0', 'doc', '20160718111540_442.doc', null, '52房投“平湖馨苑安置房三期”10kV配电工程160712.doc', '20160718111540_442.doc');
INSERT INTO `t_upload` VALUES ('14688118382561498', '0', 'docx', '20160718111718_179.docx', null, '53房投“三江园”10kV配电工程160712.docx', '20160718111718_179.docx');
INSERT INTO `t_upload` VALUES ('14688119131839395', '0', 'docx', '20160718111833_424.docx', null, '54长江中学10kV配电增容工程160715.docx', '20160718111833_424.docx');

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
INSERT INTO `t_urlfilter` VALUES ('14777192654876034', '0', null, '', '', '', '', '', '1', '1', '0', '0', null);

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
  CONSTRAINT `FK_departId` FOREIGN KEY (`departId`) REFERENCES `t_depart` (`departId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '21232F297A57A5A743894A0E4A801FC3', 'admin', '1558637469511', '1', '0');
INSERT INTO `t_user` VALUES ('1420184117110586', '涂蕾', 'E10ADC3949BA59ABBE56E057F20F883E', '涂蕾', '', '1', '0');
INSERT INTO `t_user` VALUES ('14228806599085282', '文友同', 'E10ADC3949BA59ABBE56E057F20F883E', '文友同', '', '1', '0');
INSERT INTO `t_user` VALUES ('14258854774364884', '张家吉', 'E10ADC3949BA59ABBE56E057F20F883E', '张家吉', '', '1', '0');
INSERT INTO `t_user` VALUES ('14258855140014114', '朱忠宜', 'E10ADC3949BA59ABBE56E057F20F883E', '朱忠宜', '', '1', '0');
INSERT INTO `t_user` VALUES ('1425885533745966', '王桢', 'E10ADC3949BA59ABBE56E057F20F883E', '王桢', '', '1', '0');
INSERT INTO `t_user` VALUES ('14258857449954149', '王晓云', 'E10ADC3949BA59ABBE56E057F20F883E', '王晓云', '', '1', '0');

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
INSERT INTO `t_user_role` VALUES ('0000001', '1', '10001');
INSERT INTO `t_user_role` VALUES ('14258854774374270', '14258854774364884', '14258850553263939');
INSERT INTO `t_user_role` VALUES ('14258855140018842', '14258855140014114', '14258850553263939');
INSERT INTO `t_user_role` VALUES ('14258857449968364', '14258857449954149', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('1425885826020174', '14258858260202893', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('14271886555156091', '1420184117110586', '10001');
INSERT INTO `t_user_role` VALUES ('14520635339262719', '1425885533745966', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('14520635339272151', '1425885533745966', '14258850553263939');
INSERT INTO `t_user_role` VALUES ('14520635339273890', '1425885533745966', '1422880524297216');
INSERT INTO `t_user_role` VALUES ('14520635339277378', '1425885533745966', '14228805608164580');
INSERT INTO `t_user_role` VALUES ('14537089293585025', '14228806599085282', '1422880482333465');
INSERT INTO `t_user_role` VALUES ('14537089293586582', '14228806599085282', '1422880524297216');
INSERT INTO `t_user_role` VALUES ('14537089293731610', '14228806599085282', '14258850553263939');
INSERT INTO `t_user_role` VALUES ('14537089293739439', '14228806599085282', '14228805802388332');
INSERT INTO `t_user_role` VALUES ('14537089293739445', '14228806599085282', '14228805608164580');
