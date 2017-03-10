-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema redcms1
--

CREATE DATABASE IF NOT EXISTS redcms1;
USE redcms1;

--
-- Definition of table `channel`
--

DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned DEFAULT NULL COMMENT '模型id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '父栏目id',
  `name` varchar(25) DEFAULT NULL COMMENT '栏目名',
  `path` varchar(25) DEFAULT NULL COMMENT '访问目录',
  `orderlist` int(2) unsigned DEFAULT '10' COMMENT '排序',
  `link` varchar(65) DEFAULT NULL COMMENT '外部链接',
  `pic` varchar(120) DEFAULT NULL COMMENT '栏目图片',
  `pic_height` int(11) DEFAULT NULL COMMENT '栏目图宽',
  `pic_width` int(11) DEFAULT NULL COMMENT '栏目图高',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `meta_title` varchar(100) DEFAULT NULL COMMENT 'meta_tiel',
  `meta_key` varchar(100) DEFAULT NULL COMMENT 'meta_key',
  `meta_des` varchar(200) DEFAULT NULL COMMENT 'meta_des',
  `index_temp` varchar(45) DEFAULT NULL COMMENT '首页模版',
  `list_temp` varchar(45) DEFAULT NULL COMMENT '列表模版',
  `content_temp` varchar(45) DEFAULT NULL COMMENT '内容模版',
  `content` text COMMENT '内容',
  `content_pic` varchar(200) DEFAULT NULL COMMENT '内容中的图片',
  PRIMARY KEY (`id`),
  KEY `FK_channel_1` (`model_id`),
  KEY `FK_channel_2` (`parent_id`),
  CONSTRAINT `FK_channel_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `FK_channel_2` FOREIGN KEY (`parent_id`) REFERENCES `channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk COMMENT='栏目表';

--
-- Dumping data for table `channel`
--

/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` (`id`,`model_id`,`parent_id`,`name`,`path`,`orderlist`,`link`,`pic`,`pic_height`,`pic_width`,`createtime`,`meta_title`,`meta_key`,`meta_des`,`index_temp`,`list_temp`,`content_temp`,`content`,`content_pic`) VALUES 
 (3,1,NULL,'精彩文章','article',0,'http:///','/redcms1/res/uppics/2012122410124739.jpg',120,320,NULL,NULL,NULL,'metaDes','new_index.jsp','new_list.jsp','new_content.jsp','这里是内容',NULL),
 (4,2,NULL,'精彩图库','pictures',0,NULL,NULL,120,320,'2012-12-24 10:16:40','ateTitle','MateKey','metaDes','pic_index.jsp','pic_list.jsp','pic_content.jsp','<p>\r\n	sdfsdfsdf\r\n</p>\r\n<p>\r\n	sfsdfdsf\r\n</p>\r\n<p>\r\n	sdf\r\n</p>\r\n<p>\r\n	sdfsdf\r\n</p>',NULL),
 (5,1,4,'新闻','news',10,NULL,'/redcms1/res/uppics/20121224104510407.jpg',120,320,'2012-12-24 10:45:12',NULL,NULL,NULL,'new_index.jsp','new_list.jsp','new_content.jsp','sfsdfsdfds',NULL),
 (6,2,4,'sdfsdf','sdfds',10,NULL,'/redcms1/res/uppics/20121224105141646.jpg',120,320,'2012-12-24 10:51:43','sdfsdsd','fsdfs','dfsdfsd','new_index.jsp','new_list.jsp','new_content.jsp','sdfsdfds',NULL),
 (7,1,4,'sdfsd','sdfsd',10,NULL,'/redcms1/res/uppics/20121224105253907.jpg',120,320,'2012-12-24 10:52:55',NULL,NULL,'sdfsdf','new_index.jsp','new_list.jsp','new_content.jsp','sdfsdf',NULL),
 (8,1,3,'sdfds',NULL,10,NULL,'/redcms1/res/uppics/20121224110028383.jpg',120,320,'2012-12-24 11:00:30',NULL,NULL,'sdfdsf','new_index.jsp','new_list.jsp','new_content.jsp','sdfsd',NULL),
 (9,1,3,'xfxc',NULL,10,NULL,'/redcms1/res/uppics/20121224110338721.jpg',120,320,'2012-12-24 11:03:42',NULL,'dfgfd','vxcvxc','new_index.jsp','new_list.jsp','new_content.jsp','dfdsf',NULL),
 (10,1,3,'sfsdf',NULL,10,NULL,'/redcms1/res/uppics/20121224110602363.jpg',120,320,'2012-12-24 11:06:04',NULL,NULL,'sfsdfds','new_index.jsp','new_list.jsp','new_content.jsp','sfdsfdsfsdfsdf',NULL),
 (11,1,3,'sdfs',NULL,10,'sdfsdf','/redcms1/res/uppics/20121224110716543.jpg',120,320,'2012-12-24 11:07:19',NULL,NULL,'sdfsdf','new_index.jsp','new_list.jsp','new_content.jsp','sdfsdfdsfsd',NULL),
 (12,1,3,'sdfsf',NULL,10,NULL,'http://t3.baidu.com/it/u=3910332723,3858185837&fm=24&gp=0.jpg',120,320,'2012-12-24 11:09:18',NULL,NULL,'asdfdsf','new_index.jsp','new_list.jsp','new_content.jsp','sdfsdf',NULL),
 (13,1,NULL,'aaaaa',NULL,10,'sdf',NULL,120,320,'2012-12-24 11:16:10',NULL,NULL,'sdfsdf','new_index.jsp','new_list.jsp','new_content.jsp','sdfsdf',NULL),
 (14,1,4,'sdfsdfdsf',NULL,10,NULL,NULL,120,320,'2012-12-24 11:16:18',NULL,NULL,'sdfsdf','new_index.jsp','new_list.jsp','new_content.jsp','sdfsdf',NULL);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;


--
-- Definition of table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  `type_id` int(10) unsigned DEFAULT NULL COMMENT '类型id',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `title` varchar(85) DEFAULT NULL COMMENT '标题',
  `tags` varchar(45) DEFAULT NULL COMMENT '标签',
  `author` varchar(25) DEFAULT NULL COMMENT '作者',
  `origin` varchar(25) DEFAULT '转载' COMMENT '来原',
  `origin_url` varchar(45) DEFAULT NULL COMMENT '来源url',
  `description` varchar(100) DEFAULT NULL COMMENT '简述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `title_color` varchar(15) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) unsigned DEFAULT '0' COMMENT '是否加粗',
  `title_pic` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_pic` varchar(100) DEFAULT NULL COMMENT '内容图',
  `type_pic` varchar(100) DEFAULT NULL COMMENT '类型图',
  `link` varchar(45) DEFAULT NULL COMMENT '外链',
  `temp` varchar(45) DEFAULT NULL COMMENT '模版',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `orderlist` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`),
  KEY `FK_content_1` (`channel_id`),
  KEY `FK_content_2` (`type_id`),
  KEY `FK_content_3` (`manager_id`),
  CONSTRAINT `FK_content_1` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`),
  CONSTRAINT `FK_content_2` FOREIGN KEY (`type_id`) REFERENCES `content_type` (`id`),
  CONSTRAINT `FK_content_3` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容表';

