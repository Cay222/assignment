SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`
(
    `course_id`      int(0)                                                 NOT NULL AUTO_INCREMENT COMMENT '课程编号',
    `course_name`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
    `course_credit`  int(0)                                                 NOT NULL COMMENT '学分',
    `course_hours`   int(0)                                                 NOT NULL COMMENT '学时',
    `course_teacher` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任课教师',
    `coursedate`     date                                                   NOT NULL COMMENT '开课时间',
    PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course`
VALUES (1, '写作与表达', 3, 60, '李想', '2021-11-01');
INSERT INTO `course`
VALUES (2, 'python与数据分析', 3, 60, '赵思', '2021-11-01');
INSERT INTO `course`
VALUES (3, '计算机组成原理', 3, 60, '徐华', '2021-11-01');
INSERT INTO `course`
VALUES (4, '操作系统', 2, 60, '唐国强', '2021-11-01');
INSERT INTO `course`
VALUES (5, '汇编与微处理器', 4, 60, '徐强', '2021-11-01');
INSERT INTO `course`
VALUES (6, 'Web系统与技术', 4, 60, '张乐', '2021-11-01');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`
(
    `role_id`   int(0)                                                 NOT NULL COMMENT '角色编号',
    `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
    `role_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色信息',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role`
VALUES (0, '学生', '学生查看成绩');
INSERT INTO `role`
VALUES (1, '教师', '教师操作');
INSERT INTO `role`
VALUES (2, '管理员', '管理员操作');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`
(
    `score_id`    int(0)                                                 NOT NULL AUTO_INCREMENT COMMENT '成绩编号',
    `stu_num`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
    `stu_name`    varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
    `stu_class`   varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级',
    `course_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目',
    `score_grade` double(11, 2)                                          NOT NULL COMMENT '成绩',
    `major`       varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
    PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 113
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score`
VALUES (1, '1', '张三', '计科191', 'python与数据分析', 96.00, '计算机');
INSERT INTO `score`
VALUES (2, '1', '张三', '计科191', '汇编与微处理器', 65.00, '计算机');
INSERT INTO `score`
VALUES (3, '3', '王五', '计科191', '操作系统', 85.00, '计算机');
INSERT INTO `score`
VALUES (4, '3', '王五', '计科191', 'Web系统与技术', 90.00, '计算机');
INSERT INTO `score`
VALUES (5, '2', '李四', '计科191', '计算机组成原理', 69.00, '计算机');
INSERT INTO `score`
VALUES (6, '4', '赵六', '计科191', '写作与表达', 95.00, '计算机');
INSERT INTO `score`
VALUES (7, '5', '孙七', '软件191', 'Web系统与技术', 89.00, '计算机');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`
(
    `stu_id`     int(0)                                                 NOT NULL AUTO_INCREMENT COMMENT '编号',
    `stu_num`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
    `stu_name`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
    `stu_sex`    varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
    `stu_age`    int(0)                                                 NOT NULL COMMENT '年龄',
    `stu_class`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级',
    `major`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
    `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系',
    PRIMARY KEY (`stu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 34
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student`
VALUES (1, '1', '张三', '男', 21, '计科191', '计算机', '计院');
INSERT INTO `student`
VALUES (2, '2', '李四', '女', 20, '计科191', '计算机', '计院');
INSERT INTO `student`
VALUES (3, '3', '王五', '男', 20, '计科192', '计算机', '计院');
INSERT INTO `student`
VALUES (4, '4', '赵六', '男', 21, '计科192', '计算机', '计院');
INSERT INTO `student`
VALUES (5, '5', '孙七', '女', 19, '软件191', '软件工程', '计院');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`
(
    `tea_id`     int(0)                                                 NOT NULL AUTO_INCREMENT COMMENT '编号',
    `tea_num`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
    `tea_name`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
    `tea_sex`    varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
    `tea_age`    int(0)                                                 NOT NULL COMMENT '年龄',
    `tea_course` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所任课程',
    `major`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
    `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系',
    PRIMARY KEY (`tea_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher`
VALUES (1, '11', '李想', '女', 30, '写作与表达', '计算机', '计院');
INSERT INTO `teacher`
VALUES (2, '12', '徐强', '男', 43, '汇编', '计算机', '计院');
INSERT INTO `teacher`
VALUES (3, '13', '徐华', '男', 39, '计算机组成原理', '计算机', '计院');
INSERT INTO `teacher`
VALUES (4, '14', '赵思', '女', 29, 'python与数据分析', '计算机', '计院');
INSERT INTO `teacher`
VALUES (5, '15', '唐国强', '男', 40, '操作系统', '计算机', '计院');
INSERT INTO `teacher`
VALUES (6, '16', '张乐', '男', 35, 'Web系统与技术', '计算机', '计院');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `user_id`   int(0)                                                 NOT NULL AUTO_INCREMENT COMMENT '用户编号',
    `user_num`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
    `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
    `password`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
    `phone`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
    `role_id`   int(0)                                                 NOT NULL COMMENT '角色编号（外键）',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (1, 'admin', 'admin', '123', '123456789', 2);
INSERT INTO `user`
VALUES (2, 'student', 'student', '123', '123456789', 0);
INSERT INTO `user`
VALUES (3, 'teacher', 'teacher', '123', '123456789', 1);

SET FOREIGN_KEY_CHECKS = 1;