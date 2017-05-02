/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.180
Source Server Version : 50520
Source Host           : 192.168.1.180:3306
Source Database       : fqmall_v1.1.1

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-05-02 10:02:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for onethink_account_record
-- ----------------------------
DROP TABLE IF EXISTS `onethink_account_record`;
CREATE TABLE `onethink_account_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `recharge_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作类型，1管理员操作，0用户操作',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1收入，0支付',
  `title` varchar(128) NOT NULL COMMENT '记录内容',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '交易金额',
  `addtime` int(20) NOT NULL DEFAULT '0' COMMENT '交易时间',
  `is_pay` tinyint(1) DEFAULT '0' COMMENT '是否支付成功，1成功，0未成功',
  `paytime` int(11) DEFAULT NULL COMMENT '充值时间',
  `order_type` tinyint(2) DEFAULT '0' COMMENT '订单类型，1商品订单，2拼团订单',
  `order_id` int(10) DEFAULT '0' COMMENT '订单id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='余额收入支出明细表';

-- ----------------------------
-- Records of onethink_account_record
-- ----------------------------
INSERT INTO `onethink_account_record` VALUES ('4', '32', '0', '1', '充值所得', '100.00', '1477013481', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('5', '20', '0', '1', '充值所得', '150.00', '1477302247', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('6', '20', '0', '1', '充值所得', '150.00', '1477302251', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('7', '20', '1', '1', '充值所得', '180.00', '1477302547', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('8', '32', '1', '1', '活动奖励', '100.00', '1477384983', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('9', '2', '1', '1', '活动奖励', '100.00', '1477384996', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('10', '2', '1', '1', '活动奖励', '100.00', '1477385018', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('11', '2', '1', '1', '测试', '1.00', '1477386574', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('12', '2', '1', '1', '测试', '1.00', '1477386605', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('13', '2', '1', '1', '21', '1.00', '1477386709', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('14', '2', '1', '1', '21', '1.00', '1477386730', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('15', '2', '1', '1', '21', '1.00', '1477386833', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('16', '2', '1', '1', '21', '1.00', '1477386834', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('17', '2', '1', '1', '21', '150.00', '1477386864', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('18', '16', '1', '0', '测试', '150.00', '1477386895', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('19', '15', '1', '0', '测试', '100.00', '1477387036', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('20', '15', '1', '0', '测试', '100.00', '1477387115', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('21', '15', '1', '0', '测试', '100.00', '1477387201', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('22', '23', '0', '1', '充值所得', '800.00', '1479283247', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('23', '23', '0', '0', '支付拼团订单，订单编号：20161116160100935', '105.00', '1479283260', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('24', '23', '0', '0', '支付拼团订单，订单编号：20161117100432479', '70.00', '1479348272', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('25', '32', '0', '0', '支付订单', '180.00', '1479351798', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('26', '23', '0', '0', '支付订单', '200.00', '1479352671', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('27', '23', '0', '1', '充值所得', '500.00', '1479354191', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('28', '23', '0', '0', '支付订单', '250.00', '1479354214', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('29', '23', '0', '0', '支付订单', '300.00', '1479354492', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('30', '23', '0', '0', '支付订单', '100.00', '1479362415', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('31', '23', '0', '0', '支付拼团订单', '30.00', '1479731464', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('32', '23', '1', '1', '拼团失败退款', '30.00', '1479731578', '1', '1479731578', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('33', '21', '0', '0', '支付拼团订单', '30.00', '1479732999', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('34', '21', '0', '0', '支付拼团订单', '30.00', '1479785494', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('35', '21', '0', '0', '支付拼团订单', '30.00', '1479786099', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('36', '21', '0', '0', '支付拼团订单', '30.00', '1479786771', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('37', '32', '0', '0', '支付订单', '100.00', '1479787331', '1', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('38', '23', '1', '1', '充值所得', '3.00', '1479871142', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('39', '23', '1', '1', '拼团失败退款', '30.00', '1479954503', '1', '1479954503', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('40', '23', '1', '1', '拼团失败退款', '30.00', '1479954503', '1', '1479954503', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('41', '23', '1', '1', '拼团失败退款', '30.00', '1479954503', '1', '1479954503', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('42', '23', '1', '1', '拼团失败退款', '30.00', '1479954503', '1', '1479954503', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('43', '23', '1', '1', '拼团失败退款', '30.00', '1479954503', '1', '1479954503', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('44', '23', '1', '1', '拼团失败退款', '30.00', '1479957470', '1', '1479957470', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('45', '23', '1', '1', '拼团失败退款', '30.00', '1479957470', '1', '1479957470', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('46', '23', '1', '1', '拼团失败退款', '30.00', '1479957470', '1', '1479957470', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('47', '23', '1', '1', '拼团失败退款', '30.00', '1479957470', '1', '1479957470', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('48', '21', '1', '1', '拼团失败退款', '30.00', '1479957470', '1', '1479957470', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('49', '21', '1', '1', '拼团失败退款', '30.00', '1479957919', '1', '1479957919', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('50', '21', '1', '1', '拼团失败退款', '30.00', '1479957919', '1', '1479957919', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('51', '21', '1', '1', '拼团失败退款', '30.00', '1479957919', '1', '1479957919', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('52', '21', '1', '1', '拼团失败退款', '30.00', '1479957919', '1', '1479957919', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('53', '21', '1', '1', '拼团失败退款', '30.00', '1479957919', '1', '1479957919', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('54', '21', '1', '1', '拼团失败退款', '30.00', '1479973562', '1', '1479973562', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('55', '21', '1', '1', '拼团失败退款', '30.00', '1479973562', '1', '1479973562', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('56', '21', '1', '1', '拼团失败退款', '30.00', '1479973562', '1', '1479973562', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('57', '21', '1', '1', '拼团失败退款', '30.00', '1479973562', '1', '1479973562', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('58', '21', '1', '1', '拼团失败退款', '30.00', '1479973562', '1', '1479973562', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('59', '21', '1', '1', '拼团失败退款', '30.00', '1479978676', '1', '1479978676', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('60', '21', '1', '1', '拼团失败退款', '30.00', '1479978676', '1', '1479978676', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('61', '21', '1', '1', '拼团失败退款', '30.00', '1479978676', '1', '1479978676', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('62', '21', '1', '1', '拼团失败退款', '30.00', '1479978676', '1', '1479978676', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('63', '21', '1', '1', '拼团失败退款', '30.00', '1479978676', '1', '1479978676', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('64', '21', '1', '1', '拼团失败退款', '30.00', '1481593697', '1', '1481593697', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('65', '21', '1', '1', '拼团失败退款', '30.00', '1481593697', '1', '1481593697', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('66', '21', '1', '1', '拼团失败退款', '30.00', '1481593697', '1', '1481593697', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('67', '21', '1', '1', '拼团失败退款', '30.00', '1481593697', '1', '1481593697', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('68', '21', '1', '1', '拼团失败退款', '30.00', '1481593697', '1', '1481593697', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('69', '21', '1', '1', '拼团失败退款', '30.00', '1481593699', '1', '1481593699', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('70', '21', '1', '1', '拼团失败退款', '30.00', '1481593699', '1', '1481593699', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('71', '21', '1', '1', '拼团失败退款', '30.00', '1481593699', '1', '1481593699', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('72', '21', '1', '1', '拼团失败退款', '30.00', '1481593699', '1', '1481593699', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('73', '21', '1', '1', '拼团失败退款', '30.00', '1481593699', '1', '1481593699', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('74', '21', '1', '1', '拼团失败退款', '30.00', '1481593703', '1', '1481593703', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('75', '21', '1', '1', '拼团失败退款', '30.00', '1481593703', '1', '1481593703', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('76', '21', '1', '1', '拼团失败退款', '30.00', '1481593703', '1', '1481593703', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('77', '21', '1', '1', '拼团失败退款', '30.00', '1481593703', '1', '1481593703', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('78', '21', '1', '1', '拼团失败退款', '30.00', '1481593703', '1', '1481593703', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('79', '21', '1', '1', '拼团失败退款', '30.00', '1481593704', '1', '1481593704', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('80', '21', '1', '1', '拼团失败退款', '30.00', '1481593704', '1', '1481593704', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('81', '21', '1', '1', '拼团失败退款', '30.00', '1481593704', '1', '1481593704', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('82', '21', '1', '1', '拼团失败退款', '30.00', '1481593704', '1', '1481593704', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('83', '21', '1', '1', '拼团失败退款', '30.00', '1481593704', '1', '1481593704', '0', '0');
INSERT INTO `onethink_account_record` VALUES ('84', '21', '0', '1', '充值所得', '231.00', '1483432374', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('85', '23', '0', '0', '支付拼团订单', '50.00', '1483512230', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('86', '23', '0', '0', '支付拼团订单', '30.00', '1483585116', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('87', '23', '0', '0', '支付拼团订单', '30.00', '1483585137', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('88', '23', '0', '0', '支付拼团订单', '2.00', '1483587715', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('89', '23', '0', '0', '支付拼团订单', '1.00', '1483588349', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('90', '23', '0', '0', '支付拼团订单', '1.00', '1483588805', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('91', '23', '1', '1', '拼团失败退款，订单编号：20170105120005464', '1.00', '1483588894', '0', null, '2', '47');
INSERT INTO `onethink_account_record` VALUES ('92', '23', '0', '0', '支付拼团订单，订单编号：20170106214337698', '10.00', '1483710217', '0', null, '2', '1');
INSERT INTO `onethink_account_record` VALUES ('93', '23', '1', '1', '拼团失败退款，订单编号：20170107103535566', '5.00', '1483767907', '0', null, '2', '2');
INSERT INTO `onethink_account_record` VALUES ('94', '23', '0', '0', '支付拼团订单，订单编号：20170107144001158', '10.00', '1483771201', '0', null, '2', '3');
INSERT INTO `onethink_account_record` VALUES ('95', '23', '0', '0', '支付拼团订单，订单编号：20170107150732854', '10.00', '1483772852', '0', null, '2', '5');
INSERT INTO `onethink_account_record` VALUES ('96', '23', '0', '0', '支付拼团订单，订单编号：20170107150827623', '10.00', '1483772907', '0', null, '2', '6');
INSERT INTO `onethink_account_record` VALUES ('97', '23', '0', '0', '支付拼团订单，订单编号：20170107165000902', '10.00', '1483779000', '0', null, '2', '7');
INSERT INTO `onethink_account_record` VALUES ('98', '23', '0', '0', '支付拼团订单，订单编号：20170107165525953', '10.00', '1483779325', '0', null, '2', '8');
INSERT INTO `onethink_account_record` VALUES ('99', '23', '0', '0', '支付拼团订单，订单编号：20170107201235725', '1.00', '1483791155', '0', null, '2', '9');
INSERT INTO `onethink_account_record` VALUES ('100', '23', '0', '0', '支付订单', '50.00', '1483939646', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('101', '23', '0', '0', '支付拼团订单，订单编号：20170110104432561', '1.00', '1484016272', '0', null, '2', '10');
INSERT INTO `onethink_account_record` VALUES ('102', '24', '0', '0', '支付拼团订单，订单编号：20170110113500815', '1.00', '1484019300', '0', null, '2', '12');
INSERT INTO `onethink_account_record` VALUES ('103', '23', '0', '0', '支付拼团订单，订单编号：20170110113951370', '1.00', '1484019591', '0', null, '2', '13');
INSERT INTO `onethink_account_record` VALUES ('104', '23', '0', '0', '支付拼团订单，订单编号：20170110114036533', '1.00', '1484019636', '0', null, '2', '14');
INSERT INTO `onethink_account_record` VALUES ('105', '24', '0', '0', '支付拼团订单，订单编号：20170110114417928', '1.00', '1484019857', '0', null, '2', '15');
INSERT INTO `onethink_account_record` VALUES ('106', '23', '0', '0', '支付订单', '50.00', '1484031273', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('107', '23', '0', '0', '支付订单', '50.00', '1484031390', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('108', '23', '0', '0', '支付拼团订单，订单编号：20170117140630488', '1.00', '1484633190', '0', null, '2', '16');
INSERT INTO `onethink_account_record` VALUES ('109', '4', '0', '0', '支付拼团订单，订单编号：20170117141215464', '1.00', '1484633535', '0', null, '2', '17');
INSERT INTO `onethink_account_record` VALUES ('110', '23', '0', '0', '支付拼团订单，订单编号：20170118140848423', '1.00', '1484719728', '0', null, '2', '18');
INSERT INTO `onethink_account_record` VALUES ('111', '23', '0', '0', '支付订单', '30.00', '1486456077', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('112', '16', '0', '1', '分佣所得', '1.50', '1486456078', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('113', '23', '0', '0', '支付订单', '100.00', '1486456842', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('114', '16', '0', '1', '分佣所得', '5.00', '1486456844', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('115', '16', '0', '1', '分佣所得', '5.00', '1486457137', '0', null, '0', '0');
INSERT INTO `onethink_account_record` VALUES ('116', '23', '0', '0', '支付拼团订单，订单编号：20170207170614479', '30.00', '1486458374', '0', null, '2', '19');

-- ----------------------------
-- Table structure for onethink_action
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of onethink_action
-- ----------------------------
INSERT INTO `onethink_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `onethink_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `onethink_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `onethink_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `onethink_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `onethink_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `onethink_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `onethink_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `onethink_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `onethink_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for onethink_action_log
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=324 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of onethink_action_log
-- ----------------------------
INSERT INTO `onethink_action_log` VALUES ('1', '1', '1', '1873095181', 'member', '1', 'admin在2016-11-25 20:04登录了后台', '1', '1480075485');
INSERT INTO `onethink_action_log` VALUES ('2', '1', '1', '1873100419', 'member', '1', 'admin在2016-11-29 14:59登录了后台', '1', '1480402745');
INSERT INTO `onethink_action_log` VALUES ('3', '1', '1', '1873100419', 'member', '1', 'admin在2016-11-30 11:50登录了后台', '1', '1480477827');
INSERT INTO `onethink_action_log` VALUES ('4', '1', '1', '1873101983', 'member', '1', 'admin在2016-11-30 11:55登录了后台', '1', '1480478118');
INSERT INTO `onethink_action_log` VALUES ('5', '1', '1', '2099655112', 'member', '1', 'admin在2016-12-12 10:36登录了后台', '1', '1481510216');
INSERT INTO `onethink_action_log` VALUES ('6', '1', '1', '2099655112', 'member', '1', 'admin在2016-12-12 13:49登录了后台', '1', '1481521796');
INSERT INTO `onethink_action_log` VALUES ('7', '1', '1', '2099655112', 'member', '1', 'admin在2016-12-12 15:57登录了后台', '1', '1481529439');
INSERT INTO `onethink_action_log` VALUES ('8', '1', '1', '2099655112', 'member', '1', 'admin在2016-12-12 18:19登录了后台', '1', '1481537993');
INSERT INTO `onethink_action_log` VALUES ('9', '1', '1', '1873098650', 'member', '1', 'admin在2016-12-13 09:35登录了后台', '1', '1481592953');
INSERT INTO `onethink_action_log` VALUES ('10', '1', '1', '1873098650', 'member', '1', 'admin在2016-12-13 09:36登录了后台', '1', '1481593010');
INSERT INTO `onethink_action_log` VALUES ('11', '1', '1', '1873098650', 'member', '1', 'admin在2016-12-13 15:43登录了后台', '1', '1481614989');
INSERT INTO `onethink_action_log` VALUES ('12', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-13 15:57登录了后台', '1', '1481615833');
INSERT INTO `onethink_action_log` VALUES ('13', '1', '1', '1873098650', 'member', '1', 'admin在2016-12-13 17:23登录了后台', '1', '1481621032');
INSERT INTO `onethink_action_log` VALUES ('14', '1', '1', '1873098650', 'member', '1', 'admin在2016-12-14 09:34登录了后台', '1', '1481679262');
INSERT INTO `onethink_action_log` VALUES ('15', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-14 09:42登录了后台', '1', '1481679753');
INSERT INTO `onethink_action_log` VALUES ('16', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-14 09:43登录了后台', '1', '1481679811');
INSERT INTO `onethink_action_log` VALUES ('17', '1', '1', '1873098650', 'member', '1', 'admin在2016-12-14 11:08登录了后台', '1', '1481684915');
INSERT INTO `onethink_action_log` VALUES ('18', '1', '1', '1873095262', 'member', '1', 'admin在2016-12-15 13:59登录了后台', '1', '1481781564');
INSERT INTO `onethink_action_log` VALUES ('19', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-15 15:00登录了后台', '1', '1481785219');
INSERT INTO `onethink_action_log` VALUES ('20', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-15 15:02登录了后台', '1', '1481785328');
INSERT INTO `onethink_action_log` VALUES ('21', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-15 15:10登录了后台', '1', '1481785811');
INSERT INTO `onethink_action_log` VALUES ('22', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-15 16:35登录了后台', '1', '1481790946');
INSERT INTO `onethink_action_log` VALUES ('23', '1', '1', '1873096458', 'member', '1', 'admin在2016-12-15 16:36登录了后台', '1', '1481790981');
INSERT INTO `onethink_action_log` VALUES ('24', '1', '1', '1873095262', 'member', '1', 'admin在2016-12-15 17:35登录了后台', '1', '1481794522');
INSERT INTO `onethink_action_log` VALUES ('25', '1', '1', '1873095262', 'member', '1', 'admin在2016-12-16 09:39登录了后台', '1', '1481852379');
INSERT INTO `onethink_action_log` VALUES ('26', '1', '1', '1873094450', 'member', '1', 'admin在2016-12-19 10:20登录了后台', '1', '1482114037');
INSERT INTO `onethink_action_log` VALUES ('27', '1', '1', '1873103736', 'member', '1', 'admin在2016-12-20 08:53登录了后台', '1', '1482195182');
INSERT INTO `onethink_action_log` VALUES ('28', '1', '1', '1873096251', 'member', '1', 'admin在2016-12-21 09:44登录了后台', '1', '1482284685');
INSERT INTO `onethink_action_log` VALUES ('29', '1', '1', '1873092162', 'member', '1', 'admin在2016-12-22 08:49登录了后台', '1', '1482367773');
INSERT INTO `onethink_action_log` VALUES ('30', '1', '1', '1873095069', 'member', '1', 'admin在2016-12-24 14:29登录了后台', '1', '1482560996');
INSERT INTO `onethink_action_log` VALUES ('31', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424388');
INSERT INTO `onethink_action_log` VALUES ('32', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424393');
INSERT INTO `onethink_action_log` VALUES ('33', '11', '1', '2130706433', 'category', '4', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424396');
INSERT INTO `onethink_action_log` VALUES ('34', '11', '1', '2130706433', 'category', '5', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424399');
INSERT INTO `onethink_action_log` VALUES ('35', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424529');
INSERT INTO `onethink_action_log` VALUES ('36', '11', '1', '2130706433', 'category', '3', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424531');
INSERT INTO `onethink_action_log` VALUES ('37', '11', '1', '2130706433', 'category', '4', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424660');
INSERT INTO `onethink_action_log` VALUES ('38', '11', '1', '2130706433', 'category', '5', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483424662');
INSERT INTO `onethink_action_log` VALUES ('39', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/188.html', '1', '1483426449');
INSERT INTO `onethink_action_log` VALUES ('40', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-04 09:43登录了后台', '1', '1483494208');
INSERT INTO `onethink_action_log` VALUES ('41', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-04 11:24登录了后台', '1', '1483500255');
INSERT INTO `onethink_action_log` VALUES ('42', '10', '1', '2130706433', 'Menu', '183', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1483507134');
INSERT INTO `onethink_action_log` VALUES ('43', '10', '1', '2130706433', 'Menu', '190', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1483507152');
INSERT INTO `onethink_action_log` VALUES ('44', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-05 10:17登录了后台', '1', '1483582648');
INSERT INTO `onethink_action_log` VALUES ('45', '11', '1', '2130706433', 'category', '6', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1483597318');
INSERT INTO `onethink_action_log` VALUES ('46', '11', '1', '2130706433', 'category', '7', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1483600659');
INSERT INTO `onethink_action_log` VALUES ('47', '11', '1', '2130706433', 'category', '7', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483600669');
INSERT INTO `onethink_action_log` VALUES ('48', '11', '1', '2130706433', 'category', '6', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483600674');
INSERT INTO `onethink_action_log` VALUES ('49', '11', '1', '2130706433', 'category', '7', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483600730');
INSERT INTO `onethink_action_log` VALUES ('50', '11', '1', '2130706433', 'category', '6', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1483600738');
INSERT INTO `onethink_action_log` VALUES ('51', '11', '1', '2130706433', 'category', '8', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1483607356');
INSERT INTO `onethink_action_log` VALUES ('52', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-06 10:04登录了后台', '1', '1483668290');
INSERT INTO `onethink_action_log` VALUES ('53', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-07 09:25登录了后台', '1', '1483752354');
INSERT INTO `onethink_action_log` VALUES ('54', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-07 11:54登录了后台', '1', '1483761264');
INSERT INTO `onethink_action_log` VALUES ('55', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-07 14:23登录了后台', '1', '1483770210');
INSERT INTO `onethink_action_log` VALUES ('56', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-09 09:55登录了后台', '1', '1483926944');
INSERT INTO `onethink_action_log` VALUES ('57', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-10 10:23登录了后台', '1', '1484015018');
INSERT INTO `onethink_action_log` VALUES ('58', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-10 14:58登录了后台', '1', '1484031519');
INSERT INTO `onethink_action_log` VALUES ('59', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-10 17:57登录了后台', '1', '1484042225');
INSERT INTO `onethink_action_log` VALUES ('60', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-11 14:41登录了后台', '1', '1484116874');
INSERT INTO `onethink_action_log` VALUES ('61', '1', '1', '-1062731335', 'member', '1', 'admin在2017-01-11 15:10登录了后台', '1', '1484118635');
INSERT INTO `onethink_action_log` VALUES ('62', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-11 15:45登录了后台', '1', '1484120721');
INSERT INTO `onethink_action_log` VALUES ('63', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-11 17:26登录了后台', '1', '1484126813');
INSERT INTO `onethink_action_log` VALUES ('64', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-12 14:50登录了后台', '1', '1484203841');
INSERT INTO `onethink_action_log` VALUES ('65', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-16 10:27登录了后台', '1', '1484533672');
INSERT INTO `onethink_action_log` VALUES ('66', '1', '1', '2130706433', 'member', '1', 'admin在2017-01-17 13:14登录了后台', '1', '1484630071');
INSERT INTO `onethink_action_log` VALUES ('67', '1', '1', '-1062731397', 'member', '1', 'admin在2017-02-03 14:10登录了后台', '1', '1486102237');
INSERT INTO `onethink_action_log` VALUES ('68', '11', '1', '-1062731397', 'category', '9', '操作url：/FQMALL_v1.1.1/index.php?s=/Admin/Category/add.html', '1', '1486102568');
INSERT INTO `onethink_action_log` VALUES ('69', '11', '1', '-1062731397', 'category', '10', '操作url：/FQMALL_v1.1.1/index.php?s=/Admin/Category/add.html', '1', '1486102580');
INSERT INTO `onethink_action_log` VALUES ('70', '11', '1', '-1062731397', 'category', '11', '操作url：/FQMALL_v1.1.1/index.php?s=/Admin/Category/add.html', '1', '1486102599');
INSERT INTO `onethink_action_log` VALUES ('71', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-03 16:06登录了后台', '1', '1486109209');
INSERT INTO `onethink_action_log` VALUES ('72', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-06 14:52登录了后台', '1', '1486363966');
INSERT INTO `onethink_action_log` VALUES ('73', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-07 09:57登录了后台', '1', '1486432632');
INSERT INTO `onethink_action_log` VALUES ('74', '10', '1', '2130706433', 'Menu', '203', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1486460826');
INSERT INTO `onethink_action_log` VALUES ('75', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-09 11:32登录了后台', '1', '1486611147');
INSERT INTO `onethink_action_log` VALUES ('76', '1', '1', '-1062731375', 'member', '1', 'admin在2017-02-16 12:02登录了后台', '1', '1487217779');
INSERT INTO `onethink_action_log` VALUES ('77', '1', '1', '-1062731375', 'member', '1', 'admin在2017-02-16 13:19登录了后台', '1', '1487222360');
INSERT INTO `onethink_action_log` VALUES ('78', '1', '1', '-1062731375', 'member', '1', 'admin在2017-02-18 10:12登录了后台', '1', '1487383977');
INSERT INTO `onethink_action_log` VALUES ('79', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-18 15:46登录了后台', '1', '1487404005');
INSERT INTO `onethink_action_log` VALUES ('80', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-18 17:01登录了后台', '1', '1487408472');
INSERT INTO `onethink_action_log` VALUES ('81', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-20 09:33登录了后台', '1', '1487554439');
INSERT INTO `onethink_action_log` VALUES ('82', '6', '1', '2130706433', 'config', '20', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487569632');
INSERT INTO `onethink_action_log` VALUES ('83', '6', '1', '2130706433', 'config', '20', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487569764');
INSERT INTO `onethink_action_log` VALUES ('84', '6', '1', '2130706433', 'config', '41', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487569816');
INSERT INTO `onethink_action_log` VALUES ('85', '6', '1', '2130706433', 'config', '42', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487569883');
INSERT INTO `onethink_action_log` VALUES ('86', '6', '1', '2130706433', 'config', '43', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487569920');
INSERT INTO `onethink_action_log` VALUES ('87', '6', '1', '2130706433', 'config', '44', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570011');
INSERT INTO `onethink_action_log` VALUES ('88', '6', '1', '2130706433', 'config', '0', '操作url：/index.php?s=/Admin/Config/del/id/45.html', '1', '1487570037');
INSERT INTO `onethink_action_log` VALUES ('89', '6', '1', '2130706433', 'config', '41', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570108');
INSERT INTO `onethink_action_log` VALUES ('90', '6', '1', '2130706433', 'config', '42', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570132');
INSERT INTO `onethink_action_log` VALUES ('91', '6', '1', '2130706433', 'config', '43', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570146');
INSERT INTO `onethink_action_log` VALUES ('92', '6', '1', '2130706433', 'config', '44', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570168');
INSERT INTO `onethink_action_log` VALUES ('93', '6', '1', '2130706433', 'config', '41', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570197');
INSERT INTO `onethink_action_log` VALUES ('94', '6', '1', '2130706433', 'config', '42', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570204');
INSERT INTO `onethink_action_log` VALUES ('95', '6', '1', '2130706433', 'config', '43', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570210');
INSERT INTO `onethink_action_log` VALUES ('96', '6', '1', '2130706433', 'config', '44', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570217');
INSERT INTO `onethink_action_log` VALUES ('97', '6', '1', '2130706433', 'config', '46', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570275');
INSERT INTO `onethink_action_log` VALUES ('98', '6', '1', '2130706433', 'config', '47', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570315');
INSERT INTO `onethink_action_log` VALUES ('99', '6', '1', '2130706433', 'config', '47', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570328');
INSERT INTO `onethink_action_log` VALUES ('100', '6', '1', '2130706433', 'config', '53', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570353');
INSERT INTO `onethink_action_log` VALUES ('101', '6', '1', '2130706433', 'config', '52', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570367');
INSERT INTO `onethink_action_log` VALUES ('102', '6', '1', '2130706433', 'config', '54', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570374');
INSERT INTO `onethink_action_log` VALUES ('103', '6', '1', '2130706433', 'config', '41', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570420');
INSERT INTO `onethink_action_log` VALUES ('104', '6', '1', '2130706433', 'config', '42', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570438');
INSERT INTO `onethink_action_log` VALUES ('105', '6', '1', '2130706433', 'config', '43', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570448');
INSERT INTO `onethink_action_log` VALUES ('106', '6', '1', '2130706433', 'config', '44', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570460');
INSERT INTO `onethink_action_log` VALUES ('107', '6', '1', '2130706433', 'config', '46', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1487570503');
INSERT INTO `onethink_action_log` VALUES ('108', '11', '1', '2130706433', 'category', '1', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1487579540');
INSERT INTO `onethink_action_log` VALUES ('109', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-20 17:08登录了后台', '1', '1487581695');
INSERT INTO `onethink_action_log` VALUES ('110', '10', '1', '2130706433', 'Menu', '177', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1487582302');
INSERT INTO `onethink_action_log` VALUES ('111', '10', '1', '2130706433', 'Menu', '204', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487585032');
INSERT INTO `onethink_action_log` VALUES ('112', '10', '1', '2130706433', 'Menu', '204', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1487585047');
INSERT INTO `onethink_action_log` VALUES ('113', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-21 09:39登录了后台', '1', '1487641177');
INSERT INTO `onethink_action_log` VALUES ('114', '1', '1', '-1062731375', 'member', '1', 'admin在2017-02-21 09:43登录了后台', '1', '1487641429');
INSERT INTO `onethink_action_log` VALUES ('115', '10', '1', '2130706433', 'Menu', '205', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487641487');
INSERT INTO `onethink_action_log` VALUES ('116', '1', '1', '-1062731400', 'member', '1', 'admin在2017-02-21 09:46登录了后台', '1', '1487641613');
INSERT INTO `onethink_action_log` VALUES ('117', '10', '1', '2130706433', 'Menu', '206', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487641930');
INSERT INTO `onethink_action_log` VALUES ('118', '10', '1', '2130706433', 'Menu', '207', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487641983');
INSERT INTO `onethink_action_log` VALUES ('119', '10', '1', '2130706433', 'Menu', '178', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1487642120');
INSERT INTO `onethink_action_log` VALUES ('120', '10', '1', '2130706433', 'Menu', '203', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1487642129');
INSERT INTO `onethink_action_log` VALUES ('121', '10', '1', '2130706433', 'Menu', '207', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1487642137');
INSERT INTO `onethink_action_log` VALUES ('122', '10', '1', '2130706433', 'Menu', '208', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487642462');
INSERT INTO `onethink_action_log` VALUES ('123', '10', '1', '2130706433', 'Menu', '209', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487642494');
INSERT INTO `onethink_action_log` VALUES ('124', '10', '1', '2130706433', 'Menu', '209', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1487642542');
INSERT INTO `onethink_action_log` VALUES ('125', '10', '1', '2130706433', 'Menu', '210', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487642797');
INSERT INTO `onethink_action_log` VALUES ('126', '10', '1', '2130706433', 'Menu', '211', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487642983');
INSERT INTO `onethink_action_log` VALUES ('127', '10', '1', '2130706433', 'Menu', '212', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487643008');
INSERT INTO `onethink_action_log` VALUES ('128', '10', '1', '2130706433', 'Menu', '213', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487643094');
INSERT INTO `onethink_action_log` VALUES ('129', '10', '1', '2130706433', 'Menu', '214', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487643159');
INSERT INTO `onethink_action_log` VALUES ('130', '10', '1', '2130706433', 'Menu', '215', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487643243');
INSERT INTO `onethink_action_log` VALUES ('131', '10', '1', '2130706433', 'Menu', '216', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487645050');
INSERT INTO `onethink_action_log` VALUES ('132', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-21 10:48登录了后台', '1', '1487645313');
INSERT INTO `onethink_action_log` VALUES ('133', '1', '1', '-1062731377', 'member', '1', 'admin在2017-02-21 13:07登录了后台', '1', '1487653639');
INSERT INTO `onethink_action_log` VALUES ('134', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-21 17:16登录了后台', '1', '1487668619');
INSERT INTO `onethink_action_log` VALUES ('135', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-22 10:03登录了后台', '1', '1487729023');
INSERT INTO `onethink_action_log` VALUES ('136', '1', '1', '2130706433', 'member', '1', 'admin在2017-02-22 10:18登录了后台', '1', '1487729913');
INSERT INTO `onethink_action_log` VALUES ('137', '10', '1', '2130706433', 'Menu', '217', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1487729938');
INSERT INTO `onethink_action_log` VALUES ('138', '10', '1', '2130706433', 'Menu', '217', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1487730061');
INSERT INTO `onethink_action_log` VALUES ('139', '1', '1', '-1062731375', 'member', '1', 'admin在2017-02-22 15:16登录了后台', '1', '1487747797');
INSERT INTO `onethink_action_log` VALUES ('140', '1', '1', '-1062731400', 'member', '1', 'admin在2017-02-22 16:54登录了后台', '1', '1487753699');
INSERT INTO `onethink_action_log` VALUES ('141', '1', '1', '-1062731375', 'member', '1', 'admin在2017-02-24 09:50登录了后台', '1', '1487901044');
INSERT INTO `onethink_action_log` VALUES ('142', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-01 09:30登录了后台', '1', '1488331810');
INSERT INTO `onethink_action_log` VALUES ('143', '6', '1', '2130706433', 'config', '51', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346675');
INSERT INTO `onethink_action_log` VALUES ('144', '6', '1', '2130706433', 'config', '56', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346685');
INSERT INTO `onethink_action_log` VALUES ('145', '6', '1', '2130706433', 'config', '57', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346692');
INSERT INTO `onethink_action_log` VALUES ('146', '6', '1', '2130706433', 'config', '64', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346700');
INSERT INTO `onethink_action_log` VALUES ('147', '6', '1', '2130706433', 'config', '67', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346708');
INSERT INTO `onethink_action_log` VALUES ('148', '6', '1', '2130706433', 'config', '66', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346716');
INSERT INTO `onethink_action_log` VALUES ('149', '6', '1', '2130706433', 'config', '68', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346724');
INSERT INTO `onethink_action_log` VALUES ('150', '6', '1', '2130706433', 'config', '69', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346733');
INSERT INTO `onethink_action_log` VALUES ('151', '6', '1', '2130706433', 'config', '70', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346741');
INSERT INTO `onethink_action_log` VALUES ('152', '6', '1', '2130706433', 'config', '71', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346748');
INSERT INTO `onethink_action_log` VALUES ('153', '6', '1', '2130706433', 'config', '72', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346757');
INSERT INTO `onethink_action_log` VALUES ('154', '6', '1', '2130706433', 'config', '73', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346766');
INSERT INTO `onethink_action_log` VALUES ('155', '6', '1', '2130706433', 'config', '74', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488346774');
INSERT INTO `onethink_action_log` VALUES ('156', '6', '1', '2130706433', 'config', '56', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347059');
INSERT INTO `onethink_action_log` VALUES ('157', '6', '1', '2130706433', 'config', '57', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347070');
INSERT INTO `onethink_action_log` VALUES ('158', '6', '1', '2130706433', 'config', '64', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347080');
INSERT INTO `onethink_action_log` VALUES ('159', '6', '1', '2130706433', 'config', '46', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347194');
INSERT INTO `onethink_action_log` VALUES ('160', '6', '1', '2130706433', 'config', '47', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347228');
INSERT INTO `onethink_action_log` VALUES ('161', '6', '1', '2130706433', 'config', '53', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347269');
INSERT INTO `onethink_action_log` VALUES ('162', '6', '1', '2130706433', 'config', '47', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347286');
INSERT INTO `onethink_action_log` VALUES ('163', '6', '1', '2130706433', 'config', '82', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347392');
INSERT INTO `onethink_action_log` VALUES ('164', '6', '1', '2130706433', 'config', '82', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488347955');
INSERT INTO `onethink_action_log` VALUES ('165', '1', '1', '3232235921', 'member', '1', 'admin在2017-03-04 11:44登录了后台', '1', '1488599076');
INSERT INTO `onethink_action_log` VALUES ('166', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-04 13:11登录了后台', '1', '1488604294');
INSERT INTO `onethink_action_log` VALUES ('167', '10', '1', '2130706433', 'Menu', '214', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488611882');
INSERT INTO `onethink_action_log` VALUES ('168', '10', '1', '2130706433', 'Menu', '213', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488611893');
INSERT INTO `onethink_action_log` VALUES ('169', '10', '1', '2130706433', 'Menu', '187', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488612316');
INSERT INTO `onethink_action_log` VALUES ('170', '10', '1', '2130706433', 'Menu', '167', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488612363');
INSERT INTO `onethink_action_log` VALUES ('171', '10', '1', '2130706433', 'Menu', '218', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488614174');
INSERT INTO `onethink_action_log` VALUES ('172', '10', '1', '2130706433', 'Menu', '139', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488614264');
INSERT INTO `onethink_action_log` VALUES ('173', '10', '1', '2130706433', 'Menu', '140', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488614273');
INSERT INTO `onethink_action_log` VALUES ('174', '10', '1', '2130706433', 'Menu', '142', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488614282');
INSERT INTO `onethink_action_log` VALUES ('175', '10', '1', '2130706433', 'Menu', '142', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488614416');
INSERT INTO `onethink_action_log` VALUES ('176', '10', '1', '2130706433', 'Menu', '139', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488614426');
INSERT INTO `onethink_action_log` VALUES ('177', '10', '1', '2130706433', 'Menu', '140', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488614438');
INSERT INTO `onethink_action_log` VALUES ('178', '10', '1', '2130706433', 'Menu', '219', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488614593');
INSERT INTO `onethink_action_log` VALUES ('179', '10', '1', '2130706433', 'Menu', '220', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488614731');
INSERT INTO `onethink_action_log` VALUES ('180', '10', '1', '2130706433', 'Menu', '221', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488614771');
INSERT INTO `onethink_action_log` VALUES ('181', '10', '1', '2130706433', 'Menu', '222', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488614837');
INSERT INTO `onethink_action_log` VALUES ('182', '10', '1', '2130706433', 'Menu', '223', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488614917');
INSERT INTO `onethink_action_log` VALUES ('183', '10', '1', '2130706433', 'Menu', '224', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488614968');
INSERT INTO `onethink_action_log` VALUES ('184', '10', '1', '2130706433', 'Menu', '225', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488615082');
INSERT INTO `onethink_action_log` VALUES ('185', '10', '1', '2130706433', 'Menu', '226', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488615227');
INSERT INTO `onethink_action_log` VALUES ('186', '10', '1', '2130706433', 'Menu', '169', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488616790');
INSERT INTO `onethink_action_log` VALUES ('187', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488616828');
INSERT INTO `onethink_action_log` VALUES ('188', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488616886');
INSERT INTO `onethink_action_log` VALUES ('189', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-06 10:11登录了后台', '1', '1488766297');
INSERT INTO `onethink_action_log` VALUES ('190', '10', '1', '2130706433', 'Menu', '227', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488766856');
INSERT INTO `onethink_action_log` VALUES ('191', '10', '1', '2130706433', 'Menu', '228', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488766925');
INSERT INTO `onethink_action_log` VALUES ('192', '10', '1', '2130706433', 'Menu', '229', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488766948');
INSERT INTO `onethink_action_log` VALUES ('193', '10', '1', '2130706433', 'Menu', '230', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488766976');
INSERT INTO `onethink_action_log` VALUES ('194', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/196.html', '1', '1488766999');
INSERT INTO `onethink_action_log` VALUES ('195', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-07 10:06登录了后台', '1', '1488852372');
INSERT INTO `onethink_action_log` VALUES ('196', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-07 10:27登录了后台', '1', '1488853653');
INSERT INTO `onethink_action_log` VALUES ('197', '10', '1', '2130706433', 'Menu', '231', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488854076');
INSERT INTO `onethink_action_log` VALUES ('198', '10', '1', '2130706433', 'Menu', '232', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488854169');
INSERT INTO `onethink_action_log` VALUES ('199', '10', '1', '2130706433', 'Menu', '233', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488854244');
INSERT INTO `onethink_action_log` VALUES ('200', '10', '1', '2130706433', 'Menu', '233', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854255');
INSERT INTO `onethink_action_log` VALUES ('201', '10', '1', '2130706433', 'Menu', '232', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854270');
INSERT INTO `onethink_action_log` VALUES ('202', '10', '1', '2130706433', 'Menu', '138', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854305');
INSERT INTO `onethink_action_log` VALUES ('203', '10', '1', '2130706433', 'Menu', '153', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854311');
INSERT INTO `onethink_action_log` VALUES ('204', '10', '1', '2130706433', 'Menu', '201', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854337');
INSERT INTO `onethink_action_log` VALUES ('205', '10', '1', '2130706433', 'Menu', '186', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854350');
INSERT INTO `onethink_action_log` VALUES ('206', '10', '1', '2130706433', 'Menu', '131', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854369');
INSERT INTO `onethink_action_log` VALUES ('207', '10', '1', '2130706433', 'Menu', '158', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854387');
INSERT INTO `onethink_action_log` VALUES ('208', '10', '1', '2130706433', 'Menu', '217', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854402');
INSERT INTO `onethink_action_log` VALUES ('209', '10', '1', '2130706433', 'Menu', '234', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488854468');
INSERT INTO `onethink_action_log` VALUES ('210', '10', '1', '2130706433', 'Menu', '235', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488854495');
INSERT INTO `onethink_action_log` VALUES ('211', '10', '1', '2130706433', 'Menu', '219', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488854548');
INSERT INTO `onethink_action_log` VALUES ('212', '10', '1', '2130706433', 'Menu', '236', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488854613');
INSERT INTO `onethink_action_log` VALUES ('213', '10', '1', '2130706433', 'Menu', '237', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488855564');
INSERT INTO `onethink_action_log` VALUES ('214', '10', '1', '2130706433', 'Menu', '225', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488855722');
INSERT INTO `onethink_action_log` VALUES ('215', '10', '1', '2130706433', 'Menu', '238', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488855955');
INSERT INTO `onethink_action_log` VALUES ('216', '10', '1', '2130706433', 'Menu', '239', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488856003');
INSERT INTO `onethink_action_log` VALUES ('217', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/146.html', '1', '1488856999');
INSERT INTO `onethink_action_log` VALUES ('218', '10', '1', '2130706433', 'Menu', '240', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488857118');
INSERT INTO `onethink_action_log` VALUES ('219', '10', '1', '2130706433', 'Menu', '241', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488857336');
INSERT INTO `onethink_action_log` VALUES ('220', '10', '1', '2130706433', 'Menu', '242', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488857366');
INSERT INTO `onethink_action_log` VALUES ('221', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-07 14:26登录了后台', '1', '1488868019');
INSERT INTO `onethink_action_log` VALUES ('222', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-07 14:27登录了后台', '1', '1488868046');
INSERT INTO `onethink_action_log` VALUES ('223', '11', '1', '-1062731402', 'category', '12', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1488877130');
INSERT INTO `onethink_action_log` VALUES ('224', '11', '1', '-1062731402', 'category', '13', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1488877152');
INSERT INTO `onethink_action_log` VALUES ('225', '11', '1', '-1062731402', 'category', '14', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1488877237');
INSERT INTO `onethink_action_log` VALUES ('226', '11', '1', '-1062731402', 'category', '14', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1488877252');
INSERT INTO `onethink_action_log` VALUES ('227', '11', '1', '-1062731402', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1488877268');
INSERT INTO `onethink_action_log` VALUES ('228', '11', '1', '-1062731402', 'category', '13', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1488877288');
INSERT INTO `onethink_action_log` VALUES ('229', '11', '1', '-1062731402', 'category', '13', '操作url：/index.php?s=/Admin/Category/remove/id/13.html', '1', '1488877312');
INSERT INTO `onethink_action_log` VALUES ('230', '11', '1', '-1062731402', 'category', '12', '操作url：/index.php?s=/Admin/Category/remove/id/12.html', '1', '1488877326');
INSERT INTO `onethink_action_log` VALUES ('231', '11', '1', '-1062731402', 'category', '15', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1488877348');
INSERT INTO `onethink_action_log` VALUES ('232', '1', '1', '3232235921', 'member', '1', 'admin在2017-03-07 18:09登录了后台', '1', '1488881365');
INSERT INTO `onethink_action_log` VALUES ('233', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-07 18:12登录了后台', '1', '1488881528');
INSERT INTO `onethink_action_log` VALUES ('234', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-08 09:58登录了后台', '1', '1488938336');
INSERT INTO `onethink_action_log` VALUES ('235', '11', '1', '-1062731402', 'category', '16', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1488940776');
INSERT INTO `onethink_action_log` VALUES ('236', '11', '1', '-1062731402', 'category', '17', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1488940835');
INSERT INTO `onethink_action_log` VALUES ('237', '11', '1', '-1062731402', 'category', '18', '操作url：/index.php?s=/Admin/Category/add.html', '1', '1488940862');
INSERT INTO `onethink_action_log` VALUES ('238', '10', '1', '-1062731402', 'Menu', '192', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488940893');
INSERT INTO `onethink_action_log` VALUES ('239', '10', '1', '-1062731402', 'Menu', '243', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1488940925');
INSERT INTO `onethink_action_log` VALUES ('240', '10', '1', '-1062731402', 'Menu', '243', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488940943');
INSERT INTO `onethink_action_log` VALUES ('241', '10', '1', '-1062731402', 'Menu', '243', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488940958');
INSERT INTO `onethink_action_log` VALUES ('242', '10', '1', '-1062731402', 'Menu', '192', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488942160');
INSERT INTO `onethink_action_log` VALUES ('243', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-08 13:03登录了后台', '1', '1488949407');
INSERT INTO `onethink_action_log` VALUES ('244', '1', '1', '-1062731417', 'member', '1', 'admin在2017-03-08 13:29登录了后台', '1', '1488950958');
INSERT INTO `onethink_action_log` VALUES ('245', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/192.html', '1', '1488954252');
INSERT INTO `onethink_action_log` VALUES ('246', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/243.html', '1', '1488954265');
INSERT INTO `onethink_action_log` VALUES ('247', '10', '1', '2130706433', 'Menu', '68', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488954477');
INSERT INTO `onethink_action_log` VALUES ('248', '10', '1', '2130706433', 'Menu', '2', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488954485');
INSERT INTO `onethink_action_log` VALUES ('249', '10', '1', '2130706433', 'Menu', '174', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488954493');
INSERT INTO `onethink_action_log` VALUES ('250', '10', '1', '2130706433', 'Menu', '93', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488954528');
INSERT INTO `onethink_action_log` VALUES ('251', '10', '1', '2130706433', 'Menu', '161', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488954972');
INSERT INTO `onethink_action_log` VALUES ('252', '10', '1', '2130706433', 'Menu', '161', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488954980');
INSERT INTO `onethink_action_log` VALUES ('253', '10', '1', '2130706433', 'Menu', '175', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955005');
INSERT INTO `onethink_action_log` VALUES ('254', '10', '1', '2130706433', 'Menu', '175', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955021');
INSERT INTO `onethink_action_log` VALUES ('255', '10', '1', '2130706433', 'Menu', '227', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955040');
INSERT INTO `onethink_action_log` VALUES ('256', '10', '1', '2130706433', 'Menu', '175', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955075');
INSERT INTO `onethink_action_log` VALUES ('257', '10', '1', '2130706433', 'Menu', '176', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955107');
INSERT INTO `onethink_action_log` VALUES ('258', '10', '1', '2130706433', 'Menu', '227', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955117');
INSERT INTO `onethink_action_log` VALUES ('259', '10', '1', '2130706433', 'Menu', '16', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955306');
INSERT INTO `onethink_action_log` VALUES ('260', '10', '1', '2130706433', 'Menu', '169', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488955313');
INSERT INTO `onethink_action_log` VALUES ('261', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-08 16:02登录了后台', '1', '1488960174');
INSERT INTO `onethink_action_log` VALUES ('262', '6', '1', '2130706433', 'config', '1', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961616');
INSERT INTO `onethink_action_log` VALUES ('263', '6', '1', '2130706433', 'config', '40', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961677');
INSERT INTO `onethink_action_log` VALUES ('264', '6', '1', '2130706433', 'config', '50', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961729');
INSERT INTO `onethink_action_log` VALUES ('265', '6', '1', '2130706433', 'config', '55', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961753');
INSERT INTO `onethink_action_log` VALUES ('266', '6', '1', '2130706433', 'config', '4', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961772');
INSERT INTO `onethink_action_log` VALUES ('267', '6', '1', '2130706433', 'config', '75', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961780');
INSERT INTO `onethink_action_log` VALUES ('268', '6', '1', '2130706433', 'config', '3', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961794');
INSERT INTO `onethink_action_log` VALUES ('269', '6', '1', '2130706433', 'config', '50', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961808');
INSERT INTO `onethink_action_log` VALUES ('270', '6', '1', '2130706433', 'config', '2', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961827');
INSERT INTO `onethink_action_log` VALUES ('271', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961839');
INSERT INTO `onethink_action_log` VALUES ('272', '6', '1', '2130706433', 'config', '10', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1488961882');
INSERT INTO `onethink_action_log` VALUES ('273', '10', '1', '2130706433', 'Menu', '58', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488962568');
INSERT INTO `onethink_action_log` VALUES ('274', '10', '1', '2130706433', 'Menu', '174', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488967916');
INSERT INTO `onethink_action_log` VALUES ('275', '10', '1', '2130706433', 'Menu', '161', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488968959');
INSERT INTO `onethink_action_log` VALUES ('276', '10', '1', '2130706433', 'Menu', '138', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488968974');
INSERT INTO `onethink_action_log` VALUES ('277', '10', '1', '2130706433', 'Menu', '175', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488969004');
INSERT INTO `onethink_action_log` VALUES ('278', '10', '1', '2130706433', 'Menu', '176', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488969027');
INSERT INTO `onethink_action_log` VALUES ('279', '10', '1', '2130706433', 'Menu', '217', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488969116');
INSERT INTO `onethink_action_log` VALUES ('280', '10', '1', '2130706433', 'Menu', '217', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488969150');
INSERT INTO `onethink_action_log` VALUES ('281', '10', '1', '2130706433', 'Menu', '175', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1488969158');
INSERT INTO `onethink_action_log` VALUES ('282', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-09 09:25登录了后台', '1', '1489022742');
INSERT INTO `onethink_action_log` VALUES ('283', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/205.html', '1', '1489029091');
INSERT INTO `onethink_action_log` VALUES ('284', '10', '1', '2130706433', 'Menu', '0', '操作url：/index.php?s=/Admin/Menu/del/id/190.html', '1', '1489029097');
INSERT INTO `onethink_action_log` VALUES ('285', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-09 11:30登录了后台', '1', '1489030249');
INSERT INTO `onethink_action_log` VALUES ('286', '10', '1', '2130706433', 'Menu', '244', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1489030841');
INSERT INTO `onethink_action_log` VALUES ('287', '10', '1', '2130706433', 'Menu', '201', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489030854');
INSERT INTO `onethink_action_log` VALUES ('288', '10', '1', '2130706433', 'Menu', '245', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1489052591');
INSERT INTO `onethink_action_log` VALUES ('289', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-09 18:11登录了后台', '1', '1489054268');
INSERT INTO `onethink_action_log` VALUES ('290', '10', '1', '2130706433', 'Menu', '246', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1489057108');
INSERT INTO `onethink_action_log` VALUES ('291', '10', '1', '2130706433', 'Menu', '153', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489057742');
INSERT INTO `onethink_action_log` VALUES ('292', '10', '1', '2130706433', 'Menu', '153', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489057830');
INSERT INTO `onethink_action_log` VALUES ('293', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-10 09:31登录了后台', '1', '1489109490');
INSERT INTO `onethink_action_log` VALUES ('294', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-10 09:31登录了后台', '1', '1489109513');
INSERT INTO `onethink_action_log` VALUES ('295', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-10 09:39登录了后台', '1', '1489109962');
INSERT INTO `onethink_action_log` VALUES ('296', '1', '1', '3232235921', 'member', '1', 'admin在2017-03-10 11:17登录了后台', '1', '1489115877');
INSERT INTO `onethink_action_log` VALUES ('297', '10', '1', '2130706433', 'Menu', '126', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489118143');
INSERT INTO `onethink_action_log` VALUES ('298', '10', '1', '2130706433', 'Menu', '129', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489118214');
INSERT INTO `onethink_action_log` VALUES ('299', '10', '1', '2130706433', 'Menu', '130', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489118219');
INSERT INTO `onethink_action_log` VALUES ('300', '10', '1', '2130706433', 'Menu', '129', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489118223');
INSERT INTO `onethink_action_log` VALUES ('301', '10', '1', '2130706433', 'Menu', '130', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1489118228');
INSERT INTO `onethink_action_log` VALUES ('302', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-10 16:24登录了后台', '1', '1489134263');
INSERT INTO `onethink_action_log` VALUES ('303', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-13 09:17登录了后台', '1', '1489367851');
INSERT INTO `onethink_action_log` VALUES ('304', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-13 09:47登录了后台', '1', '1489369649');
INSERT INTO `onethink_action_log` VALUES ('305', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-13 13:55登录了后台', '1', '1489384503');
INSERT INTO `onethink_action_log` VALUES ('306', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-13 16:18登录了后台', '1', '1489393109');
INSERT INTO `onethink_action_log` VALUES ('307', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-13 17:36登录了后台', '1', '1489397782');
INSERT INTO `onethink_action_log` VALUES ('308', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-13 18:46登录了后台', '1', '1489401992');
INSERT INTO `onethink_action_log` VALUES ('309', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-14 09:30登录了后台', '1', '1489455007');
INSERT INTO `onethink_action_log` VALUES ('310', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-14 09:37登录了后台', '1', '1489455431');
INSERT INTO `onethink_action_log` VALUES ('311', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-14 10:19登录了后台', '1', '1489457943');
INSERT INTO `onethink_action_log` VALUES ('312', '6', '1', '2130706433', 'config', '76', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1489470580');
INSERT INTO `onethink_action_log` VALUES ('313', '6', '1', '2130706433', 'config', '77', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1489470591');
INSERT INTO `onethink_action_log` VALUES ('314', '6', '1', '2130706433', 'config', '78', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1489470598');
INSERT INTO `onethink_action_log` VALUES ('315', '6', '1', '2130706433', 'config', '79', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1489470605');
INSERT INTO `onethink_action_log` VALUES ('316', '1', '1', '3232235921', 'member', '1', 'admin在2017-03-14 18:12登录了后台', '1', '1489486320');
INSERT INTO `onethink_action_log` VALUES ('317', '1', '1', '-1062731402', 'member', '1', 'admin在2017-03-15 09:15登录了后台', '1', '1489540506');
INSERT INTO `onethink_action_log` VALUES ('318', '1', '1', '3232235896', 'member', '1', 'admin在2017-03-15 13:40登录了后台', '1', '1489556458');
INSERT INTO `onethink_action_log` VALUES ('319', '1', '1', '2130706433', 'member', '1', 'admin在2017-03-29 14:41登录了后台', '1', '1490769712');
INSERT INTO `onethink_action_log` VALUES ('320', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-11 09:38登录了后台', '1', '1491874688');
INSERT INTO `onethink_action_log` VALUES ('321', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-17 11:28登录了后台', '1', '1492399681');
INSERT INTO `onethink_action_log` VALUES ('322', '1', '1', '2130706433', 'member', '1', 'admin在2017-04-17 13:13登录了后台', '1', '1492406010');
INSERT INTO `onethink_action_log` VALUES ('323', '1', '1', '2130706433', 'member', '1', 'admin在2017-05-02 09:53登录了后台', '1', '1493690029');

-- ----------------------------
-- Table structure for onethink_addons
-- ----------------------------
DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of onethink_addons
-- ----------------------------
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `onethink_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `onethink_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '0', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `onethink_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `onethink_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `onethink_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `onethink_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for onethink_areas
-- ----------------------------
DROP TABLE IF EXISTS `onethink_areas`;
CREATE TABLE `onethink_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0' COMMENT '父级id',
  `title` varchar(128) NOT NULL COMMENT '地区名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_areas
-- ----------------------------
INSERT INTO `onethink_areas` VALUES ('1', '0', '天津市');
INSERT INTO `onethink_areas` VALUES ('2', '1', '天津市');
INSERT INTO `onethink_areas` VALUES ('3', '2', '南开区');
INSERT INTO `onethink_areas` VALUES ('4', '2', '和平区');
INSERT INTO `onethink_areas` VALUES ('5', '2', '红桥区');
INSERT INTO `onethink_areas` VALUES ('6', '2', '河东区');
INSERT INTO `onethink_areas` VALUES ('7', '2', '河西区');
INSERT INTO `onethink_areas` VALUES ('8', '2', '河北区');
INSERT INTO `onethink_areas` VALUES ('9', '2', '北辰区');
INSERT INTO `onethink_areas` VALUES ('10', '2', '西青区');
INSERT INTO `onethink_areas` VALUES ('11', '2', '津南区');
INSERT INTO `onethink_areas` VALUES ('12', '2', '东丽区');
INSERT INTO `onethink_areas` VALUES ('13', '2', '滨海新区');
INSERT INTO `onethink_areas` VALUES ('14', '2', '武清区');
INSERT INTO `onethink_areas` VALUES ('15', '2', '宝坻区');
INSERT INTO `onethink_areas` VALUES ('16', '2', '宁河区');
INSERT INTO `onethink_areas` VALUES ('17', '2', '静海区');
INSERT INTO `onethink_areas` VALUES ('18', '2', '蓟州区');

-- ----------------------------
-- Table structure for onethink_attachment
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of onethink_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_attribute
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of onethink_attribute
-- ----------------------------
INSERT INTO `onethink_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('93', 'kaishi', '开始时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '4', '0', '1', '1478229542', '1478229542', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('91', 'snum', '成团人数', 'int(10) UNSIGNED NOT NULL', 'num', '10', '', '1', '', '4', '0', '1', '1478227178', '1478227178', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('90', 'smoney', '拼团价格', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', '1', '', '4', '0', '1', '1478227148', '1478227148', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for onethink_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of onethink_auth_extend
-- ----------------------------
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '5', '1');
INSERT INTO `onethink_auth_extend` VALUES ('3', '1', '1');
INSERT INTO `onethink_auth_extend` VALUES ('3', '2', '1');

-- ----------------------------
-- Table structure for onethink_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group
-- ----------------------------
INSERT INTO `onethink_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,5,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,56,57,58,59,60,65,66,71,72,73,74,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,107,108,109,110,205,206,207,208,213,215,216,217,222,223,224,225,226,227,234,235,236,239,240,242,244,246,247,248,249,250,251,252,253,255,256,257,258,260,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281');
INSERT INTO `onethink_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,100,102,103,211,236,244,245');
INSERT INTO `onethink_auth_group` VALUES ('3', 'admin', '1', '客服', '客服派单', '1', '1,19,20,21,22,23,24,25,27,236,244,260,266');
INSERT INTO `onethink_auth_group` VALUES ('4', 'admin', '1', '仓库', '仓库出库', '1', '217,218,228,229,230,231,232,233,234,235,238,239');
INSERT INTO `onethink_auth_group` VALUES ('5', 'admin', '1', '会计', '', '1', '');
INSERT INTO `onethink_auth_group` VALUES ('6', 'admin', '1', 'fgfff', 'fgf', '-1', '');
INSERT INTO `onethink_auth_group` VALUES ('7', 'admin', '1', '核销员', '负责门店收发货扫码等', '1', '236,244,247,248,250,259,260,262,267');

-- ----------------------------
-- Table structure for onethink_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group_access
-- ----------------------------
INSERT INTO `onethink_auth_group_access` VALUES ('3', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('4', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('5', '1');
INSERT INTO `onethink_auth_group_access` VALUES ('6', '3');

-- ----------------------------
-- Table structure for onethink_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=323 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_rule
-- ----------------------------
INSERT INTO `onethink_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('5', 'admin', '2', 'Admin/config/group', '系统管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '管理员信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('65', 'admin', '1', 'Admin/config/group', '网站配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '新增配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '系统', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('217', 'admin', '1', 'Admin/WebSite/index', '基本', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('218', 'admin', '1', 'Admin/Area/index', '区县管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('219', 'admin', '1', 'Admin/Brand/index', '品牌管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Brand/add', '品牌新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Brand/edit', '品牌编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('222', 'admin', '1', 'Admin/Focus/index', 'Banner列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('223', 'admin', '1', 'Admin/FocusPos/index', 'Banner位置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Focus/add', '添加', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Focus/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('226', 'admin', '1', 'Admin/FocusPos/add', '增加', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('227', 'admin', '1', 'Admin/FocusPos/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Area/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Area/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('230', 'admin', '1', 'Admin/Depot/index', '仓库管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Depot/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('232', 'admin', '1', 'Admin/Depot/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('233', 'admin', '1', 'Admin/Card/index', '会员卡', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Card/add', '增加', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('235', 'admin', '1', 'Admin/Card/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Order/index', '订单列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('237', 'admin', '2', 'Admin//Admin/Product/index/cate_id/2.html', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('238', 'admin', '2', 'Admin/WebSite/index', '网站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Card/detail', '会员卡明细', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Member/index', '会员管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Member/add', '新增会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('242', 'admin', '1', 'Admin/Member/edit', '编辑会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('243', 'admin', '2', 'Admin/Brand/index', '系统', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('244', 'admin', '1', 'Admin/Order/views', '订单详情', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('245', 'admin', '2', 'Admin//Admin/Order', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('246', 'admin', '1', 'Admin/Coupon/index', '优惠券列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('247', 'admin', '1', 'Admin/Product/index', '商品列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('248', 'admin', '1', 'Admin/BrokerageWithdrawRecord/index', '提现记录', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('249', 'admin', '1', 'Admin/News/index', '文章列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('250', 'admin', '1', 'Admin/RebateRecord/index', '返利明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('251', 'admin', '1', 'Admin/BrokerageRecord/index', '返佣明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('252', 'admin', '1', 'Admin/Coupon/detaillist', '优惠券明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('253', 'admin', '1', 'Admin/Evaluate/index', '商品评论', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('254', 'admin', '1', 'Admin/Evaluate/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('255', 'admin', '1', 'Admin/Spell/index', '拼团列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('256', 'admin', '1', 'Admin/Spell/reg', '拼团申请', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('257', 'admin', '1', 'Admin/Spell/add', '新增拼团', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('258', 'admin', '1', 'Admin/Spell/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('259', 'admin', '2', 'Admin//Admin/Product/index/cate_id/85', '商品', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('260', 'admin', '2', 'Admin/Order/index', '信息管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('261', 'admin', '2', 'Admin/RebateRecord/index', '资金', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('262', 'admin', '1', 'Admin/Recharge/index', '充值记录', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('263', 'admin', '1', 'Admin/rsales', '退货申请', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('264', 'admin', '1', 'Admin/csales', '换货申请', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('265', 'admin', '2', 'Admin/News/index', '信息', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('266', 'admin', '2', 'Admin/Member/index', '用户管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('267', 'admin', '2', 'Admin/Recharge/index', '资金', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('268', 'admin', '2', 'Admin/Coupon/index', '活动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('269', 'admin', '1', 'Admin/Member/grade', '会员等级', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('270', 'admin', '1', 'Admin/Member/store', '自提点列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('271', 'admin', '1', 'Admin/Spell/order', '拼团订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('272', 'admin', '1', 'Admin/Spell/refund', '拼团退款', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('273', 'admin', '1', 'Admin/CashCoupon/index', '代金券列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('274', 'admin', '2', 'Admin//Admin/Product/index/cate_id/1', '商品管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('276', 'admin', '1', 'Admin/Member/hexiao', '核销员管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('275', 'admin', '1', 'Admin/CashCoupon/detail', '明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('277', 'admin', '1', 'Admin/Hotel/index', '酒店列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('278', 'admin', '1', 'Admin/Newsflash/index', '快报列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('279', 'admin', '1', 'Admin/Brokerage/index', '佣金比例设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('280', 'admin', '1', 'Admin/Brokerage/integrate', '积分比例设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('281', 'admin', '2', 'Admin/Hotel/index', '联盟酒店', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('282', 'admin', '1', 'Admin/Coupon/add', '增加', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('283', 'admin', '1', 'Admin/Coupon/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('284', 'admin', '1', 'Admin/Coupon/detail', '明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('285', 'admin', '1', 'Admin/Member/addgrade', '新增会员等级', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('286', 'admin', '1', 'Admin/Member/delgrade', '删除等级', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('287', 'admin', '1', 'Admin/Spell/views', '订单详情', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('288', 'admin', '2', 'Admin/呃呃呃', '侧嗯嗯', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('289', 'admin', '1', 'Admin/Coupon/info', '查看信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('290', 'admin', '1', 'Admin/Coupon/adddetail', '新增明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('291', 'admin', '1', 'Admin/Kefu/index', '客服设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('292', 'admin', '1', 'Admin/Member/brokerageList', '分佣记录', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('293', 'admin', '1', 'Admin/Member/addstore', '新增自提点', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('294', 'admin', '1', 'Admin/Member/addhexiao', '新增核销员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('295', 'admin', '1', 'Admin/Member/del', '删除单个会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('296', 'admin', '1', 'Admin/Member/setStatus', '批量删除、启用/禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('297', 'admin', '1', 'Admin/News/add', '新增文档', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('298', 'admin', '1', 'Admin/News/edit', '编辑文档', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('299', 'admin', '1', 'Admin/News/del', '删除文档', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('300', 'admin', '1', 'Admin/Evaluate/audit', '删除评论', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('301', 'admin', '1', 'Admin/Evaluate/setStatus', '批量审核、删除评论', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('302', 'admin', '1', 'Admin/Order/del', '删除订单', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('303', 'admin', '1', 'Admin/BrokerageWithdrawRecord/info', '提现详情', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('304', 'admin', '1', 'Admin/Spell/teams', '团长列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('305', 'admin', '1', 'Admin/Spell/detail', '参团人员列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('306', 'admin', '1', 'Admin/Spell/info', '拼团信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('307', 'admin', '1', 'Admin/CashCoupon/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('308', 'admin', '1', 'Admin/CashCoupon/exportList', '导出代金券列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('309', 'admin', '1', 'Admin/Newsflash/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('310', 'admin', '1', 'Admin/Newsflash/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('311', 'admin', '1', 'Admin/Newsflash/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('312', 'admin', '1', 'Admin/Coupon/deldetail', '删除明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('313', 'admin', '1', 'Admin/Coupon/create', '生成明细', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('314', 'admin', '1', 'Admin/Coupon/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('315', 'admin', '1', 'Admin/Spell/updateStatus', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('316', 'admin', '1', 'Admin/Spell/tuikuan', '退款', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('317', 'admin', '1', 'Admin/CashCoupon/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('318', 'admin', '1', 'Admin/CashCoupon/addCoupon', '增加操作', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('319', 'admin', '2', 'Admin/BrokerageRecord/index', '资金管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('320', 'admin', '1', 'Admin/Member/address', '收货地址', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('321', 'admin', '1', 'Admin/Member/spread', '推广人列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('322', 'admin', '2', 'Admin/Spell/index', '拼团活动', '1', '');

-- ----------------------------
-- Table structure for onethink_bank
-- ----------------------------
DROP TABLE IF EXISTS `onethink_bank`;
CREATE TABLE `onethink_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `card_num` varchar(128) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(128) NOT NULL,
  `status` int(2) DEFAULT '1' COMMENT '状态，1正常，0删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_bank
-- ----------------------------
INSERT INTO `onethink_bank` VALUES ('3', '13', '袁绍月', '6228480020765984917', '1', '13821264212', '1');
INSERT INTO `onethink_bank` VALUES ('4', '13', 'eeeeeee', '222222222222222222222', '5', '44444444444444444444', '1');
INSERT INTO `onethink_bank` VALUES ('5', '16', '何小姐', '1346852369852154852', '4', '13702095930', '1');
INSERT INTO `onethink_bank` VALUES ('6', '16', '何小姐', '1', '1', '13702095930', '1');
INSERT INTO `onethink_bank` VALUES ('7', '17', '刘一一', '6214850222417633', '1', '18920146026', '1');
INSERT INTO `onethink_bank` VALUES ('8', '20', '刘云鹏', '622848006', '7', '15620954527', '1');
INSERT INTO `onethink_bank` VALUES ('9', '20', '刘一一', '640381199105150318', '1', '15620954527', '1');
INSERT INTO `onethink_bank` VALUES ('10', '21', '4543', '345345345', '2', '15512345699', '1');
INSERT INTO `onethink_bank` VALUES ('12', '20', 'ceshi', '56256269895232020', '1', '15545633333', '1');
INSERT INTO `onethink_bank` VALUES ('13', '20', '码空间', '565966956', '3', '13322245678', '1');
INSERT INTO `onethink_bank` VALUES ('17', '36', 'he', '13165465113151132', '1', '13702095930', '1');
INSERT INTO `onethink_bank` VALUES ('16', '32', 'lin', '62006231456785412345', '1', '18612345678', '1');
INSERT INTO `onethink_bank` VALUES ('18', '36', 'he2', '45456464853454321123', '4', '13702095930', '1');
INSERT INTO `onethink_bank` VALUES ('19', '36', '1', '13154564313134354', '3', '13702095930', '1');
INSERT INTO `onethink_bank` VALUES ('20', '36', '11', '1315456431313433333', '6', '13702095930', '1');
INSERT INTO `onethink_bank` VALUES ('32', '37', 'Tongtong', '34123235135135134513', '3', '12322423423423', '1');
INSERT INTO `onethink_bank` VALUES ('41', '29', '测试', '123456789', '4', '15202265146', '1');
INSERT INTO `onethink_bank` VALUES ('33', '37', 'SHIT', '4123413453464885867', '2', '34524623431346243', '1');
INSERT INTO `onethink_bank` VALUES ('34', '29', '5444444', '54765765764547567', '6', '15202265145', '1');
INSERT INTO `onethink_bank` VALUES ('35', '40', '任庆荣', '1234556777777', '1', '13682077735', '1');
INSERT INTO `onethink_bank` VALUES ('36', '40', '任庆荣', '133457787', '7', '13682077735', '1');
INSERT INTO `onethink_bank` VALUES ('38', '37', 'ttw', 'rrt', '2', '在家', '1');
INSERT INTO `onethink_bank` VALUES ('43', '37', '佟桐', '6228210020010472012', '11', '15687536795', '1');
INSERT INTO `onethink_bank` VALUES ('40', '34', 'eee', '111111', '1', '15222898621', '1');

-- ----------------------------
-- Table structure for onethink_bank_type
-- ----------------------------
DROP TABLE IF EXISTS `onethink_bank_type`;
CREATE TABLE `onethink_bank_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `img` varchar(128) NOT NULL,
  `order_num` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_bank_type
-- ----------------------------
INSERT INTO `onethink_bank_type` VALUES ('1', '招商银行', 'img/katype/1.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('2', '花旗银行', 'img/katype/2.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('3', '建设银行', 'img/katype/3.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('4', '工商银行', 'img/katype/4.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('5', '交通银行', 'img/katype/5.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('6', '中国银行', 'img/katype/6.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('7', '农业银行', 'img/katype/7.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('8', '广发银行', 'img/katype/8.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('9', '中信银行', 'img/katype/9.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('10', '兴业银行', 'img/katype/10.jpg', '0');
INSERT INTO `onethink_bank_type` VALUES ('11', '民生银行', 'img/katype/11.jpg', '0');

-- ----------------------------
-- Table structure for onethink_brand
-- ----------------------------
DROP TABLE IF EXISTS `onethink_brand`;
CREATE TABLE `onethink_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_brand
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_brokerage
-- ----------------------------
DROP TABLE IF EXISTS `onethink_brokerage`;
CREATE TABLE `onethink_brokerage` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ratio_level1` decimal(5,2) DEFAULT '0.00' COMMENT '一级分销比例',
  `ratio_level2` decimal(5,2) DEFAULT '0.00' COMMENT '二级分销比例',
  `ratio_level3` decimal(5,2) DEFAULT '0.00' COMMENT '三级分销比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分销佣金比例表';

-- ----------------------------
-- Records of onethink_brokerage
-- ----------------------------
INSERT INTO `onethink_brokerage` VALUES ('1', '5.00', '2.00', '1.00');

-- ----------------------------
-- Table structure for onethink_brokerage_record
-- ----------------------------
DROP TABLE IF EXISTS `onethink_brokerage_record`;
CREATE TABLE `onethink_brokerage_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '分销上级id',
  `user_id` int(10) DEFAULT '0' COMMENT '用户id',
  `order_type` int(2) NOT NULL DEFAULT '0' COMMENT '订单类型，1商品订单，2拼团订单',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `order_sn` varchar(128) NOT NULL COMMENT '订单编号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分佣金额',
  `order_money` decimal(10,2) DEFAULT '0.00' COMMENT '订单实际支付金额',
  `brokerage_level` int(10) DEFAULT '1' COMMENT '分佣级别',
  `ratio` decimal(10,2) DEFAULT '0.00' COMMENT '分佣比例',
  `addtime` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='分佣记录表';

-- ----------------------------
-- Records of onethink_brokerage_record
-- ----------------------------
INSERT INTO `onethink_brokerage_record` VALUES ('16', '2', '0', '12', '0', '20160929101240209', '10.00', '0.00', '1', '0.00', '1475115164');
INSERT INTO `onethink_brokerage_record` VALUES ('17', '17', '0', '12', '0', '20160929101240209', '50.00', '0.00', '1', '0.00', '1475115164');
INSERT INTO `onethink_brokerage_record` VALUES ('18', '0', '0', '23', '0', '20161009120400282', '2.00', '0.00', '1', '0.00', '1475985850');
INSERT INTO `onethink_brokerage_record` VALUES ('19', '16', '0', '23', '0', '20161009120400282', '50.00', '0.00', '1', '0.00', '1475985850');
INSERT INTO `onethink_brokerage_record` VALUES ('20', '16', '23', '0', '76', '2017020716275713', '1.50', '0.00', '1', '0.00', '1486456078');
INSERT INTO `onethink_brokerage_record` VALUES ('29', '16', '23', '1', '77', '20170207164042746', '5.00', '100.00', '1', '0.05', '1486457532');
INSERT INTO `onethink_brokerage_record` VALUES ('30', '32', '21', '2', '77', '20170207164042746', '2.00', '100.00', '2', '0.02', '1486457532');
INSERT INTO `onethink_brokerage_record` VALUES ('31', '32', '23', '1', '77', '20170207164042746', '1.00', '100.00', '3', '0.01', '1486457532');

-- ----------------------------
-- Table structure for onethink_brokerage_withdraw_record
-- ----------------------------
DROP TABLE IF EXISTS `onethink_brokerage_withdraw_record`;
CREATE TABLE `onethink_brokerage_withdraw_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `bank_id` int(11) NOT NULL DEFAULT '0' COMMENT '银行卡id',
  `draw_type` int(5) DEFAULT '1' COMMENT '提现类型，1余额提现，2佣金提现',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '申请状态，0未处理，1已打款，2已驳回',
  `addtime` int(20) NOT NULL DEFAULT '0',
  `reason` varchar(300) DEFAULT NULL COMMENT '驳回申请时填写驳回原因',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='提现记录表';

-- ----------------------------
-- Records of onethink_brokerage_withdraw_record
-- ----------------------------
INSERT INTO `onethink_brokerage_withdraw_record` VALUES ('3', '17', '7', '1', '0.00', '0', '1475029668', null);
INSERT INTO `onethink_brokerage_withdraw_record` VALUES ('4', '17', '7', '1', '0.00', '0', '1475029674', null);
INSERT INTO `onethink_brokerage_withdraw_record` VALUES ('6', '17', '7', '1', '50.00', '1', '1475115536', null);
INSERT INTO `onethink_brokerage_withdraw_record` VALUES ('7', '20', '8', '1', '50.00', '0', '1478687688', null);
INSERT INTO `onethink_brokerage_withdraw_record` VALUES ('8', '20', '9', '1', '111.00', '1', '1478744840', null);
INSERT INTO `onethink_brokerage_withdraw_record` VALUES ('9', '20', '9', '1', '111.00', '2', '1478744852', null);
INSERT INTO `onethink_brokerage_withdraw_record` VALUES ('10', '32', '13', '2', '831.00', '2', '1483798889', 'rtyrr');

-- ----------------------------
-- Table structure for onethink_card
-- ----------------------------
DROP TABLE IF EXISTS `onethink_card`;
CREATE TABLE `onethink_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `num` int(10) NOT NULL DEFAULT '0',
  `addtime` int(20) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_on` tinyint(1) NOT NULL DEFAULT '0',
  `end_date` date NOT NULL,
  `desc` varchar(512) NOT NULL,
  `integral` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_card
-- ----------------------------
INSERT INTO `onethink_card` VALUES ('4', '金卡', '10', '1469497123', '1', '1', '2016-07-26', '测试生成', '100');
INSERT INTO `onethink_card` VALUES ('5', '2016年8月17日VIP', '10', '1471410864', '1', '1', '2016-08-20', '', '100');
INSERT INTO `onethink_card` VALUES ('6', '1000', '10', '1471846013', '1', '1', '2016-08-24', '', '1000');
INSERT INTO `onethink_card` VALUES ('7', '特权卡', '20', '1474875363', '1', '1', '2016-09-26', '', '10000');
INSERT INTO `onethink_card` VALUES ('8', '代金卷', '11', '1474876027', '1', '1', '2016-09-26', '11', '11');

-- ----------------------------
-- Table structure for onethink_card_detail
-- ----------------------------
DROP TABLE IF EXISTS `onethink_card_detail`;
CREATE TABLE `onethink_card_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL DEFAULT '0' COMMENT '卡券ID',
  `sn` varchar(128) NOT NULL COMMENT '卡号',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `is_ply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未使用 1已使用',
  `plytime` int(20) NOT NULL COMMENT '使用时间',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='卡券名细';

-- ----------------------------
-- Records of onethink_card_detail
-- ----------------------------
INSERT INTO `onethink_card_detail` VALUES ('1', '4', '14694974531', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('2', '4', '14694979182', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('3', '4', '14694977483', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('4', '4', '14694979374', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('5', '4', '14694976515', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('6', '4', '14694975756', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('7', '4', '14694982387', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('8', '4', '14694979228', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('9', '4', '14694973019', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('10', '4', '146949741110', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('11', '5', '14714109091', '0', '1', '1471845031');
INSERT INTO `onethink_card_detail` VALUES ('12', '5', '14714111682', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('13', '5', '14714111363', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('14', '5', '14714115394', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('15', '5', '14714111635', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('16', '5', '14714113936', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('17', '5', '14714109717', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('18', '5', '14714115998', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('19', '5', '14714115099', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('20', '5', '147141162410', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('21', '6', '14718465151', '0', '1', '1471846324');
INSERT INTO `onethink_card_detail` VALUES ('22', '6', '14718463572', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('23', '6', '14718467253', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('24', '6', '14718463204', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('25', '6', '14718461605', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('26', '6', '14718469636', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('27', '6', '14718468777', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('28', '6', '14718466728', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('29', '6', '14718460299', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('30', '6', '147184605210', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('31', '7', '14748768961', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('32', '7', '14748763232', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('33', '7', '14748763053', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('34', '7', '14748762974', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('35', '7', '14748767055', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('36', '7', '14748766156', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('37', '7', '14748759847', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('38', '7', '14748759328', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('39', '7', '14748762479', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('40', '7', '147487674210', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('41', '7', '147487656811', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('42', '7', '147487613512', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('43', '7', '147487674013', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('44', '7', '147487654614', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('45', '7', '147487602515', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('46', '7', '147487650116', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('47', '7', '147487590317', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('48', '7', '147487637118', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('49', '7', '147487682419', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('50', '7', '147487612220', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('51', '8', '14748773461', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('52', '8', '14748774892', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('53', '8', '14748773483', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('54', '8', '14748774774', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('55', '8', '14748781405', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('56', '8', '14748778826', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('57', '8', '14748776887', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('58', '8', '14748778728', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('59', '8', '14748773009', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('60', '8', '147487808510', '0', '0', '0');
INSERT INTO `onethink_card_detail` VALUES ('61', '8', '147487737811', '0', '0', '0');

-- ----------------------------
-- Table structure for onethink_cart
-- ----------------------------
DROP TABLE IF EXISTS `onethink_cart`;
CREATE TABLE `onethink_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `product_num` int(10) NOT NULL DEFAULT '0',
  `product_attr` varchar(128) NOT NULL,
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `addtime` int(20) NOT NULL DEFAULT '0',
  `share_user_id` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1有效，0失效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_cart
-- ----------------------------
INSERT INTO `onethink_cart` VALUES ('7', '14', '1', '12', '绿色', '20.00', '1474862121', '0', '0');
INSERT INTO `onethink_cart` VALUES ('28', '16', '18', '1', '黑色', '258.00', '1475203576', '0', '0');
INSERT INTO `onethink_cart` VALUES ('23', '17', '8', '1', '', '629.00', '1475121184', '0', '0');
INSERT INTO `onethink_cart` VALUES ('41', '16', '21', '1', '', '18.90', '1475992814', '0', '0');
INSERT INTO `onethink_cart` VALUES ('39', '16', '20', '1', '绿色', '24.00', '1475982817', '0', '0');
INSERT INTO `onethink_cart` VALUES ('97', '21', '1', '4', '', '100.00', '1479955637', '0', '0');
INSERT INTO `onethink_cart` VALUES ('95', '20', '9', '1', '', '50.00', '1479891945', '0', '0');
INSERT INTO `onethink_cart` VALUES ('98', '21', '12', '2', '', '1.00', '1479959669', '0', '0');
INSERT INTO `onethink_cart` VALUES ('105', '32', '4', '3', '颜色=红色,尺寸=37', '50.00', '1484032307', '0', '0');
INSERT INTO `onethink_cart` VALUES ('110', '32', '18', '3', '颜色=红色,尺寸=12', '1.00', '1487670998', '0', '0');
INSERT INTO `onethink_cart` VALUES ('152', '41', '18', '1', '颜色=红色,尺寸=15', '1.00', '1488941743', '0', '1');
INSERT INTO `onethink_cart` VALUES ('153', '41', '18', '1', '颜色=红色,尺寸=12', '1.00', '1488941747', '0', '1');
INSERT INTO `onethink_cart` VALUES ('131', '38', '18', '1', '颜色=红色,尺寸=15', '1.00', '1488621972', '0', '1');
INSERT INTO `onethink_cart` VALUES ('150', '41', '18', '1', '颜色=绿色,尺寸=12', '1.00', '1488941732', '0', '1');
INSERT INTO `onethink_cart` VALUES ('151', '41', '18', '1', '颜色=绿色,尺寸=15', '1.00', '1488941739', '0', '1');
INSERT INTO `onethink_cart` VALUES ('164', '39', '18', '1', '颜色=红色,尺寸=12', '1.00', '1488956380', '0', '1');
INSERT INTO `onethink_cart` VALUES ('236', '46', '18', '1', '颜色=绿色,尺寸=15', '1.00', '1489457534', '0', '1');
INSERT INTO `onethink_cart` VALUES ('195', '40', '26', '5', '35=黄色,36=红色', '15.00', '1489367438', '0', '1');
INSERT INTO `onethink_cart` VALUES ('237', '40', '27', '1', '颜色=绿色,尺寸=160', '12.00', '1489459335', '0', '1');
INSERT INTO `onethink_cart` VALUES ('235', '46', '18', '1', '颜色=红色,尺寸=15', '1.00', '1489457530', '0', '1');
INSERT INTO `onethink_cart` VALUES ('205', '40', '19', '1', '颜色=红色', '16.00', '1489384270', '0', '1');
INSERT INTO `onethink_cart` VALUES ('202', '40', '27', '5', '颜色=蓝色,尺寸=150', '12.00', '1489369880', '0', '1');
INSERT INTO `onethink_cart` VALUES ('203', '40', '28', '8', '颜色=红色', '12.00', '1489371362', '0', '1');

-- ----------------------------
-- Table structure for onethink_cashcoupon
-- ----------------------------
DROP TABLE IF EXISTS `onethink_cashcoupon`;
CREATE TABLE `onethink_cashcoupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `money` int(10) DEFAULT '100',
  `state` tinyint(1) DEFAULT '0' COMMENT '0未兑换，1已兑换',
  `addtime` int(10) DEFAULT '0' COMMENT '生成时间',
  `permoney` varchar(30) DEFAULT '0' COMMENT '拆分后每个代金券的金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='代金券表';

-- ----------------------------
-- Records of onethink_cashcoupon
-- ----------------------------
INSERT INTO `onethink_cashcoupon` VALUES ('1', '123123', '100', '1', '1486713438', '20');
INSERT INTO `onethink_cashcoupon` VALUES ('2', '145145', '100', '1', '1486713438', '20');
INSERT INTO `onethink_cashcoupon` VALUES ('3', '111111', '100', '1', '1487575339', '20');
INSERT INTO `onethink_cashcoupon` VALUES ('4', '830163', '1', '0', '1488855927', null);
INSERT INTO `onethink_cashcoupon` VALUES ('5', '964903', '50', '0', '1488881877', '10');
INSERT INTO `onethink_cashcoupon` VALUES ('6', '312870', '50', '0', '1488881877', '10');
INSERT INTO `onethink_cashcoupon` VALUES ('7', '560257', '50', '1', '1488881877', '10');
INSERT INTO `onethink_cashcoupon` VALUES ('8', '273254', '50', '1', '1488881877', '10');
INSERT INTO `onethink_cashcoupon` VALUES ('9', '823518', '50', '1', '1488881877', '10');

-- ----------------------------
-- Table structure for onethink_cashcoupon_detail
-- ----------------------------
DROP TABLE IF EXISTS `onethink_cashcoupon_detail`;
CREATE TABLE `onethink_cashcoupon_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codeId` int(10) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `is_ply` tinyint(1) DEFAULT '0' COMMENT '是否使用，0未使用，1已使用',
  `plytime` int(10) NOT NULL COMMENT '使用时间',
  `user_id` int(10) DEFAULT NULL COMMENT '会员Id',
  `addtime` int(10) DEFAULT NULL COMMENT '兑换时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=670 DEFAULT CHARSET=utf8 COMMENT='代金券明细表';

-- ----------------------------
-- Records of onethink_cashcoupon_detail
-- ----------------------------
INSERT INTO `onethink_cashcoupon_detail` VALUES ('1', '1', '20.00', '0', '0', '32', '1486714550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('2', '1', '20.00', '0', '0', '32', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('3', '1', '20.00', '0', '0', '32', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('4', '1', '20.00', '0', '0', '32', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('5', '1', '20.00', '0', '0', '32', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('6', '1', '20.00', '0', '0', '32', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('7', '2', '20.00', '0', '0', '34', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('8', '2', '20.00', '0', '0', '34', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('9', '2', '20.00', '0', '0', '34', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('10', '2', '20.00', '0', '0', '34', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('11', '2', '20.00', '0', '0', '34', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('12', '3', '20.00', '0', '0', '36', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('13', '3', '20.00', '0', '0', '36', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('14', '3', '20.00', '0', '0', '36', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('15', '3', '20.00', '0', '0', '36', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('16', '3', '20.00', '0', '0', '36', '1487575237');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('17', '5', '20.00', '1', '1489139387', '37', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('18', '5', '20.00', '0', '0', '37', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('19', '5', '20.00', '1', '1489142778', '37', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('20', '5', '20.00', '1', '1489635936', '37', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('21', '5', '20.00', '1', '1489128202', '37', '1487575237');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('23', '6', '20.00', '1', '1488954885', '39', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('24', '6', '20.00', '1', '1488954986', '39', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('25', '6', '20.00', '1', '1488956161', '39', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('26', '6', '20.00', '0', '0', '39', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('27', '6', '20.00', '0', '0', '39', '1487575237');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('28', '1', '20.00', '1', '1490063413', '29', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('29', '1', '20.00', '0', '0', '29', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('30', '1', '20.00', '0', '0', '29', '1486714788');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('31', '2', '20.00', '0', '0', '29', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('32', '2', '20.00', '0', '0', '29', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('33', '2', '20.00', '0', '0', '29', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('34', '2', '20.00', '0', '0', '29', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('35', '2', '20.00', '0', '0', '29', '1487401681');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('36', '3', '20.00', '0', '0', '29', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('37', '3', '20.00', '0', '0', '29', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('38', '3', '20.00', '0', '0', '29', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('39', '3', '20.00', '0', '0', '29', '1487575236');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('40', '3', '20.00', '0', '0', '29', '1487575237');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('42', '9', '10.00', '0', '0', '40', '1489039244');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('43', '9', '10.00', '1', '1489459399', '40', '1489039244');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('44', '9', '10.00', '0', '0', '40', '1489039244');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('45', '9', '10.00', '0', '0', '40', '1489039244');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('46', '9', '10.00', '0', '0', '40', '1489039244');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('47', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('48', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('49', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('50', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('51', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('52', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('53', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('54', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('55', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('56', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('57', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('58', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('59', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('60', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('61', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('62', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('63', '4', null, '0', '0', '40', '1489039531');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('64', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('65', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('66', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('67', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('68', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('69', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('70', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('71', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('72', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('73', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('74', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('75', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('76', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('77', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('78', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('79', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('80', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('81', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('82', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('83', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('84', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('85', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('86', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('87', '4', null, '0', '0', '40', '1489039532');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('88', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('89', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('90', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('91', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('92', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('93', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('94', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('95', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('96', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('97', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('98', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('99', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('100', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('101', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('102', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('103', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('104', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('105', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('106', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('107', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('108', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('109', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('110', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('111', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('112', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('113', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('114', '4', null, '0', '0', '40', '1489039533');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('115', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('116', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('117', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('118', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('119', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('120', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('121', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('122', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('123', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('124', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('125', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('126', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('127', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('128', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('129', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('130', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('131', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('132', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('133', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('134', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('135', '4', null, '0', '0', '40', '1489039534');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('136', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('137', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('138', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('139', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('140', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('141', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('142', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('143', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('144', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('145', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('146', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('147', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('148', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('149', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('150', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('151', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('152', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('153', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('154', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('155', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('156', '4', null, '0', '0', '40', '1489039535');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('157', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('158', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('159', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('160', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('161', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('162', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('163', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('164', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('165', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('166', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('167', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('168', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('169', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('170', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('171', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('172', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('173', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('174', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('175', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('176', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('177', '4', null, '0', '0', '40', '1489039536');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('178', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('179', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('180', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('181', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('182', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('183', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('184', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('185', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('186', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('187', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('188', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('189', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('190', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('191', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('192', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('193', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('194', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('195', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('196', '4', null, '0', '0', '40', '1489039537');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('197', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('198', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('199', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('200', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('201', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('202', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('203', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('204', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('205', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('206', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('207', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('208', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('209', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('210', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('211', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('212', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('213', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('214', '4', null, '0', '0', '40', '1489039538');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('215', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('216', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('217', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('218', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('219', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('220', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('221', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('222', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('223', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('224', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('225', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('226', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('227', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('228', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('229', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('230', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('231', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('232', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('233', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('234', '4', null, '0', '0', '40', '1489039539');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('235', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('236', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('237', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('238', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('239', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('240', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('241', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('242', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('243', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('244', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('245', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('246', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('247', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('248', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('249', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('250', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('251', '4', null, '0', '0', '40', '1489039540');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('252', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('253', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('254', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('255', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('256', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('257', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('258', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('259', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('260', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('261', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('262', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('263', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('264', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('265', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('266', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('267', '4', null, '0', '0', '40', '1489039541');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('268', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('269', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('270', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('271', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('272', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('273', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('274', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('275', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('276', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('277', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('278', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('279', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('280', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('281', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('282', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('283', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('284', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('285', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('286', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('287', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('288', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('289', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('290', '4', null, '0', '0', '40', '1489039542');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('291', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('292', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('293', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('294', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('295', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('296', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('297', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('298', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('299', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('300', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('301', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('302', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('303', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('304', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('305', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('306', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('307', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('308', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('309', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('310', '4', null, '0', '0', '40', '1489039543');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('311', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('312', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('313', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('314', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('315', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('316', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('317', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('318', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('319', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('320', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('321', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('322', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('323', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('324', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('325', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('326', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('327', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('328', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('329', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('330', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('331', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('332', '4', null, '0', '0', '40', '1489039544');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('333', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('334', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('335', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('336', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('337', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('338', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('339', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('340', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('341', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('342', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('343', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('344', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('345', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('346', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('347', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('348', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('349', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('350', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('351', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('352', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('353', '4', null, '0', '0', '40', '1489039545');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('354', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('355', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('356', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('357', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('358', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('359', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('360', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('361', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('362', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('363', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('364', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('365', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('366', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('367', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('368', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('369', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('370', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('371', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('372', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('373', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('374', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('375', '4', null, '0', '0', '40', '1489039546');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('376', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('377', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('378', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('379', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('380', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('381', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('382', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('383', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('384', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('385', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('386', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('387', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('388', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('389', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('390', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('391', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('392', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('393', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('394', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('395', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('396', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('397', '4', null, '0', '0', '40', '1489039547');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('398', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('399', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('400', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('401', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('402', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('403', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('404', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('405', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('406', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('407', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('408', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('409', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('410', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('411', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('412', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('413', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('414', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('415', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('416', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('417', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('418', '4', null, '0', '0', '40', '1489039548');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('419', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('420', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('421', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('422', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('423', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('424', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('425', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('426', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('427', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('428', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('429', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('430', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('431', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('432', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('433', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('434', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('435', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('436', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('437', '4', null, '0', '0', '40', '1489039549');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('438', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('439', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('440', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('441', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('442', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('443', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('444', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('445', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('446', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('447', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('448', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('449', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('450', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('451', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('452', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('453', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('454', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('455', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('456', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('457', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('458', '4', null, '0', '0', '40', '1489039550');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('459', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('460', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('461', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('462', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('463', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('464', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('465', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('466', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('467', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('468', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('469', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('470', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('471', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('472', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('473', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('474', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('475', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('476', '4', null, '0', '0', '40', '1489039551');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('477', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('478', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('479', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('480', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('481', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('482', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('483', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('484', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('485', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('486', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('487', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('488', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('489', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('490', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('491', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('492', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('493', '4', null, '0', '0', '40', '1489039552');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('494', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('495', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('496', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('497', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('498', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('499', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('500', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('501', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('502', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('503', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('504', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('505', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('506', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('507', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('508', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('509', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('510', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('511', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('512', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('513', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('514', '4', null, '0', '0', '40', '1489039553');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('515', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('516', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('517', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('518', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('519', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('520', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('521', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('522', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('523', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('524', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('525', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('526', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('527', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('528', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('529', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('530', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('531', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('532', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('533', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('534', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('535', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('536', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('537', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('538', '4', null, '0', '0', '40', '1489039554');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('539', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('540', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('541', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('542', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('543', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('544', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('545', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('546', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('547', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('548', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('549', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('550', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('551', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('552', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('553', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('554', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('555', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('556', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('557', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('558', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('559', '4', null, '0', '0', '40', '1489039555');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('560', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('561', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('562', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('563', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('564', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('565', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('566', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('567', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('568', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('569', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('570', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('571', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('572', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('573', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('574', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('575', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('576', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('577', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('578', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('579', '8', '10.00', '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('580', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('581', '8', '10.00', '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('582', '4', null, '0', '0', '40', '1489039556');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('583', '8', '10.00', '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('584', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('585', '8', '10.00', '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('586', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('587', '8', '10.00', '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('588', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('589', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('590', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('591', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('592', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('593', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('594', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('595', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('596', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('597', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('598', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('599', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('600', '4', null, '0', '0', '40', '1489039557');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('601', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('602', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('603', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('604', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('605', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('606', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('607', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('608', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('609', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('610', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('611', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('612', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('613', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('614', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('615', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('616', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('617', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('618', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('619', '4', null, '0', '0', '40', '1489039558');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('620', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('621', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('622', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('623', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('624', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('625', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('626', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('627', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('628', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('629', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('630', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('631', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('632', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('633', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('634', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('635', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('636', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('637', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('638', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('639', '4', null, '0', '0', '40', '1489039559');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('640', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('641', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('642', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('643', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('644', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('645', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('646', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('647', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('648', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('649', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('650', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('651', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('652', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('653', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('654', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('655', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('656', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('657', '4', null, '0', '0', '40', '1489039560');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('658', '4', null, '0', '0', '40', '1489039561');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('659', '4', null, '0', '0', '40', '1489039561');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('660', '4', null, '0', '0', '40', '1489039561');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('661', '4', null, '0', '0', '40', '1489039561');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('662', '4', null, '0', '0', '40', '1489039561');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('663', '4', null, '0', '0', '40', '1489039561');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('664', '4', null, '0', '0', '40', '1489039561');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('665', '7', '10.00', '0', '0', '40', '1489039695');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('666', '7', '10.00', '0', '0', '40', '1489039696');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('667', '7', '10.00', '0', '0', '40', '1489039696');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('668', '7', '10.00', '0', '0', '40', '1489039696');
INSERT INTO `onethink_cashcoupon_detail` VALUES ('669', '7', '10.00', '0', '0', '40', '1489039696');

-- ----------------------------
-- Table structure for onethink_category
-- ----------------------------
DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of onethink_category
-- ----------------------------
INSERT INTO `onethink_category` VALUES ('1', 'fish', '美丽', '0', '1', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1478142746', '1487579540', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('3', 'kitchen', '健康', '0', '2', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1479389539', '1483424531', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('4', 'presell', '玩乐', '0', '3', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1479389762', '1483424660', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('5', 'cards', '家居', '0', '4', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1479390152', '1483424662', '0', '0', '0');
INSERT INTO `onethink_category` VALUES ('6', 'miammo', '面膜', '1', '2', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1483597318', '1483600738', '1', '267', '0');
INSERT INTO `onethink_category` VALUES ('7', 'mians', '面霜', '1', '1', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1483600659', '1483600730', '1', '266', '0');
INSERT INTO `onethink_category` VALUES ('8', 'bbs', 'BB霜', '1', '0', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1483607356', '1483607356', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('9', 'aa1', '123', '3', '0', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1486102568', '1486102568', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('10', 'aaa123', '1234', '4', '0', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1486102580', '1486102580', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('11', 'qqq', '234324', '5', '0', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '1486102599', '1486102599', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('2', '测试', 'test', '0', '0', '10', '', '', '', '', '', '', '', '4', '1', '0', '1', '1', '1', '0', '', '', '0', '1488877268', '1', '0', '0');
INSERT INTO `onethink_category` VALUES ('15', 'test', 'test2', '2', '0', '10', '', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '', '', '1488877348', '1488877348', '1', '322', '0');
INSERT INTO `onethink_category` VALUES ('14', 'test2', 'test3', '2', '0', '10', '', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '', '', '1488877237', '1488877252', '1', '320', '0');
INSERT INTO `onethink_category` VALUES ('16', 'ceshi', '测试类', '0', '0', '10', '', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '', '', '1488940776', '1488940776', '1', '319', '0');
INSERT INTO `onethink_category` VALUES ('17', 'cwshi', 'ceshi1', '16', '0', '10', '', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '', '', '1488940835', '1488940835', '1', '326', '0');
INSERT INTO `onethink_category` VALUES ('18', '33', '12', '17', '0', '10', '', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '', '', '1488940862', '1488940862', '1', '0', '0');

-- ----------------------------
-- Table structure for onethink_channel
-- ----------------------------
DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_channel
-- ----------------------------
INSERT INTO `onethink_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `onethink_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `onethink_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for onethink_collection
-- ----------------------------
DROP TABLE IF EXISTS `onethink_collection`;
CREATE TABLE `onethink_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_collection
-- ----------------------------
INSERT INTO `onethink_collection` VALUES ('6', '4', '28', '1469080520');
INSERT INTO `onethink_collection` VALUES ('7', '3', '35', '1471334711');
INSERT INTO `onethink_collection` VALUES ('12', '2', '1', '1474416856');
INSERT INTO `onethink_collection` VALUES ('13', '14', '1', '1474874907');
INSERT INTO `onethink_collection` VALUES ('20', '16', '1', '1474962468');
INSERT INTO `onethink_collection` VALUES ('16', '16', '2', '1474959496');
INSERT INTO `onethink_collection` VALUES ('21', '17', '21', '1475056243');
INSERT INTO `onethink_collection` VALUES ('24', '17', '8', '1475121393');
INSERT INTO `onethink_collection` VALUES ('28', '16', '21', '1475892792');
INSERT INTO `onethink_collection` VALUES ('31', '16', '20', '1475921812');
INSERT INTO `onethink_collection` VALUES ('32', '16', '6', '1475975562');
INSERT INTO `onethink_collection` VALUES ('33', '20', '1', '1476089049');
INSERT INTO `onethink_collection` VALUES ('36', '20', '21', '1476843748');
INSERT INTO `onethink_collection` VALUES ('37', '20', '4', '1478497110');
INSERT INTO `onethink_collection` VALUES ('46', '21', '4', '1478917387');
INSERT INTO `onethink_collection` VALUES ('47', '21', '6', '1478917390');
INSERT INTO `onethink_collection` VALUES ('40', '21', '8', '1478915348');
INSERT INTO `onethink_collection` VALUES ('48', '21', '7', '1478917393');
INSERT INTO `onethink_collection` VALUES ('52', '21', '9', '1479955128');
INSERT INTO `onethink_collection` VALUES ('55', '36', '1', '1487666731');
INSERT INTO `onethink_collection` VALUES ('54', '32', '12', '1480070894');
INSERT INTO `onethink_collection` VALUES ('56', '36', '1', '1487666781');
INSERT INTO `onethink_collection` VALUES ('96', '37', '8', '1488424551');
INSERT INTO `onethink_collection` VALUES ('58', '32', '2', '1487666918');
INSERT INTO `onethink_collection` VALUES ('59', '38', '1', '1487673669');
INSERT INTO `onethink_collection` VALUES ('60', '38', '2', '1487673710');
INSERT INTO `onethink_collection` VALUES ('109', '39', '10', '1488939419');
INSERT INTO `onethink_collection` VALUES ('108', '39', '18', '1488939413');
INSERT INTO `onethink_collection` VALUES ('105', '39', '20', '1488939307');
INSERT INTO `onethink_collection` VALUES ('104', '39', '19', '1488939295');
INSERT INTO `onethink_collection` VALUES ('103', '39', '1', '1488939283');
INSERT INTO `onethink_collection` VALUES ('66', '32', '18', '1487741040');
INSERT INTO `onethink_collection` VALUES ('142', '29', '17', '1490063474');
INSERT INTO `onethink_collection` VALUES ('99', '38', '18', '1488616280');
INSERT INTO `onethink_collection` VALUES ('141', '37', '2', '1489654657');
INSERT INTO `onethink_collection` VALUES ('124', '40', '28', '1489371788');
INSERT INTO `onethink_collection` VALUES ('112', '40', '2', '1489039013');
INSERT INTO `onethink_collection` VALUES ('148', '29', '1', '1490168186');
INSERT INTO `onethink_collection` VALUES ('140', '34', '1', '1489559866');
INSERT INTO `onethink_collection` VALUES ('130', '37', '3', '1489478251');

-- ----------------------------
-- Table structure for onethink_config
-- ----------------------------
DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_config
-- ----------------------------
INSERT INTO `onethink_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '商城名称', '1', '', '网站标题前台显示标题', '1378898976', '1488961616', '1', '番茄网络模板商城', '0');
INSERT INTO `onethink_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1488961827', '1', '番茄网络模板商城', '3');
INSERT INTO `onethink_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1488961794', '1', '番茄网络模板商城,OneThink商城，thinkphp商城系统', '2');
INSERT INTO `onethink_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '0', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1488961772', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `onethink_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在PC网站底部显示的备案号，如“津ICP备12007941号-2', '1378900335', '1488961882', '1', '', '9');
INSERT INTO `onethink_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `onethink_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `onethink_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '0', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1488961839', '1', 'default_color', '10');
INSERT INTO `onethink_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1487569764', '1', '1:基本\r\n5:微信公众号支付\r\n6:支付宝\r\n7:短信\r\n8:微信APP支付\r\n', '4');
INSERT INTO `onethink_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `onethink_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `onethink_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `onethink_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `onethink_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `onethink_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `onethink_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `onethink_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `onethink_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `onethink_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `onethink_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `onethink_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `onethink_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `onethink_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `onethink_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `onethink_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `onethink_config` VALUES ('40', 'HOTSEARCH', '1', '热词', '0', '', '热门搜索词，必须逗号隔开', '1413221018', '1488961677', '1', '番茄网络模板商城', '0');
INSERT INTO `onethink_config` VALUES ('41', 'APPID', '1', 'Appid', '5', '', '公众账号ID', '1414001070', '1487570420', '1', 'wx8c1297a2aafcb715', '1');
INSERT INTO `onethink_config` VALUES ('42', 'APPSECRET', '1', 'Appsecret', '5', '', 'JSAPI接口中获取openid', '1414001165', '1487570438', '1', '8a35a4618b6a84a5cd428805b00dfa14', '2');
INSERT INTO `onethink_config` VALUES ('43', 'MCHID', '1', 'mchid', '5', '', '商户号', '1414153401', '1487570448', '1', '1394179202', '3');
INSERT INTO `onethink_config` VALUES ('44', 'PAYSIGNKEY', '1', 'Key', '5', '', '商户支付密钥Key', '1414164561', '1487570460', '1', 'tjtomatoapp20160101weixinzhangch', '4');
INSERT INTO `onethink_config` VALUES ('82', 'SMS_SIGN', '1', '短信签名', '7', '', '短信签名', '1488347377', '1488347955', '1', '番茄网络', '4');
INSERT INTO `onethink_config` VALUES ('46', 'SNAME', '1', '短信账号', '7', '', '短信平台账号', '1414183635', '1488347194', '1', 'dlssbw10', '1');
INSERT INTO `onethink_config` VALUES ('47', 'SPWD', '1', '短信密码', '7', '', '短信平台密码', '1414183716', '1488347286', '1', 'lMk3X0Uu', '2');
INSERT INTO `onethink_config` VALUES ('48', 'IP_TONGJI', '4', '开启ip访问统计', '3', '0:关闭,1:开启', '开启后追踪用户的访问页面，访问明细，访问地域', '1414244159', '1414244270', '1', '1', '0');
INSERT INTO `onethink_config` VALUES ('49', 'LAG', '0', '统计时间间隔（小时）', '3', '', '重复访问的会员每隔多少时间统计，小于这一时间，不统计', '1414258358', '1414407504', '1', '6', '21');
INSERT INTO `onethink_config` VALUES ('50', 'DOMAIN', '1', '商城域名', '1', '', '不包含http://', '1414504643', '1488961808', '1', '', '1');
INSERT INTO `onethink_config` VALUES ('51', '100KEY', '1', '0-快递100查询key', '0', '', '申请地址：http://www.kuaidi100.com/openapi/applyapi.shtml，用于查询运单号', '1414664721', '1488346675', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('52', 'ADDRESS', '1', '发货地址', '0', '', '卖家的发货地址', '1414664871', '1487570367', '1', '天津和平', '0');
INSERT INTO `onethink_config` VALUES ('53', 'SPRDID', '1', '产品编号', '7', '', '短信平台产品编号', '1414664911', '1488347269', '1', '1012818', '3');
INSERT INTO `onethink_config` VALUES ('54', 'SHOPNAME', '1', '卖家名称', '0', '', '卖家发货时填写的昵称', '1414665008', '1487570374', '1', '哈哈', '0');
INSERT INTO `onethink_config` VALUES ('55', 'SITENAME', '1', '网站名称', '0', '', '用于网站支付时显示，如土豆网', '1414761363', '1488961753', '1', '番茄网络模板商城', '0');
INSERT INTO `onethink_config` VALUES ('56', 'ALIPAYPARTNER', '1', '支付宝商户号', '6', '', '这里是你在成功申请支付宝接口后获取到的PID', '1414769351', '1488347059', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('57', 'ALIPAYKEY', '1', '支付宝密钥', '6', '', '这里是你在成功申请支付宝接口后获取到的Key', '1414769402', '1488347070', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('67', 'TENPAYPARTNER', '1', '2-财付通合作者ID', '0', '', '合作者ID，财付通有该配置，开通财付通账户后给予', '1415472468', '1488346708', '1', '', '1');
INSERT INTO `onethink_config` VALUES ('66', 'TENPAYKEY', '1', '财付通加密key', '0', '', '加密key，开通财付通账户后给予', '1415472288', '1488346716', '1', '', '2');
INSERT INTO `onethink_config` VALUES ('68', 'PALPAYPARTNER', '1', '3-贝宝账号', '0', '', '合作者ID，贝宝有该配置，开通贝宝账户后给予不需密码', '1415472655', '1488346724', '1', '', '3');
INSERT INTO `onethink_config` VALUES ('69', 'YEEPAYPARTNER', '1', '4-易付宝合作者id', '0', '', '易付宝给予的合作者id', '1415472817', '1488346733', '1', '', '4');
INSERT INTO `onethink_config` VALUES ('64', 'ALIPAYEMAIL', '1', '支付宝收款账号', '6', '', '支付宝收款账号邮箱', '1415472043', '1488347080', '1', '', '0');
INSERT INTO `onethink_config` VALUES ('70', 'YEEPAYKEY', '1', '易付宝密钥', '0', '', '易付宝合作者的密钥', '1415473084', '1488346741', '1', '', '5');
INSERT INTO `onethink_config` VALUES ('71', 'KUAIQIANPARTNER', '1', '5-快钱合作者id', '0', '', '合作者ID，快钱有该配置，开通财付通账户后给予', '1415473241', '1488346748', '1', '', '5');
INSERT INTO `onethink_config` VALUES ('72', 'KUAIQIANKEY', '1', '快钱key', '0', '', '加密key，开通快钱账户后给予', '1415473293', '1488346757', '1', '', '5');
INSERT INTO `onethink_config` VALUES ('73', 'UNIONPARTNER', '1', '6-银联合作者账号', '0', '', '合作者ID，银联有该配置，开通银联账户后给予', '1415473364', '1488346766', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('74', 'UNIONKEY', '1', '银联key', '0', '', ' 加密key，开通银联账户后给予', '1415473475', '1488346774', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('75', 'SCODE', '1', '授权码', '0', '', ' 商城的授权码', '1415473475', '1488961780', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('76', 'MAIL_HOST', '1', 'smtp服务器的名称', '0', '', ' smtp服务器的名称，默认QQ', '1415473475', '1489470580', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('77', 'MAIL_USERNAME', '1', '邮箱用户名', '0', '', ' 邮箱用户名', '1415473475', '1489470591', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('78', 'MAIL_FROMNAME', '1', '发件人姓名', '0', '', ' 商城网站名称，如yershop商城，默认QQ', '1415473475', '1489470598', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('79', 'MAIL_PASSWORD', '1', '邮箱密码', '0', '', ' 配置的邮箱密码', '1415473475', '1489470605', '1', '', '6');
INSERT INTO `onethink_config` VALUES ('80', 'SMSACCOUNT', '1', '1-互亿账号', '9', '', '申请地址：http://www.ihuyi.com/product.php', '1426339726', '1426340118', '1', '', '15');
INSERT INTO `onethink_config` VALUES ('81', 'SMSPASSWORD', '1', '互亿密码', '9', '', '互亿提供的密码', '1426339942', '1426340130', '1', '', '16');

-- ----------------------------
-- Table structure for onethink_coupon
-- ----------------------------
DROP TABLE IF EXISTS `onethink_coupon`;
CREATE TABLE `onethink_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `num` int(10) NOT NULL DEFAULT '0',
  `surplus_num` int(11) DEFAULT '0' COMMENT '剩余数量',
  `addtime` int(20) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `pid` int(11) NOT NULL COMMENT '可用产品id',
  `lowest` int(11) NOT NULL COMMENT '最低可用金额',
  `grade_id` int(10) DEFAULT '0' COMMENT '会员等级id',
  `pernum` int(5) DEFAULT '0' COMMENT '每个用户可领取优惠券的数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='优惠券';

-- ----------------------------
-- Records of onethink_coupon
-- ----------------------------
INSERT INTO `onethink_coupon` VALUES ('2', '测试优惠券', '2016-09-28 00:00:00', '2017-03-31 00:00:00', '100.00', '100', '100', '0', '1', '注册大礼包', '0', '100', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('3', '开始测试', '2016-09-28 00:00:00', '2016-09-28 00:00:00', '11.00', '11', '11', '0', '1', '11', '0', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('4', '代金券', '2016-11-02 00:00:00', '2016-11-09 00:00:00', '150.00', '100', '100', '0', '1', '代金券', '1', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('5', '1元代金券', '2016-11-02 00:00:00', '2016-11-16 00:00:00', '1.00', '100', '100', '0', '1', '1元代金券', '4', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('6', '5元代金券', '2016-11-02 00:00:00', '2016-11-18 00:00:00', '5.00', '100', '100', '0', '1', '5', '0', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('7', '10元代金券', '2016-11-02 00:00:00', '2016-11-26 00:00:00', '10.00', '100', '100', '0', '1', '10元代金券', '5', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('9', '本地测试优惠券', '2016-11-22 00:00:00', '2016-11-26 00:00:00', '1.00', '10', '8', '0', '1', '测试使用', '0', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('10', '测试优惠券', '2017-02-07 15:19:55', '2017-03-31 00:00:55', '5.00', '100', '100', '0', '1', '', '0', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('11', '优惠券测试', '2017-02-07 16:11:48', '2017-03-31 23:59:48', '10.00', '100', '100', '0', '1', '二玩儿', '1', '0', '0', '0');
INSERT INTO `onethink_coupon` VALUES ('12', 'test ticket', '2017-03-07 17:29:37', '2017-03-07 17:29:37', '100.00', '99', '0', '0', '1', 'test使用', '0', '0', '5', '0');

-- ----------------------------
-- Table structure for onethink_coupon_detail
-- ----------------------------
DROP TABLE IF EXISTS `onethink_coupon_detail`;
CREATE TABLE `onethink_coupon_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `sn` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_ply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未使用 1使用',
  `plytime` int(20) NOT NULL DEFAULT '0',
  `addtime` int(10) DEFAULT NULL COMMENT '领取时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=462 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_coupon_detail
-- ----------------------------
INSERT INTO `onethink_coupon_detail` VALUES ('11', '2', '14750246711', '17', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('12', '2', '14750241052', '18', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('13', '2', '14750236853', '19', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('14', '2', '14750243704', '20', '1', '1478244843', null);
INSERT INTO `onethink_coupon_detail` VALUES ('15', '2', '14750237075', '21', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('16', '2', '14750238966', '20', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('17', '2', '2017031014383078', '37', '1', '1489127910', null);
INSERT INTO `onethink_coupon_detail` VALUES ('18', '2', '20170321103013533', '29', '1', '1490063413', null);
INSERT INTO `onethink_coupon_detail` VALUES ('19', '2', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('20', '2', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('21', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('22', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('23', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('24', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('25', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('26', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('27', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('28', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('29', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('30', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('31', '3', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('32', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('33', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('34', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('35', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('36', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('37', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('38', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('39', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('40', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('41', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('42', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('43', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('44', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('45', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('46', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('47', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('48', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('49', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('50', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('51', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('52', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('53', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('54', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('55', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('56', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('57', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('58', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('59', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('60', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('61', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('62', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('63', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('64', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('65', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('66', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('67', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('68', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('69', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('70', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('71', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('72', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('73', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('74', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('75', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('76', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('77', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('78', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('79', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('80', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('81', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('82', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('83', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('84', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('85', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('86', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('87', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('88', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('89', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('90', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('91', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('92', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('93', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('94', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('95', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('96', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('97', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('98', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('99', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('100', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('101', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('102', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('103', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('104', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('105', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('106', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('107', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('108', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('109', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('110', '5', '147808582479', '20', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('111', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('112', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('113', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('114', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('115', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('116', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('117', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('118', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('119', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('120', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('121', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('122', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('123', '5', '147808567192', '20', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('124', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('125', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('126', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('127', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('128', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('129', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('130', '5', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('131', '5', '1478086097100', '20', '1', '1478246074', null);
INSERT INTO `onethink_coupon_detail` VALUES ('139', '4', 'X151J', '32', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('138', '2', '115111', '20', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('140', '9', '14797859841', '21', '0', '0', '1479794131');
INSERT INTO `onethink_coupon_detail` VALUES ('141', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('142', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('143', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('144', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('145', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('146', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('147', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('148', '9', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('150', '10', '14864525621', '23', '0', '0', '1486452414');
INSERT INTO `onethink_coupon_detail` VALUES ('151', '10', '14864527052', '34', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('152', '10', '14864527603', '32', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('153', '10', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('154', '10', '20170308150349555', '39', '1', '1488956629', null);
INSERT INTO `onethink_coupon_detail` VALUES ('155', '11', '14864555651', '23', '0', '0', '1486455165');
INSERT INTO `onethink_coupon_detail` VALUES ('156', '11', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('157', '11', '14864555293', '23', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('158', '11', '14864555794', '23', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('159', '11', '14864554735', '23', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('160', '3', '0', '39', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('262', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('162', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('163', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('164', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('165', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('166', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('167', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('168', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('169', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('170', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('171', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('172', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('173', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('174', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('175', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('176', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('177', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('178', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('179', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('180', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('182', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('183', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('184', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('185', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('186', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('187', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('188', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('189', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('190', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('191', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('192', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('193', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('194', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('195', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('196', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('197', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('198', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('199', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('200', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('201', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('202', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('203', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('204', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('205', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('206', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('207', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('208', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('209', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('210', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('211', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('212', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('213', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('214', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('215', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('216', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('217', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('218', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('219', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('220', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('221', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('222', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('223', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('224', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('225', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('226', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('227', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('228', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('229', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('230', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('231', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('232', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('233', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('234', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('235', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('236', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('237', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('238', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('239', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('240', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('241', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('242', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('243', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('244', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('245', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('246', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('247', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('248', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('249', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('250', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('251', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('252', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('253', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('254', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('255', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('256', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('257', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('258', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('259', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('260', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('261', '12', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('263', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('264', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('265', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('266', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('267', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('268', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('269', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('270', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('271', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('272', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('273', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('274', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('275', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('276', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('277', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('278', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('279', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('280', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('281', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('282', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('283', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('284', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('285', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('286', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('287', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('288', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('289', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('290', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('291', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('292', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('293', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('294', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('295', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('296', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('297', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('298', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('299', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('300', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('301', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('302', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('303', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('304', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('305', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('306', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('307', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('308', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('309', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('310', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('311', '7', '', '39', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('312', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('313', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('314', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('315', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('316', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('317', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('318', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('319', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('320', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('321', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('322', '7', '', '39', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('323', '7', '', '39', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('324', '7', '', '39', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('325', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('326', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('327', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('328', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('329', '7', '', '29', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('330', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('331', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('332', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('333', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('334', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('335', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('336', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('337', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('338', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('339', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('340', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('341', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('342', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('343', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('344', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('345', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('346', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('347', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('348', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('349', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('350', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('351', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('352', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('353', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('354', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('355', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('356', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('357', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('358', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('359', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('360', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('361', '7', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('362', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('363', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('364', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('365', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('366', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('367', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('368', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('369', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('370', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('371', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('372', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('373', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('374', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('375', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('376', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('377', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('378', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('379', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('380', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('381', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('382', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('383', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('384', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('385', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('386', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('387', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('388', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('389', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('390', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('391', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('392', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('393', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('394', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('395', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('396', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('397', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('398', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('399', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('400', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('401', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('402', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('403', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('404', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('405', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('406', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('407', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('408', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('409', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('410', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('411', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('412', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('413', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('414', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('415', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('416', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('417', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('418', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('419', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('420', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('421', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('422', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('423', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('424', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('425', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('426', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('427', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('428', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('429', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('430', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('431', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('432', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('433', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('434', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('435', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('436', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('437', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('438', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('439', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('440', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('441', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('442', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('443', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('444', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('445', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('446', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('447', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('448', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('449', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('450', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('451', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('452', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('453', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('454', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('455', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('456', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('457', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('458', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('459', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('460', '6', '', '0', '0', '0', null);
INSERT INTO `onethink_coupon_detail` VALUES ('461', '6', '', '0', '0', '0', null);

-- ----------------------------
-- Table structure for onethink_csales
-- ----------------------------
DROP TABLE IF EXISTS `onethink_csales`;
CREATE TABLE `onethink_csales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL COMMENT '订单号',
  `reason` text NOT NULL COMMENT '退货原因',
  `addtime` date NOT NULL COMMENT '退货时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_csales
-- ----------------------------
INSERT INTO `onethink_csales` VALUES ('1', '1', '1', '0000-00-00');
INSERT INTO `onethink_csales` VALUES ('2', '1', '1', '0000-00-00');

-- ----------------------------
-- Table structure for onethink_depot
-- ----------------------------
DROP TABLE IF EXISTS `onethink_depot`;
CREATE TABLE `onethink_depot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(128) NOT NULL COMMENT '编号',
  `area_id` int(11) NOT NULL DEFAULT '0',
  `contact` varchar(128) NOT NULL,
  `tel` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_depot
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_document
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of onethink_document
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_document_article
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of onethink_document_article
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_document_ceshi1
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_ceshi1`;
CREATE TABLE `onethink_document_ceshi1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `who` varchar(255) NOT NULL COMMENT '谁？',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_document_ceshi1
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_document_chanmao
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_chanmao`;
CREATE TABLE `onethink_document_chanmao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yulei` varchar(255) NOT NULL COMMENT '鱼种',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_document_chanmao
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_document_chanmao1
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_chanmao1`;
CREATE TABLE `onethink_document_chanmao1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spell_num` int(10) unsigned NOT NULL COMMENT '拼团人数',
  `join_num` int(10) unsigned NOT NULL COMMENT '参与人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_document_chanmao1
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_document_download
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of onethink_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_document_spell
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_spell`;
CREATE TABLE `onethink_document_spell` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `imgs` int(255) unsigned NOT NULL COMMENT '多图上传',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_document_spell
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `onethink_evaluate`;
CREATE TABLE `onethink_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_detail_id` int(11) NOT NULL DEFAULT '0',
  `score` tinyint(1) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `addtime` int(20) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，0未审核，1审核，-1删除',
  `anonymous` int(2) DEFAULT '1' COMMENT '1.匿名 -1不匿名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of onethink_evaluate
-- ----------------------------
INSERT INTO `onethink_evaluate` VALUES ('9', '9', '21', '69', '83', '5', 'fdgdfgdfgf', '1479885363', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('4', '9', '17', '11', '9', '5', '就是我婆婆', '1475043231', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('5', '9', '18', '12', '10', '5', 'JJ图9卡害怕他他他特特特么了不不不啊哈哈咳咳咳居多也就特踏踏加撒T裤肚饿可乐头段开拆咳咳咳咳咳咳饿了卡8U盾5卡哈哈哈热特价特特vowel爱吃不错我了客厅9我特来宾7度肚肚饿了额科拓特卡扒肉复读不督', '1475115410', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('6', '9', '17', '13', '12', '5', '奖励我1', '1475120077', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('7', '9', '20', '31', '33', '4', '123', '1477013457', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('8', '9', '21', '58', '70', '5', 'sdfsdfdsf\nsdfsd\ndsfs', '1479526458', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('10', '9', '21', '68', '81', '5', 'ertret3243', '1479885533', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('11', '9', '21', '67', '80', '4', '评价盘龙家', '1479890853', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('12', '9', '21', '66', '79', '3', '我来评价', '1479890866', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('13', '9', '21', '65', '78', '5', '给个好评', '1479890877', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('14', '9', '21', '64', '77', '2', '一个差评', '1479890889', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('15', '9', '21', '63', '75', '5', '评价评价啦啦啦', '1479890901', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('16', '9', '21', '60', '72', '4', '评价平阿基两地分居上课了房间', '1479890922', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('17', '9', '21', '61', '73', '5', '发的说法是电风扇的', '1479890929', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('18', '9', '21', '62', '74', '3', '发送到发送到反倒是', '1479890941', '1', null);
INSERT INTO `onethink_evaluate` VALUES ('19', '1', '32', '77', '91', '3', 'hahahahhaha', '1488260533', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('20', '18', '38', '96', '97', '1', '评价第一个商品，总共一个商品,匿名评价', '1488611556', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('21', '18', '38', '102', '103', '2', '第一个商品，总2个，不匿名2分', '1488613064', '1', '-1');
INSERT INTO `onethink_evaluate` VALUES ('22', '18', '38', '102', '104', '3', '第2个商品，总2个，不匿名3分', '1488613064', '1', '-1');
INSERT INTO `onethink_evaluate` VALUES ('23', '18', '38', '96', '97', '5', '评价第一个商品，总1个，5分，不匿名', '1488613553', '1', '-1');
INSERT INTO `onethink_evaluate` VALUES ('24', '18', '38', '96', '97', '4', '评价第一个商品，总1个，4分，不匿名', '1488614226', '1', '-1');
INSERT INTO `onethink_evaluate` VALUES ('25', '2', '29', '67', '80', '1', '非常满意', '1488858938', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('26', '2', '29', '67', '80', '1', '非常满意', '1488858984', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('27', '4', '29', '72', '86', '2', '非常满意', '1488859086', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('28', '4', '29', '72', '86', '1', '非常满意', '1488859163', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('29', '4', '29', '72', '86', '2', '非常满意', '1488859198', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('30', '4', '29', '72', '86', '2', '非常满意', '1488859216', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('31', '18', '46', '216', '218', '4', '2017-3-13 18:46评价', '1489401971', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('32', '18', '46', '217', '219', '2', '匿名评价2', '1489402190', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('33', '18', '46', '218', '220', '3', '匿名评价3', '1489455785', '1', '1');
INSERT INTO `onethink_evaluate` VALUES ('34', '18', '46', '219', '221', '5', '不匿名评价5', '1489456659', '1', '-1');
INSERT INTO `onethink_evaluate` VALUES ('35', '18', '47', '243', '246', '2', '匿名2', '1489556464', '1', '1');

-- ----------------------------
-- Table structure for onethink_file
-- ----------------------------
DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of onethink_file
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_focus
-- ----------------------------
DROP TABLE IF EXISTS `onethink_focus`;
CREATE TABLE `onethink_focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `link_url` varchar(128) NOT NULL,
  `order_num` int(10) NOT NULL DEFAULT '0',
  `link_type` int(5) DEFAULT '0' COMMENT '链接类型，1商品列表，2商品详情，3拼团列表，4拼团详情，5文章详情',
  `link_value` int(10) DEFAULT '0' COMMENT '参数id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='焦点图';

-- ----------------------------
-- Records of onethink_focus
-- ----------------------------
INSERT INTO `onethink_focus` VALUES ('7', '1', '美颂1', '/Uploads/Picture/2016-12-14/5850b7cfc6462.jpg', '#', '1', '0', '0');
INSERT INTO `onethink_focus` VALUES ('55', '10', '大卫', '/Uploads/Picture/2016-12-15/58520434a3765.jpg', '', '3', '0', '0');
INSERT INTO `onethink_focus` VALUES ('9', '2', '坚果', '/Uploads/Picture/2016-12-14/5850ec215327f.jpg', '#', '3', '0', '0');
INSERT INTO `onethink_focus` VALUES ('10', '2', '卫生巾', '/Uploads/Picture/2016-12-14/5850e95ddcf48.jpg', '#', '4', '0', '0');
INSERT INTO `onethink_focus` VALUES ('11', '2', '首页下面第三张森森摄影', '/Uploads/Picture/2016-12-16/585363f5d2f69.jpg', '/index.php?s=/Product/detail/id/8.html', '2', '0', '0');
INSERT INTO `onethink_focus` VALUES ('12', '2', '首页下面第四张采摘园', '/Uploads/Picture/2016-12-16/585364a21a1e5.jpg', '/index.php?s=/Product/detail/id/1.html', '1', '0', '0');
INSERT INTO `onethink_focus` VALUES ('13', '3', '每周一花', '/Uploads/Picture/2016-12-14/5850eb42f3758.jpg', '#', '4', '0', '0');
INSERT INTO `onethink_focus` VALUES ('14', '3', '纹绣', '/Uploads/Picture/2016-12-14/5850f0632f0af.jpg', '/index.php?s=/Product/detail/id/8.html', '3', '0', '0');
INSERT INTO `onethink_focus` VALUES ('15', '3', '精油皂', '/Uploads/Picture/2016-12-14/5850ed39369e9.jpg', '#', '2', '0', '0');
INSERT INTO `onethink_focus` VALUES ('67', '8', '竹盈', '/Uploads/Picture/2016-12-16/58536289ba3e2.jpg', '', '1', '0', '0');
INSERT INTO `onethink_focus` VALUES ('16', '3', '普瑞赛尔面膜', '/Uploads/Picture/2016-12-14/5850edbfd747e.jpg', '/index.php?s=/Product/detail/id/1.html', '1', '0', '0');
INSERT INTO `onethink_focus` VALUES ('17', '4', '防雾霾口罩', '/Uploads/Picture/2016-12-15/5852642848c57.jpg', '/index.php?s=/Product/detail/id/1.html', '4', '0', '0');
INSERT INTO `onethink_focus` VALUES ('66', '8', '流氓狗', '/Uploads/Picture/2016-12-16/58536265a43f4.jpg', '', '2', '0', '0');
INSERT INTO `onethink_focus` VALUES ('65', '8', '狐狸内衣', '/Uploads/Picture/2016-12-16/5853624d7ce36.jpg', '', '3', '0', '0');
INSERT INTO `onethink_focus` VALUES ('37', '5', '采摘园', '/Uploads/Picture/2016-12-16/585358f2a523e.jpg', '/index.php?s=/Product/detail/id/1.html', '0', '0', '0');
INSERT INTO `onethink_focus` VALUES ('38', '5', '穆怀鹏 按摩', '/Uploads/Picture/2016-12-16/585358292cebd.jpg', '/index.php?s=/Product/detail/id/7.html', '0', '0', '0');
INSERT INTO `onethink_focus` VALUES ('58', '5', '洗衣精（敕荣）', '/Uploads/Picture/2016-12-16/58535768b3cab.jpg', '', '0', '0', '0');
INSERT INTO `onethink_focus` VALUES ('59', '5', '洁面乳', '/Uploads/Picture/2016-12-16/585358685c114.jpg', '', '0', '0', '0');
INSERT INTO `onethink_focus` VALUES ('39', '8', '电商拖把', '/Uploads/Picture/2016-12-16/58535fc23a61a.jpg', '/index.php?s=/Product/detail/id/8.html', '4', '0', '0');
INSERT INTO `onethink_focus` VALUES ('56', '1', '美颂2', '/Uploads/Picture/2016-12-14/5850e2d2a54b6.jpg', '', '0', '0', '0');
INSERT INTO `onethink_focus` VALUES ('41', '7', '珠宝定制', '/Uploads/Picture/2016-12-15/5852512233f0b.jpg', '/index.php?s=/Product/detail/id/10.html', '1', '0', '0');
INSERT INTO `onethink_focus` VALUES ('42', '7', '森森', '/Uploads/Picture/2016-12-15/5852512ebe20c.jpg', '#', '2', '0', '0');
INSERT INTO `onethink_focus` VALUES ('43', '7', '狐狸内衣', '/Uploads/Picture/2016-12-15/58524a362cbd6.jpg', '', '3', '0', '0');
INSERT INTO `onethink_focus` VALUES ('44', '7', '温泉票', '/Uploads/Picture/2016-12-15/58524a40b0735.jpg', '', '4', '0', '0');
INSERT INTO `onethink_focus` VALUES ('57', '6', '福瑞堂理疗', '/Uploads/Picture/2016-12-15/5852426b990fd.jpg', '#', '0', '0', '0');
INSERT INTO `onethink_focus` VALUES ('63', '9', '玫瑰露（敕荣）', '/Uploads/Picture/2016-12-16/585362dd52ce7.jpg', '', '3', '0', '0');
INSERT INTO `onethink_focus` VALUES ('60', '4', '优源洗发', '/Uploads/Picture/2016-12-15/5852530887461.jpg', '', '3', '0', '0');
INSERT INTO `onethink_focus` VALUES ('61', '4', '竹之语', '/Uploads/Picture/2016-12-15/585265c644067.jpg', '', '2', '0', '0');
INSERT INTO `onethink_focus` VALUES ('62', '4', '护发素', '/Uploads/Picture/2016-12-16/58534b47872d6.jpg', '', '0', '0', '0');
INSERT INTO `onethink_focus` VALUES ('64', '9', '餐具洗（敕荣）', '/Uploads/Picture/2016-12-16/585362c70021c.jpg', '', '4', '0', '0');
INSERT INTO `onethink_focus` VALUES ('53', '10', '花王 每周一花', '/Uploads/Picture/2016-12-15/58522e3584fbd.jpg', '', '1', '0', '0');
INSERT INTO `onethink_focus` VALUES ('54', '10', '汤姐妙尊', '/Uploads/Picture/2016-12-14/58510d2a79447.jpg', '#', '2', '0', '0');
INSERT INTO `onethink_focus` VALUES ('68', '9', '卫生巾（敕荣）', '/Uploads/Picture/2016-12-16/585362efe5eb8.jpg', '', '2', '0', '0');
INSERT INTO `onethink_focus` VALUES ('69', '1', '油污净（敕荣）', '', '', '1', '3', '0');

-- ----------------------------
-- Table structure for onethink_focus_pos
-- ----------------------------
DROP TABLE IF EXISTS `onethink_focus_pos`;
CREATE TABLE `onethink_focus_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='banner位置表';

-- ----------------------------
-- Records of onethink_focus_pos
-- ----------------------------
INSERT INTO `onethink_focus_pos` VALUES ('1', '首页banner轮播');
INSERT INTO `onethink_focus_pos` VALUES ('2', '快报下竖图');
INSERT INTO `onethink_focus_pos` VALUES ('3', '快报下横图1');
INSERT INTO `onethink_focus_pos` VALUES ('4', '快报下横图2');
INSERT INTO `onethink_focus_pos` VALUES ('5', '新品推荐广告图');

-- ----------------------------
-- Table structure for onethink_grade
-- ----------------------------
DROP TABLE IF EXISTS `onethink_grade`;
CREATE TABLE `onethink_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) NOT NULL COMMENT '会员等级名称',
  `glimit` int(11) NOT NULL COMMENT '会员等级积分下限',
  `glv` int(11) NOT NULL COMMENT '会员等级',
  `gzk` double NOT NULL DEFAULT '1' COMMENT '折扣',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_grade
-- ----------------------------
INSERT INTO `onethink_grade` VALUES ('1', '江湖小虾', '100', '1', '0.5');
INSERT INTO `onethink_grade` VALUES ('2', '江湖小鱼', '500', '2', '0.8');
INSERT INTO `onethink_grade` VALUES ('5', '江湖甲鱼', '150', '2', '0.2');

-- ----------------------------
-- Table structure for onethink_hexiao
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hexiao`;
CREATE TABLE `onethink_hexiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `card` varchar(155) NOT NULL,
  `store_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='核销员信息表';

-- ----------------------------
-- Records of onethink_hexiao
-- ----------------------------
INSERT INTO `onethink_hexiao` VALUES ('1', '刘云鹏', '001', '1', '20');

-- ----------------------------
-- Table structure for onethink_history
-- ----------------------------
DROP TABLE IF EXISTS `onethink_history`;
CREATE TABLE `onethink_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1203 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_history
-- ----------------------------
INSERT INTO `onethink_history` VALUES ('26', '3', '29', '1468918781');
INSERT INTO `onethink_history` VALUES ('57', '2', '29', '1471334030');
INSERT INTO `onethink_history` VALUES ('72', '2', '28', '1471334496');
INSERT INTO `onethink_history` VALUES ('88', '2', '26', '1471341357');
INSERT INTO `onethink_history` VALUES ('17', '3', '28', '1468915433');
INSERT INTO `onethink_history` VALUES ('40', '4', '29', '1469081752');
INSERT INTO `onethink_history` VALUES ('35', '4', '28', '1469080537');
INSERT INTO `onethink_history` VALUES ('29', '4', '26', '1469079988');
INSERT INTO `onethink_history` VALUES ('42', '4', '30', '1469082926');
INSERT INTO `onethink_history` VALUES ('45', '5', '30', '1469169417');
INSERT INTO `onethink_history` VALUES ('46', '6', '30', '1469411016');
INSERT INTO `onethink_history` VALUES ('71', '2', '30', '1471334405');
INSERT INTO `onethink_history` VALUES ('50', '2', '31', '1469516430');
INSERT INTO `onethink_history` VALUES ('87', '3', '35', '1471341252');
INSERT INTO `onethink_history` VALUES ('73', '2', '35', '1471334498');
INSERT INTO `onethink_history` VALUES ('85', '3', '36', '1471339019');
INSERT INTO `onethink_history` VALUES ('84', '3', '37', '1471338346');
INSERT INTO `onethink_history` VALUES ('86', '2', '37', '1471341060');
INSERT INTO `onethink_history` VALUES ('385', '9', '38', '1471916234');
INSERT INTO `onethink_history` VALUES ('96', '9', '26', '1471351628');
INSERT INTO `onethink_history` VALUES ('352', '9', '40', '1471844839');
INSERT INTO `onethink_history` VALUES ('125', '9', '35', '1471400564');
INSERT INTO `onethink_history` VALUES ('395', '9', '41', '1471943149');
INSERT INTO `onethink_history` VALUES ('122', '10', '40', '1471399872');
INSERT INTO `onethink_history` VALUES ('121', '10', '41', '1471399835');
INSERT INTO `onethink_history` VALUES ('123', '10', '38', '1471400084');
INSERT INTO `onethink_history` VALUES ('394', '9', '42', '1471918341');
INSERT INTO `onethink_history` VALUES ('393', '9', '43', '1471916563');
INSERT INTO `onethink_history` VALUES ('388', '9', '44', '1471916444');
INSERT INTO `onethink_history` VALUES ('148', '11', '44', '1471418972');
INSERT INTO `onethink_history` VALUES ('400', '2', '42', '1472183862');
INSERT INTO `onethink_history` VALUES ('247', '10', '44', '1471491505');
INSERT INTO `onethink_history` VALUES ('249', '10', '42', '1471491601');
INSERT INTO `onethink_history` VALUES ('252', '10', '43', '1471491624');
INSERT INTO `onethink_history` VALUES ('286', '2', '40', '1471568624');
INSERT INTO `onethink_history` VALUES ('357', '9', '45', '1471845266');
INSERT INTO `onethink_history` VALUES ('368', '3', '42', '1471846814');
INSERT INTO `onethink_history` VALUES ('372', '3', '44', '1471847925');
INSERT INTO `onethink_history` VALUES ('376', '3', '41', '1471847955');
INSERT INTO `onethink_history` VALUES ('377', '12', '42', '1471850288');
INSERT INTO `onethink_history` VALUES ('378', '12', '44', '1471850301');
INSERT INTO `onethink_history` VALUES ('382', '12', '38', '1471850491');
INSERT INTO `onethink_history` VALUES ('396', '2', '38', '1472008159');
INSERT INTO `onethink_history` VALUES ('559', '2', '1', '1476610961');
INSERT INTO `onethink_history` VALUES ('444', '14', '1', '1475029251');
INSERT INTO `onethink_history` VALUES ('428', '14', '2', '1474878051');
INSERT INTO `onethink_history` VALUES ('427', '15', '1', '1474875649');
INSERT INTO `onethink_history` VALUES ('517', '16', '1', '1475887678');
INSERT INTO `onethink_history` VALUES ('435', '16', '2', '1474960898');
INSERT INTO `onethink_history` VALUES ('471', '17', '1', '1475119895');
INSERT INTO `onethink_history` VALUES ('455', '17', '3', '1475050381');
INSERT INTO `onethink_history` VALUES ('912', '17', '6', '1478774343');
INSERT INTO `onethink_history` VALUES ('474', '17', '8', '1475121281');
INSERT INTO `onethink_history` VALUES ('462', '17', '21', '1475056240');
INSERT INTO `onethink_history` VALUES ('464', '18', '18', '1475114873');
INSERT INTO `onethink_history` VALUES ('466', '18', '20', '1475115435');
INSERT INTO `onethink_history` VALUES ('477', '17', '20', '1475129209');
INSERT INTO `onethink_history` VALUES ('476', '17', '18', '1475128027');
INSERT INTO `onethink_history` VALUES ('555', '16', '21', '1475992811');
INSERT INTO `onethink_history` VALUES ('567', '2', '21', '1476698926');
INSERT INTO `onethink_history` VALUES ('549', '16', '20', '1475982812');
INSERT INTO `onethink_history` VALUES ('548', '16', '19', '1475980762');
INSERT INTO `onethink_history` VALUES ('542', '16', '15', '1475978232');
INSERT INTO `onethink_history` VALUES ('556', '16', '18', '1475992840');
INSERT INTO `onethink_history` VALUES ('550', '16', '8', '1475983374');
INSERT INTO `onethink_history` VALUES ('541', '16', '6', '1475975561');
INSERT INTO `onethink_history` VALUES ('512', '16', '7', '1475218016');
INSERT INTO `onethink_history` VALUES ('543', '16', '16', '1475979365');
INSERT INTO `onethink_history` VALUES ('544', '16', '4', '1475979476');
INSERT INTO `onethink_history` VALUES ('553', '19', '20', '1475985776');
INSERT INTO `onethink_history` VALUES ('913', '20', '1', '1478774550');
INSERT INTO `onethink_history` VALUES ('678', '20', '20', '1477728684');
INSERT INTO `onethink_history` VALUES ('596', '20', '21', '1477100637');
INSERT INTO `onethink_history` VALUES ('574', '20', '22', '1476844824');
INSERT INTO `onethink_history` VALUES ('1066', '20', '9', '1479891936');
INSERT INTO `onethink_history` VALUES ('743', '20', '11', '1478226421');
INSERT INTO `onethink_history` VALUES ('586', '20', '17', '1477016113');
INSERT INTO `onethink_history` VALUES ('587', '20', '18', '1477016119');
INSERT INTO `onethink_history` VALUES ('591', '20', '15', '1477100508');
INSERT INTO `onethink_history` VALUES ('595', '20', '8', '1477100577');
INSERT INTO `onethink_history` VALUES ('601', '20', '19', '1477449614');
INSERT INTO `onethink_history` VALUES ('602', '20', '14', '1477721788');
INSERT INTO `onethink_history` VALUES ('724', '20', '10', '1478172641');
INSERT INTO `onethink_history` VALUES ('894', '20', '6', '1478598424');
INSERT INTO `onethink_history` VALUES ('907', '20', '2', '1478769081');
INSERT INTO `onethink_history` VALUES ('736', '20', '7', '1478224956');
INSERT INTO `onethink_history` VALUES ('875', '20', '3', '1478496969');
INSERT INTO `onethink_history` VALUES ('908', '20', '4', '1478769116');
INSERT INTO `onethink_history` VALUES ('886', '20', '5', '1478507626');
INSERT INTO `onethink_history` VALUES ('1114', '21', '6', '1479968315');
INSERT INTO `onethink_history` VALUES ('1036', '21', '7', '1479885257');
INSERT INTO `onethink_history` VALUES ('1109', '21', '4', '1479959553');
INSERT INTO `onethink_history` VALUES ('1034', '21', '10', '1479885245');
INSERT INTO `onethink_history` VALUES ('1106', '21', '9', '1479957908');
INSERT INTO `onethink_history` VALUES ('1038', '21', '8', '1479885576');
INSERT INTO `onethink_history` VALUES ('1118', '21', '2', '1479992136');
INSERT INTO `onethink_history` VALUES ('1167', '21', '1', '1484630128');
INSERT INTO `onethink_history` VALUES ('1119', '21', '12', '1479992141');
INSERT INTO `onethink_history` VALUES ('1048', '21', '3', '1479891049');
INSERT INTO `onethink_history` VALUES ('1122', '20', '12', '1480070926');
INSERT INTO `onethink_history` VALUES ('1201', '23', '1', '1486435653');
INSERT INTO `onethink_history` VALUES ('1173', '23', '2', '1484635122');
INSERT INTO `onethink_history` VALUES ('1178', '23', '15', '1484637638');
INSERT INTO `onethink_history` VALUES ('1129', '23', '10', '1483606470');
INSERT INTO `onethink_history` VALUES ('1150', '23', '16', '1484040791');
INSERT INTO `onethink_history` VALUES ('1134', '23', '14', '1483780037');
INSERT INTO `onethink_history` VALUES ('1202', '23', '4', '1486445121');
INSERT INTO `onethink_history` VALUES ('1171', '23', '3', '1484635098');
INSERT INTO `onethink_history` VALUES ('1166', '23', '17', '1484044939');

-- ----------------------------
-- Table structure for onethink_hooks
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_hooks
-- ----------------------------
INSERT INTO `onethink_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `onethink_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `onethink_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `onethink_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `onethink_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for onethink_hotel
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hotel`;
CREATE TABLE `onethink_hotel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo',
  `image` varchar(255) DEFAULT NULL COMMENT '酒店封面图',
  `imglist` varchar(255) DEFAULT NULL COMMENT '轮播图',
  `cookstyle` varchar(255) DEFAULT NULL COMMENT '菜系',
  `content` text COMMENT '菜系介绍',
  `brief` text COMMENT '菜品介绍',
  `address` varchar(255) DEFAULT NULL COMMENT '酒店地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '预定电话',
  `oid` int(10) DEFAULT NULL COMMENT '排序',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `lat` varchar(255) DEFAULT NULL COMMENT '纬度',
  `lng` varchar(255) DEFAULT NULL COMMENT '经度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_hotel
-- ----------------------------
INSERT INTO `onethink_hotel` VALUES ('1', '馋小建-瓦氏华子鱼酒店', '/Uploads/Picture/2016-11-18/582e9d00a52c3.png', '/Uploads/Picture/2016-11-18/582e66afeaadb.png', '176,177', '鲁菜|川菜|粤菜', '<p>\r\n	这里是商品介绍\r\n</p>\r\n<p>\r\n	及的思考了附件是劳动法\r\n</p>', '<p>\r\n	菜品接收a\r\n</p>\r\n<p>\r\n	就看电视了附件是快乐发明家\r\n</p>\r\n<p>\r\n	fsdfjls\r\n</p>', '天津市南开区红旗路赛德广场5号楼', '022-12345678', '0', '1479437170', '39.11238930841418', '117.14855790138245');

-- ----------------------------
-- Table structure for onethink_integral_record
-- ----------------------------
DROP TABLE IF EXISTS `onethink_integral_record`;
CREATE TABLE `onethink_integral_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '积分来源说明',
  `integral` varchar(30) DEFAULT NULL COMMENT '所得积分',
  `addtime` int(10) DEFAULT NULL COMMENT '记录时间',
  `type` int(2) DEFAULT '0' COMMENT '积分类型，1注册，2签到，3消费，4拼团，5充值',
  `orderid` int(10) DEFAULT '0' COMMENT '订单id',
  `operate_type` int(1) DEFAULT '0' COMMENT '操作类型，0系统操作，1管理员操作,2会员操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='积分来源记录';

-- ----------------------------
-- Records of onethink_integral_record
-- ----------------------------
INSERT INTO `onethink_integral_record` VALUES ('13', '23', '会员注册', '5', '1483497850', '1', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('14', '23', '会员签到', '1', '1483498223', '2', '0', '2');
INSERT INTO `onethink_integral_record` VALUES ('15', '23', '参加拼团，订单编号：20170105114155929', '2', '1483587728', '4', '45', '0');
INSERT INTO `onethink_integral_record` VALUES ('16', '16', '购买商品，订单编号：20161009101617952', '629', '1483712738', '3', '18', '0');
INSERT INTO `onethink_integral_record` VALUES ('17', '16', '购买商品，订单编号：20161009101816683', '660', '1483712738', '3', '19', '0');
INSERT INTO `onethink_integral_record` VALUES ('18', '24', '会员注册', '5', '1483754918', '1', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('19', '25', '会员注册', '5', '1483755211', '1', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('20', '26', '会员注册', '5', '1483755345', '1', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('21', '27', '会员注册', '5', '1483755469', '1', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('22', '23', '购买商品，订单编号：2017020716275713', '30', '1486456108', '3', '76', '0');
INSERT INTO `onethink_integral_record` VALUES ('23', '23', '购买商品，订单编号：20170207164042746', '100', '1486457251', '3', '77', '0');
INSERT INTO `onethink_integral_record` VALUES ('24', '23', '购买商品，订单编号：20170207164042746', '100', '1486457532', '3', '77', '0');
INSERT INTO `onethink_integral_record` VALUES ('25', '32', '会员签到', '1', '1486627808', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('26', '32', '会员签到', '1', '1486627941', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('27', '32', '会员签到', '1', '1486627989', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('28', '34', '会员签到', '1', '1487403097', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('29', '32', '会员签到', '1', '1487403626', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('30', '29', '会员签到', '1', '1487414266', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('31', '29', '会员签到', '1', '1487554437', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('32', '36', '会员签到', '1', '1487574714', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('33', '35', '会员签到', '1', '1487579442', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('34', '36', '会员签到', '1', '1487658815', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('35', '38', '会员签到', '1', '1487661302', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('36', '29', '会员签到', '1', '1487661818', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('37', '38', '会员签到', '1', '1487726728', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('38', '29', '会员签到', '1', '1487750271', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('39', '29', '会员签到', '1', '1487815268', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('40', '38', '会员签到', '1', '1487820602', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('41', '29', '会员签到', '1', '1488273669', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('42', '38', '会员签到', '1', '1488443051', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('43', '38', '会员签到', '1', '1488522906', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('44', '38', '会员签到', '1', '1488591105', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('45', '34', '会员签到', '1', '1488613774', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('46', '38', '会员签到', '1', '1488780382', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('47', '34', '会员签到', '1', '1488790424', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('48', '39', '会员签到', '1', '1488939196', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('49', '34', '会员签到', '1', '1488939804', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('50', '39', '会员签到', '1', '1489029593', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('51', '34', '会员签到', '1', '1489128976', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('52', '39', '会员签到', '1', '1489130185', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('53', '34', '会员签到', '1', '1489371858', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('54', '39', '会员签到', '1', '1489377214', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('55', '46', '会员签到', '1', '1489393109', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('56', '46', '会员签到', '1', '1489456094', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('57', '29', '会员签到', '1', '1489468421', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('58', '34', '会员签到', '1', '1489475506', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('59', '47', '会员签到', '1', '1489480841', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('60', '34', '会员签到', '1', '1489569201', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('61', '29', '会员签到', '1', '1489973411', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('62', '29', '会员签到', '1', '1490148861', '2', '0', '0');
INSERT INTO `onethink_integral_record` VALUES ('63', '29', '会员签到', '1', '1490261270', '2', '0', '0');

-- ----------------------------
-- Table structure for onethink_integrate
-- ----------------------------
DROP TABLE IF EXISTS `onethink_integrate`;
CREATE TABLE `onethink_integrate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sign_ratio` int(10) DEFAULT '1' COMMENT '签到积分比例',
  `regist_ratio` int(10) DEFAULT '0' COMMENT '注册积分比例',
  `pay_ratio` int(10) DEFAULT '0' COMMENT '支付积分比例',
  `charge_ratio` int(10) DEFAULT '0' COMMENT '充值积分比例',
  `totalmoney` decimal(10,2) DEFAULT NULL COMMENT '满多少免运费',
  `expenses` decimal(10,2) DEFAULT NULL COMMENT '运费',
  `withdraw_limit` int(10) DEFAULT '0' COMMENT '佣金提现金额最小限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_integrate
-- ----------------------------
INSERT INTO `onethink_integrate` VALUES ('1', '1', '5', '1', '1', '50.00', '10.00', '200');

-- ----------------------------
-- Table structure for onethink_member
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of onethink_member
-- ----------------------------
INSERT INTO `onethink_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '620', '269', '0', '1467327563', '2130706433', '1493690029', '1');
INSERT INTO `onethink_member` VALUES ('2', 'aaaa', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '-1');
INSERT INTO `onethink_member` VALUES ('3', 'test01', '0', '0000-00-00', '', '10', '3', '0', '0', '1873101532', '1471328069', '-1');
INSERT INTO `onethink_member` VALUES ('4', 'dongbin', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '-1');
INSERT INTO `onethink_member` VALUES ('5', 'test', '0', '0000-00-00', '', '10', '3', '0', '0', '2130706433', '1472091227', '-1');
INSERT INTO `onethink_member` VALUES ('6', 'admin1', '0', '0000-00-00', '', '10', '2', '0', '0', '0', '1477982342', '1');

-- ----------------------------
-- Table structure for onethink_menu
-- ----------------------------
DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_menu
-- ----------------------------
INSERT INTO `onethink_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('2', '商品管理', '0', '3', '/Admin/Product/index/cate_id/1', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('16', '用户管理', '0', '6', 'Member/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('17', '管理员信息', '16', '1', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `onethink_menu` VALUES ('19', '用户行为', '16', '6', 'User/action', '1', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `onethink_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `onethink_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `onethink_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `onethink_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `onethink_menu` VALUES ('27', '权限管理', '16', '2', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `onethink_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `onethink_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('131', '基本', '93', '30', 'WebSite/index', '1', '', '配置', '0');
INSERT INTO `onethink_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `onethink_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `onethink_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `onethink_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `onethink_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `onethink_menu` VALUES ('173', '新增配置', '68', '6', 'Config/index', '1', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('58', '模型管理', '68', '9', 'Model/index', '1', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('63', '属性管理', '68', '1', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `onethink_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('68', '系统管理', '0', '2', 'config/group', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('75', '菜单管理', '68', '10', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('80', '分类管理', '68', '8', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('86', '备份数据库', '68', '2', 'Database/index?type=export', '1', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `onethink_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('90', '还原数据库', '68', '3', 'Database/index?type=import', '1', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `onethink_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('93', '拼团活动', '0', '8', 'Spell/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('106', '行为日志', '16', '7', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('108', '修改密码', '16', '3', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('109', '修改昵称', '16', '4', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('123', '品牌新增', '122', '0', 'Brand/add', '0', '', '品牌管理', '0');
INSERT INTO `onethink_menu` VALUES ('124', '品牌编辑', '122', '0', 'Brand/edit', '0', '', '品牌管理', '0');
INSERT INTO `onethink_menu` VALUES ('125', 'Banner列表', '68', '4', 'Focus/index', '0', '', 'Banner', '0');
INSERT INTO `onethink_menu` VALUES ('126', 'Banner位置', '68', '5', 'FocusPos/index', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('127', '添加', '125', '0', 'Focus/add', '0', '', 'Banner列表', '0');
INSERT INTO `onethink_menu` VALUES ('128', '编辑', '125', '0', 'Focus/edit', '0', '', 'Banner列表', '0');
INSERT INTO `onethink_menu` VALUES ('129', '增加', '126', '0', 'FocusPos/add', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('130', '编辑', '126', '0', 'FocusPos/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('133', '新增', '132', '0', 'Area/add', '0', '', '区县管理', '0');
INSERT INTO `onethink_menu` VALUES ('134', '编辑', '132', '0', 'Area/edit', '0', '', '区县管理', '0');
INSERT INTO `onethink_menu` VALUES ('172', '会员管理', '16', '0', 'Member/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('136', '新增', '135', '0', 'Depot/add', '0', '', '仓库管理', '0');
INSERT INTO `onethink_menu` VALUES ('137', '编辑', '135', '0', 'Depot/edit', '0', '', '仓库管理', '0');
INSERT INTO `onethink_menu` VALUES ('138', '优惠券列表', '174', '1', 'Coupon/index', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('139', '增加', '138', '0', 'Coupon/add', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('140', '编辑', '138', '0', 'Coupon/edit', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('166', '订单列表', '161', '0', 'Order/index', '0', '', '订单管理', '0');
INSERT INTO `onethink_menu` VALUES ('142', '明细', '138', '0', 'Coupon/detail', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('241', '编辑会员等级', '182', '0', 'Member/addgrade', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('147', '商品列表', '2', '0', 'Product/index', '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('148', '网站配置', '68', '7', 'config/group', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('177', '充值记录', '169', '0', 'Recharge/index', '1', '', '收入明细', '0');
INSERT INTO `onethink_menu` VALUES ('201', '拼团列表', '93', '0', 'Spell/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('153', '优惠券明细', '174', '1', 'Coupon/detaillist', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('178', '编辑会员', '172', '0', 'Member/edit', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('242', '删除等级', '182', '0', 'Member/delgrade', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('158', '拼团申请', '93', '30', 'Spell/reg', '1', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('161', '订单列表', '174', '0', 'Order/index', '0', '订单管理', '订单管理', '0');
INSERT INTO `onethink_menu` VALUES ('240', '订单详情', '222', '0', 'Spell/views', '0', '', '拼团订单', '0');
INSERT INTO `onethink_menu` VALUES ('167', '订单详情', '166', '0', 'Order/views', '0', '', '订单管理', '0');
INSERT INTO `onethink_menu` VALUES ('169', '资金管理', '0', '7', 'BrokerageRecord/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('170', '返利明细', '169', '3', 'RebateRecord/index', '1', '', '支出明细', '0');
INSERT INTO `onethink_menu` VALUES ('171', '提现记录', '169', '2', 'BrokerageWithdrawRecord/index', '0', '', '支出明细', '0');
INSERT INTO `onethink_menu` VALUES ('174', '信息管理', '0', '4', 'Order/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('175', '文章列表', '174', '3', 'News/index', '0', '', '文章管理', '0');
INSERT INTO `onethink_menu` VALUES ('176', '商品评论', '174', '3', 'Evaluate/index', '0', '', '评论管理', '0');
INSERT INTO `onethink_menu` VALUES ('180', '退货申请', '161', '0', 'rsales', '1', '', '退换货管理', '0');
INSERT INTO `onethink_menu` VALUES ('181', '换货申请', '161', '0', 'csales', '1', '', '退换货管理', '0');
INSERT INTO `onethink_menu` VALUES ('182', '会员等级', '16', '0', 'Member/grade', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('183', '自提点列表', '16', '0', 'Member/store', '0', '', '自提点管理', '0');
INSERT INTO `onethink_menu` VALUES ('186', '拼团退款', '93', '30', 'Spell/refund', '1', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('244', '拼团订单', '93', '1', 'Spell/order', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('193', '酒店列表', '192', '0', 'Hotel/index', '0', '', '联盟酒店', '0');
INSERT INTO `onethink_menu` VALUES ('231', '查看信息', '138', '0', 'Coupon/info', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('232', '新增明细', '153', '0', 'Coupon/adddetail', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('198', '佣金比例设置', '68', '5', 'Brokerage/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('199', '积分比例设置', '68', '5', 'Brokerage/integrate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('200', '返佣明细', '169', '1', 'BrokerageRecord/index', '0', '', '收入明细', '0');
INSERT INTO `onethink_menu` VALUES ('202', '客服设置', '68', '0', 'Kefu/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('203', '分佣记录', '172', '0', 'Member/brokerageList', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('204', '新增自提点', '183', '0', 'Member/addstore', '0', '', '自提点管理', '0');
INSERT INTO `onethink_menu` VALUES ('206', '新增会员等级', '182', '0', 'Member/addgrade', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('207', '新增会员', '172', '0', 'Member/add', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('208', '删除单个会员', '172', '0', 'Member/del', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('209', '批量删除、启用/禁用会员', '172', '0', 'Member/setStatus', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('210', '新增文档', '175', '0', 'News/add', '0', '', '文档列表', '0');
INSERT INTO `onethink_menu` VALUES ('211', '编辑文档', '175', '0', 'News/edit', '0', '', '文档列表', '0');
INSERT INTO `onethink_menu` VALUES ('212', '删除文档', '175', '0', 'News/del', '0', '', '文档列表', '0');
INSERT INTO `onethink_menu` VALUES ('213', '编辑', '176', '0', 'Evaluate/edit', '0', '', '评论管理', '0');
INSERT INTO `onethink_menu` VALUES ('214', '删除评论', '176', '0', 'Evaluate/audit', '0', '', '评论管理', '0');
INSERT INTO `onethink_menu` VALUES ('215', '批量审核、删除评论', '176', '0', 'Evaluate/setStatus', '0', '', '评论管理', '0');
INSERT INTO `onethink_menu` VALUES ('216', '删除订单', '166', '0', 'Order/del', '0', '', '订单管理', '0');
INSERT INTO `onethink_menu` VALUES ('217', '代金券列表', '174', '2', 'CashCoupon/index', '0', '', '代金券管理', '0');
INSERT INTO `onethink_menu` VALUES ('245', '收货地址', '172', '0', 'Member/address', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('218', '提现详情', '171', '0', 'BrokerageWithdrawRecord/info', '0', '', '支出明细', '0');
INSERT INTO `onethink_menu` VALUES ('219', '新增拼团', '201', '0', 'Spell/add', '0', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('220', '编辑', '201', '0', 'Spell/edit', '0', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('221', '团长列表', '201', '0', 'Spell/teams', '0', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('222', '参团人员列表', '201', '0', 'Spell/detail', '0', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('223', '拼团信息', '201', '0', 'Spell/info', '0', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('224', '新增', '217', '0', 'CashCoupon/add', '0', '', '代金券管理', '0');
INSERT INTO `onethink_menu` VALUES ('225', '明细', '217', '0', 'CashCoupon/detail', '0', '', '代金券管理', '0');
INSERT INTO `onethink_menu` VALUES ('226', '导出代金券列表', '217', '0', 'CashCoupon/exportList', '0', '', '代金券管理', '0');
INSERT INTO `onethink_menu` VALUES ('227', '快报列表', '174', '3', 'Newsflash/index', '1', '', '快报管理', '0');
INSERT INTO `onethink_menu` VALUES ('228', '新增', '227', '0', 'Newsflash/add', '0', '', '快报管理', '0');
INSERT INTO `onethink_menu` VALUES ('229', '编辑', '227', '0', 'Newsflash/edit', '0', '', '快报管理', '0');
INSERT INTO `onethink_menu` VALUES ('230', '删除', '227', '0', 'Newsflash/del', '0', '', '快报管理', '0');
INSERT INTO `onethink_menu` VALUES ('233', '删除明细', '153', '0', 'Coupon/deldetail', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('246', '推广人列表', '172', '0', 'Member/spread', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('234', '生成明细', '138', '0', 'Coupon/create', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('235', '删除', '138', '0', 'Coupon/del', '0', '', '优惠券管理', '0');
INSERT INTO `onethink_menu` VALUES ('236', '删除', '201', '0', 'Spell/updateStatus', '0', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('237', '退款', '201', '0', 'Spell/tuikuan', '0', '', '拼团管理', '0');
INSERT INTO `onethink_menu` VALUES ('238', '删除', '217', '0', 'CashCoupon/del', '0', '', '代金券管理', '0');
INSERT INTO `onethink_menu` VALUES ('239', '增加操作', '217', '0', 'CashCoupon/addCoupon', '0', '', '代金券管理', '0');

-- ----------------------------
-- Table structure for onethink_model
-- ----------------------------
DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of onethink_model
-- ----------------------------
INSERT INTO `onethink_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\ntype|get_document_type:类型\nlevel:优先级\nupdate_time|time_format:最后更新\nstatus_text:状态\nview:浏览\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '0', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '0', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '0', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('4', 'product_model', '产品模型', '0', '', '1', '{\"1\":[\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"79\",\"80\",\"81\"]}', '1:参数', '', '', '', '', 'id:编号\r\ntitle:标题:product/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '10', '', '', '1467327671', '1473524725', '1', 'MyISAM');

-- ----------------------------
-- Table structure for onethink_msg
-- ----------------------------
DROP TABLE IF EXISTS `onethink_msg`;
CREATE TABLE `onethink_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL COMMENT '消息内容',
  `addtime` int(11) NOT NULL COMMENT '发送时间',
  `status` int(11) NOT NULL DEFAULT '-1' COMMENT '状态 1.已读 -1未读',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='系统消息表';

-- ----------------------------
-- Records of onethink_msg
-- ----------------------------
INSERT INTO `onethink_msg` VALUES ('3', '34', '12e321', '尊敬的顾客您好！你的订单20161104180807675于2016-11-05失败。我们将把购物款退回您的账户中，请注意查收！', '1478332846', '-1');
INSERT INTO `onethink_msg` VALUES ('8', '34', '12e42', '尊敬的顾客您好！你的订单20161104181120233于2016-11-05失败。我们将把购物款退回您的账户中，请注意查收！', '1478332955', '1');
INSERT INTO `onethink_msg` VALUES ('5', '34', '12e41 ', '尊敬的顾客您好！你的订单20161104180807675于2016-11-05失败。我们将把购物款退回您的账户中，请注意查收！', '1478332955', '-1');
INSERT INTO `onethink_msg` VALUES ('6', '34', '12e42', '尊敬的顾客您好！你的订单20161104181120233于2016-11-05失败。我们将把购物款退回您的账户中，请注意查收！', '1478332955', '1');
INSERT INTO `onethink_msg` VALUES ('7', '34', '12e41 ', '尊敬的顾客您好！你的订单20161104180807675于2016-11-05失败。我们将把购物款退回您的账户中，请注意查收！', '1478332955', '1');
INSERT INTO `onethink_msg` VALUES ('9', '34', '12e321', '尊敬的顾客您好！你的订单20161104180807675于2016-11-05失败。我们将把购物款退回您的账户中，请注意查收！', '1478332846', '1');
INSERT INTO `onethink_msg` VALUES ('15', '34', '12e321', '尊敬的顾客您好！你的订单20161104180807675于2016-11-05失败。我们将把购物款退回您的账户中，请注意查收！', '1478332846', '1');

-- ----------------------------
-- Table structure for onethink_news
-- ----------------------------
DROP TABLE IF EXISTS `onethink_news`;
CREATE TABLE `onethink_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '标题',
  `desc` text NOT NULL COMMENT '描述',
  `image` text NOT NULL COMMENT '文章图片',
  `addtime` int(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章所属分类ID',
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `keywords` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `fb_date` date NOT NULL,
  `source` varchar(128) NOT NULL,
  `views` int(10) NOT NULL DEFAULT '0',
  `is_tj` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不推荐',
  `type` varchar(50) DEFAULT NULL COMMENT '所属分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of onethink_news
-- ----------------------------
INSERT INTO `onethink_news` VALUES ('7', '返利规则', 'sdfasdf', '', '1475033388', '0', '0', '0', 'asdfa', 'dasdfddd', '2016-09-28', '', '0', '0', null);
INSERT INTO `onethink_news` VALUES ('8', '推广规则', 'asdf', '', '1475033482', '0', '0', '0', '', '<p>\r\n	asdgasdasd\r\n</p>\r\n<p>\r\n	fdsfdfs\r\n</p>', '2016-09-28', '', '0', '0', null);
INSERT INTO `onethink_news` VALUES ('9', '用户协议', '', '', '1477379272', '0', '0', '0', 'Agreement', '你已经同意了此项协议！', '2016-10-25', '', '0', '0', null);
INSERT INTO `onethink_news` VALUES ('10', '入群抽奖', '入群抽奖', '', '1479527158', '0', '0', '0', '', '<p>\r\n	入群抽奖\r\n</p>\r\n<p>\r\n	图文说明\r\n</p>\r\n<p>\r\n	一个单页而已\r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2016-11-19/582fcb24d6bc3.jpg\" alt=\"\" />\r\n</p>', '0000-00-00', '', '0', '0', 'kuaibao');
INSERT INTO `onethink_news` VALUES ('11', '关于我们', '关于我们', '', '0', '0', '0', '0', '', '122223234321', '0000-00-00', '', '0', '0', 'guanyu');

-- ----------------------------
-- Table structure for onethink_newsflash
-- ----------------------------
DROP TABLE IF EXISTS `onethink_newsflash`;
CREATE TABLE `onethink_newsflash` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `link_url` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `state` tinyint(1) DEFAULT '1' COMMENT '是否显示，1显示，0不显示',
  `oid` int(10) DEFAULT '0' COMMENT '排除',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_newsflash
-- ----------------------------
INSERT INTO `onethink_newsflash` VALUES ('1', '金赛克红福鱼88元购两盒', 'http://chanmao.tjtomato.com', '1', '0', '1479439874');

-- ----------------------------
-- Table structure for onethink_order
-- ----------------------------
DROP TABLE IF EXISTS `onethink_order`;
CREATE TABLE `onethink_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态，0待付款，1待发货，2待收货，3已完成，4已取消， 5待评价',
  `sn` varchar(128) NOT NULL COMMENT '订单编号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额',
  `pro_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提货方式，0送货，1自提',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '收货地址id',
  `depot_id` int(11) NOT NULL DEFAULT '0' COMMENT '自提点id',
  `express_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费金额',
  `integral` int(10) NOT NULL DEFAULT '0',
  `paytype` tinyint(1) DEFAULT '0' COMMENT '支付方式，0微信支付，1余额支付， 2支付宝支付',
  `paytime` int(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `is_fan` tinyint(1) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠券id',
  `coupon_money` decimal(10,2) DEFAULT '0.00' COMMENT '优惠券金额',
  `cashcoup_id` int(10) DEFAULT NULL COMMENT '代金券id',
  `cashcoup_money` decimal(10,2) DEFAULT '0.00' COMMENT '代金券金额',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除，1删除，0未删除',
  `is_drawback` tinyint(1) DEFAULT '0' COMMENT '是否退款，1是，0否',
  `note` varchar(300) DEFAULT NULL COMMENT '买家留言',
  `sendtime` int(10) DEFAULT NULL COMMENT '发货时间',
  `addtime` int(20) NOT NULL DEFAULT '0' COMMENT '下单时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 COMMENT='用户订单表';

-- ----------------------------
-- Records of onethink_order
-- ----------------------------
INSERT INTO `onethink_order` VALUES ('1', '29', '5', '20160920210330754', '20.00', '0.00', '2.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1474376610');
INSERT INTO `onethink_order` VALUES ('2', '29', '5', '20160920214536303', '10.00', '0.00', '9.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '1', null, null, '1474379136');
INSERT INTO `onethink_order` VALUES ('3', '29', '5', '20160920214851225', '10.00', '0.00', '9.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1474379331');
INSERT INTO `onethink_order` VALUES ('4', '32', '4', '20160920214917366', '10.00', '0.00', '9.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1474379357');
INSERT INTO `onethink_order` VALUES ('5', '32', '1', '20160922215010382', '10.00', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1474552210');
INSERT INTO `onethink_order` VALUES ('6', '14', '4', '20160926152552412', '10.00', '0.00', '0.00', '0', '15', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1474874752');
INSERT INTO `onethink_order` VALUES ('7', '16', '4', '2016092715013576', '20.00', '0.00', '0.00', '0', '16', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1474959695');
INSERT INTO `onethink_order` VALUES ('8', '16', '3', '2016092715224974', '40.00', '0.00', '0.00', '0', '16', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1474960969');
INSERT INTO `onethink_order` VALUES ('9', '2', '3', '20160928085939151', '10.00', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1475024379');
INSERT INTO `onethink_order` VALUES ('10', '17', '2', '20160928140313312', '20.00', '0.00', '0.00', '0', '23', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475042593');
INSERT INTO `onethink_order` VALUES ('11', '17', '3', '20160928140707465', '20.00', '0.00', '0.00', '0', '23', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475042827');
INSERT INTO `onethink_order` VALUES ('12', '18', '3', '20160929101240209', '24.00', '0.00', '0.00', '0', '24', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475115160');
INSERT INTO `onethink_order` VALUES ('13', '17', '3', '20160929113303593', '1258.00', '0.00', '0.00', '0', '22', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475119983');
INSERT INTO `onethink_order` VALUES ('14', '17', '1', '20160930083222720', '0.00', '0.00', '0.00', '0', '22', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475195542');
INSERT INTO `onethink_order` VALUES ('15', '16', '1', '20160930085353322', '24.00', '0.00', '0.00', '0', '20', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475196833');
INSERT INTO `onethink_order` VALUES ('16', '16', '3', '20160930093440449', '106.80', '0.00', '0.00', '0', '20', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475199280');
INSERT INTO `onethink_order` VALUES ('17', '16', '1', '20160930102718329', '235.00', '0.00', '0.00', '0', '27', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475202438');
INSERT INTO `onethink_order` VALUES ('18', '16', '3', '20161009101617952', '629.00', '0.00', '0.00', '0', '32', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475979377');
INSERT INTO `onethink_order` VALUES ('19', '16', '3', '20161009101816683', '660.00', '0.00', '0.00', '0', '32', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475979496');
INSERT INTO `onethink_order` VALUES ('20', '16', '0', '20161009103937371', '24.00', '0.00', '0.00', '0', '32', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475980777');
INSERT INTO `onethink_order` VALUES ('21', '16', '0', '20161009103954464', '318.00', '0.00', '0.00', '0', '32', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475980794');
INSERT INTO `onethink_order` VALUES ('22', '16', '1', '20161009111343114', '24.00', '0.00', '0.00', '0', '32', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475982823');
INSERT INTO `onethink_order` VALUES ('23', '19', '1', '20161009120400282', '24.00', '0.00', '0.00', '0', '35', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475985840');
INSERT INTO `onethink_order` VALUES ('24', '16', '1', '20161009135851777', '1320.00', '0.00', '0.00', '0', '36', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1475992731');
INSERT INTO `onethink_order` VALUES ('25', '2', '1', '20161016174349268', '47.80', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1476611029');
INSERT INTO `onethink_order` VALUES ('26', '2', '2', '20161016174425963', '18.90', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1476611065');
INSERT INTO `onethink_order` VALUES ('27', '2', '0', '2016101618035815', '18.90', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1476612238');
INSERT INTO `onethink_order` VALUES ('28', '2', '0', '20161017122711552', '18.90', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1476678431');
INSERT INTO `onethink_order` VALUES ('29', '2', '0', '20161017123004432', '18.90', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1476678604');
INSERT INTO `onethink_order` VALUES ('30', '2', '1', '20161017180853876', '18.90', '0.00', '0.00', '0', '14', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1476698933');
INSERT INTO `onethink_order` VALUES ('31', '20', '3', '20161021092906628', '24.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1477013346');
INSERT INTO `onethink_order` VALUES ('32', '20', '3', '20161021110419428', '0.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1477019059');
INSERT INTO `onethink_order` VALUES ('33', '20', '3', '20161022094430275', '0.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1477100670');
INSERT INTO `onethink_order` VALUES ('34', '20', '3', '2016102209455755', '23.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1477100757');
INSERT INTO `onethink_order` VALUES ('35', '20', '4', '20161024155126454', '47.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1477295486');
INSERT INTO `onethink_order` VALUES ('36', '20', '4', '20161103162927698', '0.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1478161767');
INSERT INTO `onethink_order` VALUES ('37', '20', '4', '20161103163432705', '0.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1478162072');
INSERT INTO `onethink_order` VALUES ('38', '20', '4', '20161103163904449', '316.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1478162344');
INSERT INTO `onethink_order` VALUES ('39', '20', '4', '20161103165707661', '790.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1478163427');
INSERT INTO `onethink_order` VALUES ('40', '20', '4', '2016110319334646', '1264.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1478172826');
INSERT INTO `onethink_order` VALUES ('41', '20', '4', '20161104133143207', '700.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478237503');
INSERT INTO `onethink_order` VALUES ('42', '20', '0', '20161104153403908', '400.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '14', '100.00', null, '0.00', '0', '0', null, null, '1478244843');
INSERT INTO `onethink_order` VALUES ('43', '20', '0', '20161104155434596', '300.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '131', '1.00', null, '0.00', '0', '0', null, null, '1478246074');
INSERT INTO `onethink_order` VALUES ('44', '20', '4', '201611041613135', '200.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478247193');
INSERT INTO `onethink_order` VALUES ('45', '20', '0', '20161104165600692', '1300.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478249760');
INSERT INTO `onethink_order` VALUES ('46', '21', '3', '2016110416561942', '200.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478249779');
INSERT INTO `onethink_order` VALUES ('47', '21', '3', '20161104165807949', '300.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478249887');
INSERT INTO `onethink_order` VALUES ('48', '21', '3', '20161104171725644', '200.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478251045');
INSERT INTO `onethink_order` VALUES ('49', '20', '4', '2016110419414058', '100.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478259700');
INSERT INTO `onethink_order` VALUES ('50', '21', '3', '20161105142917128', '100.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478327357');
INSERT INTO `onethink_order` VALUES ('51', '21', '3', '20161105143033148', '50.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478327433');
INSERT INTO `onethink_order` VALUES ('52', '21', '3', '20161105143140210', '100.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478327500');
INSERT INTO `onethink_order` VALUES ('53', '21', '3', '20161107120044930', '50.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478491244');
INSERT INTO `onethink_order` VALUES ('54', '20', '4', '20161107133621992', '50.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478496981');
INSERT INTO `onethink_order` VALUES ('55', '20', '1', '20161108115450420', '50.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478577290');
INSERT INTO `onethink_order` VALUES ('56', '20', '4', '20161108173427533', '125.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1478597667');
INSERT INTO `onethink_order` VALUES ('57', '21', '3', '20161110184744366', '758.00', '0.00', '0.00', '0', '39', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478774864');
INSERT INTO `onethink_order` VALUES ('58', '21', '3', '201611101959154', '0.00', '0.00', '0.00', '0', '40', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478779155');
INSERT INTO `onethink_order` VALUES ('59', '21', '3', '20161111164446956', '0.00', '0.00', '0.00', '0', '40', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '1', null, null, '1478853886');
INSERT INTO `onethink_order` VALUES ('60', '21', '3', '20161111222834747', '90.00', '0.00', '0.00', '0', '40', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478874514');
INSERT INTO `onethink_order` VALUES ('61', '21', '3', '20161112192952297', '100.00', '0.00', '0.00', '0', '41', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1478950192');
INSERT INTO `onethink_order` VALUES ('62', '21', '3', '20161114094233792', '100.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1479087753');
INSERT INTO `onethink_order` VALUES ('63', '21', '3', '20161117110318828', '180.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '1', '1479351798', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1479351798');
INSERT INTO `onethink_order` VALUES ('64', '21', '3', '20161117111751769', '200.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '1', '1479352719', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1479352671');
INSERT INTO `onethink_order` VALUES ('65', '21', '3', '20161117114334265', '250.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '1', '1479354215', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1479354214');
INSERT INTO `onethink_order` VALUES ('66', '29', '1', '20161117114812770', '300.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '1', '1479354493', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1479354492');
INSERT INTO `onethink_order` VALUES ('67', '29', '3', '20161117140015662', '100.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '1', '1479362416', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1479362415');
INSERT INTO `onethink_order` VALUES ('68', '29', '3', '20161119113007234', '300.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1479526207');
INSERT INTO `onethink_order` VALUES ('69', '29', '3', '20161122120211625', '100.00', '0.00', '0.00', '1', '41', '0', '0.00', '0', '1', '1479787332', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1479787331');
INSERT INTO `onethink_order` VALUES ('70', '29', '4', '20170104133555763', '50.00', '0.00', '0.00', '0', '43', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', '', null, '1483508155');
INSERT INTO `onethink_order` VALUES ('71', '29', '4', '20170107194215605', '50.00', '0.00', '0.00', '0', '43', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', '', null, '1483789335');
INSERT INTO `onethink_order` VALUES ('72', '29', '3', '20170107194902450', '50.00', '0.00', '0.00', '0', '43', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '', null, '1483789742');
INSERT INTO `onethink_order` VALUES ('73', '23', '1', '20170109132726441', '50.00', '0.00', '0.00', '1', '43', '1', '0.00', '0', '1', '1483939647', '0', '0', '0.00', null, '0.00', '0', '0', '', null, '1483939646');
INSERT INTO `onethink_order` VALUES ('74', '23', '1', '20170110145433306', '50.00', '0.00', '0.00', '1', '43', '0', '0.00', '0', '1', '1484031274', '0', '0', '0.00', null, '0.00', '0', '0', '', null, '1484031273');
INSERT INTO `onethink_order` VALUES ('75', '23', '1', '20170110145630638', '50.00', '0.00', '0.00', '1', '43', '2', '0.00', '0', '1', '1484031391', '0', '0', '0.00', null, '0.00', '0', '0', '', null, '1484031390');
INSERT INTO `onethink_order` VALUES ('76', '23', '3', '2017020716275713', '30.00', '0.00', '30.00', '0', '43', '1', '10.00', '0', '1', '1486456078', '0', '0', '0.00', null, '0.00', '0', '0', '', '1486456093', '1486456077');
INSERT INTO `onethink_order` VALUES ('77', '32', '4', '20170207164042746', '100.00', '0.00', '100.00', '1', '43', '1', '0.00', '0', '1', '1486457137', '0', '0', '0.00', null, '0.00', '0', '1', '', '1486457247', '1486456842');
INSERT INTO `onethink_order` VALUES ('78', '32', '0', '20170302171627230', '200.00', '0.00', '0.00', '0', '1', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488446187');
INSERT INTO `onethink_order` VALUES ('79', '32', '0', '20170302172021714', '200.00', '0.00', '0.00', '0', '1', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488446421');
INSERT INTO `onethink_order` VALUES ('80', '32', '0', '20170302183036743', '3.00', '0.00', '3.00', '0', '1', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488450636');
INSERT INTO `onethink_order` VALUES ('102', '38', '5', '20170304153148839', '2.00', '0.00', '2.00', '0', '80', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1488612808', '1488612708');
INSERT INTO `onethink_order` VALUES ('101', '38', '3', '20170304151848274', '1.00', '0.00', '1.00', '0', '80', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, '1488612009', '1488611928');
INSERT INTO `onethink_order` VALUES ('83', '38', '1', '20170303112229177', '2.00', '0.00', '2.00', '1', '80', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '1', null, null, '1488511349');
INSERT INTO `onethink_order` VALUES ('84', '38', '4', '20170303190207370', '1.00', '0.00', '1.00', '1', '80', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1488538927');
INSERT INTO `onethink_order` VALUES ('85', '38', '4', '20170304093558430', '1.00', '0.00', '1.00', '1', '80', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1488591358');
INSERT INTO `onethink_order` VALUES ('86', '38', '3', '2017030409371589', '1.00', '0.00', '1.00', '1', '80', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, '1488604517', '1488591435');
INSERT INTO `onethink_order` VALUES ('87', '38', '4', '20170304094850851', '1.00', '0.00', '1.00', '0', '80', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1488592130');
INSERT INTO `onethink_order` VALUES ('98', '38', '1', '20170304135056321', '1.00', '0.00', '1.00', '1', '80', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '1', null, null, '1488606656');
INSERT INTO `onethink_order` VALUES ('99', '38', '4', '20170304135122378', '1.00', '0.00', '1.00', '0', '80', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1488606682');
INSERT INTO `onethink_order` VALUES ('100', '38', '1', '20170304141824315', '1.00', '0.00', '1.00', '0', '80', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '1', null, null, '1488608304');
INSERT INTO `onethink_order` VALUES ('91', '32', '0', '20170304103325939', '3.00', '0.00', '3.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488594805');
INSERT INTO `onethink_order` VALUES ('92', '32', '0', '20170304103446161', '3.00', '0.00', '3.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488594886');
INSERT INTO `onethink_order` VALUES ('93', '32', '0', '20170304103532197', '3.00', '0.00', '3.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488594932');
INSERT INTO `onethink_order` VALUES ('94', '32', '0', '20170304103631669', '3.00', '0.00', '3.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488594991');
INSERT INTO `onethink_order` VALUES ('95', '32', '0', '20170304103804134', '3.00', '0.00', '3.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488595084');
INSERT INTO `onethink_order` VALUES ('96', '38', '3', '20170304104301878', '1.00', '0.00', '1.00', '1', '80', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1488604618', '1488595381');
INSERT INTO `onethink_order` VALUES ('97', '38', '5', '20170304113220371', '1.00', '0.00', '1.00', '0', '80', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1488604691', '1488598340');
INSERT INTO `onethink_order` VALUES ('103', '37', '4', '20170304175906764', '2.00', '0.00', '2.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488621546');
INSERT INTO `onethink_order` VALUES ('104', '37', '4', '20170306103829533', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488767909');
INSERT INTO `onethink_order` VALUES ('105', '37', '0', '20170306104301137', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488768181');
INSERT INTO `onethink_order` VALUES ('106', '37', '0', '20170306104451165', '2.00', '0.00', '2.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488768291');
INSERT INTO `onethink_order` VALUES ('107', '37', '0', '20170306105037151', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488768637');
INSERT INTO `onethink_order` VALUES ('108', '37', '0', '20170306105311294', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488768791');
INSERT INTO `onethink_order` VALUES ('109', '37', '0', '20170306105418783', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488768858');
INSERT INTO `onethink_order` VALUES ('110', '37', '0', '20170306110706176', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488769626');
INSERT INTO `onethink_order` VALUES ('111', '37', '0', '20170306110737135', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488769657');
INSERT INTO `onethink_order` VALUES ('112', '37', '0', '20170306110800360', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488769680');
INSERT INTO `onethink_order` VALUES ('113', '37', '0', '20170306110950961', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488769790');
INSERT INTO `onethink_order` VALUES ('114', '37', '0', '20170306135141496', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488779501');
INSERT INTO `onethink_order` VALUES ('115', '37', '0', '20170306135326288', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488779606');
INSERT INTO `onethink_order` VALUES ('116', '37', '0', '20170306155228370', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488786748');
INSERT INTO `onethink_order` VALUES ('117', '37', '0', '20170306161306915', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488787986');
INSERT INTO `onethink_order` VALUES ('118', '37', '0', '20170306183742242', '1.00', '0.00', '1.00', '0', '74', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488796662');
INSERT INTO `onethink_order` VALUES ('119', '29', '4', '20170307141406230', '7.00', '0.00', '7.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', '暂无', null, '1488867246');
INSERT INTO `onethink_order` VALUES ('120', '29', '4', '20170307141910182', '1.00', '0.00', '1.00', '1', '45', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', '暂无', null, '1488867550');
INSERT INTO `onethink_order` VALUES ('121', '29', '4', '20170307154651160', '1.00', '0.00', '1.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1488872811');
INSERT INTO `onethink_order` VALUES ('122', '34', '4', '20170307174357290', '1.00', '0.00', '1.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488879837');
INSERT INTO `onethink_order` VALUES ('123', '34', '4', '20170307175318165', '1.00', '0.00', '1.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488880398');
INSERT INTO `onethink_order` VALUES ('124', '34', '1', '20170307175318374', '1.00', '0.00', '1.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488880398');
INSERT INTO `onethink_order` VALUES ('125', '34', '1', '20170307180520650', '1.00', '0.00', '1.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488881120');
INSERT INTO `onethink_order` VALUES ('126', '34', '2', '20170307180611588', '1.00', '0.00', '1.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488881171');
INSERT INTO `onethink_order` VALUES ('127', '34', '5', '20170307181357602', '1.00', '0.00', '1.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488881637');
INSERT INTO `onethink_order` VALUES ('128', '39', '4', '20170308092909897', '1.00', '0.00', '1.00', '0', '0', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1488936549');
INSERT INTO `onethink_order` VALUES ('129', '39', '4', '20170308093431805', '2.00', '0.00', '2.00', '0', '0', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '1488936871');
INSERT INTO `onethink_order` VALUES ('130', '37', '0', '20170308102144299', '1.00', '0.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488939704');
INSERT INTO `onethink_order` VALUES ('131', '39', '0', '20170308111824637', '1.00', '0.00', '1.00', '1', '84', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488943104');
INSERT INTO `onethink_order` VALUES ('132', '39', '0', '2017030811563624', '2.00', '0.00', '2.00', '1', '88', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488945396');
INSERT INTO `onethink_order` VALUES ('133', '39', '0', '20170308120107485', '1.00', '0.00', '1.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488945667');
INSERT INTO `onethink_order` VALUES ('134', '39', '0', '20170308130253493', '1.00', '0.00', '1.00', '1', '88', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488949373');
INSERT INTO `onethink_order` VALUES ('135', '39', '0', '20170308131632280', '1.00', '0.00', '1.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488950192');
INSERT INTO `onethink_order` VALUES ('136', '39', '0', '20170308131716346', '1.00', '0.00', '1.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488950236');
INSERT INTO `onethink_order` VALUES ('137', '32', '0', '20170308135936608', '200.00', '0.00', '200.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488952776');
INSERT INTO `onethink_order` VALUES ('138', '32', '0', '20170308140933535', '150.00', '0.00', '150.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488953373');
INSERT INTO `onethink_order` VALUES ('139', '32', '0', '20170308141109198', '150.00', '0.00', '139.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '160', '11.00', null, '0.00', '0', '0', null, null, '1488953469');
INSERT INTO `onethink_order` VALUES ('140', '32', '0', '20170308141253232', '150.00', '0.00', '50.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', '1', '100.00', '0', '0', null, null, '1488953573');
INSERT INTO `onethink_order` VALUES ('141', '32', '0', '20170308141425459', '150.00', '0.00', '50.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', '1', '100.00', '0', '0', null, null, '1488953665');
INSERT INTO `onethink_order` VALUES ('142', '32', '0', '20170308141709399', '150.00', '0.00', '150.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488953829');
INSERT INTO `onethink_order` VALUES ('143', '32', '0', '20170308141812782', '150.00', '0.00', '130.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', '1', '20.00', '0', '0', null, null, '1488953892');
INSERT INTO `onethink_order` VALUES ('144', '32', '0', '20170308141840234', '150.00', '0.00', '130.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', '1', '20.00', '0', '0', null, null, '1488953920');
INSERT INTO `onethink_order` VALUES ('145', '32', '0', '20170308141957841', '150.00', '0.00', '130.00', '0', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', '1', '20.00', '0', '0', null, null, '1488953997');
INSERT INTO `onethink_order` VALUES ('146', '39', '0', '20170308143120873', '1.00', '0.00', '1.00', '1', '88', '1', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488954680');
INSERT INTO `onethink_order` VALUES ('147', '39', '0', '20170308143445749', '1.00', '0.00', '0.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', '23', '20.00', '0', '0', null, null, '1488954885');
INSERT INTO `onethink_order` VALUES ('148', '39', '0', '20170308143626385', '1.00', '0.00', '0.00', '1', '88', '1', '10.00', '0', '0', '0', '0', '0', '0.00', '24', '20.00', '0', '0', null, null, '1488954986');
INSERT INTO `onethink_order` VALUES ('149', '39', '0', '20170308143757699', '1.00', '0.00', '0.00', '1', '88', '2', '10.00', '0', '0', '0', '0', '154', '5.00', null, '0.00', '0', '0', null, null, '1488955077');
INSERT INTO `onethink_order` VALUES ('150', '39', '0', '20170308143903199', '1.00', '0.00', '1.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488955143');
INSERT INTO `onethink_order` VALUES ('151', '29', '0', '20170308145704779', '11.00', '0.00', '1.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '156', '10.00', null, '0.00', '0', '0', '暂无', null, '1488956224');
INSERT INTO `onethink_order` VALUES ('152', '39', '0', '20170308145601103', '11.00', '0.00', '0.00', '1', '88', '1', '10.00', '0', '0', '0', '0', '0', '0.00', '25', '20.00', '0', '0', null, null, '1488956161');
INSERT INTO `onethink_order` VALUES ('153', '39', '0', '20170308145701990', '11.00', '0.00', '11.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488956221');
INSERT INTO `onethink_order` VALUES ('154', '39', '0', '20170308145957402', '11.00', '0.00', '11.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488956397');
INSERT INTO `onethink_order` VALUES ('155', '39', '0', '20170308150349555', '11.00', '0.00', '6.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '154', '5.00', null, '0.00', '0', '0', null, null, '1488956629');
INSERT INTO `onethink_order` VALUES ('156', '29', '0', '20170308151044882', '11.00', '0.00', '11.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1488957044');
INSERT INTO `onethink_order` VALUES ('157', '39', '0', '20170308151339717', '11.00', '0.00', '11.00', '0', '88', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1488957219');
INSERT INTO `onethink_order` VALUES ('158', '29', '0', '20170308155741337', '12.00', '2.00', '7.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '153', '5.00', null, '0.00', '0', '0', '暂无', null, '1488959861');
INSERT INTO `onethink_order` VALUES ('159', '37', '0', '20170309111718973', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489029438');
INSERT INTO `onethink_order` VALUES ('160', '37', '0', '20170309113050422', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489030250');
INSERT INTO `onethink_order` VALUES ('161', '34', '4', '20170309113417561', '11.00', '1.00', '11.00', '-1', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489030457');
INSERT INTO `onethink_order` VALUES ('162', '37', '0', '20170309114354322', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489031034');
INSERT INTO `onethink_order` VALUES ('163', '37', '0', '20170309114737486', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489031257');
INSERT INTO `onethink_order` VALUES ('164', '37', '0', '20170309115131239', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489031491');
INSERT INTO `onethink_order` VALUES ('165', '34', '4', '201703091151503', '18.00', '8.00', '8.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489031510');
INSERT INTO `onethink_order` VALUES ('166', '37', '0', '20170309133206960', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489037526');
INSERT INTO `onethink_order` VALUES ('167', '37', '0', '20170309133256251', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489037576');
INSERT INTO `onethink_order` VALUES ('168', '37', '0', '20170309133625255', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489037785');
INSERT INTO `onethink_order` VALUES ('169', '37', '0', '20170309133811940', '11.00', '1.00', '1.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489037891');
INSERT INTO `onethink_order` VALUES ('170', '37', '0', '20170309134355561', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489038235');
INSERT INTO `onethink_order` VALUES ('171', '37', '0', '20170309134458365', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489038298');
INSERT INTO `onethink_order` VALUES ('172', '37', '4', '20170309134631793', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489038391');
INSERT INTO `onethink_order` VALUES ('173', '37', '0', '20170309140130258', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489039290');
INSERT INTO `onethink_order` VALUES ('174', '34', '4', '2017030914023735', '11.00', '1.00', '11.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489039357');
INSERT INTO `onethink_order` VALUES ('175', '37', '0', '20170309150230320', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489042950');
INSERT INTO `onethink_order` VALUES ('176', '34', '4', '20170309151111683', '11.00', '1.00', '11.00', '0', '75', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489043471');
INSERT INTO `onethink_order` VALUES ('177', '37', '0', '20170309151824884', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489043904');
INSERT INTO `onethink_order` VALUES ('178', '37', '0', '20170309152831569', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489044511');
INSERT INTO `onethink_order` VALUES ('179', '37', '0', '20170309153355962', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489044835');
INSERT INTO `onethink_order` VALUES ('180', '37', '0', '20170309160958431', '10.00', '0.00', '10.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489046998');
INSERT INTO `onethink_order` VALUES ('181', '37', '0', '20170309170614371', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489050374');
INSERT INTO `onethink_order` VALUES ('182', '37', '4', '20170309170808418', '11.00', '1.00', '11.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489050488');
INSERT INTO `onethink_order` VALUES ('183', '37', '0', '20170309175825504', '10.00', '0.00', '10.00', '0', '81', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489053505');
INSERT INTO `onethink_order` VALUES ('184', '37', '0', '20170310135019987', '11.00', '1.00', '11.00', '1', '81', '2', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125019');
INSERT INTO `onethink_order` VALUES ('185', '37', '0', '20170310135035848', '11.00', '1.00', '11.00', '1', '81', '2', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125035');
INSERT INTO `onethink_order` VALUES ('186', '37', '0', '20170310135059126', '11.00', '1.00', '11.00', '1', '81', '2', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125059');
INSERT INTO `onethink_order` VALUES ('187', '37', '0', '20170310135130158', '11.00', '1.00', '11.00', '1', '81', '2', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125090');
INSERT INTO `onethink_order` VALUES ('188', '37', '0', '2017031013532080', '11.00', '1.00', '11.00', '1', '81', '4', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125200');
INSERT INTO `onethink_order` VALUES ('189', '37', '0', '20170310135947153', '11.00', '1.00', '11.00', '1', '81', '4', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125587');
INSERT INTO `onethink_order` VALUES ('190', '37', '0', '20170310140544654', '50.00', '50.00', '50.00', '0', '81', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125944');
INSERT INTO `onethink_order` VALUES ('191', '37', '0', '20170310140558246', '50.00', '50.00', '50.00', '1', '81', '4', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489125958');
INSERT INTO `onethink_order` VALUES ('192', '37', '0', '20170310140919729', '50.00', '50.00', '50.00', '0', '81', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489126159');
INSERT INTO `onethink_order` VALUES ('193', '37', '0', '20170310141055739', '50.00', '50.00', '50.00', '1', '81', '4', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489126255');
INSERT INTO `onethink_order` VALUES ('194', '37', '0', '2017031014383078', '50.00', '50.00', '0.00', '0', '90', '0', '0.00', '0', '0', '0', '0', '17', '100.00', null, '0.00', '0', '0', null, null, '1489127910');
INSERT INTO `onethink_order` VALUES ('195', '37', '0', '20170310143912442', '50.00', '50.00', '50.00', '0', '90', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489127952');
INSERT INTO `onethink_order` VALUES ('196', '37', '0', '20170310144020744', '50.00', '50.00', '50.00', '0', '90', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489128020');
INSERT INTO `onethink_order` VALUES ('197', '37', '0', '20170310144155607', '50.00', '50.00', '50.00', '0', '90', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489128115');
INSERT INTO `onethink_order` VALUES ('198', '37', '0', '20170310144322735', '50.00', '50.00', '30.00', '0', '90', '0', '0.00', '0', '0', '0', '0', '0', '0.00', '21', '20.00', '0', '0', null, null, '1489128202');
INSERT INTO `onethink_order` VALUES ('199', '37', '0', '20170310174947573', '50.00', '50.00', '30.00', '1', '90', '2', '0.00', '0', '0', '0', '0', '0', '0.00', '17', '20.00', '0', '0', null, null, '1489139387');
INSERT INTO `onethink_order` VALUES ('200', '37', '4', '20170310175016913', '50.00', '50.00', '50.00', '1', '90', '2', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489139416');
INSERT INTO `onethink_order` VALUES ('201', '29', '0', '20170310180232485', '11.00', '0.00', '11.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1489140152');
INSERT INTO `onethink_order` VALUES ('202', '29', '0', '20170310180241858', '11.00', '0.00', '11.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1489140161');
INSERT INTO `onethink_order` VALUES ('203', '29', '0', '20170310180258941', '11.00', '0.00', '11.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1489140178');
INSERT INTO `onethink_order` VALUES ('204', '29', '0', '20170310180330952', '11.00', '0.00', '11.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1489140210');
INSERT INTO `onethink_order` VALUES ('205', '29', '0', '20170310181041237', '11.00', '0.00', '11.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1489140641');
INSERT INTO `onethink_order` VALUES ('206', '29', '0', '20170310184203991', '11.00', '0.00', '11.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1489142523');
INSERT INTO `onethink_order` VALUES ('207', '37', '4', '20170310184618503', '50.00', '50.00', '30.00', '0', '90', '0', '0.00', '0', '0', '0', '0', '0', '0.00', '19', '20.00', '0', '0', null, null, '1489142778');
INSERT INTO `onethink_order` VALUES ('208', '29', '0', '20170310194516978', '43.00', '0.00', '43.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1489146316');
INSERT INTO `onethink_order` VALUES ('209', '1', '0', '', '0.00', '0.00', '0.00', '0', '0', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '0');
INSERT INTO `onethink_order` VALUES ('210', '40', '0', '20170322222', '10.00', '15.00', '10.00', '0', '0', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '1', '0', null, null, '0');
INSERT INTO `onethink_order` VALUES ('211', '40', '1', '20175555555', '15.00', '10.00', '10.00', '0', '0', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '0');
INSERT INTO `onethink_order` VALUES ('212', '40', '5', '1236558888', '12.00', '0.00', '12.00', '0', '0', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '1', null, null, '0');
INSERT INTO `onethink_order` VALUES ('213', '40', '3', '1236666666', '15.00', '15.00', '12.00', '0', '0', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '0');
INSERT INTO `onethink_order` VALUES ('214', '40', '4', '1223333333', '15.00', '15.00', '15.00', '0', '0', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '0');
INSERT INTO `onethink_order` VALUES ('215', '40', '0', '1111111111', '12.00', '12.00', '12.00', '0', '0', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '0');
INSERT INTO `onethink_order` VALUES ('216', '46', '3', '20170313184436193', '11.00', '1.00', '11.00', '0', '100', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1489402017', '1489401876');
INSERT INTO `onethink_order` VALUES ('217', '46', '3', '20170313184849724', '50.00', '50.00', '50.00', '0', '100', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1489402228', '1489402129');
INSERT INTO `onethink_order` VALUES ('218', '46', '3', '20170314094204909', '11.00', '1.00', '11.00', '0', '100', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1489455843', '1489455724');
INSERT INTO `onethink_order` VALUES ('219', '46', '3', '20170314094739525', '11.00', '1.00', '11.00', '0', '100', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1489456158', '1489456059');
INSERT INTO `onethink_order` VALUES ('220', '46', '5', '20170314100555216', '51.00', '51.00', '51.00', '0', '100', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1489457287', '1489457155');
INSERT INTO `onethink_order` VALUES ('221', '40', '0', '20170314104319961', '22.00', '12.00', '12.00', '0', '98', '0', '10.00', '0', '0', '0', '0', '0', '0.00', '43', '10.00', '0', '0', '暂无', null, '1489459399');
INSERT INTO `onethink_order` VALUES ('222', '47', '0', '20170314190942529', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489489782');
INSERT INTO `onethink_order` VALUES ('223', '47', '0', '20170314191027238', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489489827');
INSERT INTO `onethink_order` VALUES ('224', '47', '0', '20170314191136761', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489489896');
INSERT INTO `onethink_order` VALUES ('225', '47', '0', '20170314191223999', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489489943');
INSERT INTO `onethink_order` VALUES ('226', '47', '0', '20170314191317222', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489489997');
INSERT INTO `onethink_order` VALUES ('227', '47', '0', '20170314191444749', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489490084');
INSERT INTO `onethink_order` VALUES ('228', '47', '0', '20170314191912192', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489490352');
INSERT INTO `onethink_order` VALUES ('229', '47', '0', '20170314192020167', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489490420');
INSERT INTO `onethink_order` VALUES ('230', '47', '0', '20170315130358159', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489554238');
INSERT INTO `onethink_order` VALUES ('231', '47', '0', '20170315130724219', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489554444');
INSERT INTO `onethink_order` VALUES ('232', '47', '0', '20170315130855464', '50.00', '50.00', '50.00', '0', '102', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489554535');
INSERT INTO `onethink_order` VALUES ('233', '47', '0', '20170315131121539', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489554681');
INSERT INTO `onethink_order` VALUES ('234', '47', '0', '20170315131440622', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489554880');
INSERT INTO `onethink_order` VALUES ('235', '47', '0', '20170315131716545', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489555036');
INSERT INTO `onethink_order` VALUES ('236', '47', '0', '20170315132012422', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489555212');
INSERT INTO `onethink_order` VALUES ('237', '47', '0', '20170315132208134', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489555328');
INSERT INTO `onethink_order` VALUES ('238', '47', '0', '20170315132259106', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489555379');
INSERT INTO `onethink_order` VALUES ('239', '47', '0', '20170315132506464', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489555506');
INSERT INTO `onethink_order` VALUES ('240', '47', '0', '20170315132908205', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489555748');
INSERT INTO `onethink_order` VALUES ('241', '47', '0', '20170315133252682', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489555972');
INSERT INTO `onethink_order` VALUES ('242', '47', '0', '20170315133426133', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489556066');
INSERT INTO `onethink_order` VALUES ('243', '47', '3', '20170315133517970', '11.00', '1.00', '11.00', '0', '102', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, '1489556510', '1489556117');
INSERT INTO `onethink_order` VALUES ('244', '37', '0', '20170315134822597', '10.00', '0.00', '10.00', '1', '90', '4', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489556902');
INSERT INTO `onethink_order` VALUES ('245', '37', '0', '20170316114536868', '150.00', '150.00', '130.00', '1', '90', '4', '0.00', '0', '0', '0', '0', '0', '0.00', '20', '20.00', '0', '0', null, null, '1489635936');
INSERT INTO `onethink_order` VALUES ('246', '37', '0', '20170316165727967', '10.00', '0.00', '10.00', '0', '90', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489654647');
INSERT INTO `onethink_order` VALUES ('247', '37', '4', '20170316170430368', '500.00', '500.00', '500.00', '1', '90', '1', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489655070');
INSERT INTO `onethink_order` VALUES ('248', '37', '0', '20170316171015240', '10.00', '0.00', '10.00', '0', '90', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1489655415');
INSERT INTO `onethink_order` VALUES ('249', '29', '0', '20170321102725288', '50.00', '50.00', '50.00', '0', '57', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1490063245');
INSERT INTO `onethink_order` VALUES ('250', '29', '4', '20170321103013533', '11.00', '1.00', '0.00', '1', '57', '1', '0.00', '0', '0', '0', '0', '18', '100.00', '28', '20.00', '0', '0', null, null, '1490063413');
INSERT INTO `onethink_order` VALUES ('251', '29', '0', '20170322103747534', '34.00', '24.00', '34.00', '0', '91', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1490150267');
INSERT INTO `onethink_order` VALUES ('252', '29', '0', '20170323112142224', '22.00', '12.00', '22.00', '0', '45', '0', '10.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', '暂无', null, '1490239302');
INSERT INTO `onethink_order` VALUES ('253', '29', '0', '20170329114901251', '108.00', '108.00', '108.00', '0', '91', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1490759341');
INSERT INTO `onethink_order` VALUES ('254', '34', '0', '20170405132641971', '13.00', '3.00', '13.00', '1', '75', '0', '0.00', '0', '0', '0', '0', '0', '0.00', null, '0.00', '0', '0', null, null, '1491370001');

-- ----------------------------
-- Table structure for onethink_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `onethink_order_detail`;
CREATE TABLE `onethink_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `product_num` int(10) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `product_attr` varchar(128) NOT NULL COMMENT '商品属性',
  `product_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `share_user_id` int(11) DEFAULT '0' COMMENT '分享者id',
  `share_money` decimal(10,2) DEFAULT NULL COMMENT '分享金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=264 DEFAULT CHARSET=utf8 COMMENT='订单详细表';

-- ----------------------------
-- Records of onethink_order_detail
-- ----------------------------
INSERT INTO `onethink_order_detail` VALUES ('1', '4', '1', '1', '红色', '10.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('2', '5', '1', '1', '红色', '10.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('3', '6', '1', '1', '红色', '10.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('4', '7', '1', '1', '绿色', '20.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('5', '7', '2', '1', '', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('6', '8', '1', '4', '红色', '10.00', '2', null);
INSERT INTO `onethink_order_detail` VALUES ('7', '9', '1', '1', '红色', '10.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('8', '10', '1', '1', '绿色', '20.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('9', '11', '1', '1', '绿色', '20.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('10', '12', '20', '1', '红色', '24.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('11', '13', '8', '2', '', '629.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('12', '13', '1', '1', '39', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('13', '14', '1', '2', '41', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('14', '15', '20', '1', '红色', '24.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('15', '16', '21', '2', '红色', '18.90', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('16', '16', '19', '3', '红色', '23.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('17', '17', '15', '1', '红色', '235.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('18', '18', '8', '1', '蓝色39', '629.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('19', '19', '8', '1', '红色36', '660.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('20', '20', '20', '1', '红色', '24.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('21', '21', '16', '1', '', '295.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('22', '21', '19', '1', '', '23.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('23', '22', '20', '1', '蓝色', '24.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('24', '23', '20', '1', '红色', '24.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('25', '24', '8', '2', '红色38', '660.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('26', '25', '1', '1', '红色', '10.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('27', '25', '21', '2', '', '18.90', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('28', '26', '21', '1', '', '18.90', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('29', '27', '21', '1', '', '18.90', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('30', '28', '21', '1', '', '18.90', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('31', '29', '21', '1', '', '18.90', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('32', '30', '21', '1', '', '18.90', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('33', '31', '20', '1', '', '24.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('34', '32', '21', '1', '红色中耐克', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('35', '33', '21', '1', '红色大耐克', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('36', '34', '19', '1', '绿色', '23.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('37', '35', '19', '1', '绿色', '23.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('38', '35', '20', '1', '蓝色', '24.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('39', '36', '11', '1', '', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('40', '37', '10', '1', '', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('41', '38', '11', '2', '高', '158.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('42', '39', '11', '5', '高', '158.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('43', '40', '10', '6', '', '158.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('44', '40', '6', '2', '', '158.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('45', '41', '1', '7', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('46', '42', '4', '3', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('47', '42', '1', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('48', '43', '4', '3', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('49', '44', '4', '2', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('50', '45', '1', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('51', '45', '4', '6', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('52', '45', '4', '6', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('53', '46', '4', '2', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('54', '47', '4', '5', '', '20.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('55', '47', '1', '2', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('56', '48', '1', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('57', '48', '5', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('58', '49', '1', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('59', '50', '3', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('60', '51', '1', '1', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('61', '52', '1', '2', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('62', '53', '1', '1', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('63', '54', '3', '1', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('64', '8', '4', '1', '', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('65', '55', '1', '1', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('66', '56', '6', '1', '', '125.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('67', '57', '7', '1', '', '158.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('68', '57', '1', '11', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('69', '57', '2', '1', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('70', '58', '6', '1', '', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('71', '59', '7', '1', '', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('72', '60', '8', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('73', '61', '8', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('74', '62', '7', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('75', '63', '10', '1', '', '80.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('76', '63', '1', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('77', '64', '2', '2', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('78', '65', '6', '1', '', '250.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('79', '66', '4', '3', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('80', '67', '2', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('81', '68', '1', '2', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('82', '68', '2', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('83', '69', '8', '1', '', '100.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('84', '70', '1', '1', '', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('85', '71', '2', '1', '', '50.00', '0', '1.00');
INSERT INTO `onethink_order_detail` VALUES ('86', '72', '4', '1', '', '50.00', '0', '1.00');
INSERT INTO `onethink_order_detail` VALUES ('87', '73', '3', '1', '', '50.00', '0', '1.00');
INSERT INTO `onethink_order_detail` VALUES ('88', '74', '1', '1', '', '50.00', '0', '100.00');
INSERT INTO `onethink_order_detail` VALUES ('89', '75', '1', '1', '', '50.00', '0', '100.00');
INSERT INTO `onethink_order_detail` VALUES ('90', '76', '1', '1', '规格=10只', '20.00', '0', '100.00');
INSERT INTO `onethink_order_detail` VALUES ('91', '77', '1', '2', '', '50.00', '0', '100.00');
INSERT INTO `onethink_order_detail` VALUES ('92', '83', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('93', '83', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('94', '84', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('95', '86', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('96', '95', '18', '3', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('97', '96', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('98', '97', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('99', '98', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('100', '99', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('101', '100', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('102', '101', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('103', '102', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('104', '102', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('105', '103', '18', '2', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('106', '104', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('107', '105', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('108', '106', '18', '2', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('109', '107', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('110', '108', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('111', '109', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('112', '110', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('113', '111', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('114', '112', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('115', '113', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('116', '114', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('117', '115', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('118', '116', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('119', '117', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('120', '118', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('121', '119', '18', '7', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('122', '120', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('123', '121', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('124', '122', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('125', '123', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('126', '124', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('127', '125', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('128', '126', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('129', '127', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('130', '128', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('131', '129', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('132', '129', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('133', '130', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('134', '131', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('135', '132', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('136', '132', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('137', '133', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('138', '134', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('139', '135', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('140', '136', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('141', '137', '2', '4', '颜色=红色', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('142', '138', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('143', '139', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('144', '140', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('145', '141', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('146', '142', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('147', '143', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('148', '144', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('149', '145', '4', '3', '颜色=红色,尺寸=37', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('150', '146', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('151', '147', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('152', '148', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('153', '149', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('154', '150', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('155', '151', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('156', '152', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('157', '153', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('158', '154', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('159', '155', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('160', '156', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('161', '157', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('162', '158', '18', '2', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('163', '159', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('164', '160', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('165', '161', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('166', '162', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('167', '163', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('168', '164', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('169', '165', '18', '8', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('170', '166', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('171', '167', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('172', '168', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('173', '169', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('174', '170', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('175', '171', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('176', '172', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('177', '173', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('178', '173', '8', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('179', '173', '10', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('180', '174', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('181', '175', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('182', '176', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('183', '177', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('184', '178', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('185', '179', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('186', '180', '3', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('187', '181', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('188', '182', '2', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('189', '182', '10', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('190', '182', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('191', '183', '2', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('192', '184', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('193', '185', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('194', '186', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('195', '187', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('196', '188', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('197', '189', '18', '1', '颜色=红色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('198', '190', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('199', '191', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('200', '192', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('201', '193', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('202', '194', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('203', '195', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('204', '196', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('205', '197', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('206', '198', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('207', '199', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('208', '200', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('209', '201', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('210', '202', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('211', '203', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('212', '204', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('213', '205', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('214', '206', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('215', '207', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('216', '208', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('217', '208', '19', '2', '颜色=红色', '16.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('218', '216', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('219', '217', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('220', '218', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('221', '219', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('222', '220', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('223', '220', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('224', '221', '27', '1', '颜色=绿色,尺寸=160', '12.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('225', '222', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('226', '223', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('227', '224', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('228', '225', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('229', '226', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('230', '227', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('231', '228', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('232', '229', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('233', '230', '18', '1', '颜色=红色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('234', '231', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('235', '232', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('236', '233', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('237', '234', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('238', '235', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('239', '236', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('240', '237', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('241', '238', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('242', '239', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('243', '240', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('244', '241', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('245', '242', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('246', '243', '18', '1', '颜色=绿色,尺寸=15', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('247', '244', '3', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('248', '245', '10', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('249', '245', '18', '3', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('250', '246', '2', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('251', '247', '18', '10', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('252', '247', '6', '25', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('253', '247', '2', '3', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('254', '248', '2', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('255', '248', '4', '1', '=', '0.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('256', '249', '18', '1', '颜色=红色,尺寸=12', '50.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('257', '250', '18', '1', '颜色=绿色,尺寸=12', '1.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('258', '251', '19', '2', '颜色=白色', '12.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('259', '252', '26', '1', '尺寸=150,颜色=红色,腰围=蓝色', '12.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('260', '253', '26', '1', '尺寸=150,颜色=红色,腰围=紫色', '12.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('261', '253', '19', '3', '颜色=红色', '16.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('262', '253', '26', '4', '尺寸=150,颜色=红色,腰围=蓝色', '12.00', '0', null);
INSERT INTO `onethink_order_detail` VALUES ('263', '254', '18', '3', '颜色=红色,尺寸=15', '1.00', '0', null);

-- ----------------------------
-- Table structure for onethink_order_refunds
-- ----------------------------
DROP TABLE IF EXISTS `onethink_order_refunds`;
CREATE TABLE `onethink_order_refunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='退款订单详情';

-- ----------------------------
-- Records of onethink_order_refunds
-- ----------------------------
INSERT INTO `onethink_order_refunds` VALUES ('1', 'sf', '18636476679', '77', null, '不喜欢');
INSERT INTO `onethink_order_refunds` VALUES ('2', 'sf', '18636476679', '77', '1488530634', '不喜欢');
INSERT INTO `onethink_order_refunds` VALUES ('3', 'herong', '13702095930', '81', '1488593238', '测试');
INSERT INTO `onethink_order_refunds` VALUES ('4', 'herong', '13702095930', '82', '1488593314', '测试单页的退款');
INSERT INTO `onethink_order_refunds` VALUES ('5', 'herong', '13702095930', '98', '1488608237', '测试退款');
INSERT INTO `onethink_order_refunds` VALUES ('6', 'herong', '13702095930', '98', '1488608240', '测试退款');
INSERT INTO `onethink_order_refunds` VALUES ('7', 'herong', '13702095930', '100', '1488608470', '测试退款');
INSERT INTO `onethink_order_refunds` VALUES ('8', 'herong', '13702095930', '83', '1488611897', 'tuikuan');
INSERT INTO `onethink_order_refunds` VALUES ('9', '侧事故', '15202265146', '2', '1489395947', '发多少发的发但是发');
INSERT INTO `onethink_order_refunds` VALUES ('10', '发多少发', '15202265146', '2', '1489396007', '儿啊第三方地方');
INSERT INTO `onethink_order_refunds` VALUES ('11', '123', '13682077735', '212', '1489396399', '看见了');

-- ----------------------------
-- Table structure for onethink_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `onethink_pay_config`;
CREATE TABLE `onethink_pay_config` (
  `appid` varchar(255) NOT NULL COMMENT '微信appid',
  `appsecret` varchar(255) DEFAULT NULL COMMENT '微信appsecret',
  `mchid` varchar(255) DEFAULT NULL COMMENT '微信商户号',
  `paysignkey` varchar(255) DEFAULT NULL COMMENT '微信支付秘钥',
  `name` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `pid` varchar(255) DEFAULT NULL COMMENT '支付宝pid',
  `key` varchar(255) DEFAULT NULL COMMENT '支付宝支付秘钥',
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付配置信息';

-- ----------------------------
-- Records of onethink_pay_config
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_phone_code
-- ----------------------------
DROP TABLE IF EXISTS `onethink_phone_code`;
CREATE TABLE `onethink_phone_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `pic_code` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COMMENT='短信验证码';

-- ----------------------------
-- Records of onethink_phone_code
-- ----------------------------
INSERT INTO `onethink_phone_code` VALUES ('1', '18636476679', '203630', 'IIKw', '1487228500');
INSERT INTO `onethink_phone_code` VALUES ('5', '18612345679', '123456', null, '1486631157');
INSERT INTO `onethink_phone_code` VALUES ('6', 't', '394753', null, '1487037815');
INSERT INTO `onethink_phone_code` VALUES ('7', 't', '090673', null, '1487038037');
INSERT INTO `onethink_phone_code` VALUES ('8', 't', '311115', null, '1487038201');
INSERT INTO `onethink_phone_code` VALUES ('9', 'p', '030343', null, '1487038354');
INSERT INTO `onethink_phone_code` VALUES ('10', 'p', '045149', null, '1487038423');
INSERT INTO `onethink_phone_code` VALUES ('11', 'p', '381974', null, '1487038436');
INSERT INTO `onethink_phone_code` VALUES ('12', 'p', '883057', null, '1487038450');
INSERT INTO `onethink_phone_code` VALUES ('13', 'p', '221486', null, '1487038509');
INSERT INTO `onethink_phone_code` VALUES ('14', '13512404082', '061402', 'DIeg', '1490063656');
INSERT INTO `onethink_phone_code` VALUES ('15', '18661556660', '684201', null, '1487141960');
INSERT INTO `onethink_phone_code` VALUES ('16', null, null, 'q8qh', '1487143704');
INSERT INTO `onethink_phone_code` VALUES ('17', null, null, 'uevt', '1487144315');
INSERT INTO `onethink_phone_code` VALUES ('18', null, null, 'WEcm', '1487144317');
INSERT INTO `onethink_phone_code` VALUES ('19', null, null, 'Lcnm', '1487144318');
INSERT INTO `onethink_phone_code` VALUES ('20', null, null, 'N6Uy', '1487144347');
INSERT INTO `onethink_phone_code` VALUES ('21', null, null, 'IAj6', '1487144769');
INSERT INTO `onethink_phone_code` VALUES ('22', null, null, 'NR4b', '1487144772');
INSERT INTO `onethink_phone_code` VALUES ('23', null, null, 'RFvW', '1487144773');
INSERT INTO `onethink_phone_code` VALUES ('24', null, null, 'dr4d', '1487144773');
INSERT INTO `onethink_phone_code` VALUES ('25', null, null, 'q6Bb', '1487144773');
INSERT INTO `onethink_phone_code` VALUES ('26', null, null, 's4h4', '1487144773');
INSERT INTO `onethink_phone_code` VALUES ('27', null, null, 'iwbJ', '1487144773');
INSERT INTO `onethink_phone_code` VALUES ('28', null, null, 'mPAz', '1487144773');
INSERT INTO `onethink_phone_code` VALUES ('29', null, null, 'N4C2', '1487144774');
INSERT INTO `onethink_phone_code` VALUES ('30', null, null, 'K42Q', '1487144837');
INSERT INTO `onethink_phone_code` VALUES ('31', null, null, 'Wiyx', '1487144838');
INSERT INTO `onethink_phone_code` VALUES ('32', null, null, '8kS5', '1487144838');
INSERT INTO `onethink_phone_code` VALUES ('33', null, null, 'Jedh', '1487144839');
INSERT INTO `onethink_phone_code` VALUES ('34', null, null, 'sCMS', '1487144840');
INSERT INTO `onethink_phone_code` VALUES ('35', null, null, 'zvW4', '1487144841');
INSERT INTO `onethink_phone_code` VALUES ('36', null, null, 'ckus', '1487144841');
INSERT INTO `onethink_phone_code` VALUES ('37', null, null, 'ur2s', '1487144842');
INSERT INTO `onethink_phone_code` VALUES ('38', null, null, 'RxgB', '1487144842');
INSERT INTO `onethink_phone_code` VALUES ('39', null, null, 'Q4W9', '1487144843');
INSERT INTO `onethink_phone_code` VALUES ('40', null, null, '463g', '1487144844');
INSERT INTO `onethink_phone_code` VALUES ('41', null, null, 'qfQs', '1487144844');
INSERT INTO `onethink_phone_code` VALUES ('42', null, null, 'GaCd', '1487144844');
INSERT INTO `onethink_phone_code` VALUES ('43', null, null, 'id8j', '1487144844');
INSERT INTO `onethink_phone_code` VALUES ('44', null, null, 'gjFs', '1487144845');
INSERT INTO `onethink_phone_code` VALUES ('45', null, null, 'mkD4', '1487144846');
INSERT INTO `onethink_phone_code` VALUES ('46', null, null, 'Jd3C', '1487144847');
INSERT INTO `onethink_phone_code` VALUES ('47', null, null, 'vyLT', '1487144848');
INSERT INTO `onethink_phone_code` VALUES ('48', null, null, 'jzc9', '1487144849');
INSERT INTO `onethink_phone_code` VALUES ('49', null, null, 'z8FH', '1487144849');
INSERT INTO `onethink_phone_code` VALUES ('50', null, null, 'Q8wG', '1487144850');
INSERT INTO `onethink_phone_code` VALUES ('51', null, null, 'aBVD', '1487144850');
INSERT INTO `onethink_phone_code` VALUES ('52', null, null, 'IQFC', '1487144850');
INSERT INTO `onethink_phone_code` VALUES ('53', null, null, 'bpf7', '1487144850');
INSERT INTO `onethink_phone_code` VALUES ('54', null, null, 'A4PU', '1487144851');
INSERT INTO `onethink_phone_code` VALUES ('55', null, null, 'Pgiv', '1487144851');
INSERT INTO `onethink_phone_code` VALUES ('56', null, null, 'zpQp', '1487144851');
INSERT INTO `onethink_phone_code` VALUES ('57', null, null, 'vsme', '1487144852');
INSERT INTO `onethink_phone_code` VALUES ('58', null, null, 'xwWA', '1487144852');
INSERT INTO `onethink_phone_code` VALUES ('59', null, null, 'VnWy', '1487144852');
INSERT INTO `onethink_phone_code` VALUES ('60', null, null, 'fHa9', '1487144853');
INSERT INTO `onethink_phone_code` VALUES ('61', null, null, 'tnKK', '1487144854');
INSERT INTO `onethink_phone_code` VALUES ('62', null, null, '5D3s', '1487144855');
INSERT INTO `onethink_phone_code` VALUES ('63', null, null, 'Jdti', '1487144855');
INSERT INTO `onethink_phone_code` VALUES ('64', null, null, 'qDR2', '1487144856');
INSERT INTO `onethink_phone_code` VALUES ('65', null, null, 'nIJL', '1487144857');
INSERT INTO `onethink_phone_code` VALUES ('66', null, null, 'csTm', '1487144857');
INSERT INTO `onethink_phone_code` VALUES ('67', null, null, 'L93R', '1487144858');
INSERT INTO `onethink_phone_code` VALUES ('68', null, null, '4Vzq', '1487144858');
INSERT INTO `onethink_phone_code` VALUES ('69', null, null, 'H4QK', '1487144859');
INSERT INTO `onethink_phone_code` VALUES ('70', null, null, 'VK5z', '1487144859');
INSERT INTO `onethink_phone_code` VALUES ('71', null, null, 'QTcy', '1487144860');
INSERT INTO `onethink_phone_code` VALUES ('72', null, null, 'DdaG', '1487144860');
INSERT INTO `onethink_phone_code` VALUES ('73', null, null, '8RuQ', '1487144861');
INSERT INTO `onethink_phone_code` VALUES ('74', null, null, 'Ew4W', '1487144861');
INSERT INTO `onethink_phone_code` VALUES ('75', null, null, 'yBWT', '1487144862');
INSERT INTO `onethink_phone_code` VALUES ('76', null, null, 'hWv4', '1487144862');
INSERT INTO `onethink_phone_code` VALUES ('77', null, null, 'aJGV', '1487144863');
INSERT INTO `onethink_phone_code` VALUES ('78', null, null, 'q3xW', '1487144863');
INSERT INTO `onethink_phone_code` VALUES ('79', null, null, '5m3d', '1487144864');
INSERT INTO `onethink_phone_code` VALUES ('80', null, null, 'CtE6', '1487144864');
INSERT INTO `onethink_phone_code` VALUES ('81', null, null, 'ze9R', '1487144865');
INSERT INTO `onethink_phone_code` VALUES ('82', null, null, 'smWr', '1487144865');
INSERT INTO `onethink_phone_code` VALUES ('83', null, null, '2GAx', '1487144865');
INSERT INTO `onethink_phone_code` VALUES ('84', null, null, 'fyzm', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('85', null, null, 'jwTE', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('86', null, null, '73mu', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('87', null, null, 'Ve4e', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('88', null, null, 'quj5', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('89', null, null, 'FrTq', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('90', null, null, 'TzVz', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('91', null, null, 'pNUE', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('92', null, null, 'DpEm', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('93', null, null, 'Vncj', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('94', null, null, 'UurQ', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('95', null, null, '9kQ4', '1487144866');
INSERT INTO `onethink_phone_code` VALUES ('96', null, null, 'WJ4R', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('97', null, null, '3Vwg', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('98', null, null, 'VzFP', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('99', null, null, 'Hwhx', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('100', null, null, 'c795', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('101', null, null, 'rSzt', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('102', null, null, 'A2zB', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('103', null, null, 'si9q', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('104', null, null, 'j33v', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('105', null, null, 'CDzS', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('106', null, null, '6Unr', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('107', null, null, 'uVu8', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('108', null, null, 'h8bW', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('109', null, null, 'bR9A', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('110', null, null, 'fCSs', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('111', null, null, 'P4hs', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('112', null, null, 'bE42', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('113', null, null, 'n8hS', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('114', null, null, 'xx8s', '1487144867');
INSERT INTO `onethink_phone_code` VALUES ('115', null, null, 'd3yU', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('116', null, null, 'JpVj', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('117', null, null, 'xnHm', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('118', null, null, 'pBVD', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('119', null, null, 'p7ym', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('120', null, null, 'Q2NW', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('121', null, null, 'AuSj', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('122', null, null, 'HkeD', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('123', null, null, '8UkW', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('124', null, null, 'u4jc', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('125', null, null, 'q3sA', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('126', null, null, 'iCjk', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('127', null, null, '2xS4', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('128', null, null, 'NK9W', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('129', null, null, 'abnW', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('130', null, null, 'baWv', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('131', null, null, 'Mhnu', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('132', null, null, 'nGF8', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('133', null, null, 'GGvg', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('134', null, null, 'URj2', '1487144868');
INSERT INTO `onethink_phone_code` VALUES ('135', null, null, 'Ltp7', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('136', null, null, 'Ndzi', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('137', null, null, 'cQLp', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('138', null, null, 'RnQU', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('139', null, null, '4zgJ', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('140', null, null, 'aVKW', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('141', null, null, 'LEhi', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('142', null, null, 'q7jL', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('143', null, null, 'piIA', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('144', null, null, 'PduR', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('145', null, null, 'jA25', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('146', null, null, 'eiwT', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('147', null, null, 'MRd9', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('148', null, null, 'Ww47', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('149', null, null, 'djVH', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('150', null, null, 'gndR', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('151', null, null, 'rCse', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('152', null, null, 'Agzj', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('153', null, null, 'pN6i', '1487144869');
INSERT INTO `onethink_phone_code` VALUES ('154', null, null, 'uR55', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('155', null, null, 'DA33', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('156', null, null, 'fUvV', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('157', null, null, 'AEum', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('158', null, null, 'sEHf', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('159', null, null, 'UePV', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('160', null, null, 'fzGH', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('161', null, null, 'phPI', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('162', null, null, 'WhqM', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('163', null, null, 'FJwQ', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('164', null, null, 'jeFe', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('165', null, null, 'DgWk', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('166', null, null, 'KxtJ', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('167', null, null, 'IBxP', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('168', null, null, 'W9Rt', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('169', null, null, 'smw3', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('170', null, null, 'McKw', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('171', null, null, '9akf', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('172', null, null, 'NNIt', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('173', null, null, 's8Dk', '1487144870');
INSERT INTO `onethink_phone_code` VALUES ('174', null, null, 'Fp74', '1487144871');
INSERT INTO `onethink_phone_code` VALUES ('175', null, null, 'kWem', '1487144871');
INSERT INTO `onethink_phone_code` VALUES ('176', null, null, 'zEIm', '1487144871');
INSERT INTO `onethink_phone_code` VALUES ('177', null, null, 'KyJx', '1487144871');
INSERT INTO `onethink_phone_code` VALUES ('178', '15222898621', '291282', '3La9', '1487842397');
INSERT INTO `onethink_phone_code` VALUES ('179', '13702095930', '227303', 'WsKJ', '1491615192');
INSERT INTO `onethink_phone_code` VALUES ('180', '13702295930', null, 'IeCz', '1487234431');
INSERT INTO `onethink_phone_code` VALUES ('181', '15202265146', '675907', 'JWAP', '1487571168');
INSERT INTO `onethink_phone_code` VALUES ('182', '15302125953', '772850', 'CFi8', '1487643867');
INSERT INTO `onethink_phone_code` VALUES ('183', '13702095930', '227303', 'WsKJ', '1491615192');
INSERT INTO `onethink_phone_code` VALUES ('184', '15022603502', '889922', 'cwkv', '1487643722');
INSERT INTO `onethink_phone_code` VALUES ('185', '111', null, 'dx92', '1487581782');
INSERT INTO `onethink_phone_code` VALUES ('186', '11', null, 'S7WH', '1487581891');
INSERT INTO `onethink_phone_code` VALUES ('187', '18722436859', '622849', 'qcau', '1489471945');
INSERT INTO `onethink_phone_code` VALUES ('188', '15222898622', '079679', 'KMkr', '1487666567');
INSERT INTO `onethink_phone_code` VALUES ('189', '13682077735', '366782', 'pvh8', '1489045055');
INSERT INTO `onethink_phone_code` VALUES ('190', '15565797107', '696070', 'tbWi', '1489985842');

-- ----------------------------
-- Table structure for onethink_picture
-- ----------------------------
DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=331 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_picture
-- ----------------------------
INSERT INTO `onethink_picture` VALUES ('1', '/Uploads/Picture/2016-07-05/577b5b6fb1989.jpg', '', '8941bd44c4ec79c02a948ab9e6b7d2b7', '0fe3b0d6870e1c4c860b3136c2c314043160eb7d', '1', '1467702127');
INSERT INTO `onethink_picture` VALUES ('2', '/Uploads/Picture/2016-07-05/577b5c4022df3.jpg', '', '1fb4ec0a2ebcaeec447f4e838ff14b14', '7365e9b6c9ce7477003b9cddf78c2524c807084b', '1', '1467702336');
INSERT INTO `onethink_picture` VALUES ('3', '/Uploads/Picture/2016-07-05/577b5c64a0f23.jpg', '', 'dd9c89848a7c7b60664fd371ababb5de', 'f45383abef0697f92009937328bbe238c086d36c', '1', '1467702372');
INSERT INTO `onethink_picture` VALUES ('4', '/Uploads/Picture/2016-07-05/577b5e9c782ce.jpg', '', '34b98373a4f48ea862408216756e319b', '6f9790b084fd3eb96976e666fdf90e1d0bea2807', '1', '1467702940');
INSERT INTO `onethink_picture` VALUES ('5', '/Uploads/Picture/2016-07-05/577b5e9f13d56.jpg', '', 'c6d1873e3ef1114b222b543258e86c70', '6196be198b507381113f5de89a2e892e99d6d832', '1', '1467702942');
INSERT INTO `onethink_picture` VALUES ('6', '/Uploads/Picture/2016-07-05/577b7f4496112.png', '', '2d7b74ddafa5cf2d9534344485a564eb', 'd7e60d207f1e5f7e528964aeb112410a8efa103f', '1', '1467711300');
INSERT INTO `onethink_picture` VALUES ('7', '/Uploads/Picture/2016-07-05/577b7f4871b0a.png', '', 'af8c1e172d103851fb0ae5f53192786c', '2d334af1f1a1ff85262228c2b6f0750258e37a02', '1', '1467711304');
INSERT INTO `onethink_picture` VALUES ('8', '/Uploads/Picture/2016-07-05/577b7f4b7327a.png', '', '010a7f7bdb90f2eee79da930f5bcbd79', '7d1c6dbc424efb36de9913d781eff99a65590787', '1', '1467711307');
INSERT INTO `onethink_picture` VALUES ('9', '/Uploads/Picture/2016-07-05/577b7f5059082.png', '', 'c2c86a4ebd4ea2d1358b807d44db4c12', '4dac2abae7b867881d5848c5952deb0c3cc23963', '1', '1467711312');
INSERT INTO `onethink_picture` VALUES ('10', '/Uploads/Picture/2016-07-08/577f435acb4d1.png', '', '20d39f1301cfdb76f5dc5b0e2459ec2f', '77ea32319aaf59e8b601b699d7d7dad4784e0d4d', '1', '1467958106');
INSERT INTO `onethink_picture` VALUES ('11', '/Uploads/Picture/2016-07-09/578061538f111.png', '', 'd0d34f8f6c1d8904c11da3fc4cbfcf5f', 'bd81e92965f096a120440047cf9feaeee53b99d3', '1', '1468031315');
INSERT INTO `onethink_picture` VALUES ('12', '/Uploads/Picture/2016-07-18/578cb4c51567f.png', '', '4fa258262ec458899bb6d8ab542fe561', 'c39e595a1623181ee1c7754dffa1c6ef336df666', '1', '1468839108');
INSERT INTO `onethink_picture` VALUES ('13', '/Uploads/Picture/2016-07-19/578de92488e46.jpg', '', '02264251aeb88ca5ab424af401293033', '99962c5ff7f8b2caadbd29dd6a52b4c5a4ffb5bb', '1', '1468918052');
INSERT INTO `onethink_picture` VALUES ('14', '/Uploads/Picture/2016-07-19/578de94a144ad.jpg', '', 'e88bfca644f0c49e22560b59bcc12e44', '0c8a8ef44455da761f76401e5d024b905d383d4e', '1', '1468918089');
INSERT INTO `onethink_picture` VALUES ('15', '/Uploads/Picture/2016-07-26/5797096732c30.png', '', '48709c7f2fe9e1081c7307564a2bc68e', '8131fb7d4f2f843487a200fb2ae0ca2558500a45', '1', '1469516135');
INSERT INTO `onethink_picture` VALUES ('16', '/Uploads/Picture/2016-07-26/57970969b8977.jpg', '', '5b3056c8f754dccc17aac419721b40ff', 'f33611878409be09d90b3393ea54c316ae999d1f', '1', '1469516137');
INSERT INTO `onethink_picture` VALUES ('17', '/Uploads/Picture/2016-08-16/57b2b9285b60f.jpg', '', '6996abd6e20f5c4e1c8144ad7fa1df41', '133392797b3e4e5820b1802622e3b2e801ec9749', '1', '1471330600');
INSERT INTO `onethink_picture` VALUES ('18', '/Uploads/Picture/2016-08-16/57b2c9afc5de2.jpg', '', 'ec79e1f9b638888fb9937d9d64e2563e', '3515d45cac32fab09a268028e87e49b08b0f9e59', '1', '1471334831');
INSERT INTO `onethink_picture` VALUES ('19', '/Uploads/Picture/2016-08-16/57b2d53d5b425.gif', '', '2ed82b2f37988a554ffd11caf31e7c9f', 'aefb00d82b62c18cd4590612179af0831da8cdf1', '1', '1471337789');
INSERT INTO `onethink_picture` VALUES ('20', '/Uploads/Picture/2016-08-16/57b2e832dbaff.png', '', '04c74e6c8e26f02334be593cf97993ab', 'da6f3a25d2e7216d36fd0f02a772d8dcdb8c37b0', '1', '1471342642');
INSERT INTO `onethink_picture` VALUES ('21', '/Uploads/Picture/2016-08-16/57b2e8786b4c7.png', '', '8e783eb653dc0d09689eb593e56bf3eb', '98de8583ec45a526e78a3cf67e95c35ceecabef0', '1', '1471342712');
INSERT INTO `onethink_picture` VALUES ('22', '/Uploads/Picture/2016-08-17/57b3b65d20b73.png', '', '84f3eaa91144aace3caa1933f01e0c09', 'ea07f3f7392cd29bda644fa16c38be3d41fb4025', '1', '1471395420');
INSERT INTO `onethink_picture` VALUES ('23', '/Uploads/Picture/2016-08-17/57b3bdd996ec3.png', '', '469e5a5b16835515823f27c91daad7ac', '9afa6e48b5b59367ee640e797a221cd06db38787', '1', '1471397337');
INSERT INTO `onethink_picture` VALUES ('24', '/Uploads/Picture/2016-08-17/57b3c4bdf2de3.png', '', 'd07a4d13b506f72cb9176437b28465ea', '1484bd17842c99e9798ff4c50396bee88d5d3932', '1', '1471399101');
INSERT INTO `onethink_picture` VALUES ('25', '/Uploads/Picture/2016-08-17/57b3cbe154d1c.png', '', '00eb91b9cc109d80d4566aaedafc2e46', 'f3c8085e5e5eeb4e73f9a31d8ff79904a1f1914b', '1', '1471400928');
INSERT INTO `onethink_picture` VALUES ('26', '/Uploads/Picture/2016-08-17/57b3e22e56072.jpg', '', 'c6bf687370b9129c82171174b45f6a02', 'bb691470c2246b33c1aeb3aaa7830fd0d3c00d90', '1', '1471406638');
INSERT INTO `onethink_picture` VALUES ('27', '/Uploads/Picture/2016-08-17/57b41090d7240.png', '', '797b954e8c38d1b0ac64f98e6721f3f5', 'ea295f060d6515875450e128f3b6ecf25b37d9bd', '1', '1471418512');
INSERT INTO `onethink_picture` VALUES ('28', '/Uploads/Picture/2016-08-17/57b41095f11f2.jpg', '', '6acdc52801d528ebf057e7e12c9bfe33', 'c5c91b663ec14d925ffd5b44ed8230ea05ab07ad', '1', '1471418517');
INSERT INTO `onethink_picture` VALUES ('29', '/Uploads/Picture/2016-08-17/57b41d0abe925.jpg', '', '76a4155757112d493e607fce8c59c029', '8d264bb268da2805d64acdd6bc3863b4e90a96f6', '1', '1471421706');
INSERT INTO `onethink_picture` VALUES ('30', '/Uploads/Picture/2016-08-17/57b4278b228c4.png', '', '914c7a08c03e40c934ad385a290fafde', 'dde25d045344aca3d0e8a5cccceb5b38ab7cee0e', '1', '1471424394');
INSERT INTO `onethink_picture` VALUES ('31', '/Uploads/Picture/2016-08-19/57b69eef25a75.png', '', '97692682395de68885893ebcb4c18828', '73025580951e46e651b4bad6c8030e778a04c1b0', '1', '1471586030');
INSERT INTO `onethink_picture` VALUES ('32', '/Uploads/Picture/2016-08-19/57b69ef2e41aa.png', '', '2b832ca8428ee36de184594ff9f11daa', '49e0e8a1388bf7fe04a8c5cf396aef41000a4bfc', '1', '1471586034');
INSERT INTO `onethink_picture` VALUES ('33', '/Uploads/Picture/2016-09-10/57d3bac5d7ba4.jpg', '', 'ef91c26da9d6f5f27feb6068f96b17e6', 'a535ad8afce390e272a1ddd0a243928091b0ac82', '1', '1473493701');
INSERT INTO `onethink_picture` VALUES ('34', '/Uploads/Picture/2016-09-10/57d3badcc169c.jpg', '', 'd6899eb7fe205fcb9d7bc0044d158674', 'cd4f1f43ab9f1a077bd779830eb751c90f5bfa70', '1', '1473493724');
INSERT INTO `onethink_picture` VALUES ('35', '/Uploads/Picture/2016-09-10/57d3e6acb8150.jpg', '', 'a5df131de3afaebf57346ce2e2ccc50a', '56f741584ad4099bd4dc8a1d7b753fb961366f11', '1', '1473504940');
INSERT INTO `onethink_picture` VALUES ('36', '/Uploads/Picture/2016-09-10/57d3e6e397c20.jpg', '', '26b8d2c1d28f48deb93d96f7fc8974c5', 'a2ec96762f703e44ac2ee6194f0be5cb049301f1', '1', '1473504995');
INSERT INTO `onethink_picture` VALUES ('37', '/Uploads/Picture/2016-09-10/57d3e6efb9a50.jpg', '', '617dd1095a545a5d05b720c0caf337f5', '9d483b8048d2cfb4edd3fac3f22a266071454bde', '1', '1473505007');
INSERT INTO `onethink_picture` VALUES ('38', '/Uploads/Picture/2016-09-10/57d3e79e75622.jpg', '', 'fd6fe83c3200514250fc8bdab97e8f28', '217fcf1d070e17961573b09f2a75ddedd272e666', '1', '1473505182');
INSERT INTO `onethink_picture` VALUES ('39', '/Uploads/Picture/2016-09-10/57d3e82b3b2e2.jpg', '', 'bc71dd944c33b750c058b8d563b2869d', '8cf6ea0d9a1adf17df83b86c23fef253fbf8d645', '1', '1473505323');
INSERT INTO `onethink_picture` VALUES ('40', '/Uploads/Picture/2016-09-10/57d3e83da01ba.jpg', '', 'b6b1c2aa675ad9ded82cb2cbe0fb32c0', '51f0e462763ea9aeabec71c88c45f56733c5bccd', '1', '1473505341');
INSERT INTO `onethink_picture` VALUES ('41', '/Uploads/Picture/2016-09-10/57d3e87449253.jpg', '', 'd523ebff626404b0174d406124ad6cd7', '1428b209ac6fd80c29c39257c5940d59c0091874', '1', '1473505396');
INSERT INTO `onethink_picture` VALUES ('42', '/Uploads/Picture/2016-09-10/57d3e88b68b03.jpg', '', '9f86b49eb7a40a3fe6b60def6eee8c1c', '90c8bcfb4432efeca19119b094f2e14adb97f493', '1', '1473505419');
INSERT INTO `onethink_picture` VALUES ('43', '/Uploads/Picture/2016-09-10/57d3e8f73e033.jpg', '', '1e3552db7e633f797dc3408cbf792c03', '471732e9a20c008bc2c6eacf5772d4b0a9dc89dd', '1', '1473505527');
INSERT INTO `onethink_picture` VALUES ('44', '/Uploads/Picture/2016-09-10/57d3e9a861f33.jpg', '', '8cdece9d54db297c7b7d7d08eaced39d', 'c5cf351fdd12925aec2d4f8946c63f8024d97d20', '1', '1473505704');
INSERT INTO `onethink_picture` VALUES ('45', '/Uploads/Picture/2016-09-10/57d3f2a45e7bd.png', '', '3e872426509e61e9e65d0e170c9262ae', '2664d9e3f79aac4f762f30aaa2d91a00c592b35d', '1', '1473508004');
INSERT INTO `onethink_picture` VALUES ('46', '/Uploads/Picture/2016-09-10/57d3f2b8b90f5.png', '', '4067d7160883f89764c3f130aabe15fd', 'b388f99ce560ba66ac023f1337b013872428efb6', '1', '1473508024');
INSERT INTO `onethink_picture` VALUES ('47', '/Uploads/Picture/2016-09-10/57d3f2ca01f45.png', '', '64e7051d61acc806e60df0bd8a075442', '00d77e58420d94b28b42048cc0a1124203d180b4', '1', '1473508041');
INSERT INTO `onethink_picture` VALUES ('48', '/Uploads/Picture/2016-09-10/57d3f2d64c2c5.png', '', '9223c4f9a698fa8f8fadbbff411da0b7', 'd376855c969025f32d91ac51a60bdfc267ddaf5b', '1', '1473508054');
INSERT INTO `onethink_picture` VALUES ('49', '/Uploads/Picture/2016-09-10/57d418009152b.jpg', '', 'afd84820ec2f5b0f40842c65647ecbdf', '20d20739a852e61d1f1d4d7c66375dc936e1ea50', '1', '1473517568');
INSERT INTO `onethink_picture` VALUES ('50', '/Uploads/Picture/2016-09-11/57d4369d7b8bb.png', '', '8c12c08e73d2721a3c5a2fefa7fcab27', '80fffe84157297538fe695256f5f72831a4ef42f', '1', '1473525405');
INSERT INTO `onethink_picture` VALUES ('51', '/Uploads/Picture/2016-09-26/57e8cf65ebb7a.png', '', '556a124dd677bb72695f67daafaf9710', 'f8b0a09e2750fee303ea61ecc63a274a4fbade33', '1', '1474875237');
INSERT INTO `onethink_picture` VALUES ('52', '/Uploads/Picture/2016-09-26/57e8cf693be30.png', '', '27c6939686438c2fe009a78463cb6472', '47e29fc764615db24fc9c0426de72d2960745cf1', '1', '1474875241');
INSERT INTO `onethink_picture` VALUES ('53', '/Uploads/Picture/2016-09-28/57eb63981af0e.jpg', '', '5aaef44172349179de2a3d57444d8bde', '0db26d2e71e5e767c9f5e35bb92f213f764cc96d', '1', '1475044247');
INSERT INTO `onethink_picture` VALUES ('54', '/Uploads/Picture/2016-09-28/57eb639b5c5f7.jpg', '', 'd23805e5ff6c8559b98ed6b15dcf818f', '64f91c1684c0f286394f81bb7ba6cef0e7d4515b', '1', '1475044251');
INSERT INTO `onethink_picture` VALUES ('55', '/Uploads/Picture/2016-09-28/57eb63b53ed89.jpg', '', '62b8dbb213d4f00723f27aecc5ebec0f', 'd610b681d49f56395476752cba2e36d043fc2adf', '1', '1475044276');
INSERT INTO `onethink_picture` VALUES ('56', '/Uploads/Picture/2016-09-28/57eb63b6de65d.jpg', '', 'f0396612c6dd2df6e538434fb15a9bca', '033756cc161d6ab2a93db84f703d3099642d2af8', '1', '1475044277');
INSERT INTO `onethink_picture` VALUES ('57', '/Uploads/Picture/2016-09-28/57eb63b955b9d.jpg', '', 'a66004aa19abdde0b3c517b02ea58b9a', 'c58950d800269cff92533a83c4efd9214d1622ff', '1', '1475044278');
INSERT INTO `onethink_picture` VALUES ('58', '/Uploads/Picture/2016-09-28/57eb6ce889553.png', '', 'd9f9bfb7c3bcd17f2a8290f148173f01', '2aafd37ddd9d226c3964f7700175839c5c4469e9', '1', '1475046632');
INSERT INTO `onethink_picture` VALUES ('59', '/Uploads/Picture/2016-09-28/57eb6ceec0326.png', '', '2d585306bbd9a7d2308c23b5ec23e749', '5729691f5bb71b6816683b98808533016a4f981f', '1', '1475046638');
INSERT INTO `onethink_picture` VALUES ('60', '/Uploads/Picture/2016-09-28/57eb6e9940543.png', '', '79290a6f5466b1ffda51149e907b75b4', '5a63a04b5f21b8d3d5c54d07ee343e20d9a3655d', '1', '1475047065');
INSERT INTO `onethink_picture` VALUES ('61', '/Uploads/Picture/2016-09-28/57eb6ea30ce4d.png', '', '18d9d3e5729e3ae0012a4122e6cb29b7', '8e376b1388b89dcc8f360f7d7f1e3b56135216a2', '1', '1475047074');
INSERT INTO `onethink_picture` VALUES ('62', '/Uploads/Picture/2016-09-28/57eb6f71a0082.png', '', '8582c224c3026c23e871fc0016beb5e0', '1eb2e78aac581012d7776cd0ed498e2332e58365', '1', '1475047281');
INSERT INTO `onethink_picture` VALUES ('63', '/Uploads/Picture/2016-09-28/57eb6f794d49a.png', '', 'a6707676569e9cfd15074df7eb6d2ed0', 'c50faef5b2a2ee26c40ddb3a40dc115c48f8c9fd', '1', '1475047287');
INSERT INTO `onethink_picture` VALUES ('64', '/Uploads/Picture/2016-09-28/57eb70f0ed4bf.png', '', '2e9bbe38795d710f470b0d75bf2689b5', '7b5cd1d6640bcba18cc7c3239a174588d076387f', '1', '1475047652');
INSERT INTO `onethink_picture` VALUES ('65', '/Uploads/Picture/2016-09-28/57eb70fe8da51.png', '', 'b2c61fdfb05f6349348ba068c1c91459', '0e29e334a8d544d1da0a2156271e8cd7dc86099f', '1', '1475047675');
INSERT INTO `onethink_picture` VALUES ('66', '/Uploads/Picture/2016-09-28/57eb7217ab352.png', '', '2f8c82104aa789f8d0c9c3640cef73ae', 'beac5409b14d8ca6f764a82606837f96420796f7', '1', '1475047959');
INSERT INTO `onethink_picture` VALUES ('67', '/Uploads/Picture/2016-09-28/57eb721ca4f5b.png', '', 'cf435918ef90da6e16e6fe83fd4466fa', '9725c55f5c107ae0b11e2b139389828475de318b', '1', '1475047964');
INSERT INTO `onethink_picture` VALUES ('68', '/Uploads/Picture/2016-09-28/57eb72ad56ede.png', '', 'cfc4b6610620aa34b4298734b2f86b32', '7cd94e4d9044a1844ff68ca5a8d00b78f7712524', '1', '1475048109');
INSERT INTO `onethink_picture` VALUES ('69', '/Uploads/Picture/2016-09-28/57eb72b48d6e0.png', '', 'bd9374ba10f28c95a49e023d37e3b18a', 'af946c378f7367be74d201d44ca16496a325bfc7', '1', '1475048116');
INSERT INTO `onethink_picture` VALUES ('70', '/Uploads/Picture/2016-09-28/57eb72b4e4651.png', '', '8e62061bef7edcce89945ed67e69d21c', 'a0d214f2518ff6c2fa9e0fd781bd7a8345833ec5', '1', '1475048116');
INSERT INTO `onethink_picture` VALUES ('71', '/Uploads/Picture/2016-09-28/57eb72b516e09.png', '', '6b1c066b7fc767e29eab6e80bbfedaf7', '8838adaec5b582c47042945dc905f78e14c92e5e', '1', '1475048116');
INSERT INTO `onethink_picture` VALUES ('72', '/Uploads/Picture/2016-09-28/57eb72b53eb74.png', '', '1968601f75b0d61bed42be25cda3550e', 'd6c613ab98d3e686ce3e29b50803d7ae76cf629e', '1', '1475048117');
INSERT INTO `onethink_picture` VALUES ('73', '/Uploads/Picture/2016-09-28/57eb75a082346.png', '', '45139005019fdfd4ec2dfffa14ad83cd', 'b88be23fa4135dcc52bd9abbb564e7536b8d744a', '1', '1475048864');
INSERT INTO `onethink_picture` VALUES ('74', '/Uploads/Picture/2016-09-28/57eb75afe8590.png', '', 'aa6249ad42e293457e565d864b488ede', 'f2dd09f51aa4e05f7c94f836f0a1ab6be2154925', '1', '1475048879');
INSERT INTO `onethink_picture` VALUES ('75', '/Uploads/Picture/2016-09-28/57eb760fb70fb.png', '', '4b2d4f5cc77d622401fc206c704fe343', 'da84259bb636ac18dd7d9a2fcf05f9614fb64cd8', '1', '1475048975');
INSERT INTO `onethink_picture` VALUES ('76', '/Uploads/Picture/2016-09-28/57eb7614e93df.png', '', '75afd4bddf6824f8a11230e755f9264d', '500557a62f2cc7a8fedfbd382436d9bb94d60b6c', '1', '1475048980');
INSERT INTO `onethink_picture` VALUES ('77', '/Uploads/Picture/2016-09-28/57eb782c5b426.jpg', '', 'bfe0be39207e0b15605368ddee562a08', '8bc4f3e4df8b89b3b6b32bb55712038e59cf3faf', '1', '1475049513');
INSERT INTO `onethink_picture` VALUES ('78', '/Uploads/Picture/2016-09-28/57eb784005ec8.jpg', '', '89f9c131afcdc0eb75098b6f6a464996', '1a8a13e6f91fceacb51d4d0fca1d1c7ff93da181', '1', '1475049534');
INSERT INTO `onethink_picture` VALUES ('79', '/Uploads/Picture/2016-09-28/57eb78dc5b6ab.png', '', '08b04dbd9d5069f278312b436da32681', '41b42d8538ed0225c6138992dbd4ba76bc5d15c7', '1', '1475049692');
INSERT INTO `onethink_picture` VALUES ('80', '/Uploads/Picture/2016-09-28/57eb78e1bace7.png', '', '22687c7148ab794e8f55b7d90ecb65e8', '135415f92e9b923892ad4d1865b07bd23efef0f6', '1', '1475049697');
INSERT INTO `onethink_picture` VALUES ('81', '/Uploads/Picture/2016-09-28/57eb796e3a76a.png', '', '35864224b680c2f83c0931709b43328a', '522b601ff6576a02af52ba168ab1fadbc4060480', '1', '1475049838');
INSERT INTO `onethink_picture` VALUES ('82', '/Uploads/Picture/2016-09-28/57eb7a2fe93e9.jpg', '', '77638842ca815a6326082c60931b7d2e', 'bfbd9814e676c873ee32db8184de569b93950e2f', '1', '1475050031');
INSERT INTO `onethink_picture` VALUES ('83', '/Uploads/Picture/2016-09-28/57eb7a34d8b9a.jpg', '', 'bdfaedb90051a727b96d6307043ad655', 'c0dcc406b14e0d91ec88ca7ab05899887e6cb450', '1', '1475050036');
INSERT INTO `onethink_picture` VALUES ('84', '/Uploads/Picture/2016-09-28/57eb7b14255b1.png', '', 'b9c9045a491e95cdd4e8e50201b7f2c3', '487baf18742458383fa4744980956da1f3538e8f', '1', '1475050259');
INSERT INTO `onethink_picture` VALUES ('85', '/Uploads/Picture/2016-09-28/57eb7b19a6679.png', '', '7157b4a1eb0ff1c12143770fbbdcab9b', '804abe6addc5f730578f0571ef8d82274eca87cc', '1', '1475050265');
INSERT INTO `onethink_picture` VALUES ('86', '/Uploads/Picture/2016-09-28/57eb7eb20f07c.png', '', '952b073e94c64e453a27992cb127c839', '4c30729fefe0379ff61460eaf5393782ba4b00b5', '1', '1475051185');
INSERT INTO `onethink_picture` VALUES ('87', '/Uploads/Picture/2016-09-28/57eb7ebc5b67e.png', '', '8a3de1e33e94d9453b44d3ab31209bd9', '60b8d15aa10e583b024ade163023a4112fe49926', '1', '1475051196');
INSERT INTO `onethink_picture` VALUES ('88', '/Uploads/Picture/2016-09-28/57eb7f5ab6abb.png', '', '70cf60637c82f8a766872964159a1a2c', '83c27526ea04cdcf626ac9cee082aaed08f2471b', '1', '1475051354');
INSERT INTO `onethink_picture` VALUES ('89', '/Uploads/Picture/2016-09-28/57eb7f6032e33.png', '', '736a628540c6048c1900ab32bc8ffd13', 'abe93c56dee4dcf0b2095aaba8195c0a2d3107e6', '1', '1475051360');
INSERT INTO `onethink_picture` VALUES ('90', '/Uploads/Picture/2016-09-28/57eb830bd72ab.png', '', 'ebfe72bd87531ab021db43da5dfa8040', '4f96a043c0854997a4d18456ef1abc27bd6175ba', '1', '1475052299');
INSERT INTO `onethink_picture` VALUES ('91', '/Uploads/Picture/2016-09-28/57eb831026974.png', '', 'ad71d6e2d5a2c4e631ff2c8bff96564e', '2bfd8be0f71c5266ef5b66c622b0bcb1227bf863', '1', '1475052304');
INSERT INTO `onethink_picture` VALUES ('92', '/Uploads/Picture/2016-09-28/57eb83ddc558a.jpg', '', 'ad9c087d2c7e1cc0c4115f9d2ff94637', '0ad67f37e6b97a68f963a6de2c8800da15e5de7a', '1', '1475052509');
INSERT INTO `onethink_picture` VALUES ('93', '/Uploads/Picture/2016-09-28/57eb83e39ff0e.jpg', '', 'dc7f8e8b45109b132faec58dddf0875a', '7b773428100bbddc42999812a6af56521ce2b87b', '1', '1475052515');
INSERT INTO `onethink_picture` VALUES ('94', '/Uploads/Picture/2016-09-28/57eb84fb872cf.jpg', '', '1b421da09d973d80e25641f3e413d9cb', '8baf5a5d8afb6e9cab7ca51d6172bacf362d381c', '1', '1475052795');
INSERT INTO `onethink_picture` VALUES ('95', '/Uploads/Picture/2016-09-28/57eb85002f3d9.jpg', '', 'd8a75bb4bbe5cf6d85f2e84fd8c07839', '302f765d818c84cce48ac64ff5135715edcb5140', '1', '1475052800');
INSERT INTO `onethink_picture` VALUES ('96', '/Uploads/Picture/2016-09-28/57eb85668c8d0.jpg', '', '737bb14f151f86762a2de852305da3a9', '3466d89dde760c0ec988d781e51253a07b2b2979', '1', '1475052902');
INSERT INTO `onethink_picture` VALUES ('97', '/Uploads/Picture/2016-09-28/57eb856c7dbdf.jpg', '', 'b1422823e1a1268e0e009671043f2524', '851ff676de98a0db108206f9b7818f441b8f7531', '1', '1475052908');
INSERT INTO `onethink_picture` VALUES ('98', '/Uploads/Picture/2016-09-28/57eb856cab7f4.jpg', '', '55e5d093ac7134b30e352ec421f51717', 'ba9ed0c1587dba4146c94e127b7cb5b355e3c736', '1', '1475052908');
INSERT INTO `onethink_picture` VALUES ('99', '/Uploads/Picture/2016-10-18/5805f21494214.jpg', '', '432d61fd3f38f54f912047ab678cc0c4', '0192a989a7d4b71a5e840f8aeee671e48fb89401', '1', '1476784660');
INSERT INTO `onethink_picture` VALUES ('100', '/Uploads/Picture/2016-10-20/5808289671c54.jpg', '', '3c75c3383bb441017e5eb48a90ba65fa', '78fc5d97cd69d50a3a28ebe8e61a4ec89629823e', '1', '1476929686');
INSERT INTO `onethink_picture` VALUES ('101', '/Uploads/Picture/2016-10-20/580828a9065d1.jpg', '', 'de90243b6ebaa2ea6ca1d93dec89b53b', '0268737e73466811d0072b20bbf683f1baf7022f', '1', '1476929704');
INSERT INTO `onethink_picture` VALUES ('102', '/Uploads/Picture/2016-10-20/580828ac7e0a9.png', '', '53d7b86924cda7d3678886033ef8f533', '1918aacf8b2c714deaac03eb7eef06973d9cd63b', '1', '1476929708');
INSERT INTO `onethink_picture` VALUES ('103', '/Uploads/Picture/2016-11-03/581aae7f2d0cd.jpg', '', '5b821ffd9865385cff35982609ff2bce', '76684a1f5e827f5e854287ea1f19837e55390e11', '1', '1478143615');
INSERT INTO `onethink_picture` VALUES ('151', '/Uploads/Picture/2016-11-10/582445bc121f2.jpg', '', 'a1f9223ffd81409741f9f5a0cab4485f', '278bfe5e2c48c51510a14873a2d8178233dd0b93', '1', '1478772155');
INSERT INTO `onethink_picture` VALUES ('105', '/Uploads/Picture/2016-11-09/5822c6b7eb500.jpg', '', '0e9598f29e00c15b63925e0a66c8a054', 'e22c6eb8801a5b8ee8a8e5141d989272a59a834b', '1', '1478674103');
INSERT INTO `onethink_picture` VALUES ('135', '/Uploads/Picture/2016-11-10/5823dc7a5bb73.jpg', '', '716b64f8ce66356c8763e225a159b397', 'd83ffbae6b4214d773c025dd500f0b6a7e226055', '1', '1478745210');
INSERT INTO `onethink_picture` VALUES ('134', '/Uploads/Picture/2016-11-10/5823dc70de970.jpg', '', 'a04f10e5c61a72bfb0fb4a20de102b14', '0d347248057b9d3424b568eee6f140a5dfe066b1', '1', '1478745200');
INSERT INTO `onethink_picture` VALUES ('133', '/Uploads/Picture/2016-11-10/5823dc6913994.jpg', '', 'd7ce2b9001c3b1d5d7c8416ea34b698f', 'e35f24946a63259878c18e48ebd1dd499003964b', '1', '1478745192');
INSERT INTO `onethink_picture` VALUES ('132', '/Uploads/Picture/2016-11-10/5823dc61282a8.jpg', '', '1d424987ae289436271568514e879f3c', '01d8f408ea9d9ee31f5d9852ab4b6fc5811836cf', '1', '1478745184');
INSERT INTO `onethink_picture` VALUES ('131', '/Uploads/Picture/2016-11-10/5823dc542ca3e.jpg', '', '96c00477d0ef9607b5261cbeaa25cad8', 'bc8e2d9f466d64ef55cec5a5a92b620c3de2dace', '1', '1478745172');
INSERT INTO `onethink_picture` VALUES ('130', '/Uploads/Picture/2016-11-10/5823dc4b42dd0.jpg', '', 'ec986f5d8e95109936f430a3ae7bcfce', '23cce22d3894b411af03f9ccae0f9022afc6e665', '1', '1478745163');
INSERT INTO `onethink_picture` VALUES ('129', '/Uploads/Picture/2016-11-10/5823dc41ee64a.jpg', '', '3a2848d8849d9afb1c6ada1e93335bc6', '76c8ec1cf3353cbe3262764851b6f916aeb2e91c', '1', '1478745153');
INSERT INTO `onethink_picture` VALUES ('128', '/Uploads/Picture/2016-11-10/5823dc3986885.jpg', '', '960b75fe4f8d91331196b655bfec89ea', '0401921ea4ebf9a6690aa776bc6e679ae38cd404', '1', '1478745145');
INSERT INTO `onethink_picture` VALUES ('154', '/Uploads/Picture/2016-11-10/58244610ee166.jpg', '', '7cf0225d819cf08299a19b147653661b', '7f65d7229440fd666cb8a86d9b69b7195b7563fd', '1', '1478772240');
INSERT INTO `onethink_picture` VALUES ('155', '/Uploads/Picture/2016-11-10/58244620161d1.jpg', '', 'a4bd3515166fb92f832d692261f0ddf2', '1bc19f70be2f18f8f909bfe96a51cbd3b7a11186', '1', '1478772255');
INSERT INTO `onethink_picture` VALUES ('148', '/Uploads/Picture/2016-11-10/582443c0a32d9.jpg', '', '08233ac1912f6df8f215199e89a5e96b', '81193ae950e8da0787f9c222879072f194fa2458', '1', '1478771648');
INSERT INTO `onethink_picture` VALUES ('156', '/Uploads/Picture/2016-11-10/58244635ade45.jpg', '', '0fde3018b70d8fc29521c2268253c30d', '316641c267a3b63ed0f2cadb66e94cbf43e6560a', '1', '1478772277');
INSERT INTO `onethink_picture` VALUES ('157', '/Uploads/Picture/2016-11-10/5824463f7c0bb.jpg', '', '6726b05d98d0b0c9b52c61339e25d2cb', 'ed1e586e69e269525380db61216a9b424e38614e', '1', '1478772287');
INSERT INTO `onethink_picture` VALUES ('158', '/Uploads/Picture/2016-11-10/5824464b74bae.jpg', '', '5a7f5edd65125634d402c1b8eb02913c', '95ca4180ff4fc5d2f0ccdf268afece42e2177b80', '1', '1478772299');
INSERT INTO `onethink_picture` VALUES ('153', '/Uploads/Picture/2016-11-10/58244603b257e.jpg', '', '05a42d55372f9bb8f5e6f34f134bdf8c', 'c97b940b4921da5c91212f670503506999092bad', '1', '1478772227');
INSERT INTO `onethink_picture` VALUES ('152', '/Uploads/Picture/2016-11-10/582445f936a89.jpg', '', '15aebd1f986434753b509f32b43882e7', '6e75e89724d2b359d5462cd902f2fc544803b1da', '1', '1478772217');
INSERT INTO `onethink_picture` VALUES ('125', '/Uploads/Picture/2016-11-10/5823dbffe6eb0.jpg', '', 'e92ad3dd5df57a8bca10f6f67b6472d4', 'aa604f41ee1e755d6d89ee726b46d4206ede2055', '1', '1478745087');
INSERT INTO `onethink_picture` VALUES ('124', '/Uploads/Picture/2016-11-10/5823d8183c42b.jpg', '', 'a63c2a7b1a45d2236f762da10811d91e', '21b1ecaaef0b556f8680ea4b51c1bcc099d0ed81', '1', '1478744088');
INSERT INTO `onethink_picture` VALUES ('126', '/Uploads/Picture/2016-11-10/5823dc16dbc50.jpg', '', 'bb252701c8fe96815eb5865788028c2b', '6d080e43ab0fe9fb011f19060979935c5bb75a99', '1', '1478745110');
INSERT INTO `onethink_picture` VALUES ('127', '/Uploads/Picture/2016-11-10/5823dc22041c0.jpg', '', 'b63a3bf140c52f48359cb2beebce08a3', 'ce0de07467b5ac26893d389ab70c19c92c56ac50', '1', '1478745121');
INSERT INTO `onethink_picture` VALUES ('136', '/Uploads/Picture/2016-11-10/5824310d020ec.jpg', '', '0b1726d6bdf620f070d0edc1d1b679d7', '22ef032c39afc9c3da0110e8763d6369321a1ecf', '1', '1478766860');
INSERT INTO `onethink_picture` VALUES ('137', '/Uploads/Picture/2016-11-10/5824312b5eacd.jpg', '', 'bf86835c979d41b448973ea9e5c78142', '876d8dc28573927575c689f5574171187ac578fc', '1', '1478766891');
INSERT INTO `onethink_picture` VALUES ('138', '/Uploads/Picture/2016-11-10/58243142a7c38.jpg', '', '9d6d55114ee1393cb469db5a68c41195', 'c9b94dd7dbf9d9bee2449d8950a72ac10877973c', '1', '1478766914');
INSERT INTO `onethink_picture` VALUES ('139', '/Uploads/Picture/2016-11-10/582431c1bb928.jpg', '', '27e4a80452526f3f552f9ac69508316e', '7eaacb76365e8c5dd14eaeb00dd8ac3547ce1a6e', '1', '1478767041');
INSERT INTO `onethink_picture` VALUES ('140', '/Uploads/Picture/2016-11-10/582433ee5bd0b.jpg', '', '4d350a5fa2e23170616ceec414e56e9a', 'a39b2cd9b4d0074eb5c35e8ddb4f46252e913320', '1', '1478767598');
INSERT INTO `onethink_picture` VALUES ('141', '/Uploads/Picture/2016-11-10/5824341d289d5.jpg', '', 'cdfc9c05a66b6f2a28d93e36f0ae2907', '13ffafc839a76ef2fd35110762bd028e173438be', '1', '1478767645');
INSERT INTO `onethink_picture` VALUES ('142', '/Uploads/Picture/2016-11-10/582435184d6bd.jpg', '', 'c9516943706d317cf03b215c8c81f4f9', '7769c8b38caa769ef1f5bc7fe2bdd546a5f081ea', '1', '1478767896');
INSERT INTO `onethink_picture` VALUES ('143', '/Uploads/Picture/2016-11-10/58243a8061453.jpg', '', '12227d593a3968e19aa04b7b49e8b4ed', '28c57e68c835821cc169b42d035854673a6d1291', '1', '1478769280');
INSERT INTO `onethink_picture` VALUES ('144', '/Uploads/Picture/2016-11-10/58243b476a54f.jpg', '', 'df450f329b6dabe4bb1b1e249fdb9bd7', 'b3d2d359779749ed79318442327b87b0bde76b4c', '1', '1478769479');
INSERT INTO `onethink_picture` VALUES ('145', '/Uploads/Picture/2016-11-10/58243d6bb9d46.jpg', '', 'a0520a081583f01f9968479da809ac70', 'c402ef2255bad9ac8cd3e262648280b639a0f95c', '1', '1478770027');
INSERT INTO `onethink_picture` VALUES ('146', '/Uploads/Picture/2016-11-10/58243fa0cdef9.jpg', '', 'db4f72f41f1f619f53fcfbc9a34b232a', 'f65ed66570f506cf7c6fba9fd01fe3c927b693f9', '1', '1478770592');
INSERT INTO `onethink_picture` VALUES ('147', '/Uploads/Picture/2016-11-10/58243fe8726ba.jpg', '', '8607d359878a5ff12eb921f7ff86b798', '987e082b86a4248d6d8cec10f9f270ff95546381', '1', '1478770664');
INSERT INTO `onethink_picture` VALUES ('149', '/Uploads/Picture/2016-11-10/582443cc5ac53.jpg', '', 'e5ecd39119943e2b39577c63c99a713a', 'cb04375f32c17152d82012b9df023acab5ac3587', '1', '1478771660');
INSERT INTO `onethink_picture` VALUES ('150', '/Uploads/Picture/2016-11-10/582445b155b3c.jpg', '', '2c00839b8806cfb3db5b661d9572a1a9', '746a01c7a208363b7de6da5631fa300a96e42b5d', '1', '1478772145');
INSERT INTO `onethink_picture` VALUES ('159', '/Uploads/Picture/2016-11-10/582446dea143d.jpg', '', '215119f8afd996ef8dd597576f7a450f', '775e23a49e60ff1efec1d56b39f6da1f9da7c788', '1', '1478772446');
INSERT INTO `onethink_picture` VALUES ('160', '/Uploads/Picture/2016-11-10/582446ef3127a.jpg', '', '47e85448e2b10cb8a60efb733ee268fa', 'edd36972eeee609d6b3350a25e51e0e5380a3f20', '1', '1478772463');
INSERT INTO `onethink_picture` VALUES ('161', '/Uploads/Picture/2016-11-10/58244722e94a2.jpg', '', 'b3478f11a516f39d2345b07ebace5d06', 'f235f463c21745b0fc046aa1f0720db54e463035', '1', '1478772514');
INSERT INTO `onethink_picture` VALUES ('162', '/Uploads/Picture/2016-11-10/58244730d86a1.jpg', '', 'a25269249eec0d3b25f94ad7a4178097', '9f55918b8c0da3673196e17017cd82002085b170', '1', '1478772528');
INSERT INTO `onethink_picture` VALUES ('163', '/Uploads/Picture/2016-11-10/58244ec5a70ec.jpg', '', 'cb59ecfb674938b93c57d7be0e608fd4', 'e73a7a4ccedd2e772733bd3ff405d0c680a295e1', '1', '1478774469');
INSERT INTO `onethink_picture` VALUES ('164', '/Uploads/Picture/2016-11-10/58244ede79d61.jpg', '', '0bed9f5d2121eb44b8254ad03019d8dc', '3705edd338e076e7630f87e643250a54da506799', '1', '1478774494');
INSERT INTO `onethink_picture` VALUES ('165', '/Uploads/Picture/2016-11-10/58244eea58936.jpg', '', '11aadd52a584839ee01713a5970f5bca', '82926061210cd39983ca7d8020e9261d808c6b66', '1', '1478774506');
INSERT INTO `onethink_picture` VALUES ('166', '/Uploads/Picture/2016-11-10/58244f02c5197.jpg', '', '6b735f7b50cd0e029141625f3281538c', '31e7579ff5ee3912a529e0b66fc99f664ec887c2', '1', '1478774530');
INSERT INTO `onethink_picture` VALUES ('167', '/Uploads/Picture/2016-11-10/58244f0eed8c1.jpg', '', '13898cee1086a43105da4dd1667ca303', '34c4316e69ab94ef65a7594a89c69210901015a4', '1', '1478774542');
INSERT INTO `onethink_picture` VALUES ('168', '/Uploads/Picture/2016-11-10/58244f1ba3940.jpg', '', '7247fb36f2919308fdec67daf37efcf8', '99b70d20752b374e96c4a63d569aa10d7e6d257a', '1', '1478774555');
INSERT INTO `onethink_picture` VALUES ('169', '/Uploads/Picture/2016-11-10/582450846fd3d.jpg', '', 'f3476b0800f242bc22ff40070953c187', '778251cccc40b4d5b8ca156968cdbca21d2ac258', '1', '1478774916');
INSERT INTO `onethink_picture` VALUES ('170', '/Uploads/Picture/2016-11-14/58299f870538c.jpg', '', '5824152f724f1baa9da4d0329a1df8b2', '3cf220d126ab5d1a59f541320518dc8b50c755d3', '1', '1479122822');
INSERT INTO `onethink_picture` VALUES ('171', '/Uploads/Picture/2016-11-15/582aba4f978a5.png', '', '11a89c157b3e37ebb5d6af4aa5b181df', '2ef5c07f876f6574bbdb3428237c211363b443ee', '1', '1479195215');
INSERT INTO `onethink_picture` VALUES ('172', '/Uploads/Picture/2016-11-15/582aba57b08e5.jpg', '', '44f036c5f58a1c5feb88011844158b31', 'b50a6eb362198be577767403e3a676f1b5a849a8', '1', '1479195223');
INSERT INTO `onethink_picture` VALUES ('173', '/Uploads/Picture/2016-11-17/582da58561159.png', '', 'd606575de4af867975a33bec0e610843', '955e87e437fc0c9be1f8b78437feb0969b95de93', '1', '1479386501');
INSERT INTO `onethink_picture` VALUES ('174', '/Uploads/Picture/2016-11-17/582da985be3f0.png', '', '653651114c4794e04d78d91505516440', 'd1f7760cd3881abd2a850eb966c517ebe77eabd4', '1', '1479387525');
INSERT INTO `onethink_picture` VALUES ('175', '/Uploads/Picture/2016-11-17/582da9975b9d7.png', '', '53a30a2c096f866140098ba4e15a803a', '7dd1d9ee85f0523df5570b205ec9a72f56f7dfac', '1', '1479387543');
INSERT INTO `onethink_picture` VALUES ('176', '/Uploads/Picture/2016-11-18/582e66afeaadb.png', '', 'fac8ba3a074fcd86f07511d0c6f1dc5b', '895030a46f655ac93c5efbf56d726d3d6bd9eced', '1', '1479435951');
INSERT INTO `onethink_picture` VALUES ('177', '/Uploads/Picture/2016-11-18/582e9a9f99017.png', '', 'b58f2bff4e25d077be0a5111d05b9895', '7e3697f591f125e0fdf1f00233437f325b3b98cb', '1', '1479449247');
INSERT INTO `onethink_picture` VALUES ('178', '/Uploads/Picture/2016-11-18/582e9acdd538d.png', '', 'cd828c42a5ac10afacd3f9f856d05201', '58f8858178593d68bb058c93c57589d44ebe285f', '1', '1479449293');
INSERT INTO `onethink_picture` VALUES ('179', '/Uploads/Picture/2016-11-18/582e9acdf2083.png', '', 'a6961f2c800bc42fa8151270dd5237c3', '055a842cbeeabb7f7b4cbc89ffbdd40ccd614398', '1', '1479449293');
INSERT INTO `onethink_picture` VALUES ('180', '/Uploads/Picture/2016-11-18/582e9d00a52c3.png', '', '2b5e2346037246c25024d98c84b06964', 'ac56c4bc607128967328b1e47b874749666cd341', '1', '1479449856');
INSERT INTO `onethink_picture` VALUES ('295', '/Uploads/Picture/2017-02-21/58abe6bd206b5.jpg', '', '984d14b5c796aee9365eb28b01e2beaf', 'be1df06779709bfc12a87ae76bc901a0ed5351ff', '1', '1487660733');
INSERT INTO `onethink_picture` VALUES ('182', '/Uploads/Picture/2016-11-21/583256f46929f.jpg', '', '1807be878194e2e7c64f5ba8b43b9ae2', 'fe301a5d124df56310364dc56bcb51c33166f22c', '1', '1479694068');
INSERT INTO `onethink_picture` VALUES ('183', '/Uploads/Picture/2016-11-24/5836d6e2c7fcc.png', '', 'cfb0d1fad5d905c63dd265bfbe7204da', '8732d4519bc0ff48b78609e248327a61371adb53', '1', '1479988962');
INSERT INTO `onethink_picture` VALUES ('184', '/Uploads/Picture/2016-11-24/5836d6f30b3fc.png', '', 'f27afcb49ea5b188f5963caf90e202cd', '918c1554466d1c7bfb208e15ad7eed79c4960f46', '1', '1479988978');
INSERT INTO `onethink_picture` VALUES ('185', '/Uploads/Picture/2016-11-24/5836d724431cc.png', '', 'ed9b9c6877cb0e3deed85995d4a0d7ff', 'a48f343eccff437eb77f632fa682c3776f9eb0ee', '1', '1479989028');
INSERT INTO `onethink_picture` VALUES ('186', '/Uploads/Picture/2016-11-24/5836d732b68c8.png', '', '811ea4b371bfbe6fb328ca501eff23f3', '69c3821a2a74ede43fdc3e3e235e4f555c04b409', '1', '1479989042');
INSERT INTO `onethink_picture` VALUES ('187', '/Uploads/Picture/2016-11-24/5836d832bf7ec.jpg', '', '74ccf696f3b45679754c636478266661', 'd1c19d7fdf08c90804856481304400eabe11aab1', '1', '1479989298');
INSERT INTO `onethink_picture` VALUES ('188', '/Uploads/Picture/2016-11-24/5836d84a04ced.jpg', '', '27fdde7e7d66768bbf05be55cc1d7b7a', 'd6ea683e12eceef71e2fdc407c114bedea24d0e5', '1', '1479989321');
INSERT INTO `onethink_picture` VALUES ('189', '/Uploads/Picture/2016-12-12/584e6bc17721e.jpg', '', 'b3a662cd292012d19140c17aeb8b885a', '04073be20415f4312401e5d1a68c24e995be144a', '1', '1481534399');
INSERT INTO `onethink_picture` VALUES ('190', '/Uploads/Picture/2016-12-13/584fa25cb59df.jpg', '', '77da0f9302e502754eb3c237e1cc9add', 'cac8f1f5c457d70a7efd6bf6982968fc8d660669', '1', '1481613916');
INSERT INTO `onethink_picture` VALUES ('191', '/Uploads/Picture/2016-12-13/584fa2b6ba13f.jpg', '', 'c9998f5e09f5542a6da94bd7d2362a9a', '19b8c01bfdaf37af158ffbf3af72ae555aa4501c', '1', '1481613996');
INSERT INTO `onethink_picture` VALUES ('192', '/Uploads/Picture/2016-12-13/584fa2f50d001.jpg', '', 'b46cd9e9cdcc9219b8f9ef38c476abfb', '47ec231c871b3a8d25ec21f83d816ad2b02cee3e', '1', '1481614068');
INSERT INTO `onethink_picture` VALUES ('193', '/Uploads/Picture/2016-12-13/584fa33085682.jpg', '', '8958e11702cac2f9127d16bef9faafbe', 'e5223c8439b56a90a71eb46969b01e18140352eb', '1', '1481614128');
INSERT INTO `onethink_picture` VALUES ('194', '/Uploads/Picture/2016-12-13/584fa363cf046.jpg', '', '44419a161726e53a374aa95eb38598ed', 'b1aa78af55545f5034b55c50a64a1ecc6c15b41e', '1', '1481614179');
INSERT INTO `onethink_picture` VALUES ('195', '/Uploads/Picture/2016-12-13/584fa70f2271e.jpg', '', 'f37972bdc3affe0744a07eefec5d796b', 'ee127d9058564e23be89a54aa67a22a325592168', '1', '1481615119');
INSERT INTO `onethink_picture` VALUES ('196', '/Uploads/Picture/2016-12-13/584fa728adf31.jpg', '', '65cd5eb8fe75a53479bd372a214f338d', '511e58b833b8efd7cae9b18af775cbcb10421287', '1', '1481615144');
INSERT INTO `onethink_picture` VALUES ('197', '/Uploads/Picture/2016-12-14/5850a3d8d4d5d.jpg', '', '3744b818dc1af8f0fcce600aabfd19e0', '0f325538fe0a6b2501ca5cb4827792af5f8eed6e', '1', '1481679832');
INSERT INTO `onethink_picture` VALUES ('198', '/Uploads/Picture/2016-12-14/5850b7cfc6462.jpg', '', 'df8d353b5e53129287bcdb4d74e6da84', '48d1a41de84adf2b56b033dbdb97d63ad863e802', '1', '1481684940');
INSERT INTO `onethink_picture` VALUES ('199', '/Uploads/Picture/2016-12-14/5850b7df7f544.jpg', '', '0733ff388062de2b976cb19ba2427103', '5553d1aae7a35c82453b89abb552b1f5ffd1733b', '1', '1481684957');
INSERT INTO `onethink_picture` VALUES ('200', '/Uploads/Picture/2016-12-14/5850b7ebc7f78.jpg', '', '59154966433eea36a9659f8d26986915', '35b371a755d8899349b534a755dc3ca75fbb5409', '1', '1481684970');
INSERT INTO `onethink_picture` VALUES ('201', '/Uploads/Picture/2016-12-14/5850b7fd9a7e3.jpg', '', 'c13180e5121208a24eaa0ee375c2330a', 'd7e411515600e11f3b421132173cae379b6c1a65', '1', '1481684988');
INSERT INTO `onethink_picture` VALUES ('202', '/Uploads/Picture/2016-12-14/5850b806ed688.jpg', '', '8e20ccbcc1130bff34a64a2a0ddc7ed8', '4fcaf05b70252b5d0a2e63ef9040e15c4491e8fa', '1', '1481684998');
INSERT INTO `onethink_picture` VALUES ('203', '/Uploads/Picture/2016-12-14/5850b98ee8964.jpg', '', '182585e5f53aadc6b862a50ef2ab2c93', '3cda13fd5efde59ce49eae508e5a5c004484f14c', '1', '1481685387');
INSERT INTO `onethink_picture` VALUES ('204', '/Uploads/Picture/2016-12-14/5850bfa5ed04c.jpg', '', '558a0943fb3279fe898f125aafd99808', '8a215d98809e94a4a7eb39e7eb62e97d6c94a72f', '1', '1481686949');
INSERT INTO `onethink_picture` VALUES ('205', '/Uploads/Picture/2016-12-14/5850d53a5995d.jpg', '', '1685d8c78f9c18f9c8d6ed40aa28f4db', 'd9a31234d60b73e834607bf0e54f74afc0e7d171', '1', '1481692473');
INSERT INTO `onethink_picture` VALUES ('206', '/Uploads/Picture/2016-12-14/5850e08f39214.jpg', '', '0dd6b6d24e4a1f4bac041fc2d50bac9c', '56967a9ac26ca2dcd19b2b101ee752de39c0aab2', '1', '1481695373');
INSERT INTO `onethink_picture` VALUES ('207', '/Uploads/Picture/2016-12-14/5850e2d2a54b6.jpg', '', '723ba8e824aad70780eb65b228d9d7a6', '6370ded07db2cd638ed6a4390403797c2bdbc48f', '1', '1481695953');
INSERT INTO `onethink_picture` VALUES ('208', '/Uploads/Picture/2016-12-14/5850e95ddcf48.jpg', '', 'b0808ea8c679c14be6c96e25348d5947', '70938a2a115a1591e6547c92afe7b1deddff2af5', '1', '1481697627');
INSERT INTO `onethink_picture` VALUES ('209', '/Uploads/Picture/2016-12-14/5850eb42f3758.jpg', '', 'a3adfc065c218fce626fa75262fe5588', '0db45c44b06f248ab7962daa92f4fc87d8c8e437', '1', '1481698114');
INSERT INTO `onethink_picture` VALUES ('210', '/Uploads/Picture/2016-12-14/5850ec215327f.jpg', '', '9070298ff6b9a303404adeb7197003bf', '130d037d01071121b00683cf41972fe22a6322e8', '1', '1481698335');
INSERT INTO `onethink_picture` VALUES ('211', '/Uploads/Picture/2016-12-14/5850ed39369e9.jpg', '', '54a49cbfe13e3192d78bf9d71e2b795a', 'd831cec9242e8f6ff072de4e9a73ea9c257dcc2e', '1', '1481698616');
INSERT INTO `onethink_picture` VALUES ('212', '/Uploads/Picture/2016-12-14/5850edbfd747e.jpg', '', 'd281dc38d29ecba022ed8b3b61f58e11', '38651824d79362090125ffa74fcdfb136a6f64c3', '1', '1481698751');
INSERT INTO `onethink_picture` VALUES ('213', '/Uploads/Picture/2016-12-14/5850f0632f0af.jpg', '', '65ffe0101e513c6bd2c58be61306a2d5', '0e35b4a569627be7246db766332e89ebe8445b07', '1', '1481699427');
INSERT INTO `onethink_picture` VALUES ('214', '/Uploads/Picture/2016-12-14/58510d2a79447.jpg', '', '26368370ec4929f639cefcba684cb9e7', '320fcbbf8a22dd94e29f8df9c90b855e98475568', '1', '1481706791');
INSERT INTO `onethink_picture` VALUES ('215', '/Uploads/Picture/2016-12-15/58520434a3765.jpg', '', '4395949de52c24b510911b024e00426a', '38b9996e1badcf655cc86dc90786022ac060d6a6', '1', '1481770034');
INSERT INTO `onethink_picture` VALUES ('216', '/Uploads/Picture/2016-12-15/58522be552b96.jpg', '', '3f426b856c236705878603085695b1da', 'f3913f9f715f55fa2d249538b787f11897972e5d', '1', '1481780196');
INSERT INTO `onethink_picture` VALUES ('217', '/Uploads/Picture/2016-12-15/58522ce01ffc9.jpg', '', '5f5fe190aebe5ca6d1866e9f7c67db8a', '07a09160a70399da8ca8de5defa5267d7a1dbe29', '1', '1481780447');
INSERT INTO `onethink_picture` VALUES ('218', '/Uploads/Picture/2016-12-15/58522e3584fbd.jpg', '', '18d82ffcd4c51c0f2fe05dc5452941eb', '9b96fc5bc8ac3f9a09f7a8fceae93038239ba151', '1', '1481780789');
INSERT INTO `onethink_picture` VALUES ('219', '/Uploads/Picture/2016-12-15/58522f483845a.jpg', '', 'a991c535d748588695d3064d88c322ca', '0e7a0cd356f540765fba1508fcff6a503479344b', '1', '1481781063');
INSERT INTO `onethink_picture` VALUES ('220', '/Uploads/Picture/2016-12-15/5852426b990fd.jpg', '', '7dac53739d64b237b96a0694dc7f774e', 'fdf333916882fed602b38e4e366727189b5df6c3', '1', '1481785963');
INSERT INTO `onethink_picture` VALUES ('221', '/Uploads/Picture/2016-12-15/58524a362cbd6.jpg', '', 'a5533f3bee8ee89b96a9814236212361', '47ec8a3c0284f275ce7b56d35464a954abd3db02', '1', '1481787957');
INSERT INTO `onethink_picture` VALUES ('222', '/Uploads/Picture/2016-12-15/58524a40b0735.jpg', '', '236031ded8df4847af37a7718e8c345e', '9e137dcc3dc4a24f12ec055375893d00fd8ea688', '1', '1481787968');
INSERT INTO `onethink_picture` VALUES ('223', '/Uploads/Picture/2016-12-15/5852512233f0b.jpg', '', '73d9da21c18e771855ee2f7e731997d8', 'ea1a54cac90126905253530702fc1791f9ad779a', '1', '1481789728');
INSERT INTO `onethink_picture` VALUES ('224', '/Uploads/Picture/2016-12-15/5852512ebe20c.jpg', '', '0aece176204ded6eebc08892c3210189', '31be316fdf9c7cbf2a4ab3070ead186366d0e9d7', '1', '1481789742');
INSERT INTO `onethink_picture` VALUES ('225', '/Uploads/Picture/2016-12-15/5852530887461.jpg', '', 'f00ba4f97165b1a8b053ef25ff1d06d6', '79b4a73ff9cea2fdcdbb76d7aa0b08af4e883617', '1', '1481790216');
INSERT INTO `onethink_picture` VALUES ('226', '/Uploads/Picture/2016-12-15/58525d3755ea0.png', '', '2f7b582902515050fb675d69c1549ff6', '2a5157eff16aafb6eefe55f5de4a7a86bf6c3acc', '1', '1481792823');
INSERT INTO `onethink_picture` VALUES ('227', '/Uploads/Picture/2016-12-15/5852642848c57.jpg', '', '7913ca5887d926cffc619becfe77f976', 'be903794ab474e970146bee99f151668f361c6d3', '1', '1481794600');
INSERT INTO `onethink_picture` VALUES ('228', '/Uploads/Picture/2016-12-15/58526460acbd5.jpg', '', 'f1e40a23911cb49d0bac86a1fa45d57f', '76edb08ccad6db46c436026a972eda78fdec310c', '1', '1481794656');
INSERT INTO `onethink_picture` VALUES ('229', '/Uploads/Picture/2016-12-15/585264696513e.jpg', '', '2adc82e4086a814dba1e97549ff15f6b', '657b48be7f14518895664a05231788e46981d51e', '1', '1481794665');
INSERT INTO `onethink_picture` VALUES ('230', '/Uploads/Picture/2016-12-15/58526511091b2.jpg', '', '74d60015fc930320888ea84650aab42c', 'b05b5dea1b4bdbd313492bc2b5bc74b0c976f28f', '1', '1481794832');
INSERT INTO `onethink_picture` VALUES ('231', '/Uploads/Picture/2016-12-15/585265377027b.jpg', '', '7c636178465dbc88b3f4ab54f20bc73b', '199ce4f1450bc38e54c5de5bc32d1284e7b64c86', '1', '1481794871');
INSERT INTO `onethink_picture` VALUES ('232', '/Uploads/Picture/2016-12-15/585265c644067.jpg', '', '446c09792cc4db92ef66225591a16625', 'f7e18dedbe72a31b339bad38e6adc1f6a6906a3f', '1', '1481795014');
INSERT INTO `onethink_picture` VALUES ('233', '/Uploads/Picture/2016-12-15/5852675df35bc.jpg', '', '762fb7bacc820edc569bb593f03bcdfa', '6572c563089eff0bf2b03ad592402522f6d93228', '1', '1481795421');
INSERT INTO `onethink_picture` VALUES ('234', '/Uploads/Picture/2016-12-15/58526a397a67d.jpg', '', '0e534c4cdf5d5473670368dd4349a32c', 'f61d645b135600f582ec2b291ba7dad683f02bdd', '1', '1481796152');
INSERT INTO `onethink_picture` VALUES ('235', '/Uploads/Picture/2016-12-16/58534b47872d6.jpg', '', '15068a337f45b5092ddb8f6e72f8d1bd', 'ec7e3ed1432aef28bca6324d56c1bfc0dda1fe79', '1', '1481853767');
INSERT INTO `onethink_picture` VALUES ('236', '/Uploads/Picture/2016-12-16/58535768b3cab.jpg', '', 'ed75124ffd658d969f1a8db91d29c742', '3c22f7c7695d990eeee19af3ee23280a22965387', '1', '1481856872');
INSERT INTO `onethink_picture` VALUES ('237', '/Uploads/Picture/2016-12-16/585358292cebd.jpg', '', '56f6c7330f1a203406f4d5e892faeeb2', 'a62b721619ae1a134d01c17e5be6e96390b4f1ff', '1', '1481857065');
INSERT INTO `onethink_picture` VALUES ('238', '/Uploads/Picture/2016-12-16/585358685c114.jpg', '', 'aded7dadac851a26878682c9a0715278', '4cf3352e3767d9ac03056cd1f4df99c0abb5bec0', '1', '1481857128');
INSERT INTO `onethink_picture` VALUES ('239', '/Uploads/Picture/2016-12-16/585358f2a523e.jpg', '', '80a31c4d6c8c19c67dc470d96ded198c', '6e6488d023ada91f29005378f03242e7e1e65ab5', '1', '1481857266');
INSERT INTO `onethink_picture` VALUES ('240', '/Uploads/Picture/2016-12-16/58535a4a99ba6.png', '', '17a8378fb1db196b6f30a2b567114e7c', 'f4e978f1ddfaa8f4354afa3d40d4a5df1df2107c', '1', '1481857610');
INSERT INTO `onethink_picture` VALUES ('241', '/Uploads/Picture/2016-12-16/58535fc23a61a.jpg', '', '8487069d86062f3b8ca1d6fc2198425d', 'db8aa09a14fafab269e705629036a9370700bf60', '1', '1481859009');
INSERT INTO `onethink_picture` VALUES ('242', '/Uploads/Picture/2016-12-16/5853624d7ce36.jpg', '', '6bd1ef33a8b4588a4487f96fe7eba18a', 'e9b9eed5c92664965454786ec76a631ef63dc9be', '1', '1481859661');
INSERT INTO `onethink_picture` VALUES ('243', '/Uploads/Picture/2016-12-16/58536265a43f4.jpg', '', '67179e54b06d5227705ee4bb5b5aaaef', 'cd8fbbe78e7fa202c561141f11170ee4e9e53f9e', '1', '1481859685');
INSERT INTO `onethink_picture` VALUES ('244', '/Uploads/Picture/2016-12-16/58536289ba3e2.jpg', '', '8b20dd8b5f855a1a683dd6b003c61ae9', '3fb19099caea79bce7af64c5519ce39a20d9b910', '1', '1481859720');
INSERT INTO `onethink_picture` VALUES ('245', '/Uploads/Picture/2016-12-16/585362c70021c.jpg', '', '06a9c3d5ce2da9f8c69a4a3082357a8e', '4b3d09e6c82c6c51deb9d2a88ed3c91bb699783d', '1', '1481859782');
INSERT INTO `onethink_picture` VALUES ('246', '/Uploads/Picture/2016-12-16/585362dd52ce7.jpg', '', '6301de76a2a554a3869c2d0794d9d419', '897d9687a14658b1321c82a1b4e5e2bef1f7322e', '1', '1481859805');
INSERT INTO `onethink_picture` VALUES ('247', '/Uploads/Picture/2016-12-16/585362efe5eb8.jpg', '', '015f132291d70988d80dda1827a21e9c', 'f516f9421eab9f136b0eda3d01e3def4037f48cd', '1', '1481859823');
INSERT INTO `onethink_picture` VALUES ('248', '/Uploads/Picture/2016-12-16/585362fe5da36.jpg', '', '24f1471f29ea0be0b7e50e1a2229d8a9', '070c65e7005c71dbff29537496404bfd72988c21', '1', '1481859838');
INSERT INTO `onethink_picture` VALUES ('249', '/Uploads/Picture/2016-12-16/585363f5d2f69.jpg', '', '952a2bbebbbf4b3cec87a55002612b83', '7a8c4c85526374b76dbd29accdcd4795ba23a0d3', '1', '1481860085');
INSERT INTO `onethink_picture` VALUES ('250', '/Uploads/Picture/2016-12-16/585364a21a1e5.jpg', '', '03abf3fa1e60c21aa37ca3f518c269a9', 'dea814c561263560e4075863866b6672ffb45bf8', '1', '1481860256');
INSERT INTO `onethink_picture` VALUES ('251', '/Uploads/Picture/2016-12-16/5853848ee581c.jpg', '', 'cbb9840e82a7bee80740a517b756ccb2', '34717e797b3257351fa85e63996400d8c0ebf334', '1', '1481868430');
INSERT INTO `onethink_picture` VALUES ('252', '/Uploads/Picture/2016-12-16/585387b99f0ba.jpg', '', '371d2d1f79c8ad0bc121ddd2a3efaa11', '124193747080be7517b963de4d691bd616c55570', '1', '1481869239');
INSERT INTO `onethink_picture` VALUES ('253', '/Uploads/Picture/2016-12-16/585387c3c7494.jpg', '', 'd0898f1730d090ad3cfd57faf088b5fd', '2d98ebdee367afda90f093e2064029ed23d14305', '1', '1481869249');
INSERT INTO `onethink_picture` VALUES ('254', '/Uploads/Picture/2016-12-16/585387c4f0ad1.jpg', '', 'b99fddc89a799bfa4204af22713c2a45', '9aa0edc0acb369c1ebb9ceb1e29439a9a8be47ef', '1', '1481869251');
INSERT INTO `onethink_picture` VALUES ('255', '/Uploads/Picture/2016-12-16/585387c676f79.jpg', '', '4d8f30b6daecc7010a600f53a55f9b45', '3997a9a46123dc4d93318651a037b9aed943cddf', '1', '1481869253');
INSERT INTO `onethink_picture` VALUES ('256', '/Uploads/Picture/2016-12-16/585387c77f1f5.jpg', '', '0b9ca8165551c6abd1802d67ae54caf6', '651870f9e7cf8b5affcb6b37fba11c157badd902', '1', '1481869254');
INSERT INTO `onethink_picture` VALUES ('257', '/Uploads/Picture/2016-12-16/585387c8df5fe.jpg', '', '3e48b589fe8b1683b4ab3973b2a23e87', 'f2770ae11adf40ef0b1bd065749cf0010ae95aa5', '1', '1481869255');
INSERT INTO `onethink_picture` VALUES ('258', '/Uploads/Picture/2017-01-03/586b4ae8093a0.jpg', '', '1901beffa81162a8c3c7d01389df7c9a', 'f3c5e538bf98b9d4a8c804333ad2614d6d63f00a', '1', '1483426535');
INSERT INTO `onethink_picture` VALUES ('259', '/Uploads/Picture/2017-01-03/586b4ae8231b6.jpg', '', 'e1cd2281e2f0b9f171238017ff997c2d', '83cfafb552939e915a151e1d5677121a98aeeb4a', '1', '1483426536');
INSERT INTO `onethink_picture` VALUES ('260', '/Uploads/Picture/2017-01-04/586c6b4a08cc8.png', '', '46b1ae2463ef54a8a538ec75182e2245', '8f27c78252607004312fce6a0ccebbd992214877', '1', '1483500361');
INSERT INTO `onethink_picture` VALUES ('261', '/Uploads/Picture/2017-01-04/586c6b4ff2095.jpg', '', '40c08f0a9c99c73f78c92ddd11dfc3e4', '218445f4d1ce8ccc2b8c28a2a7caf6736e43006c', '1', '1483500367');
INSERT INTO `onethink_picture` VALUES ('262', '/Uploads/Picture/2017-01-04/586c6b5016113.jpg', '', 'beb6142218a1358ba40321ca815e488d', '32367b17669c4f63ec418ab580e963f7d70ae8ed', '1', '1483500368');
INSERT INTO `onethink_picture` VALUES ('263', '/Uploads/Picture/2017-01-04/586cc9aee4131.jpg', '', '41e4762df6c4c66d7158bfce33b7c57e', 'f1205da6881ac06470a66e873ae4f3a00938224b', '1', '1483524526');
INSERT INTO `onethink_picture` VALUES ('264', '/Uploads/Picture/2017-01-05/586dbe263354a.png', '', '7234a3cbec1d2ce260b504f43fa97b16', '2a0d35eec53dce2beb9987a8b45719f18a65b2b3', '1', '1483587110');
INSERT INTO `onethink_picture` VALUES ('265', '/Uploads/Picture/2017-01-05/586dbe2c01d9e.jpg', '', 'b3cae0a28777e91c8abc58521821fd58', '27655971a03a269ce1b57d33bc3564c3117a2553', '1', '1483587115');
INSERT INTO `onethink_picture` VALUES ('266', '/Uploads/Picture/2017-01-05/586df3587f7bd.png', '', 'c3020d74a761dc895199f6bcf0858007', '0ae836bd4d564c0b747d5e8e92339c80366169c5', '1', '1483600728');
INSERT INTO `onethink_picture` VALUES ('267', '/Uploads/Picture/2017-01-05/586df361e6e30.png', '', '4794026b69558db6605d75f03f34748b', 'a98713716162f8d2b412964bfe3b3e5be296b908', '1', '1483600737');
INSERT INTO `onethink_picture` VALUES ('268', '/Uploads/Picture/2017-01-05/586e032284a84.jpg', '', '7af9ea52860afc53aef5eee1cc203c81', 'bfaa712c047c82a5fcf699c42f2151b670a47350', '1', '1483604770');
INSERT INTO `onethink_picture` VALUES ('269', '/Uploads/Picture/2017-01-05/586e03388b117.jpg', '', '9a1b2f833c0ce81dfed9097e65b1a5a2', '687d258e0646cdda432ac32a15f0a55e8208a450', '1', '1483604792');
INSERT INTO `onethink_picture` VALUES ('299', '/Uploads/Picture/2017-02-21/58abe86f960f0.jpg', '', '6beb0138a2325304485508691370906a', 'ac1b926327fc32c0ceb99f4387be31fb1b108210', '1', '1487661167');
INSERT INTO `onethink_picture` VALUES ('328', '/Uploads/Picture/2017-03-10/58c2390367880.jpg', '', 'd81fca665ff735df1e0373fb2297c624', 'fad52a9d6c0bc2fe2f0b919cefcffddd9459d4d7', '1', '1489123587');
INSERT INTO `onethink_picture` VALUES ('300', '/Uploads/Picture/2017-02-21/58abe86fb493f.jpg', '', '92c4d455229a7f5c0fd2a0f5ed6ebafb', '3b96d438e388a4e908782b46c7e7180072c56dfe', '1', '1487661167');
INSERT INTO `onethink_picture` VALUES ('273', '/Uploads/Picture/2017-01-06/586f67b2ad99d.jpg', '', '7bf43c8e62a9599714982dc56f64c32c', '5bd0222b9945020d2a5a4af8c76065de242a8b89', '1', '1483696050');
INSERT INTO `onethink_picture` VALUES ('274', '/Uploads/Picture/2017-01-06/586f67b2c160a.jpg', '', 'd189888a9f868635e090e088af9516b1', 'f19567f7f37d7f9531bb42796531b0d6f00ccea8', '1', '1483696050');
INSERT INTO `onethink_picture` VALUES ('275', '/Uploads/Picture/2017-01-06/586f67b2d3b06.jpg', '', 'fb04de94ac3cb86df03713759e46f7f5', 'bd7a2f9198fc2372717ca7310b3abd8fa32f50b7', '1', '1483696050');
INSERT INTO `onethink_picture` VALUES ('276', '/Uploads/Picture/2017-01-07/587043dd8e47b.jpg', '', '932984dce9de6e29ba8dd7136964482d', '3a24e05318ad63b30179257381c9a028c7bb8f05', '1', '1483752413');
INSERT INTO `onethink_picture` VALUES ('277', '/Uploads/Picture/2017-01-07/587043ecdba47.png', '', 'bc77d157b13626087616a9ee0d650480', '4aae8aa069b9a3b74f99062b6a39ba8f78b684e4', '1', '1483752428');
INSERT INTO `onethink_picture` VALUES ('278', '/Uploads/Picture/2017-01-07/587043ecefe84.png', '', '8822ccdfa45c6b2fb791c776d4f4d7ef', 'f12d2499a523c2fff1a9c3d47478303bf7287627', '1', '1483752428');
INSERT INTO `onethink_picture` VALUES ('279', '/Uploads/Picture/2017-01-07/58704745c4353.jpg', '', '0b1b923f61412346090227372d48a55b', '7a95c150d2b92cfd90c69d935c25fee7b7e85646', '1', '1483753285');
INSERT INTO `onethink_picture` VALUES ('280', '/Uploads/Picture/2017-01-07/58704745dc229.jpg', '', 'a2a999635ca14296d8017b52ecbae73a', 'a4f39e3853f9d39c86978a70b0901d19b975f3ca', '1', '1483753285');
INSERT INTO `onethink_picture` VALUES ('298', '/Uploads/Picture/2017-02-21/58abe86420b5f.jpg', '', '8f81b6cb848120d01118d85b0de7f1a9', '5da6447cedc1a69bba8a37bbde6ea291a685a07e', '1', '1487661156');
INSERT INTO `onethink_picture` VALUES ('315', '/Uploads/Picture/2017-03-01/58b635a89ef89.jpg', '', '7769c8eed973e6474006903e96ebd4e6', '7b6145152c8d4b9d58a58c257411be3ad1e78be8', '1', '1488336296');
INSERT INTO `onethink_picture` VALUES ('283', '/Uploads/Picture/2017-01-10/587449e980936.jpg', '', '927782656d333138f0b0ac545c3b5761', 'c9bf09b8cdc984dfe409401296d019fba559ba8c', '1', '1484016105');
INSERT INTO `onethink_picture` VALUES ('284', '/Uploads/Picture/2017-01-10/587449f4540c9.jpg', '', 'a1817a6402f896c7a4f1ded5fac216d1', 'bfd4f54e325d2a15e2e45ce29da31d31538c2506', '1', '1484016116');
INSERT INTO `onethink_picture` VALUES ('285', '/Uploads/Picture/2017-01-10/587449f474c41.jpg', '', '2cc0c5a98e24a643eab1f37957110fea', '65e37b70f7480b1da97a5b22b6b10a52ada01189', '1', '1484016116');
INSERT INTO `onethink_picture` VALUES ('286', '/Uploads/Picture/2017-01-11/5875e1ae9ea74.jpg', '', '673fb4954f8fda6011d30ce78e95b06d', 'f752a8c3394a5d86e3c8f57d840eb910aa0e3703', '1', '1484120494');
INSERT INTO `onethink_picture` VALUES ('287', '/Uploads/Picture/2017-01-11/5875e1b394780.jpg', '', '7fbe1f1f679ce76e510f2c97da943733', '5ca6d6f01ceaa5899a7cce7e7671c25f120de7d9', '1', '1484120499');
INSERT INTO `onethink_picture` VALUES ('288', '/Uploads/Picture/2017-01-11/5875e1b3a6894.jpg', '', '350f5fe8d8a2c3ea718fec1c88d06645', '8dc1dbd0d37e5ec4b26e1320091f5b5982363daf', '1', '1484120499');
INSERT INTO `onethink_picture` VALUES ('289', '/Uploads/Picture/2017-01-11/5875e2b5d172b.jpg', '', '5d5190be8894c082efb2e32c9e74a8dc', '463b696cb89bc93798c225d109686153f2e9c34c', '1', '1484120757');
INSERT INTO `onethink_picture` VALUES ('290', '/Uploads/Picture/2017-01-11/5875e2bb1d970.jpg', '', '25cea3f1ee9d75b6744d09b9b5a8f85c', 'b5cc7760910f923095848d8f150d0f6ed3a7a05b', '1', '1484120763');
INSERT INTO `onethink_picture` VALUES ('291', '/Uploads/Picture/2017-01-11/5875e4ccc9899.jpg', '', '53d13d57b01cafc58a86dcdea0f86755', 'ef0ee19965be8c3f6636ddb675ddbddb353edb2b', '1', '1484121292');
INSERT INTO `onethink_picture` VALUES ('292', '/Uploads/Picture/2017-02-07/58998d87e2d66.png', '', 'f794da20a79b40306479e6f047cf2354', 'eceda53fc5e51d349dfd83a21c6bc5796ed9f0a6', '1', '1486458247');
INSERT INTO `onethink_picture` VALUES ('293', '/Uploads/Picture/2017-02-20/58aab429de7a8.jpg', '', '95337e9b060838435e6e1ce3a76ecdaf', 'ac1f4aefbe9fc5c803331c18c5727f6932886b6c', '1', '1487582249');
INSERT INTO `onethink_picture` VALUES ('294', '/Uploads/Picture/2017-02-20/58aac67d2408b.jpg', '', 'e8b2fab63881d28cbbf4495603d8f73a', '02d9fe150289c04694905ef16f65e843c42509b0', '1', '1487586941');
INSERT INTO `onethink_picture` VALUES ('296', '/Uploads/Picture/2017-02-21/58abe6cca3fbe.jpg', '', '38ebac3594524a970d98b68e69f79471', 'c609d76046b32405ccaf5fd58802fc8ef89996a1', '1', '1487660748');
INSERT INTO `onethink_picture` VALUES ('297', '/Uploads/Picture/2017-02-21/58abe6ccc186d.jpg', '', '2da7e79162209ff160b9ed917fda4529', '53c8a23f238f6efa7ae96e434b8b60042f3eb6e5', '1', '1487660748');
INSERT INTO `onethink_picture` VALUES ('301', '/Uploads/Picture/2017-02-21/58abe965aff4c.jpg', '', 'fefb7ee4ba25b7c794ff66391d5718be', '3dbea696fb9885356eb9351d90187560388dc05a', '1', '1487661413');
INSERT INTO `onethink_picture` VALUES ('302', '/Uploads/Picture/2017-02-21/58abe96be7b51.jpg', '', '52e58681515aec0a53e99538d4eace43', '0e7a2b08beef6a4e3b924aebc52613392beb7141', '1', '1487661419');
INSERT INTO `onethink_picture` VALUES ('303', '/Uploads/Picture/2017-02-21/58abe96c0bfb6.jpg', '', 'afd424026c666b8e6d1b5a108daafd53', '3e29df9513a42c8d66723242cfe9f20b611a60d4', '1', '1487661419');
INSERT INTO `onethink_picture` VALUES ('304', '/Uploads/Picture/2017-02-21/58abead760284.jpg', '', 'd97590588cf1290cd847f56387f700c0', '51918aeedfc18d9d821f7a9e762622d24abc029d', '1', '1487661783');
INSERT INTO `onethink_picture` VALUES ('305', '/Uploads/Picture/2017-02-21/58abeae68d891.jpg', '', '747d48f75216bf77cd7dcdbf7a65df47', 'a73aad1b28ac87cfdf3ddba6db0b57549e4b9280', '1', '1487661798');
INSERT INTO `onethink_picture` VALUES ('306', '/Uploads/Picture/2017-02-21/58abeae6bca84.jpg', '', '43f2b89611be49cc45c50c56aa72651f', '0a3136f17f3a27ecf5bbf086234d6f89f7cc02ca', '1', '1487661798');
INSERT INTO `onethink_picture` VALUES ('307', '/Uploads/Picture/2017-02-21/58abeb277b27a.jpg', '', '3cbf66f13ad29131c6b19a413b370adb', '42e775294d418c6b477ca00b97e15f188a475db4', '1', '1487661863');
INSERT INTO `onethink_picture` VALUES ('308', '/Uploads/Picture/2017-02-21/58abeb2d640b4.jpg', '', '7aadb22b2223fbf8e8625ce8ed60b0fa', '3a43b07065933d05ca2b7eb0859079e089bb9934', '1', '1487661869');
INSERT INTO `onethink_picture` VALUES ('309', '/Uploads/Picture/2017-02-21/58abeb2d7c372.jpg', '', 'b01f8bf5cd386dec160e3d489ddd2ab1', 'b07ff01b0f15b8e98229cfbfcd31a33e3a150073', '1', '1487661869');
INSERT INTO `onethink_picture` VALUES ('310', '/Uploads/Picture/2017-02-21/58abeb2d8d8ce.jpg', '', 'c425caa61a1ca7db7f05a912504b4fd1', 'c94e91ec4470e36ee09099f44992d9ff9ee799c3', '1', '1487661869');
INSERT INTO `onethink_picture` VALUES ('311', '/Uploads/Picture/2017-02-21/58abeb50b5591.jpg', '', '2bf7ffcb8b0a4ff540e503b9e056af12', '8c695b0093b4dd253739fc7cb3003f35e3f02dec', '1', '1487661904');
INSERT INTO `onethink_picture` VALUES ('312', '/Uploads/Picture/2017-02-21/58abeb5f165e6.jpg', '', '1c48209a20102f26a08078446109e0ae', '3b6927bd8727485f78caf470666666d837e17adf', '1', '1487661919');
INSERT INTO `onethink_picture` VALUES ('313', '/Uploads/Picture/2017-02-21/58abeb5f47331.jpg', '', 'af6ed39ff1ec55919974b52b6b4b801f', 'd2355d5e3092fc390ea5c7ae5f132d8d3960b17e', '1', '1487661919');
INSERT INTO `onethink_picture` VALUES ('314', '/Uploads/Picture/2017-03-01/58b635a2907b6.jpg', '', '16adbb861a2a1523fafa17a6361f5db2', '716c440780516042c290cab15d25c00c9fc66128', '1', '1488336290');
INSERT INTO `onethink_picture` VALUES ('316', '/Uploads/Picture/2017-03-01/58b65bb7a2f16.jpg', '', '59c5424fe488ee4c0e978378e1a7f38d', 'd9c29f728bf5463fda5db987c1303a02d2a26c8a', '1', '1488346039');
INSERT INTO `onethink_picture` VALUES ('317', '/Uploads/Picture/2017-03-01/58b65bbef0700.jpg', '', '98f3ebe09cae01081450d7f0b8e21370', 'a6e180c1f5992aae7d22b1cb674f5cc1cf0662c1', '1', '1488346046');
INSERT INTO `onethink_picture` VALUES ('318', '/Uploads/Picture/2017-03-01/58b65bbf18dcf.jpg', '', '7539216fbc27e243bb7efab2024cb8b5', '140c83daa944932e561bd925704aabf5cbb76737', '1', '1488346047');
INSERT INTO `onethink_picture` VALUES ('319', '/Uploads/Picture/2017-03-07/58be74e106527.jpg', '', 'b85126789fad4013c577f70c8630470f', 'edcf660d1febc0986eed2fa506761c4a98c9d371', '1', '1488876768');
INSERT INTO `onethink_picture` VALUES ('320', '/Uploads/Picture/2017-03-07/58be76c2cb7ad.jpg', '', 'a7998f684761bdc0f70d5765435b032a', '49539afaa5e3185b40c819a2fc3d883f3c21594f', '1', '1488877250');
INSERT INTO `onethink_picture` VALUES ('321', '/Uploads/Picture/2017-03-07/58be76e73af7f.jpg', '', '4f2ed0840132b4c5f8933ae72baff065', '593ca2d3ad057ae11e89443cb97adddf249d78dd', '1', '1488877287');
INSERT INTO `onethink_picture` VALUES ('322', '/Uploads/Picture/2017-03-07/58be7722971b3.jpg', '', '95eece1f4a101c70b0611c84543506e9', '4c204747b24e814dc84cced28fadb83bfb07af33', '1', '1488877346');
INSERT INTO `onethink_picture` VALUES ('323', '/Uploads/Picture/2017-03-07/58be7764c10bc.jpg', '', '22042cb88eefad02e21c51fc67a72e67', 'd685687df4cfacb267bc5441e55853e592ffba92', '1', '1488877412');
INSERT INTO `onethink_picture` VALUES ('324', '/Uploads/Picture/2017-03-07/58be7880dcb1e.jpg', '', '003c1ab369cdce30c29279ba72a77622', 'd6f005787b0f84c48e2bdf1da0f9bee4fdf206eb', '1', '1488877696');
INSERT INTO `onethink_picture` VALUES ('325', '/Uploads/Picture/2017-03-08/58bf6ee01765e.jpg', '', 'cb44789cb28059e4b407cd65657caf6c', '9cd622c4bfb20be7e3218c0e7185d8eb398f6fce', '1', '1488940767');
INSERT INTO `onethink_picture` VALUES ('326', '/Uploads/Picture/2017-03-08/58bf6f20ed705.jpg', '', '3fbdefa3b3329ad11ab011380a925843', 'bd43bc4223214c423ea9fd9f54345b5445c9e5e7', '1', '1488940832');
INSERT INTO `onethink_picture` VALUES ('327', '/Uploads/Picture/2017-03-10/58c21b100d4f4.jpg', '', '5d6a78f44e3a9fe98334d3ea5134f280', 'b7b8341899b9914b3d336d9760b6514233fabdd5', '1', '1489115919');
INSERT INTO `onethink_picture` VALUES ('329', '/Uploads/Picture/2017-03-10/58c23bfc43097.jpg', '', '93ad76ba6ec8b05e48fea2da55942e4b', '995326bae66c476f03e10a6a8c2b542420a972ec', '1', '1489124348');
INSERT INTO `onethink_picture` VALUES ('330', '/Uploads/Picture/2017-03-10/58c23c0c55926.jpg', '', 'a83b37aa0247f8020cdd243ddfb1be18', 'f7cfc76074770eec53f6b6273847c064d35cd925', '1', '1489124364');

-- ----------------------------
-- Table structure for onethink_product
-- ----------------------------
DROP TABLE IF EXISTS `onethink_product`;
CREATE TABLE `onethink_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类 （二级分类）',
  `description` text COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` date NOT NULL COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '数据状态 1展示 -1不展示',
  `attrs_titles` varchar(512) NOT NULL COMMENT '属性名称',
  `attrs_values` varchar(512) NOT NULL COMMENT '属性值',
  `gprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `gvipprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `sell_num` int(10) NOT NULL DEFAULT '0' COMMENT '出售数量',
  `hao_num` int(10) NOT NULL DEFAULT '0' COMMENT '好评数量',
  `buyer_num` int(10) DEFAULT '0' COMMENT '购买人数',
  `image` varchar(128) NOT NULL COMMENT '图片地址',
  `imglist` varchar(128) NOT NULL COMMENT '幻灯片',
  `order_num` int(10) NOT NULL DEFAULT '0' COMMENT '排列序号',
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_cat` tinyint(1) NOT NULL DEFAULT '0',
  `depot_num` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  `pj_num` int(10) NOT NULL DEFAULT '0' COMMENT '评价数量',
  `express_money` int(10) NOT NULL DEFAULT '0' COMMENT '运费',
  `content` text NOT NULL COMMENT '内容',
  `rebate_time` smallint(6) NOT NULL DEFAULT '0',
  `rebate_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `distribution_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `share_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `spell_num` int(11) NOT NULL,
  `join_num` int(11) NOT NULL,
  `smoney` decimal(10,2) NOT NULL,
  `is_hot` int(11) DEFAULT '0' COMMENT '1热卖推荐',
  `is_new` int(5) DEFAULT '0' COMMENT '1新品推荐',
  `home_image` varchar(255) DEFAULT NULL COMMENT '首页显示图片',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='产品模型基础表';

-- ----------------------------
-- Records of onethink_product
-- ----------------------------
INSERT INTO `onethink_product` VALUES ('1', '1', '', '七里海河蟹', '6', '100', '0', '0', '1', '2', '0', '0', '0', '1', '2016-11-30', '0', '268', '0', '0', '0', '1486374913', '1486374913', '1', '', '', '100.00', '0.00', '100.00', '108', '0', '6', '/Uploads/Picture/2016-11-10/5824464b74bae.jpg', '119,168', '100', '0', '0', '92', '0', '100', '<img src=\"/Uploads/Editor/2017-02-22/58ad31e06868e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2017-02-22/58ad31e90472b.jpg\" alt=\"\" />质量很好', '0', '0.00', '100.00', '100.00', '11', '10', '50.00', '1', '0', null);
INSERT INTO `onethink_product` VALUES ('19', '1', '', 'testtest', '1', 'sdf', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1488345996', '1488345996', '1', '颜色', '白色=红色', '30.00', '0.00', '50.00', '0', '0', '0', '/Uploads/Picture/2017-03-01/58b635a2907b6.jpg', '298,300,315', '0', '0', '0', '555', '0', '0', 'dsfsd', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('20', '1', '', '我的测试商品', '1', '而沃尔沃', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '1', '0', '0', '0', '1488346048', '1488346048', '1', '', '', '0.01', '0.00', '1.00', '0', '0', '0', '/Uploads/Picture/2017-03-01/58b65bb7a2f16.jpg', '317,318', '0', '0', '0', '454534', '0', '0', '二玩儿', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('2', '1', '', '龙虾', '6', '', '0', '0', '1', '2', '0', '0', '0', '1', '2016-11-30', '0', '36', '0', '0', '0', '1478774544', '1478774544', '1', '', '', '100.00', '0.00', '100.00', '103', '0', '3', '/Uploads/Picture/2016-11-10/5824463f7c0bb.jpg', '118,167', '10', '0', '1', '97', '0', '10', '<img src=\"/Uploads/Editor/2016-11-10/58244dec038f3.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244dec39386.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244dec6fe6a.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244deca9e9a.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244ded6d156.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244dedf2be1.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244dee29eb7.jpg\" alt=\"\" />', '0', '0.00', '1.00', '1.00', '100', '10', '40.00', '1', '0', null);
INSERT INTO `onethink_product` VALUES ('3', '1', '', '金沙鲈鲤', '6', '', '0', '0', '2', '2', '0', '0', '0', '1', '2016-11-30', '0', '23', '0', '0', '0', '1478774532', '1478774532', '1', '', '', '100.00', '0.00', '100.00', '101', '0', '1', '/Uploads/Picture/2016-11-10/58244635ade45.jpg', '117,166', '10', '0', '0', '99', '0', '10', '<img src=\"/Uploads/Editor/2016-11-10/58244c5bea992.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244c5c369ce.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244c5c72760.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244c5c981ce.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244c5cc8afb.jpg\" alt=\"\" />', '0', '0.00', '1.00', '1.00', '100', '10', '30.00', '1', '0', null);
INSERT INTO `onethink_product` VALUES ('4', '1', '', '金塞克鱼', '6', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-30', '0', '98', '0', '0', '0', '1478774520', '1478774520', '1', '', '', '100.00', '0.00', '100.00', '104', '0', '2', '/Uploads/Picture/2016-11-10/582443c0a32d9.jpg', '116,149', '10', '1', '0', '96', '0', '10', '<img src=\"/Uploads/Editor/2016-11-10/582446ea590bd.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/582446ea9d826.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/582446ead686c.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/582446eb1a71c.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/582446eb49f6b.jpg\" alt=\"\" />', '0', '0.00', '1.00', '1.00', '100', '10', '20.00', '0', '1', null);
INSERT INTO `onethink_product` VALUES ('5', '1', '', '潮白黑鱼', '7', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-30', '0', '3', '0', '0', '0', '1478772257', '1478772257', '-1', '', '', '100.00', '0.00', '100.00', '10', '0', '0', '/Uploads/Picture/2016-11-10/58244620161d1.jpg', '115', '0', '0', '1', '10', '0', '0', '', '0', '0.00', '0.00', '0.00', '10', '1', '50.00', '0', '1', null);
INSERT INTO `onethink_product` VALUES ('7', '1', '', '清江鱼', '7', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-15', '0', '36', '0', '0', '0', '1478934572', '1478934572', '1', '', '', '100.00', '0.00', '10.00', '100', '0', '0', '/Uploads/Picture/2016-11-10/58244603b257e.jpg', '120,164', '0', '1', '0', '100', '0', '0', '<img src=\"/Uploads/Editor/2016-11-10/58244cd27f566.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244cd2af507.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244cd2d7c35.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244cd32123d.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244cd350211.jpg\" alt=\"\" />', '0', '0.00', '0.00', '0.00', '10', '0', '100.00', '0', '1', null);
INSERT INTO `onethink_product` VALUES ('6', '1', '', '阿姆鲥鱼', '7', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-08', '0', '66', '0', '0', '0', '1478774508', '1478774508', '1', '', '', '250.00', '0.00', '240.00', '10', '0', '0', '/Uploads/Picture/2016-11-10/58244610ee166.jpg', '165', '0', '1', '1', '100', '0', '0', '<img src=\"/Uploads/Editor/2016-11-10/58244b6cbba90.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244b6cf410a.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244b6d368b0.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244b6d62afd.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244b6da60ad.jpg\" alt=\"\" />', '0', '0.00', '0.00', '0.00', '5', '0', '100.00', '0', '1', null);
INSERT INTO `onethink_product` VALUES ('8', '1', '', '瓦氏华子鱼', '7', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-19', '0', '53', '0', '0', '0', '1478934557', '1478934557', '1', '', '', '100.00', '0.00', '100.00', '1', '0', '1', '/Uploads/Picture/2016-11-10/582445f936a89.jpg', '121,163', '0', '1', '0', '99', '0', '0', '<img src=\"/Uploads/Editor/2016-11-10/58244a9e6e8f4.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244a9eb019e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244a9ee2217.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244a9f2ef9a.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244a9f5fc28.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2016-11-10/58244a9f906e6.jpg\" alt=\"\" />', '0', '0.00', '0.00', '0.00', '10', '10', '100.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('9', '1', '', '五彩斑', '8', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-29', '0', '54', '0', '0', '0', '1478934537', '1478934537', '1', '', '', '100.00', '0.00', '100.00', '6', '0', '6', '/Uploads/Picture/2016-11-10/5823dbffe6eb0.jpg', '124,126', '0', '1', '0', '94', '0', '0', '<p>\r\n	<img src=\"/Uploads/Editor/2016-11-10/582447d6a294f.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2016-11-10/582447d6ecf2f.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2016-11-10/582447d723920.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2016-11-10/582447d75941c.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2016-11-10/582447d787484.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2016-11-10/582447d7b3b98.jpg\" alt=\"\" /> \r\n</p>', '0', '0.00', '0.00', '0.00', '10', '10', '100.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('10', '1', '', '美颂蛋糕', '8', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-29', '0', '47', '0', '0', '0', '1481869312', '1481869312', '1', '', '', '80.00', '0.00', '100.00', '0', '0', '0', '/Uploads/Picture/2016-12-16/585387b99f0ba.jpg', '123,253,254,255,256,257', '0', '1', '1', '100', '0', '0', '', '0', '0.00', '0.00', '0.00', '10', '10', '100.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('11', '1', '', '111', '8', '', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-10', '0', '0', '0', '0', '0', '1478774373', '1478774373', '1', '', '', '0.00', '0.00', '0.00', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '111', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('12', '1', '', '测试商品', '8', '时发生地方', '0', '0', '4', '2', '0', '0', '0', '1', '2016-11-30', '0', '10', '0', '0', '0', '1479959687', '1479959687', '-1', '', '', '0.00', '0.00', '50.00', '1', '0', '0', '/Uploads/Picture/2016-11-15/582aba4f978a5.png', '170', '0', '1', '0', '5998', '0', '0', '<p>\r\n	胜多负少\r\n</p>\r\n<p>\r\n	舒服舒服\r\n</p>', '0', '0.00', '0.00', '0.00', '1', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('13', '1', '', '热帖维特', '9', null, '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1483524528', '1483524528', '-1', '', '', '12.00', '0.00', '23.00', '0', '0', '0', '/Uploads/Picture/2017-01-04/586cc9aee4131.jpg', '', '0', '0', '0', '324324', '0', '0', '', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('14', '1', '', 'ceshi', '9', null, '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '1', '0', '0', '0', '1483597488', '1483597488', '1', '', '', '1.00', '0.00', '12.00', '0', '0', '0', '', '', '0', '1', '0', '12312', '0', '0', '', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('15', '1', '', 'ceshil', '9', null, '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '12', '0', '0', '0', '1484043144', '1484043144', '1', '', '', '2.00', '0.00', '13.00', '0', '0', '0', '/Uploads/Picture/2017-01-05/586e032284a84.jpg', '', '0', '0', '0', '21312', '0', '0', '<img src=\"/Uploads/Editor/2017-01-10/5874aa948d231.jpg\" alt=\"\" />', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('16', '1', '', 'test', '9', null, '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '7', '0', '0', '0', '1484040391', '1484040391', '1', '', '', '2.00', '0.00', '45.00', '0', '0', '0', '/Uploads/Picture/2017-01-05/586e03388b117.jpg', '', '0', '0', '0', '21321', '0', '0', '<img src=\"/Uploads/Editor/2017-01-10/5874a8c55c6eb.jpg\" alt=\"\" />', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('17', '1', '', '测试一', '9', '&lt;img src=&quot;/Uploads/Editor/2017-01-10/5874b7a1e1263.jpg&quot; alt=&quot;&quot; /&gt;', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '7', '0', '0', '0', '1484044197', '1484044197', '1', '', '', '12.00', '0.00', '213.00', '0', '0', '0', '', '', '0', '0', '0', '243241', '0', '0', '<img src=\"/Uploads/Editor/2017-01-10/5874b416ac711.jpg\" alt=\"\" />', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('18', '1', '', '1', '6', '111111', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '2', '0', '0', '0', '1488854229', '1488854229', '1', '颜色,尺寸', '红色=绿色,12=15', '1.00', '0.00', '1.00', '1', '0', '0', '/Uploads/Picture/2016-11-10/5824464b74bae.jpg', '', '0', '0', '0', '1', '0', '0', '<p>\r\n	woshi文字啊\r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2017-02-22/58ad31e06868e.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2017-02-22/58ad31e90472b.jpg\" alt=\"\" /> \r\n</p>', '0', '0.00', '0.00', '1.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('21', '1', '', 'test', '1', '测试使用，请勿操作', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1488876771', '1488876771', '-1', '', '', '3.00', '0.00', '12.00', '0', '0', '0', '/Uploads/Picture/2017-03-07/58be74e106527.jpg', '', '0', '1', '0', '10', '0', '0', '小商品大智慧', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('22', '1', '', 'test的商品，这个是大厨的产品好声音的是就算 是是是随时是是11', '1', 'test专用', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1489045733', '1489045733', '-1', '12,13', '12,13', '12.00', '0.00', '20.00', '0', '0', '0', '/Uploads/Picture/2017-03-07/58be74e106527.jpg', '323', '0', '0', '0', '10', '0', '0', '<img src=\"/Uploads/Editor/2017-03-07/58be775b93437.jpg\" alt=\"\" />', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('23', '1', '', '34', '1', '11', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1489042112', '1489042112', '1', '', '', '11.00', '0.00', '12.00', '0', '0', '0', '', '', '0', '0', '0', '11', '0', '0', '11', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('24', '1', '', '1', '2', '11', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1489043658', '1489043658', '1', '', '', '1.00', '0.00', '1.00', '0', '0', '0', '', '', '1', '0', '0', '11', '0', '0', '11', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('25', '1', '', '2', '2', '22', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1489043672', '1489043672', '1', '', '', '2.00', '0.00', '2.00', '0', '0', '0', '', '', '0', '0', '0', '2', '0', '0', '2222', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', null);
INSERT INTO `onethink_product` VALUES ('26', '1', '', 'test！@##￥￥', '1', '测试使用的', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1489368202', '1489368202', '1', '尺寸,颜色,腰围', '150,红色,红色=蓝色=紫色,15=16=17', '1000.00', '0.00', '1200.00', '10', '0', '0', '/Uploads/Picture/2017-03-10/58c23c0c55926.jpg', '', '5', '0', '0', '100', '0', '0', '打击啊一起来设计', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', '/Uploads/Picture/2017-03-10/58c23bfc43097.jpg');
INSERT INTO `onethink_product` VALUES ('27', '1', '', 'test12', '1', '122', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1489368631', '1489368631', '1', '颜色,尺寸', '红色=蓝色=绿色,120=150=160', '12.00', '0.00', '123.00', '0', '0', '0', '/Uploads/Picture/2017-03-07/58be74e106527.jpg', '323', '0', '0', '0', '100', '0', '0', '1111', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', '/Uploads/Picture/2017-03-10/58c21b100d4f4.jpg');
INSERT INTO `onethink_product` VALUES ('28', '1', '', 'test13', '1', '11', '0', '0', '4', '2', '0', '0', '0', '1', '0000-00-00', '0', '0', '0', '0', '0', '1489371300', '1489371300', '1', '颜色', '红色=黄色=蓝色', '122.00', '0.00', '12.00', '0', '0', '0', '', '', '0', '0', '0', '11', '0', '0', '11', '0', '0.00', '0.00', '0.00', '0', '0', '0.00', '0', '0', '');

-- ----------------------------
-- Table structure for onethink_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `onethink_product_attr`;
CREATE TABLE `onethink_product_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_value` varchar(128) NOT NULL COMMENT '属性值',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '普通价格',
  `oldprice` decimal(10,2) DEFAULT NULL COMMENT '原价格',
  `stock` int(10) DEFAULT '0' COMMENT '库存数量',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_product_attr
-- ----------------------------
INSERT INTO `onethink_product_attr` VALUES ('313', '2', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('310', '6', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('293', '5', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('312', '3', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('330', '1', '12只', '50.00', '90.00', '100');
INSERT INTO `onethink_product_attr` VALUES ('72', '14', '珠光白', '298.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('71', '14', '宝石绿', '298.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('70', '14', '沙滩红', '298.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('69', '14', '墨绿色', '258.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('68', '14', '灰色', '258.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('67', '14', '宝石蓝', '258.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('66', '14', '绿色', '258.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('65', '14', '蓝色', '258.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('76', '13', '蓝色', '664.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('75', '13', '绿色', '654.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('74', '13', '红色', '654.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('73', '14', '黑色', '298.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('326', '12', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('251', '43', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('311', '4', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('89', '15', '红色', '235.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('90', '15', '蓝色', '235.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('91', '15', '绿色', '255.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('92', '16', '红色', '295.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('93', '16', '绿色', '298.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('196', '17', '绿色', '275.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('195', '17', '蓝色', '278.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('194', '17', '红色', '278.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('370', '18', '绿色15', '1.00', '2.00', '1000');
INSERT INTO `onethink_product_attr` VALUES ('369', '18', '绿色12', '1.00', '2.00', '1000');
INSERT INTO `onethink_product_attr` VALUES ('368', '18', '红色15', '1.00', '2.00', '1000');
INSERT INTO `onethink_product_attr` VALUES ('199', '20', '绿色', '24.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('198', '20', '蓝色', '24.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('197', '20', '红色', '24.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('321', '7', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('226', '21', '绿色小美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('225', '21', '绿色小阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('224', '21', '绿色小耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('223', '21', '绿色中美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('222', '21', '绿色中阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('221', '21', '绿色中耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('220', '21', '绿色大美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('219', '21', '绿色大阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('218', '21', '绿色大耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('217', '21', '蓝色小美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('216', '21', '蓝色小阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('215', '21', '蓝色小耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('214', '21', '蓝色中美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('213', '21', '蓝色中阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('212', '21', '蓝色中耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('211', '21', '蓝色大美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('210', '21', '蓝色大阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('209', '21', '蓝色大耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('208', '21', '红色小美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('207', '21', '红色小阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('206', '21', '红色小耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('205', '21', '红色中美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('204', '21', '红色中阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('203', '21', '红色中耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('202', '21', '红色大美特', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('201', '21', '红色大阿迪', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('200', '21', '红色大耐克', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('181', '23', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('329', '10', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('319', '9', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('320', '8', '', '0.00', null, '100');
INSERT INTO `onethink_product_attr` VALUES ('331', '1', '10只', '40.00', '80.00', '100');
INSERT INTO `onethink_product_attr` VALUES ('372', '22', '1213', '12.00', '12.00', '12');
INSERT INTO `onethink_product_attr` VALUES ('380', '26', '150红色红色', '12.00', '15.00', '100');
INSERT INTO `onethink_product_attr` VALUES ('354', '19', '红色', '16.00', '28.00', '9999');
INSERT INTO `onethink_product_attr` VALUES ('353', '19', '白色', '12.00', '15.00', '2312');
INSERT INTO `onethink_product_attr` VALUES ('367', '18', '红色12', '50.00', '51.00', '1000');
INSERT INTO `onethink_product_attr` VALUES ('381', '26', '150红色蓝色', '12.00', '15.00', '100');
INSERT INTO `onethink_product_attr` VALUES ('382', '26', '150红色紫色', '12.00', '15.00', '100');
INSERT INTO `onethink_product_attr` VALUES ('387', '27', '红色150', '12.00', '15.00', '50');
INSERT INTO `onethink_product_attr` VALUES ('386', '27', '红色120', '12.00', '15.00', '100');
INSERT INTO `onethink_product_attr` VALUES ('388', '27', '红色160', '12.00', '15.00', '30');
INSERT INTO `onethink_product_attr` VALUES ('389', '27', '蓝色120', '12.00', '15.00', '56');
INSERT INTO `onethink_product_attr` VALUES ('390', '27', '蓝色150', '12.00', '15.00', '123');
INSERT INTO `onethink_product_attr` VALUES ('391', '27', '蓝色160', '12.00', '15.00', '236');
INSERT INTO `onethink_product_attr` VALUES ('392', '27', '绿色120', '12.00', '15.00', '100');
INSERT INTO `onethink_product_attr` VALUES ('393', '27', '绿色150', '12.00', '15.00', '12');
INSERT INTO `onethink_product_attr` VALUES ('394', '27', '绿色160', '12.00', '15.00', '10');
INSERT INTO `onethink_product_attr` VALUES ('395', '28', '红色', '12.00', '15.00', '12');
INSERT INTO `onethink_product_attr` VALUES ('396', '28', '黄色', '12.00', '15.00', '123');
INSERT INTO `onethink_product_attr` VALUES ('397', '28', '蓝色', '12.00', '15.00', '1222');

-- ----------------------------
-- Table structure for onethink_product_model
-- ----------------------------
DROP TABLE IF EXISTS `onethink_product_model`;
CREATE TABLE `onethink_product_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` varchar(255) NOT NULL COMMENT '商品编号',
  `kaifajijie` varchar(255) NOT NULL COMMENT '开发季节',
  `gnsx` varchar(255) NOT NULL COMMENT '功能属性',
  `dptk` varchar(255) NOT NULL COMMENT '大牌同款',
  `dkfs` varchar(255) NOT NULL COMMENT '打开方式',
  `nbjg` varchar(255) NOT NULL COMMENT '内部结构',
  `tuan` varchar(255) NOT NULL COMMENT '图案',
  `changhe` varchar(255) NOT NULL COMMENT '场合',
  `daxiao` varchar(255) NOT NULL COMMENT '大小',
  `size` varchar(255) NOT NULL COMMENT '尺寸',
  `chengpinchandi` varchar(255) NOT NULL COMMENT '成品产地',
  `cailiaochandi` varchar(255) NOT NULL COMMENT '材料产地',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_product_model
-- ----------------------------
INSERT INTO `onethink_product_model` VALUES ('1', '16100048', '2015秋冬季', '抱枕', '其它', '单独的', '溶质', '其它', '休闲,校园,聚会', '普通款', '其它', '中国', '中国');
INSERT INTO `onethink_product_model` VALUES ('22', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('23', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('24', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('25', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('26', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('27', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('2', '商品编号', '商品编号', '功能属性', '大牌同款', '打开方式', '内部结构', '图案', '场合', '大小', '尺寸', '成品产地', '材料产地');
INSERT INTO `onethink_product_model` VALUES ('14', '000000', '秋季', '功能属性', '大牌同款', '打开方式', '内部结构', '图案', '场合', '大小', '尺寸', '成品产地', '材料产地');
INSERT INTO `onethink_product_model` VALUES ('18', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('19', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('20', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('21', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `onethink_product_model` VALUES ('28', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for onethink_rebate_record
-- ----------------------------
DROP TABLE IF EXISTS `onethink_rebate_record`;
CREATE TABLE `onethink_rebate_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_sn` varchar(128) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `day` date NOT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_rebate_record
-- ----------------------------
INSERT INTO `onethink_rebate_record` VALUES ('13', '20', '12', '20160929101240209', '20', '2016-10-29', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('14', '20', '12', '20160929101240209', '20', '2016-11-28', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('15', '20', '12', '20160929101240209', '20', '2016-12-28', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('16', '18', '12', '20160929101240209', '20', '2017-01-27', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('17', '18', '12', '20160929101240209', '20', '2017-02-26', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('18', '18', '12', '20160929101240209', '20', '2017-03-28', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('19', '18', '12', '20160929101240209', '20', '2017-04-27', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('20', '18', '12', '20160929101240209', '20', '2017-05-27', '100.00', '0');
INSERT INTO `onethink_rebate_record` VALUES ('21', '19', '23', '20161009120400282', '20', '2016-11-08', '100.00', '0');

-- ----------------------------
-- Table structure for onethink_share_record
-- ----------------------------
DROP TABLE IF EXISTS `onethink_share_record`;
CREATE TABLE `onethink_share_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `share_id` int(10) DEFAULT NULL COMMENT '分享者id',
  `user_id` int(10) DEFAULT '0' COMMENT '用户id',
  `addtime` int(10) DEFAULT NULL COMMENT '分享时间',
  `year` varchar(10) NOT NULL DEFAULT '' COMMENT '年份',
  `month` varchar(10) NOT NULL DEFAULT '' COMMENT '月份',
  `day` varchar(10) NOT NULL DEFAULT '' COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_share_record
-- ----------------------------
INSERT INTO `onethink_share_record` VALUES ('1', null, '3', '2', '', '11', '23');
INSERT INTO `onethink_share_record` VALUES ('2', null, '2', '3', '', '11', '23');
INSERT INTO `onethink_share_record` VALUES ('3', null, '2', '3', '', '11', '23');
INSERT INTO `onethink_share_record` VALUES ('4', null, '2', '4', '', '11', '23');
INSERT INTO `onethink_share_record` VALUES ('5', null, '3', '3', '', '11', '23');
INSERT INTO `onethink_share_record` VALUES ('6', null, '0', null, '', '', '');

-- ----------------------------
-- Table structure for onethink_spell
-- ----------------------------
DROP TABLE IF EXISTS `onethink_spell`;
CREATE TABLE `onethink_spell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户序号',
  `start_date` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_date` int(10) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '开团人数',
  `oldprice` decimal(10,2) DEFAULT NULL COMMENT '原价格',
  `price` decimal(10,2) NOT NULL COMMENT '开团价格',
  `order_num` int(11) NOT NULL COMMENT '排列序号',
  `express_money` decimal(11,2) NOT NULL COMMENT '快递费用',
  `state` int(2) DEFAULT '1' COMMENT '拼团状态，1未开始，2拼团中，3拼团结束(3拼团完成，4拼团失败)',
  `addtime` int(10) DEFAULT NULL COMMENT '拼团发布时间',
  `title` varchar(255) DEFAULT NULL COMMENT '拼团标题',
  `status` tinyint(2) DEFAULT '1' COMMENT '显示状态，1显示，0隐藏',
  `content` text COMMENT '拼团详细内容',
  `imglist` varchar(255) DEFAULT NULL COMMENT '轮播图',
  `image` varchar(150) DEFAULT NULL COMMENT '封面图',
  `describe` varchar(300) DEFAULT NULL COMMENT '分享推荐语',
  `guarantee` text COMMENT '质量保证描述',
  `is_home` tinyint(2) DEFAULT '0' COMMENT '是否推荐到首页，0否，1是',
  `sell_num` int(10) DEFAULT '0' COMMENT '销量',
  `max_num` int(11) DEFAULT '1' COMMENT '最多可购买数量',
  `stock_num` int(11) DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='拼团活动信息表';

-- ----------------------------
-- Records of onethink_spell
-- ----------------------------
INSERT INTO `onethink_spell` VALUES ('15', '0', '1487654033', '1498836233', '5', '60.00', '10.00', '0', '0.00', '2', '1483696059', 'ceshiceshiceshi', '1', '<p>\r\n	sfdsfsdf\r\n</p>\r\n<p>\r\n	<a href=\"http://baidu.com\" target=\"_blank\"><span style=\"color:#009900;\">sfsfsdf</span></a> \r\n</p>', '273,274,275,308,309,310', '/Uploads/Picture/2017-02-21/58abeb277b27a.jpg', 'wrewerwe', 'werwerwer', '1', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('14', '0', '1487657681', '1501485341', '3', '33.00', '11.00', '0', '0.00', '2', '1483673806', '我的测试', '0', '<p>\r\n	dsfjldskjfljsdkf\r\n</p>\r\n<p>\r\n	sjdfklsdfk\r\n</p>\r\n<p>\r\n	jriewojrewo\r\n</p>\r\n<p>\r\n	sdklmnl\r\n</p>\r\n<p>\r\n	sdjfklsnl\r\n</p>\r\n<p>\r\n	sdjfklsfjsdklfjksldjf456954415t64rew564we5r4we5\r\n</p>', '270,271,263,312,307,313', '/Uploads/Picture/2017-02-21/58abeb50b5591.jpg', '蜜罐儿的推荐语', '<p>\r\n	放开你家门口了诶欧瑞欧文\r\n</p>\r\n<p>\r\n	唯品买了房极乐空间是\r\n</p>\r\n<p>\r\n	监考老师都放假了双方\r\n</p>', '0', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('16', '0', '1487639619', '1489108959', '3', '50.00', '10.00', '0', '0.00', '3', '1483752469', '我的测试', '1', '<p>\r\n	是减肥开始了交罚款了是\r\n</p>\r\n<p>\r\n	我问瑞文u我诶\r\n</p>\r\n<p>\r\n	3489498395348\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '277,278,305,304,306', '/Uploads/Picture/2017-02-21/58abead760284.jpg', '推荐推荐推荐', '<p>\r\n	质量保证\r\n</p>\r\n<p>\r\n	即时发货\r\n</p>', '1', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('17', '0', '1487654036', '1503731517', '5', '60.00', '5.00', '0', '0.00', '2', '1483753294', '测试0001', '1', '水电费水电费水电费', '279,280', '/Uploads/Picture/2017-01-06/586f0ea30dac4.jpg', '收到发送到是多福多寿', '是对方身份但是访问而微软', '0', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('18', '0', '1487606429', '1490973809', '1', '3.00', '1.00', '0', '0.00', '3', '1483790287', 'pppppppp', '1', '<img src=\"/Uploads/Editor/2017-01-09/5873232ea8fcf.jpg\" alt=\"\" /> \r\n<p>\r\n	5641651515\r\n</p>\r\n<p>\r\n	513\r\n</p>', '282', '/Uploads/Picture/2017-01-07/5870d7c1bb51a.jpg', '313013', '<img src=\"/Uploads/Editor/2017-01-09/587324aee4cc0.jpg\" alt=\"\" />1651023', '0', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('19', '0', '1487656805', '1496211245', '2', '36.00', '1.00', '0', '0.00', '2', '1484016157', '我的拼团1', '1', '<p>\r\n	UR哦我如\r\n</p>\r\n<p>\r\n	<img src=\"/Uploads/Editor/2017-01-10/58744a0a35594.jpg\" alt=\"\" /> \r\n</p>', '284,285', '/Uploads/Picture/2017-01-10/587449e980936.jpg', '拼团测试的拉', '<img src=\"/Uploads/Editor/2017-01-10/5874b5ceb739a.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2017-01-10/58744a1b6bc9d.jpg\" alt=\"\" />', '1', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('20', '0', '1487520000', '1490923140', '23', '12.00', '1.00', '0', '0.00', '3', '1484043909', 'werewr测试拼团名称很长情况测试拼团名称很长情况测试拼团名称很长情况测试拼团名称很长情况测试拼团名称很长情况测试拼团名称很长情况测试拼团名称很长情况', '1', '<img src=\"/Uploads/Editor/2017-01-10/5874b67b4145d.jpg\" alt=\"\" />', '287,288,302,303', '/Uploads/Picture/2017-02-21/58abe965aff4c.jpg', 'sfdsdfds\r\ndfgdf', '<p>\r\n	<img src=\"/Uploads/Editor/2017-01-10/5874b683b9c0b.png\" alt=\"\" />sdfsfsdfsdfdfgfd\r\n</p>\r\n<p>\r\n	fdsdfsfd\r\n</p>', '0', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('21', '0', '1487606400', '1496160048', '21', '12.00', '1.00', '0', '0.00', '2', '1484120797', '测试测试', '1', '而分为<img src=\"/Uploads/Editor/2017-01-11/5875e2c8a2d5f.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2017-01-11/5875e2c8bdb15.jpg\" alt=\"\" /><img src=\"/Uploads/Editor/2017-01-11/5875e2c8dbf7c.jpg\" alt=\"\" />', '290,289,299,300', '/Uploads/Picture/2017-02-21/58abe86420b5f.jpg', '我符文', '<p>\r\n	<img src=\"/Uploads/Editor/2017-01-11/5875e2d952808.png\" alt=\"\" /><img src=\"/Uploads/Editor/2017-01-11/5875e2d96d5bf.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	丰东股份地方都\r\n</p>', '0', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('22', '0', '1487520000', '1490858286', '3', '50.00', '30.00', '0', '0.00', '3', '1486458253', 'ceshitest', '1', '<p>\r\n	sfdsf&nbsp;\r\n</p>\r\n<p>\r\n	dskjsljsljsl荆防颗粒大杀四方代理商\r\n</p>\r\n<p>\r\n	我我家人围殴我如我谱软件&nbsp;\r\n</p>', '292,296,297', '/Uploads/Picture/2017-02-21/58abe6bd206b5.jpg', '推荐推荐强烈推荐', 'sdf', '0', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('23', '0', '1489115820', '1489720260', '2', '123.00', '0.01', '0', '0.00', '3', '1489115934', 'test', '1', '测试', '327', '/Uploads/Picture/2017-03-07/58be74e106527.jpg', 'test', 'test', '0', '0', '1', '100');
INSERT INTO `onethink_spell` VALUES ('24', '0', '1489459680', '1490753400', '5', '2.00', '0.01', '0', '0.00', '3', '1489459774', 'test测试', '1', '大家松紧带但是但是爱的死哦的欧式待地撒娇倒是基地欧萨蒂萨冻死蒂萨的搜我啊京东is的哦萨迪搜但是胸大肌搜啊基地欧萨懂撒蒂萨Dois都赛德搜到搜到欧式打快点斯柯达死哦的搜到稍等是大傻吊是', '319', '/Uploads/Picture/2017-03-07/58be7722971b3.jpg', '是滴是滴稍等是的发生是 是随时是的稍等是的发生辅导费三分法第三方胜多负少的的', '的发生佛挡杀佛辅导费啥地方是滴是滴上刀山山东卫视多所多无多所是滴是滴稍等的', '0', '0', '1', '100');

-- ----------------------------
-- Table structure for onethink_spellorder
-- ----------------------------
DROP TABLE IF EXISTS `onethink_spellorder`;
CREATE TABLE `onethink_spellorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `team_id` int(10) DEFAULT '0' COMMENT '拼团分组id',
  `spell_id` int(10) DEFAULT '0' COMMENT '拼团id',
  `spell_num` int(10) DEFAULT '1' COMMENT '购买数量',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态，0未付款，1待发货，2待收货，3已完成',
  `sn` varchar(128) NOT NULL COMMENT '订单编号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总价',
  `express_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单运费金额',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提货方式,0送货，1自提',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户地址id',
  `addtime` int(20) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `paytype` tinyint(1) DEFAULT '0' COMMENT '支付方式，0微信支付，1余额支付,2 支付宝支付',
  `paytime` int(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `note` varchar(300) DEFAULT NULL COMMENT '买家留言',
  `is_drawback` tinyint(2) DEFAULT '0' COMMENT '是否退款，0未退，1已退',
  `sendtime` int(10) DEFAULT NULL COMMENT '发货时间',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除，0未删除，1已删除',
  `store_id` int(10) DEFAULT '0' COMMENT '自提门店id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='拼团订单表';

-- ----------------------------
-- Records of onethink_spellorder
-- ----------------------------
INSERT INTO `onethink_spellorder` VALUES ('1', '23', '1', '15', '1', '1', '20170106214337698', '10.00', '0.00', '0', '43', '1483710217', '1', '1483710217', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('2', '23', '2', '17', '1', '4', '20170107103535566', '5.00', '0.00', '0', '43', '1483756535', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('3', '23', '3', '15', '1', '1', '20170107144001158', '10.00', '0.00', '0', '43', '1483771201', '1', '1483771201', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('4', '23', '4', '15', '1', '0', '20170107144200834', '10.00', '0.00', '0', '43', '1483771320', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('5', '23', '5', '15', '1', '1', '20170107150732854', '10.00', '0.00', '0', '43', '1483772852', '1', '1483772852', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('6', '23', '6', '15', '1', '1', '20170107150827623', '10.00', '0.00', '0', '43', '1483772907', '1', '1483772907', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('7', '23', '7', '15', '1', '1', '20170107165000902', '10.00', '0.00', '0', '43', '1483779000', '1', '1483779000', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('8', '23', '8', '15', '1', '1', '20170107165525953', '10.00', '0.00', '0', '43', '1483779325', '1', '1483779325', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('9', '23', '9', '18', '1', '1', '20170107201235725', '1.00', '0.00', '0', '43', '1483791155', '1', '1483791155', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('10', '23', '10', '19', '1', '1', '20170110104432561', '1.00', '0.00', '0', '43', '1484016272', '1', '1484016272', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('11', '24', '10', '19', '1', '0', '20170110112140199', '1.00', '0.00', '0', '44', '1484018500', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('12', '24', '11', '19', '1', '1', '20170110113500815', '1.00', '0.00', '0', '44', '1484019300', '1', '1484019300', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('13', '23', '11', '19', '1', '1', '20170110113951370', '1.00', '0.00', '0', '43', '1484019591', '1', '1484019591', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('14', '23', '12', '19', '1', '1', '20170110114036533', '1.00', '0.00', '0', '43', '1484019636', '1', '1484019636', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('15', '24', '12', '19', '1', '1', '20170110114417928', '1.00', '0.00', '0', '44', '1484019857', '1', '1484019857', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('16', '23', '13', '21', '1', '1', '20170117140630488', '1.00', '0.00', '0', '43', '1484633190', '1', '1484633190', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('17', '4', '13', '21', '1', '1', '20170117141215464', '1.00', '0.00', '0', '46', '1484633535', '1', '1484633535', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('18', '23', '14', '21', '1', '1', '20170118140848423', '1.00', '0.00', '0', '43', '1484719728', '1', '1484719728', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('19', '23', '15', '22', '1', '1', '20170207170614479', '30.00', '0.00', '0', '43', '1486458374', '1', '1486458374', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('20', '32', '23', '15', '1', '0', 'S20170228111502875', '10.00', '0.00', '0', '75', '1488251702', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('21', '32', '24', '22', '3', '1', 'S20170228140629742', '90.00', '0.00', '0', '45', '1488261989', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('22', '29', '25', '22', '3', '0', 'S20170228140750281', '90.00', '0.00', '0', '45', '1488262070', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('23', '29', '26', '22', '3', '0', 'S20170228143321704', '90.00', '0.00', '0', '45', '1488263601', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('24', '29', '27', '22', '3', '0', 'S20170228150652451', '90.00', '0.00', '0', '45', '1488265612', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('25', '29', '28', '22', '3', '0', 'S20170228151551719', '90.00', '0.00', '0', '45', '1488266151', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('26', '29', '29', '22', '3', '0', 'S20170228151615793', '90.00', '0.00', '0', '45', '1488266175', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('27', '29', '30', '22', '4', '0', 'S20170228151637377', '120.00', '0.00', '0', '45', '1488266197', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('28', '29', '31', '22', '4', '0', 'S20170228152015379', '120.00', '0.00', '0', '45', '1488266415', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('29', '29', '32', '22', '4', '1', 'S20170228152111269', '120.00', '0.00', '0', '45', '1488266471', '0', '1488266471', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('30', '29', '33', '22', '3', '1', 'S20170228162031733', '90.00', '0.00', '0', '45', '1488270031', '0', '1488270031', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('31', '29', '34', '22', '10', '0', 'S20170228171636354', '300.00', '0.00', '0', '45', '1488273396', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('32', '29', '35', '22', '1', '0', 'S20170301175533665', '30.00', '0.00', '0', '45', '1488362133', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('33', '29', '36', '22', '1', '0', 'S2017030217574189', '30.00', '0.00', '0', '45', '1488448661', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('34', '29', '37', '22', '1', '0', 'S20170302175837729', '30.00', '0.00', '0', '45', '1488448717', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('35', '29', '38', '22', '1', '0', 'S2017030218102491', '30.00', '0.00', '0', '45', '1488449424', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('36', '34', '39', '22', '1', '0', 'S20170304111715196', '30.00', '0.00', '0', '75', '1488597435', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('37', '34', '40', '22', '1', '0', 'S20170304111901576', '30.00', '0.00', '0', '75', '1488597541', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('38', '34', '41', '22', '1', '0', 'S20170304112003587', '30.00', '0.00', '0', '75', '1488597603', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('39', '34', '42', '22', '1', '0', 'S20170304133353808', '30.00', '0.00', '0', '75', '1488605633', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('40', '34', '43', '22', '1', '1', 'S20170304172357942', '30.00', '0.00', '0', '75', '1488619437', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('41', '29', '44', '22', '1', '0', 'S20170306134713873', '30.00', '0.00', '0', '45', '1488779233', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('42', '29', '45', '22', '1', '0', 'S20170306134804201', '30.00', '0.00', '0', '45', '1488779284', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('43', '29', '46', '22', '1', '0', 'S20170306134826468', '30.00', '0.00', '0', '45', '1488779306', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('44', '29', '47', '22', '1', '0', 'S20170306141932832', '30.00', '0.00', '0', '45', '1488781172', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('45', '29', '48', '22', '1', '0', 'S20170306141955189', '30.00', '0.00', '0', '45', '1488781195', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('46', '29', '49', '22', '1', '0', 'S20170309110719551', '30.00', '0.00', '0', '45', '1489028839', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('47', '29', '50', '22', '1', '0', 'S20170309112242907', '30.00', '0.00', '0', '45', '1489029762', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('48', '29', '51', '22', '1', '0', 'S20170309113332234', '30.00', '0.00', '0', '45', '1489030412', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('49', '29', '52', '22', '1', '0', 'S20170309113351784', '30.00', '0.00', '0', '45', '1489030431', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('50', '29', '53', '22', '1', '0', 'S20170309113514858', '30.00', '0.00', '0', '45', '1489030514', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('51', '29', '54', '22', '1', '0', 'S20170309113915911', '30.00', '0.00', '0', '45', '1489030755', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('52', '29', '55', '22', '1', '0', 'S20170309114732224', '30.00', '0.00', '0', '45', '1489031252', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('53', '34', '56', '22', '1', '0', 'S20170309165940764', '30.00', '0.00', '0', '75', '1489049980', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('54', '34', '57', '22', '1', '0', 'S2017030917124565', '30.00', '0.00', '0', '75', '1489050765', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('55', '39', '58', '22', '1', '0', 'S20170309174258107', '30.00', '0.00', '0', '88', '1489052578', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('56', '39', '59', '22', '1', '0', 'S20170309175307115', '30.00', '0.00', '0', '88', '1489053187', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('57', '39', '60', '21', '1', '0', 'S2017030917532059', '1.00', '0.00', '0', '88', '1489053200', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('58', '39', '61', '22', '1', '0', 'S20170313132726834', '30.00', '0.00', '0', '88', '1489382846', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('59', '32', '32', '22', '1', '0', 'S20170313152014936', '30.00', '0.00', '0', '75', '1489389614', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('60', '46', '62', '22', '1', '0', 'S2017031318051678', '30.00', '0.00', '0', '100', '1489399516', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('61', '46', '62', '22', '1', '0', 'S20170313180638718', '30.00', '0.00', '0', '100', '1489399598', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('62', '40', '63', '21', '1', '0', 'S20170314101640782', '1.00', '0.00', '0', '98', '1489457800', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('63', '40', '64', '23', '1', '0', 'S20170314102403720', '0.01', '0.00', '0', '98', '1489458243', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('64', '40', '65', '23', '1', '0', 'S20170314102803547', '0.01', '0.00', '0', '98', '1489458483', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('65', '40', '66', '24', '1', '4', 'S2017031410505114', '0.01', '0.00', '0', '98', '1489459851', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('66', '40', '67', '24', '1', '0', 'S20170314105204489', '0.01', '0.00', '0', '98', '1489459924', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('67', '37', '64', '23', '1', '1', 'S20170314111002714', '0.01', '0.00', '0', '90', '1489461002', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('68', '37', '66', '24', '1', '1', 'S20170314111727783', '0.01', '0.00', '0', '90', '1489461447', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('69', '37', '67', '24', '1', '0', 'S2017031411185218', '0.01', '0.00', '0', '90', '1489461532', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('70', '37', '67', '24', '1', '0', 'S20170314111858460', '0.01', '0.00', '0', '90', '1489461538', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('71', '37', '6', '15', '1', '0', 'S20170316114842679', '10.00', '0.00', '0', '90', '1489636122', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('72', '37', '6', '15', '1', '0', 'S20170316171053521', '10.00', '0.00', '0', '90', '1489655453', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('73', '37', '7', '15', '1', '0', 'S20170316171100133', '10.00', '0.00', '0', '90', '1489655460', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('74', '29', '68', '15', '1', '0', 'S20170320143057248', '10.00', '0.00', '0', '45', '1489991457', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('75', '29', '69', '15', '1', '0', 'S20170320143144794', '10.00', '0.00', '0', '45', '1489991504', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('76', '29', '70', '15', '1', '0', 'S20170320143207997', '10.00', '0.00', '0', '45', '1489991527', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('77', '29', '71', '15', '1', '0', 'S2017032014323867', '10.00', '0.00', '0', '45', '1489991558', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('78', '29', '62', '22', '1', '0', 'S20170321152057425', '30.00', '0.00', '0', '45', '1490080857', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('79', '29', '72', '22', '1', '0', 'S2017032115283723', '30.00', '0.00', '0', '45', '1490081317', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('80', '29', '73', '15', '1', '0', 'S20170322112759766', '10.00', '0.00', '0', '91', '1490153279', '0', '0', '', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('81', '29', '74', '22', '1', '0', 'S20170322170727467', '30.00', '0.00', '0', '91', '1490173647', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('82', '29', '72', '22', '1', '0', 'S20170322171536480', '30.00', '0.00', '0', '101', '1490174136', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('83', '29', '72', '22', '1', '0', 'S20170322171811112', '30.00', '0.00', '0', '101', '1490174291', '0', '0', null, '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('84', '29', '75', '22', '1', '0', 'S20170322172253658', '30.00', '0.00', '0', '91', '1490174573', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('85', '29', '76', '22', '1', '0', 'S20170323111848862', '30.00', '0.00', '0', '45', '1490239128', '0', '0', '暂无', '0', null, '0', '0');
INSERT INTO `onethink_spellorder` VALUES ('86', '29', '77', '22', '1', '0', 'S20170323112107998', '30.00', '0.00', '0', '45', '1490239267', '0', '0', '暂无', '0', null, '0', '0');

-- ----------------------------
-- Table structure for onethink_spell_teams
-- ----------------------------
DROP TABLE IF EXISTS `onethink_spell_teams`;
CREATE TABLE `onethink_spell_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spell_id` int(11) NOT NULL COMMENT '拼团id',
  `user_id` int(10) NOT NULL COMMENT '用户id',
  `join_num` int(11) NOT NULL DEFAULT '0' COMMENT '拼团人数',
  `addtime` int(10) NOT NULL COMMENT '开团时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '拼团状态，0拼团中，1已成团,2拼团失败',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='拼团团长信息表';

-- ----------------------------
-- Records of onethink_spell_teams
-- ----------------------------
INSERT INTO `onethink_spell_teams` VALUES ('1', '15', '23', '1', '0', '2');
INSERT INTO `onethink_spell_teams` VALUES ('2', '17', '23', '0', '0', '2');
INSERT INTO `onethink_spell_teams` VALUES ('3', '15', '23', '1', '0', '2');
INSERT INTO `onethink_spell_teams` VALUES ('4', '15', '23', '0', '0', '2');
INSERT INTO `onethink_spell_teams` VALUES ('5', '15', '23', '1', '0', '2');
INSERT INTO `onethink_spell_teams` VALUES ('6', '15', '23', '3', '0', '0');
INSERT INTO `onethink_spell_teams` VALUES ('7', '15', '23', '2', '0', '0');
INSERT INTO `onethink_spell_teams` VALUES ('8', '15', '23', '1', '0', '2');
INSERT INTO `onethink_spell_teams` VALUES ('9', '18', '23', '1', '0', '1');
INSERT INTO `onethink_spell_teams` VALUES ('10', '19', '23', '1', '1484016272', '2');
INSERT INTO `onethink_spell_teams` VALUES ('11', '19', '24', '2', '1484019300', '1');
INSERT INTO `onethink_spell_teams` VALUES ('12', '19', '23', '2', '1484019636', '1');
INSERT INTO `onethink_spell_teams` VALUES ('13', '21', '32', '5', '1484633190', '0');
INSERT INTO `onethink_spell_teams` VALUES ('14', '21', '32', '4', '1484719728', '0');
INSERT INTO `onethink_spell_teams` VALUES ('15', '22', '23', '1', '1486458374', '2');
INSERT INTO `onethink_spell_teams` VALUES ('23', '15', '32', '1', '1488251702', '0');
INSERT INTO `onethink_spell_teams` VALUES ('24', '22', '29', '1', '1488261989', '2');
INSERT INTO `onethink_spell_teams` VALUES ('25', '22', '29', '3', '1488262070', '2');
INSERT INTO `onethink_spell_teams` VALUES ('26', '22', '29', '3', '1488263601', '2');
INSERT INTO `onethink_spell_teams` VALUES ('27', '22', '29', '3', '1488265612', '2');
INSERT INTO `onethink_spell_teams` VALUES ('28', '22', '29', '3', '1488266151', '2');
INSERT INTO `onethink_spell_teams` VALUES ('29', '22', '29', '1', '1488266175', '2');
INSERT INTO `onethink_spell_teams` VALUES ('30', '22', '29', '1', '1488266197', '2');
INSERT INTO `onethink_spell_teams` VALUES ('31', '22', '29', '1', '1488266415', '2');
INSERT INTO `onethink_spell_teams` VALUES ('32', '22', '29', '5', '1488266471', '2');
INSERT INTO `onethink_spell_teams` VALUES ('33', '22', '29', '1', '1488270031', '2');
INSERT INTO `onethink_spell_teams` VALUES ('34', '22', '29', '1', '1488273396', '2');
INSERT INTO `onethink_spell_teams` VALUES ('35', '22', '29', '1', '1488362133', '2');
INSERT INTO `onethink_spell_teams` VALUES ('36', '22', '29', '1', '1488448661', '2');
INSERT INTO `onethink_spell_teams` VALUES ('37', '22', '29', '1', '1488448717', '2');
INSERT INTO `onethink_spell_teams` VALUES ('38', '22', '29', '3', '1488449424', '2');
INSERT INTO `onethink_spell_teams` VALUES ('39', '22', '34', '1', '1488597435', '2');
INSERT INTO `onethink_spell_teams` VALUES ('40', '22', '34', '1', '1488597541', '2');
INSERT INTO `onethink_spell_teams` VALUES ('41', '22', '34', '1', '1488597603', '2');
INSERT INTO `onethink_spell_teams` VALUES ('42', '22', '34', '1', '1488605633', '2');
INSERT INTO `onethink_spell_teams` VALUES ('43', '22', '34', '1', '1488619437', '2');
INSERT INTO `onethink_spell_teams` VALUES ('44', '22', '29', '1', '1488779233', '2');
INSERT INTO `onethink_spell_teams` VALUES ('45', '22', '29', '1', '1488779284', '2');
INSERT INTO `onethink_spell_teams` VALUES ('46', '22', '29', '1', '1488779306', '2');
INSERT INTO `onethink_spell_teams` VALUES ('47', '22', '29', '1', '1488781172', '2');
INSERT INTO `onethink_spell_teams` VALUES ('48', '22', '29', '1', '1488781195', '2');
INSERT INTO `onethink_spell_teams` VALUES ('49', '22', '29', '1', '1489028839', '2');
INSERT INTO `onethink_spell_teams` VALUES ('50', '22', '29', '1', '1489029762', '2');
INSERT INTO `onethink_spell_teams` VALUES ('51', '22', '29', '1', '1489030412', '2');
INSERT INTO `onethink_spell_teams` VALUES ('52', '22', '29', '1', '1489030431', '2');
INSERT INTO `onethink_spell_teams` VALUES ('53', '22', '29', '1', '1489030514', '2');
INSERT INTO `onethink_spell_teams` VALUES ('54', '22', '29', '1', '1489030755', '2');
INSERT INTO `onethink_spell_teams` VALUES ('55', '22', '29', '1', '1489031252', '2');
INSERT INTO `onethink_spell_teams` VALUES ('56', '22', '34', '1', '1489049980', '2');
INSERT INTO `onethink_spell_teams` VALUES ('57', '22', '34', '1', '1489050765', '2');
INSERT INTO `onethink_spell_teams` VALUES ('58', '22', '39', '1', '1489052578', '2');
INSERT INTO `onethink_spell_teams` VALUES ('59', '22', '39', '1', '1489053187', '2');
INSERT INTO `onethink_spell_teams` VALUES ('60', '21', '39', '1', '1489053200', '0');
INSERT INTO `onethink_spell_teams` VALUES ('61', '22', '39', '1', '1489382846', '2');
INSERT INTO `onethink_spell_teams` VALUES ('62', '22', '46', '3', '1489399516', '2');
INSERT INTO `onethink_spell_teams` VALUES ('63', '21', '40', '1', '1489457800', '0');
INSERT INTO `onethink_spell_teams` VALUES ('64', '23', '40', '2', '1489458243', '1');
INSERT INTO `onethink_spell_teams` VALUES ('65', '23', '40', '1', '1489458483', '0');
INSERT INTO `onethink_spell_teams` VALUES ('66', '24', '40', '5', '1489459851', '1');
INSERT INTO `onethink_spell_teams` VALUES ('67', '24', '40', '3', '1489459924', '0');
INSERT INTO `onethink_spell_teams` VALUES ('68', '15', '29', '1', '1489991457', '0');
INSERT INTO `onethink_spell_teams` VALUES ('69', '15', '29', '1', '1489991504', '0');
INSERT INTO `onethink_spell_teams` VALUES ('70', '15', '29', '1', '1489991527', '0');
INSERT INTO `onethink_spell_teams` VALUES ('71', '15', '29', '1', '1489991558', '0');
INSERT INTO `onethink_spell_teams` VALUES ('72', '22', '29', '3', '1490081317', '2');
INSERT INTO `onethink_spell_teams` VALUES ('73', '15', '29', '1', '1490153279', '0');
INSERT INTO `onethink_spell_teams` VALUES ('74', '22', '29', '1', '1490173647', '2');
INSERT INTO `onethink_spell_teams` VALUES ('75', '22', '29', '1', '1490174573', '2');
INSERT INTO `onethink_spell_teams` VALUES ('76', '22', '29', '1', '1490239128', '2');
INSERT INTO `onethink_spell_teams` VALUES ('77', '22', '29', '1', '1490239267', '2');

-- ----------------------------
-- Table structure for onethink_store
-- ----------------------------
DROP TABLE IF EXISTS `onethink_store`;
CREATE TABLE `onethink_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) NOT NULL COMMENT '店铺名称',
  `sadd` varchar(255) NOT NULL COMMENT '店铺地址',
  `sid` int(11) NOT NULL COMMENT '管理员id',
  `sjingdu` double NOT NULL COMMENT '店铺精度',
  `sweidu` double NOT NULL COMMENT '店铺纬度',
  `image` varchar(150) NOT NULL COMMENT '店铺头像',
  `mobile` varchar(20) DEFAULT '' COMMENT '门店联系电话',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态，1正常，0删除',
  `area_0` int(10) DEFAULT NULL,
  `area_1` int(10) DEFAULT NULL,
  `area_2` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_store
-- ----------------------------
INSERT INTO `onethink_store` VALUES ('1', '天津南开店', '天津南开区红旗南路', '0', '117.155252', '39.098754', '', '54665666', '1', null, null, null);
INSERT INTO `onethink_store` VALUES ('2', '天津武清店', '天津武清区', '2', '117.050717', '39.38903', '', '123456', '1', '0', '0', '0');
INSERT INTO `onethink_store` VALUES ('3', 'r34e', '天津市南开区白堤路238号', '0', '117.162322', '39.113165', '', '', '0', null, null, null);
INSERT INTO `onethink_store` VALUES ('4', '天津河北区', '天津河北区养鱼池路满园里2号楼', '0', '0', '0', '', '1236666', '1', '1', '2', '3');

-- ----------------------------
-- Table structure for onethink_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of onethink_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of onethink_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of onethink_ucenter_member
-- ----------------------------
INSERT INTO `onethink_ucenter_member` VALUES ('1', 'admin', 'd7c5bf7a1441d0c5682f4a6519637641', 'admin@tt.cn', '', '1467327563', '2130706433', '1493690029', '2130706433', '1467327563', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('2', 'aaaa', 'e1aa5c2bf5c9f8646bb116a319599420', '10086@qq.com', '', '1469082416', '1873088352', '0', '0', '1469082416', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('3', 'test01', 'cddd1a43031e6db00f3b032a11039eac', 'test01@qqq.com', '', '1471327555', '1873101532', '1471328069', '1873101532', '1471327555', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('4', 'dongbin', '510b3631d3660d782fbf494e543ab09d', 'jj2674@126.com', '', '1471422123', '3716280867', '0', '0', '1471422123', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('5', 'test', 'e1aa5c2bf5c9f8646bb116a319599420', 'sadf@tt.cn', '', '1472091061', '2130706433', '1472091227', '2130706433', '1472091061', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('6', 'admin1', '06e6643062c8d578c9e97b19dd14603f', '1561747597@qq.com', '', '1477982187', '0', '1477982342', '0', '1477982187', '1');
INSERT INTO `onethink_ucenter_member` VALUES ('7', 'zhangsan', 'e13d9b349c061731d6dab2b15d3eaa83', 'zhangsan@128.com', '', '1490231850', '2130706433', '1490234606', '2130706433', '1490231850', '1');

-- ----------------------------
-- Table structure for onethink_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of onethink_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_url
-- ----------------------------
DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of onethink_url
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_user
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user`;
CREATE TABLE `onethink_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user` varchar(128) DEFAULT NULL,
  `login_pass` varchar(128) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `integral` decimal(10,2) DEFAULT '0.00' COMMENT '用户积分',
  `points` int(11) DEFAULT NULL COMMENT '消费积分',
  `register_time` int(20) DEFAULT '0',
  `last_login_time` int(20) DEFAULT '0',
  `last_login_ip` varchar(128) DEFAULT NULL,
  `openid` varchar(128) DEFAULT NULL,
  `qqid` varchar(128) DEFAULT NULL COMMENT '用户qq',
  `is_bind` tinyint(1) DEFAULT '0',
  `addtime` int(20) DEFAULT '0',
  `name` varchar(128) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '1' COMMENT '1.男2.女',
  `zip_code` varchar(128) DEFAULT NULL,
  `mobile` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL COMMENT '100015',
  `image` varchar(128) DEFAULT NULL,
  `parent_user_id` int(11) DEFAULT '0' COMMENT '上级用户id',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额',
  `jie_money` decimal(10,2) DEFAULT '0.00' COMMENT '分销佣金',
  `lv` int(11) DEFAULT '1' COMMENT '会员消费等级',
  `signtime` int(10) DEFAULT '0' COMMENT '签到时间',
  `regist_type` tinyint(1) DEFAULT '0' COMMENT '注册类型，1手机号注册，2微信注册,0管理员添加',
  `status` int(1) DEFAULT '1' COMMENT '用户状态，1启用，0禁用',
  `paypwd` varchar(50) DEFAULT NULL COMMENT '余额支付密码',
  `card_num` int(10) DEFAULT NULL COMMENT '会员编号',
  `sharenum` int(10) DEFAULT '0' COMMENT '用户的分享次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='会员信息表';

-- ----------------------------
-- Records of onethink_user
-- ----------------------------
INSERT INTO `onethink_user` VALUES ('2', '13821264212', '4e71e4c29b00c10e14786b79f32e4c9b', '1', '100.00', '1178', '0', '0', '', '', null, '0', '0', '袁绍月', '1', '1rrrrrr', '13821264212', 'yuanshao@tt.cn', './Uploads/imgs//2016-07-15/5788b4e4394ce.png', '0', '876.00', '101.00', '1', '0', '1', '1', null, '10000002', '0');
INSERT INTO `onethink_user` VALUES ('4', '13000000000', '96e79218965eb72c92a549dd5a330112', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '0℃寂寞', '1', '0', '13000000000', '10086@qq.com', './Uploads/imgs//2016-07-19/578de3092e610.jpg', '0', '499.00', '0.00', '0', '0', '1', '1', '123456', '10000004', '0');
INSERT INTO `onethink_user` VALUES ('5', '18812503547', '96e79218965eb72c92a549dd5a330112', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '0', '', '', '', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000005', '0');
INSERT INTO `onethink_user` VALUES ('6', '13920770042', '1ec4cd26300ee567c0e8a42d5bd7be3c', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '0', '', '', '', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000006', '0');
INSERT INTO `onethink_user` VALUES ('7', '18920108283', '345fbb9cb288a9b2c5335a8faab805a0', '1', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '1', '', '', '', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000007', '0');
INSERT INTO `onethink_user` VALUES ('8', '18610510076', '0b2952b0d93576dd24b49dcb66a9c7d8', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '0', '', '', '', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000008', '0');
INSERT INTO `onethink_user` VALUES ('9', '18622576686', 'e10adc3949ba59abbe56e057f20f883e', '1', '1000.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '1', '', '', './Uploads/imgs//2016-08-17/57b3fb9e3238b.jpg', '0', '0.00', '0.00', '5', '0', '1', '1', null, '10000009', '0');
INSERT INTO `onethink_user` VALUES ('10', '18622728527', 'af0dbed022d81342dc163f644e8d5573', '1', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '1', '', '', './Uploads/imgs//2016-08-17/57b3c6848cd4f.JPG', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000010', '0');
INSERT INTO `onethink_user` VALUES ('11', '13920349483', '4aae7e715341679684a804bfd54ceca1', '1', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '1', '', '', './Uploads/imgs//2016-08-17/57b40b554263e.jpeg', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000011', '0');
INSERT INTO `onethink_user` VALUES ('12', '18202260747', 'e10adc3949ba59abbe56e057f20f883e', '1', '0.00', '0', '0', '0', '', '', null, '0', '1471850244', '', '2', '1', '18202260747', '', '', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000012', '0');
INSERT INTO `onethink_user` VALUES ('13', '13713713713', '4e71e4c29b00c10e14786b79f32e4c9b', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '', '', '', '', '2', '0.00', '2.00', '0', '0', '1', '1', null, '10000013', '0');
INSERT INTO `onethink_user` VALUES ('14', '13820569037', '219798c2a2080395d8c84d1ba9253ba6', '1', '0.00', '0', '0', '0', '', '', null, '0', '0', '张三', '1', '', '', '', '/Uploads/Picture/2016-10-18/5805f21494214.jpg', '0', '0.00', '0.00', '0', '0', '1', '1', null, '10000014', '0');
INSERT INTO `onethink_user` VALUES ('15', '13820593875', '96e79218965eb72c92a549dd5a330112', '1', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '1', '', '', '', '', '0', '300.00', '0.00', '0', '0', '1', '1', null, '10000015', '0');
INSERT INTO `onethink_user` VALUES ('16', '13702095931', '96e79218965eb72c92a549dd5a330112', '0', '1289.00', '7858', '0', '0', '', '', null, '0', '0', '何昵称', '1', '300172', '13702095931', '', '', '13', '161.50', '5.00', '5', '0', '1', '1', null, '10000016', '0');
INSERT INTO `onethink_user` VALUES ('17', '18920146026', '532916372ad35a9fc83eb60891d6e0d7', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '', '', '', '', '20', '0.00', '0.00', '0', '0', '1', '1', null, '10000017', '0');
INSERT INTO `onethink_user` VALUES ('18', '13920339420', 'f984dc6e6de7c3b0cd03148fba088cd4', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '', '', '', '', '20', '0.00', '0.00', '0', '0', '1', '1', null, '10000018', '0');
INSERT INTO `onethink_user` VALUES ('19', '18722436859', '96e79218965eb72c92a549dd5a330112', '0', '0.00', '0', '0', '0', '', '', null, '0', '0', '', '2', '', '', '', '', '20', '0.00', '0.00', '0', '0', '1', '1', null, '10000019', '0');
INSERT INTO `onethink_user` VALUES ('20', '15620954527', '23957b1e0456d9ceeb6f8c394d6e73d5', '0', '0.00', '10', '0', '0', '', '', null, '0', '0', '', '1', '300000', '', '', '', '16', '580.00', '-161.00', '1', '0', '1', '1', null, '10000020', '0');
INSERT INTO `onethink_user` VALUES ('21', '13820525403', 'e10adc3949ba59abbe56e057f20f883e', '0', '31.00', '200', '0', '0', '', '', null, '0', '0', 'qqq123', '2', 'fsdfsdf', '13820525403', '', './Uploads/2016-11-24/58364d4c26757.jpg', '0', '30.00', '0.00', '0', '1483431060', '1', '1', '111111dsfsdf', '10000021', '0');
INSERT INTO `onethink_user` VALUES ('23', '13820525402', '96e79218965eb72c92a549dd5a330112', '0', '232.00', '230', '1483497850', '0', '', '', null, '0', '0', '', '2', '', '13820525402', '', './Uploads/2017-01-04/586c9ec51c869.png', '16', '516.00', '0.00', '5', '1483498223', '1', '1', '123456', '10000023', '0');
INSERT INTO `onethink_user` VALUES ('24', '13000000001', 'e10adc3949ba59abbe56e057f20f883e', '0', '5.00', '0', '1483754918', '0', '', '', null, '0', '0', '', '2', '', '13000000001', '', '', '0', '898.00', '0.00', '1', '0', '1', '1', '123456', '10000024', '0');
INSERT INTO `onethink_user` VALUES ('25', '13000000002', 'e10adc3949ba59abbe56e057f20f883e', '0', '5.00', '0', '1483755211', '0', '', '', null, '0', '0', '', '2', '', '13000000002', '', '', '0', '900.00', '0.00', '1', '0', '1', '1', '123456', '10000025', '0');
INSERT INTO `onethink_user` VALUES ('26', '13000000003', '4297f44b13955235245b2497399d7a93', '0', '5.00', '0', '1483755345', '0', '', '', null, '0', '0', '', '2', '', '13000000003', '', '', '0', '0.00', '0.00', '1', '0', '1', '1', null, '10000026', '0');
INSERT INTO `onethink_user` VALUES ('27', '13300000004', '670b14728ad9902aecba32e22fa4f6bd', '0', '5.00', '0', '1483755469', '0', '', '', null, '0', '0', '', '2', '', '13300000004', '', '', '0', '0.00', '0.00', '1', '0', '1', '1', null, '10000027', '0');
INSERT INTO `onethink_user` VALUES ('28', '时斌111', 'bc69b08cae50abf7d7bcffb578f5e732', '0', '6.00', '0', '1483777828', '1483777828', '', 'oMX2_whfwq6rkng_qzcTRbDRcMEw', null, '0', '0', '时斌111', '2', '', '18920146026', '', 'http://wx.qlogo.cn/mmopen/LTdvtfkibo65Vj9clrvasuQibFYHwDXNs3oeUvNBnyCgicYce13lPuIh0dg7sg01TsNXjRn7GAPqtTrdIyWPVLvJgyQesyltLen/0', '0', '60.00', '0.00', '1', '1483778091', '2', '1', '', '10000028', '12');
INSERT INTO `onethink_user` VALUES ('29', 'sunfan', '343b1c4a3ea721b2d640fc8700db0f36', '0', '10.00', '0', '0', '0', '', '123', null, '0', '0', 'bbbb', '2', '', '18636476679', '378978917@qq.com', 'C:\\fakepath\\ces_07.jpg', '0', '0.00', '0.00', '0', '1490261270', '0', '1', null, '10000029', '0');
INSERT INTO `onethink_user` VALUES ('30', '1', '1', '0', '0.00', '0', '0', '1486185193', '', '', null, '0', '0', '', '2', '', '', '', '', '0', '0.00', '0.00', '0', '0', '0', '1', null, '10000030', '0');
INSERT INTO `onethink_user` VALUES ('32', '', 'c4ca4238a0b923820dcc509a6f75849b', '0', '5.00', '0', '1486622609', '1486622609', '127.0.0.1', '526', null, '0', '0', '', '1', '', '18612345679', '', '', '0', '0.00', '0.00', '1', '1487403626', '0', '1', '123', '10000032', '0');
INSERT INTO `onethink_user` VALUES ('33', '', '343b1c4a3ea721b2d640fc8700db0f36', '0', '0.00', '0', '1487057654', '1487057654', '192.168.1.182', '', null, '0', '0', '小野', '1', '', '13512404082', '', '', '0', '0.00', '0.00', '1', '0', '0', '1', null, '10000033', '0');
INSERT INTO `onethink_user` VALUES ('34', '', '343b1c4a3ea721b2d640fc8700db0f36', '0', '8.00', '0', '1487153547', '1487153547', '192.168.1.146', '', null, '0', '0', '', '1', '', '15222898621', '', '', '0', '0.00', '0.00', '1', '1489569201', '0', '1', '111111', '10000034', '0');
INSERT INTO `onethink_user` VALUES ('35', '', 'e10adc3949ba59abbe56e057f20f883e', '0', '1.00', '0', '1487572051', '1487572051', '192.168.1.134', '', null, '0', '0', '施斌', '2', '', '15302125953', '', '', '0', '0.00', '0.00', '1', '1487579442', '0', '1', '123456', '10000035', '0');
INSERT INTO `onethink_user` VALUES ('36', '', 'c4ca4238a0b923820dcc509a6f75849b', '0', '2.00', '0', '1487574688', '1487574688', '192.168.1.145', '', null, '0', '0', '小呵呵', '2', '', '13702095930', '', '', '0', '0.00', '0.00', '1', '1487658815', '0', '1', null, '10000036', '0');
INSERT INTO `onethink_user` VALUES ('37', '', '96e79218965eb72c92a549dd5a330112', '0', '0.00', '0', '1487643750', '1487643750', '192.168.1.121', '', null, '0', '0', 'Tongtong', '1', '', '15022603502', '', '', '0', '0.00', '0.00', '1', '0', '0', '1', null, '10000037', '0');
INSERT INTO `onethink_user` VALUES ('40', 'test', '25f9e794323b453885f5181f1b624d0b', '0', '1000.00', '0', '0', '0', '', '', null, '0', '1488877712', 'test12', '2', '', '13682077735', '', '/Uploads/Picture/2017-03-07/58be7880dcb1e.jpg', '0', '1000.00', '1000.00', '5', '0', '0', '1', '123456', '10000040', '0');
INSERT INTO `onethink_user` VALUES ('48', null, null, '0', '0.00', null, '1489975128', '1489975128', '192.168.1.182', 'o5ksM0iHaixrmbZqvLju1qTakbH8', null, '0', '0', '神州第一坑', '1', null, null, null, 'http://wx.qlogo.cn/mmopen/bj9JGugn6Ud0ia0JatNsERFkYJAqHl6g7TqIWox8mwNNWHFtgPV1xTnJ8BF1MHldOZcicicO648N2auS3uaia62v3twXPTWj9Y2Y/0', '0', '0.00', '0.00', '1', '0', '2', '1', null, null, '0');
INSERT INTO `onethink_user` VALUES ('41', 'admin', '', '0', '0.00', '0', '1488940939', '1488940939', '127.0.0.1', 'undefined', null, '0', '0', '', '1', '', 'admin', '', '', '0', '0.00', '0.00', '5', '0', '0', '1', '', '10000041', '0');
INSERT INTO `onethink_user` VALUES ('43', '', '', '0', '0.00', '0', '1489138975', '1489138975', '192.168.1.164', 'o5ksM0lKkO636zImG1NOrle52QGA', null, '0', '0', 'play it loud', '1', '', '', '', 'http://wx.qlogo.cn/mmopen/he2ian4Aty8U2LaibURxhAhYW4sddknv5CGUHB7Ip2haWMDZC4bfrgUkN3c6SFdwicQlfjPTlvT8TzydpnKrahjkdCb306F2Djd/0', '0', '0.00', '0.00', '1', '0', '2', '1', null, '10000043', '0');
INSERT INTO `onethink_user` VALUES ('47', null, null, '0', '1.00', null, '1489480821', '1489480821', '127.0.0.1', 'og5b50AzQ49axLqQNsMdjWq__7yg', null, '0', '1489480821', null, null, null, null, null, null, '0', '0.00', '0.00', '1', '1489480841', '2', '1', null, '10000047', '0');
INSERT INTO `onethink_user` VALUES ('49', null, null, '0', '0.00', null, '1493289704', '1493289704', '192.168.1.145', '123321', null, '0', '1493289704', '测试sf', null, null, null, null, null, '0', '0.00', '0.00', '1', '0', '2', '1', null, '10000049', '0');

-- ----------------------------
-- Table structure for onethink_userdata
-- ----------------------------
DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_user_address
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_address`;
CREATE TABLE `onethink_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1.男2女',
  `mobile` varchar(128) NOT NULL,
  `area` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态，1正常，0删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_user_address
-- ----------------------------
INSERT INTO `onethink_user_address` VALUES ('14', '2', '袁绍月', '0', '13821264212', '北京市 北京市 东城区', '天津市东丽区新立街', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('15', '14', '闫乔', '0', '13820569037', '天津市 天津市 南开区', '红旗路赛德广场', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('36', '16', '呵呵额', '0', '13702095930', '北京市 北京市 东城区', '大王庄', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('22', '17', '抢险', '0', '18920146026', '北京市 北京市 东城区', '路路通的空间', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('21', '17', '时斌', '0', '18920146026', '北京市 北京市 东城区', '旅进旅退', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('23', '17', '痛苦了', '0', '18920146026', '北京市 北京市 东城区', '骷髅精灵', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('24', '18', '哈哈哈', '0', '18920146026', '北京市 北京市 东城区', '别计较了', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('35', '19', '啊啊啊啊', '0', '13702095930', '北京市 北京市 西城区', '啊啊啊', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('39', '20', '刘云鹏', '0', '15620954527', '天津市 天津市 南开区', '红旗南路', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('40', '21', 'aaa', '0', '13322245678', '北京市 北京市 东城区', 'd地址地址', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('41', '21', 'test', '0', '13322200000', '天津市 天津市 和平区', 'sfsdfsf', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('42', '23', 'aaa', '0', '15545678963', '天津市 天津市 南开区', '3452342', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('43', '23', '二二', '0', '13322245678', '天津市 天津市 南开区', '白堤路', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('44', '24', '测试1', '0', '13000000001', '天津市 天津市 南开区', '红旗路赛德广场5号楼1106', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('45', '29', '测试211', '0', '18636476679', '天津市 天津市 南开区', '红旗路赛德广场5号楼1106', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('49', '32', '123', '1', '18636476679', '天津市 天津市 南开区', '红旗路赛德广场5号楼1106', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('51', '34', 'gggy', '0', '15222898621', '天津市天津市和平区', '天津市', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('58', '36', 'herong', '1', '13702095930', '天津 天津市 河东区', '大王庄', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('65', '35', '开发', '0', '15202265146', '内蒙古自治区 呼和浩特市 新城区', '几乎都是', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('60', '36', 'herong2', '1', '13702095930', '天津 天津市 和平区', '大王庄2', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('64', '35', '测试2', '0', '15202265146', '辽宁省 沈阳市 和平区', '很大数据返回到', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('90', '37', 'Tongtong', '1', '15022603502', '北京市北京市东城区', 'Tongtong', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('91', '29', 'fgs', '0', '15302125953', '河北 沧州 盐山', 'gfds dfg ', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('75', '34', 'yyy', '1', '15222898621', '天津市天津市和平区', 'pppppp', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('79', '38', '11', '0', '13702095930', '天津 天津市 和平区', '123dsfdsfasdf是电风扇的', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('80', '38', '是电风扇的', '1', '13702095930', '天津 天津市 和平区', '234233', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('97', '40', 'test', '1', '13682077735', '天津市南开区红旗南路', '123', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('95', '39', 'name2', '0', '13702095930', '吉林省 通化市 二道江区', 'jiedao', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('94', '39', 'name', '1', '13702095930', '天津市 天津市 河东区', 'jiedao', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('98', '40', 'test', '1', '13682077735', '天津市南开区塞德广场', '1456', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('99', '40', 'rr', '1', '13682077735', '北京 北京市 东城区', 'gh', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('100', '46', 'herong', '1', '13702095930', '天津市 天津市 河东区', 'jiedao', '1', '1');
INSERT INTO `onethink_user_address` VALUES ('101', '29', 'ceshiaa', '0', '15202265146', '天津 天津 南开', 'cehdsad', '0', '1');
INSERT INTO `onethink_user_address` VALUES ('102', '47', 'herong', '1', '13702095930', '天津市 天津市 河北区', 'sadfsafa', '0', '1');

-- ----------------------------
-- Table structure for onethink_user_recharge
-- ----------------------------
DROP TABLE IF EXISTS `onethink_user_recharge`;
CREATE TABLE `onethink_user_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(128) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `money` decimal(10,2) DEFAULT '0.00',
  `addtime` int(20) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_user_recharge
-- ----------------------------
INSERT INTO `onethink_user_recharge` VALUES ('1', null, '2', '3.00', '1470323990', '0');
INSERT INTO `onethink_user_recharge` VALUES ('2', null, '2', '3.00', '1470324012', '0');
INSERT INTO `onethink_user_recharge` VALUES ('3', null, '2', '3.00', '1470324050', '0');
INSERT INTO `onethink_user_recharge` VALUES ('4', null, '2', '3.00', '1470324071', '0');
INSERT INTO `onethink_user_recharge` VALUES ('5', null, '2', '3.00', '1470324083', '0');
INSERT INTO `onethink_user_recharge` VALUES ('6', null, '2', '4.00', '1470324115', '0');
INSERT INTO `onethink_user_recharge` VALUES ('7', null, '2', '4.00', '1470324146', '0');
INSERT INTO `onethink_user_recharge` VALUES ('8', null, '2', '4.00', '1470324191', '0');
INSERT INTO `onethink_user_recharge` VALUES ('9', null, '2', '1.00', '1470324310', '1');
INSERT INTO `onethink_user_recharge` VALUES ('10', '20160815111412810', '8', '11.00', '1471230852', '0');
INSERT INTO `onethink_user_recharge` VALUES ('11', '20160816160531136', '3', '500.00', '1471334731', '0');
INSERT INTO `onethink_user_recharge` VALUES ('12', '20160816164006954', '3', '500.00', '1471336806', '0');
INSERT INTO `onethink_user_recharge` VALUES ('13', '20160816164024477', '3', '500.00', '1471336824', '0');
INSERT INTO `onethink_user_recharge` VALUES ('14', '20160816164058116', '3', '500.00', '1471336858', '0');
INSERT INTO `onethink_user_recharge` VALUES ('15', '20160816182615407', '9', '500.00', '1471343175', '0');
INSERT INTO `onethink_user_recharge` VALUES ('16', '20160816182729898', '9', '500.00', '1471343249', '0');
INSERT INTO `onethink_user_recharge` VALUES ('17', '20160816222145807', '9', '500.00', '1471357305', '0');
INSERT INTO `onethink_user_recharge` VALUES ('18', '20160817205253956', '2', '499.00', '1471438373', '0');
INSERT INTO `onethink_user_recharge` VALUES ('19', '20160817210600729', '2', '499.00', '1471439160', '0');
INSERT INTO `onethink_user_recharge` VALUES ('20', '20160825205620360', '2', '99.00', '1472129780', '0');
INSERT INTO `onethink_user_recharge` VALUES ('21', '20160825205641669', '2', '99.00', '1472129801', '0');
INSERT INTO `onethink_user_recharge` VALUES ('22', '20160825205759895', '2', '99.00', '1472129879', '0');

-- ----------------------------
-- Table structure for onethink_web_site
-- ----------------------------
DROP TABLE IF EXISTS `onethink_web_site`;
CREATE TABLE `onethink_web_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vipprice` int(10) NOT NULL DEFAULT '0' COMMENT '充值多少获得VIP',
  `rate` smallint(6) NOT NULL DEFAULT '0' COMMENT '兑换比例',
  `product_rate` smallint(6) NOT NULL DEFAULT '0' COMMENT '运费',
  `qq` varchar(128) DEFAULT NULL,
  `phone` varchar(30) NOT NULL COMMENT '客服电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_web_site
-- ----------------------------
INSERT INTO `onethink_web_site` VALUES ('1', '100', '50', '6', '8888886666', '136820777777');