--
-- Dumping data for table `content`
--

/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;


--
-- Definition of table `content_attachment`
--

DROP TABLE IF EXISTS `content_attachment`;
CREATE TABLE `content_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `model_id` int(11) DEFAULT NULL,
  `path` varchar(45) DEFAULT NULL COMMENT '路径新文件名',
  `name` varchar(45) DEFAULT NULL COMMENT '附件名',
  `mime` varchar(45) DEFAULT NULL COMMENT 'mime类型',
  `filename` varchar(45) DEFAULT NULL COMMENT '旧文件名',
  `orderlist` int(2) unsigned DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `FK_content_attachment_1` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='CMS内容附件表';

--
-- Dumping data for table `content_attachment`
--

/*!40000 ALTER TABLE `content_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_attachment` ENABLE KEYS */;


--
-- Definition of table `content_picture`
--

DROP TABLE IF EXISTS `content_picture`;
CREATE TABLE `content_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `model_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '旧文件名',
  `path` varchar(45) DEFAULT NULL COMMENT '新文件名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `order_list` int(2) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `FK_content_picture_1` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='CMS内容图片表';

--
-- Dumping data for table `content_picture`
--

/*!40000 ALTER TABLE `content_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_picture` ENABLE KEYS */;


--
-- Definition of table `content_tags`
--

DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE `content_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `tag_id` int(10) unsigned DEFAULT NULL COMMENT 'tag id',
  `model_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_content_tags_1` (`content_id`),
  KEY `FK_content_tags_2` (`tag_id`),
  KEY `FK_content_tags_3` (`model_id`),
  CONSTRAINT `FK_content_tags_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`),
  CONSTRAINT `FK_content_tags_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `FK_content_tags_3` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容标标签关系';

--
-- Dumping data for table `content_tags`
--

/*!40000 ALTER TABLE `content_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_tags` ENABLE KEYS */;


--
-- Definition of table `content_topic`
--

DROP TABLE IF EXISTS `content_topic`;
CREATE TABLE `content_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `topic_id` int(10) unsigned DEFAULT NULL COMMENT '专题id',
  `model_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_content_topic_1` (`content_id`),
  KEY `FK_content_topic_2` (`topic_id`),
  KEY `FK_content_topic_3` (`model_id`),
  CONSTRAINT `FK_content_topic_1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`),
  CONSTRAINT `FK_content_topic_2` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  CONSTRAINT `FK_content_topic_3` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容和专题关系表';

