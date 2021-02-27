# Host: localhost  (Version: 5.5.47)
# Date: 2021-02-27 15:24:41
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "article"
#

CREATE TABLE `article` (
  `blog_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) NOT NULL COMMENT '博客标题',
  `blog_cover_image` varchar(255) NOT NULL DEFAULT '' COMMENT '博客封面图',
  `blog_content` longtext NOT NULL COMMENT '博客内容',
  `blog_summary` longtext NOT NULL COMMENT '博客摘要',
  `blog_status` int(11) DEFAULT NULL COMMENT '状态：0：发布，1：草稿,2:回收站',
  `blog_visits` bigint(20) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近编辑时间',
  `is_top` int(11) DEFAULT '0' COMMENT '是否置顶',
  `blog_like` bigint(20) DEFAULT '0' COMMENT '点赞量',
  PRIMARY KEY (`blog_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

#
# Structure for table "article_blog_tag"
#

CREATE TABLE `article_blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE KEY `tag_name` (`tag_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Structure for table "article_blog_tag_relation"
#

CREATE TABLE `article_blog_tag_relation` (
  `relation_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` int(20) NOT NULL COMMENT '博客id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Structure for table "article_category"
#

CREATE TABLE `article_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) NOT NULL COMMENT '分类的名称',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE KEY `category_name` (`category_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Structure for table "article_comment"
#

CREATE TABLE `article_comment` (
  `comment_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `content` varchar(300) NOT NULL COMMENT '评论内容',
  `blog_id` int(11) DEFAULT NULL,
  `nick_name` varchar(20) NOT NULL COMMENT '评论人昵称',
  `avatar` varchar(255) DEFAULT 'https://www.datealive.top/wp-content/themes/kratos/static/images/avatar/104b754c6da34af2852493395c2bcf53!400x400.jpeg' COMMENT '评论人头像',
  `email` varchar(100) DEFAULT NULL COMMENT '联系邮箱',
  `reply_nick_name` varchar(100) DEFAULT NULL COMMENT '回复人昵称',
  `pid` int(20) DEFAULT '0' COMMENT '父评论id，为0表示无父评论',
  `create_time` datetime DEFAULT NULL COMMENT '发布时间',
  `site_url` varchar(100) DEFAULT NULL COMMENT '评论者站点',
  `page` int(11) DEFAULT '0' COMMENT '0是文章页面，1是友链页面，2是关于我页面',
  `is_check` int(11) DEFAULT '0' COMMENT '0是未审核，1是已经审核',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

#
# Structure for table "blog_link"
#

CREATE TABLE `blog_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_name` varchar(50) NOT NULL COMMENT '网站名称',
  `link_url` varchar(100) NOT NULL COMMENT '网站链接',
  `link_info` varchar(100) DEFAULT NULL COMMENT '站点描述',
  `avatar` varchar(100) NOT NULL COMMENT '友链头像路径',
  `status` int(11) DEFAULT '0' COMMENT '友链状态，0是未审核，1是已经审核',
  PRIMARY KEY (`link_id`) USING BTREE,
  UNIQUE KEY `link_url` (`link_url`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

#
# Structure for table "blog_user"
#

CREATE TABLE `blog_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '登录账号',
  `password` varchar(50) NOT NULL COMMENT '登录密码',
  `nick_name` varchar(50) NOT NULL COMMENT '昵称',
  `avatar` varchar(100) NOT NULL COMMENT '头像路径',
  `introduce` varchar(200) NOT NULL COMMENT '介绍',
  `roles` varchar(200) NOT NULL COMMENT '角色',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `user_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


INSERT INTO `blog_user` VALUES (2,'Vistortest','830fd3684642d1e053fc047202afa6a3','Vistortest','https://obs-myblog.obs.cn-south-1.myhuaweicloud.com/myavatar/C45734EBD47D7143E66CBC5B10F76F06.jpg','测试用户','test','994899917@qq.com');

#
# Structure for table "log"
#

CREATE TABLE `log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `operateor` varchar(255) DEFAULT NULL COMMENT '操作人',
  `operateType` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `operateDate` datetime DEFAULT NULL COMMENT '操作时间',
  `operateResult` varchar(255) DEFAULT NULL COMMENT '操作结果',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `ip_source` varchar(255) DEFAULT NULL COMMENT 'ip来源',
  `description` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `os` varchar(255) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(255) DEFAULT NULL COMMENT '浏览器',
  `error` longtext COMMENT '异常信息',
  `classification` int(11) DEFAULT '0' COMMENT '0是访问日志1是操作日志2是登录日志3是任务日志4是异常日志',
  `SpendTime` int(11) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=1213 DEFAULT CHARSET=utf8mb4 COMMENT='日志表';

#
# Structure for table "moment"
#

CREATE TABLE `moment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL COMMENT '动态内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `likes` int(11) DEFAULT NULL COMMENT '点赞数量',
  `is_published` int(11) NOT NULL COMMENT '是否公开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

#
# Structure for table "site_setting"
#

CREATE TABLE `site_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) DEFAULT NULL,
  `name_zh` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` int(11) DEFAULT NULL COMMENT '1基础设置，2页脚徽标，3资料卡，4友链信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

INSERT INTO `site_setting` VALUES (1,'webTitleSuffix','网页标题后缀',' - Hi-Dream\'s Blog',1),(2,'blogName','博客名称','Hi-Dream\'s Blog',1),(3,'footerImgTitle','页脚图片标题','博客交流群',1),(4,'footerImgUrl','页脚图片路径','https://blog.datealive.top/img/qqqun.jpg',1),(5,'copyright','Copyright','{\"title\":\"Copyright © 2021 - 2022\",\"siteName\":\"Hi-Dream\'s Blog\"}',1),(6,'beian','ICP备案号','粤ICP备20036790号-1 ',1),(7,'badge','徽标','{\"title\":\"由 Spring Boot 强力驱动\",\"url\":\"https://spring.io/projects/spring-boot/\",\"subject\":\"Powered\",\"value\":\"Spring Boot\",\"color\":\"blue\"}',2),(8,'badge','徽标','{\"title\":\"Vue.js 客户端渲染\",\"url\":\"https://cn.vuejs.org/\",\"subject\":\"SPA\",\"value\":\"Vue.js\",\"color\":\"brightgreen\"}',2),(14,'avatar','图片路径','https://blog.datealive.top/img/headimg.jpg',3),(15,'name','昵称','梦独吟',3),(16,'rollText','滚动个签','\"云鹤当归天，天不迎我妙木仙；\",\"游龙当归海，海不迎我自来也。\"',3),(17,'github','GitHub地址','https://github.com/dateolive',3),(18,'qq','QQ链接','http://sighttp.qq.com/authd?IDKEY=2448282543',3),(19,'bilibili','bilibili链接','https://space.bilibili.com/100669401',3),(20,'netease','网易云音乐','https://music.163.com/#/user/home?id=550677583',3),(21,'email','email','2448282543@qq.com',3),(22,'musicId','网易云歌单ID','2825591801',3),(23,'backGroundImage','卡片背景图片','https://cdn.kaiming66.com/http-8c4ea3c0a1a65d1118594854ca5b9b1b4dcfeed7.jpg',3),(25,'reward','赞赏码路径','https://cdn.jsdelivr.net/gh/dateolive/Hi-Dream-BlogReSource@main/img/zansan.jpg',1),(27,'friendContent','友链页面信息','随机排序，不分先后。欢迎交换友链~(￣▽￣)~*\n\n* 昵称：Naccl\n* 一句话：游龙当归海，海不迎我自来也。\n* 网址：[https://naccl.top](https://naccl.top)\n* 头像URL：[https://naccl.top/img/avatar.jpg](https://naccl.top/img/avatar.jpg)\n\n仅凭个人喜好添加友链，请在收到我的回复邮件后再于贵站添加本站链接。原则上已添加的友链不会删除，如果你发现自己被移除了，恕不另行通知，只需和我一样做就好。\n\n',4),(29,'backgroundImage','博客背景图','https://cdn.jsdelivr.net/gh/dateolive/Hi-Dream-BlogReSource@main/img/backgroundimg.jpg',1),(32,'headAvatar','顶部头像','https://blog.datealive.top/img/headimg.jpg',1),(33,'headInfo','顶部描述','若似月轮终皎洁，不辞冰雪为卿热。',1),(34,'loginUrl','登录后台地址','http://admin.datealive.top/',1),(36,'favorite','自定义','{\"title\":\"公告栏\",\"content\":\"目前博客系统还在开发中~并不是稳定版本，还希望大家积极反馈bug\"}',3),(40,'badge','徽标','{\"color\":\"yellow\",\"subject\":\"BLOG\",\"title\":\"博客系统由datealive开发\",\"url\":\"https://blog.datealive.top/\",\"value\":\"datealive\"}',2),(41,'badge','徽标','{\"color\":\"red\",\"subject\":\"粤公网安备 \",\"title\":\"粤公网备案\",\"url\":\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44051302000138\",\"value\":\"44051302000138号 \"}',2),(42,'badge','徽标','{\"color\":\"orange\",\"subject\":\"萌ICP备\",\"title\":\"萌国备案\",\"url\":\"https://icp.gov.moe/\",\"value\":\"202002000号\"}',2),(43,'favorite','自定义','{\"title\":\"博客更新内容\",\"content\":\"2021-2-27 博客上线更新版本\"}',3);

#
# Structure for table "tb_blog_category_relation"
#

CREATE TABLE `tb_blog_category_relation` (
  `relation_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` int(20) NOT NULL COMMENT '博客id',
  `category_id` int(11) NOT NULL COMMENT '分类id',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
