/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : tes01

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2019-12-27 14:36:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `width` double(10,0) DEFAULT NULL,
  `height` double(10,0) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', 'http://localhost:8080/img/banner/01.gif', '400', '390', 'https://www.baidu.com/', '双十一天猫节');
INSERT INTO `banner` VALUES ('2', 'http://localhost:8080/img/banner/02.jpg', '400', '390', 'https://www.baidu.com/', '双十一天猫节');
INSERT INTO `banner` VALUES ('3', 'http://localhost:8080/img/banner/03.gif', '400', '390', 'https://www.baidu.com/', '双十一天猫节');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `typegoods` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '秋款上新', 'pop', 'http://localhost:8080/img/category/15.jpg');
INSERT INTO `category` VALUES ('2', '时尚套装', 'pop', 'http://localhost:8080/img/category/16.jpg');
INSERT INTO `category` VALUES ('3', '连衣裙', 'pop', 'http://localhost:8080/img/category/17.jpg');
INSERT INTO `category` VALUES ('4', 'T恤', 'pop', 'http://localhost:8080/img/category/10.jpg');
INSERT INTO `category` VALUES ('5', '牛仔裤', 'pop', 'http://localhost:8080/img/category/14.jpg');
INSERT INTO `category` VALUES ('6', '卫衣', 'pop', 'http://localhost:8080/img/category/03.jpg');
INSERT INTO `category` VALUES ('7', '秋款外套', 'pop', 'http://localhost:8080/img/category/06.jpg');
INSERT INTO `category` VALUES ('8', '衬衫', 'pop', 'http://localhost:8080/img/category/11.jpg');
INSERT INTO `category` VALUES ('9', '羽绒服', 'dress', 'http://localhost:8080/img/category/01.jpg');
INSERT INTO `category` VALUES ('10', '毛衣针织', 'dress', 'http://localhost:8080/img/category/02.jpg');
INSERT INTO `category` VALUES ('11', '卫衣绒衫', 'dress', 'http://localhost:8080/img/category/03.jpg');
INSERT INTO `category` VALUES ('12', '皮衣皮草', 'dress', 'http://localhost:8080/img/category/04.jpg');
INSERT INTO `category` VALUES ('13', 'T恤', 'dress', 'http://localhost:8080/img/category/05.jpg');
INSERT INTO `category` VALUES ('14', ' 风衣', 'dress', 'http://localhost:8080/img/category/06.jpg');
INSERT INTO `category` VALUES ('15', '背心吊带', 'dress', 'http://localhost:8080/img/category/07.jpg');
INSERT INTO `category` VALUES ('16', ' 蕾丝衫/雪纺衫', 'dress', 'http://localhost:8080/img/category/08.jpg');
INSERT INTO `category` VALUES ('17', '春夏新品', 'clothes', 'http://localhost:8080/img/category/09.jpg');
INSERT INTO `category` VALUES ('18', ' T恤', 'clothes', 'http://localhost:8080/img/category/10.jpg');
INSERT INTO `category` VALUES ('19', '衬衫', 'clothes', 'http://localhost:8080/img/category/11.jpg');
INSERT INTO `category` VALUES ('20', 'POLO衫', 'clothes', 'http://localhost:8080/img/category/12.jpg');
INSERT INTO `category` VALUES ('21', ' 休闲裤', 'clothes', 'http://localhost:8080/img/category/13.jpg');
INSERT INTO `category` VALUES ('22', ' 牛仔裤', 'clothes', 'http://localhost:8080/img/category/14.jpg');
INSERT INTO `category` VALUES ('23', '套装', 'clothes', 'http://localhost:8080/img/category/15.jpg');
INSERT INTO `category` VALUES ('24', ' 外套', 'clothes', 'http://localhost:8080/img/category/16.jpg');
INSERT INTO `category` VALUES ('25', '连衣裙', 'children', 'http://localhost:8080/img/category/17.jpg');
INSERT INTO `category` VALUES ('26', ' 保暖连体', 'children', 'http://localhost:8080/img/category/18.jpg');
INSERT INTO `category` VALUES ('27', ' 裤子', 'children', 'http://localhost:8080/img/category/19.jpg');
INSERT INTO `category` VALUES ('28', ' 羽绒', 'children', 'http://localhost:8080/img/category/20.jpg');
INSERT INTO `category` VALUES ('29', ' 女童运动鞋', 'children', 'http://localhost:8080/img/category/21.jpg');
INSERT INTO `category` VALUES ('30', ' 男童运动鞋', 'children', 'http://localhost:8080/img/category/22.jpg');
INSERT INTO `category` VALUES ('31', ' 毛绒玩具', 'children', 'http://localhost:8080/img/category/23.jpg');
INSERT INTO `category` VALUES ('32', ' 儿童自行车', 'children', 'http://localhost:8080/img/category/24.jpg');
INSERT INTO `category` VALUES ('33', '美妈大衣', 'pregnant', 'http://localhost:8080/img/category/25.jpg');
INSERT INTO `category` VALUES ('34', ' 孕妇裤', 'pregnant', 'http://localhost:8080/img/category/26.jpg');
INSERT INTO `category` VALUES ('35', ' 月子服', 'pregnant', 'http://localhost:8080/img/category/27.jpg');
INSERT INTO `category` VALUES ('36', '孕妇牛仔裤', 'pregnant', 'http://localhost:8080/img/category/28.jpg');
INSERT INTO `category` VALUES ('37', ' 孕妇内裤', 'pregnant', 'http://localhost:8080/img/category/29.jpg');
INSERT INTO `category` VALUES ('38', ' 哺乳文胸', 'pregnant', 'http://localhost:8080/img/category/30.jpg');
INSERT INTO `category` VALUES ('39', '美德乐', 'pregnant', 'http://localhost:8080/img/category/31.jpg');
INSERT INTO `category` VALUES ('40', '抱被', 'pregnant', 'http://localhost:8080/img/category/32.jpg');
INSERT INTO `category` VALUES ('41', '一脚蹬', 'shoes', 'http://localhost:8080/img/category/33.jpg');
INSERT INTO `category` VALUES ('42', '圆头鞋', 'shoes', 'http://localhost:8080/img/category/34.jpg');
INSERT INTO `category` VALUES ('43', '方根鞋', 'shoes', 'http://localhost:8080/img/category/35.jpg');
INSERT INTO `category` VALUES ('44', '水晶鞋', 'shoes', 'http://localhost:8080/img/category/36.jpg');
INSERT INTO `category` VALUES ('45', ' 尖头鞋', 'shoes', 'http://localhost:8080/img/category/37.jpg');
INSERT INTO `category` VALUES ('46', '平底低跟', 'shoes', 'http://localhost:8080/img/category/38.jpg');
INSERT INTO `category` VALUES ('47', '穆勒鞋', 'shoes', 'http://localhost:8080/img/category/39.jpg');
INSERT INTO `category` VALUES ('48', '异型跟', 'shoes', 'http://localhost:8080/img/category/40.jpg');
INSERT INTO `category` VALUES ('49', '女包', 'bag', 'http://localhost:8080/img/category/41.jpg');
INSERT INTO `category` VALUES ('50', ' 水桶包', 'bag', 'http://localhost:8080/img/category/42.jpg');
INSERT INTO `category` VALUES ('51', '双肩包', 'bag', 'http://localhost:8080/img/category/43.jpg');
INSERT INTO `category` VALUES ('52', '男包', 'bag', 'http://localhost:8080/img/category/44.jpg');
INSERT INTO `category` VALUES ('53', ' 旅行箱', 'bag', 'http://localhost:8080/img/category/45.jpg');
INSERT INTO `category` VALUES ('54', ' 钱包', 'bag', 'http://localhost:8080/img/category/46.jpg');
INSERT INTO `category` VALUES ('55', ' 真皮包', 'bag', 'http://localhost:8080/img/category/47.jpg');
INSERT INTO `category` VALUES ('56', '小方包', 'bag', 'http://localhost:8080/img/category/48.jpg');
INSERT INTO `category` VALUES ('57', ' 八角帽', 'decorate', 'http://localhost:8080/img/category/49.jpg');
INSERT INTO `category` VALUES ('58', ' 贝雷帽', 'decorate', 'http://localhost:8080/img/category/50.jpg');
INSERT INTO `category` VALUES ('59', ' 渔夫帽', 'decorate', 'http://localhost:8080/img/category/51.jpg');
INSERT INTO `category` VALUES ('60', '鸭舌帽', 'decorate', 'http://localhost:8080/img/category/52.jpg');
INSERT INTO `category` VALUES ('61', '礼帽', 'decorate', 'http://localhost:8080/img/category/53.jpg');
INSERT INTO `category` VALUES ('62', '草帽', 'decorate', 'http://localhost:8080/img/category/54.jpg');
INSERT INTO `category` VALUES ('63', ' 爵士帽', 'decorate', 'http://localhost:8080/img/category/55.jpg');
INSERT INTO `category` VALUES ('64', '盆帽', 'decorate', 'http://localhost:8080/img/category/56.jpg');

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature` (
  `id` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feature
-- ----------------------------
INSERT INTO `feature` VALUES ('1', 'http://localhost:8080/img/feature/feature01.jpg', 'https://www.baidu.com/', '撩人美裙');
INSERT INTO `feature` VALUES ('2', 'http://localhost:8080/img/feature/feature02.jpg', 'https://www.baidu.com/', '潮流外套');
INSERT INTO `feature` VALUES ('3', 'http://localhost:8080/img/feature/feature03.jpg', 'https://www.baidu.com/', '吸睛上衣');
INSERT INTO `feature` VALUES ('4', 'http://localhost:8080/img/feature/feature04.jpg', 'https://www.baidu.com/', '时髦裤装');
INSERT INTO `feature` VALUES ('5', 'http://localhost:8080/img/feature/feature05.jpg', 'https://www.baidu.com/', '撩人美裙');
INSERT INTO `feature` VALUES ('6', 'http://localhost:8080/img/feature/feature06.jpg', 'https://www.baidu.com/', '独具个性');
INSERT INTO `feature` VALUES ('7', 'http://localhost:8080/img/feature/feature07.jpg', 'https://www.baidu.com/', '保暖上衣');
INSERT INTO `feature` VALUES ('8', 'http://localhost:8080/img/feature/feature08.jpg', 'https://www.baidu.com/', '爵士外套');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(200) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `price` float(10,0) DEFAULT NULL,
  `like` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `swiper` varchar(600) DEFAULT NULL,
  `oldprice` float(10,0) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `freight` varchar(10) DEFAULT NULL,
  `services` varchar(20) DEFAULT NULL,
  `desc` varchar(20) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  `exchangegoods` varchar(10) DEFAULT NULL,
  `fahuo` varchar(10) DEFAULT NULL,
  `logoimg` varchar(200) DEFAULT NULL,
  `logoname` varchar(10) DEFAULT NULL,
  `totalcount` int(10) DEFAULT NULL,
  `totalbaby` int(10) DEFAULT NULL,
  `decr` double(10,0) DEFAULT NULL,
  `deportprice` double(10,0) DEFAULT NULL,
  `satification` double(10,0) DEFAULT NULL,
  `imgshow` varchar(1000) DEFAULT NULL,
  `baseinformation` varchar(100) DEFAULT NULL,
  `commend` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'http://localhost:8080/img/goods/news/news01.jpg', 'https://www.baidu.com/', '蜜妃儿黑色呢子大衣女中长款2019新款学生小个子冬季流行毛呢外套', '188', '❤21', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('2', 'http://localhost:8080/img/goods/news/news02.jpg', 'https://www.baidu.com/', '蜜妃儿冬季马甲女2019新款宽松外穿秋冬加厚小个子背心棉袄外套潮', '108', '❤9', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('3', 'http://localhost:8080/img/goods/news/news03.jpg', 'https://www.baidu.com/', '蜜妃儿长袖纯色打底衫女2019新款韩版学生秋冬季弹力修身内搭上衣', '49', '❤17', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('4', 'http://localhost:8080/img/goods/news/news04.jpg', 'https://www.baidu.com/', '蜜妃儿黑色牛仔裤女2019秋冬新款九分裤加绒高腰显瘦裤子直筒宽松', '108', '❤22', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('5', 'http://localhost:8080/img/goods/news/news05.jpg', 'https://www.baidu.com/', '10.28新品 10点开售 连帽毛呢大衣女中长款冬季2019流行呢子外套', '188', '❤3', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('6', 'http://localhost:8080/img/goods/news/news06.jpg', 'https://www.baidu.com/', '蜜妃儿马夹女冬季2019新款宽松背心棉袄短款学生韩版外穿马甲外套', '118', '❤20', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('7', 'http://localhost:8080/img/goods/news/news07.jpg', 'https://www.baidu.com/', '蜜妃儿冬季棉服女短款宽松面包服棉袄2019新款潮冬装韩版学生外套', '148', '❤36', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('8', 'http://localhost:8080/img/goods/news/news08.jpg', 'https://www.baidu.com/', '蜜妃儿秋冬森系毛衣女2019新款学生宽松外穿文艺上衣复古菱形针织', '118', '❤9', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('9', 'http://localhost:8080/img/goods/news/news09.jpg', 'https://www.baidu.com/', '蜜妃儿彩色格子毛衣女2019冬季新款套头宽松外穿慵懒风针织上衣潮', '118', '❤3', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('10', 'http://localhost:8080/img/goods/news/news10.jpg', 'https://www.baidu.com/', '蜜妃儿卫衣2019新款女加厚加绒宽松韩版连帽长袖外套女潮ins秋冬', '89', '❤36', 'news', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('11', 'http://localhost:8080/img/goods/pop/pop01.jpg', 'https://www.baidu.com/', '蜜妃儿毛呢格子裤复古直筒宽松2019秋冬新款学生百搭九分休闲裤女', '109', '6000+', 'pop', 'http://localhost:8080/img/goods/pop/pop011.jpg,http://localhost:8080/img/goods/pop/pop012.jpg', '120', '活动价', '退货补运费', '全国包邮', '新款上市', '10420', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg,http://localhost:8080/img/goods/pop/instru.png', 'http://localhost:8080/img/goods/pop/baseinformation.png', 'http://localhost:8080/img/goods/pop/commend.png');
INSERT INTO `goods` VALUES ('12', 'http://localhost:8080/img/goods/pop/pop02.jpg', 'https://www.baidu.com/', '蜜妃儿条纹毛衣女宽松外穿长袖韩版秋冬线衣慵懒风彩虹针织衫上衣', '79', '6000+', 'pop', 'http://localhost:8080/img/goods/pop/pop021.jpg,http://localhost:8080/img/goods/pop/pop022.jpg', '90', '优惠价', '退货补运费', '全国包邮', '新款上市', '2000', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('13', 'http://localhost:8080/img/goods/pop/pop03.jpg', 'https://www.baidu.com/', '蜜妃儿加厚加绒卫衣女秋冬宽松韩版bf慵懒风学生复古长袖女士上衣', '89', '1954', 'pop', 'http://localhost:8080/img/goods/pop/pop031.jpg,http://localhost:8080/img/goods/pop/pop032.jpg', '101', '活动价', '退货补运费', '全国包邮 ', '新款上市', '2005', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('14', 'http://localhost:8080/img/goods/pop/pop04.jpg', 'https://www.baidu.com/', '蜜妃儿米白色加绒牛仔裤女秋冬高腰裤子女2019新款宽松阔腿直筒裤', '79', '1266', 'pop', 'http://localhost:8080/img/goods/pop/pop041.jpg,http://localhost:8080/img/goods/pop/pop042.jpg', '89', '优惠价', '退货补运费', '全国包邮', '新款上市', '2000', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('15', 'http://localhost:8080/img/goods/pop/pop05.jpg', 'https://www.baidu.com/', '蜜妃儿外套女秋冬韩版宽松学生百搭2019流行新款秋装中长款风衣女', '129', '1076', 'pop', 'http://localhost:8080/img/goods/pop/pop051.jpg,http://localhost:8080/img/goods/pop/pop052.jpg', '150', '活动价', '退货补运费', '全国包邮', '新款上市', '856', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('16', 'http://localhost:8080/img/goods/pop/pop06.jpg', 'https://www.baidu.com/', '蜜妃儿毛衣女宽松外穿2019新款韩版长袖女上衣秋冬条纹套头针织衫', '79', '957', 'pop', 'http://localhost:8080/img/goods/pop/pop61.jpg,http://localhost:8080/img/goods/pop/pop062.jpg', '90', '优惠价', '退货补运费', '全国包邮', '新款上市', '2000', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('17', 'http://localhost:8080/img/goods/pop/pop07.jpg', 'https://www.baidu.com/', '蜜妃儿牛仔裤女2019秋季高腰宽松直筒cec裤子女韩版哈伦老爹裤女', '79', '671', 'pop', 'http://localhost:8080/img/goods/pop/pop071.jpg,http://localhost:8080/img/goods/pop/pop072.jpg', '90', '活动价', '退货补运费', '全国包邮', '新款上市', '459', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('18', 'http://localhost:8080/img/goods/pop/pop08.jpg', 'https://www.baidu.com/', '蜜妃儿牛仔裤女2019秋季高腰宽松直筒cec裤子女韩版哈伦老爹裤女', '79', '671', 'pop', 'http://localhost:8080/img/goods/pop/pop081.jpg,http://localhost:8080/img/goods/pop/pop082.jpg', '90', '优惠价', '退货补运费', '全国包邮', '新款上市', '2000', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('19', 'http://localhost:8080/img/goods/pop/pop09.jpg', 'https://www.baidu.com/', '蜜妃儿牛仔裤女2019秋季高腰宽松直筒cec裤子女韩版哈伦老爹裤女', '79', '671', 'pop', 'http://localhost:8080/img/goods/pop/pop091.jpg,http://localhost:8080/img/goods/pop/pop092.jpg', '90', '活动价', '退货补运费', '全国包邮', '新款上市', '656', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('20', 'http://localhost:8080/img/goods/pop/pop10.jpg', 'https://www.baidu.com/', '蜜妃儿米白色牛仔裤女加绒秋冬直筒宽松高腰老爹裤子女百搭阔腿裤', '89', '503', 'pop', 'http://localhost:8080/img/goods/pop/pop101.jpg,http://localhost:8080/img/goods/pop/pop102.jpg', '100', '优惠价', '退货补运费', '全国包邮', '新款上市', '1856', '七天无理由退换', '72小时发货', 'http://localhost:8080/img/logo/logo01.jpg', 'MG小象', '2000', '30528', '4', '5', '4', 'http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow02.jpg,http://localhost:8080/img/goods/pop/popshow01.jpg,http://localhost:8080/img/goods/pop/popshow03.jpg,http://localhost:8080/img/goods/pop/popshow04.jpg', null, null);
INSERT INTO `goods` VALUES ('21', 'http://localhost:8080/img/goods/select/select01.jpg', 'https://www.baidu.com/', '蜜妃儿秋冬打底针织衫女长袖2019新款韩版显瘦内搭半高领套头上衣', '59', '❤608', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('22', 'http://localhost:8080/img/goods/select/select10.jpg', 'https://www.baidu.com/', '蜜妃儿外套女秋冬韩版宽松学生百搭2019流行新款秋装中长款风衣女', '89', '❤47', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('23', 'http://localhost:8080/img/goods/select/select02.jpg', 'https://www.baidu.com/', '蜜妃儿白色卫衣女宽松韩版潮连帽学生上衣2019新款外套女春秋薄款', '79', '❤247', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('24', 'http://localhost:8080/img/goods/select/select03.jpg', 'https://www.baidu.com/', '蜜妃儿2019新款半身裙女a字裙高腰中长款裙子学生新款时尚网纱裙', '79', '❤56', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('25', 'http://localhost:8080/img/goods/select/select04.jpg', 'https://www.baidu.com/', '蜜妃儿七色彩虹长袖t恤女2019新款秋季宽松韩版慵懒风打底衫上衣', '79', '❤56', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('26', 'http://localhost:8080/img/goods/select/select05.jpg', 'https://www.baidu.com/', '蜜妃儿绿色毛衣女早秋宽松慵懒风韩版学生针织衫秋冬长袖打底上衣', '98', '❤146', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('27', 'http://localhost:8080/img/goods/select/select06.jpg', 'https://www.baidu.com/', '蜜妃儿黑白条纹毛衣女慵懒风长袖2019新款秋冬宽松外穿针织毛线衣', '79', '❤44', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('28', 'http://localhost:8080/img/goods/select/select07.jpg', 'https://www.baidu.com/', '蜜妃儿毛衣女宽松韩版2019新款学生针织衫上衣外套秋冬慵懒风外套', '89', '❤47', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('29', 'http://localhost:8080/img/goods/select/select08.jpg', 'https://www.baidu.com/', '蜜妃儿假两件卫衣女春秋薄款2019新款宽松bf长袖外套学生连帽上衣', '89', '❤60', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `goods` VALUES ('30', 'http://localhost:8080/img/goods/select/select09.jpg', 'https://www.baidu.com/', '蜜妃儿2019新款卫衣女春秋薄款学生灰色上衣韩版宽松长袖无帽外套', '109', '❤14', 'seleted', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for recommends
-- ----------------------------
DROP TABLE IF EXISTS `recommends`;
CREATE TABLE `recommends` (
  `id` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommends
-- ----------------------------
INSERT INTO `recommends` VALUES ('1', 'http://localhost:8080/img/recommend/recommend01.jpg', 'https://www.baidu.com/', '十点好物');
INSERT INTO `recommends` VALUES ('2', 'http://localhost:8080/img/recommend/recommend02.jpg', 'https://www.baidu.com/', '内购福利');
INSERT INTO `recommends` VALUES ('3', 'http://localhost:8080/img/recommend/recommend03.jpg', 'https://www.baidu.com/', '内购福利');
INSERT INTO `recommends` VALUES ('4', 'http://localhost:8080/img/recommend/recommend04.jpg', 'https://www.baidu.com/', 'VIP特惠');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '15913921738');
INSERT INTO `user` VALUES ('2', 'Jenny', '1358', '13433844540');
INSERT INTO `user` VALUES ('14', '15023654678', null, '15023654678');
INSERT INTO `user` VALUES ('15', '15023654678', null, '15023654678');
INSERT INTO `user` VALUES ('21', '15023654678', null, '15023654678');
INSERT INTO `user` VALUES ('22', '15023654678', null, '15023654678');
INSERT INTO `user` VALUES ('23', '15023654678', null, '15023654678');
INSERT INTO `user` VALUES ('25', '12345685274', null, '12345685274');
INSERT INTO `user` VALUES ('26', '14725836978', null, '14725836978');
INSERT INTO `user` VALUES ('27', null, null, null);
INSERT INTO `user` VALUES ('28', null, null, null);
INSERT INTO `user` VALUES ('29', null, null, null);
INSERT INTO `user` VALUES ('30', null, null, null);
INSERT INTO `user` VALUES ('31', null, null, null);
INSERT INTO `user` VALUES ('32', null, null, null);
INSERT INTO `user` VALUES ('33', null, null, null);
INSERT INTO `user` VALUES ('34', null, null, null);
INSERT INTO `user` VALUES ('35', null, null, null);
INSERT INTO `user` VALUES ('36', null, null, null);
INSERT INTO `user` VALUES ('37', null, null, null);
INSERT INTO `user` VALUES ('38', null, null, null);
INSERT INTO `user` VALUES ('39', null, null, null);
INSERT INTO `user` VALUES ('40', null, null, null);
INSERT INTO `user` VALUES ('41', null, null, null);
INSERT INTO `user` VALUES ('42', null, null, null);
INSERT INTO `user` VALUES ('43', null, null, null);
INSERT INTO `user` VALUES ('44', null, null, null);
INSERT INTO `user` VALUES ('45', null, null, null);
INSERT INTO `user` VALUES ('46', null, null, null);
INSERT INTO `user` VALUES ('47', null, null, null);
INSERT INTO `user` VALUES ('48', null, null, null);
INSERT INTO `user` VALUES ('49', null, null, null);
INSERT INTO `user` VALUES ('50', null, null, null);
INSERT INTO `user` VALUES ('51', null, null, null);
INSERT INTO `user` VALUES ('52', null, null, null);