--
-- Dumping data for table `content_topic`
--

/*!40000 ALTER TABLE `content_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_topic` ENABLE KEYS */;


--
-- Definition of table `content_txt`
--

DROP TABLE IF EXISTS `content_txt`;
CREATE TABLE `content_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `txt` mediumtext,
  `txt_pics` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`content_id`),
  CONSTRAINT `contnet_txt_fk` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容的内容';

--
-- Dumping data for table `content_txt`
--

/*!40000 ALTER TABLE `content_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_txt` ENABLE KEYS */;


--
-- Definition of table `content_type`
--

DROP TABLE IF EXISTS `content_type`;
CREATE TABLE `content_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '类型名字',
  `pic_width` int(10) unsigned DEFAULT NULL COMMENT '类型图宽',
  `pic_height` int(10) unsigned DEFAULT NULL COMMENT '类型图高',
  `has_pic` int(1) unsigned DEFAULT '1' COMMENT '0没有1有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容类型';

--
-- Dumping data for table `content_type`
--

/*!40000 ALTER TABLE `content_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_type` ENABLE KEYS */;


--
-- Definition of table `down`
--

DROP TABLE IF EXISTS `down`;
CREATE TABLE `down` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  `type_id` int(10) unsigned DEFAULT NULL COMMENT '类型id',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `title` varchar(85) DEFAULT NULL COMMENT '标题',
  `tags` varchar(45) DEFAULT NULL COMMENT '标签',
  `author` varchar(25) DEFAULT NULL COMMENT '作者',
  `origin` varchar(25) DEFAULT '转载' COMMENT '来原',
  `origin_url` varchar(45) DEFAULT NULL COMMENT '来源url',
  `description` varchar(100) DEFAULT NULL COMMENT '简述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `title_color` varchar(15) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) unsigned DEFAULT '0' COMMENT '是否加粗',
  `title_pic` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_pic` varchar(100) DEFAULT NULL COMMENT '内容图',
  `type_pic` varchar(100) DEFAULT NULL COMMENT '类型图',
  `link` varchar(45) DEFAULT NULL COMMENT '外链',
  `temp` varchar(45) DEFAULT NULL COMMENT '模版',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `orderlist` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`),
  KEY `FK_content_1` (`channel_id`),
  KEY `FK_content_2` (`type_id`),
  KEY `FK_content_3` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容表';

--
-- Dumping data for table `down`
--

/*!40000 ALTER TABLE `down` DISABLE KEYS */;
/*!40000 ALTER TABLE `down` ENABLE KEYS */;


--
-- Definition of table `down_txt`
--

DROP TABLE IF EXISTS `down_txt`;
CREATE TABLE `down_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `txt` mediumtext,
  `txt_pics` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`content_id`),
  CONSTRAINT `FK_down_txt_1` FOREIGN KEY (`content_id`) REFERENCES `down` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容的内容';

--
-- Dumping data for table `down_txt`
--

/*!40000 ALTER TABLE `down_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `down_txt` ENABLE KEYS */;


--
-- Definition of table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_id` int(10) unsigned DEFAULT NULL COMMENT '内容id',
  `name` varchar(45) DEFAULT NULL COMMENT '文件名',
  `path` varchar(45) DEFAULT NULL COMMENT '文个路径',
  `isvalid` tinyint(1) unsigned DEFAULT '1' COMMENT '是否可用',
  `model_id` int(10) unsigned DEFAULT NULL COMMENT 'model_id',
  PRIMARY KEY (`id`),
  KEY `FK_files_1` (`model_id`),
  CONSTRAINT `FK_files_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容中文件';

--
-- Dumping data for table `files`
--

/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;


