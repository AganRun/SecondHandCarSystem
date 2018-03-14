/*
Navicat MySQL Data Transfer

Source Server         : AdminWare
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : second_hand_car_system

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-05-11 22:39:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` varchar(11) NOT NULL,
  `brand_name` varchar(20) NOT NULL,
  `brand_be_query` varchar(6) NOT NULL DEFAULT 'true',
  `brand_saleNum_month1` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month2` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month3` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month4` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month5` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month6` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month7` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month8` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month9` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month10` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month11` int(11) NOT NULL DEFAULT '0',
  `brand_saleNum_month12` int(11) NOT NULL DEFAULT '0',
  `brand_salePrice_month1` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month2` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month3` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month4` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month5` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month6` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month7` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month8` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month9` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month10` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month11` varchar(20) NOT NULL DEFAULT '0',
  `brand_salePrice_month12` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1001', '奥迪', 'true', '0', '0', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2667500', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1002', '奔驰', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1003', '宾利', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1004', '大众', 'true', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45000', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1005', '东风风行', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1006', '福特', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1007', '悍马', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1008', '吉利', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1009', '金杯', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1010', '特斯拉', 'true', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1011', '斯柯达', 'true', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '154000', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1012', '雪佛兰', 'false', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `brand` VALUES ('1013', '宝马', 'true', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '465000', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `car_id` varchar(11) NOT NULL,
  `car_img` varchar(150) NOT NULL,
  `car_name` varchar(30) NOT NULL,
  `car_brand_id` varchar(11) NOT NULL,
  `car_shop_id` varchar(11) NOT NULL,
  `car_price_old` int(11) unsigned zerofill NOT NULL,
  `car_price_new` int(11) unsigned zerofill NOT NULL,
  `car_time_buy` varchar(20) NOT NULL,
  `car_time_shelf` varchar(20) NOT NULL,
  `car_opera_id` varchar(11) NOT NULL,
  `car_status_sell` varchar(1) NOT NULL,
  `car_time_delete` varchar(20) DEFAULT NULL,
  `car_opera_delete_id` varchar(11) DEFAULT NULL,
  `car_status_recommend` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('798001', '奥迪Q5 2015款 40 TFSI 技术型.jpg', '奥迪Q5 2015款 40 TFSI 技术型', '1001', '10006', '00000468500', '00000325000', '2015-02-12', '2016-06-09 20:15:25', '10006', '1', null, null, '1');
INSERT INTO `car` VALUES ('798002', '宝马 X5 2011款 3.0T 自动 xDrive35i.jpg', '宝马 X5 2011款 3.0T 自动 xDrive35i', '1013', '10006', '00000465000', '00000465000', '2016-02-30', '2016-10-02 20:15:25', '10006', '1', null, null, '1');
INSERT INTO `car` VALUES ('798004', '奔驰 C级 2013款 1.8T 自动 C260.jpg', '奔驰 C级 2013款 1.8T 自动 C260', '1002', '10006', '00000206000', '00000206000', '2015-03-04', '2016-12-02 20:15:25', '10006', '1', null, null, '0');
INSERT INTO `car` VALUES ('798005', '斯柯达明锐 2015款 1.6L 自动逸杰版.jpg', '斯柯达明锐 2015款 1.6L 自动逸杰版', '1011', '10006', '00000154000', '00000096000', '2015-03-23', '2017-02-01 20:15:25', '10006', '1', null, null, '0');
INSERT INTO `car` VALUES ('798006', '大众宝来 2016款 1.6L 手动舒适型.jpg', '大众宝来 2016款 1.6L 手动舒适型', '1004', '10006', '00000130000', '00000878000', '2016-07-13', '2017-04-13 20:15:29', '10006', '1', null, null, '0');
INSERT INTO `car` VALUES ('798007', '大众宝来 2016款 1.6L 手动舒适型.jpg', '大众宝来 2016款 1.6L 手动舒适型', '1004', '10006', '00000130000', '00000888000', '2016-07-13', '2017-04-13 20:16:04', '10006', '0', '2017-04-14 12:18:46', '10001', '1');
INSERT INTO `car` VALUES ('798008', '大众捷达 2010款 1.6L 前卫.jpg', '大众捷达 2010款 1.6L 前卫', '1004', '10006', '00000096400', '00000045000', '2012-04-10', '2017-04-14 13:02:15', '10006', '1', '2017-04-14 13:00:05', '10001', '0');
INSERT INTO `car` VALUES ('798009', '宾利欧陆 2012款 4.0T GT V8.jpg', '宾利欧陆 2012款 4.0T GT V8', '1003', '10006', '00003000000', '00002180000', '2014-04-01', '2017-04-20 18:12:54', '10006', '1', '2017-04-20 17:47:37', '10001', '0');
INSERT INTO `car` VALUES ('798010', 'qn1703231519552490a9ae4d85bbf844838e5c7f52662f.jpg', '奔驰E级 2014款 E 200 轿跑版(进口)', '1002', '10007', '00000575300', '00000365000', '2015-01-04', '2017-04-23 20:22:52', '10007', '1', null, null, '0');
INSERT INTO `car` VALUES ('798011', 'qn170418120811a90c8c29293e842dc37a5399a9480948.jpg', '大众POLO 2013款 1.4L 自动舒适版', '1004', '10007', '00000116000', '00000058800', '2013-03-15', '2017-04-23 23:13:11', '10007', '1', null, null, '0');
INSERT INTO `car` VALUES ('798012', '奥迪A3三厢2014款 1.4T 自动 35TFSI进取型.jpg', '奥迪A3三厢2014款 1.4T 自动 35TFSI', '1001', '10007', '00000140000', '00000152000', '2015-05-06', '2017-05-10 21:26:33', '10007', '1', '2017-05-10 21:25:54', '10001', '0');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `login_id` varchar(11) NOT NULL,
  `login_password` varchar(20) NOT NULL,
  `login_permission` varchar(5) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('10001', 'admin123', 'admin');
INSERT INTO `login` VALUES ('10002', 'user123', 'user');
INSERT INTO `login` VALUES ('10003', 'user123', 'user');
INSERT INTO `login` VALUES ('10004', 'user123', 'user');
INSERT INTO `login` VALUES ('10005', 'user123', 'user');
INSERT INTO `login` VALUES ('10006', 'shop123', 'shop');
INSERT INTO `login` VALUES ('10007', 'shop123', 'shop');

-- ----------------------------
-- Table structure for `orderentity`
-- ----------------------------
DROP TABLE IF EXISTS `orderentity`;
CREATE TABLE `orderentity` (
  `order_id` varchar(11) NOT NULL,
  `order_car_id` varchar(11) NOT NULL,
  `order_person_id` varchar(11) NOT NULL,
  `order_shop_id` varchar(11) NOT NULL,
  `order_message` varchar(30) DEFAULT NULL,
  `order_addtime` varchar(20) NOT NULL,
  `order_address` varchar(50) NOT NULL,
  `order_tel` varchar(11) NOT NULL,
  `order_person_name` varchar(10) NOT NULL,
  `order_status_pay` varchar(1) NOT NULL DEFAULT '0',
  `order_time_pay` varchar(20) DEFAULT NULL,
  `order_status_send` varchar(1) NOT NULL DEFAULT '0',
  `order_time_send` varchar(20) DEFAULT NULL,
  `order_status_receive` varchar(1) NOT NULL DEFAULT '0',
  `order_time_receive` varchar(20) DEFAULT NULL,
  `order_status_delete` varchar(1) NOT NULL DEFAULT '1',
  `order_time_delete` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderentity
-- ----------------------------
INSERT INTO `orderentity` VALUES ('1001', '798001', '10004', '10006', '', '2017-04-15 01:13:03', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '1', '2017-04-15 09:51:32', '1', '2017-04-16 23:20:29', '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1003', '798001', '10004', '10006', '', '2017-04-15 01:34:31', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '1', '2017-04-15 08:12:49', '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1004', '798001', '10004', '10006', '', '2017-04-15 01:34:48', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '1', '2017-04-15 08:12:55', '1', '2017-04-15 08:28:38', '1', '2017-04-15 11:23:10', '1', null);
INSERT INTO `orderentity` VALUES ('1005', '798001', '10004', '10006', '', '2017-04-15 01:35:46', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '1', '2017-04-15 09:56:27', '1', '2017-04-15 09:56:40', '1', '2017-04-15 11:21:12', '1', null);
INSERT INTO `orderentity` VALUES ('1006', '798001', '10004', '10006', '', '2017-04-15 01:36:05', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '0', null, '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1007', '798001', '10004', '10006', '', '2017-04-15 01:36:36', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '1', '2017-04-15 08:12:45', '1', '2017-04-15 08:16:54', '1', '2017-04-15 09:56:50', '1', null);
INSERT INTO `orderentity` VALUES ('1009', '798001', '10004', '10006', '', '2017-04-15 01:36:47', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '0', null, '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1010', '798001', '10004', '10006', '', '2017-04-15 01:36:56', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '1', '2017-04-15 08:12:57', '1', '2017-04-15 09:51:48', '1', '2017-04-15 09:51:54', '1', null);
INSERT INTO `orderentity` VALUES ('1011', '798002', '10004', '10006', '', '2017-04-15 02:16:34', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '0', null, '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1012', '798002', '10004', '10006', '', '2017-04-15 02:22:25', '河南省郑州市高新区科学大道100号', '18838901098', '凤衔玉', '0', null, '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1014', '798001', '10003', '10006', '', '2017-04-15 03:55:37', '河南省郑州市高新区科学大道80号', '14568549965', '伤心树', '1', '2017-04-15 03:55:37', '1', '2017-04-15 08:16:57', '1', '2017-04-15 08:50:21', '1', null);
INSERT INTO `orderentity` VALUES ('1015', '798005', '10003', '10006', '', '2017-04-15 03:55:54', '河南省郑州市高新区科学大道80号', '14568549965', '伤心树', '1', '2017-04-15 03:57:34', '1', '2017-04-15 08:29:03', '1', '2017-04-15 09:23:39', '1', null);
INSERT INTO `orderentity` VALUES ('1016', '798005', '10003', '10006', '', '2017-04-15 04:02:35', '河南省郑州市高新区科学大道100号', '14568549965', '伤心树', '1', '2017-04-15 04:02:40', '1', '2017-04-21 16:18:57', '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1017', '798001', '10002', '10006', '', '2017-04-15 04:11:22', '河南省郑州市高新区科学大道80号', '15141326870', '断肠花', '1', '2017-04-15 04:11:24', '1', '2017-04-21 16:19:32', '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1018', '798005', '10003', '10006', '', '2017-04-15 05:53:22', '河南省郑州市高新区科学大道80号', '14568549965', '伤心树', '1', '2017-04-15 06:02:15', '1', '2017-04-21 16:22:39', '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1019', '798001', '10003', '10006', '', '2017-04-15 06:02:30', '河南省郑州市高新区科学大道100号', '14568549965', '伤心树', '0', null, '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1020', '798001', '10003', '10006', '', '2017-04-15 21:37:19', '河南省郑州市高新区科学大道100号', '14568549965', '伤心树', '1', '2017-04-15 09:37:21', '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1021', '798002', '10004', '10006', '', '2017-04-15 21:56:06', '河南省郑州市高新区科学大道80号', '18838901098', '凤衔玉', '1', '2017-04-15 09:56:07', '1', '2017-04-15 09:56:37', '1', '2017-04-15 09:56:48', '0', '2017-04-15 09:56:53');
INSERT INTO `orderentity` VALUES ('1022', '798008', '10002', '10006', '', '2017-04-15 23:25:58', '河南省郑州市高新区科学大道100号', '15141326870', '断肠花', '1', '2017-04-15 23:25:59', '1', '2017-04-15 23:26:11', '1', '2017-04-15 23:26:21', '1', null);
INSERT INTO `orderentity` VALUES ('1023', '798001', '10002', '10006', '', '2017-04-16 23:50:18', '河南省郑州市高新区科学大道100号', '15141326870', '断肠花', '1', '2017-04-16 23:50:21', '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1024', '798001', '10002', '10006', '', '2017-04-16 23:57:08', '河南省郑州市高新区科学大道100号', '15141326870', '断肠花', '0', null, '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1025', '798002', '10003', '10006', '', '2017-05-10 20:48:20', '河南省郑州市高新区科学大道100号', '14568549965', '伤心树', '1', '2017-05-10 20:48:25', '0', null, '0', null, '1', null);
INSERT INTO `orderentity` VALUES ('1026', '798011', '10003', '10007', '', '2017-05-10 20:48:38', '河南省郑州市高新区科学大道80号', '14568549965', '伤心树', '1', '2017-05-10 20:48:39', '0', null, '0', null, '1', null);

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `person_id` varchar(11) NOT NULL,
  `person_name` varchar(10) NOT NULL,
  `person_gender` varchar(2) DEFAULT NULL,
  `person_tel` varchar(11) NOT NULL,
  `person_address` varchar(30) DEFAULT NULL,
  `person_email` varchar(25) DEFAULT NULL,
  `person_time_register` varchar(20) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('10002', '断肠花', null, '15141326870', null, null, '2017-04-07 20:28:19');
INSERT INTO `person` VALUES ('10003', '伤心树', '女', '14568549965', '', '1379154067@qq.com', '2017-04-07 21:28:05');
INSERT INTO `person` VALUES ('10004', '凤衔玉', null, '18838901098', null, null, '2017-04-09 11:09:56');
INSERT INTO `person` VALUES ('10005', '愁眉草', null, '15641335475', null, null, '2017-04-09 11:12:36');
INSERT INTO `person` VALUES ('10006', '洞庭月', null, '13345653346', null, null, '2017-04-17 22:26:03');
INSERT INTO `person` VALUES ('10007', '赤城霞', null, '15534659865', null, null, '2017-04-17 22:36:30');

-- ----------------------------
-- Table structure for `price_classify`
-- ----------------------------
DROP TABLE IF EXISTS `price_classify`;
CREATE TABLE `price_classify` (
  `price_classify_id` varchar(11) NOT NULL,
  `price_classify_num` int(11) NOT NULL,
  PRIMARY KEY (`price_classify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price_classify
-- ----------------------------
INSERT INTO `price_classify` VALUES ('1001', '50000');
INSERT INTO `price_classify` VALUES ('1002', '100000');
INSERT INTO `price_classify` VALUES ('1006', '200000');
INSERT INTO `price_classify` VALUES ('1007', '250000');
INSERT INTO `price_classify` VALUES ('1008', '150000');
INSERT INTO `price_classify` VALUES ('1009', '500000');

-- ----------------------------
-- Table structure for `shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `shopCart_id` varchar(11) NOT NULL,
  `shopCart_car_id` varchar(11) NOT NULL,
  `shopCart_person_id` varchar(11) NOT NULL,
  `shopCart_addtime` varchar(20) NOT NULL,
  PRIMARY KEY (`shopCart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------
INSERT INTO `shopcart` VALUES ('1006', '798002', '10004', '2017-04-15 21:55:58');
INSERT INTO `shopcart` VALUES ('1007', '798001', '10002', '2017-04-16 23:57:04');
