/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.12-log : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `blog`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 广告',6,'add_ad'),(17,'Can change 广告',6,'change_ad'),(18,'Can delete 广告',6,'delete_ad'),(19,'Can add 链接',7,'add_links'),(20,'Can change 链接',7,'change_links'),(21,'Can delete 链接',7,'delete_links'),(22,'Can add 分类',8,'add_category'),(23,'Can change 分类',8,'change_category'),(24,'Can delete 分类',8,'delete_category'),(25,'Can add 文章',9,'add_article'),(26,'Can change 文章',9,'change_article'),(27,'Can delete 文章',9,'delete_article'),(28,'Can add 评论',10,'add_comment'),(29,'Can change 评论',10,'change_comment'),(30,'Can delete 评论',10,'delete_comment'),(31,'Can add 用户',11,'add_user'),(32,'Can change 用户',11,'change_user'),(33,'Can delete 用户',11,'delete_user'),(34,'Can add 标签',12,'add_tag'),(35,'Can change 标签',12,'change_tag'),(36,'Can delete 标签',12,'delete_tag');

/*Table structure for table `blog_ad` */

DROP TABLE IF EXISTS `blog_ad`;

CREATE TABLE `blog_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(200) COLLATE utf8_bin NOT NULL,
  `image_url` varchar(100) COLLATE utf8_bin NOT NULL,
  `callback_url` varchar(200) COLLATE utf8_bin NOT NULL,
  `date_publish` datetime(6) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_ad` */

insert  into `blog_ad`(`id`,`title`,`description`,`image_url`,`callback_url`,`date_publish`,`index`) values (1,'百事可乐','百事可乐','ad/2017/01/a.jpg','abc','2017-01-03 03:01:14.732000',999);

/*Table structure for table `blog_article` */

DROP TABLE IF EXISTS `blog_article`;

CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `desc` varchar(50) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `click_count` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `date_publish` datetime(6) NOT NULL,
  `category_id` int(11),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  KEY `blog_article_user_id_5beb0cc1_fk_blog_user_id` (`user_id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_user_id_5beb0cc1_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_article` */

insert  into `blog_article`(`id`,`title`,`desc`,`content`,`click_count`,`is_recommend`,`date_publish`,`category_id`,`user_id`) values (1,'住在手机里的朋友','住在手机里的朋友','通信时代，无论是初次相见还是老友重逢，交换联系方式，常常是彼此交换名片，然后郑重或是出于礼貌用手机记下对方的电话号码。在快节奏的生活里，我们不知不觉中就成为住在别人手机里的朋友。又因某些意外，变成了别人手机里匆忙的过客，这种快餐式的友谊 ...<embed src=\"/uploads/kindeditor/2017/1/fcb71a6e-d161-11e6-8b52-b0d59d347ef6.flv\" type=\"application/x-shockwave-flash\" width=\"550\" height=\"400\" autostart=\"true\" loop=\"true\" />',0,0,'2016-12-23 08:47:04.960000',1,1),(2,'教你怎样用欠费手机拨打电话','教你怎样用欠费手机拨打电话','初次相识的喜悦，让你觉得似乎找到了知音。于是，对于投缘的人，开始了较频繁的交往。渐渐地，初识的喜悦退尽，接下来就是仅仅保持着联系，平淡到偶尔在节假曰发短信互致问候...',0,0,'2016-12-23 08:47:58.722000',1,1),(3,'原来以为，一个人的勇敢是，删掉他的手机号码...','原来以为，一个人的勇敢是，删掉他的手机号码...','<img src=\"/uploads/kindeditor/2017/1/18f4f0ae-d160-11e6-bfb1-b0d59d347ef6.png\" alt=\"\" />原来以为，一个人的勇敢是，删掉他的手机号码、QQ号码等等一切，努力和他保持距离。等着有一天，习惯不想念他，习惯他不在身边,习惯时间把他在我记忆里的身影磨蚀干净...',0,0,'2016-12-23 08:48:40.088000',1,1),(4,'豪雅手机正式发布! 在法国全手工打造的奢侈品','豪雅手机正式发布! 在法国全手工打造的奢侈品','现在跨界联姻，时尚、汽车以及运动品牌联合手机制造商联合发布手机产品在行业里已经不再新鲜，上周我们给大家报道过著名手表制造商瑞士泰格・豪雅（Tag Heuer） 联合法国的手机制造商Modelabs发布的一款奢华手机的部分谍照，而近日该手机终于被正式发布了...',20,1,'2016-12-23 09:09:35.114000',1,1);

/*Table structure for table `blog_article_tag` */

DROP TABLE IF EXISTS `blog_article_tag`;

CREATE TABLE `blog_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tag_article_id_818e752b_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tag_tag_id_f2afe66b_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tag_article_id_8db2395e_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tag_tag_id_f2afe66b_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_article_tag` */

insert  into `blog_article_tag`(`id`,`article_id`,`tag_id`) values (1,1,1),(2,2,1),(3,3,1),(4,4,1);

/*Table structure for table `blog_category` */

DROP TABLE IF EXISTS `blog_category`;

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_category` */

insert  into `blog_category`(`id`,`name`,`index`) values (1,'个人博客',2),(2,'首页',1),(3,'我的相册',3),(4,'学习笔记',4),(5,'留言板',5),(6,'音乐',6),(7,'生活点滴',7),(8,'编程生活',8),(9,'案例代码',9),(10,'Oracle',10);

/*Table structure for table `blog_comment` */

DROP TABLE IF EXISTS `blog_comment`;

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `username` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `date_publish` datetime(6) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `pid_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_article_id_3d58bca6_fk_blog_article_id` (`article_id`),
  KEY `blog_comment_pid_id_2a2b4cc4_fk_blog_comment_id` (`pid_id`),
  KEY `blog_comment_user_id_59a54155_fk_blog_user_id` (`user_id`),
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_comment_pid_id_2a2b4cc4_fk_blog_comment_id` FOREIGN KEY (`pid_id`) REFERENCES `blog_comment` (`id`),
  CONSTRAINT `blog_comment_user_id_59a54155_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_comment` */

/*Table structure for table `blog_links` */

DROP TABLE IF EXISTS `blog_links`;

CREATE TABLE `blog_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` varchar(200) COLLATE utf8_bin NOT NULL,
  `callback_url` varchar(200) COLLATE utf8_bin NOT NULL,
  `date_publish` datetime(6) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_links` */

/*Table structure for table `blog_tag` */

DROP TABLE IF EXISTS `blog_tag`;

CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_tag` */

insert  into `blog_tag`(`id`,`name`) values (1,'个人博客'),(2,'web开发'),(3,'python开发'),(4,'java开发'),(5,'Oracle'),(6,'CSS3'),(7,'HTML5'),(8,'JavaScript'),(9,'Bootstrap'),(10,'前端设计');

/*Table structure for table `blog_user` */

DROP TABLE IF EXISTS `blog_user`;

CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(20) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(11) COLLATE utf8_bin NOT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_user` */

insert  into `blog_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`,`avatar`,`qq`,`mobile`,`url`) values (1,'pbkdf2_sha256$30000$e5EHamFQaoGg$QtR9IDe+0UwQrjqwOqFsbzgq/2LnrC7IKlzTysdJnTE=','2017-01-03 02:17:28.623000',1,'admin','','','',1,1,'2016-12-23 07:26:52.304000','avatar/2016/12/it01.jpg','11111111','13800138000','');

/*Table structure for table `blog_user_groups` */

DROP TABLE IF EXISTS `blog_user_groups`;

CREATE TABLE `blog_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_user_groups_user_id_9046f296_uniq` (`user_id`,`group_id`),
  KEY `blog_user_groups_group_id_29990e74_fk_auth_group_id` (`group_id`),
  CONSTRAINT `blog_user_groups_group_id_29990e74_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `blog_user_groups_user_id_4e1acb48_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_user_groups` */

/*Table structure for table `blog_user_user_permissions` */

DROP TABLE IF EXISTS `blog_user_user_permissions`;

CREATE TABLE `blog_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_user_user_permissions_user_id_1d3c1311_uniq` (`user_id`,`permission_id`),
  KEY `blog_user_user_perm_permission_id_95ca6010_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `blog_user_user_perm_permission_id_95ca6010_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `blog_user_user_permissions_user_id_379a1502_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `blog_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_blog_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `blog_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2016-12-23 08:41:33.492000','1','个人博客',1,'[{\"added\": {}}]',12,1),(2,'2016-12-23 08:41:43.740000','2','web开发',1,'[{\"added\": {}}]',12,1),(3,'2016-12-23 08:41:49.951000','3','python开发',1,'[{\"added\": {}}]',12,1),(4,'2016-12-23 08:41:55.265000','4','java开发',1,'[{\"added\": {}}]',12,1),(5,'2016-12-23 08:41:59.889000','5','Oracle',1,'[{\"added\": {}}]',12,1),(6,'2016-12-23 08:42:30.661000','6','CSS3',1,'[{\"added\": {}}]',12,1),(7,'2016-12-23 08:42:35.580000','7','HTML5',1,'[{\"added\": {}}]',12,1),(8,'2016-12-23 08:42:44.567000','8','JavaScript',1,'[{\"added\": {}}]',12,1),(9,'2016-12-23 08:42:50.112000','9','Bootstrap',1,'[{\"added\": {}}]',12,1),(10,'2016-12-23 08:43:12.774000','10','前端设计',1,'[{\"added\": {}}]',12,1),(11,'2016-12-23 08:45:52.040000','1','个人博客',1,'[{\"added\": {}}]',8,1),(12,'2016-12-23 08:47:04.972000','1','住在手机里的朋友',1,'[{\"added\": {}}]',9,1),(13,'2016-12-23 08:47:58.733000','2','教你怎样用欠费手机拨打电话',1,'[{\"added\": {}}]',9,1),(14,'2016-12-23 08:48:40.098000','3','原来以为，一个人的勇敢是，删掉他的手机号码...',1,'[{\"added\": {}}]',9,1),(15,'2016-12-23 09:09:35.126000','4','豪雅手机正式发布! 在法国全手工打造的奢侈品',1,'[{\"added\": {}}]',9,1),(16,'2016-12-23 09:09:47.506000','4','豪雅手机正式发布! 在法国全手工打造的奢侈品',2,'[{\"changed\": {\"fields\": [\"click_count\"]}}]',9,1),(17,'2016-12-26 08:17:14.962000','1','admin',2,'[{\"changed\": {\"fields\": [\"password\", \"avatar\", \"mobile\", \"qq\"]}}]',11,1),(18,'2017-01-03 02:56:03.201000','3','原来以为，一个人的勇敢是，删掉他的手机号码...',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(19,'2017-01-03 03:01:14.734000','1','百事可乐',1,'[{\"added\": {}}]',6,1),(20,'2017-01-03 03:03:37.851000','1','住在手机里的朋友',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(21,'2017-01-03 03:10:05.254000','1','住在手机里的朋友',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(22,'2017-01-03 08:36:01.014000','2','首页',1,'[{\"added\": {}}]',8,1),(23,'2017-01-03 08:36:19.869000','3','我的相册',1,'[{\"added\": {}}]',8,1),(24,'2017-01-03 09:16:55.021000','8','编程生活',1,'[{\"added\": {}}]',8,1),(25,'2017-01-03 09:19:11.032000','9','案例代码',1,'[{\"added\": {}}]',8,1),(26,'2017-01-03 09:19:20.273000','10','Oracle',1,'[{\"added\": {}}]',8,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(6,'blog','ad'),(9,'blog','article'),(8,'blog','category'),(10,'blog','comment'),(7,'blog','links'),(12,'blog','tag'),(11,'blog','user'),(4,'contenttypes','contenttype'),(5,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2016-12-23 07:25:00.663000'),(2,'contenttypes','0002_remove_content_type_name','2016-12-23 07:25:00.747000'),(3,'auth','0001_initial','2016-12-23 07:25:00.985000'),(4,'auth','0002_alter_permission_name_max_length','2016-12-23 07:25:01.023000'),(5,'auth','0003_alter_user_email_max_length','2016-12-23 07:25:01.038000'),(6,'auth','0004_alter_user_username_opts','2016-12-23 07:25:01.052000'),(7,'auth','0005_alter_user_last_login_null','2016-12-23 07:25:01.066000'),(8,'auth','0006_require_contenttypes_0002','2016-12-23 07:25:01.076000'),(9,'auth','0007_alter_validators_add_error_messages','2016-12-23 07:25:01.091000'),(10,'auth','0008_alter_user_username_max_length','2016-12-23 07:25:01.105000'),(11,'blog','0001_initial','2016-12-23 07:25:01.892000'),(12,'admin','0001_initial','2016-12-23 07:25:02.052000'),(13,'admin','0002_logentry_remove_auto_add','2016-12-23 07:25:02.075000'),(14,'sessions','0001_initial','2016-12-23 07:25:02.110000');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('8fvm96uswap1iaqfhnrarx5xw52w15ww','NmJkMmJkYjgxZGE4MDlhZWQ1OWQ1MDM4NTI0MmM4OWMwMzFmMTZjOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImZhMjQzYzE0NDRkMjc4YjI1MTZiYWVlNzU2NWI1YjdhYWI3MmJhNGQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-17 02:17:28.632000'),('mh13tvvavucn7dg8055gzz7m1vn26ga4','OTBlNmYxYzBiOTY5YTY2OTk5YjAyYzJhYmVhZTQ0ODc5OWZkNDg3ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQwNWZiMTY1ZDE5OGMxYjdmN2NmOGQ0MjI3NjZlYTBiMjI2NzkzMGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-01-09 08:19:08.913000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