--
-- Definition of table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sitename` varchar(45) DEFAULT NULL COMMENT '网站名',
  `linkurl` varchar(45) DEFAULT NULL COMMENT '链接url',
  `logo` varchar(45) DEFAULT NULL COMMENT '图片路径',
  `orderlist` int(2) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='友情链接';

--
-- Dumping data for table `links`
--

/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;


--
-- Definition of table `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email` varchar(45) NOT NULL COMMENT 'email',
  `passwd` varchar(45) NOT NULL COMMENT '密码',
  `lastip` varchar(45) DEFAULT NULL COMMENT '最后ip',
  `lasttime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `activation` int(1) unsigned DEFAULT '0' COMMENT '激活状态',
  `purview` varchar(45) DEFAULT '10000000000000000000000000000' COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk COMMENT='管理员表';

--
-- Dumping data for table `manager`
--

/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` (`id`,`email`,`passwd`,`lastip`,`lasttime`,`activation`,`purview`) VALUES 
 (1,'info@redwww.com','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,0,'10000000000000000000000000000');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;


--
-- Definition of table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(25) NOT NULL COMMENT '名字',
  `description` varchar(45) DEFAULT NULL COMMENT '描述',
  `index_temp` varchar(45) DEFAULT NULL COMMENT '首页模版',
  `list_temp` varchar(45) DEFAULT NULL COMMENT '列表模版',
  `content_temp` varchar(45) DEFAULT NULL COMMENT '内容模版',
  `is_def` int(1) unsigned DEFAULT '0' COMMENT '是否默认',
  `title_width` int(10) unsigned DEFAULT NULL COMMENT '标题图宽度',
  `title_height` int(10) unsigned DEFAULT NULL COMMENT '标题图高度',
  `content_width` int(10) unsigned DEFAULT NULL COMMENT '内容图宽',
  `content_height` int(10) unsigned DEFAULT NULL COMMENT '内容图高',
  `table_name` varchar(45) NOT NULL COMMENT '表名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk COMMENT='模型表';

--
-- Dumping data for table `model`
--

/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` (`id`,`name`,`description`,`index_temp`,`list_temp`,`content_temp`,`is_def`,`title_width`,`title_height`,`content_width`,`content_height`,`table_name`) VALUES 
 (1,'新闻1','新闻1','new_index.jsp','new_list.jsp','new_content.jsp',1,280,160,310,120,'news'),
 (2,'图片','图片','pic_index.jsp','pic_list.jsp','pic_content.jsp',0,140,80,310,120,'pic'),
 (3,'下载','下载','new_index.jsp','new_list.jsp','new_content.jsp',0,140,80,310,120,'down');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;


--
-- Definition of table `model_item`
--

