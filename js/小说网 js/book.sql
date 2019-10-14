/*
Navicat MySQL Data Transfer

Source Server         : h1902
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : book

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-08-27 00:51:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pre_admin
-- ----------------------------
DROP TABLE IF EXISTS `pre_admin`;
CREATE TABLE `pre_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(150) DEFAULT NULL COMMENT '密码盐',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(150) DEFAULT NULL COMMENT '邮箱',
  `register_time` int(11) DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of pre_admin
-- ----------------------------
INSERT INTO `pre_admin` VALUES ('1', 'admin', '7c1799af6a6f895409a2c4f54f3f635c', 'gmFHOPR7]~', null, null, '1231231');

-- ----------------------------
-- Table structure for pre_book
-- ----------------------------
DROP TABLE IF EXISTS `pre_book`;
CREATE TABLE `pre_book` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `titles` varchar(255) DEFAULT NULL COMMENT '小说标题',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `register_time` int(11) DEFAULT NULL COMMENT '时间',
  `content` text COMMENT '描述内容',
  `thumb` varchar(255) DEFAULT NULL COMMENT '图片封面',
  `cateid` int(10) unsigned DEFAULT NULL COMMENT '分类外键',
  `flag` varchar(255) DEFAULT NULL,
  `recycle` int(11) DEFAULT '1' COMMENT '回收站',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `key_book_cateid` (`cateid`) USING BTREE,
  CONSTRAINT `foreign_book_cateid` FOREIGN KEY (`cateid`) REFERENCES `pre_cate` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='书籍表';

-- ----------------------------
-- Records of pre_book
-- ----------------------------
INSERT INTO `pre_book` VALUES ('1', '山海梦', '若木召南', '123123123', '传说文明是一个轮回，一代文明的毁灭就是下一代文明的起始。谁也不知道宇宙到底存在了多久，只是在九州开始之前，已经有一代代文明陨灭更替。黄尘清水三山下，变更千年如走马，未来生生不息，人立于天地之间也不过匆忙一瞬，而即便结局已知，每个人心中的希望却不曾断绝。', null, '3', 'new', '1');
INSERT INTO `pre_book` VALUES ('2', '长生eng劫', '孙小米拉', '12312312', '永远忘不了那片雪山，雪山上的雪儿。 痛恨长生！唯对你，愿相信一回！', null, '3', 'top', '1');
INSERT INTO `pre_book` VALUES ('3', '幻世异路', '魔童降世', null, '人类、神魔之间的火花！法宝、魔导器之间的比拼！东方、西方之间的文化交融！武魂、魔法、异能之间的碰撞！召唤兽、魔兽谁才是世界的最强生物！作者与读者之间的心灵呼应！', null, '3', 'new', '1');
INSERT INTO `pre_book` VALUES ('4', '游刃', '卫雨', null, '阳光可爱体育经纪vs清冷孤高花滑天才，当年青梅竹马携手追梦，今日并肩作战重回巅峰。 你是世人的冠军，更是我的少年', null, '5', 'hot', '1');
INSERT INTO `pre_book` VALUES ('5', '第七特案所', '第七特案所', '1514736000', '新书《在吗，一起组个队？》预收一波呀，虽然我知道没有多少读者，不过还是谢谢大家的支持。\r\n沈安昀看到那起案件被害人的身旁，摆着一朵白色桔梗花，上面沾的的，不是死者的，而是他的。 \r\n（本文很甜的，悬疑是本书分类，贯穿全文，后期会有配角的纯.爱支线，但是各种甜宠，是你们的选择哦！）', '/uploads/20190824142924ahjxDHLPQRVW268.png', '2', 'new', '0');
INSERT INTO `pre_book` VALUES ('6', ' 心照日月', '乔亚', '1514736000', '在得知自己还有一年多的生命后，秦雯没有任何犹豫，毅然决然的坚持着支教，将自己的一生都奉献给那些贫苦山区的孩子们。也许是上天的恩赐，她在生命的最后一段时间，竟然遇到了这么一群可爱的小家伙，还有，那个人……', '/uploads/20190824135726cejowBKLNOPRZ12.png', '2', 'new', '1');
INSERT INTO `pre_book` VALUES ('8', '大仙是盗墓贼', '状元小书童', '1566691200', 'qqq', '/uploads/20190826074600adfhilovHJNPT29.png', '3', 'new', '1');
INSERT INTO `pre_book` VALUES ('9', 'aa11', 'qq11', '1564704000', 'aaa11', '/uploads/20190826100332abceinvADEILQZ9.png', '2', 'hot', '1');
INSERT INTO `pre_book` VALUES ('10', '退役女兵正年轻', '煜素', '1565280000', '<span style=\"color:#808080;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">蓝珂，武警退役，空有一身功夫，却无施展之地。</span><span style=\"color:#808080;font-family:&quot;font-size:14px;background-color:#FFFFFF;\">没有学历，没有技术，蓝珂咬牙，那就自学考试，工作从底层做起，吃苦耐劳，是军人必备的品质</span>', '/uploads/20190826234503bdehpstwHJMQSX2.png', '2', 'hot', '1');
INSERT INTO `pre_book` VALUES ('11', '我在异界搞开发', '钻石星辰击', '1563379200', '<span style=\"color:#262626;font-family:PingFangSC-Regular, -apple-system, Simsun;font-size:14px;background-color:#FFFFFF;\">修仙觅长生，热血任逍遥，踏莲曳波涤剑骨，凭虚御风塑圣魂！</span>', '/uploads/20190827000757cfhimosvxFJKW04.png', '4', '', '1');

-- ----------------------------
-- Table structure for pre_cate
-- ----------------------------
DROP TABLE IF EXISTS `pre_cate`;
CREATE TABLE `pre_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of pre_cate
-- ----------------------------
INSERT INTO `pre_cate` VALUES ('1', '武侠');
INSERT INTO `pre_cate` VALUES ('2', '言情');
INSERT INTO `pre_cate` VALUES ('3', '奇幻玄幻');
INSERT INTO `pre_cate` VALUES ('4', '武侠仙侠');
INSERT INTO `pre_cate` VALUES ('5', '竞技');
INSERT INTO `pre_cate` VALUES ('6', '历史军事');

-- ----------------------------
-- Table structure for pre_chapter
-- ----------------------------
DROP TABLE IF EXISTS `pre_chapter`;
CREATE TABLE `pre_chapter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `register_time` int(11) DEFAULT NULL COMMENT '章节更新时间',
  `title` varchar(255) DEFAULT NULL COMMENT '章节标题',
  `content` varchar(255) DEFAULT NULL COMMENT '章节的内容是一个路径',
  `bookid` int(10) unsigned DEFAULT NULL COMMENT '书籍外键',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `key_chapter_bookid` (`bookid`) USING BTREE,
  CONSTRAINT `foreign_chapter_bookid` FOREIGN KEY (`bookid`) REFERENCES `pre_book` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='章节表';

-- ----------------------------
-- Records of pre_chapter
-- ----------------------------
INSERT INTO `pre_chapter` VALUES ('1', '1566805587', '第一章   古墓（一）', '/book/20190826/bhlmqwACFHIKNPSV0347.json', '8');
INSERT INTO `pre_chapter` VALUES ('2', '1566805587', '第二章   古墓（二）', '/book/20190826/afimswxBCDFHKMNPRTX8.json', '8');
INSERT INTO `pre_chapter` VALUES ('3', '1566805588', '第三章    古墓得见', '/book/20190826/ehjmnopqswxADHIQRVZ5.json', '8');
INSERT INTO `pre_chapter` VALUES ('4', '1566805588', '第四章   穿过黑洞', '/book/20190826/bflmstuyCDJNQRXYZ678.json', '8');
INSERT INTO `pre_chapter` VALUES ('5', '1566805589', '第五章  巨石大殿', '/book/20190826/eghqrstxyABDIOTUW357.json', '8');
INSERT INTO `pre_chapter` VALUES ('6', '1566805589', '第六章   宝藏', '/book/20190826/iloprtwyDKMORTV03457.json', '8');
INSERT INTO `pre_chapter` VALUES ('7', '1566805590', '第七章   青铜宝镜', '/book/20190826/ghkmorsvxBGKLSTWYZ36.json', '8');
INSERT INTO `pre_chapter` VALUES ('8', '1566805591', '第八章   出墓', '/book/20190826/chilqrvzAFILOQTXYZ58.json', '8');
INSERT INTO `pre_chapter` VALUES ('9', '1566805592', '第九章   拍卖', '/book/20190826/bcfhiltuvyEJKLNVY169.json', '8');
INSERT INTO `pre_chapter` VALUES ('10', '1566805594', '第十章  成交', '/book/20190826/bdeghijknowAFHJMV168.json', '8');
INSERT INTO `pre_chapter` VALUES ('11', '1566805595', '第十一章   车展', '/book/20190826/bgjrsyADEFHJKQUVW056.json', '8');
INSERT INTO `pre_chapter` VALUES ('12', '1566805595', '第十二章　　朱倩倩', '/book/20190826/aehorwCDEJNPRUWXY126.json', '8');
INSERT INTO `pre_chapter` VALUES ('13', '1566805596', '第十三章   豪车定情', '/book/20190826/bcgnopstuvwyABHJKLY6.json', '8');
INSERT INTO `pre_chapter` VALUES ('14', '1566805596', '第十四章   约会', '/book/20190826/bcdfjmqswxyCFHIOTV18.json', '8');
INSERT INTO `pre_chapter` VALUES ('15', '1566805597', '第十五章   初恋的感觉', '/book/20190826/acdfloqvwAGLNORTUWX7.json', '8');
INSERT INTO `pre_chapter` VALUES ('16', '1566805597', '第十六章   逃生', '/book/20190826/ciklmnqsuyKMPSTYZ568.json', '8');
INSERT INTO `pre_chapter` VALUES ('17', '1566805598', '第十七章   逃回古墓', '/book/20190826/bceijlopuxyDMTWYZ017.json', '8');
INSERT INTO `pre_chapter` VALUES ('18', '1566805598', '第十八章  死伤惨重', '/book/20190826/cdilorsxDEFIJX345789.json', '8');
INSERT INTO `pre_chapter` VALUES ('19', '1566805599', '第十九章  龙豪', '/book/20190826/eghinowACHILMQSWX178.json', '8');
INSERT INTO `pre_chapter` VALUES ('20', '1566805599', '第二十章  无奈离去', '/book/20190826/defgpqtuwyDGHOT01257.json', '8');
INSERT INTO `pre_chapter` VALUES ('21', '1566805600', '第二十一章   花絮（一）', '/book/20190826/cdhklopsxAFGKNRX2459.json', '8');
INSERT INTO `pre_chapter` VALUES ('22', '1566808235', '出租车里再相逢', '/book/20190826/afgjnosvwxABCFHKQY48.json', '4');
INSERT INTO `pre_chapter` VALUES ('23', '1566808236', '不是冤家不聚头', '/book/20190826/bdefmnruxyBDENV01467.json', '4');
INSERT INTO `pre_chapter` VALUES ('24', '1566808237', '犹忆当年少年时', '/book/20190826/bcgiklptuELMNX145789.json', '4');
INSERT INTO `pre_chapter` VALUES ('25', '1566808238', '少年少女同翻墙', '/book/20190826/dehoprsuvFKPSUX02459.json', '4');
INSERT INTO `pre_chapter` VALUES ('26', '1566808239', '冰上一跳惊天地', '/book/20190826/bcglnqvzBGHJORTUY127.json', '4');
INSERT INTO `pre_chapter` VALUES ('27', '1566808239', '回程之路起风波', '/book/20190826/bcdijlptyDEFHJLUVX01.json', '4');
INSERT INTO `pre_chapter` VALUES ('28', '1566808240', '吃哪补哪', '/book/20190826/dfgiknoprvxALPTV2459.json', '4');
INSERT INTO `pre_chapter` VALUES ('29', '1566808241', '发现敌情', '/book/20190826/acensuxDFIKLUWY01278.json', '4');
INSERT INTO `pre_chapter` VALUES ('30', '1566808241', '初次交锋', '/book/20190826/ajlnpqsuxzHKOPUVX345.json', '4');
INSERT INTO `pre_chapter` VALUES ('31', '1566808242', '义薄云天', '/book/20190826/adhkvxyBCDFJNPVYZ036.json', '4');
INSERT INTO `pre_chapter` VALUES ('32', '1566808242', '危急时刻', '/book/20190826/cfjklmntwxzCDHLV3689.json', '4');
INSERT INTO `pre_chapter` VALUES ('33', '1566808243', '百密一疏', '/book/20190826/ehijmopsuwBCFGHIJKQ4.json', '4');
INSERT INTO `pre_chapter` VALUES ('34', '1566808243', '继母', '/book/20190826/gjkpqrsBFIKOPQRSTV13.json', '4');
INSERT INTO `pre_chapter` VALUES ('35', '1566808941', '第一章 幻世图', '/book/20190826/fjrswxyzBFIKRSY01456.json', '3');
INSERT INTO `pre_chapter` VALUES ('36', '1566808941', '第二章 初见异能', '/book/20190826/ekmovyCJLOQUWZ012458.json', '3');
INSERT INTO `pre_chapter` VALUES ('37', '1566808942', '第三章 器灵？图图？', '/book/20190826/aikopruwABCELSZ23569.json', '3');
INSERT INTO `pre_chapter` VALUES ('38', '1566808942', '第四章 再探禁地', '/book/20190826/abehjorsvxCKQUVWXY16.json', '3');
INSERT INTO `pre_chapter` VALUES ('39', '1566808942', '第五章 密室', '/book/20190826/aehknrtwADHNPRTUY168.json', '3');
INSERT INTO `pre_chapter` VALUES ('40', '1566808943', '第六章 三人的友谊', '/book/20190826/abdefghrzACMQSUW2568.json', '3');
INSERT INTO `pre_chapter` VALUES ('41', '1566808946', '第七章 惊不惊喜，意不意外！', '/book/20190826/bhjlmnquBNPRTYZ04689.json', '3');
INSERT INTO `pre_chapter` VALUES ('42', '1566808946', '第八章 落日城', '/book/20190826/bgjnozAHJNOYZ1235679.json', '3');
INSERT INTO `pre_chapter` VALUES ('43', '1566808947', '第九章 魔幻大陆', '/book/20190826/adefilmtuwGJOQSU3458.json', '3');
INSERT INTO `pre_chapter` VALUES ('44', '1566808947', '第十章 入学测试一', '/book/20190826/bcdgilmnpBEHKLRSTYZ2.json', '3');
INSERT INTO `pre_chapter` VALUES ('45', '1566808947', '第十一章 入学测试二', '/book/20190826/adhmnstwDHKPQTUVX368.json', '3');
INSERT INTO `pre_chapter` VALUES ('46', '1566808948', '第十二章 入学测试三', '/book/20190826/dhoprxDEFIJPSVX01479.json', '3');
INSERT INTO `pre_chapter` VALUES ('47', '1566808948', '第十三章 入学测试四', '/book/20190826/agmopstuvyzIMNWX2458.json', '3');
INSERT INTO `pre_chapter` VALUES ('48', '1566808948', '第十四章 入学测试五', '/book/20190826/ersuvxABHIMRUVWY1239.json', '3');
INSERT INTO `pre_chapter` VALUES ('49', '1566808949', '第十五章 入学测试六', '/book/20190826/bgklmopvJKNVYZ123456.json', '3');
INSERT INTO `pre_chapter` VALUES ('50', '1566808949', '第十六章 安德鲁·威尔斯', '/book/20190826/cgiknqrtFHIKRUWXZ358.json', '3');
INSERT INTO `pre_chapter` VALUES ('51', '1566808949', '第十七章 交流会', '/book/20190826/abdhlprwBEFGJMRUWY45.json', '3');
INSERT INTO `pre_chapter` VALUES ('52', '1566808950', '第十八章 梦魇山谷一', '/book/20190826/eghnuvzADJMOPQRSTZ45.json', '3');
INSERT INTO `pre_chapter` VALUES ('53', '1566808950', '第十九章 梦魇山谷二', '/book/20190826/cklpqsvxyCDGILMOT149.json', '3');
INSERT INTO `pre_chapter` VALUES ('54', '1566808950', '第二十章 梦魇山谷三', '/book/20190826/bchjksuJPQSTUVX12789.json', '3');
INSERT INTO `pre_chapter` VALUES ('55', '1566808950', '第二十一章 幻世！异魔！', '/book/20190826/bdfghopAGHJKLOW02456.json', '3');
INSERT INTO `pre_chapter` VALUES ('56', '1566808951', '第二十二章 初次交锋', '/book/20190826/hkloqvwAHJLOSTUVW037.json', '3');
INSERT INTO `pre_chapter` VALUES ('57', '1566808951', '第二十三章 麦克的阴谋', '/book/20190826/efklmqtuvADFGJMNRS12.json', '3');
INSERT INTO `pre_chapter` VALUES ('58', '1566808951', '第二十四章 巨大的危机一', '/book/20190826/bcdfjlpqrABFHIKLRU26.json', '3');
INSERT INTO `pre_chapter` VALUES ('59', '1566808952', '第二十五章 巨大的危机二', '/book/20190826/chijopqsuvxAGLMNQTU6.json', '3');
INSERT INTO `pre_chapter` VALUES ('60', '1566808952', '第二十六章 巨大的危机三', '/book/20190826/bcfhimnqtuxEGJRVX134.json', '3');
INSERT INTO `pre_chapter` VALUES ('61', '1566808952', '第二十七章 交流会风波结束', '/book/20190826/behqxzAFGHLPSUV13679.json', '3');
INSERT INTO `pre_chapter` VALUES ('62', '1566808952', '第二十八章 穆笙婉的过去', '/book/20190826/hjmopsuBFHIJKQVW1589.json', '3');
INSERT INTO `pre_chapter` VALUES ('63', '1566808953', '第二十九章 哥成了一个传说', '/book/20190826/dhiqtvyCEFHIOPQSWX16.json', '3');
INSERT INTO `pre_chapter` VALUES ('64', '1566808953', '第三十章 十系魔法修炼', '/book/20190826/bhjprsxyCDJKNXY01689.json', '3');
INSERT INTO `pre_chapter` VALUES ('65', '1566808953', '第三十一章 轮回', '/book/20190826/adfjklnqsuwIMPSVW245.json', '3');
INSERT INTO `pre_chapter` VALUES ('66', '1566808954', '第三十二章 窜天鼠', '/book/20190826/abdeglmsBEKLMOTUXY34.json', '3');
INSERT INTO `pre_chapter` VALUES ('67', '1566808954', '第三十三章 天运魔盘', '/book/20190826/bcdjlqsDFILQRSWXY268.json', '3');
INSERT INTO `pre_chapter` VALUES ('68', '1566808954', '第三十四章 挑衅', '/book/20190826/fgjkotvBCIMRTVY15689.json', '3');
INSERT INTO `pre_chapter` VALUES ('69', '1566809439', '第1章 捕捉一只小可爱         ', '/book/20190826/djkmnozEHJLMNORSX278.json', '6');
INSERT INTO `pre_chapter` VALUES ('70', '1566809440', '第2章 想不想上学？         ', '/book/20190826/cehoprsxKLQRVWY04689.json', '6');
INSERT INTO `pre_chapter` VALUES ('71', '1566809440', '第3章极品家长         ', '/book/20190826/dilmopwyBEJKLORVWY08.json', '6');
INSERT INTO `pre_chapter` VALUES ('72', '1566809440', '第4章商量一下         ', '/book/20190826/deghkoqtyzBFLNQRVW13.json', '6');
INSERT INTO `pre_chapter` VALUES ('73', '1566809440', '第5章迟到的惩罚         ', '/book/20190826/acdfhiquwxzBDGPSTW47.json', '6');
INSERT INTO `pre_chapter` VALUES ('74', '1566809441', '第6章贪婪的嘴脸         ', '/book/20190826/cefhiuvxyAHJKNPYZ459.json', '6');
INSERT INTO `pre_chapter` VALUES ('75', '1566809441', '第7章他没听出来这是客套话吗？         ', '/book/20190826/abcilnryBGLPRSUX0378.json', '6');
INSERT INTO `pre_chapter` VALUES ('76', '1566809441', '第8章鸡腿，吃吗？         ', '/book/20190826/bdefjlqwxyzCFGJORWZ9.json', '6');
INSERT INTO `pre_chapter` VALUES ('77', '1566809441', '第9章秦雯的期许         ', '/book/20190826/abnqsvyBFMQSUYZ04568.json', '6');
INSERT INTO `pre_chapter` VALUES ('78', '1566809442', '第10章叫林暖，怎么样？         ', '/book/20190826/cdfhinqtCEJNOPQRX369.json', '6');
INSERT INTO `pre_chapter` VALUES ('79', '1566809442', '第11章秦雯那个恶毒的女人         ', '/book/20190826/elorsyBDFGHJMPRXZ478.json', '6');
INSERT INTO `pre_chapter` VALUES ('80', '1566809442', '第12章捉弄         ', '/book/20190826/abcelptuxACGHIOQWY01.json', '6');
INSERT INTO `pre_chapter` VALUES ('81', '1566809442', '第13章温暖         ', '/book/20190826/koqvwxyzABIKPSTX0257.json', '6');
INSERT INTO `pre_chapter` VALUES ('82', '1566809443', '第14章意外相拥         ', '/book/20190826/degiknruxzEFIJLOU568.json', '6');
INSERT INTO `pre_chapter` VALUES ('83', '1566809443', '第15章争夺         ', '/book/20190826/dghjklpsuxyDEJOPWYZ6.json', '6');
INSERT INTO `pre_chapter` VALUES ('84', '1566809443', '第16章打个欠条         ', '/book/20190826/glqvwxyzBHLMPSY02367.json', '6');
INSERT INTO `pre_chapter` VALUES ('85', '1566809444', '第17章好孩子不打架            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cdijlnpuDJKMNPVWY689.json', '6');
INSERT INTO `pre_chapter` VALUES ('86', '1566809444', '第18章郁凌？好……巧啊            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/depquvzDFGHKMQRVZ357.json', '6');
INSERT INTO `pre_chapter` VALUES ('87', '1566809444', '第19章好好学习，天天向上            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abcegmprswxyzBCUWX38.json', '6');
INSERT INTO `pre_chapter` VALUES ('88', '1566809445', '第20章月底考试            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcijloqstuyzAGKLMQUZ.json', '6');
INSERT INTO `pre_chapter` VALUES ('89', '1566809445', '第21章因为你！            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bdfghipvADGHKPSUZ347.json', '6');
INSERT INTO `pre_chapter` VALUES ('90', '1566809445', '第22章以后，有我            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcilpstyIJLNORSTVXZ1.json', '6');
INSERT INTO `pre_chapter` VALUES ('91', '1566809446', '第23章扎心了老铁！            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/fghjmquwyzCHLOSVXZ78.json', '6');
INSERT INTO `pre_chapter` VALUES ('92', '1566809446', '第24章错觉            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bfgiknruzCGHILMNS259.json', '6');
INSERT INTO `pre_chapter` VALUES ('93', '1566809446', '第25章回家了            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/acfhmpqxzEFIORSU1359.json', '6');
INSERT INTO `pre_chapter` VALUES ('94', '1566809447', '第26章空寂            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/dhimorvwxCFGHKQRS356.json', '6');
INSERT INTO `pre_chapter` VALUES ('95', '1566809447', '第27章他以前叫顾凌            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bceglovxCDEGLMNPRSX0.json', '6');
INSERT INTO `pre_chapter` VALUES ('96', '1566809447', '第28章你好，我叫顾凌            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/deklmnquvxBCJNP01579.json', '6');
INSERT INTO `pre_chapter` VALUES ('97', '1566809447', '第29章心里忽然放起了小烟花            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/efgoqwyzBELPQRSX2357.json', '6');
INSERT INTO `pre_chapter` VALUES ('98', '1566809448', '第30章不，我觉得你一点儿不明白            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ejkmrsyDGKMNQUWXZ057.json', '6');
INSERT INTO `pre_chapter` VALUES ('99', '1566809448', '第31章历史总是惊人的相似            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcdgjlmrsvBHLNOW1245.json', '6');
INSERT INTO `pre_chapter` VALUES ('100', '1566809448', '第32章他的胃口是属小猫咪的吗？            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/acefmorstuxFIPQSX239.json', '6');
INSERT INTO `pre_chapter` VALUES ('101', '1566809448', '第33章喜欢啊喜欢            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/imopwxzAEGKQVWY01579.json', '6');
INSERT INTO `pre_chapter` VALUES ('102', '1566809448', '第34章脑补的力量            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ghjlosyzEJLOQRSVWXZ9.json', '6');
INSERT INTO `pre_chapter` VALUES ('103', '1566809449', '第35章果然不是错觉！            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bdhiklmruvwxHLMNVW39.json', '6');
INSERT INTO `pre_chapter` VALUES ('104', '1566809449', '第36章他们两个有一腿            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/chruxABHIKLOPQRTZ018.json', '6');
INSERT INTO `pre_chapter` VALUES ('105', '1566809449', '第37章嗯，真香            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abcghlpsuEJKRSTUZ489.json', '6');
INSERT INTO `pre_chapter` VALUES ('106', '1566809449', '第38章谈谈？            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/beghntyADFILOYZ02347.json', '6');
INSERT INTO `pre_chapter` VALUES ('107', '1566809450', '第39章老师，你是魔鬼吗？            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ejlnpqwzADGHKOPRSU04.json', '6');
INSERT INTO `pre_chapter` VALUES ('108', '1566809450', '第40章我跟你一起去            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/acnquvzCEFGIKV013489.json', '6');
INSERT INTO `pre_chapter` VALUES ('109', '1566809450', '第41章山人自有妙计            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bhklnpruxCHJKQUVY039.json', '6');
INSERT INTO `pre_chapter` VALUES ('110', '1566809450', '第42章我也是有条件的            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/adefprtBEFGIKOQRTU67.json', '6');
INSERT INTO `pre_chapter` VALUES ('111', '1566809451', '第43章看他的字，很有学医的天赋            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cdgikqsuvwyBHMNQTUW2.json', '6');
INSERT INTO `pre_chapter` VALUES ('112', '1566809451', '第44章秦老师，过来这边            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/adefijosvwABLPSVZ125.json', '6');
INSERT INTO `pre_chapter` VALUES ('113', '1566809451', '第45章她简直就是小天使啊！            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcinoquvBCDGHMNRY167.json', '6');
INSERT INTO `pre_chapter` VALUES ('114', '1566809451', '第46章话说，你这个姿势还舒服吗            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/gjnqvwABDEGINPSYZ139.json', '6');
INSERT INTO `pre_chapter` VALUES ('115', '1566809452', '第47章秦雯jio得她可生气了，...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bhqtuwyDEFHKLQRU1678.json', '6');
INSERT INTO `pre_chapter` VALUES ('116', '1566809452', '第48章　这也是个悲伤的故事！            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/dhjlprADEGIMQW024789.json', '6');
INSERT INTO `pre_chapter` VALUES ('117', '1566809452', '第49章别放弃治疗            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/gjnqwxFGJLMNQRS34567.json', '6');
INSERT INTO `pre_chapter` VALUES ('118', '1566809452', '第50章显而易见的嫌弃            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcefklnotuvzBCIMUY35.json', '6');
INSERT INTO `pre_chapter` VALUES ('119', '1566809452', '第51章不是人造革，是真的皮            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abdgiopxzAMPQRTV1257.json', '6');
INSERT INTO `pre_chapter` VALUES ('120', '1566809453', '第52章挖坑埋自己            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/afmqtwzADEIJKRTWYZ16.json', '6');
INSERT INTO `pre_chapter` VALUES ('121', '1566809453', '第53章skr魔鬼吧！            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abfmnstuvBGHNOPRS035.json', '6');
INSERT INTO `pre_chapter` VALUES ('122', '1566809453', '第54章现实教她做人            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cilpvABDFGIMRWY01578.json', '6');
INSERT INTO `pre_chapter` VALUES ('123', '1566809453', '第55章死猪不怕开水烫            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cefhlqstvwxyzACHN019.json', '6');
INSERT INTO `pre_chapter` VALUES ('124', '1566809454', '第56章她是练过铁头功吗？            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cdflqswBDEHMOPTVX469.json', '6');
INSERT INTO `pre_chapter` VALUES ('125', '1566809454', '第57章我也很疼            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abcdimuBEHILMNUXY356.json', '6');
INSERT INTO `pre_chapter` VALUES ('126', '1566809454', '第58章论试验结果            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ehkpqrxyzCFINORUVY45.json', '6');
INSERT INTO `pre_chapter` VALUES ('127', '1566809455', '第59章都是闲的            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abeuxyCEGHIJLNPUZ069.json', '6');
INSERT INTO `pre_chapter` VALUES ('128', '1566809455', '第60章现在的孩子，真让人秃头            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/fjmosuwyzGOPQVZ01369.json', '6');
INSERT INTO `pre_chapter` VALUES ('129', '1566809455', '第61章如果不是你长得好看            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bejlrsuxEIJMQRSTUWZ0.json', '6');
INSERT INTO `pre_chapter` VALUES ('130', '1566809455', '第62章求生欲爆发            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cglrtwyACEFJQWX02389.json', '6');
INSERT INTO `pre_chapter` VALUES ('131', '1566809455', '第63章秦魔鬼十分满意            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/adefhilmpruvAFHJ0145.json', '6');
INSERT INTO `pre_chapter` VALUES ('132', '1566809456', '第64章郁凌式求收留            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ailnswxzBDHJLRVX1348.json', '6');
INSERT INTO `pre_chapter` VALUES ('133', '1566809456', '第65章你这人怎么不按照套路走            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cdeijkmqswxyzDGJOPW3.json', '6');
INSERT INTO `pre_chapter` VALUES ('134', '1566809456', '第66章他像个么得感情的杀手            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/acmpqtuwADGIMNPSTVXZ.json', '6');
INSERT INTO `pre_chapter` VALUES ('135', '1566809456', '第67章一杯奶茶引发的血案            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ehrswCEGJKQRSUWZ0189.json', '6');
INSERT INTO `pre_chapter` VALUES ('136', '1566809457', '第68章你昨晚是去跟熊猫学美妆了...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/dflnqrstvxyKMOPRS078.json', '6');
INSERT INTO `pre_chapter` VALUES ('137', '1566809457', '第69章秦雯，你在害怕什么            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/chipuxyABELMOPRUY567.json', '6');
INSERT INTO `pre_chapter` VALUES ('138', '1566809457', '第70章你脸皮还真不是一般的厚啊            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cdehijprtxIKLMQRTY78.json', '6');
INSERT INTO `pre_chapter` VALUES ('139', '1566809457', '第71章乖，别乱动            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bhlrstvxACLMNOPSTV78.json', '6');
INSERT INTO `pre_chapter` VALUES ('140', '1566809458', '第72章你能不能做我女朋友啊？            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abdefhmpsxKMPTUVWZ78.json', '6');
INSERT INTO `pre_chapter` VALUES ('141', '1566809458', '第73章突发事件            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/acgpswxzDEFLQRUY3468.json', '6');
INSERT INTO `pre_chapter` VALUES ('142', '1566809458', '第74章被相亲的小凌凌            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/aefgklrsBFKLPRVZ0378.json', '6');
INSERT INTO `pre_chapter` VALUES ('143', '1566809458', '第75章我很崇拜她            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/acnoqtvCEFJOPZ123467.json', '6');
INSERT INTO `pre_chapter` VALUES ('144', '1566809458', '第76章这谁忍受得了            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bhjsyCGJNOPSUWX02458.json', '6');
INSERT INTO `pre_chapter` VALUES ('145', '1566809459', '第77章你都多大了还叫人陪着            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/adhjknqrswDKOST13579.json', '6');
INSERT INTO `pre_chapter` VALUES ('146', '1566809459', '第78章这不太好吧            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/fhjklnquyCEJORVY0678.json', '6');
INSERT INTO `pre_chapter` VALUES ('147', '1566809459', '第79章想不到做什么，那就上柱香...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cfhnprsvxyACDNRUWX59.json', '6');
INSERT INTO `pre_chapter` VALUES ('148', '1566809459', '第80章他们还年轻，不想英年早逝            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/abceimnprstAHJKLVY48.json', '6');
INSERT INTO `pre_chapter` VALUES ('149', '1566809460', '第81章这三个人的电影里，她似乎...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cgipvwCDFIMOPXY06789.json', '6');
INSERT INTO `pre_chapter` VALUES ('150', '1566809460', '第82章我怀疑你们在开车，而且也...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/dgpqrxzCEHIJPSUWY378.json', '6');
INSERT INTO `pre_chapter` VALUES ('151', '1566809460', '第83章阳光依旧明媚，只是照耀不...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/dflnorsyzACELPRTVZ05.json', '6');
INSERT INTO `pre_chapter` VALUES ('152', '1566809460', '第84章简直把她当成了易碎物品            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/hjknortDIJMPTWX05789.json', '6');
INSERT INTO `pre_chapter` VALUES ('153', '1566809461', '第85章你这副我去偷了试卷的表情...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bghjlmtBCEFHIOTWX679.json', '6');
INSERT INTO `pre_chapter` VALUES ('154', '1566809461', '第86章她在隐瞒什么？            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cdiknrsuwxEGJLQVY012.json', '6');
INSERT INTO `pre_chapter` VALUES ('155', '1566809461', '第87章越想忘，记忆就越深刻！            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/dglopqsyACEJKLNOUV37.json', '6');
INSERT INTO `pre_chapter` VALUES ('156', '1566809461', '第88章如果这都不算爱            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcdfjlmqtyzEGJKNOTVY.json', '6');
INSERT INTO `pre_chapter` VALUES ('157', '1566809461', '第89章你是想去当志愿者            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bfpswzAEGLMPQTUZ1456.json', '6');
INSERT INTO `pre_chapter` VALUES ('158', '1566809462', '第90章我陪你            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/aehkpquxzGHLMQWX0248.json', '6');
INSERT INTO `pre_chapter` VALUES ('159', '1566809462', '第91章迟到的叛逆            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/efhkqtuADEFGJOQX2468.json', '6');
INSERT INTO `pre_chapter` VALUES ('160', '1566809462', '第92章出事了            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cdfghnuwxyBEGIJOX346.json', '6');
INSERT INTO `pre_chapter` VALUES ('161', '1566809462', '第93章她怎么没来上学？            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cfinpyAFGKLMQXZ01456.json', '6');
INSERT INTO `pre_chapter` VALUES ('162', '1566809463', '第94章结局，暖阳、初晴            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ajmorvwxACFHNTUWY026.json', '6');
INSERT INTO `pre_chapter` VALUES ('163', '1566809463', '第95章番外1，不会辜负            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcdejlpqrwyBCEHIORV8.json', '6');
INSERT INTO `pre_chapter` VALUES ('164', '1566809463', '第96章番外2            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/fhklmpruyBCDFHKLSUVW.json', '6');
INSERT INTO `pre_chapter` VALUES ('165', '1566810167', '晓梅看法：感谢《心照日月》中的诗...         ', '/book/20190826/adegksuyzAGIKMPT2356.json', '6');
INSERT INTO `pre_chapter` VALUES ('166', '1566810167', '武进开放大学         ', '/book/20190826/fgkopquvxzBMNSUWX015.json', '6');
INSERT INTO `pre_chapter` VALUES ('167', '1566810168', '江苏省武进高级中学         ', '/book/20190826/hkmpqrzACIJKNQRUVYZ2.json', '6');
INSERT INTO `pre_chapter` VALUES ('168', '1566810168', '武进新闻         ', '/book/20190826/befjruwyGIJKLNSTU036.json', '6');
INSERT INTO `pre_chapter` VALUES ('169', '1566810169', '钱永彪：当今法官生活的真实写照            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/bcjlmopqruwzBHNOPY23.json', '6');
INSERT INTO `pre_chapter` VALUES ('170', '1566810169', '常州日报  金志霖            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/chlnopqrswxFGOTXY035.json', '6');
INSERT INTO `pre_chapter` VALUES ('171', '1566810170', '高绍安：退而不休 笔耕不辍            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/hixACDEGILNPQRSXY067.json', '6');
INSERT INTO `pre_chapter` VALUES ('172', '1566810170', '人民法院报  张军民            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/befiklnquzBCIOPV1246.json', '6');
INSERT INTO `pre_chapter` VALUES ('173', '1566810170', '河南省开封市龙亭区人民法院 马中            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/cefmnrwxDIJNQUWY1678.json', '6');
INSERT INTO `pre_chapter` VALUES ('174', '1566810171', '李错：读懂法院的第一本书            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/lmprCDEGHIJLMSXY0256.json', '6');
INSERT INTO `pre_chapter` VALUES ('175', '1566810171', '法制日报 田水泉：洒在法庭上的阳...            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/aegjlnprtxCDQSUV1234.json', '6');
INSERT INTO `pre_chapter` VALUES ('176', '1566810171', '常州 普法资讯         ', '/book/20190826/flnsvwxyFHMQTWZ01347.json', '6');
INSERT INTO `pre_chapter` VALUES ('177', '1566810172', '最高人民法院  钱静华            <span style=\"color:red\">[vip]</span>         ', '/book/20190826/ginrvxzBLNOPRSUWYZ24.json', '6');
INSERT INTO `pre_chapter` VALUES ('178', '1566810172', '江苏省南通市港闸区人民法院  张...         ', '/book/20190826/abdhimnpvwyBFIU04578.json', '6');
INSERT INTO `pre_chapter` VALUES ('179', '1566834452', '第1章 退役、迷茫         ', '/book/20190826/aehklnpqvwxzFIKNS237.json', '10');
INSERT INTO `pre_chapter` VALUES ('180', '1566834452', '第2章 不好，老板跑了         ', '/book/20190826/befhkptvBFGHIKLPU368.json', '10');
INSERT INTO `pre_chapter` VALUES ('181', '1566834453', '第3章 逐客令         ', '/book/20190826/abcfhmqruzHMSVWX2589.json', '10');
INSERT INTO `pre_chapter` VALUES ('182', '1566834453', '第4章 人心         ', '/book/20190826/aejklnorstvACDFPXZ15.json', '10');
INSERT INTO `pre_chapter` VALUES ('183', '1566834453', '第5章 当兵的都是土匪？         ', '/book/20190826/bcghjuzBCFKQRVWXY146.json', '10');
INSERT INTO `pre_chapter` VALUES ('184', '1566834453', '第6章 海城         ', '/book/20190826/bkouvwBFGKLRSUV24589.json', '10');
INSERT INTO `pre_chapter` VALUES ('185', '1566834453', '第7章 废物         ', '/book/20190826/ehpqrstzACEHMQUV0169.json', '10');
INSERT INTO `pre_chapter` VALUES ('186', '1566834454', '第8章 这男人腿抽筋         ', '/book/20190826/eghinrsyzEFOPQTVW124.json', '10');
INSERT INTO `pre_chapter` VALUES ('187', '1566834454', '第9章 我是蓝珂         ', '/book/20190826/gjlmrswxEHIOSVWY0347.json', '10');
INSERT INTO `pre_chapter` VALUES ('188', '1566834454', '第10章 抓劫匪，新套路         ', '/book/20190826/hijprtuADHMNOSTXZ579.json', '10');
INSERT INTO `pre_chapter` VALUES ('189', '1566834455', '第11章 记下你了         ', '/book/20190826/ehjnosuBCDGIKOUXY567.json', '10');
INSERT INTO `pre_chapter` VALUES ('190', '1566834455', '第12章 想拉仇恨？         ', '/book/20190826/agjknrCDFGIJLRSUWX69.json', '10');
INSERT INTO `pre_chapter` VALUES ('191', '1566834455', '第13章 美式咖啡         ', '/book/20190826/dgjrswABGIJLMUWY1568.json', '10');
INSERT INTO `pre_chapter` VALUES ('192', '1566834455', '第14章 对峙         ', '/book/20190826/hinptuxzADINOQUVZ789.json', '10');
INSERT INTO `pre_chapter` VALUES ('193', '1566834455', '第15章 师姐来了         ', '/book/20190826/aefhjmopqruyCDKST148.json', '10');
INSERT INTO `pre_chapter` VALUES ('194', '1566834455', '第16章 较真的男人         ', '/book/20190826/aefgjsACFMNSXYZ14579.json', '10');
INSERT INTO `pre_chapter` VALUES ('195', '1566834456', '第17章 讨债         ', '/book/20190826/aeglpsCJMPQRSUVX0467.json', '10');
INSERT INTO `pre_chapter` VALUES ('196', '1566834456', '第18章 倔驴         ', '/book/20190826/adfkpwyADHMPSTUYZ049.json', '10');
INSERT INTO `pre_chapter` VALUES ('197', '1566834456', '第19章 挫折         ', '/book/20190826/abcdghijlmsvACHNR234.json', '10');
INSERT INTO `pre_chapter` VALUES ('198', '1566834456', '第20章 汇报         ', '/book/20190826/acdtuBCDFHJOPUVW1568.json', '10');
INSERT INTO `pre_chapter` VALUES ('199', '1566834456', '第21章 不是他告的密？         ', '/book/20190826/ijknqstGILOQRVWY0357.json', '10');
INSERT INTO `pre_chapter` VALUES ('200', '1566834456', '第22章 设计部的火麒麟         ', '/book/20190826/cgijmouxEJLRSTWY1279.json', '10');
INSERT INTO `pre_chapter` VALUES ('201', '1566834457', '第23章 火麒麟被新来的给教训了         ', '/book/20190826/aekmnorsvyzBHRWXY057.json', '10');
INSERT INTO `pre_chapter` VALUES ('202', '1566834457', '第24章 他，也不那么讨厌吧         ', '/book/20190826/abmnpsvKMNQRTUXYZ267.json', '10');
INSERT INTO `pre_chapter` VALUES ('203', '1566834457', '第25章 遇知音         ', '/book/20190826/aefhklmuxEFHIRXY0235.json', '10');
INSERT INTO `pre_chapter` VALUES ('204', '1566834457', '第26章 八卦这东西，会憋死人的         ', '/book/20190826/bhjklrADEGJLPVX23678.json', '10');
INSERT INTO `pre_chapter` VALUES ('205', '1566834457', '第27章 落井下石         ', '/book/20190826/jkrvyzCGKLRSUWYZ4679.json', '10');
INSERT INTO `pre_chapter` VALUES ('206', '1566834458', '第28章 绿茶婊？！         ', '/book/20190826/fgijknotuxyDIKNW0148.json', '10');
INSERT INTO `pre_chapter` VALUES ('207', '1566834458', '第29章 有人的地方，就有江湖         ', '/book/20190826/ahklostxDFGHKLOVXZ14.json', '10');
INSERT INTO `pre_chapter` VALUES ('208', '1566834458', '第30章 藏龙卧虎的餐厅         ', '/book/20190826/dgilsvzAEMRSVWYZ1249.json', '10');
INSERT INTO `pre_chapter` VALUES ('209', '1566834459', '第31章 警察，我没做坏事         ', '/book/20190826/cfjotvFGHJOTVWX02678.json', '10');
INSERT INTO `pre_chapter` VALUES ('210', '1566834459', '第32章 他们都是退役军人         ', '/book/20190826/cefhloqvyCDILPRV0289.json', '10');
INSERT INTO `pre_chapter` VALUES ('211', '1566834459', '第33章 太巧，太有缘         ', '/book/20190826/acfnsBEGHLMOPQVWZ237.json', '10');
INSERT INTO `pre_chapter` VALUES ('212', '1566834459', '第34章 女中豪杰         ', '/book/20190826/acdhklmqxCGIKLQWZ237.json', '10');
INSERT INTO `pre_chapter` VALUES ('213', '1566834459', '第35章 贼尴尬         ', '/book/20190826/bhltuvABCGKNSTUVX456.json', '10');
INSERT INTO `pre_chapter` VALUES ('214', '1566834460', '第36章 想和你一起进步         ', '/book/20190826/achjkmorsvxBEFKRTWY7.json', '10');
INSERT INTO `pre_chapter` VALUES ('215', '1566834460', '第37章 送上门的客户         ', '/book/20190826/aceghjlmqrEMOPRSU146.json', '10');
INSERT INTO `pre_chapter` VALUES ('216', '1566834460', '第38章 暗潮汹涌         ', '/book/20190826/adhjlmorwzCGNQRWXY35.json', '10');
INSERT INTO `pre_chapter` VALUES ('217', '1566834460', '第39章 想让你一起参加家宴         ', '/book/20190826/cghptvzABCEFKMOY1346.json', '10');
INSERT INTO `pre_chapter` VALUES ('218', '1566834460', '第40章 亚洲车行的事故         ', '/book/20190826/efnoyzCDEHMRTUYZ1678.json', '10');
INSERT INTO `pre_chapter` VALUES ('219', '1566834460', '第41章 救人         ', '/book/20190826/dehiklyABCKMQTX12369.json', '10');
INSERT INTO `pre_chapter` VALUES ('220', '1566834461', '第42章 你高兴就好         ', '/book/20190826/bfhjstwxyEIJLPRSW569.json', '10');
INSERT INTO `pre_chapter` VALUES ('221', '1566834461', '第43章 又是小两口啊         ', '/book/20190826/acdemnpsvxIJLQRSU056.json', '10');
INSERT INTO `pre_chapter` VALUES ('222', '1566834461', '第44章 借花献佛         ', '/book/20190826/cehjmuwADIJQRUX04679.json', '10');
INSERT INTO `pre_chapter` VALUES ('223', '1566834461', '第45章 总公司来人         ', '/book/20190826/ceijqsuxFHJUVX012789.json', '10');
INSERT INTO `pre_chapter` VALUES ('224', '1566834461', '第46章 专门来陪你         ', '/book/20190826/eglrtuvzCDEGIKMOX039.json', '10');
INSERT INTO `pre_chapter` VALUES ('225', '1566834462', '第47章 喝多了的乔奕笙，真好欺         ', '/book/20190826/efhilmpwxFHJKMQT1256.json', '10');
INSERT INTO `pre_chapter` VALUES ('226', '1566834462', '第48章 特色餐厅的特色         ', '/book/20190826/cehntuvzABEGKLQRU168.json', '10');
INSERT INTO `pre_chapter` VALUES ('227', '1566835827', '第一章 游戏开发系统', '/book/20190827/gjmowxBEFGHJKSTY0126.json', '11');
INSERT INTO `pre_chapter` VALUES ('228', '1566835827', '第二章 源石融合深度10', '/book/20190827/adefjqtvzABCEFHNX069.json', '11');
INSERT INTO `pre_chapter` VALUES ('229', '1566835827', '第三章 一星建筑农田', '/book/20190827/dhlopryEFGLMNTY45679.json', '11');
INSERT INTO `pre_chapter` VALUES ('230', '1566835827', '第四章 长满面包的田野', '/book/20190827/fgjkmotzBCKLOPQUY267.json', '11');
INSERT INTO `pre_chapter` VALUES ('231', '1566835827', '第五章 新的任务', '/book/20190827/ghklpswABDGHJOQSZ345.json', '11');
INSERT INTO `pre_chapter` VALUES ('232', '1566835827', '第六章 劳动合同', '/book/20190827/absvwxyEKMOQRSWXY267.json', '11');
INSERT INTO `pre_chapter` VALUES ('233', '1566835827', '第七章 开发等级提升', '/book/20190827/fgkmtuwBCOSUVXZ02345.json', '11');
INSERT INTO `pre_chapter` VALUES ('234', '1566835827', '第八章 防御塔', '/book/20190827/cekmntuvAFGIJNRVW378.json', '11');
INSERT INTO `pre_chapter` VALUES ('235', '1566835827', '第九章 地藏', '/book/20190827/cdfgnsvHILOPUWX13489.json', '11');
INSERT INTO `pre_chapter` VALUES ('236', '1566835827', '第十章 清理', '/book/20190827/bdkmqtxyzAHMNPRTW389.json', '11');
INSERT INTO `pre_chapter` VALUES ('237', '1566835827', '第十二章 新手村村长', '/book/20190827/cdegnopxBCKNPSTUX356.json', '11');
INSERT INTO `pre_chapter` VALUES ('238', '1566835827', '第十三章 选择', '/book/20190827/hjrsuxABLMOQRSXY1378.json', '11');
INSERT INTO `pre_chapter` VALUES ('239', '1566835827', '第十四章 原理图', '/book/20190827/hilmnotuvzBGIMSYZ238.json', '11');
INSERT INTO `pre_chapter` VALUES ('240', '1566835827', '第十五章 拜师', '/book/20190827/agjnostuwEFIPQSTVX56.json', '11');
INSERT INTO `pre_chapter` VALUES ('241', '1566835827', '第十六章 副本任务', '/book/20190827/bfgikoqrsvwyILOSUX26.json', '11');
INSERT INTO `pre_chapter` VALUES ('242', '1566835827', '第十七章 出发', '/book/20190827/bfgknpzDEFOPQR124569.json', '11');
INSERT INTO `pre_chapter` VALUES ('243', '1566835827', '第十八章 黑暗矿山', '/book/20190827/bghknopqtuvEGIMOX068.json', '11');
INSERT INTO `pre_chapter` VALUES ('244', '1566835827', '第十九章 青萝果', '/book/20190827/afhiklouyABEFGHIPSX5.json', '11');
INSERT INTO `pre_chapter` VALUES ('245', '1566835827', '第二十章 食火之兽', '/book/20190827/agjklmnoqryABMOSZ789.json', '11');
INSERT INTO `pre_chapter` VALUES ('246', '1566835827', '第二十一章 还能抢救', '/book/20190827/emnpsBCDGHIJLMPRW047.json', '11');
INSERT INTO `pre_chapter` VALUES ('247', '1566835827', '第二十二章 选择死法', '/book/20190827/bcfnopvBCEHLMOUVW068.json', '11');
INSERT INTO `pre_chapter` VALUES ('248', '1566835827', '第二十三章 复活', '/book/20190827/inopqrvwyGHJMSTUVW19.json', '11');
INSERT INTO `pre_chapter` VALUES ('249', '1566835827', '第二十四章 愤怒的祸斗', '/book/20190827/cklrtzBGJNQRSTUV2569.json', '11');
INSERT INTO `pre_chapter` VALUES ('250', '1566835827', '第二十五章 谈条件', '/book/20190827/cfglpsuwxBDEGJNQR126.json', '11');
INSERT INTO `pre_chapter` VALUES ('251', '1566835827', '第二十六章 臣服', '/book/20190827/hinruvwzBCFGJOW01247.json', '11');
INSERT INTO `pre_chapter` VALUES ('252', '1566835827', '第二十七章 应该不算过分', '/book/20190827/bcdfnpvwHIJKMOQUWY27.json', '11');
INSERT INTO `pre_chapter` VALUES ('253', '1566835827', '第二十八章 青铜级职业者小队', '/book/20190827/adeprsyAEFMRSUV12478.json', '11');
INSERT INTO `pre_chapter` VALUES ('254', '1566835827', '第二十九章 吃顿好的', '/book/20190827/bhjkmrwxzBHKPSTUX014.json', '11');
INSERT INTO `pre_chapter` VALUES ('255', '1566835827', '第三十章 训练场', '/book/20190827/mnoqsvyDILORSUVX5678.json', '11');
INSERT INTO `pre_chapter` VALUES ('256', '1566835827', '第三十一章 冰枪术', '/book/20190827/adgiklpqvxBEGMOPQVX9.json', '11');
INSERT INTO `pre_chapter` VALUES ('257', '1566835827', '第三十二章 雪芙的手艺', '/book/20190827/ehkmsuvxyDIMSUWY0189.json', '11');
INSERT INTO `pre_chapter` VALUES ('258', '1566835827', '第三十三章 宣布', '/book/20190827/behiklpszABEHJUWX348.json', '11');
INSERT INTO `pre_chapter` VALUES ('259', '1566835827', '第三十四章 幸福的烦恼', '/book/20190827/acefvxyzEFKNSVWZ4569.json', '11');
INSERT INTO `pre_chapter` VALUES ('260', '1566835827', '第三十五章 期待', '/book/20190827/aegknoprwzAIRSTU2358.json', '11');
INSERT INTO `pre_chapter` VALUES ('261', '1566835827', '第三十六章 雪狼小队', '/book/20190827/amtxABEJNQRUVWXZ0249.json', '11');
INSERT INTO `pre_chapter` VALUES ('262', '1566835827', '第三十七章 战前准备', '/book/20190827/acefgnrvwBCEGKOPSYZ2.json', '11');
INSERT INTO `pre_chapter` VALUES ('263', '1566835827', '第三十八章 训练结束', '/book/20190827/bcdeghknwABEIKMST145.json', '11');
INSERT INTO `pre_chapter` VALUES ('264', '1566835827', '第三十九章 敌人袭来', '/book/20190827/cdefjmortyCHOPQSVZ04.json', '11');
INSERT INTO `pre_chapter` VALUES ('265', '1566835828', '第四十章 雷蛇', '/book/20190827/fltzBHIKOQSUWX012689.json', '11');
INSERT INTO `pre_chapter` VALUES ('266', '1566835828', '第四十一章 莫德的计划', '/book/20190827/lrsxBFHIJLNSTY134789.json', '11');
INSERT INTO `pre_chapter` VALUES ('267', '1566835828', '第四十二章 战斗开始', '/book/20190827/dehilmorAJLNORSVZ023.json', '11');
INSERT INTO `pre_chapter` VALUES ('268', '1566835828', '第四十三章 埋伏', '/book/20190827/efhijlmoyzEOPTV12348.json', '11');
INSERT INTO `pre_chapter` VALUES ('269', '1566835828', '第四十四章 兰瑟重伤', '/book/20190827/cijkmopstxAGINOSUXY3.json', '11');
INSERT INTO `pre_chapter` VALUES ('270', '1566835828', '第四十五章 莫德出手', '/book/20190827/bdhjlqrsxBDHLMOUW148.json', '11');
INSERT INTO `pre_chapter` VALUES ('271', '1566835828', '第四十六章 冒充', '/book/20190827/efghlmoqsvyzCFJKR258.json', '11');
INSERT INTO `pre_chapter` VALUES ('272', '1566835828', '第四十七章 收割之时', '/book/20190827/delmnqsuvxzDILOR0468.json', '11');
INSERT INTO `pre_chapter` VALUES ('273', '1566835828', '第四十八章 任务完成', '/book/20190827/abglqtuxAELNOPSTY017.json', '11');
INSERT INTO `pre_chapter` VALUES ('274', '1566835828', '第四十九章 一星围墙', '/book/20190827/acehrBGIKMNPQX135679.json', '11');
INSERT INTO `pre_chapter` VALUES ('275', '1566835828', '第五十章 能源中心', '/book/20190827/adhmsxyFHJLMOQSU3479.json', '11');
INSERT INTO `pre_chapter` VALUES ('276', '1566835828', '第五十一章 进攻雪狼村', '/book/20190827/ajklruBJKLMPQRUWYZ58.json', '11');
INSERT INTO `pre_chapter` VALUES ('277', '1566835828', '第五十二章 雪狼女王', '/book/20190827/epqrsuyzBCFGIKQRXY46.json', '11');
INSERT INTO `pre_chapter` VALUES ('278', '1566835828', '第五十三章 博弈', '/book/20190827/bhkpqtADHIJKNSTUVW68.json', '11');
INSERT INTO `pre_chapter` VALUES ('279', '1566835828', '第五十四章 将这个签了', '/book/20190827/cjlmnortwGJKLPQRS237.json', '11');
INSERT INTO `pre_chapter` VALUES ('280', '1566835828', '第五十五章 参观', '/book/20190827/aenoqwxAEIKORSTWZ245.json', '11');
INSERT INTO `pre_chapter` VALUES ('281', '1566835828', '第五十六章 贝拉的请求', '/book/20190827/cehjlntuCEFGKMNPSX59.json', '11');
INSERT INTO `pre_chapter` VALUES ('282', '1566835828', '第五十七章 前文明遗产', '/book/20190827/abegnwyAGHIJMNQSTU47.json', '11');
INSERT INTO `pre_chapter` VALUES ('283', '1566835828', '第五十八章 启动运输车', '/book/20190827/adegmtuvyAHKLNVWZ127.json', '11');
INSERT INTO `pre_chapter` VALUES ('284', '1566835828', '第五十九章 一本万利的买卖', '/book/20190827/ghiklquxyEFGHOQSVZ16.json', '11');
INSERT INTO `pre_chapter` VALUES ('285', '1566835828', '第六十章 回返', '/book/20190827/ghnstuDEIPSUVWYZ1378.json', '11');
INSERT INTO `pre_chapter` VALUES ('286', '1566835828', '第六十一章 惊讶的贝拉', '/book/20190827/cdhkltyACLPRUVY02379.json', '11');
INSERT INTO `pre_chapter` VALUES ('287', '1566835828', '第六十二章 摧毁心灵', '/book/20190827/aejmvwxBDFHIJKORVY25.json', '11');
INSERT INTO `pre_chapter` VALUES ('288', '1566835828', '第六十三章 未来的规划', '/book/20190827/bclnwABCDGIJPVXZ2467.json', '11');
INSERT INTO `pre_chapter` VALUES ('289', '1566835828', '第六十四章 房屋修复', '/book/20190827/chkquwxACFJOQRSVZ123.json', '11');
INSERT INTO `pre_chapter` VALUES ('290', '1566835828', '第六十五章 不要乱想', '/book/20190827/aijmqsvzDEFIQRSWZ567.json', '11');
INSERT INTO `pre_chapter` VALUES ('291', '1566835828', '第六十六章 改良版雷蛇狙击枪', '/book/20190827/aklnosuxCEOPQRUZ1378.json', '11');
INSERT INTO `pre_chapter` VALUES ('292', '1566835828', '第六十七章 训练成果', '/book/20190827/nostACFIJKLMSWXZ2689.json', '11');
INSERT INTO `pre_chapter` VALUES ('293', '1566835828', '第六十八章 吃饱了好上路', '/book/20190827/bjkqvzBCDHKLNRUVXZ18.json', '11');
INSERT INTO `pre_chapter` VALUES ('294', '1566835828', '第六十九章 白帝城', '/book/20190827/ahjnoquyABEIJVXZ0247.json', '11');
INSERT INTO `pre_chapter` VALUES ('295', '1566835828', '第七十章 白帝城下属四大村落', '/book/20190827/cgilmtwyACDFINPUV146.json', '11');
INSERT INTO `pre_chapter` VALUES ('296', '1566835828', '第七十一章 莫德的计划', '/book/20190827/cdegnorsuwzJQSUY3478.json', '11');
INSERT INTO `pre_chapter` VALUES ('297', '1566835828', '第七十二章 进城', '/book/20190827/goprtuvyCEHIQVYZ1234.json', '11');
INSERT INTO `pre_chapter` VALUES ('298', '1566835828', '第七十三章 职业者工会', '/book/20190827/bcgjrsuvxFGIJLMUVY68.json', '11');
INSERT INTO `pre_chapter` VALUES ('299', '1566835828', '第七十四章 轩然大波', '/book/20190827/befjknuvwxABFHOSTV39.json', '11');
INSERT INTO `pre_chapter` VALUES ('300', '1566835828', '第七十五章 只要赏金', '/book/20190827/adqrswyzABKLNOQUVXZ9.json', '11');
INSERT INTO `pre_chapter` VALUES ('301', '1566835828', '第七十六章 职业者工会会长', '/book/20190827/adeipBCDEGHLMPQUW057.json', '11');
INSERT INTO `pre_chapter` VALUES ('302', '1566835828', '第七十七章 白帝城城主与枭', '/book/20190827/flnrsvwyBHLMPRST1379.json', '11');
INSERT INTO `pre_chapter` VALUES ('303', '1566835828', '第七十八章 多事之秋', '/book/20190827/dhlmqswzBDEFMPRWX078.json', '11');
INSERT INTO `pre_chapter` VALUES ('304', '1566835828', '第七十九章 来自落日的邀请', '/book/20190827/cdlmqruzABCEFOQSU457.json', '11');
INSERT INTO `pre_chapter` VALUES ('305', '1566835828', '第八十章 黄金果园旅馆', '/book/20190827/cdglmprAHKMOQTVXZ248.json', '11');
INSERT INTO `pre_chapter` VALUES ('306', '1566835828', '第八十一章 艾琳', '/book/20190827/bhikoruwABHILMNSY126.json', '11');
INSERT INTO `pre_chapter` VALUES ('307', '1566835828', '第八十二章 窃听', '/book/20190827/cdgnoqtCEHIJPRZ23689.json', '11');
INSERT INTO `pre_chapter` VALUES ('308', '1566835828', '第八十三章 妮可氏族', '/book/20190827/fmvxBFIJKOQTWXZ12458.json', '11');
INSERT INTO `pre_chapter` VALUES ('309', '1566835828', '第八十四章 借口', '/book/20190827/psvwxyzBEHIKPSWXY126.json', '11');
INSERT INTO `pre_chapter` VALUES ('310', '1566835828', '第八十五章 两条信息', '/book/20190827/cdfghimprsvyzDFGOT56.json', '11');
INSERT INTO `pre_chapter` VALUES ('311', '1566835828', '第八十六章 探索矿洞遗迹', '/book/20190827/eflnoptuzANRTZ012347.json', '11');
INSERT INTO `pre_chapter` VALUES ('312', '1566835828', '第八十七章 昆图库塔', '/book/20190827/cefghiluvHLQTUWX0467.json', '11');
INSERT INTO `pre_chapter` VALUES ('313', '1566835828', '第八十八章 一艘飞船', '/book/20190827/eghkqtuvwDILNOPR1459.json', '11');
INSERT INTO `pre_chapter` VALUES ('314', '1566835828', '第八十九章 回返村落', '/book/20190827/abcgmsuwxzEGWXYZ0468.json', '11');
INSERT INTO `pre_chapter` VALUES ('315', '1566835828', '第九十章 建造开始', '/book/20190827/bghmtzDEFGJOPSWXZ367.json', '11');
INSERT INTO `pre_chapter` VALUES ('316', '1566835828', '第九十一章 收集源石', '/book/20190827/aceklmnostuzGKQUX024.json', '11');
INSERT INTO `pre_chapter` VALUES ('317', '1566835828', '第九十二章 代理村长', '/book/20190827/abcfimosvEGINQTY2367.json', '11');
INSERT INTO `pre_chapter` VALUES ('318', '1566835828', '第九十三章 银涟村的动向', '/book/20190827/dgijlorsuvzBEOSX3568.json', '11');
INSERT INTO `pre_chapter` VALUES ('319', '1566835828', '第九十四章 红莲弓矢', '/book/20190827/afgkuzADEGIKLOXYZ067.json', '11');
INSERT INTO `pre_chapter` VALUES ('320', '1566835828', '第九十五章 再进训练场', '/book/20190827/abdeghoxIJKOQRSVYZ78.json', '11');
INSERT INTO `pre_chapter` VALUES ('321', '1566835828', '第九十六章 奥术师', '/book/20190827/iklmsuxABGHIJRST1237.json', '11');
INSERT INTO `pre_chapter` VALUES ('322', '1566835828', '第九十七章 二星训练场', '/book/20190827/afghinpuvzBCIMWXZ024.json', '11');
INSERT INTO `pre_chapter` VALUES ('323', '1566835828', '第九十八章 二星围墙', '/book/20190827/bilsvwBDEGHKLORY3479.json', '11');
INSERT INTO `pre_chapter` VALUES ('324', '1566835828', '第九十九章 新手镇', '/book/20190827/cdhlmtuvzEFGIJLNQVX1.json', '11');
INSERT INTO `pre_chapter` VALUES ('325', '1566835828', '第一百章 召唤术', '/book/20190827/afghknorAEGIKLRY1246.json', '11');
INSERT INTO `pre_chapter` VALUES ('326', '1566835828', '第一百零一章 深夜密谈', '/book/20190827/bdkorstuvAEGHNOQXY79.json', '11');
INSERT INTO `pre_chapter` VALUES ('327', '1566835828', '第一百零二章 再去白帝城', '/book/20190827/ahknprstuvzBCKNUW157.json', '11');
INSERT INTO `pre_chapter` VALUES ('328', '1566835828', '第一百零三章 桔梗的情报', '/book/20190827/bcdkmnrxyDEJLPRTVZ68.json', '11');
INSERT INTO `pre_chapter` VALUES ('329', '1566835828', '第一百零四章 重逢', '/book/20190827/ghinrxyzAEKMVXYZ0456.json', '11');
INSERT INTO `pre_chapter` VALUES ('330', '1566836190', '楔子', '/book/20190827/bgijprEFGIJLPQVYZ378.json', '1');
INSERT INTO `pre_chapter` VALUES ('331', '1566836190', '第一章 荒野长廊', '/book/20190827/bcgnqtBEKMOPQTWX1236.json', '1');
INSERT INTO `pre_chapter` VALUES ('332', '1566836190', '第二章 朱雀族', '/book/20190827/cdjosvwyEJKMNQSTUZ28.json', '1');
INSERT INTO `pre_chapter` VALUES ('333', '1566836191', '第三章 归国人', '/book/20190827/defijknpqstuvyCJY138.json', '1');
INSERT INTO `pre_chapter` VALUES ('334', '1566836191', '第四章  纵与横', '/book/20190827/cdfjlsxAEIKOPQRXZ018.json', '1');
INSERT INTO `pre_chapter` VALUES ('335', '1566836191', '第五章 青山', '/book/20190827/cdfgimnpsAEGJLMOUX04.json', '1');
INSERT INTO `pre_chapter` VALUES ('336', '1566836192', '第六章 百年旧事 上', '/book/20190827/binpqtuyBHIJMOQ01356.json', '1');
INSERT INTO `pre_chapter` VALUES ('337', '1566836192', '第七章  百年旧事 下', '/book/20190827/hklnrxyAEGORTUX12578.json', '1');
INSERT INTO `pre_chapter` VALUES ('338', '1566836192', '第八章 胡不与', '/book/20190827/chsvyzBELMNORSW45678.json', '1');
INSERT INTO `pre_chapter` VALUES ('339', '1566836192', '第九章 汲灵之阵', '/book/20190827/fsuvBDFKMOPSTXY01359.json', '1');
INSERT INTO `pre_chapter` VALUES ('340', '1566836193', '第十章 归魂日', '/book/20190827/chjmnqwDFGMPTUW24579.json', '1');
INSERT INTO `pre_chapter` VALUES ('341', '1566836193', '第十一章 原来是故人', '/book/20190827/cdgkoryBHKLPXYZ01569.json', '1');
INSERT INTO `pre_chapter` VALUES ('342', '1566836193', '第十二章  惊变！', '/book/20190827/cfijlquzBCDKPQVXY136.json', '1');
INSERT INTO `pre_chapter` VALUES ('343', '1566836193', '第十三章 乱象', '/book/20190827/adhjmsvwABGHOQSUZ017.json', '1');
INSERT INTO `pre_chapter` VALUES ('344', '1566836194', '第十四章 天涯之隔', '/book/20190827/befhjmnrstuGRVW01269.json', '1');
INSERT INTO `pre_chapter` VALUES ('345', '1566836194', '十五章 何处是归途', '/book/20190827/cegoprtxyILMPTUWY459.json', '1');
INSERT INTO `pre_chapter` VALUES ('346', '1566836194', '第十六章 永恒之塔 上', '/book/20190827/dfiqtvyzBCFJNOUVWXZ3.json', '1');
INSERT INTO `pre_chapter` VALUES ('347', '1566836195', '第十七章 永恒之塔下', '/book/20190827/bdegloqstuyzDHJMY012.json', '1');
INSERT INTO `pre_chapter` VALUES ('348', '1566836195', '第十八章  神秘黑衣人', '/book/20190827/lprstvyCEFMNQRTVWY19.json', '1');
INSERT INTO `pre_chapter` VALUES ('349', '1566836195', '第十九章 困兽之斗', '/book/20190827/dhjlqruyCDFGLQRTVX59.json', '1');
INSERT INTO `pre_chapter` VALUES ('350', '1566836195', '第二十章  伤逝', '/book/20190827/bfilrtuzABCDIJMQVW27.json', '1');
INSERT INTO `pre_chapter` VALUES ('351', '1566836196', '第二十一章 不眠之夜 上', '/book/20190827/dhlnoqruxABEJMSVW079.json', '1');
INSERT INTO `pre_chapter` VALUES ('352', '1566836196', '番外  七幽殿', '/book/20190827/cejlmnoprBCEHILRU068.json', '1');
INSERT INTO `pre_chapter` VALUES ('353', '1566836196', '第二十二章  难眠之夜 下', '/book/20190827/bcdejlrACKMOSY023468.json', '1');
INSERT INTO `pre_chapter` VALUES ('354', '1566836196', '第二十三章  希望', '/book/20190827/chopqrstvwBDFGIOZ026.json', '1');
INSERT INTO `pre_chapter` VALUES ('355', '1566836376', '第一章 开篇划重点', '/book/20190827/degnpqswxBCDMQSUY568.json', '2');
INSERT INTO `pre_chapter` VALUES ('356', '1566836376', '第二章 我为你刷酱', '/book/20190827/cdefhikoBCEHMUVW0349.json', '2');
INSERT INTO `pre_chapter` VALUES ('357', '1566836376', '第三章 来自马儿的诚恳意见', '/book/20190827/adfjkqsuxBIJQRXZ0578.json', '2');
INSERT INTO `pre_chapter` VALUES ('358', '1566836376', '第四章 规划乞丐生涯', '/book/20190827/adlmopvzBCDHKNOQY157.json', '2');
INSERT INTO `pre_chapter` VALUES ('359', '1566836377', '第五章 天下没有不散的宴席', '/book/20190827/bmuvwADEFIKSTW012368.json', '2');
INSERT INTO `pre_chapter` VALUES ('360', '1566836377', '第六章 胸口碎大石', '/book/20190827/aijkpsvwDKLRSTXY1458.json', '2');
INSERT INTO `pre_chapter` VALUES ('361', '1566836377', '第七章 乞丐还是贼', '/book/20190827/chijlmostKPQUVXY1458.json', '2');
INSERT INTO `pre_chapter` VALUES ('362', '1566836377', '第八章 培养贼的气质', '/book/20190827/cefgimyzDIJLMTUVWX69.json', '2');
INSERT INTO `pre_chapter` VALUES ('363', '1566836378', '第九章 尴尬的救赎', '/book/20190827/bcfghjopyBCHJQTX1578.json', '2');
INSERT INTO `pre_chapter` VALUES ('364', '1566836378', '第十章 我是你的人', '/book/20190827/acejklmwADGJKMNPUY04.json', '2');
INSERT INTO `pre_chapter` VALUES ('365', '1566836378', '第十一章 美丽的误会', '/book/20190827/bfgnpruDEHMNOSTVWZ17.json', '2');
INSERT INTO `pre_chapter` VALUES ('366', '1566836378', '第十二章 羞涩的幻想', '/book/20190827/cefhquwzGHIMNPVY0358.json', '2');
INSERT INTO `pre_chapter` VALUES ('367', '1566836379', '第十三章 消极就是坚定', '/book/20190827/chnrvBIJOQRTVWX14678.json', '2');
INSERT INTO `pre_chapter` VALUES ('368', '1566837378', '<em class=\"iconfont\">&#xe612;</em>全部分类', '/book/20190827/bdnuwzABDGKLNOPUVZ58.json', '5');
INSERT INTO `pre_chapter` VALUES ('369', '1566837378', '<em class=\"iconfont\">&#xe630;</em>现代言情', '/book/20190827/beghklmnopDFJMVWZ145.json', '5');
INSERT INTO `pre_chapter` VALUES ('370', '1566837378', '<em class=\"iconfont\">&#xe632;</em>古代言情', '/book/20190827/hiknpqszACEGORVW0125.json', '5');
INSERT INTO `pre_chapter` VALUES ('371', '1566837378', '<em class=\"iconfont\">&#xe631;</em>浪漫青春', '/book/20190827/adfkmstuvBEIJNTXY078.json', '5');
INSERT INTO `pre_chapter` VALUES ('372', '1566837378', '<em class=\"iconfont\">&#xe637;</em>玄幻言情', '/book/20190827/aclmrtuABFGMRSUX0458.json', '5');
INSERT INTO `pre_chapter` VALUES ('373', '1566837378', '<em class=\"iconfont\">&#xe62e;</em>仙侠奇缘', '/book/20190827/degkmnptyGHILU235679.json', '5');
INSERT INTO `pre_chapter` VALUES ('374', '1566837378', '<em class=\"iconfont\">&#xe634;</em>悬疑', '/book/20190827/gklqvwxyABHMOUVW0136.json', '5');
INSERT INTO `pre_chapter` VALUES ('375', '1566837378', '<em class=\"iconfont\">&#xe62d;</em>科幻空间', '/book/20190827/cmopuxyCEFIJOPTWYZ12.json', '5');
INSERT INTO `pre_chapter` VALUES ('376', '1566837378', '<em class=\"iconfont\">&#xe638;</em>游戏竞技', '/book/20190827/hjoptwzBFKLMNPQSUV35.json', '5');
INSERT INTO `pre_chapter` VALUES ('377', '1566837378', '<em class=\"iconfont\">&#xe63b;</em>短篇小说', '/book/20190827/ahjlqvwyBDFHJNOPRU78.json', '5');
INSERT INTO `pre_chapter` VALUES ('378', '1566837378', '<em class=\"iconfont\">&#xe904;</em><i>轻小说</i>', '/book/20190827/cfilostwGJLNPRTY0569.json', '5');
INSERT INTO `pre_chapter` VALUES ('379', '1566837378', '排行榜', '/book/20190827/adefijloqACHIJKMSWZ3.json', '5');
INSERT INTO `pre_chapter` VALUES ('380', '1566837378', '免费', '/book/20190827/befkmopqtwJLMRT12467.json', '5');
INSERT INTO `pre_chapter` VALUES ('381', '1566837378', '完本', '/book/20190827/behmnpstuvyHNPRSVY79.json', '5');
INSERT INTO `pre_chapter` VALUES ('382', '1566837378', '古代言情', '/book/20190827/acgloqrCGKLPSTUV0127.json', '5');
INSERT INTO `pre_chapter` VALUES ('383', '1566837378', '现代言情', '/book/20190827/adenowxACDFGJKSUY279.json', '5');
INSERT INTO `pre_chapter` VALUES ('384', '1566837378', '玄幻仙侠', '/book/20190827/abfklmnqvwxCENOPWY18.json', '5');
INSERT INTO `pre_chapter` VALUES ('385', '1566837378', '悬疑科幻', '/book/20190827/gijrtzCFGJLOPQSTUY36.json', '5');
INSERT INTO `pre_chapter` VALUES ('386', '1566837378', '青春游戏', '/book/20190827/noryBFGHKLNPQRSV3468.json', '5');

-- ----------------------------
-- Table structure for pre_website
-- ----------------------------
DROP TABLE IF EXISTS `pre_website`;
CREATE TABLE `pre_website` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '节点标题',
  `code` varchar(255) DEFAULT NULL COMMENT '节点的程序文件路径',
  `register_time` int(11) DEFAULT NULL COMMENT '执行时间点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='采集网站的节点表';

-- ----------------------------
-- Records of pre_website
-- ----------------------------
INSERT INTO `pre_website` VALUES ('1', '从横', './url/url1.php', '-28800');
INSERT INTO `pre_website` VALUES ('2', '黑岩', './url/url2.php', null);
INSERT INTO `pre_website` VALUES ('3', '逐浪', './url/url3.php', null);
INSERT INTO `pre_website` VALUES ('4', '起点', './url/url4.php', '1564588800');
INSERT INTO `pre_website` VALUES ('5', '言情小说吧', './url/url4.php', '1551715200');
