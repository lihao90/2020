/*
 Navicat Premium Data Transfer

 Source Server         : h1902
 Source Server Type    : MySQL
 Source Server Version : 50547
 Source Host           : localhost:3306
 Source Schema         : foodapp

 Target Server Type    : MySQL
 Target Server Version : 50547
 File Encoding         : 65001

 Date: 06/09/2019 20:33:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pre_cart
-- ----------------------------
DROP TABLE IF EXISTS `pre_cart`;
CREATE TABLE `pre_cart`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `foodid` int(10) UNSIGNED NULL DEFAULT NULL,
  `foodnum` int(10) UNSIGNED NULL DEFAULT NULL,
  `userid` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_foodid`(`foodid`) USING BTREE,
  INDEX `key_userid`(`userid`) USING BTREE,
  CONSTRAINT `forgin_foodid` FOREIGN KEY (`foodid`) REFERENCES `pre_food` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `forgin_userid` FOREIGN KEY (`userid`) REFERENCES `pre_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_food
-- ----------------------------
DROP TABLE IF EXISTS `pre_food`;
CREATE TABLE `pre_food`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cateid` int(10) UNSIGNED NULL DEFAULT NULL,
  `flag` enum('hot','new','top') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'new',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_cateid`(`cateid`) USING BTREE,
  CONSTRAINT `forgin_cateid` FOREIGN KEY (`cateid`) REFERENCES `pre_foodcate` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pre_food
-- ----------------------------
INSERT INTO `pre_food` VALUES (1, '经典锅塌豆腐\n', '/static/upload/banner1.jpg', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'top');
INSERT INTO `pre_food` VALUES (2, '经典锅塌豆腐\n', '/static/upload/banner2.jpg', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'top');
INSERT INTO `pre_food` VALUES (3, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'top');
INSERT INTO `pre_food` VALUES (4, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'top');
INSERT INTO `pre_food` VALUES (5, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'top');
INSERT INTO `pre_food` VALUES (6, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'hot');
INSERT INTO `pre_food` VALUES (7, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'hot');
INSERT INTO `pre_food` VALUES (8, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'hot');
INSERT INTO `pre_food` VALUES (9, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'hot');
INSERT INTO `pre_food` VALUES (10, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 1, 'hot');
INSERT INTO `pre_food` VALUES (11, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'hot');
INSERT INTO `pre_food` VALUES (12, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'hot');
INSERT INTO `pre_food` VALUES (13, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'hot');
INSERT INTO `pre_food` VALUES (14, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'hot');
INSERT INTO `pre_food` VALUES (15, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'hot');
INSERT INTO `pre_food` VALUES (16, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'new');
INSERT INTO `pre_food` VALUES (17, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'new');
INSERT INTO `pre_food` VALUES (18, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'new');
INSERT INTO `pre_food` VALUES (19, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'new');
INSERT INTO `pre_food` VALUES (20, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 2, 'new');
INSERT INTO `pre_food` VALUES (21, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (22, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (23, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (24, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (25, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (26, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (27, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (28, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (29, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (30, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 3, 'new');
INSERT INTO `pre_food` VALUES (31, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (32, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (33, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (34, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (35, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (36, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (37, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (38, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (39, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (40, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (41, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (42, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (43, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (44, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (45, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (46, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (47, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (48, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (49, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (50, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 4, 'new');
INSERT INTO `pre_food` VALUES (51, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 6, 'new');
INSERT INTO `pre_food` VALUES (52, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 6, 'new');
INSERT INTO `pre_food` VALUES (53, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 6, 'new');
INSERT INTO `pre_food` VALUES (54, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 6, 'new');
INSERT INTO `pre_food` VALUES (55, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 6, 'new');
INSERT INTO `pre_food` VALUES (56, '经典锅塌豆腐\n', 'https://res1.hoto.cn/02f5f82f59633f0df444eb88.jpg!default', 23.00, '“锅塌”是山东菜独有的一种烹调方法，它可做鱼，也可做肉，还可做豆腐和蔬菜。锅塌豆腐著名山东菜，成菜呈深黄色，外形整齐，入口鲜香,营养丰富。此菜原料层层叠起豆腐经过调料浸渍，蘸蛋液经油煎，加以鸡汤微火塌制，十分入味，豆腐蛋白质丰富，其生理价值比其他植物蛋白质高，可与肉类蛋白质媲美;含钙量也高，且易于吸收;虾子富含钙、磷等，有助于促进骨骼、牙齿、大脑等生长发育，并增强抵抗力，防止佝偻病、肌肉松弛等。', 6, 'new');

-- ----------------------------
-- Table structure for pre_foodcate
-- ----------------------------
DROP TABLE IF EXISTS `pre_foodcate`;
CREATE TABLE `pre_foodcate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pre_foodcate
-- ----------------------------
INSERT INTO `pre_foodcate` VALUES (1, '粤菜');
INSERT INTO `pre_foodcate` VALUES (2, '川菜');
INSERT INTO `pre_foodcate` VALUES (3, '东北菜');
INSERT INTO `pre_foodcate` VALUES (4, '咸香');
INSERT INTO `pre_foodcate` VALUES (5, '烧烤');
INSERT INTO `pre_foodcate` VALUES (6, '烤箱');
INSERT INTO `pre_foodcate` VALUES (7, '面食');
INSERT INTO `pre_foodcate` VALUES (8, '早餐');
INSERT INTO `pre_foodcate` VALUES (9, '午餐');
INSERT INTO `pre_foodcate` VALUES (10, '下午茶');
INSERT INTO `pre_foodcate` VALUES (11, '水煮');
INSERT INTO `pre_foodcate` VALUES (12, '聚会');
INSERT INTO `pre_foodcate` VALUES (13, '中秋节');
INSERT INTO `pre_foodcate` VALUES (14, '情人节');
INSERT INTO `pre_foodcate` VALUES (15, '日本料理');
INSERT INTO `pre_foodcate` VALUES (16, '韩国料理');

-- ----------------------------
-- Table structure for pre_order
-- ----------------------------
DROP TABLE IF EXISTS `pre_order`;
CREATE TABLE `pre_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '下单时间',
  `ordertype` tinyint(255) NULL DEFAULT 0 COMMENT '0立刻 1预约时间',
  `ordertime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '预约的时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价格',
  `status` int(255) UNSIGNED NULL DEFAULT 0 COMMENT '0 未支付\n1 已支付\n2 已取消\n3 就餐\n4 评价\n5 已完成',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单备注',
  `userid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `keyorder_userid`(`userid`) USING BTREE,
  CONSTRAINT `forginorder_userid` FOREIGN KEY (`userid`) REFERENCES `pre_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_order_food
-- ----------------------------
DROP TABLE IF EXISTS `pre_order_food`;
CREATE TABLE `pre_order_food`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '外键订单id',
  `foodid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '食品id',
  `foodnum` int(10) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `keyfood_orderid`(`orderid`) USING BTREE,
  INDEX `keyfood_foodid`(`foodid`) USING BTREE,
  CONSTRAINT `forginfood_foodid` FOREIGN KEY (`foodid`) REFERENCES `pre_food` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `forginfood_orderid` FOREIGN KEY (`orderid`) REFERENCES `pre_order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pre_user
-- ----------------------------
DROP TABLE IF EXISTS `pre_user`;
CREATE TABLE `pre_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) NULL DEFAULT 1 COMMENT '性别',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '注册时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '0邮箱未验证，1邮箱已验证',
  `money` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '用户余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pre_user
-- ----------------------------
INSERT INTO `pre_user` VALUES (1, 'demo', '3cc7b4850bd72870e3280d6bd7e749e9', 'rsxyCFJLMNT0245', '/static/img/aa.jpg', 1, '', 1567684623, 0, 0.00);

SET FOREIGN_KEY_CHECKS = 1;