DROP TABLE IF EXISTS `model_item`;
CREATE TABLE `model_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned DEFAULT NULL COMMENT '模型id',
  `name` varchar(25) NOT NULL COMMENT '字段名',
  `label` varchar(25) NOT NULL COMMENT '字段显示名称',
  `orderlist` int(2) unsigned DEFAULT '10' COMMENT '排序',
  `def_value` varchar(45) DEFAULT NULL COMMENT '默认值',
  PRIMARY KEY (`id`),
  KEY `FK_model_item_1` (`model_id`),
  CONSTRAINT `FK_model_item_1` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=gbk COMMENT='模型字段表';

--
-- Dumping data for table `model_item`
--

/*!40000 ALTER TABLE `model_item` DISABLE KEYS */;
INSERT INTO `model_item` (`id`,`model_id`,`name`,`label`,`orderlist`,`def_value`) VALUES 
 (1,1,'type_id','内容类别',10,''),
 (2,1,'title','标题',10,''),
 (3,1,'tags','标签',10,''),
 (4,1,'author','作者',10,'管理员'),
 (5,1,'origin','来源',10,'原创'),
 (6,1,'origin_url','来源url',10,''),
 (7,1,'description','描述',10,''),
 (8,1,'title_color','标题颜色',10,''),
 (9,1,'is_bold','标题加粗',10,''),
 (10,1,'title_pic','标题图',10,''),
 (11,1,'content_pic','内容图',10,''),
 (12,1,'type_pic','类别图',10,''),
 (13,1,'link','外链',10,''),
 (14,1,'temp','模版',10,''),
 (15,1,'status','状态',10,''),
 (16,1,'orderlist','排序',10,''),
 (17,1,'is_recommend','推荐',10,''),
 (18,1,'txt','内容',10,''),
 (19,2,'type_id','内容类别',10,''),
 (20,2,'title','标题',10,''),
 (21,2,'tags','标签',10,''),
 (22,2,'author','作者',10,''),
 (23,2,'origin','来源',10,'原创'),
 (24,2,'origin_url','来源url',10,''),
 (25,2,'description','描述',10,''),
 (26,2,'title_pic','标题颜色',10,''),
 (27,2,'content_pic','标题加粗',10,''),
 (28,2,'type_pic','标题图',10,''),
 (29,2,'title_color','内容类别',10,''),
 (30,2,'is_bold','标题',10,'');
/*!40000 ALTER TABLE `model_item` ENABLE KEYS */;


--
-- Definition of table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  `type_id` int(10) unsigned DEFAULT NULL COMMENT '类型id',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `title` varchar(85) DEFAULT NULL COMMENT '标题',
  `tags` varchar(45) DEFAULT NULL COMMENT '标签',
  `author` varchar(25) DEFAULT NULL COMMENT '作者',
  `origin` varchar(25) DEFAULT '转载' COMMENT '来原',
  `origin_url` varchar(45) DEFAULT NULL COMMENT '来源url',
  `description` varchar(100) DEFAULT NULL COMMENT '简述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `title_color` varchar(15) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) unsigned DEFAULT '0' COMMENT '是否加粗',
  `title_pic` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_pic` varchar(100) DEFAULT NULL COMMENT '内容图',
  `type_pic` varchar(100) DEFAULT NULL COMMENT '类型图',
  `link` varchar(45) DEFAULT NULL COMMENT '外链',
  `temp` varchar(45) DEFAULT NULL COMMENT '模版',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `orderlist` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`),
  KEY `FK_content_1` (`channel_id`),
  KEY `FK_content_2` (`type_id`),
  KEY `FK_content_3` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容表';

--
-- Dumping data for table `news`
--

/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


--
-- Definition of table `news_txt`
--

DROP TABLE IF EXISTS `news_txt`;
CREATE TABLE `news_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `txt` mediumtext,
  `txt_pics` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`content_id`),
  CONSTRAINT `FK_news_txt_1` FOREIGN KEY (`content_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容的内容';

--
-- Dumping data for table `news_txt`
--

/*!40000 ALTER TABLE `news_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_txt` ENABLE KEYS */;


--
-- Definition of table `pic`
--

DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目id',
  `type_id` int(10) unsigned DEFAULT NULL COMMENT '类型id',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `title` varchar(85) DEFAULT NULL COMMENT '标题',
  `tags` varchar(45) DEFAULT NULL COMMENT '标签',
  `author` varchar(25) DEFAULT NULL COMMENT '作者',
  `origin` varchar(25) DEFAULT '转载' COMMENT '来原',
  `origin_url` varchar(45) DEFAULT NULL COMMENT '来源url',
  `description` varchar(100) DEFAULT NULL COMMENT '简述',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `title_color` varchar(15) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) unsigned DEFAULT '0' COMMENT '是否加粗',
  `title_pic` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_pic` varchar(100) DEFAULT NULL COMMENT '内容图',
  `type_pic` varchar(100) DEFAULT NULL COMMENT '类型图',
  `link` varchar(45) DEFAULT NULL COMMENT '外链',
  `temp` varchar(45) DEFAULT NULL COMMENT '模版',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站)',
  `orderlist` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`),
  KEY `FK_content_1` (`channel_id`),
  KEY `FK_content_2` (`type_id`),
  KEY `FK_content_3` (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容表';

--
-- Dumping data for table `pic`
--

/*!40000 ALTER TABLE `pic` DISABLE KEYS */;
/*!40000 ALTER TABLE `pic` ENABLE KEYS */;


--
-- Definition of table `pic_txt`
--

DROP TABLE IF EXISTS `pic_txt`;
CREATE TABLE `pic_txt` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `txt` mediumtext,
  `txt_pics` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Index_2` (`content_id`),
  CONSTRAINT `FK_pic_txt_1` FOREIGN KEY (`content_id`) REFERENCES `pic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='内容的内容';

--
-- Dumping data for table `pic_txt`
--

/*!40000 ALTER TABLE `pic_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `pic_txt` ENABLE KEYS */;


--
-- Definition of table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(45) NOT NULL COMMENT 'tag名',
  `counter` int(10) unsigned DEFAULT NULL COMMENT '计数',
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_content_tag_1` FOREIGN KEY (`id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='CMS的tag';

--
-- Dumping data for table `tags`
--

/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


--
-- Definition of table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `channel_id` int(10) unsigned DEFAULT NULL COMMENT '栏目 id',
  `name` varchar(100) DEFAULT NULL COMMENT '专题名',
  `short_name` varchar(100) DEFAULT NULL COMMENT '简述',
  `keywords` varchar(100) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_pic` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_pic` varchar(100) DEFAULT NULL COMMENT '内容图',
  `temp` varchar(100) DEFAULT NULL COMMENT '模版',
  `orderlist` int(2) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='专题';

--
-- Dumping data for table `topic`
--

/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
