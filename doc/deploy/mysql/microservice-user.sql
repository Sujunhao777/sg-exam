/*
 Navicat Premium Data Transfer

 Source Server         : 144
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : 192.168.0.144:3306
 Source Schema         : microservice-user

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : 65001

 Date: 21/04/2019 13:47:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attach_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `attach_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件大小',
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `fast_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件ID',
  `busi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务ID',
  `busi_module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务模块',
  `busi_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型 0-普通，1-头像',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父部门id',
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序号',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0-启用，1-禁用',
  `dept_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门描述',
  `dept_leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('83f8d25ddc93445fa91e8c9d3db750a0', '测试部门', '-1', '30', 'admin', '2019-02-25 13:40:40', 'admin', '2019-04-11 16:47:52', '0', 'EXAM', '0', '测试部门', '管理员');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `title` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志标题',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户的IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户代理信息',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的URI',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作的方式',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作提交的数据',
  `exception` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '异常信息',
  `service_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗时',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父菜单id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向url',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('06e511a2fdc24f84bc4d7ba34e2f40b8', '修改路由', 'sys:route:edit', NULL, '09e6177314264671893316601fd12827', '', '2', '1', 'admin', '2019-04-02 16:29:00', 'admin', '2019-04-02 16:29:00', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('095bb0644ab14d97b31418f87e1cf823', '导出菜单', 'sys:menu:export', NULL, '3', '', '34', '1', 'admin', '2018-11-28 19:07:02', 'admin', '2018-11-28 19:07:02', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('09e6177314264671893316601fd12827', '路由管理', 'sys:route', '/api/user/route/**', '1', '', '12', '0', 'admin', '2019-04-02 16:28:06', 'admin', '2019-04-02 16:28:06', '0', 'EXAM', 'views/sys/route', 'route', NULL, '路由管理');
INSERT INTO `sys_menu` VALUES ('0dc80492cf414db984d825fdd842e022', '新增用户', 'sys:user:add', NULL, '4', 'example', '1', '1', '', '2018-10-28 16:38:57', NULL, '2019-03-20 21:54:33', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0ee02b8dc3064fcd972f527c31aad5a7', '修改菜单', 'sys:menu:edit', NULL, '3', 'example', '4', '1', '', '2018-10-28 16:46:38', 'admin', '2018-11-04 10:21:23', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('0fe1156ec9e24dd4bc2c663c665a5048', '导出用户', 'sys:user:export', NULL, '4', '', '33', '1', 'admin', '2018-11-27 12:05:03', 'admin', '2018-11-27 12:05:03', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1', '系统管理', 'sys', '/api/user/v1/user/**', '-1', 'component', '1', '0', '1', '1', 'admin', '2019-04-10 19:53:01', '0', '1', 'Layout', '/sys', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('13f925e8559c43aa8ef33a8e1e3f9b4d', '知识库', 'exam:knowledge', '/api/exam/v1/knowledge/**', 'b93eba1199b6420a82d285a8919bcd23', '', '5', '0', 'admin', '2019-01-01 14:55:31', NULL, '2019-03-18 14:47:51', '0', 'EXAM', 'views/exam/knowledge', 'knowledge', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('14', '个人管理', 'personal', '/admin/api/v1/personal/**', '-1', 'form', '30', '0', '', '2018-10-28 16:12:34', 'admin', '2019-03-06 14:10:22', '0', '', 'Layout', '/personal', NULL, '个人管理');
INSERT INTO `sys_menu` VALUES ('15', '附件管理', 'attachment', '/admin/api/v1/attachment/**', '-1', 'excel', '10', '0', 'admin', '2018-10-30 19:48:36', 'admin', '2019-03-06 14:10:18', '0', 'EXAM', 'Layout', '/attachment', NULL, '附件管理');
INSERT INTO `sys_menu` VALUES ('1717eabc03174c2e9bdaf27c5a5697dd', '题库管理', 'exam:subject', '/api/exam/v1/subject/**', 'b93eba1199b6420a82d285a8919bcd23', '', '3', '0', 'admin', '2018-12-04 21:33:40', NULL, '2019-03-18 14:47:40', '0', 'EXAM', 'views/exam/subject', 'subject', NULL, '题库管理');
INSERT INTO `sys_menu` VALUES ('1b68d41bfcc3441f839188a9d7b6ead0', '接口文档', 'monitor:document', '/monitor/document/**', '7', '', '34', '0', 'admin', '2018-10-30 15:06:08', 'admin', '2019-03-07 09:27:47', '0', 'EXAM', '', 'http://localhost:8000/swagger-ui.html', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('1e6a90e57df541e0973691c17d44564c', '日志监控', 'monitor:log', '/admin/api/v1/log/**', '7', '', '30', '0', 'admin', '2018-10-30 15:00:25', 'admin', '2019-03-06 14:11:03', '0', 'EXAM', 'views/monitor/log', 'log', NULL, '日志监控');
INSERT INTO `sys_menu` VALUES ('23df3c2475504ca781e25c3443d7ad25', '修改课程', 'exam:course:edit', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '2', '1', 'admin', '2018-11-10 22:44:28', 'admin', '2018-11-10 22:44:28', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('2a232ac9f43146a49ab5a19226e76742', '删除部门', 'sys:dept:del', NULL, '6', 'example', '3', '1', '', '2018-10-28 16:43:19', 'admin', '2018-11-04 10:20:22', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('2ac8ccadf70140edbed65c8c1bd05e2c', '新增终端', 'sys:client:add', NULL, 'a6ee113d593448e2a63a9d9712d9a81e', '', '1', '1', 'admin', '2019-03-30 22:32:37', 'admin', '2019-03-30 22:32:37', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3', '菜单管理', 'sys:menu', '/api/user/v1/menu/**', '1', '', '10', '0', '1', '1', NULL, '2019-03-18 14:47:10', '0', '1', 'views/sys/menu', 'menu', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('34371d1e990549f0b633389bdf64ce0f', '修改题目分类', 'exam:subject:category:edit', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '5', '1', 'admin', '2018-12-04 21:36:34', 'admin', '2018-12-04 21:36:34', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('347d24c6e1cf42eaa976c91f5607007a', '新增部门', 'sys:dept:add', NULL, '6', 'example', '1', '1', '', '2018-10-28 16:42:40', 'admin', '2018-11-04 10:20:15', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('34ffa24d3c124902893e601fe8e22b08', 'consul监控', 'monitor:service', '/admin/monitor/service/**', '7', '', '31', '0', 'admin', '2018-10-30 15:01:17', NULL, '2019-03-18 14:45:48', '0', 'EXAM', '', 'http://localhost:8500/', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('36cca77232f3487cbee02bb68ae12652', '新增菜单', 'sys:menu:add', NULL, '3', 'example', '1', '1', '', '2018-10-28 16:45:45', 'admin', '2018-11-04 10:21:06', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3a64f8a80dce4f6c8bc4483f0230f49f', '导入用户', 'sys:user:import', NULL, '4', '', '34', '1', 'admin', '2018-11-27 12:05:29', 'admin', '2018-11-27 12:05:29', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('3bb2fec1ba094584aa1a984ec1f05dc7', '删除课程', 'exam:course:del', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '3', '1', 'admin', '2018-11-10 22:44:53', 'admin', '2018-11-10 22:44:53', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4', '用户管理', 'sys:user', '/admin/api/v1/user/**', '1', '', '2', '0', '1', '1', 'admin', '2019-04-10 18:09:20', '0', '1', 'views/sys/user', 'user', '', '用户管理');
INSERT INTO `sys_menu` VALUES ('42c69128d30a4242b08ef0003da68528', '修改角色', 'sys:role:edit', NULL, '5', 'example', '4', '1', '', '2018-10-28 16:45:11', 'admin', '2018-11-04 10:19:45', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('451605025d9a4715b4ae78f5a5d01fea', '删除题目分类', 'exam:subject:category:del', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '6', '1', 'admin', '2018-12-04 21:36:55', 'admin', '2018-12-04 21:36:55', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('4f3e874dc310463a82e3b650fd851fdb', '修改密码', 'personal:password', '/admin/api/v1/user/updateInfo', '14', '', '30', '0', 'admin', '2018-10-29 21:59:03', 'admin', '2019-03-06 14:10:38', '0', 'EXAM', 'views/personal/password', 'password', NULL, '密码修改');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', 'sys:role', '/api/user/v1/role/**', '1', '', '9', '0', '1', '1', NULL, '2019-03-18 14:46:59', '0', '1', 'views/sys/role', 'role', '', NULL);
INSERT INTO `sys_menu` VALUES ('530f933da3824e1f9bf3182794141e9e', '删除题目', 'exam:subject:bank:del', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '3', '1', 'admin', '2018-12-04 21:35:13', 'admin', '2018-12-09 20:36:05', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('594e7afda95c42e6af2046f1bfe81c53', '删除日志', 'monitor:log:del', NULL, '1e6a90e57df541e0973691c17d44564c', '', '30', '1', 'admin', '2019-01-07 22:15:02', 'admin', '2019-01-07 22:15:02', '0', 'EXAM', NULL, NULL, NULL, '删除日志');
INSERT INTO `sys_menu` VALUES ('5ba624643cd34ec3b78ca622964c0f8a', '修改题目', 'exam:subject:bank:edit', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '2', '1', 'admin', '2018-12-04 21:34:50', 'admin', '2018-12-09 20:35:58', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6', '部门管理', 'sys:dept', '/api/user/v1/dept/**', '1', '', '8', '0', '1', '1', NULL, '2019-03-18 14:46:50', '0', '1', 'views/sys/dept', 'dept', '', NULL);
INSERT INTO `sys_menu` VALUES ('63f039ea5bcf4208978150b59484a429', '考试管理', 'exam:exam', '/api/exam/v1/examination/**', 'b93eba1199b6420a82d285a8919bcd23', '', '2', '0', 'admin', '2018-11-10 22:22:42', NULL, '2019-03-18 14:47:34', '0', 'EXAM', 'views/exam/exam', 'exam', NULL, '考试管理');
INSERT INTO `sys_menu` VALUES ('6434cf8ac2b0462e981f115329364c43', '刷新路由', 'sys:route:refresh', NULL, '09e6177314264671893316601fd12827', '', '4', '1', 'admin', '2019-04-07 12:08:51', 'admin', '2019-04-07 12:08:51', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('657026922f494801a41b64f40e63fca6', '删除考试', 'exam:exam:del', NULL, '63f039ea5bcf4208978150b59484a429', '', '3', '1', 'admin', '2018-11-10 22:46:12', 'admin', '2018-11-10 22:46:12', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('69a2a85608064762a3d76fc0c92072cc', '新增题目分类', 'exam:subject:category:add', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '4', '1', 'admin', '2018-12-04 21:35:59', 'admin', '2018-12-04 21:35:59', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6e74291cf4584b479e59409a843bd377', '新增路由', 'sys:route:add', NULL, '09e6177314264671893316601fd12827', '', '1', '1', 'admin', '2019-04-02 16:28:36', 'admin', '2019-04-02 16:28:36', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('6f605148282b4949b5c96e2877dc9052', '题目管理', 'exam:exam:subject', NULL, '63f039ea5bcf4208978150b59484a429', '', '4', '1', 'admin', '2018-11-13 20:50:07', 'admin', '2018-11-13 20:50:41', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7', '系统监控', 'sys', '/admin/monitor/**', '-1', 'chart', '7', '0', '1', '1', 'admin', '2019-01-05 16:19:56', '0', '1', 'Layout', '/monitor', '', NULL);
INSERT INTO `sys_menu` VALUES ('71e5179363bc4e119a87daaa631a2712', '导入题目', 'exam:exam:subject:import', NULL, '63f039ea5bcf4208978150b59484a429', '', '36', '1', 'admin', '2018-11-27 12:06:45', 'admin', '2018-11-27 12:06:45', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('72de30896d3a401eb62edc0aa6fbf190', '导出成绩', 'exam:examRecord:export', NULL, 'c3adad9112de41a6a2d4cc9fe4a4d94b', '', '30', '1', 'admin', '2018-12-30 22:12:20', 'admin', '2019-01-22 19:43:52', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7780e3fd6cea4ba78d780f33c111d95a', '导入菜单', 'sys:menu:import', NULL, '3', '', '35', '1', 'admin', '2018-11-28 19:07:20', 'admin', '2018-11-28 19:07:20', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('7f78172c09d3408dab1534d26b608b31', '首页', 'dashboard', '/', '-1', 'dashboard', '0', '0', 'admin', '2018-11-06 23:26:57', 'admin', '2019-04-10 19:52:42', '0', 'EXAM', '', '/dashboard', '', '首页');
INSERT INTO `sys_menu` VALUES ('8a3b997df4ea48548b626ef8e89a704d', '删除路由', 'sys:route:del', NULL, '09e6177314264671893316601fd12827', '', '3', '1', 'admin', '2019-04-02 16:29:19', 'admin', '2019-04-02 16:29:19', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8aefee22294d47d7a3e4a29ae5ced4b4', '个人资料', 'personal:message', '/admin/api/v1/user/updateInfo', '14', '', '29', '0', 'admin', '2018-10-29 21:58:32', 'admin', '2019-03-06 14:10:33', '0', 'EXAM', 'views/personal/message', 'message', NULL, '个人资料');
INSERT INTO `sys_menu` VALUES ('8b67ccbe89f74b728e58c2e4a4795027', '删除菜单', 'sys:menu:del', NULL, '3', 'example', '3', '1', '', '2018-10-28 16:46:23', 'admin', '2018-11-04 10:21:14', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('8bcf03f73377412b981572517b9055e0', '删除题目', 'exam:exam:subject:del', NULL, '63f039ea5bcf4208978150b59484a429', '', '38', '1', 'admin', '2018-11-29 14:11:24', 'admin', '2018-11-29 14:11:24', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('901959fd37df4f7d90adaa4ab6c4b331', '分配权限', 'sys:role:auth', NULL, '5', '', '30', '1', 'admin', '2018-11-04 10:19:32', 'admin', '2018-11-04 10:19:32', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('91861ef795ab4fc4a207567606fa62cc', '修改用户', 'sys:user:edit', NULL, '4', 'example', '4', '1', '', '2018-10-28 16:40:19', 'admin', '2018-11-04 10:20:54', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9c0846685bb24aafae731bdacf879ba2', '删除角色', 'sys:role:del', NULL, '5', 'example', '3', '1', '', '2018-10-28 16:44:56', 'admin', '2018-11-04 10:20:01', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('9c2e04eab32c467f87d89ad0a2b4892c', '导出题目', 'exam:subject:bank:export', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '32', '1', 'admin', '2018-12-09 20:38:06', 'admin', '2018-12-09 20:38:06', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a398216ac2f14c16928452483786329e', '新增题目', 'exam:subject:bank:add', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '1', '1', 'admin', '2018-12-04 21:34:29', 'admin', '2018-12-09 20:35:18', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a663e71f7b8441b0b8363ae5eb20bbb3', '修改部门', 'sys:dept:edit', NULL, '6', 'example', '4', '1', '', '2018-10-28 16:43:38', 'admin', '2018-11-04 10:20:30', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('a6ee113d593448e2a63a9d9712d9a81e', '终端管理', 'sys:client', '/api/user/v1/client/**', '1', '', '11', '0', 'admin', '2019-03-30 22:31:47', 'admin', '2019-03-30 22:31:47', '0', 'EXAM', 'views/sys/client', 'client', NULL, '终端管理');
INSERT INTO `sys_menu` VALUES ('ac6768a097184c99ada64810a897f727', '新增考试', 'exam:exam:add', NULL, '63f039ea5bcf4208978150b59484a429', '', '1', '1', 'admin', '2018-11-10 22:45:29', 'admin', '2018-11-10 22:45:29', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b85dda1e623e48e4ae82dc228df3edfe', '新增课程', 'exam:course:add', NULL, 'b8969a3731b0405e82d0bb896e13841e', '', '1', '1', 'admin', '2018-11-10 22:44:05', 'admin', '2018-11-10 22:44:05', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('b8969a3731b0405e82d0bb896e13841e', '课程管理', 'exam:course', '/api/exam/v1/course/**', 'b93eba1199b6420a82d285a8919bcd23', '', '1', '0', 'admin', '2018-11-10 22:21:58', NULL, '2019-03-18 14:47:28', '0', 'EXAM', 'views/exam/course', 'course', NULL, '课程管理');
INSERT INTO `sys_menu` VALUES ('b93eba1199b6420a82d285a8919bcd23', '考务管理', 'exam', '/exam/**', '-1', 'nested', '8', '0', 'admin', '2018-11-10 22:20:10', 'admin', '2018-11-10 22:20:10', '0', 'EXAM', 'Layout', '/exam', NULL, '考务管理');
INSERT INTO `sys_menu` VALUES ('c2bc24819bcc4e8790f0dba586914efe', '服务监控', 'monitor:admin', '/admin/monitor/admin/**', '7', '', '33', '0', 'admin', '2019-01-08 20:38:05', 'admin', '2019-03-30 14:27:39', '0', 'EXAM', NULL, 'http://localhost:8085/admin', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('c3adad9112de41a6a2d4cc9fe4a4d94b', '成绩管理', 'exam:examRecord', '/api/exam/v1/examRecord/**', 'b93eba1199b6420a82d285a8919bcd23', '', '4', '0', 'admin', '2018-12-30 22:10:53', NULL, '2019-03-18 14:47:46', '0', 'EXAM', 'views/exam/examRecord', 'score', NULL, '成绩管理');
INSERT INTO `sys_menu` VALUES ('c435ac944cd6430ba9a1039d8adb80a7', '新增角色', 'sys:role:add', NULL, '5', 'example', '1', '1', '', '2018-10-28 16:44:29', 'admin', '2018-11-04 10:19:53', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ca168a2d7c854320b207b7a7ea67eb5d', '修改终端', 'sys:client:edit', NULL, 'a6ee113d593448e2a63a9d9712d9a81e', '', '3', '1', 'admin', '2019-03-30 22:33:27', 'admin', '2019-03-30 22:33:27', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ca7e69aae4994099a6424aa9727b6a28', '删除用户', 'sys:user:del', NULL, '4', 'example', '3', '1', '', '2018-10-28 16:40:01', 'admin', '2018-11-04 10:20:46', '0', '', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('cfc631763d3e4f1ab973141ddbeee449', '修改考试', 'exam:exam:edit', NULL, '63f039ea5bcf4208978150b59484a429', '', '2', '1', 'admin', '2018-11-10 22:45:51', 'admin', '2018-11-10 22:45:51', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('cffa2058b7c746efa2fca7ceb6052bdc', '新增题目', 'exam:exam:subject:add', NULL, '63f039ea5bcf4208978150b59484a429', '', '37', '1', 'admin', '2018-11-29 14:11:06', 'admin', '2018-11-29 14:11:06', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('d1967064f3584672af29c184818e38a9', '导入题目', 'exam:subject:bank:import', NULL, '1717eabc03174c2e9bdaf27c5a5697dd', '', '31', '1', 'admin', '2018-12-09 20:37:22', 'admin', '2018-12-09 20:37:22', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ecb3ebcb68b54e06bd29f270a97cbb67', '删除终端', 'sys:client:del', NULL, 'a6ee113d593448e2a63a9d9712d9a81e', '', '2', '1', 'admin', '2019-03-30 22:32:59', 'admin', '2019-03-30 22:32:59', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('ee35a2abc0b04f3bb70527a7f79806e8', 'zipkin监控', 'monitor:link', '/admin/monitor/link/**', '7', '', '32', '0', 'admin', '2018-11-07 20:30:43', 'admin', '2019-01-08 20:36:38', '0', 'EXAM', NULL, 'http://localhost:9411/zipkin/', NULL, NULL);
INSERT INTO `sys_menu` VALUES ('fa483765360243d0a631a2b9793aaf41', '导出题目', 'exam:exam:subject:export', NULL, '63f039ea5bcf4208978150b59484a429', '', '35', '1', 'admin', '2018-11-27 12:06:17', 'admin', '2018-11-27 12:06:17', '0', 'EXAM', NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES ('fe73699236be4b148cd35628929cc876', '附件列表', 'attachment:list', '/admin/api/v1/attachment/list', '15', '', '30', '0', 'admin', '2018-10-30 19:49:50', 'admin', '2019-03-06 14:10:45', '0', 'EXAM', 'views/attachment/list', 'list', NULL, '附件列表');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `is_default` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否默认',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态 0-启用，1-禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('23ab268d7e0247868dcf484ab63ff595', '普通用户', 'role_user', '普通用户', '1', 'admin', '2019-02-25 13:43:15', 'admin', '2019-02-25 13:43:15', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('59fcb8500eb24f20bf7263467d757212', '管理员', 'role_admin', '管理员', '0', 'admin', '2019-02-25 13:41:27', 'admin', '2019-03-06 13:47:31', '0', 'EXAM', '0');
INSERT INTO `sys_role` VALUES ('fce0ad963d1f42be9178c4c5c493f55e', '教师', 'role_teacher', '教师', '0', 'admin', '2019-02-25 13:42:29', 'admin', '2019-02-25 13:42:29', '0', 'EXAM', '0');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('b9d76015d54e411393465395b8254c6b', 'fce0ad963d1f42be9178c4c5c493f55e', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_role_dept` VALUES ('bd6f5a3aaecd4f1b8430c3f11f3e3ee6', '23ab268d7e0247868dcf484ab63ff595', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_role_dept` VALUES ('da61e277cf4e46e9b7b9b125f26a22d3', '59fcb8500eb24f20bf7263467d757212', '83f8d25ddc93445fa91e8c9d3db750a0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('0a1b00820bad44c8878dcccc48d00715', 'fce0ad963d1f42be9178c4c5c493f55e', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('0db71c40ebab4cd887a40405ea98ff7d', 'fce0ad963d1f42be9178c4c5c493f55e', '69a2a85608064762a3d76fc0c92072cc');
INSERT INTO `sys_role_menu` VALUES ('0f471d7c913643dfbcd296b208e6eddf', 'fce0ad963d1f42be9178c4c5c493f55e', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('10c72131a1a04acba2339c390664d354', '59fcb8500eb24f20bf7263467d757212', '36cca77232f3487cbee02bb68ae12652');
INSERT INTO `sys_role_menu` VALUES ('1133189e279847428adc332c524158e7', '23ab268d7e0247868dcf484ab63ff595', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('114fe28d5b7d4ac4ba76ee942ce316da', '59fcb8500eb24f20bf7263467d757212', '0dc80492cf414db984d825fdd842e022');
INSERT INTO `sys_role_menu` VALUES ('13b0e97254ca4e77bd088f01e9da23b4', '59fcb8500eb24f20bf7263467d757212', '3a64f8a80dce4f6c8bc4483f0230f49f');
INSERT INTO `sys_role_menu` VALUES ('147129ffede24d49b1d9600db6dbb569', '59fcb8500eb24f20bf7263467d757212', 'd1967064f3584672af29c184818e38a9');
INSERT INTO `sys_role_menu` VALUES ('16b4ec0d70bf4ec39793fbe85ec57312', 'fce0ad963d1f42be9178c4c5c493f55e', '451605025d9a4715b4ae78f5a5d01fea');
INSERT INTO `sys_role_menu` VALUES ('17b0e613e909467dbebe1242a5dbecfb', '59fcb8500eb24f20bf7263467d757212', '095bb0644ab14d97b31418f87e1cf823');
INSERT INTO `sys_role_menu` VALUES ('1869c2443ec044319e8124de3433008a', '59fcb8500eb24f20bf7263467d757212', '7');
INSERT INTO `sys_role_menu` VALUES ('1ac11b2c611941c8b452d1a3c4906af4', 'fce0ad963d1f42be9178c4c5c493f55e', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('1c9d1de795464387b4b2f5a27a61f41d', 'fce0ad963d1f42be9178c4c5c493f55e', '71e5179363bc4e119a87daaa631a2712');
INSERT INTO `sys_role_menu` VALUES ('1d4ee7a6e9c540599f19db0fa15c363f', '59fcb8500eb24f20bf7263467d757212', '8b67ccbe89f74b728e58c2e4a4795027');
INSERT INTO `sys_role_menu` VALUES ('2028deac896d449198762790589c29fd', '23ab268d7e0247868dcf484ab63ff595', '14');
INSERT INTO `sys_role_menu` VALUES ('2177014101894bb7a1b829c5f3db3ad8', '59fcb8500eb24f20bf7263467d757212', '530f933da3824e1f9bf3182794141e9e');
INSERT INTO `sys_role_menu` VALUES ('2b5640df2b3a445ba2fc5e94afb459e7', '59fcb8500eb24f20bf7263467d757212', '34371d1e990549f0b633389bdf64ce0f');
INSERT INTO `sys_role_menu` VALUES ('2bc5ba21f8894ca9b6585f94ca3ae431', 'fce0ad963d1f42be9178c4c5c493f55e', '34371d1e990549f0b633389bdf64ce0f');
INSERT INTO `sys_role_menu` VALUES ('2e753ef3267b43f09face86375165213', '59fcb8500eb24f20bf7263467d757212', '15');
INSERT INTO `sys_role_menu` VALUES ('3085ff4ae09e4f2a9fd6af00444891b5', '23ab268d7e0247868dcf484ab63ff595', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('32a0fb42a7a145c0a184041bd78fc4b3', '59fcb8500eb24f20bf7263467d757212', 'a663e71f7b8441b0b8363ae5eb20bbb3');
INSERT INTO `sys_role_menu` VALUES ('333859285e8040a3b5498b9e3f58f137', '59fcb8500eb24f20bf7263467d757212', '6');
INSERT INTO `sys_role_menu` VALUES ('3376379076d94a988e468585886e1830', '59fcb8500eb24f20bf7263467d757212', '71e5179363bc4e119a87daaa631a2712');
INSERT INTO `sys_role_menu` VALUES ('35394767a296465d893c0332e39b7d31', '59fcb8500eb24f20bf7263467d757212', '42c69128d30a4242b08ef0003da68528');
INSERT INTO `sys_role_menu` VALUES ('355c2a9202ea4aad9f97aeedc313e0a9', '59fcb8500eb24f20bf7263467d757212', '34ffa24d3c124902893e601fe8e22b08');
INSERT INTO `sys_role_menu` VALUES ('39997f2b9c7b4a7aad99375e6be30704', 'fce0ad963d1f42be9178c4c5c493f55e', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('3a103296da0b404a96316d479773f3a2', '59fcb8500eb24f20bf7263467d757212', 'ac6768a097184c99ada64810a897f727');
INSERT INTO `sys_role_menu` VALUES ('3c18b4a8c04b4a9788794882255086e6', '59fcb8500eb24f20bf7263467d757212', '7780e3fd6cea4ba78d780f33c111d95a');
INSERT INTO `sys_role_menu` VALUES ('3c2ce97d31834946809ca6046543a0c3', '59fcb8500eb24f20bf7263467d757212', '347d24c6e1cf42eaa976c91f5607007a');
INSERT INTO `sys_role_menu` VALUES ('43f4a08eca964db78585a76280b6b9fc', '59fcb8500eb24f20bf7263467d757212', '901959fd37df4f7d90adaa4ab6c4b331');
INSERT INTO `sys_role_menu` VALUES ('4561e835bc094c4eab60ec6eeb5ef691', 'fce0ad963d1f42be9178c4c5c493f55e', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('46e7d70a953a4f79afad6d5acafaa8e3', 'fce0ad963d1f42be9178c4c5c493f55e', '530f933da3824e1f9bf3182794141e9e');
INSERT INTO `sys_role_menu` VALUES ('49eb6b04380745a39f5c4566ea837a7d', 'fce0ad963d1f42be9178c4c5c493f55e', 'c3adad9112de41a6a2d4cc9fe4a4d94b');
INSERT INTO `sys_role_menu` VALUES ('4aba66ab282442929578140b5ca15218', '59fcb8500eb24f20bf7263467d757212', 'fa483765360243d0a631a2b9793aaf41');
INSERT INTO `sys_role_menu` VALUES ('4c51ac1a39c84e818e2fe424bf1689a9', '59fcb8500eb24f20bf7263467d757212', 'ca168a2d7c854320b207b7a7ea67eb5d');
INSERT INTO `sys_role_menu` VALUES ('52731d807af14be98566785d77994ca8', 'fce0ad963d1f42be9178c4c5c493f55e', 'fa483765360243d0a631a2b9793aaf41');
INSERT INTO `sys_role_menu` VALUES ('550f241282454c55b50cfa485501e694', '59fcb8500eb24f20bf7263467d757212', '14');
INSERT INTO `sys_role_menu` VALUES ('5717b36f45984649a89f3b5f42f47795', 'fce0ad963d1f42be9178c4c5c493f55e', '8bcf03f73377412b981572517b9055e0');
INSERT INTO `sys_role_menu` VALUES ('5961be015f264aeba79df4cff7dc85b1', '59fcb8500eb24f20bf7263467d757212', 'ca7e69aae4994099a6424aa9727b6a28');
INSERT INTO `sys_role_menu` VALUES ('61e996d91e5f4990a2df8038c9b9abe6', 'fce0ad963d1f42be9178c4c5c493f55e', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('64d976c523494e3991fc2c57e4d8d5c3', '59fcb8500eb24f20bf7263467d757212', 'c2bc24819bcc4e8790f0dba586914efe');
INSERT INTO `sys_role_menu` VALUES ('65618e149ff7439e9d934447bb4e632b', '59fcb8500eb24f20bf7263467d757212', '9c2e04eab32c467f87d89ad0a2b4892c');
INSERT INTO `sys_role_menu` VALUES ('6588d2414bdd461587faf8ec33d73e01', 'fce0ad963d1f42be9178c4c5c493f55e', 'a398216ac2f14c16928452483786329e');
INSERT INTO `sys_role_menu` VALUES ('66960ce519964082a4bf915183053ad6', '59fcb8500eb24f20bf7263467d757212', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('68d0ec8f994f44c3a0048ab72099a0f9', '59fcb8500eb24f20bf7263467d757212', 'cfc631763d3e4f1ab973141ddbeee449');
INSERT INTO `sys_role_menu` VALUES ('6a2de03920be4827bd367f2e097ef6da', '59fcb8500eb24f20bf7263467d757212', '69a2a85608064762a3d76fc0c92072cc');
INSERT INTO `sys_role_menu` VALUES ('6f0f90d47b9e444784374d05d0e3ed00', '59fcb8500eb24f20bf7263467d757212', '4');
INSERT INTO `sys_role_menu` VALUES ('6fe4f680c3234cbd97c443994623a565', '59fcb8500eb24f20bf7263467d757212', '1b68d41bfcc3441f839188a9d7b6ead0');
INSERT INTO `sys_role_menu` VALUES ('71b8141721e34b4eaa39ff79097fa9b0', 'fce0ad963d1f42be9178c4c5c493f55e', '5ba624643cd34ec3b78ca622964c0f8a');
INSERT INTO `sys_role_menu` VALUES ('7424f9cdc5fe4f73a6ca82d4270bb2e8', '23ab268d7e0247868dcf484ab63ff595', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('7bb867f00b924241a6cfee1cf84ec120', '59fcb8500eb24f20bf7263467d757212', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('8369756b7d394ea9a4a707709f0d1d62', 'fce0ad963d1f42be9178c4c5c493f55e', 'd1967064f3584672af29c184818e38a9');
INSERT INTO `sys_role_menu` VALUES ('8597d33f34ad46a3bbd7ab12e620b83e', '59fcb8500eb24f20bf7263467d757212', 'c435ac944cd6430ba9a1039d8adb80a7');
INSERT INTO `sys_role_menu` VALUES ('873e5e0629ad44279c00fda5ddf0df55', 'fce0ad963d1f42be9178c4c5c493f55e', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('89c57e01609341e3b01889c592bcaaae', 'fce0ad963d1f42be9178c4c5c493f55e', 'cffa2058b7c746efa2fca7ceb6052bdc');
INSERT INTO `sys_role_menu` VALUES ('8d874e7b14e34f41a98ab26e9ebc8cc2', '59fcb8500eb24f20bf7263467d757212', '9c0846685bb24aafae731bdacf879ba2');
INSERT INTO `sys_role_menu` VALUES ('8dfba8d4049940a1981497631a971b28', 'fce0ad963d1f42be9178c4c5c493f55e', '9c2e04eab32c467f87d89ad0a2b4892c');
INSERT INTO `sys_role_menu` VALUES ('905d6e1b0b1e451ab256ee773693aa85', 'fce0ad963d1f42be9178c4c5c493f55e', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('94cd502193fd417ca433f9bcb446a803', '59fcb8500eb24f20bf7263467d757212', '0ee02b8dc3064fcd972f527c31aad5a7');
INSERT INTO `sys_role_menu` VALUES ('988491767e324b039a4d0ce930cc0c1d', '59fcb8500eb24f20bf7263467d757212', '6e74291cf4584b479e59409a843bd377');
INSERT INTO `sys_role_menu` VALUES ('9a22ef0635134e4bb6085513e15f1128', '59fcb8500eb24f20bf7263467d757212', '1e6a90e57df541e0973691c17d44564c');
INSERT INTO `sys_role_menu` VALUES ('9b2634786b7b437a8156835530d0583b', '59fcb8500eb24f20bf7263467d757212', '2a232ac9f43146a49ab5a19226e76742');
INSERT INTO `sys_role_menu` VALUES ('9b62925c419f4b8190d503483d561d1f', '59fcb8500eb24f20bf7263467d757212', '6434cf8ac2b0462e981f115329364c43');
INSERT INTO `sys_role_menu` VALUES ('9e24ed64fc664a3ca5d6cd256f9898bc', 'fce0ad963d1f42be9178c4c5c493f55e', '8aefee22294d47d7a3e4a29ae5ced4b4');
INSERT INTO `sys_role_menu` VALUES ('9ea5f3184eee4dd587eea6aa2636cce5', '59fcb8500eb24f20bf7263467d757212', '8bcf03f73377412b981572517b9055e0');
INSERT INTO `sys_role_menu` VALUES ('9fef12990310453ca432f53921b73ca9', '59fcb8500eb24f20bf7263467d757212', 'fe73699236be4b148cd35628929cc876');
INSERT INTO `sys_role_menu` VALUES ('a0b2a2cc7adb4cd286c1f3df5194f66c', '59fcb8500eb24f20bf7263467d757212', 'ecb3ebcb68b54e06bd29f270a97cbb67');
INSERT INTO `sys_role_menu` VALUES ('a0d9615d2b234774a5ec1c1e175b6d83', '59fcb8500eb24f20bf7263467d757212', '09e6177314264671893316601fd12827');
INSERT INTO `sys_role_menu` VALUES ('a3ad2d8579984bb4a2b1a83474ed684e', 'fce0ad963d1f42be9178c4c5c493f55e', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('a52537876df64c08a09ef371c523e6af', 'fce0ad963d1f42be9178c4c5c493f55e', '4f3e874dc310463a82e3b650fd851fdb');
INSERT INTO `sys_role_menu` VALUES ('a78ecf6cd9c04395a05449a823385291', '59fcb8500eb24f20bf7263467d757212', '594e7afda95c42e6af2046f1bfe81c53');
INSERT INTO `sys_role_menu` VALUES ('a93f6340e35d48eaa2c3929f95dd0170', '59fcb8500eb24f20bf7263467d757212', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('b0f351fa9dae4b239eb9ae058c815e60', '59fcb8500eb24f20bf7263467d757212', '5ba624643cd34ec3b78ca622964c0f8a');
INSERT INTO `sys_role_menu` VALUES ('b7b96f574382495cb0b611797e321525', '59fcb8500eb24f20bf7263467d757212', '23df3c2475504ca781e25c3443d7ad25');
INSERT INTO `sys_role_menu` VALUES ('b8a0e9ea4dc647ab896f20d330b97dfd', 'fce0ad963d1f42be9178c4c5c493f55e', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('baba9a2a7b5c4178b15437b9a62dfa21', 'fce0ad963d1f42be9178c4c5c493f55e', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('c2452dd3609c41388fa1f5d0a2db9cf9', '59fcb8500eb24f20bf7263467d757212', '6f605148282b4949b5c96e2877dc9052');
INSERT INTO `sys_role_menu` VALUES ('c3060717c50547088c4f66be1a7dc26e', '59fcb8500eb24f20bf7263467d757212', 'ee35a2abc0b04f3bb70527a7f79806e8');
INSERT INTO `sys_role_menu` VALUES ('c4e35e90be4642f3a649e34668f005bb', '59fcb8500eb24f20bf7263467d757212', 'cffa2058b7c746efa2fca7ceb6052bdc');
INSERT INTO `sys_role_menu` VALUES ('ca86e25c89f54e478378b02d4f27827d', '59fcb8500eb24f20bf7263467d757212', '7f78172c09d3408dab1534d26b608b31');
INSERT INTO `sys_role_menu` VALUES ('cdecfccbfea04b5b893c354a283ecf0e', '59fcb8500eb24f20bf7263467d757212', '1');
INSERT INTO `sys_role_menu` VALUES ('cf5f4cc9c5634089a0e64b599b62cda2', '59fcb8500eb24f20bf7263467d757212', '2ac8ccadf70140edbed65c8c1bd05e2c');
INSERT INTO `sys_role_menu` VALUES ('cfd0e356a27a4adda17cec32abf5a8e8', '59fcb8500eb24f20bf7263467d757212', '13f925e8559c43aa8ef33a8e1e3f9b4d');
INSERT INTO `sys_role_menu` VALUES ('d041edcfc47c4308b429efa1c73fd1e6', '59fcb8500eb24f20bf7263467d757212', '451605025d9a4715b4ae78f5a5d01fea');
INSERT INTO `sys_role_menu` VALUES ('d50abed8e9ae47b7997b30b9f5c886bf', '59fcb8500eb24f20bf7263467d757212', '5');
INSERT INTO `sys_role_menu` VALUES ('d5f736b7b68f4e5cb031a44f912594df', 'fce0ad963d1f42be9178c4c5c493f55e', '14');
INSERT INTO `sys_role_menu` VALUES ('d8fda077426a49f2ae69530ef6d96bdb', '59fcb8500eb24f20bf7263467d757212', 'c3adad9112de41a6a2d4cc9fe4a4d94b');
INSERT INTO `sys_role_menu` VALUES ('d9c513f8476a4e83a21fda275e2b7b3f', '59fcb8500eb24f20bf7263467d757212', '91861ef795ab4fc4a207567606fa62cc');
INSERT INTO `sys_role_menu` VALUES ('da290bddce48463bb9f7762997cfa30a', '59fcb8500eb24f20bf7263467d757212', '3bb2fec1ba094584aa1a984ec1f05dc7');
INSERT INTO `sys_role_menu` VALUES ('daac9bc902a64d7f841bebf3bc715d33', 'fce0ad963d1f42be9178c4c5c493f55e', '1717eabc03174c2e9bdaf27c5a5697dd');
INSERT INTO `sys_role_menu` VALUES ('dc11d7473847404099d25d1716cc0e3c', '59fcb8500eb24f20bf7263467d757212', '657026922f494801a41b64f40e63fca6');
INSERT INTO `sys_role_menu` VALUES ('dda5bcb343334f7c9c2ac468bbe0f4c3', '59fcb8500eb24f20bf7263467d757212', '72de30896d3a401eb62edc0aa6fbf190');
INSERT INTO `sys_role_menu` VALUES ('dee0d9f037744fab913eea30b4424ccd', '59fcb8500eb24f20bf7263467d757212', 'b85dda1e623e48e4ae82dc228df3edfe');
INSERT INTO `sys_role_menu` VALUES ('deed259136a2405f95023f6273602ab9', '59fcb8500eb24f20bf7263467d757212', '63f039ea5bcf4208978150b59484a429');
INSERT INTO `sys_role_menu` VALUES ('e0852c9db4194ee2b225f3105dd21c5e', '59fcb8500eb24f20bf7263467d757212', 'a398216ac2f14c16928452483786329e');
INSERT INTO `sys_role_menu` VALUES ('e289344db550494796b40a3cf2e4e8ec', '59fcb8500eb24f20bf7263467d757212', 'b8969a3731b0405e82d0bb896e13841e');
INSERT INTO `sys_role_menu` VALUES ('e814724f69d742b18235a434c6bc78c3', '59fcb8500eb24f20bf7263467d757212', '06e511a2fdc24f84bc4d7ba34e2f40b8');
INSERT INTO `sys_role_menu` VALUES ('f20ad1ea32394c1ba85f4e3c342cdda2', '59fcb8500eb24f20bf7263467d757212', 'b93eba1199b6420a82d285a8919bcd23');
INSERT INTO `sys_role_menu` VALUES ('f44114e9efa446ecac68c4abf4648bd8', '59fcb8500eb24f20bf7263467d757212', 'a6ee113d593448e2a63a9d9712d9a81e');
INSERT INTO `sys_role_menu` VALUES ('f6b832874b9444d1a7e20cb0da2c598a', '59fcb8500eb24f20bf7263467d757212', '0fe1156ec9e24dd4bc2c663c665a5048');
INSERT INTO `sys_role_menu` VALUES ('f769ff3bc10642a39598025a448e0281', '59fcb8500eb24f20bf7263467d757212', '8a3b997df4ea48548b626ef8e89a704d');
INSERT INTO `sys_role_menu` VALUES ('f8fac0e2b95f4849abbd9854d46a5e7c', '59fcb8500eb24f20bf7263467d757212', '3');
INSERT INTO `sys_role_menu` VALUES ('fa6c425947764ef7a20e34157e8dd0d5', 'fce0ad963d1f42be9178c4c5c493f55e', '72de30896d3a401eb62edc0aa6fbf190');
INSERT INTO `sys_role_menu` VALUES ('fbb727d2acc34f6f8dcb45982f1298fd', 'fce0ad963d1f42be9178c4c5c493f55e', '13f925e8559c43aa8ef33a8e1e3f9b4d');

-- ----------------------------
-- Table structure for sys_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_route`;
CREATE TABLE `sys_route`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `route_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由ID',
  `route_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由名称',
  `predicates` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '断言',
  `filters` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过滤器',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URI',
  `sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '排序',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_route
-- ----------------------------
INSERT INTO `sys_route` VALUES ('0f1aec35a545433c8cc0c8e78995f039', 'auth-service', '认证授权服务', '[\n  {\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/api/auth/**\"\n    }\n  }\n]', '[\n  {\n    \"name\": \"StripPrefix\",\n    \"args\": {\n      \"_genkey_0\": \"2\"\n    }\n  },\n  {\n    \"name\": \"RemoveRequestHeader\",\n    \"args\": {\n      \"_genkey_0\": \"Cookie\",\n      \"_genkey_1\": \"Set-Cookie\"\n    }\n  }\n]', 'lb://auth-service', '0', '0', 'admin', '2019-04-07 11:20:55', 'admin', '2019-04-07 14:35:44', '0', 'EXAM');
INSERT INTO `sys_route` VALUES ('5d9dd5f2cb1147aaad6f8b82a58586e8', 'exam-service', '考试服务', '[\n  {\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/api/exam/**\"\n    }\n  }\n]', '[\n  {\n    \"name\": \"StripPrefix\",\n    \"args\": {\n      \"_genkey_0\": \"2\"\n    }\n  },\n  {\n    \"name\": \"RemoveRequestHeader\",\n    \"args\": {\n      \"_genkey_0\": \"Cookie\",\n      \"_genkey_1\": \"Set-Cookie\"\n    }\n  }\n]', 'lb://exam-service', '0', '0', 'admin', '2019-04-02 21:39:30', 'admin', '2019-04-11 16:50:09', '0', 'EXAM');
INSERT INTO `sys_route` VALUES ('e9199257e8dc4f2d8fbb2a113c407eca', 'user-service', '用户服务', '[\n  {\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/api/user/**\"\n    }\n  }\n]', '[\n  {\n    \"name\": \"StripPrefix\",\n    \"args\": {\n      \"_genkey_0\": \"2\"\n    }\n  },\n  {\n    \"name\": \"RemoveRequestHeader\",\n    \"args\": {\n      \"_genkey_0\": \"Cookie\",\n      \"_genkey_1\": \"Set-Cookie\"\n    }\n  }\n]', 'lb://user-service', '0', '0', 'admin', '2019-04-07 11:22:05', 'admin', '2019-04-07 11:22:05', '0', 'EXAM');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '盐',
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '手机',
  `avatar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '头像',
  `avatar_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像对应的附件id',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '性别',
  `born` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '生日',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用禁用',
  `creator` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_date` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改人',
  `modify_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` int(20) NULL DEFAULT NULL COMMENT '删除标记',
  `application_code` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '系统编号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('2', '管理员', 'admin', '$2a$10$VguPuhGmeq10EfAuc7rGH.4ibasIXwL4toMU8T5O/iXidah0xgSoe', NULL, '15521089144', '', '', '1633736729@qq.com', '0', '2018-10-04', '0', 'admin', '2018-09-01 14:37:09', 'admin', '2019-03-18 14:12:45', 0, 'EXAM', '管理员', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_user` VALUES ('3078afafab8346348cef667b3d56f813', '林老师', 'teacher', '$2a$10$.kV4i.J5qnSscqgugnHQR.dCX0NyjPJHbPEWgb9DBgZMAuuWgmBOK', NULL, '12345678901', '', NULL, '12345678901', '0', '2019-02-18', '0', 'admin', '2019-02-25 13:52:50', 'admin', '2019-04-10 17:46:18', 0, 'EXAM', '张老师', '83f8d25ddc93445fa91e8c9d3db750a0');
INSERT INTO `sys_user` VALUES ('abd4dbe19faf4f7f8ff239b63acc5d34', '梁同学', 'student', '$2a$10$WKc4EjebJbLHLnCgc1Jn/OgeiCVOXSuxw/Flb45Ay9pcogLepr1p6', NULL, '32323232323', '', '', NULL, '0', '2019-02-04', '0', 'admin', '2019-02-25 13:53:47', 'admin', '2019-04-10 16:46:20', 0, 'EXAM', '梁同学', '83f8d25ddc93445fa91e8c9d3db750a0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1f96bb80b7b44675ac59fb31d9619601', '3e55726d2d914cd383b57b166ce6d60b', '23ab268d7e0247868dcf484ab63ff595');
INSERT INTO `sys_user_role` VALUES ('4380dcd018bd4d8eb6417a28089b7b8d', '2', '59fcb8500eb24f20bf7263467d757212');
INSERT INTO `sys_user_role` VALUES ('8b72d93b0aff40bfbbfffea0c621994a', 'abd4dbe19faf4f7f8ff239b63acc5d34', '23ab268d7e0247868dcf484ab63ff595');
INSERT INTO `sys_user_role` VALUES ('a06a1a53dc564bab80b7fb30c490355a', '3078afafab8346348cef667b3d56f813', 'fce0ad963d1f42be9178c4c5c493f55e');

SET FOREIGN_KEY_CHECKS = 1;
