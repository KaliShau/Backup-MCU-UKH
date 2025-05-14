/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: joomla_db
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `amtf3_action_log_config`
--

DROP TABLE IF EXISTS `amtf3_action_log_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_action_log_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `id_holder` varchar(255) DEFAULT NULL,
  `title_holder` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `text_prefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_action_log_config`
--

LOCK TABLES `amtf3_action_log_config` WRITE;
/*!40000 ALTER TABLE `amtf3_action_log_config` DISABLE KEYS */;
INSERT INTO `amtf3_action_log_config` VALUES
(1,'article','com_content.article','id','title','#__content','PLG_ACTIONLOG_JOOMLA'),
(2,'article','com_content.form','id','title','#__content','PLG_ACTIONLOG_JOOMLA'),
(3,'banner','com_banners.banner','id','name','#__banners','PLG_ACTIONLOG_JOOMLA'),
(4,'user_note','com_users.note','id','subject','#__user_notes','PLG_ACTIONLOG_JOOMLA'),
(5,'media','com_media.file','','name','','PLG_ACTIONLOG_JOOMLA'),
(6,'category','com_categories.category','id','title','#__categories','PLG_ACTIONLOG_JOOMLA'),
(7,'menu','com_menus.menu','id','title','#__menu_types','PLG_ACTIONLOG_JOOMLA'),
(8,'menu_item','com_menus.item','id','title','#__menu','PLG_ACTIONLOG_JOOMLA'),
(9,'newsfeed','com_newsfeeds.newsfeed','id','name','#__newsfeeds','PLG_ACTIONLOG_JOOMLA'),
(10,'link','com_redirect.link','id','old_url','#__redirect_links','PLG_ACTIONLOG_JOOMLA'),
(11,'tag','com_tags.tag','id','title','#__tags','PLG_ACTIONLOG_JOOMLA'),
(12,'style','com_templates.style','id','title','#__template_styles','PLG_ACTIONLOG_JOOMLA'),
(13,'plugin','com_plugins.plugin','extension_id','name','#__extensions','PLG_ACTIONLOG_JOOMLA'),
(14,'component_config','com_config.component','extension_id','name','','PLG_ACTIONLOG_JOOMLA'),
(15,'contact','com_contact.contact','id','name','#__contact_details','PLG_ACTIONLOG_JOOMLA'),
(16,'module','com_modules.module','id','title','#__modules','PLG_ACTIONLOG_JOOMLA'),
(17,'access_level','com_users.level','id','title','#__viewlevels','PLG_ACTIONLOG_JOOMLA'),
(18,'banner_client','com_banners.client','id','name','#__banner_clients','PLG_ACTIONLOG_JOOMLA'),
(19,'application_config','com_config.application','','name','','PLG_ACTIONLOG_JOOMLA'),
(20,'task','com_scheduler.task','id','title','#__scheduler_tasks','PLG_ACTIONLOG_JOOMLA'),
(21,'field','com_fields.field','id','title','#__fields','PLG_ACTIONLOG_JOOMLA'),
(22,'guidedtour','com_guidedtours.state','id','title','#__guidedtours','PLG_ACTIONLOG_JOOMLA'),
(23,'contact','com_contact.form','id','name','#__contact_details','PLG_ACTIONLOG_JOOMLA');
/*!40000 ALTER TABLE `amtf3_action_log_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_action_logs`
--

DROP TABLE IF EXISTS `amtf3_action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_action_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_language_key` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `log_date` datetime NOT NULL,
  `extension` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `ip_address` varchar(40) NOT NULL DEFAULT '0.0.0.0',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  KEY `idx_user_id_extension` (`user_id`,`extension`),
  KEY `idx_extension_item_id` (`extension`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=579 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_action_logs`
--

LOCK TABLES `amtf3_action_logs` WRITE;
/*!40000 ALTER TABLE `amtf3_action_logs` DISABLE KEYS */;
INSERT INTO `amtf3_action_logs` VALUES
(1,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-12 08:27:33','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(2,'PLG_ACTIONLOG_JOOMLA_GUIDEDTOURS_TOURSKIPPED','{\"id\":12,\"title\":\"Welcome to Joomla!\",\"state\":\"skipped\",\"step\":1,\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:27:37','com_guidedtours.state',302,12,'COM_ACTIONLOGS_DISABLED'),
(3,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LANGUAGE\",\"id\":246,\"name\":\"Russian (ru-RU)\",\"extension_name\":\"Russian (ru-RU)\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:28:02','com_installer',302,246,'COM_ACTIONLOGS_DISABLED'),
(4,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LANGUAGE\",\"id\":247,\"name\":\"Russian (ru-RU)\",\"extension_name\":\"Russian (ru-RU)\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:28:02','com_installer',302,247,'COM_ACTIONLOGS_DISABLED'),
(5,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LANGUAGE\",\"id\":248,\"name\":\"Russian (ru-RU)\",\"extension_name\":\"Russian (ru-RU)\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:28:02','com_installer',302,248,'COM_ACTIONLOGS_DISABLED'),
(6,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE\",\"id\":249,\"name\":\"Russian (ru-RU) Language Pack\",\"extension_name\":\"Russian (ru-RU) Language Pack\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:28:02','com_installer',302,249,'COM_ACTIONLOGS_DISABLED'),
(7,'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":251,\"name\":\"System - Helix Ultimate Framework\",\"extension_name\":\"System - Helix Ultimate Framework\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:28:54','com_installer',302,251,'COM_ACTIONLOGS_DISABLED'),
(8,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_TEMPLATE\",\"id\":252,\"name\":\"shaper_helixultimate\",\"extension_name\":\"shaper_helixultimate\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:28:54','com_installer',302,252,'COM_ACTIONLOGS_DISABLED'),
(9,'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":250,\"name\":\"Helix Ultimate based template installer\",\"extension_name\":\"Helix Ultimate based template installer\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:28:54','com_installer',302,250,'COM_ACTIONLOGS_DISABLED'),
(10,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:29:28','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(11,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER_GROUP\",\"id\":4,\"title\":\"Editor\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:29:43','com_users',302,4,'COM_ACTIONLOGS_DISABLED'),
(12,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER_GROUP\",\"id\":10,\"title\":\"Client\",\"itemlink\":\"index.php?option=com_users&task=group.edit&id=10\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:29:52','com_users',302,10,'COM_ACTIONLOGS_DISABLED'),
(13,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER_GROUP\",\"id\":\"3\",\"title\":\"Operator\",\"itemlink\":\"index.php?option=com_users&task=group.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:30:03','com_users',302,3,'COM_ACTIONLOGS_DISABLED'),
(14,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Registered\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:30:29','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(15,'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":22,\"title\":\"com_users\",\"extension_name\":\"com_users\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=22\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:32:16','com_config.component',302,22,'COM_ACTIONLOGS_DISABLED'),
(16,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":303,\"title\":\"User\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=303\",\"userid\":303,\"username\":\"User\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=303\"}','2025-05-12 08:33:16','com_users',303,303,'COM_ACTIONLOGS_DISABLED'),
(17,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":304,\"title\":\"User\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=304\",\"userid\":304,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=304\"}','2025-05-12 08:33:42','com_users',304,304,'COM_ACTIONLOGS_DISABLED'),
(18,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":304,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=304\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 08:34:32','com_users',304,0,'COM_ACTIONLOGS_DISABLED'),
(19,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":303,\"title\":\"User\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:35:00','com_users',302,303,'COM_ACTIONLOGS_DISABLED'),
(20,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":304,\"title\":\"User\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:35:00','com_users',302,304,'COM_ACTIONLOGS_DISABLED'),
(21,'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":22,\"title\":\"com_users\",\"extension_name\":\"com_users\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=22\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 08:35:19','com_config.component',302,22,'COM_ACTIONLOGS_DISABLED'),
(22,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":305,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=305\",\"userid\":305,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=305\"}','2025-05-12 08:35:35','com_users',305,305,'COM_ACTIONLOGS_DISABLED'),
(23,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":305,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=305\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 08:35:46','com_users',305,0,'COM_ACTIONLOGS_DISABLED'),
(24,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":305,\"userid\":305,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=305\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 08:36:41','com_users',305,305,'COM_ACTIONLOGS_DISABLED'),
(25,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 08:56:50','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(26,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":302,\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 08:57:58','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(27,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU\",\"id\":2,\"title\":\"Auth\",\"itemlink\":\"index.php?option=com_menus&task=menu.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:09:45','com_menus.menu',302,2,'COM_ACTIONLOGS_DISABLED'),
(28,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":102,\"title\":\"Login\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=102\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:10:12','com_menus.item',302,102,'COM_ACTIONLOGS_DISABLED'),
(29,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":103,\"title\":\"Register\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=103\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:10:33','com_menus.item',302,103,'COM_ACTIONLOGS_DISABLED'),
(30,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:10:56','com_menus.item',302,104,'COM_ACTIONLOGS_DISABLED'),
(31,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:11:59','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(32,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:11:59','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(33,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:11:59','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(34,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":102,\"title\":\"Login\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=102\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:11:59','com_menus.item',302,102,'COM_ACTIONLOGS_DISABLED'),
(35,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":103,\"title\":\"Register\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=103\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:11:59','com_menus.item',302,103,'COM_ACTIONLOGS_DISABLED'),
(36,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:11:59','com_menus.item',302,104,'COM_ACTIONLOGS_DISABLED'),
(37,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU\",\"id\":2,\"title\":\"Auth\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:12:06','com_menus.menu',302,2,'COM_ACTIONLOGS_DISABLED'),
(38,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":105,\"title\":\"Login\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=105\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:12:35','com_menus.item',302,105,'COM_ACTIONLOGS_DISABLED'),
(39,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":106,\"title\":\"Register\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=106\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:13:07','com_menus.item',302,106,'COM_ACTIONLOGS_DISABLED'),
(40,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:13:57','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(41,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":106,\"title\":\"Register\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=106\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:13:57','com_menus.item',302,106,'COM_ACTIONLOGS_DISABLED'),
(42,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":107,\"title\":\"Signout\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=107\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:14:40','com_menus.item',302,107,'COM_ACTIONLOGS_DISABLED'),
(43,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 09:15:09','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(44,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:15:38','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(45,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Special\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:16:18','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(46,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:17:05','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(47,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":107,\"title\":\"Signout\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=107\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:17:05','com_menus.item',302,107,'COM_ACTIONLOGS_DISABLED'),
(48,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:17:06','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(49,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:17:06','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(50,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:18:45','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(51,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:18:45','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(52,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:18:56','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(53,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:18:56','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(54,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:19:22','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(55,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":107,\"title\":\"Signout\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=107\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:19:22','com_menus.item',302,107,'COM_ACTIONLOGS_DISABLED'),
(56,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:19:33','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(57,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":107,\"title\":\"Signout\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=107\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:19:33','com_menus.item',302,107,'COM_ACTIONLOGS_DISABLED'),
(58,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":105,\"title\":\"\\u0412\\u0445\\u043e\\u0434\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=105\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:20:00','com_menus.item',302,105,'COM_ACTIONLOGS_DISABLED'),
(59,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:20:00','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(60,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:20:12','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(61,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":106,\"title\":\"\\u0420\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=106\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:20:22','com_menus.item',302,106,'COM_ACTIONLOGS_DISABLED'),
(62,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:20:22','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(63,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:20:27','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(64,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:20:38','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(65,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:20:38','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(66,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:20:45','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(67,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:20:45','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(68,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:21:03','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(69,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:21:03','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(70,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:21:08','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(71,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:21:08','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(72,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:21:16','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(73,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:21:16','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(74,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"LogOut\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:21:29','com_menus.item',302,108,'COM_ACTIONLOGS_DISABLED'),
(75,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":107,\"title\":\"\\u0412\\u044b\\u0445\\u043e\\u0434\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=107\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:21:40','com_menus.item',302,107,'COM_ACTIONLOGS_DISABLED'),
(76,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:21:40','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(77,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":302,\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 09:21:44','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(78,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 09:21:57','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(79,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LIBRARY\",\"id\":253,\"name\":\"Chrono Library\",\"extension_name\":\"Chrono Library\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:28:59','com_installer',302,253,'COM_ACTIONLOGS_DISABLED'),
(80,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":254,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:28:59','com_installer',302,254,'COM_ACTIONLOGS_DISABLED'),
(81,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE\",\"id\":255,\"name\":\"ChronoForms8 Package\",\"extension_name\":\"ChronoForms8 Package\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:28:59','com_installer',302,255,'COM_ACTIONLOGS_DISABLED'),
(82,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LIBRARY\",\"id\":256,\"name\":\"Chrono Library\",\"extension_name\":\"Chrono Library\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:38:00','com_installer',302,256,'COM_ACTIONLOGS_DISABLED'),
(83,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":254,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:38:00','com_installer',302,254,'COM_ACTIONLOGS_DISABLED'),
(84,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE\",\"id\":255,\"name\":\"ChronoForms8 Package\",\"extension_name\":\"ChronoForms8 Package\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:38:00','com_installer',302,255,'COM_ACTIONLOGS_DISABLED'),
(85,'PLG_ACTIONLOG_JOOMLA_EXTENSION_UNINSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":254,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:38:39','com_installer',302,254,'COM_ACTIONLOGS_DISABLED'),
(86,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LIBRARY\",\"id\":257,\"name\":\"Chrono Library\",\"extension_name\":\"Chrono Library\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:39:02','com_installer',302,257,'COM_ACTIONLOGS_DISABLED'),
(87,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":258,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:39:02','com_installer',302,258,'COM_ACTIONLOGS_DISABLED'),
(88,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE\",\"id\":255,\"name\":\"ChronoForms8 Package\",\"extension_name\":\"ChronoForms8 Package\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:39:02','com_installer',302,255,'COM_ACTIONLOGS_DISABLED'),
(89,'PLG_ACTIONLOG_JOOMLA_EXTENSION_UNINSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":258,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:39:56','com_installer',302,258,'COM_ACTIONLOGS_DISABLED'),
(90,'PLG_ACTIONLOG_JOOMLA_EXTENSION_UNINSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":255,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:39:56','com_installer',302,255,'COM_ACTIONLOGS_DISABLED'),
(91,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LIBRARY\",\"id\":259,\"name\":\"Chrono Library\",\"extension_name\":\"Chrono Library\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:40:49','com_installer',302,259,'COM_ACTIONLOGS_DISABLED'),
(92,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":260,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:40:49','com_installer',302,260,'COM_ACTIONLOGS_DISABLED'),
(93,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE\",\"id\":261,\"name\":\"ChronoForms8 Package\",\"extension_name\":\"ChronoForms8 Package\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:40:49','com_installer',302,261,'COM_ACTIONLOGS_DISABLED'),
(94,'PLG_ACTIONLOG_JOOMLA_EXTENSION_UNINSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":260,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:42:21','com_installer',302,260,'COM_ACTIONLOGS_DISABLED'),
(95,'PLG_ACTIONLOG_JOOMLA_EXTENSION_UNINSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":261,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:42:21','com_installer',302,261,'COM_ACTIONLOGS_DISABLED'),
(96,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_LIBRARY\",\"id\":262,\"name\":\"Chrono Library\",\"extension_name\":\"Chrono Library\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:42:39','com_installer',302,262,'COM_ACTIONLOGS_DISABLED'),
(97,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":263,\"name\":\"ChronoForms8\",\"extension_name\":\"ChronoForms8\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:42:39','com_installer',302,263,'COM_ACTIONLOGS_DISABLED'),
(98,'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED','{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PACKAGE\",\"id\":264,\"name\":\"ChronoForms8 Package\",\"extension_name\":\"ChronoForms8 Package\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:42:39','com_installer',302,264,'COM_ACTIONLOGS_DISABLED'),
(99,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":302,\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 09:46:31','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(100,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":1,\"title\":\"Main Menu\",\"extension_name\":\"Main Menu\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 09:55:11','com_modules.module',302,1,'COM_ACTIONLOGS_DISABLED'),
(101,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-12 09:55:11','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(102,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 09:57:13','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(103,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Obrazec.pdf\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:03:17','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(104,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:07:59','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(105,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":1,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:09:29','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(106,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:09:40','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(107,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:10:26','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(108,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:10:56','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(109,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:10:56','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(110,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:11:23','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(111,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:11:23','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(112,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:11:39','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(113,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:11:39','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(114,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:12:09','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(115,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:12:09','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(116,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:12:36','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(117,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:13:12','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(118,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:13:12','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(119,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:14:02','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(120,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:14:02','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(121,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:15:06','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(122,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:15:17','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(123,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":1,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:15:17','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(124,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":1,\"title\":\"Example\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:15:26','com_content.article',302,1,'COM_ACTIONLOGS_DISABLED'),
(125,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_BANNER\",\"id\":1,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_banners&task=banner.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:17:24','com_banners.banner',302,1,'COM_ACTIONLOGS_DISABLED'),
(126,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__banners\"}','2025-05-12 10:18:04','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(127,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__banners\"}','2025-05-12 10:18:07','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(128,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_BANNER\",\"id\":1,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_banners&task=banner.edit&id=1\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:18:07','com_banners.banner',302,1,'COM_ACTIONLOGS_DISABLED'),
(129,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":2,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:19:22','com_content.article',302,2,'COM_ACTIONLOGS_DISABLED'),
(130,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:19:40','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(131,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:19:51','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(132,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:20:00','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(133,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":2,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:20:00','com_content.article',302,2,'COM_ACTIONLOGS_DISABLED'),
(134,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:20:21','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(135,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:20:21','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(136,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"2\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:21:11','com_content.article',302,2,'COM_ACTIONLOGS_DISABLED'),
(137,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:22:29','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(138,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:22:48','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(139,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Screenshot From 2025-05-12 13-22-03.png\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:23:14','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(140,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":2,\"title\":\"Example\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:23:28','com_content.article',302,2,'COM_ACTIONLOGS_DISABLED'),
(141,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":3,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:23:59','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(142,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:24:14','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(143,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:24:14','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(144,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:24:18','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(145,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":3,\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:24:18','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(146,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:24:30','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(147,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 10:24:30','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(148,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:25:26','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(149,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:25:26','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(150,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:26:28','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(151,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:26:28','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(152,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:26:58','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(153,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:26:58','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(154,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Example\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:27:14','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(155,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:27:14','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(156,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:27:45','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(157,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:28:02','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(158,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:28:02','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(159,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:28:05','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(160,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:28:18','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(161,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:28:35','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(162,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:28:45','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(163,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:29:29','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(164,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:29:40','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(165,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:29:40','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(166,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:30:00','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(167,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:30:08','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(168,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:30:17','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(169,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:30:54','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(170,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:31:32','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(171,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:31:39','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(172,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:31:56','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(173,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:32:48','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(174,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:32:48','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(175,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:34:07','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(176,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 10:34:07','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(177,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 10:34:31','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(178,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-12 11:14:42','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(179,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 11:15:06','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(180,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:15:52','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(181,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 11:15:52','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(182,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 11:16:39','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(183,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:17:27','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(184,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 11:17:27','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(185,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 11:17:35','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(186,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:17:35','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(187,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:17:43','com_menus.item',302,114,'COM_ACTIONLOGS_DISABLED'),
(188,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":115,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=115\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:18:29','com_menus.item',302,115,'COM_ACTIONLOGS_DISABLED'),
(189,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 11:18:42','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(190,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":115,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=115\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:18:42','com_menus.item',302,115,'COM_ACTIONLOGS_DISABLED'),
(191,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 11:19:05','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(192,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-12 11:45:09','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(193,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:50:15','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(194,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":305,\"title\":\"useruseruser\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:50:38','com_users',302,305,'COM_ACTIONLOGS_DISABLED'),
(195,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":306,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\"}','2025-05-12 11:50:55','com_users',306,306,'COM_ACTIONLOGS_DISABLED'),
(196,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 11:51:16','com_users',306,0,'COM_ACTIONLOGS_DISABLED'),
(197,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Special\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:51:52','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(198,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":7,\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=7\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:52:16','com_users.level',302,7,'COM_ACTIONLOGS_DISABLED'),
(199,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":306,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:52:40','com_users',302,306,'COM_ACTIONLOGS_DISABLED'),
(200,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:53:05','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(201,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"7\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=7\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:53:49','com_users.level',302,7,'COM_ACTIONLOGS_DISABLED'),
(202,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 11:54:29','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(203,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":117,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=117\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:20:03','com_menus.item',302,117,'COM_ACTIONLOGS_DISABLED'),
(204,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:23:03','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(205,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 12:23:03','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(206,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU\",\"id\":3,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=menu.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:23:32','com_menus.menu',302,3,'COM_ACTIONLOGS_DISABLED'),
(207,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":118,\"title\":\"\\u0412\\u0441\\u0435 \\u0442\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=118\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:24:12','com_menus.item',302,118,'COM_ACTIONLOGS_DISABLED'),
(208,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 12:24:27','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(209,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":119,\"title\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=119\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:24:50','com_menus.item',302,119,'COM_ACTIONLOGS_DISABLED'),
(210,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"Requests\",\"extension_name\":\"Requests\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:25:47','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(211,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"Requests\",\"extension_name\":\"Requests\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:26:18','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(212,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-12 12:26:18','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(213,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 12:26:52','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(214,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 12:26:59','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(215,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":117,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=117\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:26:59','com_menus.item',302,117,'COM_ACTIONLOGS_DISABLED'),
(216,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":118,\"title\":\"\\u0412\\u0441\\u0435 \\u0442\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=118\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:27:05','com_menus.item',302,118,'COM_ACTIONLOGS_DISABLED'),
(217,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 12:27:05','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(218,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"Requests\",\"extension_name\":\"Requests\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:27:49','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(219,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-12 12:27:49','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(220,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":306,\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 12:27:55','com_users',306,306,'COM_ACTIONLOGS_DISABLED'),
(221,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 12:28:09','com_users',306,0,'COM_ACTIONLOGS_DISABLED'),
(222,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:28:29','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(223,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 12:28:29','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(224,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:28:31','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(225,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"extension_name\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:32:32','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(226,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"extension_name\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:35:53','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(227,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-12 12:35:53','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(228,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"extension_name\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:35:55','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(229,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-12 12:35:55','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(230,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"extension_name\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:36:24','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(231,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-12 12:36:24','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(232,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"extension_name\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 12:36:50','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(233,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-12 12:36:50','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(234,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-12 14:06:47','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(235,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":306,\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-12 14:07:02','com_users',302,306,'COM_ACTIONLOGS_DISABLED'),
(236,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:08:25','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(237,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:08:25','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(238,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":4,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:09:36','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(239,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:10:23','com_menus.item',302,101,'COM_ACTIONLOGS_DISABLED'),
(240,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 14:10:23','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(241,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:11:29','com_menus.item',302,101,'COM_ACTIONLOGS_DISABLED'),
(242,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:11:43','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(243,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:11:43','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(244,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:12:25','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(245,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:12:25','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(246,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_BANNER\",\"id\":2,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_banners&task=banner.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:12:59','com_banners.banner',302,2,'COM_ACTIONLOGS_DISABLED'),
(247,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:13:04','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(248,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__banners\"}','2025-05-12 14:14:06','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(249,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__banners\"}','2025-05-12 14:14:09','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(250,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_BANNER\",\"id\":2,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_banners&task=banner.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:14:09','com_banners.banner',302,2,'COM_ACTIONLOGS_DISABLED'),
(251,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:14:29','com_menus.item',302,101,'COM_ACTIONLOGS_DISABLED'),
(252,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 14:14:29','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(253,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:14:36','com_menus.item',302,101,'COM_ACTIONLOGS_DISABLED'),
(254,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:14:58','com_menus.item',302,101,'COM_ACTIONLOGS_DISABLED'),
(255,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:15:17','com_menus.item',302,101,'COM_ACTIONLOGS_DISABLED'),
(256,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:39:13','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(257,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:39:13','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(258,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:50:07','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(259,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"ukh-labinsk.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/images\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:50:39','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(260,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:53:42','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(261,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:54:46','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(262,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:54:46','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(263,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:57:56','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(264,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 14:58:08','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(265,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 14:58:08','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(266,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:01:53','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(267,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 15:01:53','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(268,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 15:02:27','com_users',306,0,'COM_ACTIONLOGS_DISABLED'),
(269,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-12 15:02:38','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(270,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":120,\"title\":\"\\u041f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=120\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:03:11','com_menus.item',302,120,'COM_ACTIONLOGS_DISABLED'),
(271,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":120,\"title\":\"\\u041f\\u0440\\u043e\\u0444\\u0438\\u043b\\u044c\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=120\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:03:21','com_menus.item',302,120,'COM_ACTIONLOGS_DISABLED'),
(272,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":306,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"table\":\"#__content\"}','2025-05-12 15:03:34','com_checkin',306,306,'COM_ACTIONLOGS_DISABLED'),
(273,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":306,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"table\":\"#__content\"}','2025-05-12 15:03:54','com_checkin',306,306,'COM_ACTIONLOGS_DISABLED'),
(274,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":306,\"userid\":306,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=306\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 15:03:57','com_users',306,306,'COM_ACTIONLOGS_DISABLED'),
(275,'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":22,\"title\":\"com_users\",\"extension_name\":\"com_users\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=22\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:04:30','com_config.component',302,22,'COM_ACTIONLOGS_DISABLED'),
(276,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":307,\"title\":\"qqqqqqqqqqqq\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=307\",\"userid\":307,\"username\":\"qqqqqqqqqqqq\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=307\"}','2025-05-12 15:05:03','com_users',307,307,'COM_ACTIONLOGS_DISABLED'),
(277,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":307,\"username\":\"qqqqqqqqqqqq\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=307\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 15:05:44','com_users',307,0,'COM_ACTIONLOGS_DISABLED'),
(278,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 15:06:06','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(279,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 15:07:18','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(280,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"7\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=7\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:08:08','com_users.level',302,7,'COM_ACTIONLOGS_DISABLED'),
(281,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":307,\"userid\":307,\"username\":\"qqqqqqqqqqqq\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=307\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 15:10:50','com_users',307,307,'COM_ACTIONLOGS_DISABLED'),
(282,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":308,\"title\":\"asdfafsdfdsa\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=308\",\"userid\":308,\"username\":\"asfdfdsafdsa\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=308\"}','2025-05-12 15:11:10','com_users',308,308,'COM_ACTIONLOGS_DISABLED'),
(283,'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":22,\"title\":\"com_users\",\"extension_name\":\"com_users\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=22\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:12:42','com_config.component',302,22,'COM_ACTIONLOGS_DISABLED'),
(284,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:15:55','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(285,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:17:38','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(286,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:18:19','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(287,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":309,\"title\":\"asdfafsdfdsadsds\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=309\",\"userid\":309,\"username\":\"asfdfdsafdsadssdf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=309\"}','2025-05-12 15:18:48','com_users',309,309,'COM_ACTIONLOGS_DISABLED'),
(288,'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":22,\"title\":\"com_users\",\"extension_name\":\"com_users\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=22\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:20:21','com_config.component',302,22,'COM_ACTIONLOGS_DISABLED'),
(289,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":310,\"title\":\"asdfafsdfdsadsdsdfsdf\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=310\",\"userid\":310,\"username\":\"asfdfdsafdsadssdfdfdsf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=310\"}','2025-05-12 15:20:36','com_users',310,310,'COM_ACTIONLOGS_DISABLED'),
(290,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":308,\"title\":\"asdfafsdfdsa\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:22:01','com_users',302,308,'COM_ACTIONLOGS_DISABLED'),
(291,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":309,\"title\":\"asdfafsdfdsadsds\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:22:01','com_users',302,309,'COM_ACTIONLOGS_DISABLED'),
(292,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":310,\"title\":\"asdfafsdfdsadsdsdfsdf\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:22:01','com_users',302,310,'COM_ACTIONLOGS_DISABLED'),
(293,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":307,\"title\":\"qqqqqqqqqqqq\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:22:01','com_users',302,307,'COM_ACTIONLOGS_DISABLED'),
(294,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":306,\"title\":\"useruseruser\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:22:01','com_users',302,306,'COM_ACTIONLOGS_DISABLED'),
(295,'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":22,\"title\":\"com_users\",\"extension_name\":\"com_users\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=22\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:22:23','com_config.component',302,22,'COM_ACTIONLOGS_DISABLED'),
(296,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":311,\"title\":\"asdfafsdfdsadsdsdfsdffdg\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=311\",\"userid\":311,\"username\":\"asfdfdsafdsadssdfdfdsfdfg\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=311\"}','2025-05-12 15:22:50','com_users',311,311,'COM_ACTIONLOGS_DISABLED'),
(297,'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":22,\"title\":\"com_users\",\"extension_name\":\"com_users\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=22\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:23:26','com_config.component',302,22,'COM_ACTIONLOGS_DISABLED'),
(298,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":312,\"title\":\"asdfafsdfdsadsdsdfsdffdgdf\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=312\",\"userid\":312,\"username\":\"asfdfdsafdsadssdfdfdsfdfgfd\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=312\"}','2025-05-12 15:25:10','com_users',312,312,'COM_ACTIONLOGS_DISABLED'),
(299,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:27:04','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(300,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:27:27','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(301,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":\"214\",\"title\":\"plg_user_joomla\",\"extension_name\":\"plg_user_joomla\",\"itemlink\":\"index.php?option=com_plugins&task=plugin.edit&extension_id=214\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:30:31','com_plugins.plugin',302,214,'COM_ACTIONLOGS_DISABLED'),
(302,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:30:31','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(303,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":313,\"title\":\"fddfgfdgdfgfgd\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=313\",\"userid\":313,\"username\":\"gfddfggfdfgdfdg\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=313\"}','2025-05-12 15:30:53','com_users',313,313,'COM_ACTIONLOGS_DISABLED'),
(304,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:31:13','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(305,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:31:36','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(306,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:31:37','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(307,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":311,\"title\":\"asdfafsdfdsadsdsdfsdffdg\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:32:10','com_users',302,311,'COM_ACTIONLOGS_DISABLED'),
(308,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":312,\"title\":\"asdfafsdfdsadsdsdfsdffdgdf\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:32:10','com_users',302,312,'COM_ACTIONLOGS_DISABLED'),
(309,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":313,\"title\":\"fddfgfdgdfgfgd\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:32:10','com_users',302,313,'COM_ACTIONLOGS_DISABLED'),
(310,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:34:18','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(311,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":215,\"title\":\"plg_user_profile\",\"itemlink\":\"index.php?option=com_plugins&task=plugin.edit&extension_id=215\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:34:18','com_plugins.plugin',302,215,'COM_ACTIONLOGS_DISABLED'),
(312,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:34:39','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(313,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED','{\"action\":\"unpublish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":215,\"title\":\"plg_user_profile\",\"itemlink\":\"index.php?option=com_plugins&task=plugin.edit&extension_id=215\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:34:39','com_plugins.plugin',302,215,'COM_ACTIONLOGS_DISABLED'),
(314,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:34:45','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(315,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED','{\"action\":\"unpublish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":214,\"title\":\"plg_user_joomla\",\"itemlink\":\"index.php?option=com_plugins&task=plugin.edit&extension_id=214\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:34:45','com_plugins.plugin',302,214,'COM_ACTIONLOGS_DISABLED'),
(316,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:34:53','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(317,'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED','{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":214,\"title\":\"plg_user_joomla\",\"itemlink\":\"index.php?option=com_plugins&task=plugin.edit&extension_id=214\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:34:53','com_plugins.plugin',302,214,'COM_ACTIONLOGS_DISABLED'),
(318,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":\"214\",\"title\":\"plg_user_joomla\",\"extension_name\":\"plg_user_joomla\",\"itemlink\":\"index.php?option=com_plugins&task=plugin.edit&extension_id=214\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:35:04','com_plugins.plugin',302,214,'COM_ACTIONLOGS_DISABLED'),
(319,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:35:04','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(320,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:35:05','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(321,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":314,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=314\",\"userid\":314,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=314\"}','2025-05-12 15:36:14','com_users',314,314,'COM_ACTIONLOGS_DISABLED'),
(322,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:37:25','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(323,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:37:39','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(324,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:37:48','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(325,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:37:56','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(326,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:38:07','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(327,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":314,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=314\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 15:40:27','com_users',314,0,'COM_ACTIONLOGS_DISABLED'),
(328,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":314,\"userid\":314,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=314\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 15:41:47','com_users',314,314,'COM_ACTIONLOGS_DISABLED'),
(329,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":315,\"title\":\"dssdgsgdgssgfd\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=315\",\"userid\":315,\"username\":\"dssdgsgdgssgfd\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=315\"}','2025-05-12 15:42:03','com_users',315,315,'COM_ACTIONLOGS_DISABLED'),
(330,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-12 15:50:56','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(331,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":316,\"title\":\"dsfsdfsfdsfds\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=316\",\"userid\":316,\"username\":\"dsfsdfsfdsfds\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=316\"}','2025-05-12 15:55:23','com_users',316,316,'COM_ACTIONLOGS_DISABLED'),
(332,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":316,\"title\":\"dsfsdfsfdsfds\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:55:47','com_users',302,316,'COM_ACTIONLOGS_DISABLED'),
(333,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":315,\"title\":\"dssdgsgdgssgfd\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:55:47','com_users',302,315,'COM_ACTIONLOGS_DISABLED'),
(334,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":314,\"title\":\"useruseruser\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:55:47','com_users',302,314,'COM_ACTIONLOGS_DISABLED'),
(335,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":317,\"title\":\"dsfsdfsfdsfds\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=317\",\"userid\":317,\"username\":\"dsfsdfsfdsfds\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=317\"}','2025-05-12 15:55:52','com_users',317,317,'COM_ACTIONLOGS_DISABLED'),
(336,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":317,\"title\":\"dsfsdfsfdsfds\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 15:56:18','com_users',302,317,'COM_ACTIONLOGS_DISABLED'),
(337,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 15:59:00','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(338,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:02:03','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(339,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 16:02:28','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(340,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"7\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=7\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:02:40','com_users.level',302,7,'COM_ACTIONLOGS_DISABLED'),
(341,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"6\",\"title\":\"Super Users\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=6\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:03:40','com_users.level',302,6,'COM_ACTIONLOGS_DISABLED'),
(342,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"6\",\"title\":\"Super Users\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=6\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:04:05','com_users.level',302,6,'COM_ACTIONLOGS_DISABLED'),
(343,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:04:40','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(344,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 16:04:40','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(345,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":302,\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:04:56','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(346,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":318,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\"}','2025-05-12 16:05:15','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(347,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:05:35','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(348,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:08:09','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(349,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:08:40','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(350,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":302,\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:08:52','com_users',302,302,'COM_ACTIONLOGS_DISABLED'),
(351,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:09:05','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(352,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":318,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:09:46','com_users',302,318,'COM_ACTIONLOGS_DISABLED'),
(353,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Special\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:10:10','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(354,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"7\",\"title\":\"Operator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=7\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:11:05','com_users.level',302,7,'COM_ACTIONLOGS_DISABLED'),
(355,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:11:17','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(356,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Registered\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:11:37','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(357,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Registered\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:11:50','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(358,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:11:55','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(359,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":319,\"title\":\"qqqqqqqqqqqq\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=319\",\"userid\":319,\"username\":\"qqqqqqqqqqqq\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=319\"}','2025-05-12 16:12:15','com_users',319,319,'COM_ACTIONLOGS_DISABLED'),
(360,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":319,\"username\":\"qqqqqqqqqqqq\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=319\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:12:22','com_users',319,0,'COM_ACTIONLOGS_DISABLED'),
(361,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:12:35','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(362,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":318,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:12:45','com_users',302,318,'COM_ACTIONLOGS_DISABLED'),
(363,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":319,\"userid\":319,\"username\":\"qqqqqqqqqqqq\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=319\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:12:51','com_users',319,319,'COM_ACTIONLOGS_DISABLED'),
(364,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:13:00','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(365,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:13:07','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(366,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:13:18','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(367,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:13:34','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(368,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-12 16:14:17','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(369,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Registered\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-12 16:15:06','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(370,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-12 16:15:17','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(371,'PLG_ACTIONLOG_JOOMLA_USER_UPDATE','{\"action\":\"joomlaupdate\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"version\":\"5.3.0\",\"oldversion\":\"5.3.0\"}','2025-05-12 16:19:53','com_joomlaupdate',302,302,'COM_ACTIONLOGS_DISABLED'),
(372,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-13 07:48:16','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(373,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 07:51:51','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(374,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":121,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=121\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:07:38','com_menus.item',302,121,'COM_ACTIONLOGS_DISABLED'),
(375,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 08:08:19','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(376,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":121,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=121\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:08:19','com_menus.item',302,121,'COM_ACTIONLOGS_DISABLED'),
(377,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":121,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:08:29','com_menus.item',302,121,'COM_ACTIONLOGS_DISABLED'),
(378,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU\",\"id\":4,\"title\":\"\\u041d\\u0435 \\u043e\\u0442\\u043e\\u0431\\u0440\\u0430\\u0436\\u0430\\u0435\\u0442\\u0441\\u044f\",\"itemlink\":\"index.php?option=com_menus&task=menu.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:08:49','com_menus.menu',302,4,'COM_ACTIONLOGS_DISABLED'),
(379,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":122,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=122\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:09:08','com_menus.item',302,122,'COM_ACTIONLOGS_DISABLED'),
(380,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":122,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=122\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:09:14','com_menus.item',302,122,'COM_ACTIONLOGS_DISABLED'),
(381,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 08:09:32','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(382,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 08:10:18','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(383,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"\\u041d\\u0435 \\u043e\\u0442\\u043e\\u0431\\u0440\\u0430\\u0436\\u0430\\u0435\\u0442\\u0441\\u044f\",\"extension_name\":\"\\u041d\\u0435 \\u043e\\u0442\\u043e\\u0431\\u0440\\u0430\\u0436\\u0430\\u0435\\u0442\\u0441\\u044f\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:10:32','com_modules.module',302,111,'COM_ACTIONLOGS_DISABLED'),
(384,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 08:10:34','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(385,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":122,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=122\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:11:10','com_menus.item',302,122,'COM_ACTIONLOGS_DISABLED'),
(386,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 08:11:10','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(387,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":110,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"extension_name\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=110\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:11:48','com_modules.module',302,110,'COM_ACTIONLOGS_DISABLED'),
(388,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 08:11:48','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(389,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 08:12:04','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(390,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 08:12:12','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(391,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":16,\"title\":\"Login Form\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=16\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:12:12','com_modules.module',302,16,'COM_ACTIONLOGS_DISABLED'),
(392,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 08:12:32','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(393,'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED','{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":17,\"title\":\"Breadcrumbs\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=17\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:12:32','com_modules.module',302,17,'COM_ACTIONLOGS_DISABLED'),
(394,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 08:12:44','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(395,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 08:12:59','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(396,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 08:13:22','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(397,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU\",\"id\":5,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=menu.edit&id=5\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:57:01','com_menus.menu',302,5,'COM_ACTIONLOGS_DISABLED'),
(398,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":119,\"title\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=119\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:58:02','com_menus.item',302,119,'COM_ACTIONLOGS_DISABLED'),
(399,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 08:58:02','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(400,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":119,\"title\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=119\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:58:13','com_menus.item',302,119,'COM_ACTIONLOGS_DISABLED'),
(401,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":123,\"title\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=123\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:58:34','com_menus.item',302,123,'COM_ACTIONLOGS_DISABLED'),
(402,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":123,\"title\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=123\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 08:58:36','com_menus.item',302,123,'COM_ACTIONLOGS_DISABLED'),
(403,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:00:56','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(404,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 09:00:56','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(405,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":124,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=124\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:01:19','com_menus.item',302,124,'COM_ACTIONLOGS_DISABLED'),
(406,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":124,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=124\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:01:20','com_menus.item',302,124,'COM_ACTIONLOGS_DISABLED'),
(407,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":112,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"extension_name\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=112\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:02:02','com_modules.module',302,112,'COM_ACTIONLOGS_DISABLED'),
(408,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:02:03','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(409,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":117,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:02:47','com_menus.item',302,117,'COM_ACTIONLOGS_DISABLED'),
(410,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":125,\"title\":\"\\u0412\\u0441\\u0435 \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=125\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:26:55','com_menus.item',302,125,'COM_ACTIONLOGS_DISABLED'),
(411,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:27:08','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(412,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":320,\"title\":\"clientclientclient\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\"}','2025-05-13 09:27:36','com_users',320,320,'COM_ACTIONLOGS_DISABLED'),
(413,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:27:45','com_users',320,0,'COM_ACTIONLOGS_DISABLED'),
(414,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":319,\"title\":\"qqqqqqqqqqqq\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:28:14','com_users',302,319,'COM_ACTIONLOGS_DISABLED'),
(415,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":112,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"extension_name\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=112\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:28:53','com_modules.module',302,112,'COM_ACTIONLOGS_DISABLED'),
(416,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:28:53','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(417,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:28:55','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(418,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:29:18','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(419,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:29:31','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(420,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Registered\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:29:50','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(421,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"7\",\"title\":\"Operator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=7\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:30:19','com_users.level',302,7,'COM_ACTIONLOGS_DISABLED'),
(422,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Registered\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:30:33','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(423,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Registered\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:30:46','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(424,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Client\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:30:52','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(425,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:31:29','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(426,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":320,\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:31:40','com_users',320,320,'COM_ACTIONLOGS_DISABLED'),
(427,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:31:47','com_users',320,0,'COM_ACTIONLOGS_DISABLED'),
(428,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:32:20','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(429,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:32:33','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(430,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 09:32:33','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(431,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 09:33:34','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(432,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:34:57','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(433,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 09:34:57','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(434,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Administrator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:35:36','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(435,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"2\",\"title\":\"Client\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=2\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:36:03','com_users.level',302,2,'COM_ACTIONLOGS_DISABLED'),
(436,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"7\",\"title\":\"Operator\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=7\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:36:16','com_users.level',302,7,'COM_ACTIONLOGS_DISABLED'),
(437,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":320,\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:37:12','com_users',320,320,'COM_ACTIONLOGS_DISABLED'),
(438,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 09:37:24','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(439,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":116,\"title\":\"\\u0422\\u0438\\u043f\\u044b \\u0437\\u0430\\u044f\\u0432\\u043e\\u043a\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=116\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:37:50','com_menus.item',302,116,'COM_ACTIONLOGS_DISABLED'),
(440,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 09:37:50','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(441,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":122,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=122\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:38:02','com_menus.item',302,122,'COM_ACTIONLOGS_DISABLED'),
(442,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 09:38:02','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(443,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"title\":\"Breadcrumbs\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:38:32','com_modules.module',302,0,'COM_ACTIONLOGS_DISABLED'),
(444,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"title\":\"Login Form\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:38:32','com_modules.module',302,0,'COM_ACTIONLOGS_DISABLED'),
(445,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:38:51','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(446,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:38:56','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(447,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:39:03','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(448,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:39:07','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(449,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:39:33','com_users',320,0,'COM_ACTIONLOGS_DISABLED'),
(450,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":320,\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:39:40','com_users',320,320,'COM_ACTIONLOGS_DISABLED'),
(451,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 09:39:49','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(452,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":318,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"table\":\"#__content\"}','2025-05-13 09:39:58','com_checkin',318,318,'COM_ACTIONLOGS_DISABLED'),
(453,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":112,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"extension_name\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=112\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 09:42:36','com_modules.module',302,112,'COM_ACTIONLOGS_DISABLED'),
(454,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:42:36','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(455,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 09:53:39','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(456,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":126,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=126\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:10:25','com_menus.item',302,126,'COM_ACTIONLOGS_DISABLED'),
(457,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":126,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=126\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:11:08','com_menus.item',302,126,'COM_ACTIONLOGS_DISABLED'),
(458,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":122,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=122\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:12:53','com_menus.item',302,122,'COM_ACTIONLOGS_DISABLED'),
(459,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:12:53','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(460,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":122,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=122\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:13:33','com_menus.item',302,122,'COM_ACTIONLOGS_DISABLED'),
(461,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:13:33','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(462,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:14:15','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(463,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:14:38','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(464,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:14:47','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(465,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 10:15:18','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(466,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 10:15:27','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(467,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":112,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"extension_name\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=112\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:15:34','com_modules.module',302,112,'COM_ACTIONLOGS_DISABLED'),
(468,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 10:15:34','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(469,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":122,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=122\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:17:11','com_menus.item',302,122,'COM_ACTIONLOGS_DISABLED'),
(470,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:17:11','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(471,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:17:51','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(472,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":126,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=126\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:18:04','com_menus.item',302,126,'COM_ACTIONLOGS_DISABLED'),
(473,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:18:04','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(474,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:18:39','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(475,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:34:50','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(476,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":127,\"title\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=127\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:35:12','com_menus.item',302,127,'COM_ACTIONLOGS_DISABLED'),
(477,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":112,\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"extension_name\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=112\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 10:35:24','com_modules.module',302,112,'COM_ACTIONLOGS_DISABLED'),
(478,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 10:35:24','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(479,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 10:43:33','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(480,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 11:08:36','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(481,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":321,\"title\":\"sdfsdfdsfdsdfssd\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=321\",\"userid\":321,\"username\":\"sdfsdfdsfdsdfssd\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=321\"}','2025-05-13 11:08:53','com_users',321,321,'COM_ACTIONLOGS_DISABLED'),
(482,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":321,\"username\":\"sdfsdfdsfdsdfssd\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=321\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 11:08:59','com_users',321,0,'COM_ACTIONLOGS_DISABLED'),
(483,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":321,\"userid\":321,\"username\":\"sdfsdfdsfdsdfssd\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=321\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 11:09:13','com_users',321,321,'COM_ACTIONLOGS_DISABLED'),
(484,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 11:09:24','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(485,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 11:23:48','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(486,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 11:23:56','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(487,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"Obrazec.pdf\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 11:25:59','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(488,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 11:26:11','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(489,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"MUNICIPALNOE KAZENNOE UCREZDENIE.pdf\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 11:26:37','com_media.file',302,0,'COM_ACTIONLOGS_DISABLED'),
(490,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 11:27:11','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(491,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 11:27:11','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(492,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 11:27:41','com_content.article',302,3,'COM_ACTIONLOGS_DISABLED'),
(493,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 11:27:41','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(494,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 11:28:26','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(495,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":318,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"table\":\"#__content\"}','2025-05-13 11:30:25','com_checkin',318,318,'COM_ACTIONLOGS_DISABLED'),
(496,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 11:30:29','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(497,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":318,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"table\":\"#__content\"}','2025-05-13 11:30:45','com_checkin',318,318,'COM_ACTIONLOGS_DISABLED'),
(498,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-13 13:15:53','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(499,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:16:08','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(500,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 13:18:21','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(501,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU\",\"id\":6,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_menus&task=menu.edit&id=6\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:25:42','com_menus.menu',302,6,'COM_ACTIONLOGS_DISABLED'),
(502,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"extension_name\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:26:11','com_modules.module',302,113,'COM_ACTIONLOGS_DISABLED'),
(503,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":128,\"title\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=128\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:26:59','com_menus.item',302,128,'COM_ACTIONLOGS_DISABLED'),
(504,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 13:27:15','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(505,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":129,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=129\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:27:37','com_menus.item',302,129,'COM_ACTIONLOGS_DISABLED'),
(506,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"extension_name\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:28:04','com_modules.module',302,113,'COM_ACTIONLOGS_DISABLED'),
(507,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 13:28:04','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(508,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"extension_name\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:28:55','com_modules.module',302,113,'COM_ACTIONLOGS_DISABLED'),
(509,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 13:28:55','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(510,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"extension_name\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 13:29:02','com_modules.module',302,113,'COM_ACTIONLOGS_DISABLED'),
(511,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 13:29:02','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(512,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-13 13:34:38','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(513,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":130,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=130\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 14:06:01','com_menus.item',302,130,'COM_ACTIONLOGS_DISABLED'),
(514,'PLG_ACTIONLOG_JOOMLA_USER_CACHE','{\"action\":\"cache\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"group\":\"all\"}','2025-05-13 14:24:32','com_cache',302,302,'COM_ACTIONLOGS_DISABLED'),
(515,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":130,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=130\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 14:36:05','com_menus.item',302,130,'COM_ACTIONLOGS_DISABLED'),
(516,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 14:36:05','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(517,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 15:11:38','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(518,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 15:11:38','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(519,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 15:16:22','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(520,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 15:16:22','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(521,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 15:31:50','com_content.article',302,4,'COM_ACTIONLOGS_DISABLED'),
(522,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 15:31:50','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(523,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 15:51:01','com_users',320,0,'COM_ACTIONLOGS_DISABLED'),
(524,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":320,\"userid\":320,\"username\":\"clientclientclient\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=320\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 15:51:19','com_users',320,320,'COM_ACTIONLOGS_DISABLED'),
(525,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 15:52:22','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(526,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 15:52:22','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(527,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 15:52:28','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(528,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-13 15:56:49','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(529,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 16:01:21','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(530,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__content\"}','2025-05-13 16:01:53','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(531,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 16:02:20','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(532,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":321,\"title\":\"sdfsdfdsfdsdfssd\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:03:33','com_users',302,321,'COM_ACTIONLOGS_DISABLED'),
(533,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":322,\"title\":\"\\u0413\\u043b\\u0435\\u0431 \\u041f\\u043e\\u0434\\u043e\\u043b\\u044f\\u043d\\u043e\\u0432\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=322\",\"userid\":322,\"username\":\"RKPYT\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=322\"}','2025-05-13 16:06:45','com_users',322,322,'COM_ACTIONLOGS_DISABLED'),
(534,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":322,\"title\":\"\\u0413\\u043b\\u0435\\u0431 \\u041f\\u043e\\u0434\\u043e\\u043b\\u044f\\u043d\\u043e\\u0432\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=322\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:07:20','com_users',302,322,'COM_ACTIONLOGS_DISABLED'),
(535,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":318,\"title\":\"useruseruser\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:07:59','com_users',302,318,'COM_ACTIONLOGS_DISABLED'),
(536,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 16:08:14','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(537,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":322,\"username\":\"RKPYT\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=322\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 16:09:30','com_users',322,0,'COM_ACTIONLOGS_DISABLED'),
(538,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-13 16:13:07','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(539,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-13 16:20:15','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(540,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-13 16:20:32','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(541,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__extensions\"}','2025-05-13 16:23:26','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(542,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-13 16:23:51','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(543,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":323,\"title\":\"dsgfgsafafgsgdf\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=323\",\"userid\":323,\"username\":\"dgsfsdfggsdfsgfd\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=323\"}','2025-05-13 16:33:32','com_users',323,323,'COM_ACTIONLOGS_DISABLED'),
(544,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":324,\"title\":\"dsgfgsafafgsgdfsdgf\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=324\",\"userid\":324,\"username\":\"dgsfsdfggsdfsgfdsdfg\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=324\"}','2025-05-13 16:34:32','com_users',324,324,'COM_ACTIONLOGS_DISABLED'),
(545,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:39:30','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(546,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:51:54','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(547,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":325,\"title\":\"dsgfgsafafgsgdfsdgfdf\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=325\",\"userid\":325,\"username\":\"dgsfsdfggsdfsgfdsdfgdf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=325\"}','2025-05-13 16:52:52','com_users',325,325,'COM_ACTIONLOGS_DISABLED'),
(548,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":323,\"title\":\"dsgfgsafafgsgdf\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:53:21','com_users',302,323,'COM_ACTIONLOGS_DISABLED'),
(549,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":324,\"title\":\"dsgfgsafafgsgdfsdgf\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:53:21','com_users',302,324,'COM_ACTIONLOGS_DISABLED'),
(550,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":325,\"title\":\"dsgfgsafafgsgdfsdgfdf\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:53:21','com_users',302,325,'COM_ACTIONLOGS_DISABLED'),
(551,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":326,\"title\":\"gfsdsgdfsgdfgffd\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=326\",\"userid\":326,\"username\":\"gfsdsgdfsgdfgffd\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=326\"}','2025-05-13 16:54:41','com_users',326,326,'COM_ACTIONLOGS_DISABLED'),
(552,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":327,\"title\":\"sdgfsgdfsgdffdgs\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=327\",\"userid\":327,\"username\":\"sdgfsgdfsgdffdgs\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=327\"}','2025-05-13 16:58:11','com_users',327,327,'COM_ACTIONLOGS_DISABLED'),
(553,'PLG_ACTIONLOG_JOOMLA_APPLICATION_CONFIG_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_APPLICATION_CONFIG\",\"extension_name\":\"com_config.application\",\"itemlink\":\"index.php?option=com_config\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-13 16:58:25','com_config.application',302,0,'COM_ACTIONLOGS_DISABLED'),
(554,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":328,\"title\":\"gfsdgfsddfsgfds\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=328\",\"userid\":328,\"username\":\"gfsdgfsddfsgfds\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=328\"}','2025-05-13 16:58:54','com_users',328,328,'COM_ACTIONLOGS_DISABLED'),
(555,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}','2025-05-14 08:09:05','com_users',302,0,'COM_ACTIONLOGS_DISABLED'),
(556,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:09:23','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(557,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":328,\"title\":\"gfsdgfsddfsgfds\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:09:41','com_users',302,328,'COM_ACTIONLOGS_DISABLED'),
(558,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":326,\"title\":\"gfsdsgdfsgdfgffd\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:09:41','com_users',302,326,'COM_ACTIONLOGS_DISABLED'),
(559,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":327,\"title\":\"sdgfsgdfsgdffdgs\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:09:41','com_users',302,327,'COM_ACTIONLOGS_DISABLED'),
(560,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":131,\"title\":\"\\u0412\\u0441\\u0435 \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=131\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:10:48','com_menus.item',302,131,'COM_ACTIONLOGS_DISABLED'),
(561,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"extension_name\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:10:59','com_modules.module',302,113,'COM_ACTIONLOGS_DISABLED'),
(562,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-14 08:10:59','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(563,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-14 08:11:00','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(564,'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED','{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":132,\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=132\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:16:09','com_menus.item',302,132,'COM_ACTIONLOGS_DISABLED'),
(565,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":131,\"title\":\"\\u0412\\u0441\\u0435 \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=131\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:16:21','com_menus.item',302,131,'COM_ACTIONLOGS_DISABLED'),
(566,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__menu\"}','2025-05-14 08:16:21','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(567,'PLG_SYSTEM_ACTIONLOGS_CONTENT_DELETED','{\"action\":\"delete\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER_GROUP\",\"id\":6,\"title\":\"Manager\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:16:32','com_users',302,6,'COM_ACTIONLOGS_DISABLED'),
(568,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ACCESS_LEVEL\",\"id\":\"3\",\"title\":\"Special\",\"itemlink\":\"index.php?option=com_users&task=level.edit&id=3\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:17:23','com_users.level',302,3,'COM_ACTIONLOGS_DISABLED'),
(569,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:17:30','com_users',318,318,'COM_ACTIONLOGS_DISABLED'),
(570,'PLG_ACTIONLOG_JOOMLA_USER_REGISTERED','{\"action\":\"register\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":329,\"title\":\"dfgdgsfsgdfsgdf\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=329\",\"userid\":329,\"username\":\"dfgdgsfsgdfsgdf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=329\"}','2025-05-14 08:18:05','com_users',329,329,'COM_ACTIONLOGS_DISABLED'),
(571,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":329,\"username\":\"dfgdgsfsgdfsgdf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=329\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:18:09','com_users',329,0,'COM_ACTIONLOGS_DISABLED'),
(572,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":329,\"userid\":329,\"username\":\"dfgdgsfsgdfsgdf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=329\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:18:23','com_users',329,329,'COM_ACTIONLOGS_DISABLED'),
(573,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":329,\"username\":\"dfgdgsfsgdfsgdf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=329\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:18:29','com_users',329,0,'COM_ACTIONLOGS_DISABLED'),
(574,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":329,\"userid\":329,\"username\":\"dfgdgsfsgdfsgdf\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=329\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:18:45','com_users',329,329,'COM_ACTIONLOGS_DISABLED'),
(575,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN','{\"action\":\"login\",\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:18:54','com_users',318,0,'COM_ACTIONLOGS_DISABLED'),
(576,'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED','{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"extension_name\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\"}','2025-05-14 08:22:23','com_modules.module',302,113,'COM_ACTIONLOGS_DISABLED'),
(577,'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN','{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":302,\"title\":\"Admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"userid\":302,\"username\":\"Admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=302\",\"table\":\"#__modules\"}','2025-05-14 08:22:23','com_checkin',302,302,'COM_ACTIONLOGS_DISABLED'),
(578,'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_OUT','{\"action\":\"logout\",\"id\":318,\"userid\":318,\"username\":\"useruseruser\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=318\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_SITE\"}','2025-05-14 08:36:56','com_users',318,318,'COM_ACTIONLOGS_DISABLED');
/*!40000 ALTER TABLE `amtf3_action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_action_logs_extensions`
--

DROP TABLE IF EXISTS `amtf3_action_logs_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_action_logs_extensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_action_logs_extensions`
--

LOCK TABLES `amtf3_action_logs_extensions` WRITE;
/*!40000 ALTER TABLE `amtf3_action_logs_extensions` DISABLE KEYS */;
INSERT INTO `amtf3_action_logs_extensions` VALUES
(1,'com_banners'),
(2,'com_cache'),
(3,'com_categories'),
(4,'com_config'),
(5,'com_contact'),
(6,'com_content'),
(7,'com_installer'),
(8,'com_media'),
(9,'com_menus'),
(10,'com_messages'),
(11,'com_modules'),
(12,'com_newsfeeds'),
(13,'com_plugins'),
(14,'com_redirect'),
(15,'com_tags'),
(16,'com_templates'),
(17,'com_users'),
(18,'com_checkin'),
(19,'com_scheduler'),
(20,'com_fields'),
(21,'com_guidedtours');
/*!40000 ALTER TABLE `amtf3_action_logs_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_action_logs_users`
--

DROP TABLE IF EXISTS `amtf3_action_logs_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_action_logs_users` (
  `user_id` int(10) unsigned NOT NULL,
  `notify` tinyint(3) unsigned NOT NULL,
  `extensions` text NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_notify` (`notify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_action_logs_users`
--

LOCK TABLES `amtf3_action_logs_users` WRITE;
/*!40000 ALTER TABLE `amtf3_action_logs_users` DISABLE KEYS */;
INSERT INTO `amtf3_action_logs_users` VALUES
(302,0,'[\"com_content\"]');
/*!40000 ALTER TABLE `amtf3_action_logs_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_assets`
--

DROP TABLE IF EXISTS `amtf3_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_assets`
--

LOCK TABLES `amtf3_assets` WRITE;
/*!40000 ALTER TABLE `amtf3_assets` DISABLE KEYS */;
INSERT INTO `amtf3_assets` VALUES
(1,0,0,203,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.api\":{\"8\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1},\"core.edit.state\":{\"6\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2,1,1,2,1,'com_admin','com_admin','{}'),
(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6,1,11,12,1,'com_config','com_config','{}'),
(7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8,1,17,42,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.execute.transition\":{\"6\":1,\"5\":1}}'),
(9,1,43,44,1,'com_cpanel','com_cpanel','{}'),
(10,1,45,46,1,'com_installer','com_installer','{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11,1,47,52,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1}}'),
(12,11,48,49,2,'com_languages.language.1','English (en-GB)','{}'),
(13,1,53,54,1,'com_login','com_login','{}'),
(14,1,55,56,1,'com_mails','com_mails','{}'),
(15,1,57,58,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16,1,59,70,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1}}'),
(17,1,71,72,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18,1,73,150,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1}}'),
(19,1,151,154,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(20,1,155,156,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1}}'),
(21,1,157,158,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1}}'),
(23,1,159,160,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1}}'),
(24,1,165,168,1,'com_users','com_users','{\"core.admin\":{\"7\":1}}'),
(26,1,169,170,1,'com_wrapper','com_wrapper','{}'),
(27,8,18,23,2,'com_content.category.2','Uncategorised','{}'),
(28,3,4,5,2,'com_banners.category.3','Uncategorised','{}'),
(29,7,14,15,2,'com_contact.category.4','Uncategorised','{}'),
(30,19,152,153,2,'com_newsfeeds.category.5','Uncategorised','{}'),
(32,24,166,167,2,'com_users.category.7','Uncategorised','{}'),
(33,1,171,172,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34,1,173,174,1,'com_joomlaupdate','com_joomlaupdate','{}'),
(35,1,175,176,1,'com_tags','com_tags','{}'),
(36,1,177,178,1,'com_contenthistory','com_contenthistory','{}'),
(37,1,179,180,1,'com_ajax','com_ajax','{}'),
(38,1,181,182,1,'com_postinstall','com_postinstall','{}'),
(39,18,74,75,2,'com_modules.module.1','Main Menu','{}'),
(40,18,76,77,2,'com_modules.module.2','Login','{}'),
(41,18,78,79,2,'com_modules.module.3','Popular Articles','{}'),
(42,18,80,81,2,'com_modules.module.4','Recently Added Articles','{}'),
(43,18,82,83,2,'com_modules.module.8','Toolbar','{}'),
(44,18,84,85,2,'com_modules.module.9','Notifications','{}'),
(45,18,86,87,2,'com_modules.module.10','Logged-in Users','{}'),
(46,18,88,89,2,'com_modules.module.12','Admin Menu','{}'),
(49,18,94,95,2,'com_modules.module.15','Title','{}'),
(52,18,96,97,2,'com_modules.module.79','Multilanguage status','{}'),
(53,18,100,101,2,'com_modules.module.86','Joomla Version','{}'),
(54,16,60,61,2,'com_menus.menu.1','Main Menu','{}'),
(55,18,104,105,2,'com_modules.module.87','Sample Data','{}'),
(56,8,24,41,2,'com_content.workflow.1','COM_WORKFLOW_BASIC_WORKFLOW','{}'),
(57,56,25,26,3,'com_content.stage.1','COM_WORKFLOW_BASIC_STAGE','{}'),
(58,56,27,28,3,'com_content.transition.1','UNPUBLISH','{}'),
(59,56,29,30,3,'com_content.transition.2','PUBLISH','{}'),
(60,56,31,32,3,'com_content.transition.3','TRASH','{}'),
(61,56,33,34,3,'com_content.transition.4','ARCHIVE','{}'),
(62,56,35,36,3,'com_content.transition.5','FEATURE','{}'),
(63,56,37,38,3,'com_content.transition.6','UNFEATURE','{}'),
(64,56,39,40,3,'com_content.transition.7','PUBLISH_AND_FEATURE','{}'),
(65,1,161,162,1,'com_privacy','com_privacy','{}'),
(66,1,163,164,1,'com_actionlogs','com_actionlogs','{}'),
(67,18,90,91,2,'com_modules.module.88','Latest Actions','{}'),
(68,18,92,93,2,'com_modules.module.89','Privacy Dashboard','{}'),
(70,18,98,99,2,'com_modules.module.103','Site','{}'),
(71,18,102,103,2,'com_modules.module.104','System','{}'),
(72,18,106,107,2,'com_modules.module.91','System Dashboard','{}'),
(73,18,108,109,2,'com_modules.module.92','Content Dashboard','{}'),
(74,18,110,111,2,'com_modules.module.93','Menus Dashboard','{}'),
(75,18,112,113,2,'com_modules.module.94','Components Dashboard','{}'),
(76,18,114,115,2,'com_modules.module.95','Users Dashboard','{}'),
(77,18,116,117,2,'com_modules.module.99','Frontend Link','{}'),
(78,18,118,119,2,'com_modules.module.100','Messages','{}'),
(79,18,120,121,2,'com_modules.module.101','Post Install Messages','{}'),
(80,18,122,123,2,'com_modules.module.102','User Status','{}'),
(82,18,124,125,2,'com_modules.module.105','3rd Party','{}'),
(83,18,126,127,2,'com_modules.module.106','Help Dashboard','{}'),
(84,18,128,129,2,'com_modules.module.107','Privacy Requests','{}'),
(85,18,130,131,2,'com_modules.module.108','Privacy Status','{}'),
(86,18,132,133,2,'com_modules.module.96','Popular Articles','{}'),
(87,18,134,135,2,'com_modules.module.97','Recently Added Articles','{}'),
(88,18,136,137,2,'com_modules.module.98','Logged-in Users','{}'),
(89,18,138,139,2,'com_modules.module.90','Login Support','{}'),
(90,1,183,190,1,'com_scheduler','com_scheduler','{}'),
(91,1,191,192,1,'com_associations','com_associations','{}'),
(92,1,193,194,1,'com_categories','com_categories','{}'),
(93,1,195,196,1,'com_fields','com_fields','{}'),
(94,1,197,198,1,'com_workflow','com_workflow','{}'),
(95,1,199,200,1,'com_guidedtours','com_guidedtours','{}'),
(96,18,140,141,2,'com_modules.module.109','Guided Tours','{}'),
(97,90,184,185,2,'com_scheduler.task.1','Rotate Logs','{}'),
(98,90,186,187,2,'com_scheduler.task.2','Session GC','{}'),
(99,90,188,189,2,'com_scheduler.task.3','Update Notification','{}'),
(100,11,50,51,2,'com_languages.language.2','Russian (ru-RU)','{}'),
(105,1,201,202,1,'com_chronoforms8','ChronoForms8','{}'),
(108,27,19,20,3,'com_content.article.3','Пример заявления','{}'),
(109,16,62,63,2,'com_menus.menu.3','Типы заявок','{}'),
(110,18,142,143,2,'com_modules.module.110','Типы заявок','{}'),
(111,27,21,22,3,'com_content.article.4','Главная страница','{}'),
(112,16,64,65,2,'com_menus.menu.4','Не отображается','{}'),
(113,18,144,145,2,'com_modules.module.111','Не отображается','{}'),
(114,16,66,67,2,'com_menus.menu.5','Заявки','{}'),
(115,18,146,147,2,'com_modules.module.112','Заявки','{}'),
(116,16,68,69,2,'com_menus.menu.6','Работа','{}'),
(117,18,148,149,2,'com_modules.module.113','Работа','{}');
/*!40000 ALTER TABLE `amtf3_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_associations`
--

DROP TABLE IF EXISTS `amtf3_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_associations`
--

LOCK TABLES `amtf3_associations` WRITE;
/*!40000 ALTER TABLE `amtf3_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_banner_clients`
--

DROP TABLE IF EXISTS `amtf3_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `metakey` text DEFAULT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_banner_clients`
--

LOCK TABLES `amtf3_banner_clients` WRITE;
/*!40000 ALTER TABLE `amtf3_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_banner_tracks`
--

DROP TABLE IF EXISTS `amtf3_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_banner_tracks`
--

LOCK TABLES `amtf3_banner_tracks` WRITE;
/*!40000 ALTER TABLE `amtf3_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_banners`
--

DROP TABLE IF EXISTS `amtf3_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT 0,
  `impmade` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `clickurl` varchar(2048) NOT NULL DEFAULT '',
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text DEFAULT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_banners`
--

LOCK TABLES `amtf3_banners` WRITE;
/*!40000 ALTER TABLE `amtf3_banners` DISABLE KEYS */;
INSERT INTO `amtf3_banners` VALUES
(1,0,1,'Example','example',0,0,0,'',-2,3,'','',0,1,'','{\"imageurl\":\"\",\"width\":\"\",\"height\":\"\",\"alt\":\"\"}',0,'',-1,0,0,NULL,NULL,'2025-05-12 10:18:07',NULL,'2025-06-12 00:00:00','2025-05-12 10:17:24','*',302,'','2025-05-12 10:17:24',302,1),
(2,0,0,'Главная страница','glavnaya-stranitsa',0,0,0,'',-2,3,'','',0,2,'','{\"imageurl\":\"\",\"width\":\"\",\"height\":\"\",\"alt\":\"\"}',0,'',-1,0,0,NULL,NULL,'2025-05-12 14:14:09',NULL,'2025-06-12 00:00:00','2025-05-12 14:12:59','*',302,'','2025-05-12 14:12:59',302,1);
/*!40000 ALTER TABLE `amtf3_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_categories`
--

DROP TABLE IF EXISTS `amtf3_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(400) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text DEFAULT NULL,
  `metadesc` varchar(1024) NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_categories`
--

LOCK TABLES `amtf3_categories` WRITE;
/*!40000 ALTER TABLE `amtf3_categories` DISABLE KEYS */;
INSERT INTO `amtf3_categories` VALUES
(1,0,0,0,11,0,'','system','ROOT','root','','',1,NULL,NULL,1,'{}','','','{}',302,'2025-05-12 08:25:18',302,'2025-05-12 08:25:18',0,'*',1),
(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,NULL,NULL,1,'{\"category_layout\":\"\",\"image\":\"\",\"workflow_id\":\"use_default\"}','','','{\"author\":\"\",\"robots\":\"\"}',302,'2025-05-12 08:25:18',302,'2025-05-12 08:25:18',0,'*',1),
(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,NULL,NULL,1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',302,'2025-05-12 08:25:18',302,'2025-05-12 08:25:18',0,'*',1),
(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,NULL,NULL,1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',302,'2025-05-12 08:25:18',302,'2025-05-12 08:25:18',0,'*',1),
(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,NULL,NULL,1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',302,'2025-05-12 08:25:18',302,'2025-05-12 08:25:18',0,'*',1),
(7,32,1,9,10,1,'uncategorised','com_users','Uncategorised','uncategorised','','',1,NULL,NULL,1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',302,'2025-05-12 08:25:18',302,'2025-05-12 08:25:18',0,'*',1);
/*!40000 ALTER TABLE `amtf3_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_chronoforms8`
--

DROP TABLE IF EXISTS `amtf3_chronoforms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_chronoforms8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(150) NOT NULL,
  `alias` varchar(150) NOT NULL,
  `created` datetime DEFAULT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `category` varchar(100) DEFAULT '',
  `elements` longtext DEFAULT NULL,
  `params` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_chronoforms8`
--

LOCK TABLES `amtf3_chronoforms8` WRITE;
/*!40000 ALTER TABLE `amtf3_chronoforms8` DISABLE KEYS */;
INSERT INTO `amtf3_chronoforms8` VALUES
(1,0,'Create type request form','create-type-request-form','2025-05-12 12:15:58',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"3\":{\"id\":\"3\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_text\",\"type\":\"views\",\"label\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u0438\\u043f\\u0430 \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"fieldname\":\"name\",\"behaviors\":[\"validation_required\"],\"validation_required\":{\"prompt\":\"\\u042d\\u0442\\u043e \\u043f\\u043e\\u043b\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e!\"}},\"4\":{\"id\":\"4\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c\",\"fieldname\":\"submit-button\",\"btype\":\"submit\",\"behaviors\":[\"field_button.position\",\"color\",\"field_width\"],\"position\":\"self-center\",\"color\":{\"name\":\"orange\"},\"field_width\":\"300px\"},\"5\":{\"id\":\"5\",\"parent\":\"1\",\"section\":\"submit\",\"name\":\"save_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"request_types\",\"datasource\":\"{data:}\",\"behaviors\":[\"save_data.allowed_fields\",\"events\"],\"allowed_fields\":[\"name\"],\"events\":[\"saved\"]},\"6\":{\"id\":\"6\",\"parent\":\"5\",\"section\":\"saved\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h3\",\"position\":\"self-start\",\"text\":\"\\u0414\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u0441\\u043e\\u0445\\u0440\\u0430\\u043d\\u0435\\u043d\\u044b \\u0432 \\u0431\\u0430\\u0437\\u0443 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445!\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(2,0,'Read type request form','read-type-request-form','2025-05-13 11:10:26',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"3\":{\"id\":\"3\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"table\",\"type\":\"views\",\"data_source\":\"{data:}\",\"dbtable\":\"request_types\",\"events\":{\"1\":{\"name\":\"id\",\"title\":\" ID\",\"class\":\"\"},\"2\":{\"name\":\"name\",\"title\":\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\",\"class\":\"\"},\"3\":{\"name\":\"delete\",\"title\":\"\",\"class\":\"\"}},\"behaviors\":[\"table.expand\"],\"expand\":\"name\"},\"4\":{\"id\":\"4\",\"parent\":\"3\",\"section\":\"delete\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"fieldname\":\"\",\"btype\":\"link\",\"behaviors\":[\"field_button.position\",\"field_button.link\",\"color\"],\"position\":\"self-center\",\"url\":\"http:\\/\\/mcu-ukh-labinsk.tw1.ru\\/index.php\\/delete-type-request\",\"url_parameters\":\"id={var:row.id}\",\"color\":{\"name\":\"red\"}}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(3,0,'Delete type request form','delete-type-request-form','2025-05-13 10:16:28',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"4\":{\"id\":\"4\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"php\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"code\":\"defined(\'_JEXEC\') or die;\\r\\n\\r\\n\\/\\/ \\u041f\\u043e\\u043b\\u0443\\u0447\\u0430\\u0435\\u043c ID \\u0438\\u0437 URL\\r\\n$app = JFactory::getApplication();\\r\\n$id = $app->input->get(\'id\', 0, \'INT\');\"},\"5\":{\"id\":\"5\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"read_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"request_types\",\"read_type\":\"single\",\"behaviors\":[\"read_data.merge_data\",\"read_data.sql\"],\"sql\":\"SELECT * FROM request_types WHERE id = {data:id}\"},\"7\":{\"id\":\"7\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0412\\u044b \\u0443\\u0432\\u0435\\u0440\\u0435\\u043d\\u044b, \\u0447\\u0442\\u043e \\u0445\\u043e\\u0442\\u0438\\u0442\\u0435 \\u0443\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0442\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438: {var:read_data5.name}\"},\"6\":{\"id\":\"6\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"fieldname\":\"\",\"btype\":\"submit\",\"behaviors\":[\"field_button.position\",\"color\"],\"position\":\"self-center\",\"color\":{\"name\":\"orange\"}},\"8\":{\"id\":\"8\",\"parent\":\"1\",\"section\":\"submit\",\"name\":\"delete_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"request_types\",\"behaviors\":[\"events\",\"where_statement\"],\"events\":[\"deleted\"],\"where\":\"id={data:id}\"},\"11\":{\"id\":\"11\",\"parent\":\"8\",\"section\":\"deleted\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0422\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438 \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u0443\\u0434\\u0430\\u043b\\u0435\\u043d!\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(4,0,'Create request from','create-request-from','2025-05-13 09:23:26',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"2\":{\"id\":\"2\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_text\",\"type\":\"views\",\"label\":\"\\u0424\\u0418\\u041e\",\"fieldname\":\"full_name\",\"behaviors\":[\"validation_required\"],\"validation_required\":{\"prompt\":\" \\u042d\\u0442\\u043e \\u043f\\u043e\\u043b\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e!\"}},\"3\":{\"id\":\"3\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_text\",\"type\":\"views\",\"label\":\"\\u0423\\u043b\\u0438\\u0446\\u0430\",\"fieldname\":\"street\",\"behaviors\":[\"validation_required\"],\"validation_required\":{\"prompt\":\" \\u042d\\u0442\\u043e \\u043f\\u043e\\u043b\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e!\"}},\"4\":{\"id\":\"4\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_textarea\",\"type\":\"views\",\"label\":\"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435\",\"fieldname\":\"text\",\"behaviors\":[\"validation_required\"],\"validation_required\":{\"prompt\":\" \\u042d\\u0442\\u043e \\u043f\\u043e\\u043b\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e!\"}},\"6\":{\"id\":\"6\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"read_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"request_types\",\"read_type\":\"all\",\"behaviors\":[\"read_data.merge_data\"]},\"5\":{\"id\":\"5\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_select\",\"type\":\"views\",\"label\":\"\\u0422\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"fieldname\":\"type_id\",\"options\":\"\",\"behaviors\":[\"dynamic_options\",\"validation_required\"],\"dynamic_options\":{\"datasource\":\"{var:read_data6}\",\"value\":\"{row:id}\",\"text\":\"{row:name}\"},\"validation_required\":{\"prompt\":\" \\u042d\\u0442\\u043e \\u043f\\u043e\\u043b\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e!\"}},\"7\":{\"id\":\"7\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c\",\"fieldname\":\"submit\",\"btype\":\"submit\",\"behaviors\":[\"field_button.position\",\"color\"],\"position\":\"self-center\",\"color\":{\"name\":\"orange\"}},\"8\":{\"id\":\"8\",\"parent\":\"1\",\"section\":\"submit\",\"name\":\"save_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"requests\",\"datasource\":\"{data:}\",\"behaviors\":[\"save_data.allowed_fields\",\"events\"],\"allowed_fields\":[\"street\",\"full_name\",\"text\",\"type_id\"],\"events\":[\"saved\"]},\"9\":{\"id\":\"9\",\"parent\":\"8\",\"section\":\"saved\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0414\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u0441\\u043e\\u0445\\u0440\\u0430\\u043d\\u0435\\u043d\\u044b!\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(5,0,'Read request form','read-request-form','2025-05-14 08:35:08',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0438\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"2\":{\"id\":\"2\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"table\",\"type\":\"views\",\"data_source\":\"{data:}\",\"dbtable\":\"requests\",\"events\":{\"1\":{\"name\":\"id\",\"title\":\"ID\",\"class\":\"\"},\"2\":{\"name\":\"created_at\",\"title\":\"\\u0414\\u0430\\u0442\\u0430 \\u0441\\u043e\\u0437\\u0434\\u0430\\u043d\\u0438\\u044f\",\"class\":\"\"},\"3\":{\"name\":\"full_name\",\"title\":\"\\u0424\\u0418\\u041e\",\"class\":\"\"},\"4\":{\"name\":\"street\",\"title\":\"\\u0423\\u043b\\u0438\\u0446\\u0430\",\"class\":\"\"},\"5\":{\"name\":\"text\",\"title\":\"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435\",\"class\":\"\"},\"6\":{\"name\":\"type_id\",\"title\":\"\\u0422\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"class\":\"\"},\"7\":{\"name\":\"delete\",\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"class\":\"\"},\"8\":{\"name\":\"update\",\"title\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c\",\"class\":\"\"}},\"behaviors\":[\"table.sortable\",\"table.limit\"],\"sortable\":[\"created_at\"],\"limit\":\"20\"},\"3\":{\"id\":\"3\",\"parent\":\"2\",\"section\":\"delete\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"fieldname\":\"delete\",\"btype\":\"link\",\"behaviors\":[\"field_button.position\",\"field_button.link\",\"color\"],\"position\":\"self-center\",\"url\":\"http:\\/\\/mcu-ukh-labinsk.tw1.ru\\/index.php\\/delete-request\",\"url_parameters\":\"id={var:row.id}\",\"color\":{\"name\":\"red\"}},\"4\":{\"id\":\"4\",\"parent\":\"2\",\"section\":\"update\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c\",\"fieldname\":\"update\",\"btype\":\"link\",\"behaviors\":[\"field_button.position\",\"field_button.link\",\"color\"],\"position\":\"self-center\",\"url\":\"http:\\/\\/mcu-ukh-labinsk.tw1.ru\\/index.php\\/obnovit-zayavku\",\"url_parameters\":\"id={var:row.id}\",\"color\":{\"name\":\"orange\"}},\"9\":{\"id\":\"9\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"css\",\"type\":\"views\",\"code\":\"td {\\r\\n    max-width: 150px;\\r\\n    overflow: hidden;\\r\\n    text-overflow: ellipsis;\\r\\n    white-space: nowrap;\\r\\n    cursor: help; \\/* \\u041f\\u043e\\u0434\\u0441\\u043a\\u0430\\u0437\\u043a\\u0430 \\u043f\\u0440\\u0438 \\u043d\\u0430\\u0432\\u0435\\u0434\\u0435\\u043d\\u0438\\u0438 *\\/\\r\\n}\\r\\n\\r\\ntd:hover {\\r\\n    white-space: normal;\\r\\n    overflow: visible;\\r\\n    background: #fff;\\r\\n    z-index: 100;\\r\\n    position: relative;\\r\\n}\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(6,0,'Delete request form','delete-request-form','2025-05-13 10:22:43',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"2\":{\"id\":\"2\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"php\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"code\":\"defined(\'_JEXEC\') or die;\\r\\n\\r\\n\\/\\/ \\u041f\\u043e\\u043b\\u0443\\u0447\\u0430\\u0435\\u043c ID \\u0438\\u0437 URL\\r\\n$app = JFactory::getApplication();\\r\\n$id = $app->input->get(\'id\', 0, \'INT\');\"},\"3\":{\"id\":\"3\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"read_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"requests\",\"read_type\":\"single\",\"behaviors\":[\"read_data.merge_data\",\"read_data.sql\"],\"sql\":\"SELECT * FROM requests WHERE id = {data:id}\"},\"4\":{\"id\":\"4\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0412\\u044b \\u0443\\u0432\\u0435\\u0440\\u0435\\u043d\\u044b, \\u0447\\u0442\\u043e \\u0445\\u043e\\u0442\\u0438\\u0442\\u0435 \\u0443\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443?\"},\"5\":{\"id\":\"5\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"fieldname\":\"delete\",\"btype\":\"submit\",\"behaviors\":[\"field_button.position\",\"color\"],\"position\":\"self-center\",\"color\":{\"name\":\"red\"}},\"6\":{\"id\":\"6\",\"parent\":\"1\",\"section\":\"submit\",\"name\":\"delete_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"requests\",\"behaviors\":[\"events\",\"where_statement\"],\"where\":\"id={data:id}\",\"events\":[\"deleted\"]},\"7\":{\"id\":\"7\",\"parent\":\"6\",\"section\":\"deleted\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0430 \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u0443\\u0434\\u0430\\u043b\\u0435\\u043d\\u0430!\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(7,0,'Update request form','update-request-form','2025-05-13 11:06:51',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"8\":{\"id\":\"8\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"php\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"code\":\"defined(\'_JEXEC\') or die;\\r\\n\\r\\n\\/\\/ \\u041f\\u043e\\u043b\\u0443\\u0447\\u0430\\u0435\\u043c ID \\u0438\\u0437 URL\\r\\n$app = JFactory::getApplication();\\r\\n$id = $app->input->get(\'id\', 0, \'INT\');\"},\"7\":{\"id\":\"7\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"read_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"requests\",\"read_type\":\"single\",\"behaviors\":[\"read_data.merge_data\",\"read_data.sql\"],\"sql\":\"SELECT * FROM requests WHERE id = {data:id}\"},\"2\":{\"id\":\"2\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_text\",\"type\":\"views\",\"label\":\"\\u0424\\u0418\\u041e\",\"fieldname\":\"full_name\",\"behaviors\":[\"default_value\"],\"default_value\":{\"value\":\"{var:read_data7.full_name}\"}},\"3\":{\"id\":\"3\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_text\",\"type\":\"views\",\"label\":\"\\u0423\\u043b\\u0438\\u0446\\u0430\",\"fieldname\":\"street\",\"behaviors\":[\"default_value\"],\"default_value\":{\"value\":\"{var:read_data7.street}\"}},\"4\":{\"id\":\"4\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_textarea\",\"type\":\"views\",\"label\":\"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435\",\"fieldname\":\"text\",\"behaviors\":[\"default_value\"],\"default_value\":{\"value\":\"{var:read_data7.text}\"}},\"9\":{\"id\":\"9\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"read_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"request_types\",\"read_type\":\"all\",\"behaviors\":[\"read_data.merge_data\"]},\"5\":{\"id\":\"5\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_select\",\"type\":\"views\",\"label\":\"\\u0422\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\",\"fieldname\":\"type_id\",\"options\":\"\",\"behaviors\":[\"dynamic_options\"],\"dynamic_options\":{\"datasource\":\"{var:read_data9}\",\"value\":\"{row:id}\",\"text\":\"{row:name}\"}},\"6\":{\"id\":\"6\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u041e\\u0431\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c\",\"fieldname\":\"update\",\"btype\":\"submit\",\"behaviors\":[\"field_button.position\",\"color\"],\"position\":\"self-center\",\"color\":{\"name\":\"orange\"}},\"13\":{\"id\":\"13\",\"parent\":\"1\",\"section\":\"submit\",\"name\":\"save_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"requests\",\"datasource\":\"{data:}\",\"behaviors\":[\"save_data.allowed_fields\",\"events\",\"where_statement\"],\"allowed_fields\":[\"full_name\",\"street\",\"text\",\"type_id\"],\"events\":[\"saved\"],\"where\":\"id = {data:id}\"},\"14\":{\"id\":\"14\",\"parent\":\"13\",\"section\":\"saved\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0414\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u043e\\u0431\\u043d\\u043e\\u0432\\u043b\\u0435\\u043d\\u044b!\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(8,0,'Create work form','create-work-form','2025-05-13 14:04:52',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"2\":{\"id\":\"2\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_text\",\"type\":\"views\",\"label\":\"\\u0417\\u0430\\u0433\\u0430\\u043b\\u043e\\u0432\\u043e\\u043a\",\"fieldname\":\"title\",\"behaviors\":[\"validation_required\"],\"validation_required\":{\"prompt\":\" \\u042d\\u0442\\u043e \\u043f\\u043e\\u043b\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e!\"}},\"3\":{\"id\":\"3\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_textarea\",\"type\":\"views\",\"label\":\"\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435\",\"fieldname\":\"text\",\"behaviors\":[\"validation_required\"],\"validation_required\":{\"prompt\":\" \\u042d\\u0442\\u043e \\u043f\\u043e\\u043b\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e!\"}},\"4\":{\"id\":\"4\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_file\",\"type\":\"views\",\"label\":\"\\u041a\\u0430\\u0440\\u0442\\u0438\\u043d\\u043a\\u0430\",\"fieldname\":\"image\",\"max_size\":\"5000\",\"extensions\":[\"png\",\"jpg\"],\"behaviors\":[\"field_file.filename_provider\",\"field_file.upload_dir\"],\"filename_provider\":\"{file:safename}_{date:Ymd_His}.{file:extension}\",\"upload_dir\":\"{path:front}\\/uploads\\/\",\"create_upload_dir\":\"1\"},\"5\":{\"id\":\"5\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0414\\u043e\\u0431\\u0430\\u0432\\u0438\\u0442\\u044c\",\"fieldname\":\"submit\",\"btype\":\"submit\",\"behaviors\":[\"field_button.position\",\"color\"],\"position\":\"self-center\",\"color\":{\"name\":\"orange\"}},\"9\":{\"id\":\"9\",\"parent\":\"1\",\"section\":\"submit\",\"name\":\"save_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"work\",\"datasource\":\"{data:}\",\"behaviors\":[\"save_data.allowed_fields\",\"data_override\",\"events\"],\"allowed_fields\":[\"title\",\"text\",\"image_url\"],\"data_override\":\"image_url=http:\\/\\/mcu-ukh-labinsk.tw1.ru\\/components\\/com_chronoforms8\\/uploads\\/{data:image}\",\"events\":[\"saved\"]},\"10\":{\"id\":\"10\",\"parent\":\"9\",\"section\":\"saved\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0414\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u0441\\u043e\\u0445\\u0440\\u0430\\u043d\\u0435\\u043d\\u044b!\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(11,0,'Read work view form','read-work-view-form','2025-05-13 16:00:19',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"9\":{\"id\":\"9\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"html\",\"type\":\"views\",\"code\":\"<div class=\\\"work-header\\\" style=\\\"width: 100%; background: linear-gradient(135deg, #1a1a1a 0%, #2a2a2a 100%); color: white; padding: 80px 20px; text-align: center; margin-bottom: 50px; position: relative; overflow: hidden;\\\">\\r\\n    \\r\\n    <!-- \\u0414\\u0435\\u043a\\u043e\\u0440\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u0435 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u044b -->\\r\\n    <div style=\\\"position: absolute; top: -50px; left: -50px; width: 200px; height: 200px; border-radius: 50%; background: rgba(236,67,15,0.1);\\\"><\\/div>\\r\\n    <div style=\\\"position: absolute; bottom: -30px; right: -30px; width: 150px; height: 150px; border-radius: 50%; background: rgba(236,67,15,0.1);\\\"><\\/div>\\r\\n    \\r\\n    <!-- \\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 -->\\r\\n    <div style=\\\"position: relative; z-index: 2; max-width: 1000px; margin: 0 auto;\\\">\\r\\n        <h1 style=\\\"font-size: 3.2em; margin: 0 0 20px 0; font-weight: 700; text-shadow: 0 2px 4px rgba(0,0,0,0.3);\\\">\\r\\n            \\u041d\\u0430\\u0448\\u0430 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\r\\n        <\\/h1>\\r\\n        \\r\\n        <div style=\\\"width: 80px; height: 4px; background: #EC430F; margin: 0 auto 25px;\\\"><\\/div>\\r\\n        \\r\\n        <p style=\\\"font-size: 1.3em; line-height: 1.6; margin-bottom: 30px; max-width: 800px; margin-left: auto; margin-right: auto;\\\">\\r\\n            \\u0417\\u0434\\u0435\\u0441\\u044c \\u043c\\u044b \\u0434\\u0435\\u043c\\u043e\\u043d\\u0441\\u0442\\u0440\\u0438\\u0440\\u0443\\u0435\\u043c \\u043d\\u0430\\u0448\\u0438 \\u043b\\u0443\\u0447\\u0448\\u0438\\u0435 \\u043f\\u0440\\u043e\\u0435\\u043a\\u0442\\u044b \\u0438 \\u0434\\u043e\\u0441\\u0442\\u0438\\u0436\\u0435\\u043d\\u0438\\u044f. \\u041a\\u0430\\u0436\\u0434\\u0430\\u044f \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430 - \\u044d\\u0442\\u043e \\u0440\\u0435\\u0437\\u0443\\u043b\\u044c\\u0442\\u0430\\u0442 \\r\\n            \\u043f\\u0440\\u043e\\u0444\\u0435\\u0441\\u0441\\u0438\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u0434\\u0445\\u043e\\u0434\\u0430.\\r\\n        <\\/p>\\r\\n        \\r\\n        <a href=\\\"#work-list\\\" style=\\\"display: inline-block; background: #EC430F; color: white; padding: 12px 30px; border-radius: 30px; text-decoration: none; font-weight: 600; transition: all 0.3s ease; box-shadow: 0 4px 6px rgba(0,0,0,0.1);\\\" \\r\\n           onmouseover=\\\"this.style.transform=\'translateY(-3px)\'; this.style.boxShadow=\'0 6px 10px rgba(236,67,15,0.3)\'; this.style.background=\'#FF521F\';\\\" \\r\\n           onmouseout=\\\"this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'0 4px 6px rgba(0,0,0,0.1)\'; this.style.background=\'#EC430F\';\\\">\\r\\n            \\u0421\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b\\r\\n        <\\/a>\\r\\n    <\\/div>\\r\\n<\\/div>\\r\\n\\r\\n<!-- \\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f -->\\r\\n<div style=\\\"max-width: 1000px; margin: 0 auto 60px; padding: 0 20px; text-align: center;\\\">\\r\\n    <p style=\\\"font-size: 1.1em; color: #555; line-height: 1.7;\\\">\\r\\n        \\u041c\\u044b \\u0433\\u043e\\u0440\\u0434\\u0438\\u043c\\u0441\\u044f \\u043a\\u0430\\u0436\\u0434\\u044b\\u043c \\u0437\\u0430\\u0432\\u0435\\u0440\\u0448\\u0435\\u043d\\u043d\\u044b\\u043c \\u043f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043e\\u043c \\u0438 \\u0441 \\u0440\\u0430\\u0434\\u043e\\u0441\\u0442\\u044c\\u044e \\u0434\\u0435\\u043b\\u0438\\u043c\\u0441\\u044f \\u043d\\u0430\\u0448\\u0438\\u043c \\u043e\\u043f\\u044b\\u0442\\u043e\\u043c. \\r\\n        \\u041f\\u0440\\u043e\\u043a\\u0440\\u0443\\u0442\\u0438\\u0442\\u0435 \\u0432\\u043d\\u0438\\u0437, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0443\\u0432\\u0438\\u0434\\u0435\\u0442\\u044c \\u043f\\u0440\\u0438\\u043c\\u0435\\u0440\\u044b \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b!\\r\\n    <\\/p>\\r\\n<\\/div>\\r\\n\\r\\n<!-- \\u0417\\u0434\\u0435\\u0441\\u044c \\u043d\\u0430\\u0447\\u0438\\u043d\\u0430\\u0435\\u0442\\u0441\\u044f \\u0441\\u043f\\u0438\\u0441\\u043e\\u043a \\u0440\\u0430\\u0431\\u043e\\u0442 -->\\r\\n<div id=\\\"work-list\\\"><\\/div>\"},\"7\":{\"id\":\"7\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"php\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"code\":\"\\/\\/ \\u041f\\u043e\\u043b\\u0443\\u0447\\u0430\\u0435\\u043c \\u0434\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0438\\u0437 \\u0431\\u0430\\u0437\\u044b \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445\\r\\n$db = JFactory::getDbo();\\r\\n$query = $db->getQuery(true)\\r\\n    ->select(\'*\')\\r\\n    ->from($db->quoteName(\'work\'))\\r\\n    ->order($db->quoteName(\'id\') . \' DESC\');\\r\\n\\r\\n$db->setQuery($query);\\r\\n$works = $db->loadObjectList();\\r\\n\\r\\n\\/\\/ \\u0411\\u0430\\u0437\\u043e\\u0432\\u044b\\u0439 URL \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0432\\u0435\\u0440\\u043a\\u0438 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0439\\r\\n$baseUploadUrl = \'http:\\/\\/mcu-ukh-labinsk.tw1.ru\\/components\\/com_chronoforms8\\/uploads\\/\';\\r\\n\\r\\n\\/\\/ \\u041f\\u0440\\u043e\\u0432\\u0435\\u0440\\u044f\\u0435\\u043c, \\u0435\\u0441\\u0442\\u044c \\u043b\\u0438 \\u0440\\u0435\\u0437\\u0443\\u043b\\u044c\\u0442\\u0430\\u0442\\u044b\\r\\nif (!empty($works)) {\\r\\n    echo \'<div class=\\\"work-posts-container\\\" style=\\\"width: 100%; max-width: 100%; margin: 0; padding: 0; box-sizing: border-box;\\\">\';\\r\\n    \\r\\n    foreach ($works as $work) {\\r\\n        echo \'<div class=\\\"work-post\\\" style=\\\"width: 100%; max-width: 100%; margin: 0 auto 30px; background: #fff; border-radius: 0; box-shadow: 0 2px 15px rgba(0,0,0,0.1); overflow: hidden; box-sizing: border-box;\\\">\';\\r\\n        \\r\\n        \\/\\/ \\u041f\\u0440\\u043e\\u0432\\u0435\\u0440\\u044f\\u0435\\u043c \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0435 \\u0438\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f\\r\\n        $hasImage = !empty($work->image_url) && $work->image_url != $baseUploadUrl && filter_var($work->image_url, FILTER_VALIDATE_URL);\\r\\n        \\r\\n        if ($hasImage) {\\r\\n            echo \'<div class=\\\"work-image\\\" style=\\\"width: 100%; overflow: hidden; display: flex; justify-content: center; align-items: center; background: #f5f5f5;\\\">\';\\r\\n            echo \'<img src=\\\"\' . htmlspecialchars($work->image_url) . \'\\\" alt=\\\"\' . htmlspecialchars($work->title) . \'\\\" style=\\\"max-width: 100%; height: auto; display: block;\\\">\';\\r\\n            echo \'<\\/div>\';\\r\\n        }\\r\\n        \\r\\n        echo \'<div class=\\\"work-content\\\" style=\\\"padding: 20px; max-width: 1200px; margin: 0 auto; box-sizing: border-box;\\\">\';\\r\\n        \\r\\n        \\/\\/ \\u0412\\u044b\\u0432\\u043e\\u0434 \\u0437\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043a\\u0430\\r\\n        echo \'<h1 class=\\\"work-title\\\" style=\\\"margin: 0 0 20px 0; color: #222; font-size: clamp(1.5em, 5vw, 2.2em);\\\">\' . htmlspecialchars($work->title) . \'<\\/h1>\';\\r\\n        \\r\\n        \\/\\/ \\u0412\\u044b\\u0432\\u043e\\u0434 \\u0442\\u0435\\u043a\\u0441\\u0442\\u0430\\r\\n        echo \'<div class=\\\"work-text\\\" style=\\\"color: #444; line-height: 1.6; font-size: 1em;\\\">\' . $work->text . \'<\\/div>\';\\r\\n        \\r\\n        echo \'<\\/div>\'; \\/\\/ \\u0417\\u0430\\u043a\\u0440\\u044b\\u0432\\u0430\\u0435\\u043c work-content\\r\\n        echo \'<\\/div>\'; \\/\\/ \\u0417\\u0430\\u043a\\u0440\\u044b\\u0432\\u0430\\u0435\\u043c work-post\\r\\n    }\\r\\n    \\r\\n    echo \'<\\/div>\'; \\/\\/ \\u0417\\u0430\\u043a\\u0440\\u044b\\u0432\\u0430\\u0435\\u043c work-posts-container\\r\\n} else {\\r\\n    echo \'<p style=\\\"text-align: center; padding: 40px; color: #666; width: 100%; font-size: 1.2em; box-sizing: border-box;\\\">\\u041d\\u0435\\u0442 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445 \\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0435 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438<\\/p>\';\\r\\n}\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(12,0,'Read work form','read-work-form','2025-05-14 08:20:14',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"2\":{\"id\":\"2\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"table\",\"type\":\"views\",\"data_source\":\"{data:}\",\"dbtable\":\"work\",\"events\":{\"1\":{\"name\":\"id\",\"title\":\"ID\",\"class\":\"\"},\"2\":{\"name\":\"title\",\"title\":\"\\u0417\\u0430\\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u043a\",\"class\":\"\"},\"3\":{\"name\":\"delete\",\"title\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"class\":\"\"}},\"behaviors\":[\"table.expand\"],\"expand\":\"title\"},\"3\":{\"id\":\"3\",\"parent\":\"2\",\"section\":\"delete\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"fieldname\":\"delete\",\"btype\":\"link\",\"behaviors\":[\"field_button.position\",\"field_button.link\",\"color\"],\"position\":\"self-center\",\"color\":{\"name\":\"red\"},\"url\":\"http:\\/\\/mcu-ukh-labinsk.tw1.ru\\/index.php\\/udalit-rabotu\",\"url_parameters\":\"id={var:row.id}\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}'),
(13,0,'Delete work form','delete-work-form','2025-05-14 08:25:32',1,'','{\"1\":{\"id\":\"1\",\"type\":\"page\",\"minimized\":\"\",\"title\":\"Page1\",\"alias\":\"page1\",\"pagegroup\":\"\",\"icon\":\"\"},\"2\":{\"id\":\"2\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"php\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"code\":\"defined(\'_JEXEC\') or die;\\r\\n\\r\\n\\/\\/ \\u041f\\u043e\\u043b\\u0443\\u0447\\u0430\\u0435\\u043c ID \\u0438\\u0437 URL\\r\\n$app = JFactory::getApplication();\\r\\n$id = $app->input->get(\'id\', 0, \'INT\');\"},\"4\":{\"id\":\"4\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"read_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"work\",\"read_type\":\"single\",\"behaviors\":[\"read_data.merge_data\",\"read_data.sql\"],\"sql\":\"SELECT * FROM work WHERE id = {data:id}\"},\"3\":{\"id\":\"3\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0412\\u044b \\u0443\\u0432\\u0435\\u0440\\u0435\\u043d\\u044b, \\u0447\\u0442\\u043e \\u0445\\u043e\\u0442\\u0438\\u0442\\u0435 \\u0443\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443: {var:read_data4.title}\"},\"5\":{\"id\":\"5\",\"parent\":\"1\",\"section\":\"load\",\"name\":\"field_button\",\"type\":\"views\",\"label\":\"\\u0423\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c\",\"fieldname\":\"delete\",\"btype\":\"submit\",\"behaviors\":[\"field_button.position\",\"color\"],\"position\":\"self-center\",\"color\":{\"name\":\"red\"}},\"6\":{\"id\":\"6\",\"parent\":\"1\",\"section\":\"submit\",\"name\":\"delete_data\",\"type\":\"actions\",\"settings\":{\"disabled\":\"\",\"name\":\"\"},\"dbtable\":\"work\",\"behaviors\":[\"events\",\"where_statement\"],\"where\":\"id={data:id}\",\"events\":[\"deleted\"]},\"7\":{\"id\":\"7\",\"parent\":\"6\",\"section\":\"deleted\",\"name\":\"header\",\"type\":\"views\",\"tag\":\"h4\",\"position\":\"self-start\",\"text\":\"\\u0420\\u0430\\u0431\\u043e\\u0442\\u0430 \\u0443\\u0441\\u043f\\u0435\\u0448\\u043d\\u043e \\u0443\\u0434\\u0430\\u043b\\u0435\\u043d\\u0430!\"}}','{\"log_data\":\"1\",\"info\":\"\",\"debug\":\"0\",\"next_page\":\"1\",\"navbar\":\"1\",\"method\":\"post\",\"ajax\":\"\",\"action\":\"\",\"class\":\"\",\"css_vars\":{\"pad\":\"\",\"space\":\"\",\"rad\":\"\",\"bw\":\"\"},\"acl\":\"\",\"acl_error\":\"You can not access this form.\",\"session_token_error\":\"Your session has timed out or your tried to access a wrong page.\"}');
/*!40000 ALTER TABLE `amtf3_chronoforms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_chronoforms8_datalog`
--

DROP TABLE IF EXISTS `amtf3_chronoforms8_datalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_chronoforms8_datalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_chronoforms8_datalog`
--

LOCK TABLES `amtf3_chronoforms8_datalog` WRITE;
/*!40000 ALTER TABLE `amtf3_chronoforms8_datalog` DISABLE KEYS */;
INSERT INTO `amtf3_chronoforms8_datalog` VALUES
(1,1,306,'95.153.177.69','2025-05-12 11:56:22','{\"3\":\"\"}'),
(2,1,306,'95.153.161.89','2025-05-12 12:04:02','{\"3\":\"dd\"}'),
(3,1,306,'95.153.161.89','2025-05-12 12:05:46','{\"3\":\"ff\"}'),
(4,1,306,'95.153.161.89','2025-05-12 12:07:21','{\"3\":\"dsf\"}'),
(5,1,306,'95.153.161.89','2025-05-12 12:08:57','{\"3\":\"\\u0430\\u0432\\u0430\\u0432\"}'),
(6,1,306,'95.153.161.89','2025-05-12 12:10:30','{\"3\":\"f\"}'),
(7,1,306,'95.153.161.89','2025-05-12 12:11:02','{\"3\":\"fd\"}'),
(8,1,306,'95.153.161.89','2025-05-12 12:11:37','{\"3\":\"fd\"}'),
(9,1,306,'95.153.161.89','2025-05-12 12:13:02','{\"3\":\"df\"}'),
(10,1,306,'95.153.161.89','2025-05-12 12:14:05','{\"3\":\"ff\"}'),
(11,1,306,'95.153.161.89','2025-05-12 12:14:52','{\"3\":\"f\"}'),
(12,1,306,'95.153.161.89','2025-05-12 12:16:30','{\"3\":\"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0430\"}'),
(13,1,306,'95.153.161.89','2025-05-12 12:19:45','{\"3\":\"\\u0422\\u0438\\u043f \\u0437\\u0430\\u044f\\u0432\\u043a\\u0438\"}'),
(14,1,306,'95.153.161.89','2025-05-12 12:32:56','{\"3\":\"\\u0419\\u0419\"}'),
(15,1,318,'95.153.163.8','2025-05-13 07:52:54','{\"3\":\"qq\"}'),
(16,3,318,'95.153.163.8','2025-05-13 08:44:03','[]'),
(17,3,318,'95.153.163.8','2025-05-13 08:44:07','[]'),
(18,3,318,'95.153.163.8','2025-05-13 08:44:11','[]'),
(19,1,318,'95.153.163.8','2025-05-13 08:44:28','{\"3\":\"\\u041a\\u043b\\u0430\\u0441\\u0441\"}'),
(20,1,318,'95.153.163.8','2025-05-13 09:03:39','{\"3\":\"Vety\"}'),
(21,1,318,'95.153.163.8','2025-05-13 09:13:59','{\"3\":\"Good\"}'),
(22,4,318,'95.153.163.8','2025-05-13 09:17:54','{\"2\":\"\\u0424\\u0418\\u041e\",\"3\":\"\\u0423\\u043b\\u0438\\u0446\\u0430\",\"4\":\"\\u0422\\u0415\\u041a\\u0421\\u0422\",\"5\":\"7\"}'),
(23,4,318,'95.153.163.8','2025-05-13 09:19:12','{\"2\":\"\\u0439\\u0439\",\"3\":\"\\u0439\\u0439\",\"4\":\"\\u0439\\u0439\",\"5\":\"6\"}'),
(24,4,318,'95.153.163.8','2025-05-13 09:20:23','{\"2\":\"\\u0430\\u0432\\u044b\",\"3\":\"\\u044b\\u0432\\u0430\",\"4\":\"\\u044b\\u0432\\u0430\",\"5\":\"6\"}'),
(25,4,318,'95.153.163.8','2025-05-13 09:21:46','{\"2\":\"\\u0439\\u0446\\u0443\",\"3\":\"\\u043a\\u0439\\u0446\",\"4\":\"\\u0446\\u043a\\u0439\",\"5\":\"6\"}'),
(26,4,318,'95.153.163.8','2025-05-13 09:22:14','{\"2\":\"\\u0430\\u043f\",\"3\":\"\\u0432\\u0430\\u0440\\u043f\",\"4\":\"\\u0432\\u0430\\u0440\\u043f\",\"5\":\"6\"}'),
(27,4,318,'95.153.163.8','2025-05-13 09:22:56','{\"2\":\"\\u0430\\u0432\",\"3\":\"\\u0432\\u0430\",\"4\":\"\\u0430\\u0432\",\"5\":\"6\"}'),
(28,4,318,'95.153.163.8','2025-05-13 09:23:41','{\"2\":\"\\u0424\\u0418\\u041e\",\"3\":\"\\u0421\\u0442\\u0440\\u0438\\u0442\",\"4\":\"\\u0422\\u0415\\u041a\\u0421\\u0422\",\"5\":\"7\"}'),
(29,4,318,'95.153.163.8','2025-05-13 09:44:46','{\"2\":\"\\u0419\\u0419\",\"3\":\"\\u0419\\u0419\",\"4\":\"\\u0419\\u0419\",\"5\":\"6\"}'),
(30,4,318,'95.153.163.8','2025-05-13 09:45:40','{\"2\":\"\\u0419\\u0419\",\"3\":\"\\u0439\\u0439\",\"4\":\"\\u0439\\u0446\",\"5\":\"6\"}'),
(31,4,318,'95.153.163.8','2025-05-13 09:46:03','{\"2\":\"\\u043a\\u0439\\u0443\\u0435\\u0446\",\"3\":\"\\u0439\\u043a\\u0435\",\"4\":\"\\u0439\\u0435\\u043a\",\"5\":\"6\"}'),
(32,4,318,'95.153.163.8','2025-05-13 09:46:43','{\"2\":\"\\u0432\\u0430\\u044b\\u0444\",\"3\":\"\\u0444\\u044b\\u0430\\u0432\",\"4\":\"\\u0444\\u044b\\u0432\\u0430\",\"5\":\"8\"}'),
(33,4,318,'95.153.163.8','2025-05-13 09:46:59','{\"2\":\"\\u0430\\u044b\\u043f\\u0444\",\"3\":\"\\u044b\\u0432\\u0430\\u043f\",\"4\":\"\\u044b\\u0432\\u043f\\u0430\",\"5\":\"6\"}'),
(34,4,318,'95.153.163.8','2025-05-13 09:54:22','{\"2\":\"sdggasgafdagfgfafga\",\"3\":\"gsfdgfds\",\"4\":\"sdgfsgfdgsfdgfsddgfsfgd\",\"5\":\"6\"}'),
(35,4,318,'95.153.163.8','2025-05-13 09:54:30','{\"2\":\"dgfssdgf\",\"3\":\"dgfs\",\"4\":\"sdgf\",\"5\":\"6\"}'),
(36,4,318,'95.153.163.8','2025-05-13 09:54:34','{\"2\":\"sdgfsgfd\",\"3\":\"sgfdsfdg\",\"4\":\"sgfd\",\"5\":\"6\"}'),
(37,4,318,'95.153.163.8','2025-05-13 09:54:38','{\"2\":\"sdgffsgd\",\"3\":\"sdgf\",\"4\":\"sdgf\",\"5\":\"6\"}'),
(38,4,318,'95.153.163.8','2025-05-13 09:54:41','{\"2\":\"sdfgsgfd\",\"3\":\"gfsd\",\"4\":\"sfgd\",\"5\":\"6\"}'),
(39,4,318,'95.153.163.8','2025-05-13 09:54:47','{\"2\":\"sgdf\",\"3\":\"sdgf\",\"4\":\"sdgf\",\"5\":\"6\"}'),
(40,4,318,'95.153.163.8','2025-05-13 09:54:52','{\"2\":\"sdfg\",\"3\":\"sgfd\",\"4\":\"sgdf\",\"5\":\"6\"}'),
(41,4,318,'95.153.163.8','2025-05-13 09:54:55','{\"2\":\"sdgf\",\"3\":\"sdgfsgd\",\"4\":\"sgdf\",\"5\":\"6\"}'),
(42,4,318,'95.153.163.8','2025-05-13 09:54:58','{\"2\":\"sdgf\",\"3\":\"sdgf\",\"4\":\"sgfd\",\"5\":\"6\"}'),
(43,4,318,'95.153.163.8','2025-05-13 09:55:03','{\"2\":\"sdgf\",\"3\":\"sfdg\",\"4\":\"sfdg\",\"5\":\"6\"}'),
(44,4,318,'95.153.163.8','2025-05-13 09:55:07','{\"2\":\"sdgf\",\"3\":\"sgfd\",\"4\":\"sdgf\",\"5\":\"6\"}'),
(45,4,318,'95.153.163.8','2025-05-13 09:55:10','{\"2\":\"sfgd\",\"3\":\"sfgd\",\"4\":\"sgfd\",\"5\":\"6\"}'),
(46,4,318,'95.153.163.8','2025-05-13 09:55:13','{\"2\":\"sgfd\",\"3\":\"sgfd\",\"4\":\"sdgf\",\"5\":\"6\"}'),
(47,4,318,'95.153.163.8','2025-05-13 09:55:16','{\"2\":\"sdfg\",\"3\":\"sgfd\",\"4\":\"sgdf\",\"5\":\"6\"}'),
(48,4,318,'95.153.163.8','2025-05-13 09:55:19','{\"2\":\"sdfg\",\"3\":\"sdfg\",\"4\":\"sgfd\",\"5\":\"6\"}'),
(49,4,318,'95.153.163.8','2025-05-13 09:55:22','{\"2\":\"sdfgsgfd\",\"3\":\"sgdf\",\"4\":\"sgdf\",\"5\":\"6\"}'),
(50,4,318,'95.153.163.8','2025-05-13 10:01:21','{\"2\":\"sgfdgfsdsfgd\",\"3\":\"sgfdsgdfgsfdgfssfgdgdf\",\"4\":\"sgfdsgdfgsfdgfssfgdgdfsgfdsgdfgsfdgfssfgdgdfsgfdsgdfgsfdgfssfgdgdfsgfdsgdfgsfdgfssfgdgdfsgfdsgdfgsfdgfssfgdgdf\",\"5\":\"6\"}'),
(51,5,318,'95.153.163.8','2025-05-13 10:03:07','[]'),
(52,5,318,'95.153.163.8','2025-05-13 10:06:44','[]'),
(53,5,318,'95.153.163.8','2025-05-13 10:06:46','[]'),
(54,3,318,'95.153.163.8','2025-05-13 10:19:26','[]'),
(55,6,318,'95.153.163.8','2025-05-13 10:19:40','[]'),
(56,6,318,'95.153.163.8','2025-05-13 10:19:44','[]'),
(57,5,318,'95.153.163.8','2025-05-13 10:20:45','[]'),
(58,6,318,'95.153.163.8','2025-05-13 10:22:47','[]'),
(59,6,318,'95.153.163.8','2025-05-13 10:22:51','[]'),
(60,6,318,'95.153.163.8','2025-05-13 10:22:55','[]'),
(61,6,318,'95.153.163.8','2025-05-13 10:23:02','[]'),
(62,5,318,'95.153.163.8','2025-05-13 10:24:44','[]'),
(63,7,318,'95.153.177.40','2025-05-13 11:05:26','{\"2\":\"\\u0424\\u0418\\u041e2\",\"3\":\"\\u0421\\u0442\\u0440\\u0438\\u0442\",\"4\":\"\\u0422\\u0415\\u041a\\u0421\\u0422\",\"5\":\"7\"}'),
(64,4,318,'95.153.177.40','2025-05-13 11:06:16','{\"2\":\"1\",\"3\":\"1\",\"4\":\"1\",\"5\":\"8\"}'),
(65,7,318,'95.153.177.40','2025-05-13 11:07:06','{\"2\":\"sdfgsgfd\",\"3\":\"sgdf\",\"4\":\"sgdf\",\"5\":\"7\"}'),
(66,7,318,'95.153.177.40','2025-05-13 11:07:17','{\"2\":\"Good\",\"3\":\"sgdf\",\"4\":\"sgdf\",\"5\":\"8\"}'),
(67,7,318,'95.153.177.40','2025-05-13 11:07:24','{\"2\":\"sdfg\",\"3\":\"sdfg\",\"4\":\"sgfd\",\"5\":\"7\"}'),
(68,4,318,'95.153.177.40','2025-05-13 11:07:37','{\"2\":\"2\",\"3\":\"2\",\"4\":\"2\",\"5\":\"8\"}'),
(69,1,318,'95.153.177.40','2025-05-13 11:10:36','{\"3\":\"VV\"}'),
(70,4,318,'95.153.177.40','2025-05-13 11:10:48','{\"2\":\"566\",\"3\":\"156\",\"4\":\"56\",\"5\":\"9\"}'),
(71,6,318,'95.153.177.40','2025-05-13 11:28:49','[]'),
(72,6,318,'95.153.177.40','2025-05-13 11:28:56','[]'),
(73,8,318,'95.153.176.31','2025-05-13 13:35:22','{\"2\":\"\\u0430\\u0432\",\"3\":\"\\u0432\\u0430\",\"4\":\"ukh-labinsk_20250513_133522.jpg\"}'),
(74,8,318,'95.153.163.4','2025-05-13 13:43:17','{\"2\":\"q\",\"3\":\"q\",\"4\":\"bg-fc50702a-a71c-4a51-90af-92ba5dc242de_20250513_134317.jpg\"}'),
(75,8,318,'95.153.163.4','2025-05-13 13:47:18','{\"2\":\"daf\",\"3\":\"sdf\",\"4\":\"bg-fc50702a-a71c-4a51-90af-92ba5dc242de_20250513_134718.jpg\"}'),
(76,8,318,'95.153.163.4','2025-05-13 13:49:26','{\"2\":\"sdf\",\"3\":\"sdf\",\"4\":\"bg-fc50702a-a71c-4a51-90af-92ba5dc242de_20250513_134926.jpg\"}'),
(77,8,318,'95.153.163.4','2025-05-13 13:53:57','{\"2\":\"q\",\"3\":\"q\",\"4\":\"bg-fc50702a-a71c-4a51-90af-92ba5dc242de_20250513_135357.jpg\"}'),
(78,8,318,'95.153.163.4','2025-05-13 13:55:03','{\"2\":\"sdf\",\"3\":\"sdf\",\"4\":\"bg-fc50702a-a71c-4a51-90af-92ba5dc242de_20250513_135503.jpg\"}'),
(79,8,318,'95.153.162.218','2025-05-13 13:59:16','{\"2\":\"sd\",\"3\":\"sd\",\"4\":\"bg-fc50702a-a71c-4a51-90af-92ba5dc242de_20250513_135916.jpg\"}'),
(80,8,318,'95.153.162.218','2025-05-13 14:00:17','{\"2\":\"dsf\",\"3\":\"sdgf\",\"4\":\"bg-fc50702a-a71c-4a51-90af-92ba5dc242de_20250513_140017.jpg\"}'),
(81,8,318,'95.153.176.108','2025-05-13 14:04:40','{\"2\":\"Title\",\"3\":\"Work\",\"4\":\"bg-581187c7-0aff-4e48-bdd6-b3498eea1324_20250513_140440.jpg\"}'),
(82,8,318,'95.153.176.108','2025-05-13 14:18:52','{\"2\":\"fgd\",\"3\":\"gfd\",\"4\":\"bg-bf700fa9-7468-43b8-9bf3-f07c602c9779_20250513_141852.jpg\"}'),
(83,8,318,'95.153.176.108','2025-05-13 14:27:58','{\"2\":\"df\",\"3\":\"df\",\"4\":null}'),
(84,8,318,'95.153.163.18','2025-05-13 15:54:55','{\"2\":\"\\u0411\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439\",\"3\":\"\\u0412 \\u0440\\u0430\\u043c\\u043a\\u0430\\u0445 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u044b \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0432 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0435 \\u0432\\u0435\\u0434\\u0443\\u0442\\u0441\\u044f \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u043f\\u043e \\u043e\\u0437\\u0435\\u043b\\u0435\\u043d\\u0435\\u043d\\u0438\\u044e \\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442\\u0443 \\u0434\\u0432\\u043e\\u0440\\u043e\\u0432\\u044b\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439. \\u0416\\u0434\\u0435\\u043c \\u0432\\u0430\\u0448\\u0438\\u0445 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0439 \\u043f\\u043e \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u044e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0441\\u0440\\u0435\\u0434\\u044b!\",\"4\":\"ozelenenie-territorii-01_20250513_155455.jpg\"}'),
(85,8,318,'95.153.163.18','2025-05-13 15:56:04','{\"2\":\"\\u0421\\u0443\\u0431\\u0431\\u043e\\u0442\\u043d\\u0438\\u043a: \\u0421\\u0434\\u0435\\u043b\\u0430\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434 \\u0447\\u0438\\u0449\\u0435!\",\"3\":\"\\u041f\\u0440\\u0438\\u0433\\u043b\\u0430\\u0448\\u0430\\u0435\\u043c \\u0432\\u0441\\u0435\\u0445 \\u0436\\u0435\\u043b\\u0430\\u044e\\u0449\\u0438\\u0445 \\u043f\\u0440\\u0438\\u043d\\u044f\\u0442\\u044c \\u0443\\u0447\\u0430\\u0441\\u0442\\u0438\\u0435 \\u0432 \\u043e\\u0431\\u0449\\u0435\\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u043c \\u0441\\u0443\\u0431\\u0431\\u043e\\u0442\\u043d\\u0438\\u043a\\u0435. \\u0412\\u043c\\u0435\\u0441\\u0442\\u0435 \\u043c\\u044b \\u0441\\u043c\\u043e\\u0436\\u0435\\u043c \\u0441\\u0434\\u0435\\u043b\\u0430\\u0442\\u044c \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a \\u0435\\u0449\\u0435 \\u0447\\u0438\\u0449\\u0435 \\u0438 \\u0443\\u044e\\u0442\\u043d\\u0435\\u0435! \\u0414\\u0430\\u0442\\u0430 \\u0438 \\u043c\\u0435\\u0441\\u0442\\u043e \\u0443\\u0442\\u043e\\u0447\\u043d\\u044f\\u044e\\u0442\\u0441\\u044f\",\"4\":\"be9cbb10-f50a-5421-beb5-67b17b1c5a51_20250513_155604.jpg\"}'),
(86,8,318,'95.153.176.108','2025-05-14 08:25:40','{\"2\":\"\\u044b\\u0432\\u0444\\u0430\",\"3\":\"\\u0444\\u044b\\u0432\\u0430\",\"4\":null}'),
(87,13,318,'95.153.176.108','2025-05-14 08:25:57','[]'),
(88,4,318,'95.153.176.108','2025-05-14 08:27:04','{\"2\":\"\\u0410\\u043b\\u0435\\u043a\\u0441\\u0435\\u0439 \\u0410\\u043b\\u0435\\u043a\\u0441\\u0435\\u0435\\u0432\\u0438\\u0447 \\u0410\\u043b\\u0435\\u043a\\u0441\",\"3\":\"\\u0423\\u043b. \\u041b\\u0435\\u043d\\u0438\\u043d\\u0430, \\u0434\\u043e\\u043c 3\",\"4\":\"\\u0410\\u0424\\u0412\\u0412\\u042b\\u0430\\u044b\\u0430\\u0432\\u0444\\u0430\\u0444\\u044b\\u0432\\u0430\\u0444\\u0432\\u044b \\u0444\\u0432\\u044b\\u0430\\u0444\\u0432\\u0430\\u044b\\u0430\\u0444\\u0432\\u0432\\u0444\\u0430\\u044b, \\u0430\\u044b\\u0432\\u0444\\u0430\\u044b\\u0432\\u0430\\u044b\\u0432\\u0444\\u044b\\u0432\\u0444\\u0430, \\u044b\\u0430\\u0432\\u043f\\u044b\\u0430\\u0432\\u043f\\u0430\\u044b\\u0432\\u044b\\u0430\\u043f\\u0432\\u043f\\u0430\\u044b\\u0432\\u043f\\u0430\\u044b\\u0432\\u043f\\u0430\\u044b\\u0432\\u043f\\u0430\\u044b\\u0432, \\u043f\\u0430\\u044b\\u0432\\u043f\\u0430\\u044b\\u0432\\u043f\\u0430\\u044b\\u0432\\u043f\\u0430\\u0432\\u044b\\u0430\\u043f\\u0432\\u044b\\u043f\\u0430\\u0432\\u044b\\u043f\\u0430\\u044b\\u0432\",\"5\":\"9\"}');
/*!40000 ALTER TABLE `amtf3_chronoforms8_datalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_chronog3_extensions`
--

DROP TABLE IF EXISTS `amtf3_chronog3_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_chronog3_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(4) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_chronog3_extensions`
--

LOCK TABLES `amtf3_chronog3_extensions` WRITE;
/*!40000 ALTER TABLE `amtf3_chronog3_extensions` DISABLE KEYS */;
INSERT INTO `amtf3_chronog3_extensions` VALUES
(2,'com_chronoforms8',0,0,'{\"utime\":1747043075,\"mcu-ukh-labinsk_tw1_ru\":174790708154343,\"vkey\":\"\",\"vtime\":1747043081}');
/*!40000 ALTER TABLE `amtf3_chronog3_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_contact_details`
--

DROP TABLE IF EXISTS `amtf3_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `catid` int(11) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL DEFAULT '',
  `sortname2` varchar(255) NOT NULL DEFAULT '',
  `sortname3` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(7) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `metakey` text DEFAULT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Set if contact is featured.',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_contact_details`
--

LOCK TABLES `amtf3_contact_details` WRITE;
/*!40000 ALTER TABLE `amtf3_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_content`
--

DROP TABLE IF EXISTS `amtf3_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text DEFAULT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_content`
--

LOCK TABLES `amtf3_content` WRITE;
/*!40000 ALTER TABLE `amtf3_content` DISABLE KEYS */;
INSERT INTO `amtf3_content` VALUES
(3,108,'Пример заявления','example','<div class=\"application-form\">\r\n<div class=\"form-content\">\r\n<div class=\"form-header\">\r\n<h2>МУНИЦИПАЛЬНОЕ КАЗЕННОЕ УЧРЕЖДЕНИЕ</h2>\r\n<p>\"Управление коммунального хозяйства\"</p>\r\n<p>города Лабинска</p>\r\n</div>\r\n<div class=\"applicant-info\">\r\n<p><strong>От:</strong> [ФИО заявителя полностью]</p>\r\n<p><strong>Адрес:</strong> [Ваш полный адрес с индексом]</p>\r\n<p><strong>Контактный телефон:</strong> [Ваш телефон]</p>\r\n</div>\r\n<div class=\"application-title\">ЗАЯВЛЕНИЕ</div>\r\n<div class=\"application-text\">\r\n<p>Прошу рассмотреть вопрос [указать суть обращения, например: \"о включении моего земельного участка, расположенного по адресу: ______, в программу благоустройства территории на 2024 год\"].</p>\r\n<p>Основание: [указать основание для обращения, например: \"участок является придомовой территорией многоквартирного дома и требует благоустройства согласно муниципальной программе\"].</p>\r\n</div>\r\n<p><strong>При необходимости прилагаю следующие документы:</strong></p>\r\n<ol class=\"documents-list\">\r\n<li>Копия паспорта (страницы с фото и регистрацией);</li>\r\n<li>Копия правоустанавливающих документов на земельный участок;</li>\r\n<li>Проектная документация (при наличии);</li>\r\n<li>Фотографии участка (при необходимости);</li>\r\n<li>Иные документы: [указать какие].</li>\r\n</ol>\r\n<div class=\"form-footer\">\r\n<div class=\"date-field\">Дата: _______________</div>\r\n<div class=\"stamp-place\">МЕСТО ДЛЯ ПЕЧАТИ</div>\r\n<div class=\"signature-field\">Подпись: _______________</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div style=\"max-width: 800px; margin: 20px auto; padding: 15px; background-color: rgba(238, 68, 18, 0.1); ; border-left: 4px solid #EE4412;\">\r\n<h3 style=\"margin-top: 0; color: #ee4412;\">Как подать заявление:</h3>\r\n<ol>\r\n<li>Заполните все необходимые поля в заявлении</li>\r\n<li>Распечатайте документ (или заполните от руки)</li>\r\n<li>Приложите копии указанных документов</li>\r\n<li>Подайте заявление одним из способов:\r\n<ul>\r\n<li>Лично по адресу: [адрес МКУ УКХ]</li>\r\n<li>Через МФЦ</li>\r\n<li>По почте заказным письмом</li>\r\n<li>Через портал Госуслуг (если доступно)</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p style=\"font-style: italic; color: #ee4412;\">Внимание! Заявления рассматриваются в течение 30 календарных дней с момента регистрации.</p>\r\n<p style=\"font-style: italic; color: #ee4412;\"><span style=\"text-decoration: underline;\"><a href=\"images/MUNICIPALNOE%20KAZENNOE%20UCREZDENIE.pdf\" download=\"\">Скачать MUNICIPALNOE KAZENNOE UCREZDENIE</a></span></p>\r\n</div>\r\n<div id=\"simple-translate\" class=\"simple-translate-system-theme\">\r\n<div>\r\n<div class=\"simple-translate-button isShow\" style=\"background-image: url(\'moz-extension://714de0a6-1742-4865-ac70-1ecdebe5901a/icons/512.png\'); height: 22px; width: 22px; top: 297px; left: 322px;\"> </div>\r\n<div class=\"simple-translate-panel \" style=\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\">\r\n<div class=\"simple-translate-result-wrapper\" style=\"overflow: hidden;\">\r\n<div class=\"simple-translate-move\" draggable=\"true\"> </div>\r\n<div class=\"simple-translate-result-contents\">\r\n<p class=\"simple-translate-result\" dir=\"auto\"> </p>\r\n<p class=\"simple-translate-candidate\" dir=\"auto\"> </p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>','',1,2,'2025-05-12 10:23:59',302,'','2025-05-13 11:27:41',302,NULL,NULL,'2025-05-12 10:24:18',NULL,'{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}','{\"article_layout\":\"_:default\",\"show_title\":\"0\",\"link_titles\":\"0\",\"show_tags\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"1\",\"info_block_show_title\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":1,\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"0\",\"show_urls_images_frontend\":\"0\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}',15,1,'','',1,146,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}',0,'*',''),
(4,111,'Главная страница','glavnaya-stranitsa','<div class=\"ukh-header\" style=\"width: 100%; background: linear-gradient(135deg, #ec430f 0%, #c2380c 100%); color: white; padding: 80px 20px; text-align: center; margin-bottom: 50px; position: relative; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.1);\"><!-- Декоративные элементы -->\r\n<div style=\"position: absolute; top: -50px; left: -50px; width: 200px; height: 200px; border-radius: 50%; background: rgba(255,255,255,0.1);\"> </div>\r\n<div style=\"position: absolute; bottom: -30px; right: -30px; width: 150px; height: 150px; border-radius: 50%; background: rgba(255,255,255,0.1);\"> </div>\r\n<!-- Основной контент -->\r\n<div style=\"position: relative; z-index: 2; max-width: 1000px; margin: 0 auto;\">\r\n<h1 style=\"font-size: 3.2em; margin: 0 0 20px 0; font-weight: bold; text-shadow: 0 2px 4px rgba(0,0,0,0.3);\">Муниципальное казенное учреждение \"Управление коммунального хозяйства\" города Лабинска</h1>\r\n<div style=\"width: 80px; height: 4px; background: white; margin: 0 auto 25px;\"> </div>\r\n<p style=\"font-size: 1.3em; line-height: 1.6; margin-bottom: 30px; max-width: 800px; margin-left: auto; margin-right: auto; opacity: 0.9;\">Обеспечиваем комфорт и порядок в нашем городе</p>\r\n</div>\r\n</div>\r\n<div class=\"ukh-content\" style=\"max-width: 1200px; margin: 0 auto 60px; padding: 0 20px; text-align: center;\">\r\n<p style=\"font-size: 1.1em; color: #555; line-height: 1.7;\">Мы ежедневно работаем над улучшением качества предоставляемых услуг и развитием городской инфраструктуры.</p>\r\n</div>\r\n<div class=\"ukh-main-content\" style=\"max-width: 1200px; margin: 0 auto 40px; padding: 0 20px; display: flex; flex-wrap: wrap; gap: 40px; justify-content: space-between;\">\r\n<div class=\"ukh-main-text\" style=\"flex: 1; min-width: 300px;\">\r\n<h2 style=\"color: #ec430f; font-size: 1.8em; margin-bottom: 20px; padding-bottom: 10px; display: inline-block; position: relative;\">Добро пожаловать на официальный сайт МКУ УКХ г. Лабинска!</h2>\r\n<div style=\"position: absolute; bottom: 0; left: 0; width: 100%; height: 3px; background: #ec430f;\"> </div>\r\n<p style=\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\">Наша организация отвечает за содержание и развитие коммунальной инфраструктуры города Лабинска. Мы работаем для того, чтобы наш город оставался чистым, уютным и комфортным для проживания.</p>\r\n<p style=\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\">Основными направлениями нашей деятельности являются: содержание дорожного хозяйства, благоустройство территорий, организация освещения улиц, вывоз твердых коммунальных отходов и многое другое.</p>\r\n<a style=\"display: inline-block; background: #ec430f; color: white; padding: 12px 30px; border-radius: 30px; text-decoration: none; font-weight: 600; transition: all 0.3s ease; box-shadow: 0 4px 6px rgba(0,0,0,0.1); margin-top: 20px;\" href=\"#services\"> Наши услуги </a></div>\r\n<div class=\"ukh-image\" style=\"flex: 1; min-width: 300px; text-align: center;\"><img style=\"max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(236,67,15,0.2);\" src=\"images/images/ukh-labinsk.jpg\" alt=\"Город Лабинск\">\r\n<p style=\"font-style: italic; color: #666; margin-top: 10px;\"><em>Город Лабинск - чистый и уютный</em></p>\r\n</div>\r\n</div>\r\n<div id=\"services\" class=\"ukh-services\" style=\"background-color: #fff5f3; padding: 60px 20px; margin-bottom: 60px; position: relative;\">\r\n<div style=\"position: absolute; top: 20px; left: 20px; width: 100px; height: 100px; border-radius: 50%; background: rgba(236,67,15,0.05);\"> </div>\r\n<div style=\"position: absolute; bottom: 20px; right: 20px; width: 80px; height: 80px; border-radius: 50%; background: rgba(236,67,15,0.05);\"> </div>\r\n<div style=\"max-width: 1200px; margin: 0 auto; position: relative; z-index: 2;\">\r\n<h2 style=\"color: #ec430f; font-size: 2em; text-align: center; margin-bottom: 40px; position: relative;\"><span style=\"background: #fff5f3; padding: 0 20px; position: relative;\">Наши основные услуги</span></h2>\r\n<div style=\"position: absolute; bottom: -10px; left: 50%; transform: translateX(-50%); width: 100px; height: 3px; background: #ec430f;\"> </div>\r\n<ul style=\"columns: 2; column-gap: 40px; list-style-type: none; padding: 0; max-width: 800px; margin: 0 auto;\">\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nСодержание и ремонт дорожного покрытия</li>\r\n<!-- Остальные пункты списка с аналогичным оформлением -->\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nУборка и благоустройство городских территорий</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nОрганизация вывоза твердых коммунальных отходов</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nСодержание уличного освещения</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nОзеленение города и уход за зелеными насаждениями</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nСодержание малых архитектурных форм и городской мебели</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nОрганизация мероприятий по санитарной очистке города</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nВзаимодействие с управляющими компаниями и ТСЖ</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"ukh-contact\" style=\"max-width: 1200px; margin: 0 auto 80px; padding: 0 20px; position: relative;\">\r\n<div style=\"position: absolute; top: -30px; left: 50%; transform: translateX(-50%); width: 100px; height: 100px; border-radius: 50%; background: rgba(236,67,15,0.1); z-index: -1;\"> </div>\r\n<h2 style=\"color: #ec430f; font-size: 2em; text-align: center; margin-bottom: 40px; position: relative;\"><span style=\"background: white; padding: 0 20px; position: relative;\">Контакты</span></h2>\r\n<div style=\"position: absolute; bottom: -10px; left: 50%; transform: translateX(-50%); width: 100px; height: 3px; background: #ec430f;\"> </div>\r\n<div style=\"background-color: white; border-radius: 12px; padding: 40px; box-shadow: 0 8px 20px rgba(236,67,15,0.1); max-width: 700px; margin: 0 auto; position: relative; z-index: 2;\">\r\n<div style=\"display: flex; flex-wrap: wrap; gap: 30px; justify-content: center;\">\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Адрес</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">Краснодарский край,<br>г. Лабинск,<br>ул. Ленина, 123</p>\r\n</div>\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Электронная почта</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">ukhlabinsk@mail.ru</p>\r\n</div>\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Телефон</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">+7 (86169) 2-34-56</p>\r\n</div>\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Режим работы</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">Пн-Пт: 8:00 - 17:00<br>Перерыв: 12:00 - 13:00</p>\r\n</div>\r\n</div>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6; text-align: center; margin-top: 40px; padding-top: 20px; border-top: 1px dashed #f8c9bf;\">Мы всегда открыты для диалога и готовы рассмотреть ваши предложения по улучшению работы коммунального хозяйства города.</p>\r\n</div>\r\n</div>','',1,2,'2025-05-12 14:09:36',302,'','2025-05-13 15:31:50',302,NULL,NULL,'2025-05-12 14:09:36',NULL,'{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}','{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}','{\"article_layout\":\"\",\"show_title\":\"0\",\"link_titles\":\"0\",\"show_tags\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"info_block_show_title\":\"0\",\"show_category\":\"0\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":-1,\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}',9,0,'','',1,593,'{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}',0,'*','');
/*!40000 ALTER TABLE `amtf3_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_content_frontpage`
--

DROP TABLE IF EXISTS `amtf3_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `featured_up` datetime DEFAULT NULL,
  `featured_down` datetime DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_content_frontpage`
--

LOCK TABLES `amtf3_content_frontpage` WRITE;
/*!40000 ALTER TABLE `amtf3_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_content_rating`
--

DROP TABLE IF EXISTS `amtf3_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `rating_sum` int(10) unsigned NOT NULL DEFAULT 0,
  `rating_count` int(10) unsigned NOT NULL DEFAULT 0,
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_content_rating`
--

LOCK TABLES `amtf3_content_rating` WRITE;
/*!40000 ALTER TABLE `amtf3_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_content_types`
--

DROP TABLE IF EXISTS `amtf3_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(400) NOT NULL DEFAULT '',
  `table` varchar(2048) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_content_types`
--

LOCK TABLES `amtf3_content_types` WRITE;
/*!40000 ALTER TABLE `amtf3_content_types` DISABLE KEYS */;
INSERT INTO `amtf3_content_types` VALUES
(1,'Article','com_content.article','{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"ArticleTable\",\"prefix\":\"Joomla\\\\Component\\\\Content\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}','ContentHelperRoute::getArticleRoute','{\"formFile\":\"administrator\\/components\\/com_content\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2,'Contact','com_contact.contact','{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"ContactTable\",\"prefix\":\"Joomla\\\\Component\\\\Contact\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}','ContactHelperRoute::getContactRoute','{\"formFile\":\"administrator\\/components\\/com_contact\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3,'Newsfeed','com_newsfeeds.newsfeed','{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"NewsfeedTable\",\"prefix\":\"Joomla\\\\Component\\\\Newsfeeds\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}','NewsfeedsHelperRoute::getNewsfeedRoute','{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4,'User','com_users.user','{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerDate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}','',''),
(5,'Article Category','com_content.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContentHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6,'Contact Category','com_contact.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContactHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7,'Newsfeeds Category','com_newsfeeds.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','NewsfeedsHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8,'Tag','com_tags.tag','{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"TagTable\",\"prefix\":\"Joomla\\\\Component\\\\Tags\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}','TagsHelperRoute::getTagRoute','{\"formFile\":\"administrator\\/components\\/com_tags\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9,'Banner','com_banners.banner','{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"BannerTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}','','{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10,'Banners Category','com_banners.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11,'Banner Client','com_banners.client','{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"ClientTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12,'User Notes','com_users.note','{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"NoteTable\",\"prefix\":\"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_users\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13,'User Notes Category','com_users.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
/*!40000 ALTER TABLE `amtf3_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_contentitem_tag_map`
--

DROP TABLE IF EXISTS `amtf3_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(9) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_contentitem_tag_map`
--

LOCK TABLES `amtf3_contentitem_tag_map` WRITE;
/*!40000 ALTER TABLE `amtf3_contentitem_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_contentitem_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_extensions`
--

DROP TABLE IF EXISTS `amtf3_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `changelogurl` text DEFAULT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 1,
  `protected` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.',
  `locked` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_extensions`
--

LOCK TABLES `amtf3_extensions` WRITE;
/*!40000 ALTER TABLE `amtf3_extensions` DISABLE KEYS */;
INSERT INTO `amtf3_extensions` VALUES
(1,0,'com_wrapper','component','com_wrapper','','',1,1,1,0,1,'{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Wrapper\",\"filename\":\"wrapper\"}','','',NULL,NULL,0,0,NULL),
(2,0,'com_admin','component','com_admin','','',1,1,1,1,1,'{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Admin\"}','','',NULL,NULL,0,0,NULL),
(3,0,'com_banners','component','com_banners','','',1,1,1,0,1,'{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Banners\",\"filename\":\"banners\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}','',NULL,NULL,0,0,NULL),
(4,0,'com_cache','component','com_cache','','',1,1,1,1,1,'{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Cache\"}','','',NULL,NULL,0,0,NULL),
(5,0,'com_categories','component','com_categories','','',1,1,1,1,1,'{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Categories\"}','','',NULL,NULL,0,0,NULL),
(6,0,'com_checkin','component','com_checkin','','',1,1,1,1,1,'{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Checkin\"}','','',NULL,NULL,0,0,NULL),
(7,0,'com_contact','component','com_contact','','',1,1,1,0,1,'{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Contact\",\"filename\":\"contact\"}','{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_ids\":1,\"custom_fields_enable\":\"1\"}','',NULL,NULL,0,0,NULL),
(8,0,'com_cpanel','component','com_cpanel','','',1,1,1,1,1,'{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"2007-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Cpanel\"}','','',NULL,NULL,0,0,NULL),
(9,0,'com_installer','component','com_installer','','',1,1,1,1,1,'{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Installer\"}','{\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}','',NULL,NULL,0,0,NULL),
(10,0,'com_languages','component','com_languages','','',1,1,1,1,1,'{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Languages\"}','{\"administrator\":\"en-GB\",\"site\":\"ru-RU\"}','',NULL,NULL,0,0,NULL),
(11,0,'com_login','component','com_login','','',1,1,1,1,1,'{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Login\"}','','',NULL,NULL,0,0,NULL),
(12,0,'com_media','component','com_media','','',1,1,0,1,1,'{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Media\",\"filename\":\"media\"}','{\"upload_maxsize\":\"10\",\"file_path\":\"files\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"restrict_uploads_extensions\":\"bmp,gif,jpg,jpeg,png,webp,avif,ico,mp3,m4a,mp4a,ogg,mp4,mp4v,mpeg,mov,odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png,jpeg,webp,avif\",\"audio_extensions\":\"mp3,m4a,mp4a,ogg\",\"video_extensions\":\"mp4,mp4v,mpeg,mov,webm\",\"doc_extensions\":\"odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,image\\/webp,image\\/avif,audio\\/ogg,audio\\/mpeg,audio\\/mp4,video\\/mp4,video\\/webm,video\\/mpeg,video\\/quicktime,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\"}','',NULL,NULL,0,0,NULL),
(13,0,'com_menus','component','com_menus','','',1,1,1,1,1,'{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Menus\",\"filename\":\"menus\"}','{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}','',NULL,NULL,0,0,NULL),
(14,0,'com_messages','component','com_messages','','',1,1,1,1,1,'{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Messages\"}','','',NULL,NULL,0,0,NULL),
(15,0,'com_modules','component','com_modules','','',1,1,1,1,1,'{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Modules\",\"filename\":\"modules\"}','','',NULL,NULL,0,0,NULL),
(16,0,'com_newsfeeds','component','com_newsfeeds','','',1,1,1,0,1,'{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Newsfeeds\",\"filename\":\"newsfeeds\"}','{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"sef_ids\":1}','',NULL,NULL,0,0,NULL),
(17,0,'com_plugins','component','com_plugins','','',1,1,1,1,1,'{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Plugins\"}','','',NULL,NULL,0,0,NULL),
(18,0,'com_templates','component','com_templates','','',1,1,1,1,1,'{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Templates\"}','{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png,webp\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass,json\",\"font_formats\":\"woff,woff2,ttf,otf\",\"compressed_formats\":\"zip\",\"difference\":\"SideBySide\"}','',NULL,NULL,0,0,NULL),
(19,0,'com_content','component','com_content','','',1,1,0,1,1,'{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Content\",\"filename\":\"content\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"info_block_position\":\"0\",\"info_block_show_title\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_associations\":\"0\",\"flags\":\"1\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":100,\"show_tags\":\"1\",\"record_hits\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"urls_position\":0,\"captcha\":\"\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_configure_edit_options\":\"1\",\"show_permissions\":\"1\",\"show_associations_edit\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_category_heading_title_text\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":1,\"blog_class_leading\":\"\",\"num_intro_articles\":4,\"blog_class\":\"\",\"num_columns\":1,\"multi_column_order\":\"0\",\"num_links\":4,\"show_subcategory_content\":\"0\",\"link_intro_image\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"display_num\":\"10\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_featured\":\"show\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\",\"sef_ids\":1,\"custom_fields_enable\":\"1\",\"workflow_enabled\":\"0\"}','',NULL,NULL,0,0,NULL),
(20,0,'com_config','component','com_config','','',1,1,0,1,1,'{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Config\",\"filename\":\"config\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','',NULL,NULL,0,0,NULL),
(21,0,'com_redirect','component','com_redirect','','',1,1,0,0,1,'{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Redirect\"}','','',NULL,NULL,0,0,NULL),
(22,0,'com_users','component','com_users','','',1,1,0,1,1,'{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Users\",\"filename\":\"users\"}','{\"allowUserRegistration\":\"1\",\"new_usertype\":\"10\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"0\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"0\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"domains\":[],\"reset_count\":10,\"reset_time\":1,\"minimum_length\":12,\"minimum_integers\":0,\"minimum_symbols\":0,\"minimum_uppercase\":0,\"minimum_lowercase\":0,\"frontend_show_title\":\"1\",\"captive_template\":\"\",\"mfaonsilent\":\"0\",\"silentresponses\":\"cookie, passwordless\",\"mfaredirectonlogin\":\"0\",\"mfaredirecturl\":\"\",\"mfatrycount\":10,\"mfatrytime\":1,\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\",\"custom_fields_enable\":\"1\"}','',NULL,NULL,0,0,NULL),
(23,0,'com_finder','component','com_finder','','',1,1,0,0,1,'{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Finder\",\"filename\":\"finder\"}','{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}','',NULL,NULL,0,0,NULL),
(24,0,'com_joomlaupdate','component','com_joomlaupdate','','',1,1,0,1,1,'{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.3\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Joomlaupdate\"}','{\"updatesource\":\"default\",\"customurl\":\"\"}','',NULL,NULL,0,0,NULL),
(25,0,'com_tags','component','com_tags','','',1,1,1,0,1,'{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"2013-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Tags\",\"filename\":\"tags\"}','{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}','',NULL,NULL,0,0,NULL),
(26,0,'com_contenthistory','component','com_contenthistory','','',1,1,1,0,1,'{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"2013-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Contenthistory\",\"filename\":\"contenthistory\"}','','',NULL,NULL,0,0,NULL),
(27,0,'com_ajax','component','com_ajax','','',1,1,1,1,1,'{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"ajax\"}','','',NULL,NULL,0,0,NULL),
(28,0,'com_postinstall','component','com_postinstall','','',1,1,1,1,1,'{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Postinstall\"}','','',NULL,NULL,0,0,NULL),
(29,0,'com_fields','component','com_fields','','',1,1,1,0,1,'{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Fields\",\"filename\":\"fields\"}','','',NULL,NULL,0,0,NULL),
(30,0,'com_associations','component','com_associations','','',1,1,1,0,1,'{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Associations\"}','','',NULL,NULL,0,0,NULL),
(31,0,'com_privacy','component','com_privacy','','',1,1,1,0,1,'{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Privacy\",\"filename\":\"privacy\"}','','',NULL,NULL,0,0,NULL),
(32,0,'com_actionlogs','component','com_actionlogs','','',1,1,1,0,1,'{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Actionlogs\"}','{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_fields\",\"com_guidedtours\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_scheduler\",\"com_tags\",\"com_templates\",\"com_users\"]}','',NULL,NULL,0,0,NULL),
(33,0,'com_workflow','component','com_workflow','','',1,1,0,1,1,'{\"name\":\"com_workflow\",\"type\":\"component\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WORKFLOW_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Workflow\"}','{}','',NULL,NULL,0,0,NULL),
(34,0,'com_mails','component','com_mails','','',1,1,1,1,1,'{\"name\":\"com_mails\",\"type\":\"component\",\"creationDate\":\"2019-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MAILS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Mails\"}','','',NULL,NULL,0,0,NULL),
(35,0,'com_scheduler','component','com_scheduler','','',1,1,1,0,1,'{\"name\":\"com_scheduler\",\"type\":\"component\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"COM_SCHEDULER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Scheduler\"}','{}','',NULL,NULL,0,0,NULL),
(36,0,'com_guidedtours','component','com_guidedtours','','',1,1,0,0,1,'{\"name\":\"com_guidedtours\",\"type\":\"component\",\"creationDate\":\"2023-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.0\",\"description\":\"COM_GUIDEDTOURS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Component\\\\Guidedtours\"}','{}','',NULL,NULL,0,0,NULL),
(37,0,'lib_joomla','library','joomla','','',0,1,1,1,1,'{\"name\":\"lib_joomla\",\"type\":\"library\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"joomla\"}','','',NULL,NULL,0,0,NULL),
(38,0,'lib_phpass','library','phpass','','',0,1,1,1,1,'{\"name\":\"lib_phpass\",\"type\":\"library\",\"creationDate\":\"2004-01\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"https:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"phpass\"}','','',NULL,NULL,0,0,NULL),
(39,0,'mod_articles_archive','module','mod_articles_archive','','',0,1,1,0,1,'{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesArchive\",\"filename\":\"mod_articles_archive\"}','','',NULL,NULL,0,0,NULL),
(40,0,'mod_articles_latest','module','mod_articles_latest','','',0,1,1,0,1,'{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesLatest\",\"filename\":\"mod_articles_latest\"}','','',NULL,NULL,0,0,NULL),
(41,0,'mod_articles_popular','module','mod_articles_popular','','',0,1,1,0,1,'{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesPopular\",\"filename\":\"mod_articles_popular\"}','','',NULL,NULL,0,0,NULL),
(42,0,'mod_banners','module','mod_banners','','',0,1,1,0,1,'{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Banners\",\"filename\":\"mod_banners\"}','','',NULL,NULL,0,0,NULL),
(43,0,'mod_breadcrumbs','module','mod_breadcrumbs','','',0,1,1,0,1,'{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Breadcrumbs\",\"filename\":\"mod_breadcrumbs\"}','','',NULL,NULL,0,0,NULL),
(44,0,'mod_custom','module','mod_custom','','',0,1,1,0,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Custom\",\"filename\":\"mod_custom\"}','','',NULL,NULL,0,0,NULL),
(45,0,'mod_feed','module','mod_feed','','',0,1,1,0,1,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Feed\",\"filename\":\"mod_feed\"}','','',NULL,NULL,0,0,NULL),
(46,0,'mod_footer','module','mod_footer','','',0,1,1,0,1,'{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Footer\",\"filename\":\"mod_footer\"}','','',NULL,NULL,0,0,NULL),
(47,0,'mod_login','module','mod_login','','',0,1,1,0,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Login\",\"filename\":\"mod_login\"}','','',NULL,NULL,0,0,NULL),
(48,0,'mod_menu','module','mod_menu','','',0,1,1,0,1,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Menu\",\"filename\":\"mod_menu\"}','','',NULL,NULL,0,0,NULL),
(49,0,'mod_articles_news','module','mod_articles_news','','',0,1,1,0,1,'{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesNews\",\"filename\":\"mod_articles_news\"}','','',NULL,NULL,0,0,NULL),
(50,0,'mod_random_image','module','mod_random_image','','',0,1,1,0,1,'{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\RandomImage\",\"filename\":\"mod_random_image\"}','','',NULL,NULL,0,0,NULL),
(51,0,'mod_related_items','module','mod_related_items','','',0,1,1,0,1,'{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\RelatedItems\",\"filename\":\"mod_related_items\"}','','',NULL,NULL,0,0,NULL),
(52,0,'mod_stats','module','mod_stats','','',0,1,1,0,1,'{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Stats\",\"filename\":\"mod_stats\"}','','',NULL,NULL,0,0,NULL),
(53,0,'mod_syndicate','module','mod_syndicate','','',0,1,1,0,1,'{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"2006-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Syndicate\",\"filename\":\"mod_syndicate\"}','','',NULL,NULL,0,0,NULL),
(54,0,'mod_users_latest','module','mod_users_latest','','',0,1,1,0,1,'{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"2009-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\UsersLatest\",\"filename\":\"mod_users_latest\"}','','',NULL,NULL,0,0,NULL),
(55,0,'mod_whosonline','module','mod_whosonline','','',0,1,1,0,1,'{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Whosonline\",\"filename\":\"mod_whosonline\"}','','',NULL,NULL,0,0,NULL),
(56,0,'mod_wrapper','module','mod_wrapper','','',0,1,1,0,1,'{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"2004-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Wrapper\",\"filename\":\"mod_wrapper\"}','','',NULL,NULL,0,0,NULL),
(57,0,'mod_articles_category','module','mod_articles_category','','',0,1,1,0,1,'{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesCategory\",\"filename\":\"mod_articles_category\"}','','',NULL,NULL,0,0,NULL),
(58,0,'mod_articles_categories','module','mod_articles_categories','','',0,1,1,0,1,'{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\ArticlesCategories\",\"filename\":\"mod_articles_categories\"}','','',NULL,NULL,0,0,NULL),
(59,0,'mod_languages','module','mod_languages','','',0,1,1,0,1,'{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Languages\",\"filename\":\"mod_languages\"}','','',NULL,NULL,0,0,NULL),
(60,0,'mod_finder','module','mod_finder','','',0,1,0,0,1,'{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Finder\",\"filename\":\"mod_finder\"}','','',NULL,NULL,0,0,NULL),
(61,0,'MOD_ARTICLES','module','mod_articles','','',0,1,0,0,1,'{\"name\":\"MOD_ARTICLES\",\"type\":\"module\",\"creationDate\":\"2024-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2024 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.2.0\",\"description\":\"MOD_ARTICLES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Articles\",\"filename\":\"mod_articles\"}','','',NULL,NULL,0,0,NULL),
(62,0,'mod_custom','module','mod_custom','','',1,1,1,0,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Custom\",\"filename\":\"mod_custom\"}','','',NULL,NULL,0,0,NULL),
(63,0,'mod_feed','module','mod_feed','','',1,1,1,0,1,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Feed\",\"filename\":\"mod_feed\"}','','',NULL,NULL,0,0,NULL),
(64,0,'mod_latest','module','mod_latest','','',1,1,1,0,1,'{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Latest\",\"filename\":\"mod_latest\"}','','',NULL,NULL,0,0,NULL),
(65,0,'mod_logged','module','mod_logged','','',1,1,1,0,1,'{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"2005-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Logged\",\"filename\":\"mod_logged\"}','','',NULL,NULL,0,0,NULL),
(66,0,'mod_login','module','mod_login','','',1,1,1,0,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2005-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Login\",\"filename\":\"mod_login\"}','','',NULL,NULL,0,0,NULL),
(67,0,'mod_loginsupport','module','mod_loginsupport','','',1,1,1,0,1,'{\"name\":\"mod_loginsupport\",\"type\":\"module\",\"creationDate\":\"2019-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_LOGINSUPPORT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Loginsupport\",\"filename\":\"mod_loginsupport\"}','','',NULL,NULL,0,0,NULL),
(68,0,'mod_menu','module','mod_menu','','',1,1,1,0,1,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Menu\",\"filename\":\"mod_menu\"}','','',NULL,NULL,0,0,NULL),
(69,0,'mod_popular','module','mod_popular','','',1,1,1,0,1,'{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Popular\",\"filename\":\"mod_popular\"}','','',NULL,NULL,0,0,NULL),
(70,0,'mod_quickicon','module','mod_quickicon','','',1,1,1,0,1,'{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Quickicon\",\"filename\":\"mod_quickicon\"}','','',NULL,NULL,0,0,NULL),
(71,0,'mod_frontend','module','mod_frontend','','',1,1,1,0,1,'{\"name\":\"mod_frontend\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_FRONTEND_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Frontend\",\"filename\":\"mod_frontend\"}','','',NULL,NULL,0,0,NULL),
(72,0,'mod_messages','module','mod_messages','','',1,1,1,0,1,'{\"name\":\"mod_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Messages\",\"filename\":\"mod_messages\"}','','',NULL,NULL,0,0,NULL),
(73,0,'mod_post_installation_messages','module','mod_post_installation_messages','','',1,1,1,0,1,'{\"name\":\"mod_post_installation_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_POST_INSTALLATION_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\PostInstallationMessages\",\"filename\":\"mod_post_installation_messages\"}','','',NULL,NULL,0,0,NULL),
(74,0,'mod_user','module','mod_user','','',1,1,1,0,1,'{\"name\":\"mod_user\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_USER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\User\",\"filename\":\"mod_user\"}','','',NULL,NULL,0,0,NULL),
(75,0,'mod_title','module','mod_title','','',1,1,1,0,1,'{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Title\",\"filename\":\"mod_title\"}','','',NULL,NULL,0,0,NULL),
(76,0,'mod_toolbar','module','mod_toolbar','','',1,1,1,0,1,'{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Toolbar\",\"filename\":\"mod_toolbar\"}','','',NULL,NULL,0,0,NULL),
(77,0,'mod_multilangstatus','module','mod_multilangstatus','','',1,1,1,0,1,'{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"2011-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\MultilangStatus\",\"filename\":\"mod_multilangstatus\"}','{\"cache\":\"0\"}','',NULL,NULL,0,0,NULL),
(78,0,'mod_version','module','mod_version','','',1,1,1,0,1,'{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"2012-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Version\",\"filename\":\"mod_version\"}','{\"cache\":\"0\"}','',NULL,NULL,0,0,NULL),
(79,0,'mod_stats_admin','module','mod_stats_admin','','',1,1,1,0,1,'{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\StatsAdmin\",\"filename\":\"mod_stats_admin\"}','{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}','',NULL,NULL,0,0,NULL),
(80,0,'mod_tags_popular','module','mod_tags_popular','','',0,1,1,0,1,'{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\TagsPopular\",\"filename\":\"mod_tags_popular\"}','{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}','',NULL,NULL,0,0,NULL),
(81,0,'mod_tags_similar','module','mod_tags_similar','','',0,1,1,0,1,'{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\TagsSimilar\",\"filename\":\"mod_tags_similar\"}','{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}','',NULL,NULL,0,0,NULL),
(82,0,'mod_sampledata','module','mod_sampledata','','',1,1,1,0,1,'{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Sampledata\",\"filename\":\"mod_sampledata\"}','{}','',NULL,NULL,0,0,NULL),
(83,0,'mod_latestactions','module','mod_latestactions','','',1,1,1,0,1,'{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\LatestActions\",\"filename\":\"mod_latestactions\"}','{}','',NULL,NULL,0,0,NULL),
(84,0,'mod_privacy_dashboard','module','mod_privacy_dashboard','','',1,1,1,0,1,'{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\PrivacyDashboard\",\"filename\":\"mod_privacy_dashboard\"}','{}','',NULL,NULL,0,0,NULL),
(85,0,'mod_submenu','module','mod_submenu','','',1,1,1,0,1,'{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"2006-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\Submenu\",\"filename\":\"mod_submenu\"}','{}','',NULL,NULL,0,0,NULL),
(86,0,'mod_privacy_status','module','mod_privacy_status','','',1,1,1,0,1,'{\"name\":\"mod_privacy_status\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_PRIVACY_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\PrivacyStatus\",\"filename\":\"mod_privacy_status\"}','{}','',NULL,NULL,0,0,NULL),
(87,0,'mod_guidedtours','module','mod_guidedtours','','',1,1,1,0,1,'{\"name\":\"mod_guidedtours\",\"type\":\"module\",\"creationDate\":\"2023-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.0\",\"description\":\"MOD_GUIDEDTOURS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Module\\\\GuidedTours\",\"filename\":\"mod_guidedtours\"}','{}','',NULL,NULL,0,0,NULL),
(88,0,'plg_actionlog_joomla','plugin','joomla','','actionlog',0,1,1,0,1,'{\"name\":\"plg_actionlog_joomla\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Actionlog\\\\Joomla\",\"filename\":\"joomla\"}','{}','',NULL,NULL,1,0,NULL),
(89,0,'plg_api-authentication_basic','plugin','basic','','api-authentication',0,0,1,0,1,'{\"name\":\"plg_api-authentication_basic\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_BASIC_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Basic\",\"filename\":\"basic\"}','{}','',NULL,NULL,1,0,NULL),
(90,0,'plg_api-authentication_token','plugin','token','','api-authentication',0,1,1,0,1,'{\"name\":\"plg_api-authentication_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\ApiAuthentication\\\\Token\",\"filename\":\"token\"}','{}','',NULL,NULL,2,0,NULL),
(91,0,'plg_authentication_cookie','plugin','cookie','','authentication',0,1,1,0,1,'{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"2013-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Authentication\\\\Cookie\",\"filename\":\"cookie\"}','','',NULL,NULL,1,0,NULL),
(92,0,'plg_authentication_joomla','plugin','joomla','','authentication',0,1,1,1,1,'{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Authentication\\\\Joomla\",\"filename\":\"joomla\"}','','',NULL,NULL,2,0,NULL),
(93,0,'plg_authentication_ldap','plugin','ldap','','authentication',0,0,1,0,1,'{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Authentication\\\\Ldap\",\"filename\":\"ldap\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','',NULL,NULL,3,0,NULL),
(94,0,'plg_behaviour_compat','plugin','compat','','behaviour',0,1,1,0,1,'{\"name\":\"plg_behaviour_compat\",\"type\":\"plugin\",\"creationDate\":\"2023-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_COMPAT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Behaviour\\\\Compat\",\"filename\":\"compat\"}','{\"classes_aliases\":\"1\",\"es5_assets\":\"1\"}','',NULL,NULL,1,0,NULL),
(95,0,'plg_behaviour_taggable','plugin','taggable','','behaviour',0,1,1,0,1,'{\"name\":\"plg_behaviour_taggable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_TAGGABLE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Behaviour\\\\Taggable\",\"filename\":\"taggable\"}','{}','',NULL,NULL,2,0,NULL),
(96,0,'plg_behaviour_versionable','plugin','versionable','','behaviour',0,1,1,0,1,'{\"name\":\"plg_behaviour_versionable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_VERSIONABLE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Behaviour\\\\Versionable\",\"filename\":\"versionable\"}','{}','',NULL,NULL,3,0,NULL),
(97,0,'plg_content_confirmconsent','plugin','confirmconsent','','content',0,0,1,0,1,'{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\ConfirmConsent\",\"filename\":\"confirmconsent\"}','{}','',NULL,NULL,1,0,NULL),
(98,0,'plg_content_contact','plugin','contact','','content',0,1,1,0,1,'{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"2014-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\Contact\",\"filename\":\"contact\"}','','',NULL,NULL,2,0,NULL),
(99,0,'plg_content_emailcloak','plugin','emailcloak','','content',0,1,1,0,1,'{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\EmailCloak\",\"filename\":\"emailcloak\"}','{\"mode\":\"1\"}','',NULL,NULL,3,0,NULL),
(100,0,'plg_content_fields','plugin','fields','','content',0,1,1,0,1,'{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\Fields\",\"filename\":\"fields\"}','','',NULL,NULL,4,0,NULL),
(101,0,'plg_content_finder','plugin','finder','','content',0,1,1,0,1,'{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\Finder\",\"filename\":\"finder\"}','','',NULL,NULL,5,0,NULL),
(102,0,'plg_content_joomla','plugin','joomla','','content',0,1,1,0,1,'{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\Joomla\",\"filename\":\"joomla\"}','','',NULL,NULL,6,0,NULL),
(103,0,'plg_content_loadmodule','plugin','loadmodule','','content',0,1,1,0,1,'{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\LoadModule\",\"filename\":\"loadmodule\"}','{\"style\":\"xhtml\"}','',NULL,NULL,7,0,NULL),
(104,0,'plg_content_pagebreak','plugin','pagebreak','','content',0,1,1,0,1,'{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\PageBreak\",\"filename\":\"pagebreak\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','',NULL,NULL,8,0,NULL),
(105,0,'plg_content_pagenavigation','plugin','pagenavigation','','content',0,1,1,0,1,'{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"2006-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\PageNavigation\",\"filename\":\"pagenavigation\"}','{\"position\":\"1\"}','',NULL,NULL,9,0,NULL),
(106,0,'plg_content_vote','plugin','vote','','content',0,0,1,0,1,'{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Content\\\\Vote\",\"filename\":\"vote\"}','','',NULL,NULL,10,0,NULL),
(107,0,'plg_editors-xtd_article','plugin','article','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"2009-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Article\",\"filename\":\"article\"}','','',NULL,NULL,1,0,NULL),
(108,0,'plg_editors-xtd_contact','plugin','contact','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"2016-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Contact\",\"filename\":\"contact\"}','','',NULL,NULL,2,0,NULL),
(109,0,'plg_editors-xtd_fields','plugin','fields','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Fields\",\"filename\":\"fields\"}','','',NULL,NULL,3,0,NULL),
(110,0,'plg_editors-xtd_image','plugin','image','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Image\",\"filename\":\"image\"}','','',NULL,NULL,4,0,NULL),
(111,0,'plg_editors-xtd_menu','plugin','menu','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Menu\",\"filename\":\"menu\"}','','',NULL,NULL,5,0,NULL),
(112,0,'plg_editors-xtd_module','plugin','module','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"2015-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\Module\",\"filename\":\"module\"}','','',NULL,NULL,6,0,NULL),
(113,0,'plg_editors-xtd_pagebreak','plugin','pagebreak','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\PageBreak\",\"filename\":\"pagebreak\"}','','',NULL,NULL,7,0,NULL),
(114,0,'plg_editors-xtd_readmore','plugin','readmore','','editors-xtd',0,1,1,0,1,'{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\EditorsXtd\\\\ReadMore\",\"filename\":\"readmore\"}','','',NULL,NULL,8,0,NULL),
(115,0,'plg_editors_codemirror','plugin','codemirror','','editors',0,1,1,0,1,'{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"https:\\/\\/codemirror.net\\/\",\"version\":\"6.0.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Editors\\\\CodeMirror\",\"filename\":\"codemirror\"}','{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}','',NULL,NULL,1,0,NULL),
(116,0,'plg_editors_none','plugin','none','','editors',0,1,1,1,1,'{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"2005-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Editors\\\\None\",\"filename\":\"none\"}','','',NULL,NULL,2,0,NULL),
(117,0,'plg_editors_tinymce','plugin','tinymce','','editors',0,1,1,0,1,'{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-08\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"6.8.5\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Editors\\\\TinyMCE\",\"filename\":\"tinymce\"}','{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"blocks\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styles\",\"|\",\"blocks\",\"fontfamily\",\"fontsize\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"jtemplate\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}','',NULL,NULL,3,0,NULL),
(118,0,'plg_extension_finder','plugin','finder','','extension',0,1,1,0,1,'{\"name\":\"plg_extension_finder\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Extension\\\\Finder\",\"filename\":\"finder\"}','','',NULL,NULL,1,0,NULL),
(119,0,'plg_extension_joomla','plugin','joomla','','extension',0,1,1,0,1,'{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Extension\\\\Joomla\",\"filename\":\"joomla\"}','','',NULL,NULL,2,0,NULL),
(120,0,'plg_extension_joomlaupdate','plugin','joomlaupdate','','extension',0,1,1,0,1,'{\"name\":\"plg_extension_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"2025-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2025 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"1.0.0\",\"description\":\"PLG_EXTENSION_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Extension\\\\Joomlaupdate\",\"filename\":\"joomlaupdate\"}','','',NULL,NULL,3,0,NULL),
(121,0,'plg_extension_namespacemap','plugin','namespacemap','','extension',0,1,1,1,1,'{\"name\":\"plg_extension_namespacemap\",\"type\":\"plugin\",\"creationDate\":\"2017-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_NAMESPACEMAP_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Extension\\\\NamespaceMap\",\"filename\":\"namespacemap\"}','{}','',NULL,NULL,4,0,NULL),
(122,0,'plg_fields_calendar','plugin','calendar','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Calendar\",\"filename\":\"calendar\"}','','',NULL,NULL,1,0,NULL),
(123,0,'plg_fields_checkboxes','plugin','checkboxes','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Checkboxes\",\"filename\":\"checkboxes\"}','','',NULL,NULL,2,0,NULL),
(124,0,'plg_fields_color','plugin','color','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Color\",\"filename\":\"color\"}','','',NULL,NULL,3,0,NULL),
(125,0,'plg_fields_editor','plugin','editor','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Editor\",\"filename\":\"editor\"}','{\"buttons\":0,\"width\":\"100%\",\"height\":\"250px\",\"filter\":\"\\\\Joomla\\\\CMS\\\\Component\\\\ComponentHelper::filterText\"}','',NULL,NULL,4,0,NULL),
(126,0,'plg_fields_imagelist','plugin','imagelist','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Imagelist\",\"filename\":\"imagelist\"}','','',NULL,NULL,5,0,NULL),
(127,0,'plg_fields_integer','plugin','integer','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Integer\",\"filename\":\"integer\"}','{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}','',NULL,NULL,6,0,NULL),
(128,0,'plg_fields_list','plugin','list','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\ListField\",\"filename\":\"list\"}','','',NULL,NULL,7,0,NULL),
(129,0,'plg_fields_media','plugin','media','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Media\",\"filename\":\"media\"}','','',NULL,NULL,8,0,NULL),
(130,0,'plg_fields_radio','plugin','radio','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Radio\",\"filename\":\"radio\"}','','',NULL,NULL,9,0,NULL),
(131,0,'plg_fields_sql','plugin','sql','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\SQL\",\"filename\":\"sql\"}','','',NULL,NULL,10,0,NULL),
(132,0,'plg_fields_subform','plugin','subform','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_subform\",\"type\":\"plugin\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FIELDS_SUBFORM_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Subform\",\"filename\":\"subform\"}','','',NULL,NULL,11,0,NULL),
(133,0,'plg_fields_text','plugin','text','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Text\",\"filename\":\"text\"}','','',NULL,NULL,12,0,NULL),
(134,0,'plg_fields_textarea','plugin','textarea','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Textarea\",\"filename\":\"textarea\"}','{\"rows\":10,\"cols\":10,\"maxlength\":\"\",\"filter\":\"\\\\Joomla\\\\CMS\\\\Component\\\\ComponentHelper::filterText\"}','',NULL,NULL,13,0,NULL),
(135,0,'plg_fields_url','plugin','url','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\Url\",\"filename\":\"url\"}','','',NULL,NULL,14,0,NULL),
(136,0,'plg_fields_user','plugin','user','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\User\",\"filename\":\"user\"}','','',NULL,NULL,15,0,NULL),
(137,0,'plg_fields_usergrouplist','plugin','usergrouplist','','fields',0,1,1,0,1,'{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Fields\\\\UsergroupList\",\"filename\":\"usergrouplist\"}','','',NULL,NULL,16,0,NULL),
(138,0,'plg_filesystem_local','plugin','local','','filesystem',0,1,1,0,1,'{\"name\":\"plg_filesystem_local\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FILESYSTEM_LOCAL_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Filesystem\\\\Local\",\"filename\":\"local\"}','{}','',NULL,NULL,1,0,NULL),
(139,0,'plg_finder_categories','plugin','categories','','finder',0,1,1,0,1,'{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Categories\",\"filename\":\"categories\"}','','',NULL,NULL,1,0,NULL),
(140,0,'plg_finder_contacts','plugin','contacts','','finder',0,1,1,0,1,'{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Contacts\",\"filename\":\"contacts\"}','','',NULL,NULL,2,0,NULL),
(141,0,'plg_finder_content','plugin','content','','finder',0,1,1,0,1,'{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Content\",\"filename\":\"content\"}','','',NULL,NULL,3,0,NULL),
(142,0,'plg_finder_newsfeeds','plugin','newsfeeds','','finder',0,1,1,0,1,'{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Newsfeeds\",\"filename\":\"newsfeeds\"}','','',NULL,NULL,4,0,NULL),
(143,0,'plg_finder_tags','plugin','tags','','finder',0,1,1,0,1,'{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"2013-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Finder\\\\Tags\",\"filename\":\"tags\"}','','',NULL,NULL,5,0,NULL),
(144,0,'plg_installer_folderinstaller','plugin','folderinstaller','','installer',0,1,1,0,1,'{\"name\":\"plg_installer_folderinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Installer\\\\Folder\",\"filename\":\"folderinstaller\"}','','',NULL,NULL,2,0,NULL),
(145,0,'plg_installer_override','plugin','override','','installer',0,1,1,0,1,'{\"name\":\"plg_installer_override\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_OVERRIDE_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Installer\\\\Override\",\"filename\":\"override\"}','','',NULL,NULL,4,0,NULL),
(146,0,'plg_installer_packageinstaller','plugin','packageinstaller','','installer',0,1,1,0,1,'{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Installer\\\\Package\",\"filename\":\"packageinstaller\"}','','',NULL,NULL,1,0,NULL),
(147,0,'plg_installer_urlinstaller','plugin','urlinstaller','','installer',0,1,1,0,1,'{\"name\":\"plg_installer_urlinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Installer\\\\Url\",\"filename\":\"urlinstaller\"}','','',NULL,NULL,3,0,NULL),
(148,0,'plg_installer_webinstaller','plugin','webinstaller','','installer',0,1,1,0,1,'{\"name\":\"plg_installer_webinstaller\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Installer\\\\Web\",\"filename\":\"webinstaller\"}','{\"tab_position\":\"1\"}','',NULL,NULL,5,0,NULL),
(149,0,'plg_media-action_crop','plugin','crop','','media-action',0,1,1,0,1,'{\"name\":\"plg_media-action_crop\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_CROP_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\MediaAction\\\\Crop\",\"filename\":\"crop\"}','{}','',NULL,NULL,1,0,NULL),
(150,0,'plg_media-action_resize','plugin','resize','','media-action',0,1,1,0,1,'{\"name\":\"plg_media-action_resize\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_RESIZE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\MediaAction\\\\Resize\",\"filename\":\"resize\"}','{}','',NULL,NULL,2,0,NULL),
(151,0,'plg_media-action_rotate','plugin','rotate','','media-action',0,1,1,0,1,'{\"name\":\"plg_media-action_rotate\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_ROTATE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\MediaAction\\\\Rotate\",\"filename\":\"rotate\"}','{}','',NULL,NULL,3,0,NULL),
(152,0,'plg_privacy_actionlogs','plugin','actionlogs','','privacy',0,1,1,0,1,'{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Privacy\\\\Actionlogs\",\"filename\":\"actionlogs\"}','{}','',NULL,NULL,1,0,NULL),
(153,0,'plg_privacy_consents','plugin','consents','','privacy',0,1,1,0,1,'{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Privacy\\\\Consents\",\"filename\":\"consents\"}','{}','',NULL,NULL,2,0,NULL),
(154,0,'plg_privacy_contact','plugin','contact','','privacy',0,1,1,0,1,'{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Privacy\\\\Contact\",\"filename\":\"contact\"}','{}','',NULL,NULL,3,0,NULL),
(155,0,'plg_privacy_content','plugin','content','','privacy',0,1,1,0,1,'{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Privacy\\\\Content\",\"filename\":\"content\"}','{}','',NULL,NULL,4,0,NULL),
(156,0,'plg_privacy_message','plugin','message','','privacy',0,1,1,0,1,'{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Privacy\\\\Message\",\"filename\":\"message\"}','{}','',NULL,NULL,5,0,NULL),
(157,0,'plg_privacy_user','plugin','user','','privacy',0,1,1,0,1,'{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Privacy\\\\User\",\"filename\":\"user\"}','{}','',NULL,NULL,6,0,NULL),
(158,0,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','','quickicon',0,1,1,0,1,'{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\Joomlaupdate\",\"filename\":\"joomlaupdate\"}','','',302,'2025-05-12 15:51:04',1,0,NULL),
(159,0,'plg_quickicon_extensionupdate','plugin','extensionupdate','','quickicon',0,1,1,0,1,'{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\Extensionupdate\",\"filename\":\"extensionupdate\"}','','',NULL,NULL,2,0,NULL),
(160,0,'plg_quickicon_overridecheck','plugin','overridecheck','','quickicon',0,1,1,0,1,'{\"name\":\"plg_quickicon_overridecheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_OVERRIDECHECK_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\OverrideCheck\",\"filename\":\"overridecheck\"}','','',NULL,NULL,3,0,NULL),
(161,0,'plg_quickicon_downloadkey','plugin','downloadkey','','quickicon',0,1,1,0,1,'{\"name\":\"plg_quickicon_downloadkey\",\"type\":\"plugin\",\"creationDate\":\"2019-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_DOWNLOADKEY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\Downloadkey\",\"filename\":\"downloadkey\"}','','',NULL,NULL,4,0,NULL),
(162,0,'plg_quickicon_privacycheck','plugin','privacycheck','','quickicon',0,1,1,0,1,'{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\PrivacyCheck\",\"filename\":\"privacycheck\"}','{}','',NULL,NULL,5,0,NULL),
(163,0,'plg_quickicon_phpversioncheck','plugin','phpversioncheck','','quickicon',0,1,1,0,1,'{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\PhpVersionCheck\",\"filename\":\"phpversioncheck\"}','','',NULL,NULL,6,0,NULL),
(164,0,'plg_quickicon_eos','plugin','eos','','quickicon',0,1,1,0,1,'{\"name\":\"plg_quickicon_eos\",\"type\":\"plugin\",\"creationDate\":\"2023-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.4.0\",\"description\":\"PLG_QUICKICON_EOS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Quickicon\\\\Eos\",\"filename\":\"eos\"}','','',NULL,NULL,7,0,NULL),
(165,0,'plg_sampledata_blog','plugin','blog','','sampledata',0,1,1,0,1,'{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\SampleData\\\\Blog\",\"filename\":\"blog\"}','','',NULL,NULL,1,0,NULL),
(166,0,'plg_sampledata_multilang','plugin','multilang','','sampledata',0,1,1,0,1,'{\"name\":\"plg_sampledata_multilang\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SAMPLEDATA_MULTILANG_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\SampleData\\\\MultiLanguage\",\"filename\":\"multilang\"}','','',NULL,NULL,2,0,NULL),
(167,0,'plg_schemaorg_article','plugin','article','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_article\",\"type\":\"plugin\",\"creationDate\":\"2024-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2024 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.1.0\",\"description\":\"PLG_SCHEMAORG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\Article\",\"filename\":\"article\"}','{}','',NULL,NULL,1,0,NULL),
(168,0,'plg_schemaorg_blogposting','plugin','blogposting','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_blogposting\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SCHEMAORG_BLOGPOSTING_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\BlogPosting\",\"filename\":\"blogposting\"}','{}','',NULL,NULL,2,0,NULL),
(169,0,'plg_schemaorg_book','plugin','book','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_book\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SCHEMAORG_BOOK_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\Book\",\"filename\":\"book\"}','{}','',NULL,NULL,3,0,NULL),
(170,0,'plg_schemaorg_event','plugin','event','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_event\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SCHEMAORG_EVENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\Event\",\"filename\":\"event\"}','{}','',NULL,NULL,4,0,NULL),
(171,0,'plg_schemaorg_jobposting','plugin','jobposting','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_jobposting\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SCHEMAORG_JOBPOSTING_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\JobPosting\",\"filename\":\"jobposting\"}','{}','',NULL,NULL,5,0,NULL),
(172,0,'plg_schemaorg_organization','plugin','organization','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_organization\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SCHEMAORG_ORGANIZATION_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\Organization\",\"filename\":\"organization\"}','{}','',NULL,NULL,6,0,NULL),
(173,0,'plg_schemaorg_person','plugin','person','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_person\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SCHEMAORG_PERSON_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\Person\",\"filename\":\"person\"}','{}','',NULL,NULL,7,0,NULL),
(174,0,'plg_schemaorg_recipe','plugin','recipe','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_recipe\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SCHEMAORG_RECIPE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\Recipe\",\"filename\":\"recipe\"}','{}','',NULL,NULL,8,0,NULL),
(175,0,'plg_schemaorg_custom','plugin','custom','','schemaorg',0,1,1,0,0,'{\"name\":\"plg_schemaorg_custom\",\"type\":\"plugin\",\"creationDate\":\"2024-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2024 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.1.0\",\"description\":\"PLG_SCHEMAORG_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Schemaorg\\\\Custom\",\"filename\":\"custom\"}','{}','',NULL,NULL,9,0,NULL),
(176,0,'plg_system_accessibility','plugin','accessibility','','system',0,0,1,0,1,'{\"name\":\"plg_system_accessibility\",\"type\":\"plugin\",\"creationDate\":\"2020-02-15\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_ACCESSIBILITY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Accessibility\",\"filename\":\"accessibility\"}','{}','',NULL,NULL,1,0,NULL),
(177,0,'plg_system_actionlogs','plugin','actionlogs','','system',0,1,1,0,1,'{\"name\":\"plg_system_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\ActionLogs\",\"filename\":\"actionlogs\"}','{}','',NULL,NULL,2,0,NULL),
(178,0,'plg_system_cache','plugin','cache','','system',0,0,1,0,1,'{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"2007-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Cache\",\"filename\":\"cache\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','',NULL,NULL,3,0,NULL),
(179,0,'plg_system_debug','plugin','debug','','system',0,1,1,0,1,'{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Debug\",\"filename\":\"debug\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','',NULL,NULL,4,0,NULL),
(180,0,'plg_system_fields','plugin','fields','','system',0,1,1,0,1,'{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Fields\",\"filename\":\"fields\"}','','',NULL,NULL,5,0,NULL),
(181,0,'plg_system_highlight','plugin','highlight','','system',0,1,1,0,1,'{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Highlight\",\"filename\":\"highlight\"}','','',NULL,NULL,6,0,NULL),
(182,0,'plg_system_httpheaders','plugin','httpheaders','','system',0,1,1,0,1,'{\"name\":\"plg_system_httpheaders\",\"type\":\"plugin\",\"creationDate\":\"2017-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_HTTPHEADERS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Httpheaders\",\"filename\":\"httpheaders\"}','{}','',NULL,NULL,7,0,NULL),
(183,0,'plg_system_jooa11y','plugin','jooa11y','','system',0,1,1,0,1,'{\"name\":\"plg_system_jooa11y\",\"type\":\"plugin\",\"creationDate\":\"2022-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_JOOA11Y_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Jooa11y\",\"filename\":\"jooa11y\"}','','',NULL,NULL,8,0,NULL),
(184,0,'plg_system_languagecode','plugin','languagecode','','system',0,0,1,0,1,'{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"2011-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\LanguageCode\",\"filename\":\"languagecode\"}','','',NULL,NULL,9,0,NULL),
(185,0,'plg_system_languagefilter','plugin','languagefilter','','system',0,0,1,0,1,'{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"2010-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\LanguageFilter\",\"filename\":\"languagefilter\"}','','',NULL,NULL,10,0,NULL),
(186,0,'plg_system_log','plugin','log','','system',0,1,1,0,1,'{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Log\",\"filename\":\"log\"}','','',NULL,NULL,11,0,NULL),
(187,0,'plg_system_logout','plugin','logout','','system',0,1,1,0,1,'{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Logout\",\"filename\":\"logout\"}','','',NULL,NULL,12,0,NULL),
(188,0,'plg_system_privacyconsent','plugin','privacyconsent','','system',0,0,1,0,1,'{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\PrivacyConsent\",\"filename\":\"privacyconsent\"}','{}','',NULL,NULL,14,0,NULL),
(189,0,'plg_system_redirect','plugin','redirect','','system',0,0,1,0,1,'{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Redirect\",\"filename\":\"redirect\"}','','',NULL,NULL,15,0,NULL),
(190,0,'plg_system_remember','plugin','remember','','system',0,1,1,0,1,'{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Remember\",\"filename\":\"remember\"}','','',NULL,NULL,16,0,NULL),
(191,0,'plg_system_schedulerunner','plugin','schedulerunner','','system',0,1,1,0,1,'{\"name\":\"plg_system_schedulerunner\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_SCHEDULERUNNER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\ScheduleRunner\",\"filename\":\"schedulerunner\"}','{}','',NULL,NULL,17,0,NULL),
(192,0,'plg_system_schemaorg','plugin','schemaorg','','system',0,1,1,0,0,'{\"name\":\"plg_system_schemaorg\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_SYSTEM_SCHEMAORG_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Schemaorg\",\"filename\":\"schemaorg\"}','{}','',NULL,NULL,18,0,NULL),
(193,0,'plg_system_sef','plugin','sef','','system',0,1,1,0,1,'{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Sef\",\"filename\":\"sef\"}','{\"domain\":\"\",\"indexphp\":\"1\",\"trailingslash\":\"0\",\"enforcesuffix\":\"1\",\"strictrouting\":\"1\"}','',NULL,NULL,19,0,NULL),
(194,0,'plg_system_shortcut','plugin','shortcut','','system',0,1,1,0,1,'{\"name\":\"plg_system_shortcut\",\"type\":\"plugin\",\"creationDate\":\"2022-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_SHORTCUT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Shortcut\",\"filename\":\"shortcut\"}','{}','',NULL,NULL,21,0,NULL),
(195,0,'plg_system_skipto','plugin','skipto','','system',0,1,1,0,1,'{\"name\":\"plg_system_skipto\",\"type\":\"plugin\",\"creationDate\":\"2020-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_SKIPTO_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Skipto\",\"filename\":\"skipto\"}','{}','',NULL,NULL,22,0,NULL),
(196,0,'plg_system_stats','plugin','stats','','system',0,0,1,0,1,'{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"2013-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Stats\",\"filename\":\"stats\"}','{\"mode\":3,\"lastrun\":\"\",\"unique_id\":\"4ebb589cecfd43e110e6f16b9c2d50282c7882c8\",\"interval\":12}','',NULL,NULL,23,0,NULL),
(197,0,'plg_system_task_notification','plugin','tasknotification','','system',0,1,1,0,1,'{\"name\":\"plg_system_task_notification\",\"type\":\"plugin\",\"creationDate\":\"2021-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_TASK_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\TaskNotification\",\"filename\":\"tasknotification\"}','','',NULL,NULL,24,0,NULL),
(198,0,'plg_system_webauthn','plugin','webauthn','','system',0,1,1,0,1,'{\"name\":\"plg_system_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2019-07-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_WEBAUTHN_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\Webauthn\",\"filename\":\"webauthn\"}','{}','',NULL,NULL,26,0,NULL),
(199,0,'plg_task_check_files','plugin','checkfiles','','task',0,1,1,0,1,'{\"name\":\"plg_task_check_files\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_CHECK_FILES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\Checkfiles\",\"filename\":\"checkfiles\"}','{}','',NULL,NULL,1,0,NULL),
(200,0,'plg_task_deleteactionlogs','plugin','deleteactionlogs','','task',0,1,1,0,1,'{\"name\":\"plg_task_deleteactionlogs\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_TASK_DELETEACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\DeleteActionLogs\",\"filename\":\"deleteactionlogs\"}','{}','',NULL,NULL,2,0,NULL),
(201,0,'plg_task_globalcheckin','plugin','globalcheckin','','task',0,1,1,0,0,'{\"name\":\"plg_task_globalcheckin\",\"type\":\"plugin\",\"creationDate\":\"2023-06-22\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_TASK_GLOBALCHECKIN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\Globalcheckin\",\"filename\":\"globalcheckin\"}','{}','',NULL,NULL,3,0,NULL),
(202,0,'plg_task_requests','plugin','requests','','task',0,1,1,0,1,'{\"name\":\"plg_task_requests\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_REQUESTS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\Requests\",\"filename\":\"requests\"}','{}','',NULL,NULL,4,0,NULL),
(203,0,'plg_task_privacyconsent','plugin','privacyconsent','','task',0,1,1,0,1,'{\"name\":\"plg_task_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_TASK_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\PrivacyConsent\",\"filename\":\"privacyconsent\"}','{}','',NULL,NULL,5,0,NULL),
(204,0,'plg_task_rotatelogs','plugin','rotatelogs','','task',0,1,1,0,1,'{\"name\":\"plg_task_rotatelogs\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_TASK_ROTATELOGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\RotateLogs\",\"filename\":\"rotatelogs\"}','{}','',NULL,NULL,6,0,NULL),
(205,0,'plg_task_sessiongc','plugin','sessiongc','','task',0,1,1,0,1,'{\"name\":\"plg_task_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"2023-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_TASK_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\SessionGC\",\"filename\":\"sessiongc\"}','{}','',NULL,NULL,7,0,NULL),
(206,0,'plg_task_site_status','plugin','sitestatus','','task',0,1,1,0,1,'{\"name\":\"plg_task_site_status\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_SITE_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\SiteStatus\",\"filename\":\"sitestatus\"}','{}','',NULL,NULL,8,0,NULL),
(207,0,'plg_task_updatenotification','plugin','updatenotification','','task',0,1,1,0,1,'{\"name\":\"plg_task_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"2023-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.0.0\",\"description\":\"PLG_TASK_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Task\\\\UpdateNotification\",\"filename\":\"updatenotification\"}','{}','',NULL,NULL,9,0,NULL),
(208,0,'plg_multifactorauth_totp','plugin','totp','','multifactorauth',0,1,1,0,1,'{\"name\":\"plg_multifactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Totp\",\"filename\":\"totp\"}','','',NULL,NULL,1,0,NULL),
(209,0,'plg_multifactorauth_yubikey','plugin','yubikey','','multifactorauth',0,1,1,0,1,'{\"name\":\"plg_multifactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Yubikey\",\"filename\":\"yubikey\"}','','',NULL,NULL,2,0,NULL),
(210,0,'plg_multifactorauth_webauthn','plugin','webauthn','','multifactorauth',0,1,1,0,1,'{\"name\":\"plg_multifactorauth_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_WEBAUTHN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Webauthn\",\"filename\":\"webauthn\"}','','',NULL,NULL,3,0,NULL),
(211,0,'plg_multifactorauth_email','plugin','email','','multifactorauth',0,0,1,0,1,'{\"name\":\"plg_multifactorauth_email\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_EMAIL_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Email\",\"filename\":\"email\"}','','',NULL,NULL,4,0,NULL),
(212,0,'plg_multifactorauth_fixed','plugin','fixed','','multifactorauth',0,0,1,0,1,'{\"name\":\"plg_multifactorauth_fixed\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_FIXED_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Multifactorauth\\\\Fixed\",\"filename\":\"fixed\"}','','',NULL,NULL,5,0,NULL),
(213,0,'plg_user_contactcreator','plugin','contactcreator','','user',0,0,1,0,1,'{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"2009-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\ContactCreator\",\"filename\":\"contactcreator\"}','{\"autowebpage\":\"\",\"category\":\"4\",\"autopublish\":\"0\"}','',NULL,NULL,1,0,NULL),
(214,0,'plg_user_joomla','plugin','joomla','','user',0,1,1,0,1,'{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\Joomla\",\"filename\":\"joomla\"}','{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}','',NULL,NULL,2,0,''),
(215,0,'plg_user_profile','plugin','profile','','user',0,0,1,0,1,'{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\Profile\",\"filename\":\"profile\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','',NULL,NULL,3,0,NULL),
(216,0,'plg_user_terms','plugin','terms','','user',0,0,1,0,1,'{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\Terms\",\"filename\":\"terms\"}','{}','',NULL,NULL,4,0,NULL),
(217,0,'plg_user_token','plugin','token','','user',0,1,1,0,1,'{\"name\":\"plg_user_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\User\\\\Token\",\"filename\":\"token\"}','{}','',NULL,NULL,5,0,NULL),
(218,0,'plg_webservices_banners','plugin','banners','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_banners\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Banners\",\"filename\":\"banners\"}','{}','',NULL,NULL,1,0,NULL),
(219,0,'plg_webservices_config','plugin','config','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_config\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Config\",\"filename\":\"config\"}','{}','',NULL,NULL,2,0,NULL),
(220,0,'plg_webservices_contact','plugin','contact','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_contact\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Contact\",\"filename\":\"contact\"}','{}','',NULL,NULL,3,0,NULL),
(221,0,'plg_webservices_content','plugin','content','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_content\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Content\",\"filename\":\"content\"}','{}','',NULL,NULL,4,0,NULL),
(222,0,'plg_webservices_installer','plugin','installer','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_installer\",\"type\":\"plugin\",\"creationDate\":\"2020-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_INSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Installer\",\"filename\":\"installer\"}','{}','',NULL,NULL,5,0,NULL),
(223,0,'plg_webservices_languages','plugin','languages','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_languages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Languages\",\"filename\":\"languages\"}','{}','',NULL,NULL,6,0,NULL),
(224,0,'plg_webservices_media','plugin','media','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_media\",\"type\":\"plugin\",\"creationDate\":\"2021-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"PLG_WEBSERVICES_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Media\",\"filename\":\"media\"}','{}','',NULL,NULL,7,0,NULL),
(225,0,'plg_webservices_menus','plugin','menus','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_menus\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Menus\",\"filename\":\"menus\"}','{}','',NULL,NULL,7,0,NULL),
(226,0,'plg_webservices_messages','plugin','messages','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_messages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Messages\",\"filename\":\"messages\"}','{}','',NULL,NULL,8,0,NULL),
(227,0,'plg_webservices_modules','plugin','modules','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_modules\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Modules\",\"filename\":\"modules\"}','{}','',NULL,NULL,9,0,NULL),
(228,0,'plg_webservices_newsfeeds','plugin','newsfeeds','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Newsfeeds\",\"filename\":\"newsfeeds\"}','{}','',NULL,NULL,10,0,NULL),
(229,0,'plg_webservices_plugins','plugin','plugins','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_plugins\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PLUGINS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Plugins\",\"filename\":\"plugins\"}','{}','',NULL,NULL,11,0,NULL),
(230,0,'plg_webservices_privacy','plugin','privacy','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_privacy\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Privacy\",\"filename\":\"privacy\"}','{}','',NULL,NULL,12,0,NULL),
(231,0,'plg_webservices_redirect','plugin','redirect','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_redirect\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Redirect\",\"filename\":\"redirect\"}','{}','',NULL,NULL,13,0,NULL),
(232,0,'plg_webservices_tags','plugin','tags','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_tags\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Tags\",\"filename\":\"tags\"}','{}','',NULL,NULL,14,0,NULL),
(233,0,'plg_webservices_templates','plugin','templates','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_templates\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Templates\",\"filename\":\"templates\"}','{}','',NULL,NULL,15,0,NULL),
(234,0,'plg_webservices_users','plugin','users','','webservices',0,1,1,0,1,'{\"name\":\"plg_webservices_users\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_USERS_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\WebServices\\\\Users\",\"filename\":\"users\"}','{}','',NULL,NULL,16,0,NULL),
(235,0,'plg_workflow_featuring','plugin','featuring','','workflow',0,1,1,0,1,'{\"name\":\"plg_workflow_featuring\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_FEATURING_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Workflow\\\\Featuring\",\"filename\":\"featuring\"}','{}','',NULL,NULL,1,0,NULL),
(236,0,'plg_workflow_notification','plugin','notification','','workflow',0,1,1,0,1,'{\"name\":\"plg_workflow_notification\",\"type\":\"plugin\",\"creationDate\":\"2020-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Workflow\\\\Notification\",\"filename\":\"notification\"}','{}','',NULL,NULL,2,0,NULL),
(237,0,'plg_workflow_publishing','plugin','publishing','','workflow',0,1,1,0,1,'{\"name\":\"plg_workflow_publishing\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_PUBLISHING_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\Workflow\\\\Publishing\",\"filename\":\"publishing\"}','{}','',NULL,NULL,3,0,NULL),
(238,0,'plg_system_guidedtours','plugin','guidedtours','','system',0,1,1,0,1,'{\"name\":\"plg_system_guidedtours\",\"type\":\"plugin\",\"creationDate\":\"2023-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2023 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.3.0\",\"description\":\"PLG_SYSTEM_GUIDEDTOURS_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"namespace\":\"Joomla\\\\Plugin\\\\System\\\\GuidedTours\",\"filename\":\"guidedtours\"}','{}','',NULL,NULL,15,0,NULL),
(239,0,'atum','template','atum','','',1,1,1,0,1,'{\"name\":\"atum\",\"type\":\"template\",\"creationDate\":\"2016-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ATUM_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}','','',NULL,NULL,0,0,NULL),
(240,0,'cassiopeia','template','cassiopeia','','',0,1,1,0,1,'{\"name\":\"cassiopeia\",\"type\":\"template\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_CASSIOPEIA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}','{\"brand\":\"1\",\"logoFile\":\"\",\"siteTitle\":\"\",\"siteDescription\":\"\",\"useFontScheme\":\"0\",\"colorName\":\"colors_standard\",\"fluidContainer\":\"0\",\"stickyHeader\":0,\"backTop\":0}','',NULL,NULL,0,0,NULL),
(241,0,'files_joomla','file','joomla','','',0,1,1,1,1,'{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"2025-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.3.0\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"changelogurl\":\"\"}','','',NULL,NULL,0,0,NULL),
(242,0,'English (en-GB) Language Pack','package','pkg_en-GB','','',0,1,1,1,1,'{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"2025-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.3.0.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"pkg_en-GB\"}','','',NULL,NULL,0,0,NULL),
(243,242,'English (en-GB)','language','en-GB','','',0,1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2025-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.3.0\",\"description\":\"en-GB site language\",\"group\":\"\",\"changelogurl\":\"\"}','','',NULL,NULL,0,0,NULL),
(244,242,'English (en-GB)','language','en-GB','','',1,1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2025-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.3.0\",\"description\":\"en-GB administrator language\",\"group\":\"\",\"changelogurl\":\"\"}','','',NULL,NULL,0,0,NULL),
(245,242,'English (en-GB)','language','en-GB','','',3,1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2025-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"5.3.0\",\"description\":\"en-GB api language\",\"group\":\"\",\"changelogurl\":\"\"}','','',NULL,NULL,0,0,NULL),
(246,249,'Russian (ru-RU)','language','ru-RU','','',1,1,0,0,0,'{\"name\":\"Russian (ru-RU)\",\"type\":\"language\",\"creationDate\":\"2025-04\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2025 Open Source Matters, Inc.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"https:\\/\\/joomlaportal.ru\",\"version\":\"5.3.0\",\"description\":\"<p>Russian language pack (administrator) for Joomla!<\\/p>\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"install\"}','{}','',NULL,NULL,0,0,NULL),
(247,249,'Russian (ru-RU)','language','ru-RU','','',3,1,0,0,0,'{\"name\":\"Russian (ru-RU)\",\"type\":\"language\",\"creationDate\":\"2025-04\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2025 Open Source Matters, Inc.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"https:\\/\\/joomlaportal.ru\",\"version\":\"5.3.0\",\"description\":\"<p>Russian language pack (api) for Joomla!<\\/p>\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"install\"}','{}','',NULL,NULL,0,0,NULL),
(248,249,'Russian (ru-RU)','language','ru-RU','','',0,1,0,0,0,'{\"name\":\"Russian (ru-RU)\",\"type\":\"language\",\"creationDate\":\"2025-04\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2025 Open Source Matters, Inc.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"https:\\/\\/joomlaportal.ru\",\"version\":\"5.3.0\",\"description\":\"<p>Russian language pack (site) for Joomla!<\\/p>\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"install\"}','{}','',NULL,NULL,0,0,NULL),
(249,0,'Russian (ru-RU) Language Pack','package','pkg_ru-RU','','',0,1,1,0,0,'{\"name\":\"Russian (ru-RU) Language Pack\",\"type\":\"package\",\"creationDate\":\"2025-04\",\"author\":\"Russian Translation Team\",\"copyright\":\"Copyright (C) 2005 - 2025 Open Source Matters, Inc.\",\"authorEmail\":\"smart@joomlaportal.ru\",\"authorUrl\":\"https:\\/\\/joomlaportal.ru\",\"version\":\"5.3.0.1\",\"description\":\"<h3 style=\'font-weight: 400\'>Joomla 5.3.0 Russian Language Pack<\\/h3><div style=\'font-weight: 400\'><p>\\u041e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u043b\\u043e\\u043a\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f Joomla, \\u043a\\u043e\\u0442\\u043e\\u0440\\u0430\\u044f \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u0438\\u0432\\u0430\\u0435\\u0442\\u0441\\u044f \\u0440\\u0443\\u0441\\u0441\\u043a\\u043e\\u044f\\u0437\\u044b\\u0447\\u043d\\u044b\\u043c \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u0441\\u0442\\u0432\\u043e\\u043c.<br>\\u041c\\u044b \\u0440\\u0430\\u0434\\u044b \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\\u043c \\u0438 \\u043f\\u043e\\u043c\\u043e\\u0449\\u0438 \\u0432 \\u043b\\u043e\\u043a\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438 Joomla. \\u0415\\u0441\\u043b\\u0438 \\u0432\\u044b \\u043e\\u0431\\u043d\\u0430\\u0440\\u0443\\u0436\\u0438\\u043b\\u0438 \\u043e\\u0448\\u0438\\u0431\\u043a\\u0443 \\u0438\\u043b\\u0438 \\u0445\\u043e\\u0442\\u0438\\u0442\\u0435 \\u0432\\u043d\\u0435\\u0441\\u0442\\u0438 \\u0438\\u0441\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435, \\u043f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u0441\\u043e\\u0437\\u0434\\u0430\\u0439\\u0442\\u0435 <a href=\'https:\\/\\/github.com\\/JPathRu\\/localisation\\/issues\\/new\' target=\'_blank\'>Issue<\\/a> \\u043d\\u0430 Github.<\\/p><ul><li><a href=\'https:\\/\\/joomlaportal.ru\' target=\'_blank\'>\\u041f\\u043e\\u0440\\u0442\\u0430\\u043b Joomla \\u043f\\u043e-\\u0440\\u0443\\u0441\\u0441\\u043a\\u0438<\\/a>,<\\/li><li><a href=\'https:\\/\\/joomlaforum.ru\' target=\'_blank\'>\\u0424\\u043e\\u0440\\u0443\\u043c \\u0440\\u0443\\u0441\\u0441\\u043a\\u043e\\u0439 \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u0438 Joomla<\\/a>,<\\/li><li><a href=\'https:\\/\\/forum.joomla.org\\/viewforum.php?f=26\' target=\'_blank\'>\\u041e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0444\\u043e\\u0440\\u0443\\u043c \\u0440\\u0443\\u0441\\u0441\\u043a\\u043e\\u0439 \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u0438 \\u043d\\u0430 Joomla.org<\\/a>,<\\/li><li><a href=\'https:\\/\\/joomlaportal.ru\\/russian-joomla\' target=\'_blank\'>\\u041e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430 \\u043b\\u043e\\u043a\\u0430\\u043b\\u0438\\u0437\\u0430\\u0446\\u0438\\u0438<\\/a>,<\\/li><li><a href=\'https:\\/\\/t.me\\/joomlafeed\' target=\'_blank\'>\\u041a\\u0430\\u043d\\u0430\\u043b \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0435\\u0439 Joomla \\u0432 Telegram<\\/a>,<\\/li><li><a href=\'https:\\/\\/t.me\\/joomlaru\' target=\'_blank\'>\\u0427\\u0430\\u0442 Joomla \\u043f\\u043e-\\u0440\\u0443\\u0441\\u0441\\u043a\\u0438 \\u0432 Telegram<\\/a>,<\\/li><li><a href=\'https:\\/\\/t.me\\/projoomla\' target=\'_blank\'>\\u0427\\u0430\\u0442 Joomla \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0444\\u0435\\u0441\\u0441\\u0438\\u043e\\u043d\\u0430\\u043b\\u043e\\u0432 \\u0432 Telegram<\\/a>,<\\/li><li><a href=\'https:\\/\\/t.me\\/yoothemepro_joomla\' target=\'_blank\'>\\u0427\\u0430\\u0442 Joomla YOOtheme Pro \\u0432 Telegram<\\/a>.<\\/li><\\/ul><\\/div>\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"pkg_ru-RU\"}','{}','',NULL,NULL,0,0,NULL),
(251,0,'System - Helix Ultimate Framework','plugin','helixultimate','','system',0,1,1,0,0,'{\"name\":\"System - Helix Ultimate Framework\",\"type\":\"plugin\",\"creationDate\":\"Feb 2018\",\"author\":\"JoomShaper.com\",\"copyright\":\"Copyright (C) 2010 - 2025 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"www.joomshaper.com\",\"version\":\"2.1.2\",\"description\":\"Helix Ultimate Framework - Joomla Template Framework by JoomShaper\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"helixultimate\"}','{}','',NULL,NULL,0,0,NULL),
(252,0,'shaper_helixultimate','template','shaper_helixultimate','','',0,1,1,0,0,'{\"name\":\"shaper_helixultimate\",\"type\":\"template\",\"creationDate\":\"Feb 2018\",\"author\":\"JoomShaper.com\",\"copyright\":\"Copyright (C) 2010 - 2025 JoomShaper.com. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"http:\\/\\/www.joomshaper.com\",\"version\":\"2.1.2\",\"description\":\"Helix Ultimate - Starter Template of Helix Ultimate Framework\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"templateDetails\"}','{}','',NULL,NULL,0,0,NULL),
(262,264,'Chrono Library','library','chrono_lib','','',0,1,1,0,0,'{\"name\":\"Chrono Library\",\"type\":\"library\",\"creationDate\":\"2024\",\"author\":\"ChronoEngine.com\",\"copyright\":\"Copyright (C) 2024\",\"authorEmail\":\"webmaster@chronoengine.com\",\"authorUrl\":\"www.chronoengine.com\",\"version\":\"1.0.26\",\"description\":\"The Chrono library framework classes\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"chrono\"}','{}','',NULL,NULL,0,0,NULL),
(263,264,'ChronoForms8','component','com_chronoforms8','','',1,1,0,0,0,'{\"name\":\"ChronoForms8\",\"type\":\"component\",\"creationDate\":\"April 2025\",\"author\":\"ChronoMan\",\"copyright\":\"ChronoEngine.com 2006 - 2025\",\"authorEmail\":\"webmaster@chronoengine.com\",\"authorUrl\":\"www.chronoengine.com\",\"version\":\"8.0.46\",\"description\":\"The ChronoForms 8 is the latest major release of the popular ChronoForms extension for Joomla, build rich forms quickly.\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"chronoforms8\"}','{}','',NULL,NULL,0,0,NULL),
(264,0,'ChronoForms8 Package','package','pkg_chronoforms8','','',0,1,1,0,0,'{\"name\":\"ChronoForms8 Package\",\"type\":\"package\",\"creationDate\":\"October 2024\",\"author\":\"ChronoEngine.com Team\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"8.0.22\",\"description\":\"ChronoForms8 extension package (Component + Chrono library)\",\"group\":\"\",\"changelogurl\":\"\",\"filename\":\"pkg_chronoforms8\"}','{}','',NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `amtf3_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_fields`
--

DROP TABLE IF EXISTS `amtf3_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `context` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `default_value` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `only_use_in_subform` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `fieldparams` mediumtext NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_fields`
--

LOCK TABLES `amtf3_fields` WRITE;
/*!40000 ALTER TABLE `amtf3_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_fields_categories`
--

DROP TABLE IF EXISTS `amtf3_fields_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_fields_categories`
--

LOCK TABLES `amtf3_fields_categories` WRITE;
/*!40000 ALTER TABLE `amtf3_fields_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_fields_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_fields_groups`
--

DROP TABLE IF EXISTS `amtf3_fields_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_fields_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `context` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_fields_groups`
--

LOCK TABLES `amtf3_fields_groups` WRITE;
/*!40000 ALTER TABLE `amtf3_fields_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_fields_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_fields_values`
--

DROP TABLE IF EXISTS `amtf3_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_fields_values` (
  `field_id` int(10) unsigned NOT NULL,
  `item_id` varchar(255) NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` mediumtext DEFAULT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_fields_values`
--

LOCK TABLES `amtf3_fields_values` WRITE;
/*!40000 ALTER TABLE `amtf3_fields_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_fields_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_filters`
--

DROP TABLE IF EXISTS `amtf3_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `map_count` int(10) unsigned NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `params` mediumtext DEFAULT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_filters`
--

LOCK TABLES `amtf3_finder_filters` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_links`
--

DROP TABLE IF EXISTS `amtf3_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(400) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `indexdate` datetime NOT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `state` int(11) NOT NULL DEFAULT 1,
  `access` int(11) NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `publish_start_date` datetime DEFAULT NULL,
  `publish_end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `list_price` double unsigned NOT NULL DEFAULT 0,
  `sale_price` double unsigned NOT NULL DEFAULT 0,
  `type_id` int(11) NOT NULL,
  `object` mediumblob DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_language` (`language`),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_links`
--

LOCK TABLES `amtf3_finder_links` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_links` DISABLE KEYS */;
INSERT INTO `amtf3_finder_links` VALUES
(3,'index.php?option=com_content&view=article&id=3','index.php?option=com_content&view=article&id=3:example&catid=2','Пример заявления',' МУНИЦИПАЛЬНОЕ КАЗЕННОЕ УЧРЕЖДЕНИЕ \"Управление коммунального хозяйства\" города Лабинска От: [ФИО заявителя полностью] Адрес: [Ваш полный адрес с индексом] Контактный телефон: [Ваш телефон] ЗАЯВЛЕНИЕ Прошу рассмотреть вопрос [указать суть обращения, например: \"о включении моего земельного участка, расположенного по адресу: ______, в программу благоустройства территории на 2024 год\"]. Основание: [указать основание для обращения, например: \"участок является придомовой территорией многоквартирного дома и требует благоустройства согласно муниципальной программе\"]. При необходимости прилагаю следующие документы: Копия паспорта (страницы с фото и регистрацией); Копия правоустанавливающих документов на земельный участок; Проектная документация (при наличии); Фотографии участка (при необходимости); Иные документы: [указать какие]. Дата: _______________ МЕСТО ДЛЯ ПЕЧАТИ Подпись: _______________ Как подать заявление: Заполните все необходимые поля в заявлении Распечатайте документ (или заполните от руки) Приложите копии указанных документов Подайте заявление одним из способов: Лично по адресу: [адрес МКУ УКХ] Через МФЦ По почте заказным письмом Через портал Госуслуг (если доступно) Внимание! Заявления рассматриваются в течение 30 календарных дней с момента регистрации. Скачать MUNICIPALNOE KAZENNOE UCREZDENIE ','2025-05-13 11:27:41','3882d4948b8b068ec9c8287ecbffb92b',1,1,1,'*','2025-05-12 10:24:18',NULL,'2025-05-12 10:23:59',NULL,0,0,3,'O:52:\"Joomla\\Component\\Finder\\Administrator\\Indexer\\Result\":19:{i:0;i:1;i:1;s:5:\"ru-RU\";i:2;s:2353:\" МУНИЦИПАЛЬНОЕ КАЗЕННОЕ УЧРЕЖДЕНИЕ \"Управление коммунального хозяйства\" города Лабинска От: [ФИО заявителя полностью] Адрес: [Ваш полный адрес с индексом] Контактный телефон: [Ваш телефон] ЗАЯВЛЕНИЕ Прошу рассмотреть вопрос [указать суть обращения, например: \"о включении моего земельного участка, расположенного по адресу: ______, в программу благоустройства территории на 2024 год\"]. Основание: [указать основание для обращения, например: \"участок является придомовой территорией многоквартирного дома и требует благоустройства согласно муниципальной программе\"]. При необходимости прилагаю следующие документы: Копия паспорта (страницы с фото и регистрацией); Копия правоустанавливающих документов на земельный участок; Проектная документация (при наличии); Фотографии участка (при необходимости); Иные документы: [указать какие]. Дата: _______________ МЕСТО ДЛЯ ПЕЧАТИ Подпись: _______________ Как подать заявление: Заполните все необходимые поля в заявлении Распечатайте документ (или заполните от руки) Приложите копии указанных документов Подайте заявление одним из способов: Лично по адресу: [адрес МКУ УКХ] Через МФЦ По почте заказным письмом Через портал Госуслуг (если доступно) Внимание! Заявления рассматриваются в течение 30 календарных дней с момента регистрации. Скачать MUNICIPALNOE KAZENNOE UCREZDENIE \";i:3;a:25:{s:2:\"id\";i:3;s:5:\"alias\";s:7:\"example\";s:7:\"summary\";s:4203:\"<div class=\"application-form\">\r\n<div class=\"form-content\">\r\n<div class=\"form-header\">\r\n<h2>МУНИЦИПАЛЬНОЕ КАЗЕННОЕ УЧРЕЖДЕНИЕ</h2>\r\n<p>\"Управление коммунального хозяйства\"</p>\r\n<p>города Лабинска</p>\r\n</div>\r\n<div class=\"applicant-info\">\r\n<p><strong>От:</strong> [ФИО заявителя полностью]</p>\r\n<p><strong>Адрес:</strong> [Ваш полный адрес с индексом]</p>\r\n<p><strong>Контактный телефон:</strong> [Ваш телефон]</p>\r\n</div>\r\n<div class=\"application-title\">ЗАЯВЛЕНИЕ</div>\r\n<div class=\"application-text\">\r\n<p>Прошу рассмотреть вопрос [указать суть обращения, например: \"о включении моего земельного участка, расположенного по адресу: ______, в программу благоустройства территории на 2024 год\"].</p>\r\n<p>Основание: [указать основание для обращения, например: \"участок является придомовой территорией многоквартирного дома и требует благоустройства согласно муниципальной программе\"].</p>\r\n</div>\r\n<p><strong>При необходимости прилагаю следующие документы:</strong></p>\r\n<ol class=\"documents-list\">\r\n<li>Копия паспорта (страницы с фото и регистрацией);</li>\r\n<li>Копия правоустанавливающих документов на земельный участок;</li>\r\n<li>Проектная документация (при наличии);</li>\r\n<li>Фотографии участка (при необходимости);</li>\r\n<li>Иные документы: [указать какие].</li>\r\n</ol>\r\n<div class=\"form-footer\">\r\n<div class=\"date-field\">Дата: _______________</div>\r\n<div class=\"stamp-place\">МЕСТО ДЛЯ ПЕЧАТИ</div>\r\n<div class=\"signature-field\">Подпись: _______________</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div style=\"max-width: 800px; margin: 20px auto; padding: 15px; background-color: rgba(238, 68, 18, 0.1); ; border-left: 4px solid #EE4412;\">\r\n<h3 style=\"margin-top: 0; color: #ee4412;\">Как подать заявление:</h3>\r\n<ol>\r\n<li>Заполните все необходимые поля в заявлении</li>\r\n<li>Распечатайте документ (или заполните от руки)</li>\r\n<li>Приложите копии указанных документов</li>\r\n<li>Подайте заявление одним из способов:\r\n<ul>\r\n<li>Лично по адресу: [адрес МКУ УКХ]</li>\r\n<li>Через МФЦ</li>\r\n<li>По почте заказным письмом</li>\r\n<li>Через портал Госуслуг (если доступно)</li>\r\n</ul>\r\n</li>\r\n</ol>\r\n<p style=\"font-style: italic; color: #ee4412;\">Внимание! Заявления рассматриваются в течение 30 календарных дней с момента регистрации.</p>\r\n<p style=\"font-style: italic; color: #ee4412;\"><span style=\"text-decoration: underline;\"><a href=\"images/MUNICIPALNOE%20KAZENNOE%20UCREZDENIE.pdf\" download=\"\">Скачать MUNICIPALNOE KAZENNOE UCREZDENIE</a></span></p>\r\n</div>\r\n<div id=\"simple-translate\" class=\"simple-translate-system-theme\">\r\n<div>\r\n<div class=\"simple-translate-button isShow\" style=\"background-image: url(\'moz-extension://714de0a6-1742-4865-ac70-1ecdebe5901a/icons/512.png\'); height: 22px; width: 22px; top: 297px; left: 322px;\"> </div>\r\n<div class=\"simple-translate-panel \" style=\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\">\r\n<div class=\"simple-translate-result-wrapper\" style=\"overflow: hidden;\">\r\n<div class=\"simple-translate-move\" draggable=\"true\"> </div>\r\n<div class=\"simple-translate-result-contents\">\r\n<p class=\"simple-translate-result\" dir=\"auto\"> </p>\r\n<p class=\"simple-translate-candidate\" dir=\"auto\"> </p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\";s:4:\"body\";s:0:\"\";s:6:\"images\";s:173:\"{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}\";s:5:\"catid\";i:2;s:10:\"created_by\";i:302;s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"2025-05-13 11:27:41\";s:11:\"modified_by\";i:302;s:6:\"params\";O:24:\"Joomla\\Registry\\Registry\":3:{s:7:\"\0*\0data\";O:8:\"stdClass\":87:{s:14:\"article_layout\";s:9:\"_:default\";s:10:\"show_title\";s:1:\"0\";s:11:\"link_titles\";s:1:\"0\";s:10:\"show_intro\";s:1:\"0\";s:19:\"info_block_position\";s:1:\"1\";s:21:\"info_block_show_title\";s:1:\"0\";s:13:\"show_category\";s:1:\"0\";s:13:\"link_category\";s:1:\"0\";s:20:\"show_parent_category\";s:1:\"0\";s:20:\"link_parent_category\";s:1:\"0\";s:17:\"show_associations\";s:1:\"0\";s:5:\"flags\";s:1:\"1\";s:11:\"show_author\";s:1:\"0\";s:11:\"link_author\";s:1:\"0\";s:16:\"show_create_date\";s:1:\"0\";s:16:\"show_modify_date\";s:1:\"0\";s:17:\"show_publish_date\";s:1:\"0\";s:20:\"show_item_navigation\";s:1:\"0\";s:13:\"show_readmore\";s:1:\"1\";s:19:\"show_readmore_title\";s:1:\"1\";s:14:\"readmore_limit\";i:100;s:9:\"show_tags\";s:1:\"0\";s:11:\"record_hits\";s:1:\"1\";s:9:\"show_hits\";s:1:\"0\";s:11:\"show_noauth\";s:1:\"0\";s:13:\"urls_position\";i:1;s:7:\"captcha\";s:0:\"\";s:23:\"show_publishing_options\";s:1:\"1\";s:20:\"show_article_options\";s:1:\"1\";s:27:\"show_configure_edit_options\";s:1:\"1\";s:16:\"show_permissions\";s:1:\"1\";s:22:\"show_associations_edit\";s:1:\"1\";s:12:\"save_history\";s:1:\"1\";s:13:\"history_limit\";i:10;s:25:\"show_urls_images_frontend\";s:1:\"0\";s:24:\"show_urls_images_backend\";s:1:\"0\";s:7:\"targeta\";i:0;s:7:\"targetb\";i:0;s:7:\"targetc\";i:0;s:11:\"float_intro\";s:4:\"left\";s:14:\"float_fulltext\";s:4:\"left\";s:15:\"category_layout\";s:6:\"_:blog\";s:19:\"show_category_title\";s:1:\"0\";s:16:\"show_description\";s:1:\"0\";s:22:\"show_description_image\";s:1:\"0\";s:8:\"maxLevel\";s:1:\"1\";s:21:\"show_empty_categories\";s:1:\"0\";s:16:\"show_no_articles\";s:1:\"1\";s:32:\"show_category_heading_title_text\";s:1:\"1\";s:16:\"show_subcat_desc\";s:1:\"1\";s:21:\"show_cat_num_articles\";s:1:\"0\";s:13:\"show_cat_tags\";s:1:\"1\";s:21:\"show_base_description\";s:1:\"1\";s:11:\"maxLevelcat\";s:2:\"-1\";s:25:\"show_empty_categories_cat\";s:1:\"0\";s:20:\"show_subcat_desc_cat\";s:1:\"1\";s:25:\"show_cat_num_articles_cat\";s:1:\"1\";s:20:\"num_leading_articles\";i:1;s:18:\"blog_class_leading\";s:0:\"\";s:18:\"num_intro_articles\";i:4;s:10:\"blog_class\";s:0:\"\";s:11:\"num_columns\";i:1;s:18:\"multi_column_order\";s:1:\"0\";s:9:\"num_links\";i:4;s:24:\"show_subcategory_content\";s:1:\"0\";s:16:\"link_intro_image\";s:1:\"0\";s:21:\"show_pagination_limit\";s:1:\"1\";s:12:\"filter_field\";s:4:\"hide\";s:13:\"show_headings\";s:1:\"1\";s:14:\"list_show_date\";s:1:\"0\";s:11:\"date_format\";s:0:\"\";s:14:\"list_show_hits\";s:1:\"1\";s:16:\"list_show_author\";s:1:\"1\";s:11:\"display_num\";s:2:\"10\";s:11:\"orderby_pri\";s:5:\"order\";s:11:\"orderby_sec\";s:5:\"rdate\";s:10:\"order_date\";s:9:\"published\";s:15:\"show_pagination\";s:1:\"2\";s:23:\"show_pagination_results\";s:1:\"1\";s:13:\"show_featured\";s:4:\"show\";s:14:\"show_feed_link\";s:1:\"1\";s:12:\"feed_summary\";s:1:\"0\";s:18:\"feed_show_readmore\";s:1:\"0\";s:7:\"sef_ids\";i:1;s:20:\"custom_fields_enable\";s:1:\"1\";s:16:\"workflow_enabled\";s:1:\"0\";s:29:\"helix_ultimate_article_format\";s:8:\"standard\";}s:14:\"\0*\0initialized\";b:1;s:12:\"\0*\0separator\";s:1:\".\";}s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:24:\"Joomla\\Registry\\Registry\":3:{s:7:\"\0*\0data\";O:8:\"stdClass\":3:{s:6:\"robots\";s:0:\"\";s:6:\"author\";s:0:\"\";s:6:\"rights\";s:0:\"\";}s:14:\"\0*\0initialized\";b:1;s:12:\"\0*\0separator\";s:1:\".\";}s:7:\"version\";i:15;s:8:\"ordering\";i:1;s:8:\"category\";s:13:\"Uncategorised\";s:9:\"cat_state\";i:1;s:10:\"cat_access\";i:1;s:4:\"slug\";s:9:\"3:example\";s:7:\"catslug\";s:15:\"2:uncategorised\";s:6:\"author\";s:5:\"Admin\";s:6:\"layout\";s:7:\"article\";s:7:\"context\";s:19:\"com_content.article\";s:10:\"metaauthor\";N;}i:4;N;i:5;a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:7:\"metakey\";i:4;s:8:\"metadesc\";i:5;s:10:\"metaauthor\";i:6;s:6:\"author\";i:7;s:16:\"created_by_alias\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}i:6;s:1:\"*\";i:7;N;i:8;N;i:9;s:19:\"2025-05-12 10:24:18\";i:10;N;i:11;s:62:\"index.php?option=com_content&view=article&id=3:example&catid=2\";i:12;N;i:13;s:19:\"2025-05-12 10:23:59\";i:14;i:1;i:15;a:4:{s:4:\"Type\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:7:\"Article\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:0;s:2:\"id\";i:13;}}s:6:\"Author\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:5:\"Admin\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:0;s:2:\"id\";i:16;}}s:8:\"Category\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:13:\"Uncategorised\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:1;s:2:\"id\";i:14;}}s:8:\"Language\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:0;s:2:\"id\";i:15;}}}i:16;s:31:\"Пример заявления\";i:17;i:3;i:18;s:46:\"index.php?option=com_content&view=article&id=3\";}'),
(4,'index.php?option=com_content&view=article&id=4','index.php?option=com_content&view=article&id=4:glavnaya-stranitsa&catid=2','Главная страница',' Муниципальное казенное учреждение \"Управление коммунального хозяйства\" города Лабинска Обеспечиваем комфорт и порядок в нашем городе Мы ежедневно работаем над улучшением качества предоставляемых услуг и развитием городской инфраструктуры. Добро пожаловать на официальный сайт МКУ УКХ г. Лабинска! Наша организация отвечает за содержание и развитие коммунальной инфраструктуры города Лабинска. Мы работаем для того, чтобы наш город оставался чистым, уютным и комфортным для проживания. Основными направлениями нашей деятельности являются: содержание дорожного хозяйства, благоустройство территорий, организация освещения улиц, вывоз твердых коммунальных отходов и многое другое. Наши услуги Город Лабинск - чистый и уютный Наши основные услуги ✓ Содержание и ремонт дорожного покрытия ✓ Уборка и благоустройство городских территорий ✓ Организация вывоза твердых коммунальных отходов ✓ Содержание уличного освещения ✓ Озеленение города и уход за зелеными насаждениями ✓ Содержание малых архитектурных форм и городской мебели ✓ Организация мероприятий по санитарной очистке города ✓ Взаимодействие с управляющими компаниями и ТСЖ Контакты Адрес Краснодарский край, г. Лабинск, ул. Ленина, 123 Электронная почта ukhlabinsk@mail.ru Телефон +7 (86169) 2-34-56 Режим работы Пн-Пт: 8:00 - 17:00 Перерыв: 12:00 - 13:00 Мы всегда открыты для диалога и готовы рассмотреть ваши предложения по улучшению работы коммунального хозяйства города. ','2025-05-13 15:31:50','dbe0dfffecae5e4039af9e3eeb0036e5',1,1,1,'*','2025-05-12 14:09:36',NULL,'2025-05-12 14:09:36',NULL,0,0,3,'O:52:\"Joomla\\Component\\Finder\\Administrator\\Indexer\\Result\":19:{i:0;i:1;i:1;s:5:\"ru-RU\";i:2;s:2601:\" Муниципальное казенное учреждение \"Управление коммунального хозяйства\" города Лабинска Обеспечиваем комфорт и порядок в нашем городе Мы ежедневно работаем над улучшением качества предоставляемых услуг и развитием городской инфраструктуры. Добро пожаловать на официальный сайт МКУ УКХ г. Лабинска! Наша организация отвечает за содержание и развитие коммунальной инфраструктуры города Лабинска. Мы работаем для того, чтобы наш город оставался чистым, уютным и комфортным для проживания. Основными направлениями нашей деятельности являются: содержание дорожного хозяйства, благоустройство территорий, организация освещения улиц, вывоз твердых коммунальных отходов и многое другое. Наши услуги Город Лабинск - чистый и уютный Наши основные услуги ✓ Содержание и ремонт дорожного покрытия ✓ Уборка и благоустройство городских территорий ✓ Организация вывоза твердых коммунальных отходов ✓ Содержание уличного освещения ✓ Озеленение города и уход за зелеными насаждениями ✓ Содержание малых архитектурных форм и городской мебели ✓ Организация мероприятий по санитарной очистке города ✓ Взаимодействие с управляющими компаниями и ТСЖ Контакты Адрес Краснодарский край, г. Лабинск, ул. Ленина, 123 Электронная почта ukhlabinsk@mail.ru Телефон +7 (86169) 2-34-56 Режим работы Пн-Пт: 8:00 - 17:00 Перерыв: 12:00 - 13:00 Мы всегда открыты для диалога и готовы рассмотреть ваши предложения по улучшению работы коммунального хозяйства города. \";i:3;a:25:{s:2:\"id\";i:4;s:5:\"alias\";s:18:\"glavnaya stranitsa\";s:7:\"summary\";s:10989:\"<div class=\"ukh-header\" style=\"width: 100%; background: linear-gradient(135deg, #ec430f 0%, #c2380c 100%); color: white; padding: 80px 20px; text-align: center; margin-bottom: 50px; position: relative; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.1);\"><!-- Декоративные элементы -->\r\n<div style=\"position: absolute; top: -50px; left: -50px; width: 200px; height: 200px; border-radius: 50%; background: rgba(255,255,255,0.1);\"> </div>\r\n<div style=\"position: absolute; bottom: -30px; right: -30px; width: 150px; height: 150px; border-radius: 50%; background: rgba(255,255,255,0.1);\"> </div>\r\n<!-- Основной контент -->\r\n<div style=\"position: relative; z-index: 2; max-width: 1000px; margin: 0 auto;\">\r\n<h1 style=\"font-size: 3.2em; margin: 0 0 20px 0; font-weight: bold; text-shadow: 0 2px 4px rgba(0,0,0,0.3);\">Муниципальное казенное учреждение \"Управление коммунального хозяйства\" города Лабинска</h1>\r\n<div style=\"width: 80px; height: 4px; background: white; margin: 0 auto 25px;\"> </div>\r\n<p style=\"font-size: 1.3em; line-height: 1.6; margin-bottom: 30px; max-width: 800px; margin-left: auto; margin-right: auto; opacity: 0.9;\">Обеспечиваем комфорт и порядок в нашем городе</p>\r\n</div>\r\n</div>\r\n<div class=\"ukh-content\" style=\"max-width: 1200px; margin: 0 auto 60px; padding: 0 20px; text-align: center;\">\r\n<p style=\"font-size: 1.1em; color: #555; line-height: 1.7;\">Мы ежедневно работаем над улучшением качества предоставляемых услуг и развитием городской инфраструктуры.</p>\r\n</div>\r\n<div class=\"ukh-main-content\" style=\"max-width: 1200px; margin: 0 auto 40px; padding: 0 20px; display: flex; flex-wrap: wrap; gap: 40px; justify-content: space-between;\">\r\n<div class=\"ukh-main-text\" style=\"flex: 1; min-width: 300px;\">\r\n<h2 style=\"color: #ec430f; font-size: 1.8em; margin-bottom: 20px; padding-bottom: 10px; display: inline-block; position: relative;\">Добро пожаловать на официальный сайт МКУ УКХ г. Лабинска!</h2>\r\n<div style=\"position: absolute; bottom: 0; left: 0; width: 100%; height: 3px; background: #ec430f;\"> </div>\r\n<p style=\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\">Наша организация отвечает за содержание и развитие коммунальной инфраструктуры города Лабинска. Мы работаем для того, чтобы наш город оставался чистым, уютным и комфортным для проживания.</p>\r\n<p style=\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\">Основными направлениями нашей деятельности являются: содержание дорожного хозяйства, благоустройство территорий, организация освещения улиц, вывоз твердых коммунальных отходов и многое другое.</p>\r\n<a style=\"display: inline-block; background: #ec430f; color: white; padding: 12px 30px; border-radius: 30px; text-decoration: none; font-weight: 600; transition: all 0.3s ease; box-shadow: 0 4px 6px rgba(0,0,0,0.1); margin-top: 20px;\" href=\"#services\"> Наши услуги </a></div>\r\n<div class=\"ukh-image\" style=\"flex: 1; min-width: 300px; text-align: center;\"><img style=\"max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(236,67,15,0.2);\" src=\"images/images/ukh-labinsk.jpg\" alt=\"Город Лабинск\">\r\n<p style=\"font-style: italic; color: #666; margin-top: 10px;\"><em>Город Лабинск - чистый и уютный</em></p>\r\n</div>\r\n</div>\r\n<div id=\"services\" class=\"ukh-services\" style=\"background-color: #fff5f3; padding: 60px 20px; margin-bottom: 60px; position: relative;\">\r\n<div style=\"position: absolute; top: 20px; left: 20px; width: 100px; height: 100px; border-radius: 50%; background: rgba(236,67,15,0.05);\"> </div>\r\n<div style=\"position: absolute; bottom: 20px; right: 20px; width: 80px; height: 80px; border-radius: 50%; background: rgba(236,67,15,0.05);\"> </div>\r\n<div style=\"max-width: 1200px; margin: 0 auto; position: relative; z-index: 2;\">\r\n<h2 style=\"color: #ec430f; font-size: 2em; text-align: center; margin-bottom: 40px; position: relative;\"><span style=\"background: #fff5f3; padding: 0 20px; position: relative;\">Наши основные услуги</span></h2>\r\n<div style=\"position: absolute; bottom: -10px; left: 50%; transform: translateX(-50%); width: 100px; height: 3px; background: #ec430f;\"> </div>\r\n<ul style=\"columns: 2; column-gap: 40px; list-style-type: none; padding: 0; max-width: 800px; margin: 0 auto;\">\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nСодержание и ремонт дорожного покрытия</li>\r\n<!-- Остальные пункты списка с аналогичным оформлением -->\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nУборка и благоустройство городских территорий</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nОрганизация вывоза твердых коммунальных отходов</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nСодержание уличного освещения</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nОзеленение города и уход за зелеными насаждениями</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nСодержание малых архитектурных форм и городской мебели</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nОрганизация мероприятий по санитарной очистке города</li>\r\n<li style=\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\">\r\n<div style=\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\"><span style=\"color: white; font-size: 0.8em;\">✓</span></div>\r\nВзаимодействие с управляющими компаниями и ТСЖ</li>\r\n</ul>\r\n</div>\r\n</div>\r\n<div class=\"ukh-contact\" style=\"max-width: 1200px; margin: 0 auto 80px; padding: 0 20px; position: relative;\">\r\n<div style=\"position: absolute; top: -30px; left: 50%; transform: translateX(-50%); width: 100px; height: 100px; border-radius: 50%; background: rgba(236,67,15,0.1); z-index: -1;\"> </div>\r\n<h2 style=\"color: #ec430f; font-size: 2em; text-align: center; margin-bottom: 40px; position: relative;\"><span style=\"background: white; padding: 0 20px; position: relative;\">Контакты</span></h2>\r\n<div style=\"position: absolute; bottom: -10px; left: 50%; transform: translateX(-50%); width: 100px; height: 3px; background: #ec430f;\"> </div>\r\n<div style=\"background-color: white; border-radius: 12px; padding: 40px; box-shadow: 0 8px 20px rgba(236,67,15,0.1); max-width: 700px; margin: 0 auto; position: relative; z-index: 2;\">\r\n<div style=\"display: flex; flex-wrap: wrap; gap: 30px; justify-content: center;\">\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Адрес</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">Краснодарский край,<br>г. Лабинск,<br>ул. Ленина, 123</p>\r\n</div>\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Электронная почта</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">ukhlabinsk@mail.ru</p>\r\n</div>\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Телефон</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">+7 (86169) 2-34-56</p>\r\n</div>\r\n<div style=\"flex: 1; min-width: 250px;\">\r\n<h3 style=\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\">Режим работы</h3>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6;\">Пн-Пт: 8:00 - 17:00<br>Перерыв: 12:00 - 13:00</p>\r\n</div>\r\n</div>\r\n<p style=\"font-size: 1.1em; color: #333; line-height: 1.6; text-align: center; margin-top: 40px; padding-top: 20px; border-top: 1px dashed #f8c9bf;\">Мы всегда открыты для диалога и готовы рассмотреть ваши предложения по улучшению работы коммунального хозяйства города.</p>\r\n</div>\r\n</div>\";s:4:\"body\";s:0:\"\";s:6:\"images\";s:173:\"{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}\";s:5:\"catid\";i:2;s:10:\"created_by\";i:302;s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"2025-05-13 15:31:50\";s:11:\"modified_by\";i:302;s:6:\"params\";O:24:\"Joomla\\Registry\\Registry\":3:{s:7:\"\0*\0data\";O:8:\"stdClass\":87:{s:14:\"article_layout\";s:9:\"_:default\";s:10:\"show_title\";s:1:\"0\";s:11:\"link_titles\";s:1:\"0\";s:10:\"show_intro\";s:1:\"0\";s:19:\"info_block_position\";s:1:\"0\";s:21:\"info_block_show_title\";s:1:\"0\";s:13:\"show_category\";s:1:\"0\";s:13:\"link_category\";s:1:\"1\";s:20:\"show_parent_category\";s:1:\"0\";s:20:\"link_parent_category\";s:1:\"0\";s:17:\"show_associations\";s:1:\"0\";s:5:\"flags\";s:1:\"1\";s:11:\"show_author\";s:1:\"0\";s:11:\"link_author\";s:1:\"0\";s:16:\"show_create_date\";s:1:\"0\";s:16:\"show_modify_date\";s:1:\"0\";s:17:\"show_publish_date\";s:1:\"0\";s:20:\"show_item_navigation\";s:1:\"0\";s:13:\"show_readmore\";s:1:\"1\";s:19:\"show_readmore_title\";s:1:\"1\";s:14:\"readmore_limit\";i:100;s:9:\"show_tags\";s:1:\"0\";s:11:\"record_hits\";s:1:\"1\";s:9:\"show_hits\";s:1:\"0\";s:11:\"show_noauth\";s:1:\"0\";s:13:\"urls_position\";i:-1;s:7:\"captcha\";s:0:\"\";s:23:\"show_publishing_options\";s:1:\"1\";s:20:\"show_article_options\";s:1:\"1\";s:27:\"show_configure_edit_options\";s:1:\"1\";s:16:\"show_permissions\";s:1:\"1\";s:22:\"show_associations_edit\";s:1:\"1\";s:12:\"save_history\";s:1:\"1\";s:13:\"history_limit\";i:10;s:25:\"show_urls_images_frontend\";s:1:\"0\";s:24:\"show_urls_images_backend\";s:1:\"1\";s:7:\"targeta\";i:0;s:7:\"targetb\";i:0;s:7:\"targetc\";i:0;s:11:\"float_intro\";s:4:\"left\";s:14:\"float_fulltext\";s:4:\"left\";s:15:\"category_layout\";s:6:\"_:blog\";s:19:\"show_category_title\";s:1:\"0\";s:16:\"show_description\";s:1:\"0\";s:22:\"show_description_image\";s:1:\"0\";s:8:\"maxLevel\";s:1:\"1\";s:21:\"show_empty_categories\";s:1:\"0\";s:16:\"show_no_articles\";s:1:\"1\";s:32:\"show_category_heading_title_text\";s:1:\"1\";s:16:\"show_subcat_desc\";s:1:\"1\";s:21:\"show_cat_num_articles\";s:1:\"0\";s:13:\"show_cat_tags\";s:1:\"1\";s:21:\"show_base_description\";s:1:\"1\";s:11:\"maxLevelcat\";s:2:\"-1\";s:25:\"show_empty_categories_cat\";s:1:\"0\";s:20:\"show_subcat_desc_cat\";s:1:\"1\";s:25:\"show_cat_num_articles_cat\";s:1:\"1\";s:20:\"num_leading_articles\";i:1;s:18:\"blog_class_leading\";s:0:\"\";s:18:\"num_intro_articles\";i:4;s:10:\"blog_class\";s:0:\"\";s:11:\"num_columns\";i:1;s:18:\"multi_column_order\";s:1:\"0\";s:9:\"num_links\";i:4;s:24:\"show_subcategory_content\";s:1:\"0\";s:16:\"link_intro_image\";s:1:\"0\";s:21:\"show_pagination_limit\";s:1:\"1\";s:12:\"filter_field\";s:4:\"hide\";s:13:\"show_headings\";s:1:\"1\";s:14:\"list_show_date\";s:1:\"0\";s:11:\"date_format\";s:0:\"\";s:14:\"list_show_hits\";s:1:\"1\";s:16:\"list_show_author\";s:1:\"1\";s:11:\"display_num\";s:2:\"10\";s:11:\"orderby_pri\";s:5:\"order\";s:11:\"orderby_sec\";s:5:\"rdate\";s:10:\"order_date\";s:9:\"published\";s:15:\"show_pagination\";s:1:\"2\";s:23:\"show_pagination_results\";s:1:\"1\";s:13:\"show_featured\";s:4:\"show\";s:14:\"show_feed_link\";s:1:\"1\";s:12:\"feed_summary\";s:1:\"0\";s:18:\"feed_show_readmore\";s:1:\"0\";s:7:\"sef_ids\";i:1;s:20:\"custom_fields_enable\";s:1:\"1\";s:16:\"workflow_enabled\";s:1:\"0\";s:29:\"helix_ultimate_article_format\";s:8:\"standard\";}s:14:\"\0*\0initialized\";b:1;s:12:\"\0*\0separator\";s:1:\".\";}s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:24:\"Joomla\\Registry\\Registry\":3:{s:7:\"\0*\0data\";O:8:\"stdClass\":3:{s:6:\"robots\";s:0:\"\";s:6:\"author\";s:0:\"\";s:6:\"rights\";s:0:\"\";}s:14:\"\0*\0initialized\";b:1;s:12:\"\0*\0separator\";s:1:\".\";}s:7:\"version\";i:9;s:8:\"ordering\";i:0;s:8:\"category\";s:13:\"Uncategorised\";s:9:\"cat_state\";i:1;s:10:\"cat_access\";i:1;s:4:\"slug\";s:20:\"4:glavnaya-stranitsa\";s:7:\"catslug\";s:15:\"2:uncategorised\";s:6:\"author\";s:5:\"Admin\";s:6:\"layout\";s:7:\"article\";s:7:\"context\";s:19:\"com_content.article\";s:10:\"metaauthor\";N;}i:4;N;i:5;a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:7:\"metakey\";i:4;s:8:\"metadesc\";i:5;s:10:\"metaauthor\";i:6;s:6:\"author\";i:7;s:16:\"created_by_alias\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}i:6;s:1:\"*\";i:7;N;i:8;N;i:9;s:19:\"2025-05-12 14:09:36\";i:10;N;i:11;s:73:\"index.php?option=com_content&view=article&id=4:glavnaya-stranitsa&catid=2\";i:12;N;i:13;s:19:\"2025-05-12 14:09:36\";i:14;i:1;i:15;a:4:{s:4:\"Type\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:7:\"Article\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:0;s:2:\"id\";i:13;}}s:6:\"Author\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:5:\"Admin\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:0;s:2:\"id\";i:16;}}s:8:\"Category\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:13:\"Uncategorised\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:1;s:2:\"id\";i:14;}}s:8:\"Language\";a:1:{i:0;O:8:\"stdClass\":6:{s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;s:8:\"language\";s:1:\"*\";s:6:\"nested\";b:0;s:2:\"id\";i:15;}}}i:16;s:31:\"Главная страница\";i:17;i:3;i:18;s:46:\"index.php?option=com_content&view=article&id=4\";}');
/*!40000 ALTER TABLE `amtf3_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_links_terms`
--

DROP TABLE IF EXISTS `amtf3_finder_links_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_links_terms` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_links_terms`
--

LOCK TABLES `amtf3_finder_links_terms` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_links_terms` DISABLE KEYS */;
INSERT INTO `amtf3_finder_links_terms` VALUES
(3,2,0.39996),
(4,2,0.39996),
(3,3,0.9334),
(3,17,0.17),
(3,18,1.44),
(3,19,0.68),
(4,22,0.23331),
(3,22,0.69993),
(3,23,0.56),
(3,24,1.4),
(4,25,0.04669),
(3,25,0.14007),
(3,26,0.28),
(3,27,0.42),
(3,28,0.28),
(4,29,0.09338),
(3,30,0.18669),
(3,31,0.56),
(3,32,0.93338),
(3,33,0.84),
(3,34,0.42),
(3,35,1.26),
(3,36,0.46669),
(3,37,0.42),
(3,38,0.18669),
(3,39,0.23331),
(3,40,0.46662),
(3,41,0.37331),
(4,41,1.11993),
(3,42,0.14),
(4,42,0.14),
(3,43,0.23331),
(4,44,0.09331),
(3,44,0.18662),
(3,45,0.32669),
(3,46,0.74662),
(3,47,1.21338),
(3,48,0.04669),
(3,49,0.84),
(3,50,0.18662),
(3,51,0.37331),
(4,52,0.18662),
(3,52,0.27993),
(3,53,0.32669),
(3,54,0.7),
(3,55,0.42),
(3,56,0.37331),
(3,57,0.42),
(3,58,0.42),
(3,59,0.23331),
(3,60,0.65331),
(3,61,0.51331),
(4,61,0.51331),
(3,62,0.42),
(3,63,0.18669),
(4,64,0.32669),
(3,64,0.65338),
(3,65,0.46669),
(3,66,0.98007),
(3,67,0.14),
(4,67,0.14),
(3,68,0.65338),
(3,69,0.65338),
(3,70,0.14),
(4,84,0.17),
(4,85,1.0666),
(4,86,1.2),
(4,87,0.79339),
(4,88,0.90661),
(4,91,0.14),
(4,92,0.56),
(4,93,0.14),
(4,94,0.21),
(4,95,0.14),
(4,96,0.14),
(4,97,0.49),
(4,98,0.07),
(4,99,0.35),
(4,101,0.18669),
(4,102,0.09331),
(4,103,0.46669),
(4,105,0.60669),
(4,106,1.4),
(4,107,0.18669),
(4,108,0.65331),
(3,109,0.14),
(4,110,0.28),
(4,112,0.23331),
(4,113,0.28),
(4,115,0.46662),
(3,116,0.28),
(4,116,1.4),
(4,117,0.28),
(4,118,0.42),
(4,119,0.84),
(4,120,0.28),
(4,121,0.56),
(4,122,0.32669),
(3,123,0.28),
(4,123,0.42),
(4,124,0.23331),
(4,126,0.84),
(4,127,0.28),
(4,128,0.42),
(4,130,0.18662),
(4,132,0.37331),
(3,133,0.09338),
(4,133,0.56028),
(4,135,1.30662),
(3,137,0.37331),
(4,137,0.37331),
(4,138,0.37331),
(3,139,0.60669),
(4,139,1.21338),
(4,140,0.56),
(4,141,1.12),
(4,142,0.46669),
(4,143,0.32669),
(4,144,0.46669),
(4,145,0.37331),
(4,146,0.18669),
(4,147,0.60669),
(4,148,0.65338),
(4,149,0.28),
(4,150,0.23331),
(4,151,0.28),
(4,152,0.51331),
(4,154,0.28),
(3,157,0.60669),
(4,157,0.60669),
(4,158,0.27993),
(4,159,0.14),
(4,160,0.60669),
(4,161,0.56),
(4,162,0.14),
(4,163,0.18669),
(4,164,0.23331),
(4,165,0.23331),
(4,166,0.37338),
(4,168,0.56),
(4,169,0.46669),
(4,171,2.05324),
(4,172,0.84),
(4,173,0.37331),
(4,174,0.42),
(4,175,0.42),
(4,176,0.37331),
(4,177,0.32669),
(4,178,0.65338),
(4,179,0.51331),
(4,180,0.32669),
(4,181,0.32669),
(4,182,0.23331),
(3,183,0.28),
(4,184,0.46669),
(4,185,0.37331),
(4,187,0.32669),
(4,188,0.51331),
(4,189,0.7),
(4,191,0.46669),
(4,192,0.74662),
(4,194,0.56),
(4,195,0.37331),
(4,196,0.42),
(4,197,0.23331),
(4,198,0.28),
(4,199,0.04669),
(3,199,0.14007),
(4,200,0.18669),
(4,202,0.46669),
(4,204,2.33345),
(4,206,0.65338),
(4,208,0.93338),
(4,209,0.18669),
(4,211,0.14),
(4,212,0.28),
(4,214,0.09331),
(4,215,0.18669),
(4,216,0.37331),
(4,217,0.46669),
(4,218,0.42),
(3,219,0.46669),
(4,219,0.46669),
(4,220,0.56),
(4,221,0.23331),
(4,222,0.56),
(4,224,0.18669),
(3,225,0.46669),
(4,225,0.46669),
(4,226,0.28),
(4,227,0.28),
(4,228,0.18669),
(3,229,0.42),
(4,229,1.26),
(4,230,0.28),
(4,231,0.28),
(4,232,0.23331),
(4,234,0.37331),
(3,346,0.28),
(3,347,0.14),
(3,348,0.37331),
(3,349,0.14),
(3,350,0.37331),
(3,351,0.18669),
(3,352,0.37331),
(3,353,0.18669),
(3,354,0.37331),
(3,355,0.18669),
(3,356,0.37331),
(3,357,0.84),
(3,358,0.42),
(3,359,0.09331),
(3,360,0.14),
(3,361,0.37331),
(3,362,0.14),
(3,363,0.51331),
(3,364,0.46669),
(3,365,0.23331),
(3,366,0.23331),
(3,367,0.23331),
(3,368,0.7),
(3,369,0.32669),
(3,370,0.60669),
(3,371,0.14),
(3,372,0.51331),
(3,373,0.23331),
(3,374,0.84),
(3,375,0.28),
(3,376,0.32669),
(3,377,0.32669),
(3,378,0.42),
(3,379,0.28),
(3,380,0.18669),
(3,381,0.28),
(3,382,0.23331),
(3,383,0.46669),
(3,384,0.42),
(3,385,0.42),
(3,386,0.56),
(3,387,0.7),
(3,388,0.56),
(3,389,0.51331),
(3,390,0.18669),
(3,391,0.37331),
(3,392,0.37331),
(3,393,0.37331),
(3,394,0.51331),
(3,395,0.32669),
(3,396,0.32669),
(3,397,0.42),
(3,398,0.18669),
(3,399,0.46669),
(3,400,0.46662),
(3,401,0.37331),
(3,409,0.37331),
(3,410,0.56),
(3,411,0.46669),
(3,412,0.32669),
(4,416,0.23331),
(4,417,0.51331);
/*!40000 ALTER TABLE `amtf3_finder_links_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_logging`
--

DROP TABLE IF EXISTS `amtf3_finder_logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_logging` (
  `searchterm` varchar(255) NOT NULL DEFAULT '',
  `md5sum` varchar(32) NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  `hits` int(11) NOT NULL DEFAULT 1,
  `results` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`md5sum`),
  KEY `searchterm` (`searchterm`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_logging`
--

LOCK TABLES `amtf3_finder_logging` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_logging` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_finder_logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_taxonomy`
--

DROP TABLE IF EXISTS `amtf3_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(400) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) NOT NULL DEFAULT '',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `access` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_access` (`access`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_level` (`level`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_taxonomy`
--

LOCK TABLES `amtf3_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `amtf3_finder_taxonomy` VALUES
(1,0,0,17,0,'','ROOT','root',1,1,'*'),
(2,1,1,4,1,'type','Type','type',1,1,'*'),
(4,1,5,8,1,'author','Author','author',1,1,'*'),
(6,1,9,12,1,'category','Category','category',1,1,'*'),
(8,1,13,16,1,'language','Language','language',1,1,'*'),
(13,2,2,3,2,'type/article','Article','article',1,1,'*'),
(14,6,10,11,2,'category/uncategorised','Uncategorised','uncategorised',1,1,'*'),
(15,8,14,15,2,'language/4086f6336014c75439f87cbda42d9c51','*','4086f6336014c75439f87cbda42d9c51',1,1,'*'),
(16,4,6,7,2,'author/admin','Admin','admin',1,1,'*');
/*!40000 ALTER TABLE `amtf3_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `amtf3_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_taxonomy_map`
--

LOCK TABLES `amtf3_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_taxonomy_map` DISABLE KEYS */;
INSERT INTO `amtf3_finder_taxonomy_map` VALUES
(3,13),
(3,14),
(3,15),
(3,16),
(4,13),
(4,14),
(4,15),
(4,16);
/*!40000 ALTER TABLE `amtf3_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_terms`
--

DROP TABLE IF EXISTS `amtf3_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `weight` float unsigned NOT NULL DEFAULT 0,
  `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `links` int(11) NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_stem` (`stem`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_terms`
--

LOCK TABLES `amtf3_finder_terms` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_terms` DISABLE KEYS */;
INSERT INTO `amtf3_finder_terms` VALUES
(1,'1','1',0,0,0.1,'',5,'*'),
(2,'admin','admin',0,0,0.3333,'A350',30,'*'),
(3,'example','example',0,0,0.4667,'E2514',21,'*'),
(4,'http','http',0,0,0.2667,'H310',1,'*'),
(5,'images','images',0,0,0.4,'I520',1,'*'),
(6,'mcu-ukh-labinsk','mcu-ukh-labinsk',0,0,1,'M24152',1,'*'),
(7,'obrazec','obrazec',0,0,0.4667,'O162',1,'*'),
(8,'pdf','pdf',0,0,0.2,'P310',1,'*'),
(9,'tw1.ru','tw1.ru',0,0,0.4,'T600',1,'*'),
(16,'2','2',0,0,0.1,'',1,'*'),
(17,'3','3',0,0,0.1,'',15,'*'),
(18,'заявления','заявления',0,0,0.6,'з000',9,'*'),
(19,'пример','пример',0,0,0.4,'п000',9,'*'),
(21,'e-mail','e-mail',0,0,0.4,'E540',1,'*'),
(22,'адрес','адрес',0,0,0.3333,'а000',12,'*'),
(23,'адресу','адресу',0,0,0.4,'а000',6,'*'),
(24,'благоустройства','благоустройства',0,0,1,'б000',6,'*'),
(25,'в','в',0,0,0.0667,'в000',12,'*'),
(26,'ваш','ваш',0,0,0.2,'в000',6,'*'),
(27,'включении','включении',0,0,0.6,'в000',6,'*'),
(28,'вопрос','вопрос',0,0,0.4,'в000',6,'*'),
(29,'г','г',0,0,0.0667,'г000',8,'*'),
(30,'дата','дата',0,0,0.2667,'д000',6,'*'),
(31,'документация','документация',0,0,0.8,'д000',6,'*'),
(32,'документов','документов',0,0,0.6667,'д000',6,'*'),
(33,'документы','документы',0,0,0.6,'д000',6,'*'),
(34,'заявителя','заявителя',0,0,0.6,'з000',6,'*'),
(35,'заявление','заявление',0,0,0.6,'з000',6,'*'),
(36,'земельного','земельного',0,0,0.6667,'з000',6,'*'),
(37,'земельный','земельный',0,0,0.6,'з000',6,'*'),
(38,'иные','иные',0,0,0.2667,'и000',6,'*'),
(39,'какие','какие',0,0,0.3333,'к000',6,'*'),
(40,'копия','копия',0,0,0.3333,'к000',6,'*'),
(41,'лабинска','лабинска',0,0,0.5333,'л000',12,'*'),
(42,'мку','мку',0,0,0.2,'м000',12,'*'),
(43,'моего','моего',0,0,0.3333,'м000',6,'*'),
(44,'на','на',0,0,0.1333,'н000',12,'*'),
(45,'наличии','наличии',0,0,0.4667,'н000',6,'*'),
(46,'например','например',0,0,0.5333,'н000',6,'*'),
(47,'необходимости','необходимости',0,0,0.8667,'н000',6,'*'),
(48,'о','о',0,0,0.0667,'о000',11,'*'),
(49,'обращения','обращения',0,0,0.6,'о000',6,'*'),
(50,'от','от',0,0,0.1333,'о000',6,'*'),
(51,'паспорта','паспорта',0,0,0.5333,'п000',6,'*'),
(52,'по','по',0,0,0.1333,'п000',12,'*'),
(53,'подпись','подпись',0,0,0.4667,'п000',6,'*'),
(54,'правоустанавливающих','правоустанавливающих',0,0,1,'п000',6,'*'),
(55,'при','при',0,0,0.2,'п000',6,'*'),
(56,'прилагаю','прилагаю',0,0,0.5333,'п000',6,'*'),
(57,'программу','программу',0,0,0.6,'п000',6,'*'),
(58,'проектная','проектная',0,0,0.6,'п000',6,'*'),
(59,'прошу','прошу',0,0,0.3333,'п000',6,'*'),
(60,'расположенного','расположенного',0,0,0.9333,'р000',6,'*'),
(61,'рассмотреть','рассмотреть',0,0,0.7333,'р000',12,'*'),
(62,'следующие','следующие',0,0,0.6,'с000',6,'*'),
(63,'суть','суть',0,0,0.2667,'с000',6,'*'),
(64,'телефон','телефон',0,0,0.4667,'т000',11,'*'),
(65,'территории','территории',0,0,0.6667,'т000',6,'*'),
(66,'указать','указать',0,0,0.4667,'у000',6,'*'),
(67,'укх','укх',0,0,0.2,'у000',12,'*'),
(68,'участка','участка',0,0,0.4667,'у000',6,'*'),
(69,'участок','участок',0,0,0.4667,'у000',6,'*'),
(70,'фио','фио',0,0,0.2,'ф000',6,'*'),
(84,'4','4',0,0,0.1,'',9,'*'),
(85,'glavnaya','glavnaya',0,0,0.5333,'G415',9,'*'),
(86,'stranitsa','stranitsa',0,0,0.6,'S36532',9,'*'),
(87,'главная','главная',0,0,0.4667,'г000',9,'*'),
(88,'страница','страница',0,0,0.5333,'с000',9,'*'),
(91,'+7','+7',0,0,0.2,'',6,'*'),
(92,'00','00',0,0,0.2,'',6,'*'),
(93,'12','12',0,0,0.2,'',6,'*'),
(94,'123','123',0,0,0.3,'',6,'*'),
(95,'13','13',0,0,0.2,'',6,'*'),
(96,'17','17',0,0,0.2,'',6,'*'),
(97,'2-34-56','2-34-56',0,0,0.7,'',6,'*'),
(98,'8','8',0,0,0.1,'',6,'*'),
(99,'86169','86169',0,0,0.5,'',6,'*'),
(100,'email','email',0,0,0.3333,'E540',5,'*'),
(101,'mail','mail',0,0,0.2667,'M400',6,'*'),
(102,'ru','ru',0,0,0.1333,'R000',6,'*'),
(103,'ukhlabinsk','ukhlabinsk',0,0,0.6667,'U24152',6,'*'),
(104,'актуальную','актуальную',0,0,0.6667,'а000',5,'*'),
(105,'архитектурных','архитектурных',0,0,0.8667,'а000',6,'*'),
(106,'благоустройство','благоустройство',0,0,1,'б000',6,'*'),
(107,'ваши','ваши',0,0,0.2667,'в000',6,'*'),
(108,'взаимодействие','взаимодействие',0,0,0.9333,'в000',6,'*'),
(109,'все','все',0,0,0.2,'в000',9,'*'),
(110,'всегда','всегда',0,0,0.4,'в000',6,'*'),
(111,'вы','вы',0,0,0.1333,'в000',5,'*'),
(112,'вывоз','вывоз',0,0,0.3333,'в000',6,'*'),
(113,'вывоза','вывоза',0,0,0.4,'в000',6,'*'),
(114,'гордиться','гордиться',0,0,0.6,'г000',5,'*'),
(115,'город','город',0,0,0.3333,'г000',6,'*'),
(116,'города','города',0,0,0.4,'г000',10,'*'),
(117,'городе','городе',0,0,0.4,'г000',6,'*'),
(118,'городских','городских',0,0,0.6,'г000',6,'*'),
(119,'городской','городской',0,0,0.6,'г000',6,'*'),
(120,'готовы','готовы',0,0,0.4,'г000',6,'*'),
(121,'деятельности','деятельности',0,0,0.8,'д000',6,'*'),
(122,'диалога','диалога',0,0,0.4667,'д000',6,'*'),
(123,'для','для',0,0,0.2,'д000',10,'*'),
(124,'добро','добро',0,0,0.3333,'д000',6,'*'),
(125,'документами','документами',0,0,0.7333,'д000',5,'*'),
(126,'дорожного','дорожного',0,0,0.6,'д000',6,'*'),
(127,'другое','другое',0,0,0.4,'д000',6,'*'),
(128,'ежедневно','ежедневно',0,0,0.6,'е000',6,'*'),
(129,'жители','жители',0,0,0.4,'ж000',5,'*'),
(130,'за','за',0,0,0.1333,'з000',6,'*'),
(131,'заявку','заявку',0,0,0.4,'з000',5,'*'),
(132,'зелеными','зелеными',0,0,0.5333,'з000',6,'*'),
(133,'и','и',0,0,0.0667,'и000',10,'*'),
(134,'информацию','информацию',0,0,0.6667,'и000',5,'*'),
(135,'инфраструктуры','инфраструктуры',0,0,0.9333,'и000',6,'*'),
(136,'к','к',0,0,0.0667,'к000',5,'*'),
(137,'казенное','казенное',0,0,0.5333,'к000',10,'*'),
(138,'качества','качества',0,0,0.5333,'к000',6,'*'),
(139,'коммунального','коммунального',0,0,0.8667,'к000',10,'*'),
(140,'коммунальной','коммунальной',0,0,0.8,'к000',6,'*'),
(141,'коммунальных','коммунальных',0,0,0.8,'к000',6,'*'),
(142,'компаниями','компаниями',0,0,0.6667,'к000',6,'*'),
(143,'комфорт','комфорт',0,0,0.4667,'к000',6,'*'),
(144,'комфортным','комфортным',0,0,0.6667,'к000',6,'*'),
(145,'контакты','контакты',0,0,0.5333,'к000',6,'*'),
(146,'край','край',0,0,0.2667,'к000',6,'*'),
(147,'краснодарский','краснодарский',0,0,0.8667,'к000',6,'*'),
(148,'лабинск','лабинск',0,0,0.4667,'л000',6,'*'),
(149,'ленина','ленина',0,0,0.4,'л000',6,'*'),
(150,'малых','малых',0,0,0.3333,'м000',6,'*'),
(151,'мебели','мебели',0,0,0.4,'м000',6,'*'),
(152,'мероприятий','мероприятий',0,0,0.7333,'м000',6,'*'),
(153,'местом','местом',0,0,0.4,'м000',5,'*'),
(154,'многое','многое',0,0,0.4,'м000',6,'*'),
(155,'могли','могли',0,0,0.3333,'м000',5,'*'),
(156,'можете','можете',0,0,0.4,'м000',5,'*'),
(157,'муниципальное','муниципальное',0,0,0.8667,'м000',10,'*'),
(158,'мы','мы',0,0,0.1333,'м000',6,'*'),
(159,'над','над',0,0,0.2,'н000',6,'*'),
(160,'направлениями','направлениями',0,0,0.8667,'н000',6,'*'),
(161,'насаждениями','насаждениями',0,0,0.8,'н000',6,'*'),
(162,'наш','наш',0,0,0.2,'н000',6,'*'),
(163,'наша','наша',0,0,0.2667,'н000',6,'*'),
(164,'нашей','нашей',0,0,0.3333,'н000',6,'*'),
(165,'нашем','нашем',0,0,0.3333,'н000',6,'*'),
(166,'наши','наши',0,0,0.2667,'н000',6,'*'),
(167,'нормативными','нормативными',0,0,0.8,'н000',5,'*'),
(168,'обеспечиваем','обеспечиваем',0,0,0.8,'о000',6,'*'),
(169,'озеленение','озеленение',0,0,0.6667,'о000',6,'*'),
(170,'ознакомиться','ознакомиться',0,0,0.8,'о000',5,'*'),
(171,'организация','организация',0,0,0.7333,'о000',6,'*'),
(172,'освещения','освещения',0,0,0.6,'о000',6,'*'),
(173,'основные','основные',0,0,0.5333,'о000',6,'*'),
(174,'основными','основными',0,0,0.6,'о000',6,'*'),
(175,'оставался','оставался',0,0,0.6,'о000',6,'*'),
(176,'отвечает','отвечает',0,0,0.5333,'о000',6,'*'),
(177,'открыты','открыты',0,0,0.4667,'о000',6,'*'),
(178,'отходов','отходов',0,0,0.4667,'о000',6,'*'),
(179,'официальный','официальный',0,0,0.7333,'о000',6,'*'),
(180,'очистке','очистке',0,0,0.4667,'о000',6,'*'),
(181,'перерыв','перерыв',0,0,0.4667,'п000',6,'*'),
(182,'пн-пт','пн-пт',0,0,0.3333,'п000',6,'*'),
(183,'подать','подать',0,0,0.4,'п000',9,'*'),
(184,'пожаловать','пожаловать',0,0,0.6667,'п000',6,'*'),
(185,'покрытия','покрытия',0,0,0.5333,'п000',6,'*'),
(186,'получить','получить',0,0,0.5333,'п000',5,'*'),
(187,'порядок','порядок',0,0,0.4667,'п000',6,'*'),
(188,'предложения','предложения',0,0,0.7333,'п000',6,'*'),
(189,'предоставляемых','предоставляемых',0,0,1,'п000',6,'*'),
(190,'проблем','проблем',0,0,0.4667,'п000',5,'*'),
(191,'проживания','проживания',0,0,0.6667,'п000',6,'*'),
(192,'работаем','работаем',0,0,0.5333,'р000',6,'*'),
(193,'работах','работах',0,0,0.4667,'р000',5,'*'),
(194,'работы','работы',0,0,0.4,'р000',6,'*'),
(195,'развитие','развитие',0,0,0.5333,'р000',6,'*'),
(196,'развитием','развитием',0,0,0.6,'р000',6,'*'),
(197,'режим','режим',0,0,0.3333,'р000',6,'*'),
(198,'ремонт','ремонт',0,0,0.4,'р000',6,'*'),
(199,'с','с',0,0,0.0667,'с000',10,'*'),
(200,'сайт','сайт',0,0,0.2667,'с000',6,'*'),
(201,'сайте','сайте',0,0,0.3333,'с000',5,'*'),
(202,'санитарной','санитарной',0,0,0.6667,'с000',6,'*'),
(203,'своим','своим',0,0,0.3333,'с000',5,'*'),
(204,'содержание','содержание',0,0,0.6667,'с000',6,'*'),
(205,'стремимся','стремимся',0,0,0.6,'с000',5,'*'),
(206,'твердых','твердых',0,0,0.4667,'т000',6,'*'),
(207,'текущих','текущих',0,0,0.4667,'т000',5,'*'),
(208,'территорий','территорий',0,0,0.6667,'т000',6,'*'),
(209,'того','того',0,0,0.2667,'т000',6,'*'),
(210,'тому','тому',0,0,0.2667,'т000',5,'*'),
(211,'тсж','тсж',0,0,0.2,'т000',6,'*'),
(212,'уборка','уборка',0,0,0.4,'у000',6,'*'),
(213,'узнать','узнать',0,0,0.4,'у000',5,'*'),
(214,'ул','ул',0,0,0.1333,'у000',6,'*'),
(215,'улиц','улиц',0,0,0.2667,'у000',6,'*'),
(216,'уличного','уличного',0,0,0.5333,'у000',6,'*'),
(217,'улучшением','улучшением',0,0,0.6667,'у000',6,'*'),
(218,'улучшению','улучшению',0,0,0.6,'у000',6,'*'),
(219,'управление','управление',0,0,0.6667,'у000',10,'*'),
(220,'управляющими','управляющими',0,0,0.8,'у000',6,'*'),
(221,'услуг','услуг',0,0,0.3333,'у000',6,'*'),
(222,'услуги','услуги',0,0,0.4,'у000',6,'*'),
(223,'устранение','устранение',0,0,0.6667,'у000',5,'*'),
(224,'уход','уход',0,0,0.2667,'у000',6,'*'),
(225,'учреждение','учреждение',0,0,0.6667,'у000',10,'*'),
(226,'уютный','уютный',0,0,0.4,'у000',6,'*'),
(227,'уютным','уютным',0,0,0.4,'у000',6,'*'),
(228,'форм','форм',0,0,0.2667,'ф000',6,'*'),
(229,'хозяйства','хозяйства',0,0,0.6,'х000',10,'*'),
(230,'чистый','чистый',0,0,0.4,'ч000',6,'*'),
(231,'чистым','чистым',0,0,0.4,'ч000',6,'*'),
(232,'чтобы','чтобы',0,0,0.3333,'ч000',6,'*'),
(233,'этого','этого',0,0,0.3333,'э000',5,'*'),
(234,'являются','являются',0,0,0.5333,'я000',6,'*'),
(346,'2024','2024',0,0,0.4,'',4,'*'),
(347,'30','30',0,0,0.2,'',4,'*'),
(348,'внимание','внимание',0,0,0.5333,'в000',4,'*'),
(349,'год','год',0,0,0.2,'г000',4,'*'),
(350,'госуслуг','госуслуг',0,0,0.5333,'г000',4,'*'),
(351,'дней','дней',0,0,0.2667,'д000',4,'*'),
(352,'документ','документ',0,0,0.5333,'д000',4,'*'),
(353,'дома','дома',0,0,0.2667,'д000',4,'*'),
(354,'доступно','доступно',0,0,0.5333,'д000',4,'*'),
(355,'если','если',0,0,0.2667,'е000',4,'*'),
(356,'заказным','заказным',0,0,0.5333,'з000',4,'*'),
(357,'заполните','заполните',0,0,0.6,'з000',4,'*'),
(358,'заявлении','заявлении',0,0,0.6,'з000',4,'*'),
(359,'из','из',0,0,0.1333,'и000',4,'*'),
(360,'или','или',0,0,0.2,'и000',4,'*'),
(361,'индексом','индексом',0,0,0.5333,'и000',4,'*'),
(362,'как','как',0,0,0.2,'к000',4,'*'),
(363,'календарных','календарных',0,0,0.7333,'к000',4,'*'),
(364,'контактный','контактный',0,0,0.6667,'к000',4,'*'),
(365,'копии','копии',0,0,0.3333,'к000',4,'*'),
(366,'лично','лично',0,0,0.3333,'л000',4,'*'),
(367,'место','место',0,0,0.3333,'м000',4,'*'),
(368,'многоквартирного','многоквартирного',0,0,1,'м000',4,'*'),
(369,'момента','момента',0,0,0.4667,'м000',4,'*'),
(370,'муниципальной','муниципальной',0,0,0.8667,'м000',4,'*'),
(371,'мфц','мфц',0,0,0.2,'м000',4,'*'),
(372,'необходимые','необходимые',0,0,0.7333,'н000',4,'*'),
(373,'одним','одним',0,0,0.3333,'о000',4,'*'),
(374,'основание','основание',0,0,0.6,'о000',4,'*'),
(375,'печати','печати',0,0,0.4,'п000',4,'*'),
(376,'письмом','письмом',0,0,0.4667,'п000',4,'*'),
(377,'подайте','подайте',0,0,0.4667,'п000',4,'*'),
(378,'полностью','полностью',0,0,0.6,'п000',4,'*'),
(379,'полный','полный',0,0,0.4,'п000',4,'*'),
(380,'поля','поля',0,0,0.2667,'п000',4,'*'),
(381,'портал','портал',0,0,0.4,'п000',4,'*'),
(382,'почте','почте',0,0,0.3333,'п000',4,'*'),
(383,'придомовой','придомовой',0,0,0.6667,'п000',4,'*'),
(384,'приложите','приложите',0,0,0.6,'п000',4,'*'),
(385,'программе','программе',0,0,0.6,'п000',4,'*'),
(386,'распечатайте','распечатайте',0,0,0.8,'р000',4,'*'),
(387,'рассматриваются','рассматриваются',0,0,1,'р000',4,'*'),
(388,'регистрацией','регистрацией',0,0,0.8,'р000',4,'*'),
(389,'регистрации','регистрации',0,0,0.7333,'р000',4,'*'),
(390,'руки','руки',0,0,0.2667,'р000',4,'*'),
(391,'согласно','согласно',0,0,0.5333,'с000',4,'*'),
(392,'способов','способов',0,0,0.5333,'с000',4,'*'),
(393,'страницы','страницы',0,0,0.5333,'с000',4,'*'),
(394,'территорией','территорией',0,0,0.7333,'т000',4,'*'),
(395,'течение','течение',0,0,0.4667,'т000',4,'*'),
(396,'требует','требует',0,0,0.4667,'т000',4,'*'),
(397,'указанных','указанных',0,0,0.6,'у000',4,'*'),
(398,'фото','фото',0,0,0.2667,'ф000',4,'*'),
(399,'фотографии','фотографии',0,0,0.6667,'ф000',4,'*'),
(400,'через','через',0,0,0.3333,'ч000',4,'*'),
(401,'является','является',0,0,0.5333,'я000',4,'*'),
(409,'kazennoe','kazennoe',0,0,0.5333,'K500',2,'*'),
(410,'municipalnoe','municipalnoe',0,0,0.8,'M2145',2,'*'),
(411,'ucrezdenie','ucrezdenie',0,0,0.6667,'U26235',2,'*'),
(412,'скачать','скачать',0,0,0.4667,'с000',2,'*'),
(416,'почта','почта',0,0,0.3333,'п000',1,'*'),
(417,'электронная','электронная',0,0,0.7333,'э000',1,'*');
/*!40000 ALTER TABLE `amtf3_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_terms_common`
--

DROP TABLE IF EXISTS `amtf3_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) NOT NULL DEFAULT '',
  `custom` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_term_language` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_terms_common`
--

LOCK TABLES `amtf3_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_terms_common` DISABLE KEYS */;
INSERT INTO `amtf3_finder_terms_common` VALUES
('a','en',0),
('about','en',0),
('above','en',0),
('after','en',0),
('again','en',0),
('against','en',0),
('all','en',0),
('am','en',0),
('an','en',0),
('and','en',0),
('any','en',0),
('are','en',0),
('aren\'t','en',0),
('as','en',0),
('at','en',0),
('be','en',0),
('because','en',0),
('been','en',0),
('before','en',0),
('being','en',0),
('below','en',0),
('between','en',0),
('both','en',0),
('but','en',0),
('by','en',0),
('can\'t','en',0),
('cannot','en',0),
('could','en',0),
('couldn\'t','en',0),
('did','en',0),
('didn\'t','en',0),
('do','en',0),
('does','en',0),
('doesn\'t','en',0),
('doing','en',0),
('don\'t','en',0),
('down','en',0),
('during','en',0),
('each','en',0),
('few','en',0),
('for','en',0),
('from','en',0),
('further','en',0),
('had','en',0),
('hadn\'t','en',0),
('has','en',0),
('hasn\'t','en',0),
('have','en',0),
('haven\'t','en',0),
('having','en',0),
('he','en',0),
('he\'d','en',0),
('he\'ll','en',0),
('he\'s','en',0),
('her','en',0),
('here','en',0),
('here\'s','en',0),
('hers','en',0),
('herself','en',0),
('him','en',0),
('himself','en',0),
('his','en',0),
('how','en',0),
('how\'s','en',0),
('href','ru',0),
('i','en',0),
('i\'d','en',0),
('i\'ll','en',0),
('i\'m','en',0),
('i\'ve','en',0),
('if','en',0),
('in','en',0),
('into','en',0),
('is','en',0),
('isn\'t','en',0),
('it','en',0),
('it\'s','en',0),
('its','en',0),
('itself','en',0),
('let\'s','en',0),
('lol','ru',0),
('me','en',0),
('more','en',0),
('most','en',0),
('mustn\'t','en',0),
('my','en',0),
('myself','en',0),
('no','en',0),
('nor','en',0),
('not','en',0),
('of','en',0),
('off','en',0),
('on','en',0),
('once','en',0),
('only','en',0),
('or','en',0),
('other','en',0),
('ought','en',0),
('our','en',0),
('ours','en',0),
('ourselves','en',0),
('out','en',0),
('over','en',0),
('own','en',0),
('same','en',0),
('shan\'t','en',0),
('she','en',0),
('she\'d','en',0),
('she\'ll','en',0),
('she\'s','en',0),
('should','en',0),
('shouldn\'t','en',0),
('so','en',0),
('some','en',0),
('such','en',0),
('than','en',0),
('that','en',0),
('that\'s','en',0),
('the','en',0),
('their','en',0),
('theirs','en',0),
('them','en',0),
('themselves','en',0),
('then','en',0),
('there','en',0),
('there\'s','en',0),
('these','en',0),
('they','en',0),
('they\'d','en',0),
('they\'ll','en',0),
('they\'re','en',0),
('they\'ve','en',0),
('this','en',0),
('those','en',0),
('through','en',0),
('to','en',0),
('too','en',0),
('under','en',0),
('until','en',0),
('up','en',0),
('very','en',0),
('was','en',0),
('wasn\'t','en',0),
('we','en',0),
('we\'d','en',0),
('we\'ll','en',0),
('we\'re','en',0),
('we\'ve','en',0),
('were','en',0),
('weren\'t','en',0),
('what','en',0),
('what\'s','en',0),
('when','en',0),
('when\'s','en',0),
('where','en',0),
('where\'s','en',0),
('which','en',0),
('while','en',0),
('who','en',0),
('who\'s','en',0),
('whom','en',0),
('why','en',0),
('why\'s','en',0),
('with','en',0),
('won\'t','en',0),
('would','en',0),
('wouldn\'t','en',0),
('www','ru',0),
('you','en',0),
('you\'d','en',0),
('you\'ll','en',0),
('you\'re','en',0),
('you\'ve','en',0),
('your','en',0),
('yours','en',0),
('yourself','en',0),
('yourselves','en',0),
('а','ru',0),
('без','ru',0),
('благодарю','ru',0),
('благодаря','ru',0),
('близко','ru',0),
('более','ru',0),
('более-менее','ru',0),
('большая','ru',0),
('больше','ru',0),
('большие','ru',0),
('большое','ru',0),
('большой','ru',0),
('будет','ru',0),
('будут','ru',0),
('будучи','ru',0),
('был','ru',0),
('была','ru',0),
('были','ru',0),
('было','ru',0),
('быть','ru',0),
('в','ru',0),
('вам','ru',0),
('вами','ru',0),
('вас','ru',0),
('ваш','ru',0),
('ваша','ru',0),
('ваше','ru',0),
('вашего','ru',0),
('вашей','ru',0),
('вашем','ru',0),
('вашему','ru',0),
('ваши','ru',0),
('вашим','ru',0),
('вашими','ru',0),
('ваших','ru',0),
('вашу','ru',0),
('вблизи','ru',0),
('ведь','ru',0),
('везде','ru',0),
('великолепно','ru',0),
('вне','ru',0),
('внутри','ru',0),
('во','ru',0),
('возле','ru',0),
('вот','ru',0),
('временами','ru',0),
('временем','ru',0),
('времени','ru',0),
('время','ru',0),
('все','ru',0),
('все-таки','ru',0),
('всегда','ru',0),
('всего','ru',0),
('всеми','ru',0),
('всех','ru',0),
('всякая','ru',0),
('всякие','ru',0),
('всякий','ru',0),
('всяким','ru',0),
('всякими','ru',0),
('всяких','ru',0),
('всякого','ru',0),
('всякое','ru',0),
('всякой','ru',0),
('всяком','ru',0),
('всякому','ru',0),
('всякую','ru',0),
('всё','ru',0),
('всё-таки','ru',0),
('выглядит','ru',0),
('выглядят','ru',0),
('где','ru',0),
('да','ru',0),
('далеко','ru',0),
('действительно','ru',0),
('день','ru',0),
('для','ru',0),
('дне','ru',0),
('дней','ru',0),
('днем','ru',0),
('дни','ru',0),
('дню','ru',0),
('дня','ru',0),
('дням','ru',0),
('днями','ru',0),
('днях','ru',0),
('днём','ru',0),
('до','ru',0),
('дом','ru',0),
('дома','ru',0),
('доме','ru',0),
('домом','ru',0),
('дому','ru',0),
('его','ru',0),
('ее','ru',0),
('если','ru',0),
('есть','ru',0),
('еще','ru',0),
('её','ru',0),
('же','ru',0),
('за','ru',0),
('затем','ru',0),
('затем-то','ru',0),
('захотел','ru',0),
('захотела','ru',0),
('захотели','ru',0),
('захочу','ru',0),
('зачем','ru',0),
('зачем-то','ru',0),
('знает','ru',0),
('знал','ru',0),
('знала','ru',0),
('знали','ru',0),
('знало','ru',0),
('знаю','ru',0),
('и','ru',0),
('и т.д','ru',0),
('и т.п','ru',0),
('ибо','ru',0),
('из','ru',0),
('из-под','ru',0),
('или','ru',0),
('им','ru',0),
('имхо','ru',0),
('иначе','ru',0),
('иногда','ru',0),
('искал','ru',0),
('искала','ru',0),
('искали','ru',0),
('искало','ru',0),
('искать','ru',0),
('итак','ru',0),
('их','ru',0),
('к','ru',0),
('каждый','ru',0),
('как','ru',0),
('какая','ru',0),
('какие','ru',0),
('каким','ru',0),
('каких','ru',0),
('какого','ru',0),
('какое','ru',0),
('какой','ru',0),
('каком','ru',0),
('какому','ru',0),
('какую','ru',0),
('кем','ru',0),
('когда','ru',0),
('когда-нибудь','ru',0),
('кого','ru',0),
('ком','ru',0),
('кому','ru',0),
('которая','ru',0),
('которого','ru',0),
('которое','ru',0),
('которой','ru',0),
('котором','ru',0),
('которому','ru',0),
('которую','ru',0),
('которые','ru',0),
('который','ru',0),
('которым','ru',0),
('которых','ru',0),
('кстати','ru',0),
('кто','ru',0),
('кто-то','ru',0),
('куда','ru',0),
('ли','ru',0),
('либо','ru',0),
('лол','ru',0),
('лучшая','ru',0),
('лучшее','ru',0),
('лучшие','ru',0),
('лучший','ru',0),
('любая','ru',0),
('любого','ru',0),
('любое','ru',0),
('любой','ru',0),
('любому','ru',0),
('любую','ru',0),
('любые','ru',0),
('любым','ru',0),
('любыми','ru',0),
('любых','ru',0),
('маленькая','ru',0),
('маленький','ru',0),
('маленьким','ru',0),
('маленького','ru',0),
('маленькое','ru',0),
('маленькой','ru',0),
('маленьком','ru',0),
('маленькому','ru',0),
('маленькую','ru',0),
('между','ru',0),
('менее','ru',0),
('меньше','ru',0),
('меня','ru',0),
('мир','ru',0),
('мне','ru',0),
('много','ru',0),
('мной','ru',0),
('мог','ru',0),
('могла','ru',0),
('могли','ru',0),
('могло','ru',0),
('могу','ru',0),
('мое','ru',0),
('можем','ru',0),
('может','ru',0),
('мои','ru',0),
('мой','ru',0),
('моя','ru',0),
('моё','ru',0),
('мы','ru',0),
('на','ru',0),
('над','ru',0),
('назад','ru',0),
('наиболее','ru',0),
('наименее','ru',0),
('нам','ru',0),
('нами','ru',0),
('напишет','ru',0),
('напишу','ru',0),
('напишут','ru',0),
('например','ru',0),
('нас','ru',0),
('наш','ru',0),
('наша','ru',0),
('наше','ru',0),
('нашего','ru',0),
('нашей','ru',0),
('нашем','ru',0),
('нашему','ru',0),
('наши','ru',0),
('нашим','ru',0),
('нашими','ru',0),
('наших','ru',0),
('нашу','ru',0),
('не','ru',0),
('него','ru',0),
('недавно','ru',0),
('нее','ru',0),
('немного','ru',0),
('нет','ru',0),
('неужели','ru',0),
('неё','ru',0),
('ни','ru',0),
('никогда','ru',0),
('никто','ru',0),
('ним','ru',0),
('ничего','ru',0),
('ничто','ru',0),
('но','ru',0),
('новая','ru',0),
('нового','ru',0),
('новое','ru',0),
('новой','ru',0),
('новом','ru',0),
('новому','ru',0),
('новостей','ru',0),
('новости','ru',0),
('новость','ru',0),
('новостями','ru',0),
('новую','ru',0),
('новый','ru',0),
('новым','ru',0),
('новых','ru',0),
('ну','ru',0),
('нужен','ru',0),
('нужна','ru',0),
('нужно','ru',0),
('нужны','ru',0),
('о','ru',0),
('об','ru',0),
('однако','ru',0),
('около','ru',0),
('он','ru',0),
('она','ru',0),
('они','ru',0),
('оно','ru',0),
('от','ru',0),
('ответ','ru',0),
('ответил','ru',0),
('ответила','ru',0),
('ответили','ru',0),
('ответило','ru',0),
('откуда','ru',0),
('отнюдь','ru',0),
('перед','ru',0),
('писал','ru',0),
('писала','ru',0),
('писали','ru',0),
('писало','ru',0),
('пишет','ru',0),
('пишу','ru',0),
('пишут','ru',0),
('плохо','ru',0),
('по','ru',0),
('поблизости','ru',0),
('под','ru',0),
('пожалуйста','ru',0),
('получала','ru',0),
('получали','ru',0),
('получало','ru',0),
('получать','ru',0),
('получил','ru',0),
('получила','ru',0),
('получили','ru',0),
('получило','ru',0),
('получить','ru',0),
('пор','ru',0),
('пора','ru',0),
('порам','ru',0),
('порами','ru',0),
('поре','ru',0),
('порой','ru',0),
('пору','ru',0),
('поры','ru',0),
('после','ru',0),
('потому','ru',0),
('почему','ru',0),
('почти','ru',0),
('пошли','ru',0),
('правда','ru',0),
('прежде','ru',0),
('примерно','ru',0),
('про','ru',0),
('просто','ru',0),
('прошел','ru',0),
('прошла','ru',0),
('прошли','ru',0),
('прошло','ru',0),
('прошёл','ru',0),
('пускай','ru',0),
('пусть','ru',0),
('раз','ru',0),
('раза','ru',0),
('разве','ru',0),
('реже','ru',0),
('с','ru',0),
('сам','ru',0),
('сама','ru',0),
('самая','ru',0),
('сами','ru',0),
('самим','ru',0),
('самими','ru',0),
('самих','ru',0),
('само','ru',0),
('самого','ru',0),
('самое','ru',0),
('самой','ru',0),
('самом','ru',0),
('самому','ru',0),
('саму','ru',0),
('самую','ru',0),
('самые','ru',0),
('самый','ru',0),
('самым','ru',0),
('самыми','ru',0),
('самых','ru',0),
('сделал','ru',0),
('сделала','ru',0),
('сделали','ru',0),
('сделало','ru',0),
('сейчас','ru',0),
('сквозь','ru',0),
('скорее','ru',0),
('скоро','ru',0),
('случае','ru',0),
('случаем','ru',0),
('случай','ru',0),
('случаю','ru',0),
('случая','ru',0),
('смотря','ru',0),
('со','ru',0),
('совсем','ru',0),
('спасибо','ru',0),
('старая','ru',0),
('старого','ru',0),
('старое','ru',0),
('старой','ru',0),
('старом','ru',0),
('старому','ru',0),
('старую','ru',0),
('старый','ru',0),
('старым','ru',0),
('старых','ru',0),
('так','ru',0),
('также','ru',0),
('твое','ru',0),
('твоего','ru',0),
('твои','ru',0),
('твой','ru',0),
('твою','ru',0),
('твоя','ru',0),
('твоё','ru',0),
('те','ru',0),
('тебя','ru',0),
('тем','ru',0),
('теми','ru',0),
('теперь','ru',0),
('тех','ru',0),
('тобой','ru',0),
('тогда','ru',0),
('того','ru',0),
('тоже','ru',0),
('той','ru',0),
('только','ru',0),
('туда','ru',0),
('у','ru',0),
('ужасно','ru',0),
('уже','ru',0),
('узнает','ru',0),
('узнают','ru',0),
('ушел','ru',0),
('ушла','ru',0),
('ушли','ru',0),
('ушло','ru',0),
('ушёл','ru',0),
('ходил','ru',0),
('ходила','ru',0),
('ходили','ru',0),
('ходило','ru',0),
('ходит','ru',0),
('ходить','ru',0),
('ходят','ru',0),
('хорошо','ru',0),
('хотел','ru',0),
('хотела','ru',0),
('хотели','ru',0),
('хотело','ru',0),
('хотя','ru',0),
('хочу','ru',0),
('чаще','ru',0),
('чего','ru',0),
('чем','ru',0),
('чем-то','ru',0),
('чему','ru',0),
('через','ru',0),
('что','ru',0),
('чтоб','ru',0),
('чтобы','ru',0),
('чье','ru',0),
('чьей','ru',0),
('чьему','ru',0),
('чьи','ru',0),
('чьим','ru',0),
('чьими','ru',0),
('чьих','ru',0),
('чья','ru',0),
('чьё','ru',0),
('чём','ru',0),
('чём-то','ru',0),
('шел','ru',0),
('шла','ru',0),
('шли','ru',0),
('шло','ru',0),
('шёл','ru',0),
('эта','ru',0),
('эти','ru',0),
('этим','ru',0),
('этих','ru',0),
('это','ru',0),
('этой','ru',0),
('этому','ru',0),
('этот','ru',0),
('эту','ru',0),
('я','ru',0),
('является','ru',0),
('являются','ru',0);
/*!40000 ALTER TABLE `amtf3_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_tokens`
--

DROP TABLE IF EXISTS `amtf3_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_tokens` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `weight` float unsigned NOT NULL DEFAULT 1,
  `context` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `language` char(7) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_stem` (`stem`),
  KEY `idx_context` (`context`),
  KEY `idx_language` (`language`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_tokens`
--

LOCK TABLES `amtf3_finder_tokens` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `amtf3_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `term_weight` float unsigned NOT NULL DEFAULT 0,
  `context` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `context_weight` float unsigned NOT NULL DEFAULT 0,
  `total_weight` float unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_tokens_aggregate`
--

LOCK TABLES `amtf3_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_finder_types`
--

DROP TABLE IF EXISTS `amtf3_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_finder_types`
--

LOCK TABLES `amtf3_finder_types` WRITE;
/*!40000 ALTER TABLE `amtf3_finder_types` DISABLE KEYS */;
INSERT INTO `amtf3_finder_types` VALUES
(1,'Category',''),
(2,'Contact',''),
(3,'Article',''),
(4,'News Feed',''),
(5,'Tag','');
/*!40000 ALTER TABLE `amtf3_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_guidedtour_steps`
--

DROP TABLE IF EXISTS `amtf3_guidedtour_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_guidedtour_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `position` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `interactive_type` int(11) NOT NULL DEFAULT 1,
  `url` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `language` varchar(7) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  `params` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tour` (`tour_id`),
  KEY `idx_state` (`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_guidedtour_steps`
--

LOCK TABLES `amtf3_guidedtour_steps` WRITE;
/*!40000 ALTER TABLE `amtf3_guidedtour_steps` DISABLE KEYS */;
INSERT INTO `amtf3_guidedtour_steps` VALUES
(1,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_NEW_DESCRIPTION',1,'bottom','.button-new',2,1,'administrator/index.php?option=com_guidedtours&view=tours','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(2,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_TITLE_DESCRIPTION',2,'bottom','#jform_title',2,2,'administrator/index.php?option=com_guidedtours&view=tour&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(3,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_URL_DESCRIPTION',3,'top','#jform_url',2,2,'administrator/index.php?option=com_guidedtours&view=tour&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(4,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONTENT_DESCRIPTION',4,'bottom','#jform_description,#jform_description_ifr',2,3,'administrator/index.php?option=com_guidedtours&view=tour&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(5,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_COMPONENT_DESCRIPTION',5,'top','joomla-field-fancy-select .choices',2,3,'administrator/index.php?option=com_guidedtours&view=tour&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(6,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_AUTOSTART_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_AUTOSTART_DESCRIPTION',6,'bottom','#jform_autostart0',2,3,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(7,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_SAVECLOSE_DESCRIPTION',7,'top','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_guidedtours&view=tour&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(8,1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_STEP_CONGRATULATIONS_DESCRIPTION',8,'bottom','',0,1,'administrator/index.php?option=com_guidedtours&view=tour&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(9,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_COUNTER_DESCRIPTION',9,'top','#toursList tbody tr:nth-last-of-type(1) td:nth-of-type(5) .btn',2,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(10,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_NEW_DESCRIPTION',10,'bottom','.button-new',2,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(11,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TITLE_DESCRIPTION',11,'bottom','#jform_title',2,2,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(12,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_DESCRIPTION_DESCRIPTION',12,'bottom','#jform_description,#jform_description_ifr',2,3,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(13,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_STATUS_DESCRIPTION',13,'bottom','#jform_published',2,3,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(14,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_POSITION_DESCRIPTION',14,'top','#jform_position',2,3,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(15,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TARGET_DESCRIPTION',15,'top','#jform_target',2,3,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(16,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_TYPE_DESCRIPTION',16,'top','#jform_type',2,3,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(17,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_SAVECLOSE_DESCRIPTION',17,'bottom','#save-group-children-save .button-save',2,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(18,2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_STEP_CONGRATULATIONS_DESCRIPTION',18,'bottom','',0,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(19,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NEW_DESCRIPTION',19,'bottom','.button-new',2,1,'administrator/index.php?option=com_content&view=articles','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(20,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TITLE_DESCRIPTION',20,'bottom','#jform_title',2,2,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(21,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ALIAS_DESCRIPTION',21,'bottom','#jform_alias',2,2,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(22,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONTENT_DESCRIPTION',22,'bottom','#jform_articletext,#jform_articletext_ifr',2,3,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(23,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_STATUS_DESCRIPTION',23,'bottom','#jform_state',2,3,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(24,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CATEGORY_DESCRIPTION',24,'top','joomla-field-fancy-select .choices[data-type=select-one]',2,3,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(25,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_FEATURED_DESCRIPTION',25,'bottom','#jform_featured0',2,3,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(26,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_ACCESS_DESCRIPTION',26,'bottom','#jform_access',2,3,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(27,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_TAGS_DESCRIPTION',27,'top','joomla-field-fancy-select .choices[data-type=select-multiple]',2,3,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(28,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_NOTE_DESCRIPTION',28,'top','#jform_note',2,2,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(29,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_VERSIONNOTE_DESCRIPTION',29,'top','#jform_version_note',2,2,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(30,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_SAVECLOSE_DESCRIPTION',30,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(31,3,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_ARTICLES_STEP_CONGRATULATIONS_DESCRIPTION',31,'bottom','',0,1,'administrator/index.php?option=com_content&view=article&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(32,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NEW_DESCRIPTION',32,'bottom','.button-new',2,1,'administrator/index.php?option=com_categories&view=categories&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(33,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TITLE_DESCRIPTION',33,'bottom','#jform_title',2,2,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(34,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ALIAS_DESCRIPTION',34,'bottom','#jform_alias',2,2,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(35,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONTENT_DESCRIPTION',35,'bottom','#jform_description,#jform_description_ifr',2,3,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(36,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_PARENT_DESCRIPTION',36,'top','joomla-field-fancy-select .choices[data-type=select-one]',2,3,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(37,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_STATUS_DESCRIPTION',37,'bottom','#jform_published',2,3,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(38,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_ACCESS_DESCRIPTION',38,'bottom','#jform_access',2,3,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(39,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_TAGS_DESCRIPTION',39,'top','joomla-field-fancy-select .choices[data-type=select-multiple]',2,3,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(40,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_NOTE_DESCRIPTION',40,'top','#jform_note',2,2,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(41,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_VERSIONNOTE_DESCRIPTION',41,'top','#jform_version_note',2,2,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(42,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_SAVECLOSE_DESCRIPTION',42,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(43,4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CATEGORIES_STEP_CONGRATULATIONS_DESCRIPTION',43,'bottom','',0,1,'administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(44,5,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_NEW_DESCRIPTION',44,'bottom','.button-new',2,1,'administrator/index.php?option=com_menus&view=menus','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(45,5,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_TITLE_DESCRIPTION',45,'bottom','#jform_title',2,2,'administrator/index.php?option=com_menus&view=menu&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(46,5,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_TITLE',1,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_UNIQUENAME_DESCRIPTION',46,'top','#jform_menutype',2,2,'administrator/index.php?option=com_menus&view=menu&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(47,5,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_TITLE',1,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_DESCRIPTION_DESCRIPTION',47,'top','#jform_menudescription',2,2,'administrator/index.php?option=com_menus&view=menu&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(48,5,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_SAVECLOSE_DESCRIPTION',48,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_menus&view=menu&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(49,5,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_MENUS_STEP_CONGRATULATIONS_DESCRIPTION',49,'bottom','',0,1,'administrator/index.php?option=com_menus&view=menu&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(50,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NEW_DESCRIPTION',50,'bottom','.button-new',2,1,'administrator/index.php?option=com_tags&view=tags','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(51,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_TITLE_DESCRIPTION',51,'bottom','#jform_title',2,2,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(52,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ALIAS_DESCRIPTION',52,'bottom','#jform_alias',2,2,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(53,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONTENT_DESCRIPTION',53,'bottom','#jform_description,#jform_description_ifr',2,3,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(54,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_PARENT_DESCRIPTION',54,'top','joomla-field-fancy-select .choices[data-type=select-one]',2,3,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(55,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_STATUS_DESCRIPTION',55,'bottom','#jform_published',2,3,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(56,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_ACCESS_DESCRIPTION',56,'bottom','#jform_access',2,3,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(57,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_NOTE_DESCRIPTION',57,'top','#jform_note',2,2,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(58,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_VERSIONNOTE_DESCRIPTION',58,'top','#jform_version_note',2,2,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(59,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_SAVECLOSE_DESCRIPTION',59,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(60,6,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_TAGS_STEP_CONGRATULATIONS_DESCRIPTION',60,'bottom','',0,1,'administrator/index.php?option=com_tags&view=tag&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(61,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_NEW_DESCRIPTION',61,'bottom','.button-new',2,1,'administrator/index.php?option=com_banners&view=banners','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(62,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_TITLE_DESCRIPTION',62,'bottom','#jform_name',2,2,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(63,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_ALIAS_DESCRIPTION',63,'bottom','#jform_alias',2,2,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(64,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_DETAILS_DESCRIPTION',64,'bottom','.col-lg-9',2,3,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(65,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_STATUS_DESCRIPTION',65,'bottom','#jform_state',2,3,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(66,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CATEGORY_DESCRIPTION',66,'top','joomla-field-fancy-select .choices[data-type=select-one]',2,3,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(67,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_PINNED_DESCRIPTION',67,'bottom','#jform_sticky1',2,3,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(68,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_VERSIONNOTE_DESCRIPTION',68,'top','#jform_version_note',2,2,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(69,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_SAVECLOSE_DESCRIPTION',69,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(70,7,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_BANNERS_STEP_CONGRATULATIONS_DESCRIPTION',70,'bottom','',0,1,'administrator/index.php?option=com_banners&view=banner&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(71,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_NEW_DESCRIPTION',71,'bottom','.button-new',2,1,'administrator/index.php?option=com_contact&view=contacts','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(72,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TITLE_DESCRIPTION',72,'bottom','#jform_name',2,2,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(73,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ALIAS_DESCRIPTION',73,'bottom','#jform_alias',2,2,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(74,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_DETAILS_DESCRIPTION',74,'bottom','.col-lg-9',0,1,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(75,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_STATUS_DESCRIPTION',75,'bottom','#jform_published',2,3,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(76,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CATEGORY_DESCRIPTION',76,'top','joomla-field-fancy-select .choices[data-type=select-one]',2,3,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(77,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_FEATURED_DESCRIPTION',77,'bottom','#jform_featured0',2,3,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(78,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_ACCESS_DESCRIPTION',78,'bottom','#jform_access',2,3,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(79,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_TAGS_DESCRIPTION',79,'top','joomla-field-fancy-select .choices[data-type=select-multiple]',2,3,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(80,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_VERSIONNOTE_DESCRIPTION',80,'top','#jform_version_note',2,2,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(81,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_SAVECLOSE_DESCRIPTION',81,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(82,8,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_CONTACTS_STEP_CONGRATULATIONS_DESCRIPTION',82,'bottom','',0,1,'administrator/index.php?option=com_contact&view=contact&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(83,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_NEW_DESCRIPTION',83,'bottom','.button-new',2,1,'administrator/index.php?option=com_newsfeeds&view=newsfeeds','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(84,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TITLE_DESCRIPTION',84,'bottom','#jform_name',2,2,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(85,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ALIAS_DESCRIPTION',85,'bottom','#jform_alias',2,2,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(86,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_LINK_DESCRIPTION',86,'bottom','#jform_link',2,2,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(87,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_DESCRIPTION_DESCRIPTION',87,'bottom','#jform_description,#jform_description_ifr',2,3,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(88,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_STATUS_DESCRIPTION',88,'bottom','#jform_published',2,3,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(89,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CATEGORY_DESCRIPTION',89,'top','joomla-field-fancy-select .choices[data-type=select-one]',2,3,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(90,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_ACCESS_DESCRIPTION',90,'bottom','#jform_access',2,3,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(91,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_TAGS_DESCRIPTION',91,'top','joomla-field-fancy-select .choices[data-type=select-multiple]',2,3,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(92,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_VERSIONNOTE_DESCRIPTION',92,'top','#jform_version_note',2,2,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(93,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_SAVECLOSE_DESCRIPTION',93,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(94,9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_STEP_CONGRATULATIONS_DESCRIPTION',94,'bottom','',0,1,'administrator/index.php?option=com_newsfeeds&view=newsfeed&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(95,10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_NEW_DESCRIPTION',95,'bottom','.button-new',2,1,'administrator/index.php?option=com_finder&view=filters','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(96,10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_TITLE',1,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_TITLE_DESCRIPTION',96,'bottom','#jform_title',2,2,'administrator/index.php?option=com_finder&view=filter&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(97,10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_TITLE',1,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_ALIAS_DESCRIPTION',97,'bottom','#jform_alias',2,2,'administrator/index.php?option=com_finder&view=filter&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(98,10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_TITLE',1,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONTENT_DESCRIPTION',98,'bottom','.col-lg-9',0,1,'administrator/index.php?option=com_finder&view=filter&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(99,10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_STATUS_DESCRIPTION',99,'bottom','#jform_state',2,3,'administrator/index.php?option=com_finder&view=filter&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(100,10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_SAVECLOSE_DESCRIPTION',100,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_finder&view=filter&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(101,10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_STEP_CONGRATULATIONS_DESCRIPTION',101,'bottom','',0,1,'administrator/index.php?option=com_finder&view=filter&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(102,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_NEW_DESCRIPTION',102,'bottom','.button-new',2,1,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(103,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_NAME_DESCRIPTION',103,'bottom','#jform_name',2,2,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(104,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_LOGINNAME_DESCRIPTION',104,'bottom','#jform_username',2,2,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(105,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD_DESCRIPTION',105,'bottom','#jform_password',2,2,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(106,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORD2_DESCRIPTION',106,'bottom','#jform_password2',2,2,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(107,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_EMAIL_DESCRIPTION',107,'bottom','#jform_email',2,2,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(108,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_SYSTEMEMAIL_DESCRIPTION',108,'top','#jform_sendEmail0',2,3,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(109,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_STATUS_DESCRIPTION',109,'top','#jform_block0',2,3,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(110,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_PASSWORDRESET_DESCRIPTION',110,'top','#jform_requireReset0',2,3,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(111,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_SAVECLOSE_DESCRIPTION',111,'bottom','#save-group-children-save .button-save',2,1,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(112,11,'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_USERS_STEP_CONGRATULATIONS_DESCRIPTION',112,'bottom','',0,1,'administrator/index.php?option=com_users&view=user&layout=edit','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(113,12,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_MENUS_TITLE',1,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_MENUS_DESCRIPTION',113,'right','#sidebarmenu',0,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(114,12,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_QUICKACCESS_TITLE',1,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_QUICKACCESS_DESCRIPTION',114,'center','',0,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(115,12,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_NOTIFICATIONS_TITLE',1,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_NOTIFICATIONS_DESCRIPTION',115,'left','.quickicons-for-update_quickicon .card',0,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(116,12,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_TOPBAR_TITLE',1,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_TOPBAR_DESCRIPTION',116,'bottom','#header',0,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL),
(117,12,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_FINALWORDS_TITLE',1,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_STEP_FINALWORDS_DESCRIPTION',117,'right','#sidebarmenu nav > ul:first-of-type > li:last-child',0,1,'','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,'*','',NULL);
/*!40000 ALTER TABLE `amtf3_guidedtour_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_guidedtours`
--

DROP TABLE IF EXISTS `amtf3_guidedtours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_guidedtours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `uid` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `extensions` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `language` varchar(7) NOT NULL,
  `note` varchar(255) NOT NULL DEFAULT '',
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `autostart` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_state` (`published`),
  KEY `idx_language` (`language`),
  KEY `idx_uid` (`uid`(191))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_guidedtours`
--

LOCK TABLES `amtf3_guidedtours` WRITE;
/*!40000 ALTER TABLE `amtf3_guidedtours` DISABLE KEYS */;
INSERT INTO `amtf3_guidedtours` VALUES
(1,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_TITLE','joomla-guidedtours','COM_GUIDEDTOURS_TOUR_GUIDEDTOURS_DESCRIPTION',1,'[\"com_guidedtours\"]','administrator/index.php?option=com_guidedtours&view=tours','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(2,'COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_TITLE','joomla-guidedtoursteps','COM_GUIDEDTOURS_TOUR_GUIDEDTOURSTEPS_DESCRIPTION',2,'[\"com_guidedtours\"]','administrator/index.php?option=com_guidedtours&view=tours','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(3,'COM_GUIDEDTOURS_TOUR_ARTICLES_TITLE','joomla-articles','COM_GUIDEDTOURS_TOUR_ARTICLES_DESCRIPTION',3,'[\"com_content\",\"com_categories\"]','administrator/index.php?option=com_content&view=articles','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(4,'COM_GUIDEDTOURS_TOUR_CATEGORIES_TITLE','joomla-categories','COM_GUIDEDTOURS_TOUR_CATEGORIES_DESCRIPTION',4,'[\"com_content\",\"com_categories\"]','administrator/index.php?option=com_categories&view=categories&extension=com_content','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(5,'COM_GUIDEDTOURS_TOUR_MENUS_TITLE','joomla-menus','COM_GUIDEDTOURS_TOUR_MENUS_DESCRIPTION',5,'[\"com_menus\"]','administrator/index.php?option=com_menus&view=menus','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(6,'COM_GUIDEDTOURS_TOUR_TAGS_TITLE','joomla-tags','COM_GUIDEDTOURS_TOUR_TAGS_DESCRIPTION',6,'[\"com_tags\"]','administrator/index.php?option=com_tags&view=tags','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(7,'COM_GUIDEDTOURS_TOUR_BANNERS_TITLE','joomla-banners','COM_GUIDEDTOURS_TOUR_BANNERS_DESCRIPTION',7,'[\"com_banners\"]','administrator/index.php?option=com_banners&view=banners','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(8,'COM_GUIDEDTOURS_TOUR_CONTACTS_TITLE','joomla-contacts','COM_GUIDEDTOURS_TOUR_CONTACTS_DESCRIPTION',8,'[\"com_contact\"]','administrator/index.php?option=com_contact&view=contacts','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(9,'COM_GUIDEDTOURS_TOUR_NEWSFEEDS_TITLE','joomla-newsfeeds','COM_GUIDEDTOURS_TOUR_NEWSFEEDS_DESCRIPTION',9,'[\"com_newsfeeds\"]','administrator/index.php?option=com_newsfeeds&view=newsfeeds','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(10,'COM_GUIDEDTOURS_TOUR_SMARTSEARCH_TITLE','joomla-smartsearch','COM_GUIDEDTOURS_TOUR_SMARTSEARCH_DESCRIPTION',10,'[\"com_finder\"]','administrator/index.php?option=com_finder&view=filters','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(11,'COM_GUIDEDTOURS_TOUR_USERS_TITLE','joomla-users','COM_GUIDEDTOURS_TOUR_USERS_DESCRIPTION',11,'[\"com_users\"]','administrator/index.php?option=com_users&view=users','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,0),
(12,'COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_TITLE','joomla-welcome','COM_GUIDEDTOURS_TOUR_WELCOMETOJOOMLA_DESCRIPTION',12,'[\"com_cpanel\"]','administrator/index.php','2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL,1,'*','',1,1);
/*!40000 ALTER TABLE `amtf3_guidedtours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_history`
--

DROP TABLE IF EXISTS `amtf3_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(50) NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL,
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `character_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_history`
--

LOCK TABLES `amtf3_history` WRITE;
/*!40000 ALTER TABLE `amtf3_history` DISABLE KEYS */;
INSERT INTO `amtf3_history` VALUES
(6,'com_banners.banner.1','','2025-05-12 10:17:24',302,654,'ea59f355f225a3cfe4fd3de59fdc778910904b3d','{\"id\":1,\"cid\":\"0\",\"type\":\"1\",\"name\":\"Example\",\"alias\":\"example\",\"imptotal\":0,\"impmade\":\"0\",\"clicks\":\"0\",\"clickurl\":\"\",\"state\":\"1\",\"catid\":3,\"description\":\"\",\"custombannercode\":\"\",\"sticky\":\"0\",\"ordering\":1,\"metakey\":\"\",\"params\":\"{\\\"imageurl\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"height\\\":\\\"\\\",\\\"alt\\\":\\\"\\\"}\",\"own_prefix\":\"0\",\"metakey_prefix\":\"\",\"purchase_type\":\"-1\",\"track_clicks\":\"0\",\"track_impressions\":\"0\",\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":null,\"publish_down\":null,\"reset\":\"2025-06-12 00:00:00\",\"created\":\"2025-05-12 10:17:24\",\"language\":\"*\",\"created_by\":302,\"created_by_alias\":\"\",\"modified\":\"2025-05-12 10:17:24\",\"modified_by\":302,\"version\":1}',0),
(13,'com_content.article.3','','2025-05-12 10:27:14',302,2064,'f9014ff314822af044dd71efc595b5d107a92047','{\"id\":\"3\",\"asset_id\":108,\"title\":\"Example\",\"alias\":\"example\",\"introtext\":\"<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"images\\/Screenshot%20From%202025-05-12%2013-22-03.png\\\" width=\\\"684\\\" height=\\\"677\\\" loading=\\\"lazy\\\" data-path=\\\"local-images:\\/Screenshot From 2025-05-12 13-22-03.png\\\"><\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 10:27:14\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 10:26:58\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":6,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":8,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(14,'com_content.article.3','','2025-05-12 10:28:02',302,2149,'2b3e61da1d62339cda40e035f5526f604260c951','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"images\\/Screenshot%20From%202025-05-12%2013-22-03.png\\\" width=\\\"684\\\" height=\\\"677\\\" loading=\\\"lazy\\\" data-path=\\\"local-images:\\/Screenshot From 2025-05-12 13-22-03.png\\\"><\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 10:28:02\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 10:27:14\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":7,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":12,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(15,'com_content.article.3','','2025-05-12 10:29:40',302,2149,'caffb638f2516b80c1fabc3a3734b82b10ba75db','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"images\\/Screenshot%20From%202025-05-12%2013-22-03.png\\\" width=\\\"967\\\" height=\\\"957\\\" loading=\\\"lazy\\\" data-path=\\\"local-images:\\/Screenshot From 2025-05-12 13-22-03.png\\\"><\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 10:29:40\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 10:28:02\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":8,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":21,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(16,'com_content.article.3','','2025-05-12 10:32:48',302,2160,'4ac941819720ea832759c998b18e6f51cf085671','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<p><img style=\\\"display: block; margin-left: auto; margin-right: auto;\\\" src=\\\"images\\/Screenshot%20From%202025-05-12%2013-22-03.png\\\" width=\\\"967\\\" height=\\\"957\\\" loading=\\\"lazy\\\" data-path=\\\"local-images:\\/Screenshot From 2025-05-12 13-22-03.png\\\"><\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 10:32:48\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 10:29:40\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"_:default\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"0\\\",\\\"show_urls_images_frontend\\\":\\\"0\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":9,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":33,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(17,'com_content.article.3','','2025-05-12 10:34:07',302,5070,'5aafe5b85602f35f3a3e63769368916b13836b6d','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<p class=\\\"ds-markdown-paragraph\\\" style=\\\"text-align: center;\\\"><strong>\\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/strong><\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\"><strong>\\u041e\\u0442:<\\/strong> [\\u0424\\u0418\\u041e \\u0437\\u0430\\u044f\\u0432\\u0438\\u0442\\u0435\\u043b\\u044f]<br><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> [\\u0412\\u0430\\u0448 \\u0430\\u0434\\u0440\\u0435\\u0441]<br><strong>\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> [\\u0412\\u0430\\u0448 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d]<br><strong>E-mail:<\\/strong> [\\u0412\\u0430\\u0448 e-mail]<\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\" style=\\\"text-align: center;\\\"><strong>\\u0417\\u0410\\u042f\\u0412\\u041b\\u0415\\u041d\\u0418\\u0415<\\/strong><\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041f\\u0440\\u043e\\u0448\\u0443 \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441 [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0441\\u0443\\u0442\\u044c \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u043e \\u0432\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0438 \\u043c\\u043e\\u0435\\u0433\\u043e \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430, \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: ______, \\u0432 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0443 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438\\\"].<\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043f\\u0440\\u0438\\u043b\\u0430\\u0433\\u0430\\u044e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b:<\\/p>\\r\\n<ol start=\\\"1\\\">\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0430\\u0441\\u043f\\u043e\\u0440\\u0442\\u0430.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0440\\u0430\\u0432\\u043e\\u0443\\u0441\\u0442\\u0430\\u043d\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 \\u043d\\u0430 \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f (\\u043f\\u0440\\u0438 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0438).<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u0418\\u043d\\u044b\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b (\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043a\\u0430\\u043a\\u0438\\u0435).<\\/p>\\r\\n<\\/li>\\r\\n<\\/ol>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u0414\\u0430\\u0442\\u0430: _______________<br>\\u041f\\u043e\\u0434\\u043f\\u0438\\u0441\\u044c: _______________<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 10:34:07\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 10:32:48\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"_:default\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"0\\\",\\\"show_urls_images_frontend\\\":\\\"0\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":10,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":34,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(18,'com_content.article.3','','2025-05-12 14:08:25',302,4884,'a8a30f59f18ea81dcccd9f5a7b56c9456d0387db','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<p class=\\\"ds-markdown-paragraph\\\" style=\\\"text-align: center;\\\"><strong>\\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/strong><\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\"><strong>\\u041e\\u0442:<\\/strong> [\\u0424\\u0418\\u041e \\u0437\\u0430\\u044f\\u0432\\u0438\\u0442\\u0435\\u043b\\u044f]<br><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> [\\u0412\\u0430\\u0448 \\u0430\\u0434\\u0440\\u0435\\u0441]<\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\" style=\\\"text-align: center;\\\"><strong>\\u0417\\u0410\\u042f\\u0412\\u041b\\u0415\\u041d\\u0418\\u0415<\\/strong><\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041f\\u0440\\u043e\\u0448\\u0443 \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441 [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0441\\u0443\\u0442\\u044c \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u043e \\u0432\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0438 \\u043c\\u043e\\u0435\\u0433\\u043e \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430, \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: ______, \\u0432 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0443 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438\\\"].<\\/p>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043f\\u0440\\u0438\\u043b\\u0430\\u0433\\u0430\\u044e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b:<\\/p>\\r\\n<ol start=\\\"1\\\">\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0430\\u0441\\u043f\\u043e\\u0440\\u0442\\u0430.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0440\\u0430\\u0432\\u043e\\u0443\\u0441\\u0442\\u0430\\u043d\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 \\u043d\\u0430 \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u041f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f (\\u043f\\u0440\\u0438 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0438).<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u0418\\u043d\\u044b\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b (\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043a\\u0430\\u043a\\u0438\\u0435).<\\/p>\\r\\n<\\/li>\\r\\n<\\/ol>\\r\\n<p class=\\\"ds-markdown-paragraph\\\">\\u0414\\u0430\\u0442\\u0430: _______________<br>\\u041f\\u043e\\u0434\\u043f\\u0438\\u0441\\u044c: _______________<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:08:25\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 14:07:53\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"_:default\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"0\\\",\\\"show_urls_images_frontend\\\":\\\"0\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":11,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":53,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(19,'com_content.article.4','','2025-05-12 14:09:36',302,1873,'5c0f3a7bd7c3498eb284613f92945d54e6356d59','{\"id\":4,\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":302,\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:09:36\",\"modified_by\":302,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":1,\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(20,'com_content.article.4','','2025-05-12 14:11:43',302,1891,'bcb111fb726ad9ce3541b99ce1e4b9882bcc06e3','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:11:43\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 14:09:36\",\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":2,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":4,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(21,'com_content.article.4','','2025-05-12 14:12:25',302,1905,'b26b14b671c95126d8e7af1dcef0bb0fbb2d7d9b','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:12:25\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 14:11:43\",\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"1\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"0\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":-1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":3,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":6,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(22,'com_banners.banner.2','','2025-05-12 14:12:59',302,749,'9971e248ccfbe8f5f0f094e095dee2a1ba58bc68','{\"id\":2,\"cid\":\"0\",\"type\":\"0\",\"name\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"imptotal\":0,\"impmade\":\"0\",\"clicks\":\"0\",\"clickurl\":\"\",\"state\":\"1\",\"catid\":3,\"description\":\"\",\"custombannercode\":\"\",\"sticky\":\"0\",\"ordering\":2,\"metakey\":\"\",\"params\":\"{\\\"imageurl\\\":\\\"\\\",\\\"width\\\":\\\"\\\",\\\"height\\\":\\\"\\\",\\\"alt\\\":\\\"\\\"}\",\"own_prefix\":\"0\",\"metakey_prefix\":\"\",\"purchase_type\":\"-1\",\"track_clicks\":\"0\",\"track_impressions\":\"0\",\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":null,\"publish_down\":null,\"reset\":\"2025-06-12 00:00:00\",\"created\":\"2025-05-12 14:12:59\",\"language\":\"*\",\"created_by\":302,\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:12:59\",\"modified_by\":302,\"version\":1}',0),
(23,'com_content.article.4','','2025-05-12 14:39:13',302,11260,'963fbcf35da90a49e341af21f9761f47edecac6b','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<div class=\\\"ukh-header\\\">\\r\\n<h1>\\u041c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043a\\u0430\\u0437\\u0435\\u043d\\u043d\\u043e\\u0435 \\u0443\\u0447\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u0435 \\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\" \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/h1>\\r\\n<p>\\u041e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0438\\u0432\\u0430\\u0435\\u043c \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442 \\u0438 \\u043f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-content\\\">\\r\\n<div class=\\\"ukh-main-text\\\">\\r\\n<h2>\\u0414\\u043e\\u0431\\u0440\\u043e \\u043f\\u043e\\u0436\\u0430\\u043b\\u043e\\u0432\\u0430\\u0442\\u044c \\u043d\\u0430 \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430!<\\/h2>\\r\\n<p>\\u041d\\u0430\\u0448\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0442\\u0432\\u0435\\u0447\\u0430\\u0435\\u0442 \\u0437\\u0430 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430. \\u041c\\u044b \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0434\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u0447\\u0442\\u043e\\u0431\\u044b \\u043d\\u0430\\u0448 \\u0433\\u043e\\u0440\\u043e\\u0434 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u0441\\u044f \\u0447\\u0438\\u0441\\u0442\\u044b\\u043c, \\u0443\\u044e\\u0442\\u043d\\u044b\\u043c \\u0438 \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f.<\\/p>\\r\\n<p>\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f: \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439, \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f \\u0443\\u043b\\u0438\\u0446, \\u0432\\u044b\\u0432\\u043e\\u0437 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432 \\u0438 \\u043c\\u043d\\u043e\\u0433\\u043e\\u0435 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0435.<\\/p>\\r\\n<p>\\u041c\\u044b \\u0441\\u0442\\u0440\\u0435\\u043c\\u0438\\u043c\\u0441\\u044f \\u043a \\u0442\\u043e\\u043c\\u0443, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0432\\u0441\\u0435 \\u0436\\u0438\\u0442\\u0435\\u043b\\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u043c\\u043e\\u0433\\u043b\\u0438 \\u0433\\u043e\\u0440\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441\\u0432\\u043e\\u0438\\u043c \\u043c\\u0435\\u0441\\u0442\\u043e\\u043c \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f. \\u0414\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u043c\\u044b \\u0435\\u0436\\u0435\\u0434\\u043d\\u0435\\u0432\\u043d\\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u043d\\u0430\\u0434 \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c\\u044b\\u0445 \\u0443\\u0441\\u043b\\u0443\\u0433 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b.<\\/p>\\r\\n<p>\\u041d\\u0430 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0441\\u0430\\u0439\\u0442\\u0435 \\u0432\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u0443\\u0437\\u043d\\u0430\\u0442\\u044c \\u043e \\u0442\\u0435\\u043a\\u0443\\u0449\\u0438\\u0445 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0445, \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443 \\u043d\\u0430 \\u0443\\u0441\\u0442\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c, \\u043e\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441 \\u043d\\u043e\\u0440\\u043c\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u043c\\u0438 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0430\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0443\\u044e \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044e \\u043e \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-image\\\"><img src=\\\"images\\/ukh-labinsk.jpg\\\" alt=\\\"\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a - \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u043d\\u044b\\u0435 \\u0443\\u043b\\u0438\\u0446\\u044b\\\">\\r\\n<p><em>\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a - \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0443\\u044e\\u0442\\u043d\\u044b\\u0439<\\/em><\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-services\\\">\\r\\n<h2>\\u041d\\u0430\\u0448\\u0438 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043b\\u0443\\u0433\\u0438<\\/h2>\\r\\n<ul>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043a\\u0440\\u044b\\u0442\\u0438\\u044f<\\/li>\\r\\n<li>\\u0423\\u0431\\u043e\\u0440\\u043a\\u0430 \\u0438 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439<\\/li>\\r\\n<li>\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u0432\\u044b\\u0432\\u043e\\u0437\\u0430 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432<\\/li>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0443\\u043b\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f<\\/li>\\r\\n<li>\\u041e\\u0437\\u0435\\u043b\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u0438 \\u0443\\u0445\\u043e\\u0434 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u0441\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438<\\/li>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u043c\\u0430\\u043b\\u044b\\u0445 \\u0430\\u0440\\u0445\\u0438\\u0442\\u0435\\u043a\\u0442\\u0443\\u0440\\u043d\\u044b\\u0445 \\u0444\\u043e\\u0440\\u043c \\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u043c\\u0435\\u0431\\u0435\\u043b\\u0438<\\/li>\\r\\n<li>\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043c\\u0435\\u0440\\u043e\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0439 \\u043f\\u043e \\u0441\\u0430\\u043d\\u0438\\u0442\\u0430\\u0440\\u043d\\u043e\\u0439 \\u043e\\u0447\\u0438\\u0441\\u0442\\u043a\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430<\\/li>\\r\\n<li>\\u0412\\u0437\\u0430\\u0438\\u043c\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u044f\\u044e\\u0449\\u0438\\u043c\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u0422\\u0421\\u0416<\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-contact\\\">\\r\\n<h2>\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b<\\/h2>\\r\\n<p><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> \\u041a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0434\\u0430\\u0440\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0440\\u0430\\u0439, \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a, \\u0443\\u043b. \\u041b\\u0435\\u043d\\u0438\\u043d\\u0430, 123<\\/p>\\r\\n<p><strong>\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> +7 (86169) 2-34-56<\\/p>\\r\\n<p><strong>Email:<\\/strong> ukhlabinsk@mail.ru<\\/p>\\r\\n<p><strong>\\u0420\\u0435\\u0436\\u0438\\u043c \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b:<\\/strong> \\u041f\\u043d-\\u041f\\u0442: 8:00 - 17:00, \\u043f\\u0435\\u0440\\u0435\\u0440\\u044b\\u0432: 12:00 - 13:00<\\/p>\\r\\n<p>\\u041c\\u044b \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u043e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b \\u0434\\u043b\\u044f \\u0434\\u0438\\u0430\\u043b\\u043e\\u0433\\u0430 \\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u044e \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430.<\\/p>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:39:13\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 14:36:00\",\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"1\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"0\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":-1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":4,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":56,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(24,'com_content.article.4','','2025-05-12 14:53:42',302,11051,'9f82849ce1d84132bebe9fd04c1058372d8b701f','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<div class=\\\"ukh-header\\\">\\r\\n<h1>\\u041c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043a\\u0430\\u0437\\u0435\\u043d\\u043d\\u043e\\u0435 \\u0443\\u0447\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u0435 \\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\" \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/h1>\\r\\n<p>\\u041e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0438\\u0432\\u0430\\u0435\\u043c \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442 \\u0438 \\u043f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-content\\\">\\r\\n<div class=\\\"ukh-main-text\\\">\\r\\n<h2>\\u0414\\u043e\\u0431\\u0440\\u043e \\u043f\\u043e\\u0436\\u0430\\u043b\\u043e\\u0432\\u0430\\u0442\\u044c \\u043d\\u0430 \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430!<\\/h2>\\r\\n<p>\\u041d\\u0430\\u0448\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0442\\u0432\\u0435\\u0447\\u0430\\u0435\\u0442 \\u0437\\u0430 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430. \\u041c\\u044b \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0434\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u0447\\u0442\\u043e\\u0431\\u044b \\u043d\\u0430\\u0448 \\u0433\\u043e\\u0440\\u043e\\u0434 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u0441\\u044f \\u0447\\u0438\\u0441\\u0442\\u044b\\u043c, \\u0443\\u044e\\u0442\\u043d\\u044b\\u043c \\u0438 \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f.<\\/p>\\r\\n<p>\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f: \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439, \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f \\u0443\\u043b\\u0438\\u0446, \\u0432\\u044b\\u0432\\u043e\\u0437 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432 \\u0438 \\u043c\\u043d\\u043e\\u0433\\u043e\\u0435 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0435.<\\/p>\\r\\n<p>\\u041c\\u044b \\u0441\\u0442\\u0440\\u0435\\u043c\\u0438\\u043c\\u0441\\u044f \\u043a \\u0442\\u043e\\u043c\\u0443, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0432\\u0441\\u0435 \\u0436\\u0438\\u0442\\u0435\\u043b\\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u043c\\u043e\\u0433\\u043b\\u0438 \\u0433\\u043e\\u0440\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441\\u0432\\u043e\\u0438\\u043c \\u043c\\u0435\\u0441\\u0442\\u043e\\u043c \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f. \\u0414\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u043c\\u044b \\u0435\\u0436\\u0435\\u0434\\u043d\\u0435\\u0432\\u043d\\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u043d\\u0430\\u0434 \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c\\u044b\\u0445 \\u0443\\u0441\\u043b\\u0443\\u0433 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b.<\\/p>\\r\\n<p>\\u041d\\u0430 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0441\\u0430\\u0439\\u0442\\u0435 \\u0432\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u0443\\u0437\\u043d\\u0430\\u0442\\u044c \\u043e \\u0442\\u0435\\u043a\\u0443\\u0449\\u0438\\u0445 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0445, \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443 \\u043d\\u0430 \\u0443\\u0441\\u0442\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c, \\u043e\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441 \\u043d\\u043e\\u0440\\u043c\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u043c\\u0438 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0430\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0443\\u044e \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044e \\u043e \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-image\\\"><img src=\\\"images\\/images\\/ukh-labinsk.jpg alt=\\\">\\r\\n<p><em>\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a - \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0443\\u044e\\u0442\\u043d\\u044b\\u0439<\\/em><\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-services\\\">\\r\\n<h2>\\u041d\\u0430\\u0448\\u0438 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043b\\u0443\\u0433\\u0438<\\/h2>\\r\\n<ul>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043a\\u0440\\u044b\\u0442\\u0438\\u044f<\\/li>\\r\\n<li>\\u0423\\u0431\\u043e\\u0440\\u043a\\u0430 \\u0438 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439<\\/li>\\r\\n<li>\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u0432\\u044b\\u0432\\u043e\\u0437\\u0430 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432<\\/li>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0443\\u043b\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f<\\/li>\\r\\n<li>\\u041e\\u0437\\u0435\\u043b\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u0438 \\u0443\\u0445\\u043e\\u0434 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u0441\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438<\\/li>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u043c\\u0430\\u043b\\u044b\\u0445 \\u0430\\u0440\\u0445\\u0438\\u0442\\u0435\\u043a\\u0442\\u0443\\u0440\\u043d\\u044b\\u0445 \\u0444\\u043e\\u0440\\u043c \\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u043c\\u0435\\u0431\\u0435\\u043b\\u0438<\\/li>\\r\\n<li>\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043c\\u0435\\u0440\\u043e\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0439 \\u043f\\u043e \\u0441\\u0430\\u043d\\u0438\\u0442\\u0430\\u0440\\u043d\\u043e\\u0439 \\u043e\\u0447\\u0438\\u0441\\u0442\\u043a\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430<\\/li>\\r\\n<li>\\u0412\\u0437\\u0430\\u0438\\u043c\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u044f\\u044e\\u0449\\u0438\\u043c\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u0422\\u0421\\u0416<\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-contact\\\">\\r\\n<h2>\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b<\\/h2>\\r\\n<p><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> \\u041a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0434\\u0430\\u0440\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0440\\u0430\\u0439, \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a, \\u0443\\u043b. \\u041b\\u0435\\u043d\\u0438\\u043d\\u0430, 123<\\/p>\\r\\n<p><strong>\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> +7 (86169) 2-34-56<\\/p>\\r\\n<p><strong>Email:<\\/strong> ukhlabinsk@mail.ru<\\/p>\\r\\n<p><strong>\\u0420\\u0435\\u0436\\u0438\\u043c \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b:<\\/strong> \\u041f\\u043d-\\u041f\\u0442: 8:00 - 17:00, \\u043f\\u0435\\u0440\\u0435\\u0440\\u044b\\u0432: 12:00 - 13:00<\\/p>\\r\\n<p>\\u041c\\u044b \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u043e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b \\u0434\\u043b\\u044f \\u0434\\u0438\\u0430\\u043b\\u043e\\u0433\\u0430 \\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u044e \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430.<\\/p>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:53:42\",\"modified_by\":302,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"1\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"0\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":-1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":5,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":95,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(25,'com_content.article.4','','2025-05-12 14:54:46',302,11071,'69385f7ee7ae00992d15378551a7005f5b298ebd','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<div class=\\\"ukh-header\\\">\\r\\n<h1>\\u041c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043a\\u0430\\u0437\\u0435\\u043d\\u043d\\u043e\\u0435 \\u0443\\u0447\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u0435 \\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\" \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/h1>\\r\\n<p>\\u041e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0438\\u0432\\u0430\\u0435\\u043c \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442 \\u0438 \\u043f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-content\\\">\\r\\n<div class=\\\"ukh-main-text\\\">\\r\\n<h2>\\u0414\\u043e\\u0431\\u0440\\u043e \\u043f\\u043e\\u0436\\u0430\\u043b\\u043e\\u0432\\u0430\\u0442\\u044c \\u043d\\u0430 \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430!<\\/h2>\\r\\n<p>\\u041d\\u0430\\u0448\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0442\\u0432\\u0435\\u0447\\u0430\\u0435\\u0442 \\u0437\\u0430 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430. \\u041c\\u044b \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0434\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u0447\\u0442\\u043e\\u0431\\u044b \\u043d\\u0430\\u0448 \\u0433\\u043e\\u0440\\u043e\\u0434 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u0441\\u044f \\u0447\\u0438\\u0441\\u0442\\u044b\\u043c, \\u0443\\u044e\\u0442\\u043d\\u044b\\u043c \\u0438 \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f.<\\/p>\\r\\n<p>\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f: \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439, \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f \\u0443\\u043b\\u0438\\u0446, \\u0432\\u044b\\u0432\\u043e\\u0437 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432 \\u0438 \\u043c\\u043d\\u043e\\u0433\\u043e\\u0435 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0435.<\\/p>\\r\\n<p>\\u041c\\u044b \\u0441\\u0442\\u0440\\u0435\\u043c\\u0438\\u043c\\u0441\\u044f \\u043a \\u0442\\u043e\\u043c\\u0443, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0432\\u0441\\u0435 \\u0436\\u0438\\u0442\\u0435\\u043b\\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u043c\\u043e\\u0433\\u043b\\u0438 \\u0433\\u043e\\u0440\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441\\u0432\\u043e\\u0438\\u043c \\u043c\\u0435\\u0441\\u0442\\u043e\\u043c \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f. \\u0414\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u043c\\u044b \\u0435\\u0436\\u0435\\u0434\\u043d\\u0435\\u0432\\u043d\\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u043d\\u0430\\u0434 \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c\\u044b\\u0445 \\u0443\\u0441\\u043b\\u0443\\u0433 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b.<\\/p>\\r\\n<p>\\u041d\\u0430 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0441\\u0430\\u0439\\u0442\\u0435 \\u0432\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u0443\\u0437\\u043d\\u0430\\u0442\\u044c \\u043e \\u0442\\u0435\\u043a\\u0443\\u0449\\u0438\\u0445 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0445, \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443 \\u043d\\u0430 \\u0443\\u0441\\u0442\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c, \\u043e\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441 \\u043d\\u043e\\u0440\\u043c\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u043c\\u0438 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0430\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0443\\u044e \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044e \\u043e \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-image\\\"><img src=\\\"images\\/images\\/ukh-labinsk.jpg\\\" alt=\\\"\\\">\\r\\n<p><em>\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a - \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0443\\u044e\\u0442\\u043d\\u044b\\u0439<\\/em><\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-services\\\">\\r\\n<h2>\\u041d\\u0430\\u0448\\u0438 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043b\\u0443\\u0433\\u0438<\\/h2>\\r\\n<ul>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043a\\u0440\\u044b\\u0442\\u0438\\u044f<\\/li>\\r\\n<li>\\u0423\\u0431\\u043e\\u0440\\u043a\\u0430 \\u0438 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439<\\/li>\\r\\n<li>\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u0432\\u044b\\u0432\\u043e\\u0437\\u0430 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432<\\/li>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0443\\u043b\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f<\\/li>\\r\\n<li>\\u041e\\u0437\\u0435\\u043b\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u0438 \\u0443\\u0445\\u043e\\u0434 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u0441\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438<\\/li>\\r\\n<li>\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u043c\\u0430\\u043b\\u044b\\u0445 \\u0430\\u0440\\u0445\\u0438\\u0442\\u0435\\u043a\\u0442\\u0443\\u0440\\u043d\\u044b\\u0445 \\u0444\\u043e\\u0440\\u043c \\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u043c\\u0435\\u0431\\u0435\\u043b\\u0438<\\/li>\\r\\n<li>\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043c\\u0435\\u0440\\u043e\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0439 \\u043f\\u043e \\u0441\\u0430\\u043d\\u0438\\u0442\\u0430\\u0440\\u043d\\u043e\\u0439 \\u043e\\u0447\\u0438\\u0441\\u0442\\u043a\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430<\\/li>\\r\\n<li>\\u0412\\u0437\\u0430\\u0438\\u043c\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u044f\\u044e\\u0449\\u0438\\u043c\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u0422\\u0421\\u0416<\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-contact\\\">\\r\\n<h2>\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b<\\/h2>\\r\\n<p><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> \\u041a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0434\\u0430\\u0440\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0440\\u0430\\u0439, \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a, \\u0443\\u043b. \\u041b\\u0435\\u043d\\u0438\\u043d\\u0430, 123<\\/p>\\r\\n<p><strong>\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> +7 (86169) 2-34-56<\\/p>\\r\\n<p><strong>Email:<\\/strong> ukhlabinsk@mail.ru<\\/p>\\r\\n<p><strong>\\u0420\\u0435\\u0436\\u0438\\u043c \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b:<\\/strong> \\u041f\\u043d-\\u041f\\u0442: 8:00 - 17:00, \\u043f\\u0435\\u0440\\u0435\\u0440\\u044b\\u0432: 12:00 - 13:00<\\/p>\\r\\n<p>\\u041c\\u044b \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u043e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b \\u0434\\u043b\\u044f \\u0434\\u0438\\u0430\\u043b\\u043e\\u0433\\u0430 \\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u044e \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430.<\\/p>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:54:46\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 14:53:42\",\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"1\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"0\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":-1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":6,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":96,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(26,'com_content.article.3','','2025-05-12 14:58:08',302,9413,'6d35ae2f0b23093d4bff8779671915f768d3ff2b','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<div class=\\\"application-form\\\">\\r\\n<div class=\\\"form-content\\\">\\r\\n<div class=\\\"form-header\\\">\\r\\n<h2>\\u041c\\u0423\\u041d\\u0418\\u0426\\u0418\\u041f\\u0410\\u041b\\u042c\\u041d\\u041e\\u0415 \\u041a\\u0410\\u0417\\u0415\\u041d\\u041d\\u041e\\u0415 \\u0423\\u0427\\u0420\\u0415\\u0416\\u0414\\u0415\\u041d\\u0418\\u0415<\\/h2>\\r\\n<p>\\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\"<\\/p>\\r\\n<p>\\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"applicant-info\\\">\\r\\n<p><strong>\\u041e\\u0442:<\\/strong> [\\u0424\\u0418\\u041e \\u0437\\u0430\\u044f\\u0432\\u0438\\u0442\\u0435\\u043b\\u044f \\u043f\\u043e\\u043b\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e]<\\/p>\\r\\n<p><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> [\\u0412\\u0430\\u0448 \\u043f\\u043e\\u043b\\u043d\\u044b\\u0439 \\u0430\\u0434\\u0440\\u0435\\u0441 \\u0441 \\u0438\\u043d\\u0434\\u0435\\u043a\\u0441\\u043e\\u043c]<\\/p>\\r\\n<p><strong>\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> [\\u0412\\u0430\\u0448 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d]<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"application-title\\\">\\u0417\\u0410\\u042f\\u0412\\u041b\\u0415\\u041d\\u0418\\u0415<\\/div>\\r\\n<div class=\\\"application-text\\\">\\r\\n<p>\\u041f\\u0440\\u043e\\u0448\\u0443 \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441 [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0441\\u0443\\u0442\\u044c \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u043e \\u0432\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0438 \\u043c\\u043e\\u0435\\u0433\\u043e \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430, \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: ______, \\u0432 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0443 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 \\u043d\\u0430 2024 \\u0433\\u043e\\u0434\\\"].<\\/p>\\r\\n<p>\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043f\\u0440\\u0438\\u0434\\u043e\\u043c\\u043e\\u0432\\u043e\\u0439 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0435\\u0439 \\u043c\\u043d\\u043e\\u0433\\u043e\\u043a\\u0432\\u0430\\u0440\\u0442\\u0438\\u0440\\u043d\\u043e\\u0433\\u043e \\u0434\\u043e\\u043c\\u0430 \\u0438 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u043d\\u043e \\u043c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0435\\\"].<\\/p>\\r\\n<\\/div>\\r\\n<p><strong>\\u041f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043f\\u0440\\u0438\\u043b\\u0430\\u0433\\u0430\\u044e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b:<\\/strong><\\/p>\\r\\n<ol class=\\\"documents-list\\\">\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0430\\u0441\\u043f\\u043e\\u0440\\u0442\\u0430 (\\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b \\u0441 \\u0444\\u043e\\u0442\\u043e \\u0438 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0435\\u0439);<\\/li>\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0440\\u0430\\u0432\\u043e\\u0443\\u0441\\u0442\\u0430\\u043d\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 \\u043d\\u0430 \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a;<\\/li>\\r\\n<li>\\u041f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f (\\u043f\\u0440\\u0438 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0438);<\\/li>\\r\\n<li>\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u0438 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430 (\\u043f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438);<\\/li>\\r\\n<li>\\u0418\\u043d\\u044b\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043a\\u0430\\u043a\\u0438\\u0435].<\\/li>\\r\\n<\\/ol>\\r\\n<div class=\\\"form-footer\\\">\\r\\n<div class=\\\"date-field\\\">\\u0414\\u0430\\u0442\\u0430: _______________<\\/div>\\r\\n<div class=\\\"stamp-place\\\">\\u041c\\u0415\\u0421\\u0422\\u041e \\u0414\\u041b\\u042f \\u041f\\u0415\\u0427\\u0410\\u0422\\u0418<\\/div>\\r\\n<div class=\\\"signature-field\\\">\\u041f\\u043e\\u0434\\u043f\\u0438\\u0441\\u044c: _______________<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div style=\\\"max-width: 800px; margin: 20px auto; padding: 15px; background-color: #f0f7ff; border-left: 4px solid #005baa;\\\">\\r\\n<h3 style=\\\"margin-top: 0; color: #005baa;\\\">\\u041a\\u0430\\u043a \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435:<\\/h3>\\r\\n<ol>\\r\\n<li>\\u0417\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u0432\\u0441\\u0435 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0435 \\u043f\\u043e\\u043b\\u044f \\u0432 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0438<\\/li>\\r\\n<li>\\u0420\\u0430\\u0441\\u043f\\u0435\\u0447\\u0430\\u0442\\u0430\\u0439\\u0442\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442 (\\u0438\\u043b\\u0438 \\u0437\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u043e\\u0442 \\u0440\\u0443\\u043a\\u0438)<\\/li>\\r\\n<li>\\u041f\\u0440\\u0438\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435 \\u043a\\u043e\\u043f\\u0438\\u0438 \\u0443\\u043a\\u0430\\u0437\\u0430\\u043d\\u043d\\u044b\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432<\\/li>\\r\\n<li>\\u041f\\u043e\\u0434\\u0430\\u0439\\u0442\\u0435 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0434\\u043d\\u0438\\u043c \\u0438\\u0437 \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u043e\\u0432:\\r\\n<ul>\\r\\n<li>\\u041b\\u0438\\u0447\\u043d\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: [\\u0430\\u0434\\u0440\\u0435\\u0441 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425]<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u041c\\u0424\\u0426<\\/li>\\r\\n<li>\\u041f\\u043e \\u043f\\u043e\\u0447\\u0442\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u043d\\u044b\\u043c \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\\u043c<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u043f\\u043e\\u0440\\u0442\\u0430\\u043b \\u0413\\u043e\\u0441\\u0443\\u0441\\u043b\\u0443\\u0433 (\\u0435\\u0441\\u043b\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u043e)<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ol>\\r\\n<p style=\\\"font-style: italic; color: #666;\\\">\\u0412\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435! \\u0417\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u0440\\u0430\\u0441\\u0441\\u043c\\u0430\\u0442\\u0440\\u0438\\u0432\\u0430\\u044e\\u0442\\u0441\\u044f \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 30 \\u043a\\u0430\\u043b\\u0435\\u043d\\u0434\\u0430\\u0440\\u043d\\u044b\\u0445 \\u0434\\u043d\\u0435\\u0439 \\u0441 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u0430 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438.<\\/p>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 14:58:08\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 14:57:58\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"_:default\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"0\\\",\\\"show_urls_images_frontend\\\":\\\"0\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":12,\"ordering\":1,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":78,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(27,'com_content.article.3','','2025-05-12 15:01:53',302,9433,'ae523701e2d2a4e1ba32cf634889e4d6052ee64d','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<div class=\\\"application-form\\\">\\r\\n<div class=\\\"form-content\\\">\\r\\n<div class=\\\"form-header\\\">\\r\\n<h2>\\u041c\\u0423\\u041d\\u0418\\u0426\\u0418\\u041f\\u0410\\u041b\\u042c\\u041d\\u041e\\u0415 \\u041a\\u0410\\u0417\\u0415\\u041d\\u041d\\u041e\\u0415 \\u0423\\u0427\\u0420\\u0415\\u0416\\u0414\\u0415\\u041d\\u0418\\u0415<\\/h2>\\r\\n<p>\\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\"<\\/p>\\r\\n<p>\\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"applicant-info\\\">\\r\\n<p><strong>\\u041e\\u0442:<\\/strong> [\\u0424\\u0418\\u041e \\u0437\\u0430\\u044f\\u0432\\u0438\\u0442\\u0435\\u043b\\u044f \\u043f\\u043e\\u043b\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e]<\\/p>\\r\\n<p><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> [\\u0412\\u0430\\u0448 \\u043f\\u043e\\u043b\\u043d\\u044b\\u0439 \\u0430\\u0434\\u0440\\u0435\\u0441 \\u0441 \\u0438\\u043d\\u0434\\u0435\\u043a\\u0441\\u043e\\u043c]<\\/p>\\r\\n<p><strong>\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> [\\u0412\\u0430\\u0448 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d]<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"application-title\\\">\\u0417\\u0410\\u042f\\u0412\\u041b\\u0415\\u041d\\u0418\\u0415<\\/div>\\r\\n<div class=\\\"application-text\\\">\\r\\n<p>\\u041f\\u0440\\u043e\\u0448\\u0443 \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441 [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0441\\u0443\\u0442\\u044c \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u043e \\u0432\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0438 \\u043c\\u043e\\u0435\\u0433\\u043e \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430, \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: ______, \\u0432 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0443 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 \\u043d\\u0430 2024 \\u0433\\u043e\\u0434\\\"].<\\/p>\\r\\n<p>\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043f\\u0440\\u0438\\u0434\\u043e\\u043c\\u043e\\u0432\\u043e\\u0439 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0435\\u0439 \\u043c\\u043d\\u043e\\u0433\\u043e\\u043a\\u0432\\u0430\\u0440\\u0442\\u0438\\u0440\\u043d\\u043e\\u0433\\u043e \\u0434\\u043e\\u043c\\u0430 \\u0438 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u043d\\u043e \\u043c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0435\\\"].<\\/p>\\r\\n<\\/div>\\r\\n<p><strong>\\u041f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043f\\u0440\\u0438\\u043b\\u0430\\u0433\\u0430\\u044e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b:<\\/strong><\\/p>\\r\\n<ol class=\\\"documents-list\\\">\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0430\\u0441\\u043f\\u043e\\u0440\\u0442\\u0430 (\\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b \\u0441 \\u0444\\u043e\\u0442\\u043e \\u0438 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0435\\u0439);<\\/li>\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0440\\u0430\\u0432\\u043e\\u0443\\u0441\\u0442\\u0430\\u043d\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 \\u043d\\u0430 \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a;<\\/li>\\r\\n<li>\\u041f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f (\\u043f\\u0440\\u0438 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0438);<\\/li>\\r\\n<li>\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u0438 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430 (\\u043f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438);<\\/li>\\r\\n<li>\\u0418\\u043d\\u044b\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043a\\u0430\\u043a\\u0438\\u0435].<\\/li>\\r\\n<\\/ol>\\r\\n<div class=\\\"form-footer\\\">\\r\\n<div class=\\\"date-field\\\">\\u0414\\u0430\\u0442\\u0430: _______________<\\/div>\\r\\n<div class=\\\"stamp-place\\\">\\u041c\\u0415\\u0421\\u0422\\u041e \\u0414\\u041b\\u042f \\u041f\\u0415\\u0427\\u0410\\u0422\\u0418<\\/div>\\r\\n<div class=\\\"signature-field\\\">\\u041f\\u043e\\u0434\\u043f\\u0438\\u0441\\u044c: _______________<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div style=\\\"max-width: 800px; margin: 20px auto; padding: 15px; background-color: rgba(238, 68, 18, 0.1); ; border-left: 4px solid #EE4412;\\\">\\r\\n<h3 style=\\\"margin-top: 0; color: #ee4412;\\\">\\u041a\\u0430\\u043a \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435:<\\/h3>\\r\\n<ol>\\r\\n<li>\\u0417\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u0432\\u0441\\u0435 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0435 \\u043f\\u043e\\u043b\\u044f \\u0432 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0438<\\/li>\\r\\n<li>\\u0420\\u0430\\u0441\\u043f\\u0435\\u0447\\u0430\\u0442\\u0430\\u0439\\u0442\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442 (\\u0438\\u043b\\u0438 \\u0437\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u043e\\u0442 \\u0440\\u0443\\u043a\\u0438)<\\/li>\\r\\n<li>\\u041f\\u0440\\u0438\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435 \\u043a\\u043e\\u043f\\u0438\\u0438 \\u0443\\u043a\\u0430\\u0437\\u0430\\u043d\\u043d\\u044b\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432<\\/li>\\r\\n<li>\\u041f\\u043e\\u0434\\u0430\\u0439\\u0442\\u0435 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0434\\u043d\\u0438\\u043c \\u0438\\u0437 \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u043e\\u0432:\\r\\n<ul>\\r\\n<li>\\u041b\\u0438\\u0447\\u043d\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: [\\u0430\\u0434\\u0440\\u0435\\u0441 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425]<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u041c\\u0424\\u0426<\\/li>\\r\\n<li>\\u041f\\u043e \\u043f\\u043e\\u0447\\u0442\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u043d\\u044b\\u043c \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\\u043c<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u043f\\u043e\\u0440\\u0442\\u0430\\u043b \\u0413\\u043e\\u0441\\u0443\\u0441\\u043b\\u0443\\u0433 (\\u0435\\u0441\\u043b\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u043e)<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ol>\\r\\n<p style=\\\"font-style: italic; color: #ee4412;\\\">\\u0412\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435! \\u0417\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u0440\\u0430\\u0441\\u0441\\u043c\\u0430\\u0442\\u0440\\u0438\\u0432\\u0430\\u044e\\u0442\\u0441\\u044f \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 30 \\u043a\\u0430\\u043b\\u0435\\u043d\\u0434\\u0430\\u0440\\u043d\\u044b\\u0445 \\u0434\\u043d\\u0435\\u0439 \\u0441 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u0430 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438.<\\/p>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-12 15:01:53\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-12 14:58:08\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"_:default\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"0\\\",\\\"show_urls_images_frontend\\\":\\\"0\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":13,\"ordering\":1,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":85,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(28,'com_content.article.3','','2025-05-13 11:27:11',302,9647,'967044470718df9853185eccc97035877ce17727','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<div class=\\\"application-form\\\">\\r\\n<div class=\\\"form-content\\\">\\r\\n<div class=\\\"form-header\\\">\\r\\n<h2>\\u041c\\u0423\\u041d\\u0418\\u0426\\u0418\\u041f\\u0410\\u041b\\u042c\\u041d\\u041e\\u0415 \\u041a\\u0410\\u0417\\u0415\\u041d\\u041d\\u041e\\u0415 \\u0423\\u0427\\u0420\\u0415\\u0416\\u0414\\u0415\\u041d\\u0418\\u0415<\\/h2>\\r\\n<p>\\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\"<\\/p>\\r\\n<p>\\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"applicant-info\\\">\\r\\n<p><strong>\\u041e\\u0442:<\\/strong> [\\u0424\\u0418\\u041e \\u0437\\u0430\\u044f\\u0432\\u0438\\u0442\\u0435\\u043b\\u044f \\u043f\\u043e\\u043b\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e]<\\/p>\\r\\n<p><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> [\\u0412\\u0430\\u0448 \\u043f\\u043e\\u043b\\u043d\\u044b\\u0439 \\u0430\\u0434\\u0440\\u0435\\u0441 \\u0441 \\u0438\\u043d\\u0434\\u0435\\u043a\\u0441\\u043e\\u043c]<\\/p>\\r\\n<p><strong>\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> [\\u0412\\u0430\\u0448 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d]<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"application-title\\\">\\u0417\\u0410\\u042f\\u0412\\u041b\\u0415\\u041d\\u0418\\u0415<\\/div>\\r\\n<div class=\\\"application-text\\\">\\r\\n<p>\\u041f\\u0440\\u043e\\u0448\\u0443 \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441 [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0441\\u0443\\u0442\\u044c \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u043e \\u0432\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0438 \\u043c\\u043e\\u0435\\u0433\\u043e \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430, \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: ______, \\u0432 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0443 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 \\u043d\\u0430 2024 \\u0433\\u043e\\u0434\\\"].<\\/p>\\r\\n<p>\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043f\\u0440\\u0438\\u0434\\u043e\\u043c\\u043e\\u0432\\u043e\\u0439 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0435\\u0439 \\u043c\\u043d\\u043e\\u0433\\u043e\\u043a\\u0432\\u0430\\u0440\\u0442\\u0438\\u0440\\u043d\\u043e\\u0433\\u043e \\u0434\\u043e\\u043c\\u0430 \\u0438 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u043d\\u043e \\u043c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0435\\\"].<\\/p>\\r\\n<\\/div>\\r\\n<p><strong>\\u041f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043f\\u0440\\u0438\\u043b\\u0430\\u0433\\u0430\\u044e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b:<\\/strong><\\/p>\\r\\n<ol class=\\\"documents-list\\\">\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0430\\u0441\\u043f\\u043e\\u0440\\u0442\\u0430 (\\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b \\u0441 \\u0444\\u043e\\u0442\\u043e \\u0438 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0435\\u0439);<\\/li>\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0440\\u0430\\u0432\\u043e\\u0443\\u0441\\u0442\\u0430\\u043d\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 \\u043d\\u0430 \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a;<\\/li>\\r\\n<li>\\u041f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f (\\u043f\\u0440\\u0438 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0438);<\\/li>\\r\\n<li>\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u0438 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430 (\\u043f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438);<\\/li>\\r\\n<li>\\u0418\\u043d\\u044b\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043a\\u0430\\u043a\\u0438\\u0435].<\\/li>\\r\\n<\\/ol>\\r\\n<div class=\\\"form-footer\\\">\\r\\n<div class=\\\"date-field\\\">\\u0414\\u0430\\u0442\\u0430: _______________<\\/div>\\r\\n<div class=\\\"stamp-place\\\">\\u041c\\u0415\\u0421\\u0422\\u041e \\u0414\\u041b\\u042f \\u041f\\u0415\\u0427\\u0410\\u0422\\u0418<\\/div>\\r\\n<div class=\\\"signature-field\\\">\\u041f\\u043e\\u0434\\u043f\\u0438\\u0441\\u044c: _______________<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div style=\\\"max-width: 800px; margin: 20px auto; padding: 15px; background-color: rgba(238, 68, 18, 0.1); ; border-left: 4px solid #EE4412;\\\">\\r\\n<h3 style=\\\"margin-top: 0; color: #ee4412;\\\">\\u041a\\u0430\\u043a \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435:<\\/h3>\\r\\n<ol>\\r\\n<li>\\u0417\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u0432\\u0441\\u0435 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0435 \\u043f\\u043e\\u043b\\u044f \\u0432 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0438<\\/li>\\r\\n<li>\\u0420\\u0430\\u0441\\u043f\\u0435\\u0447\\u0430\\u0442\\u0430\\u0439\\u0442\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442 (\\u0438\\u043b\\u0438 \\u0437\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u043e\\u0442 \\u0440\\u0443\\u043a\\u0438)<\\/li>\\r\\n<li>\\u041f\\u0440\\u0438\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435 \\u043a\\u043e\\u043f\\u0438\\u0438 \\u0443\\u043a\\u0430\\u0437\\u0430\\u043d\\u043d\\u044b\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432<\\/li>\\r\\n<li>\\u041f\\u043e\\u0434\\u0430\\u0439\\u0442\\u0435 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0434\\u043d\\u0438\\u043c \\u0438\\u0437 \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u043e\\u0432:\\r\\n<ul>\\r\\n<li>\\u041b\\u0438\\u0447\\u043d\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: [\\u0430\\u0434\\u0440\\u0435\\u0441 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425]<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u041c\\u0424\\u0426<\\/li>\\r\\n<li>\\u041f\\u043e \\u043f\\u043e\\u0447\\u0442\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u043d\\u044b\\u043c \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\\u043c<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u043f\\u043e\\u0440\\u0442\\u0430\\u043b \\u0413\\u043e\\u0441\\u0443\\u0441\\u043b\\u0443\\u0433 (\\u0435\\u0441\\u043b\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u043e)<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ol>\\r\\n<p style=\\\"font-style: italic; color: #ee4412;\\\">\\u0412\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435! \\u0417\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u0440\\u0430\\u0441\\u0441\\u043c\\u0430\\u0442\\u0440\\u0438\\u0432\\u0430\\u044e\\u0442\\u0441\\u044f \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 30 \\u043a\\u0430\\u043b\\u0435\\u043d\\u0434\\u0430\\u0440\\u043d\\u044b\\u0445 \\u0434\\u043d\\u0435\\u0439 \\u0441 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u0430 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438.<\\/p>\\r\\n<p style=\\\"font-style: italic; color: #ee4412;\\\"><a href=\\\"images\\/MUNICIPALNOE%20KAZENNOE%20UCREZDENIE.pdf\\\" download=\\\"\\\">\\u0421\\u043a\\u0430\\u0447\\u0430\\u0442\\u044c MUNICIPALNOE KAZENNOE UCREZDENIE<\\/a><\\/p>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-13 11:27:11\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-13 11:26:45\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"_:default\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"0\\\",\\\"show_urls_images_frontend\\\":\\\"0\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":14,\"ordering\":1,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":126,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(29,'com_content.article.3','','2025-05-13 11:27:41',302,10515,'cd581d322116cfa6a24a0947895d695618a295ac','{\"id\":\"3\",\"asset_id\":108,\"title\":\"\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\",\"alias\":\"example\",\"introtext\":\"<div class=\\\"application-form\\\">\\r\\n<div class=\\\"form-content\\\">\\r\\n<div class=\\\"form-header\\\">\\r\\n<h2>\\u041c\\u0423\\u041d\\u0418\\u0426\\u0418\\u041f\\u0410\\u041b\\u042c\\u041d\\u041e\\u0415 \\u041a\\u0410\\u0417\\u0415\\u041d\\u041d\\u041e\\u0415 \\u0423\\u0427\\u0420\\u0415\\u0416\\u0414\\u0415\\u041d\\u0418\\u0415<\\/h2>\\r\\n<p>\\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\"<\\/p>\\r\\n<p>\\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"applicant-info\\\">\\r\\n<p><strong>\\u041e\\u0442:<\\/strong> [\\u0424\\u0418\\u041e \\u0437\\u0430\\u044f\\u0432\\u0438\\u0442\\u0435\\u043b\\u044f \\u043f\\u043e\\u043b\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e]<\\/p>\\r\\n<p><strong>\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> [\\u0412\\u0430\\u0448 \\u043f\\u043e\\u043b\\u043d\\u044b\\u0439 \\u0430\\u0434\\u0440\\u0435\\u0441 \\u0441 \\u0438\\u043d\\u0434\\u0435\\u043a\\u0441\\u043e\\u043c]<\\/p>\\r\\n<p><strong>\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> [\\u0412\\u0430\\u0448 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d]<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"application-title\\\">\\u0417\\u0410\\u042f\\u0412\\u041b\\u0415\\u041d\\u0418\\u0415<\\/div>\\r\\n<div class=\\\"application-text\\\">\\r\\n<p>\\u041f\\u0440\\u043e\\u0448\\u0443 \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u043e\\u043f\\u0440\\u043e\\u0441 [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u0441\\u0443\\u0442\\u044c \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u043e \\u0432\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0438 \\u043c\\u043e\\u0435\\u0433\\u043e \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430, \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: ______, \\u0432 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0443 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 \\u043d\\u0430 2024 \\u0433\\u043e\\u0434\\\"].<\\/p>\\r\\n<p>\\u041e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u044f, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043c\\u0435\\u0440: \\\"\\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043f\\u0440\\u0438\\u0434\\u043e\\u043c\\u043e\\u0432\\u043e\\u0439 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0435\\u0439 \\u043c\\u043d\\u043e\\u0433\\u043e\\u043a\\u0432\\u0430\\u0440\\u0442\\u0438\\u0440\\u043d\\u043e\\u0433\\u043e \\u0434\\u043e\\u043c\\u0430 \\u0438 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u043d\\u043e \\u043c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u0435\\\"].<\\/p>\\r\\n<\\/div>\\r\\n<p><strong>\\u041f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438 \\u043f\\u0440\\u0438\\u043b\\u0430\\u0433\\u0430\\u044e \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b:<\\/strong><\\/p>\\r\\n<ol class=\\\"documents-list\\\">\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0430\\u0441\\u043f\\u043e\\u0440\\u0442\\u0430 (\\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u044b \\u0441 \\u0444\\u043e\\u0442\\u043e \\u0438 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0435\\u0439);<\\/li>\\r\\n<li>\\u041a\\u043e\\u043f\\u0438\\u044f \\u043f\\u0440\\u0430\\u0432\\u043e\\u0443\\u0441\\u0442\\u0430\\u043d\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u044e\\u0449\\u0438\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432 \\u043d\\u0430 \\u0437\\u0435\\u043c\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043e\\u043a;<\\/li>\\r\\n<li>\\u041f\\u0440\\u043e\\u0435\\u043a\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f (\\u043f\\u0440\\u0438 \\u043d\\u0430\\u043b\\u0438\\u0447\\u0438\\u0438);<\\/li>\\r\\n<li>\\u0424\\u043e\\u0442\\u043e\\u0433\\u0440\\u0430\\u0444\\u0438\\u0438 \\u0443\\u0447\\u0430\\u0441\\u0442\\u043a\\u0430 (\\u043f\\u0440\\u0438 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438);<\\/li>\\r\\n<li>\\u0418\\u043d\\u044b\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u044b: [\\u0443\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c \\u043a\\u0430\\u043a\\u0438\\u0435].<\\/li>\\r\\n<\\/ol>\\r\\n<div class=\\\"form-footer\\\">\\r\\n<div class=\\\"date-field\\\">\\u0414\\u0430\\u0442\\u0430: _______________<\\/div>\\r\\n<div class=\\\"stamp-place\\\">\\u041c\\u0415\\u0421\\u0422\\u041e \\u0414\\u041b\\u042f \\u041f\\u0415\\u0427\\u0410\\u0422\\u0418<\\/div>\\r\\n<div class=\\\"signature-field\\\">\\u041f\\u043e\\u0434\\u043f\\u0438\\u0441\\u044c: _______________<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div style=\\\"max-width: 800px; margin: 20px auto; padding: 15px; background-color: rgba(238, 68, 18, 0.1); ; border-left: 4px solid #EE4412;\\\">\\r\\n<h3 style=\\\"margin-top: 0; color: #ee4412;\\\">\\u041a\\u0430\\u043a \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435:<\\/h3>\\r\\n<ol>\\r\\n<li>\\u0417\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u0432\\u0441\\u0435 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0435 \\u043f\\u043e\\u043b\\u044f \\u0432 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0438<\\/li>\\r\\n<li>\\u0420\\u0430\\u0441\\u043f\\u0435\\u0447\\u0430\\u0442\\u0430\\u0439\\u0442\\u0435 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442 (\\u0438\\u043b\\u0438 \\u0437\\u0430\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435 \\u043e\\u0442 \\u0440\\u0443\\u043a\\u0438)<\\/li>\\r\\n<li>\\u041f\\u0440\\u0438\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435 \\u043a\\u043e\\u043f\\u0438\\u0438 \\u0443\\u043a\\u0430\\u0437\\u0430\\u043d\\u043d\\u044b\\u0445 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u043e\\u0432<\\/li>\\r\\n<li>\\u041f\\u043e\\u0434\\u0430\\u0439\\u0442\\u0435 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043e\\u0434\\u043d\\u0438\\u043c \\u0438\\u0437 \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u043e\\u0432:\\r\\n<ul>\\r\\n<li>\\u041b\\u0438\\u0447\\u043d\\u043e \\u043f\\u043e \\u0430\\u0434\\u0440\\u0435\\u0441\\u0443: [\\u0430\\u0434\\u0440\\u0435\\u0441 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425]<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u041c\\u0424\\u0426<\\/li>\\r\\n<li>\\u041f\\u043e \\u043f\\u043e\\u0447\\u0442\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u043d\\u044b\\u043c \\u043f\\u0438\\u0441\\u044c\\u043c\\u043e\\u043c<\\/li>\\r\\n<li>\\u0427\\u0435\\u0440\\u0435\\u0437 \\u043f\\u043e\\u0440\\u0442\\u0430\\u043b \\u0413\\u043e\\u0441\\u0443\\u0441\\u043b\\u0443\\u0433 (\\u0435\\u0441\\u043b\\u0438 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u043e)<\\/li>\\r\\n<\\/ul>\\r\\n<\\/li>\\r\\n<\\/ol>\\r\\n<p style=\\\"font-style: italic; color: #ee4412;\\\">\\u0412\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435! \\u0417\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u0440\\u0430\\u0441\\u0441\\u043c\\u0430\\u0442\\u0440\\u0438\\u0432\\u0430\\u044e\\u0442\\u0441\\u044f \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 30 \\u043a\\u0430\\u043b\\u0435\\u043d\\u0434\\u0430\\u0440\\u043d\\u044b\\u0445 \\u0434\\u043d\\u0435\\u0439 \\u0441 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u0430 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438.<\\/p>\\r\\n<p style=\\\"font-style: italic; color: #ee4412;\\\"><span style=\\\"text-decoration: underline;\\\"><a href=\\\"images\\/MUNICIPALNOE%20KAZENNOE%20UCREZDENIE.pdf\\\" download=\\\"\\\">\\u0421\\u043a\\u0430\\u0447\\u0430\\u0442\\u044c MUNICIPALNOE KAZENNOE UCREZDENIE<\\/a><\\/span><\\/p>\\r\\n<\\/div>\\r\\n<div id=\\\"simple-translate\\\" class=\\\"simple-translate-system-theme\\\">\\r\\n<div>\\r\\n<div class=\\\"simple-translate-button isShow\\\" style=\\\"background-image: url(\'moz-extension:\\/\\/714de0a6-1742-4865-ac70-1ecdebe5901a\\/icons\\/512.png\'); height: 22px; width: 22px; top: 297px; left: 322px;\\\">\\u00a0<\\/div>\\r\\n<div class=\\\"simple-translate-panel \\\" style=\\\"width: 300px; height: 200px; top: 0px; left: 0px; font-size: 13px;\\\">\\r\\n<div class=\\\"simple-translate-result-wrapper\\\" style=\\\"overflow: hidden;\\\">\\r\\n<div class=\\\"simple-translate-move\\\" draggable=\\\"true\\\">\\u00a0<\\/div>\\r\\n<div class=\\\"simple-translate-result-contents\\\">\\r\\n<p class=\\\"simple-translate-result\\\" dir=\\\"auto\\\">\\u00a0<\\/p>\\r\\n<p class=\\\"simple-translate-candidate\\\" dir=\\\"auto\\\">\\u00a0<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 10:23:59\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-13 11:27:41\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-13 11:27:11\",\"publish_up\":\"2025-05-12 10:24:18\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"_:default\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"1\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"0\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"0\\\",\\\"show_urls_images_frontend\\\":\\\"0\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":15,\"ordering\":1,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":127,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(30,'com_content.article.4','','2025-05-13 15:11:38',302,15168,'7d0b7256812bc3e7cb65b938a5d20672b9d8040f','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<div class=\\\"ukh-header\\\" style=\\\"background: linear-gradient(135deg, #2c5f8b 0%, #1e3c5f 100%); color: white; padding: 60px 20px; text-align: center; margin-bottom: 30px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);\\\">\\r\\n<h1 style=\\\"font-size: 2.2em; margin: 0 0 15px 0; font-weight: 600; text-shadow: 0 2px 4px rgba(0,0,0,0.2);\\\">\\u041c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043a\\u0430\\u0437\\u0435\\u043d\\u043d\\u043e\\u0435 \\u0443\\u0447\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u0435 \\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\" \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/h1>\\r\\n<p style=\\\"font-size: 1.3em; margin: 0; opacity: 0.9;\\\">\\u041e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0438\\u0432\\u0430\\u0435\\u043c \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442 \\u0438 \\u043f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-content\\\" style=\\\"max-width: 1200px; margin: 0 auto 40px; padding: 0 20px; display: flex; flex-wrap: wrap; gap: 40px; justify-content: space-between;\\\">\\r\\n<div class=\\\"ukh-main-text\\\" style=\\\"flex: 1; min-width: 300px;\\\">\\r\\n<h2 style=\\\"color: #2c5f8b; font-size: 1.8em; margin-bottom: 20px; border-bottom: 3px solid #ec430f; padding-bottom: 10px; display: inline-block;\\\">\\u0414\\u043e\\u0431\\u0440\\u043e \\u043f\\u043e\\u0436\\u0430\\u043b\\u043e\\u0432\\u0430\\u0442\\u044c \\u043d\\u0430 \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430!<\\/h2>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041d\\u0430\\u0448\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0442\\u0432\\u0435\\u0447\\u0430\\u0435\\u0442 \\u0437\\u0430 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430. \\u041c\\u044b \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0434\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u0447\\u0442\\u043e\\u0431\\u044b \\u043d\\u0430\\u0448 \\u0433\\u043e\\u0440\\u043e\\u0434 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u0441\\u044f \\u0447\\u0438\\u0441\\u0442\\u044b\\u043c, \\u0443\\u044e\\u0442\\u043d\\u044b\\u043c \\u0438 \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f.<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f: \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439, \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f \\u0443\\u043b\\u0438\\u0446, \\u0432\\u044b\\u0432\\u043e\\u0437 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432 \\u0438 \\u043c\\u043d\\u043e\\u0433\\u043e\\u0435 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0435.<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041c\\u044b \\u0441\\u0442\\u0440\\u0435\\u043c\\u0438\\u043c\\u0441\\u044f \\u043a \\u0442\\u043e\\u043c\\u0443, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0432\\u0441\\u0435 \\u0436\\u0438\\u0442\\u0435\\u043b\\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u043c\\u043e\\u0433\\u043b\\u0438 \\u0433\\u043e\\u0440\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441\\u0432\\u043e\\u0438\\u043c \\u043c\\u0435\\u0441\\u0442\\u043e\\u043c \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f. \\u0414\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u043c\\u044b \\u0435\\u0436\\u0435\\u0434\\u043d\\u0435\\u0432\\u043d\\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u043d\\u0430\\u0434 \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c\\u044b\\u0445 \\u0443\\u0441\\u043b\\u0443\\u0433 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b.<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041d\\u0430 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0441\\u0430\\u0439\\u0442\\u0435 \\u0432\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u0443\\u0437\\u043d\\u0430\\u0442\\u044c \\u043e \\u0442\\u0435\\u043a\\u0443\\u0449\\u0438\\u0445 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0445, \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443 \\u043d\\u0430 \\u0443\\u0441\\u0442\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c, \\u043e\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441 \\u043d\\u043e\\u0440\\u043c\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u043c\\u0438 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0430\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0443\\u044e \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044e \\u043e \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-image\\\" style=\\\"flex: 1; min-width: 300px; text-align: center;\\\"><img style=\\\"max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);\\\" src=\\\"images\\/images\\/ukh-labinsk.jpg\\\" alt=\\\"\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\\">\\r\\n<p style=\\\"font-style: italic; color: #666; margin-top: 10px;\\\"><em>\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a - \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0443\\u044e\\u0442\\u043d\\u044b\\u0439<\\/em><\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-services\\\" style=\\\"background-color: #f8f9fa; padding: 40px 20px; margin-bottom: 40px;\\\">\\r\\n<div style=\\\"max-width: 1200px; margin: 0 auto;\\\">\\r\\n<h2 style=\\\"color: #2c5f8b; font-size: 1.8em; text-align: center; margin-bottom: 30px; position: relative;\\\"><span style=\\\"background: #f8f9fa; padding: 0 20px; position: relative; z-index: 1;\\\">\\u041d\\u0430\\u0448\\u0438 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043b\\u0443\\u0433\\u0438<\\/span><\\/h2>\\r\\n<ul style=\\\"columns: 2; column-gap: 40px; list-style-type: none; padding: 0; max-width: 800px; margin: 0 auto;\\\">\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043a\\u0440\\u044b\\u0442\\u0438\\u044f<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0423\\u0431\\u043e\\u0440\\u043a\\u0430 \\u0438 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u0432\\u044b\\u0432\\u043e\\u0437\\u0430 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0443\\u043b\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u041e\\u0437\\u0435\\u043b\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u0438 \\u0443\\u0445\\u043e\\u0434 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u0441\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u043c\\u0430\\u043b\\u044b\\u0445 \\u0430\\u0440\\u0445\\u0438\\u0442\\u0435\\u043a\\u0442\\u0443\\u0440\\u043d\\u044b\\u0445 \\u0444\\u043e\\u0440\\u043c \\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u043c\\u0435\\u0431\\u0435\\u043b\\u0438<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043c\\u0435\\u0440\\u043e\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0439 \\u043f\\u043e \\u0441\\u0430\\u043d\\u0438\\u0442\\u0430\\u0440\\u043d\\u043e\\u0439 \\u043e\\u0447\\u0438\\u0441\\u0442\\u043a\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0412\\u0437\\u0430\\u0438\\u043c\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u044f\\u044e\\u0449\\u0438\\u043c\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u0422\\u0421\\u0416<\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-contact\\\" style=\\\"max-width: 1200px; margin: 0 auto 60px; padding: 0 20px;\\\">\\r\\n<h2 style=\\\"color: #2c5f8b; font-size: 1.8em; text-align: center; margin-bottom: 30px; position: relative;\\\"><span style=\\\"background: white; padding: 0 20px; position: relative; z-index: 1;\\\">\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b<\\/span><\\/h2>\\r\\n<div style=\\\"background-color: white; border-radius: 8px; padding: 30px; box-shadow: 0 4px 12px rgba(0,0,0,0.08); max-width: 600px; margin: 0 auto;\\\">\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 15px;\\\"><strong style=\\\"color: #2c5f8b; min-width: 100px; display: inline-block;\\\">\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> \\u041a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0434\\u0430\\u0440\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0440\\u0430\\u0439, \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a, \\u0443\\u043b. \\u041b\\u0435\\u043d\\u0438\\u043d\\u0430, 123<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 15px;\\\"><strong style=\\\"color: #2c5f8b; min-width: 100px; display: inline-block;\\\">\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> +7 (86169) 2-34-56<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 15px;\\\"><strong style=\\\"color: #2c5f8b; min-width: 100px; display: inline-block;\\\">Email:<\\/strong> ukhlabinsk@mail.ru<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 20px;\\\"><strong style=\\\"color: #2c5f8b; min-width: 100px; display: inline-block;\\\">\\u0420\\u0435\\u0436\\u0438\\u043c \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b:<\\/strong> \\u041f\\u043d-\\u041f\\u0442: 8:00 - 17:00, \\u043f\\u0435\\u0440\\u0435\\u0440\\u044b\\u0432: 12:00 - 13:00<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; color: #333; line-height: 1.6; border-top: 1px dashed #ddd; padding-top: 20px; margin-top: 20px;\\\">\\u041c\\u044b \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u043e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b \\u0434\\u043b\\u044f \\u0434\\u0438\\u0430\\u043b\\u043e\\u0433\\u0430 \\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u044e \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-13 15:11:38\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-13 15:08:19\",\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"1\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"0\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":-1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":7,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":439,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(31,'com_content.article.4','','2025-05-13 15:16:22',302,15177,'048311a7b6b83f07e7b4f15462a13e802305f6a7','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<div class=\\\"ukh-header\\\" style=\\\"background: linear-gradient(135deg, #ec430f 0%, #c2380c 100%); color: white; padding: 60px 20px; text-align: center; margin-bottom: 30px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);\\\">\\r\\n<h1 style=\\\"font-size: 2.2em; margin: 0 0 15px 0; font-weight: 600; text-shadow: 0 2px 4px rgba(0,0,0,0.2);\\\">\\u041c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043a\\u0430\\u0437\\u0435\\u043d\\u043d\\u043e\\u0435 \\u0443\\u0447\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u0435 \\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\" \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/h1>\\r\\n<p style=\\\"font-size: 1.3em; margin: 0; opacity: 0.9;\\\">\\u041e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0438\\u0432\\u0430\\u0435\\u043c \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442 \\u0438 \\u043f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-content\\\" style=\\\"max-width: 1200px; margin: 0 auto 40px; padding: 0 20px; display: flex; flex-wrap: wrap; gap: 40px; justify-content: space-between;\\\">\\r\\n<div class=\\\"ukh-main-text\\\" style=\\\"flex: 1; min-width: 300px;\\\">\\r\\n<h2 style=\\\"color: #ec430f; font-size: 1.8em; margin-bottom: 20px; border-bottom: 3px solid #ec430f; padding-bottom: 10px; display: inline-block;\\\">\\u0414\\u043e\\u0431\\u0440\\u043e \\u043f\\u043e\\u0436\\u0430\\u043b\\u043e\\u0432\\u0430\\u0442\\u044c \\u043d\\u0430 \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430!<\\/h2>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041d\\u0430\\u0448\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0442\\u0432\\u0435\\u0447\\u0430\\u0435\\u0442 \\u0437\\u0430 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430. \\u041c\\u044b \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0434\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u0447\\u0442\\u043e\\u0431\\u044b \\u043d\\u0430\\u0448 \\u0433\\u043e\\u0440\\u043e\\u0434 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u0441\\u044f \\u0447\\u0438\\u0441\\u0442\\u044b\\u043c, \\u0443\\u044e\\u0442\\u043d\\u044b\\u043c \\u0438 \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f.<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f: \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439, \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f \\u0443\\u043b\\u0438\\u0446, \\u0432\\u044b\\u0432\\u043e\\u0437 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432 \\u0438 \\u043c\\u043d\\u043e\\u0433\\u043e\\u0435 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0435.<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041c\\u044b \\u0441\\u0442\\u0440\\u0435\\u043c\\u0438\\u043c\\u0441\\u044f \\u043a \\u0442\\u043e\\u043c\\u0443, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0432\\u0441\\u0435 \\u0436\\u0438\\u0442\\u0435\\u043b\\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u043c\\u043e\\u0433\\u043b\\u0438 \\u0433\\u043e\\u0440\\u0434\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441\\u0432\\u043e\\u0438\\u043c \\u043c\\u0435\\u0441\\u0442\\u043e\\u043c \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f. \\u0414\\u043b\\u044f \\u044d\\u0442\\u043e\\u0433\\u043e \\u043c\\u044b \\u0435\\u0436\\u0435\\u0434\\u043d\\u0435\\u0432\\u043d\\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u043d\\u0430\\u0434 \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c\\u044b\\u0445 \\u0443\\u0441\\u043b\\u0443\\u0433 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b.<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041d\\u0430 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0441\\u0430\\u0439\\u0442\\u0435 \\u0432\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u0443\\u0437\\u043d\\u0430\\u0442\\u044c \\u043e \\u0442\\u0435\\u043a\\u0443\\u0449\\u0438\\u0445 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0445, \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443 \\u043d\\u0430 \\u0443\\u0441\\u0442\\u0440\\u0430\\u043d\\u0435\\u043d\\u0438\\u0435 \\u043f\\u0440\\u043e\\u0431\\u043b\\u0435\\u043c, \\u043e\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u0438\\u0442\\u044c\\u0441\\u044f \\u0441 \\u043d\\u043e\\u0440\\u043c\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u043c\\u0438 \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0430\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0443\\u044e \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044e \\u043e \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-image\\\" style=\\\"flex: 1; min-width: 300px; text-align: center;\\\"><img style=\\\"max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(236,67,15,0.2);\\\" src=\\\"images\\/images\\/ukh-labinsk.jpg\\\" alt=\\\"\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\\">\\r\\n<p style=\\\"font-style: italic; color: #666; margin-top: 10px;\\\"><em>\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a - \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0443\\u044e\\u0442\\u043d\\u044b\\u0439<\\/em><\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-services\\\" style=\\\"background-color: #fff5f3; padding: 40px 20px; margin-bottom: 40px;\\\">\\r\\n<div style=\\\"max-width: 1200px; margin: 0 auto;\\\">\\r\\n<h2 style=\\\"color: #ec430f; font-size: 1.8em; text-align: center; margin-bottom: 30px; position: relative;\\\"><span style=\\\"background: #fff5f3; padding: 0 20px; position: relative; z-index: 1;\\\">\\u041d\\u0430\\u0448\\u0438 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043b\\u0443\\u0433\\u0438<\\/span><\\/h2>\\r\\n<ul style=\\\"columns: 2; column-gap: 40px; list-style-type: none; padding: 0; max-width: 800px; margin: 0 auto;\\\">\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043a\\u0440\\u044b\\u0442\\u0438\\u044f<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0423\\u0431\\u043e\\u0440\\u043a\\u0430 \\u0438 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u0432\\u044b\\u0432\\u043e\\u0437\\u0430 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0443\\u043b\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u041e\\u0437\\u0435\\u043b\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u0438 \\u0443\\u0445\\u043e\\u0434 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u0441\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u043c\\u0430\\u043b\\u044b\\u0445 \\u0430\\u0440\\u0445\\u0438\\u0442\\u0435\\u043a\\u0442\\u0443\\u0440\\u043d\\u044b\\u0445 \\u0444\\u043e\\u0440\\u043c \\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u043c\\u0435\\u0431\\u0435\\u043b\\u0438<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043c\\u0435\\u0440\\u043e\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0439 \\u043f\\u043e \\u0441\\u0430\\u043d\\u0438\\u0442\\u0430\\u0440\\u043d\\u043e\\u0439 \\u043e\\u0447\\u0438\\u0441\\u0442\\u043a\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430<\\/li>\\r\\n<li style=\\\"margin-bottom: 12px; padding-left: 25px; position: relative; break-inside: avoid;\\\"><span style=\\\"position: absolute; left: 0; color: #ec430f;\\\">\\u2022<\\/span> \\u0412\\u0437\\u0430\\u0438\\u043c\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u044f\\u044e\\u0449\\u0438\\u043c\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u0422\\u0421\\u0416<\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-contact\\\" style=\\\"max-width: 1200px; margin: 0 auto 60px; padding: 0 20px;\\\">\\r\\n<h2 style=\\\"color: #ec430f; font-size: 1.8em; text-align: center; margin-bottom: 30px; position: relative;\\\"><span style=\\\"background: white; padding: 0 20px; position: relative; z-index: 1;\\\">\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b<\\/span><\\/h2>\\r\\n<div style=\\\"background-color: white; border-radius: 8px; padding: 30px; box-shadow: 0 4px 12px rgba(236,67,15,0.1); max-width: 600px; margin: 0 auto;\\\">\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 15px;\\\"><strong style=\\\"color: #ec430f; min-width: 100px; display: inline-block;\\\">\\u0410\\u0434\\u0440\\u0435\\u0441:<\\/strong> \\u041a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0434\\u0430\\u0440\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0440\\u0430\\u0439, \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a, \\u0443\\u043b. \\u041b\\u0435\\u043d\\u0438\\u043d\\u0430, 123<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 15px;\\\"><strong style=\\\"color: #ec430f; min-width: 100px; display: inline-block;\\\">\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d:<\\/strong> +7 (86169) 2-34-56<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 15px;\\\"><strong style=\\\"color: #ec430f; min-width: 100px; display: inline-block;\\\">Email:<\\/strong> ukhlabinsk@mail.ru<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; margin-bottom: 20px;\\\"><strong style=\\\"color: #ec430f; min-width: 100px; display: inline-block;\\\">\\u0420\\u0435\\u0436\\u0438\\u043c \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b:<\\/strong> \\u041f\\u043d-\\u041f\\u0442: 8:00 - 17:00, \\u043f\\u0435\\u0440\\u0435\\u0440\\u044b\\u0432: 12:00 - 13:00<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; color: #333; line-height: 1.6; border-top: 1px dashed #f8c9bf; padding-top: 20px; margin-top: 20px;\\\">\\u041c\\u044b \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u043e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b \\u0434\\u043b\\u044f \\u0434\\u0438\\u0430\\u043b\\u043e\\u0433\\u0430 \\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u044e \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-13 15:16:22\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-13 15:11:38\",\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"1\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"0\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":-1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":8,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":443,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0),
(32,'com_content.article.4','','2025-05-13 15:31:50',302,18343,'91b9bfbdcf86c87ad7cd4be92bd67456c751d880','{\"id\":\"4\",\"asset_id\":111,\"title\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"alias\":\"glavnaya-stranitsa\",\"introtext\":\"<div class=\\\"ukh-header\\\" style=\\\"width: 100%; background: linear-gradient(135deg, #ec430f 0%, #c2380c 100%); color: white; padding: 80px 20px; text-align: center; margin-bottom: 50px; position: relative; overflow: hidden; box-shadow: 0 4px 12px rgba(0,0,0,0.1);\\\"><!-- \\u0414\\u0435\\u043a\\u043e\\u0440\\u0430\\u0442\\u0438\\u0432\\u043d\\u044b\\u0435 \\u044d\\u043b\\u0435\\u043c\\u0435\\u043d\\u0442\\u044b -->\\r\\n<div style=\\\"position: absolute; top: -50px; left: -50px; width: 200px; height: 200px; border-radius: 50%; background: rgba(255,255,255,0.1);\\\">\\u00a0<\\/div>\\r\\n<div style=\\\"position: absolute; bottom: -30px; right: -30px; width: 150px; height: 150px; border-radius: 50%; background: rgba(255,255,255,0.1);\\\">\\u00a0<\\/div>\\r\\n<!-- \\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u043e\\u0439 \\u043a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 -->\\r\\n<div style=\\\"position: relative; z-index: 2; max-width: 1000px; margin: 0 auto;\\\">\\r\\n<h1 style=\\\"font-size: 3.2em; margin: 0 0 20px 0; font-weight: bold; text-shadow: 0 2px 4px rgba(0,0,0,0.3);\\\">\\u041c\\u0443\\u043d\\u0438\\u0446\\u0438\\u043f\\u0430\\u043b\\u044c\\u043d\\u043e\\u0435 \\u043a\\u0430\\u0437\\u0435\\u043d\\u043d\\u043e\\u0435 \\u0443\\u0447\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u0435 \\\"\\u0423\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430\\\" \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430<\\/h1>\\r\\n<div style=\\\"width: 80px; height: 4px; background: white; margin: 0 auto 25px;\\\">\\u00a0<\\/div>\\r\\n<p style=\\\"font-size: 1.3em; line-height: 1.6; margin-bottom: 30px; max-width: 800px; margin-left: auto; margin-right: auto; opacity: 0.9;\\\">\\u041e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0438\\u0432\\u0430\\u0435\\u043c \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442 \\u0438 \\u043f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-content\\\" style=\\\"max-width: 1200px; margin: 0 auto 60px; padding: 0 20px; text-align: center;\\\">\\r\\n<p style=\\\"font-size: 1.1em; color: #555; line-height: 1.7;\\\">\\u041c\\u044b \\u0435\\u0436\\u0435\\u0434\\u043d\\u0435\\u0432\\u043d\\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u043d\\u0430\\u0434 \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u043a\\u0430\\u0447\\u0435\\u0441\\u0442\\u0432\\u0430 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c\\u044b\\u0445 \\u0443\\u0441\\u043b\\u0443\\u0433 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b.<\\/p>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-main-content\\\" style=\\\"max-width: 1200px; margin: 0 auto 40px; padding: 0 20px; display: flex; flex-wrap: wrap; gap: 40px; justify-content: space-between;\\\">\\r\\n<div class=\\\"ukh-main-text\\\" style=\\\"flex: 1; min-width: 300px;\\\">\\r\\n<h2 style=\\\"color: #ec430f; font-size: 1.8em; margin-bottom: 20px; padding-bottom: 10px; display: inline-block; position: relative;\\\">\\u0414\\u043e\\u0431\\u0440\\u043e \\u043f\\u043e\\u0436\\u0430\\u043b\\u043e\\u0432\\u0430\\u0442\\u044c \\u043d\\u0430 \\u043e\\u0444\\u0438\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0441\\u0430\\u0439\\u0442 \\u041c\\u041a\\u0423 \\u0423\\u041a\\u0425 \\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430!<\\/h2>\\r\\n<div style=\\\"position: absolute; bottom: 0; left: 0; width: 100%; height: 3px; background: #ec430f;\\\">\\u00a0<\\/div>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041d\\u0430\\u0448\\u0430 \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0442\\u0432\\u0435\\u0447\\u0430\\u0435\\u0442 \\u0437\\u0430 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0430\\u0437\\u0432\\u0438\\u0442\\u0438\\u0435 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0438\\u043d\\u0444\\u0440\\u0430\\u0441\\u0442\\u0440\\u0443\\u043a\\u0442\\u0443\\u0440\\u044b \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\u0430. \\u041c\\u044b \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u043c \\u0434\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u0447\\u0442\\u043e\\u0431\\u044b \\u043d\\u0430\\u0448 \\u0433\\u043e\\u0440\\u043e\\u0434 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u0441\\u044f \\u0447\\u0438\\u0441\\u0442\\u044b\\u043c, \\u0443\\u044e\\u0442\\u043d\\u044b\\u043c \\u0438 \\u043a\\u043e\\u043c\\u0444\\u043e\\u0440\\u0442\\u043d\\u044b\\u043c \\u0434\\u043b\\u044f \\u043f\\u0440\\u043e\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u044f.<\\/p>\\r\\n<p style=\\\"font-size: 1.1em; line-height: 1.7; color: #333; margin-bottom: 20px;\\\">\\u041e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438 \\u043d\\u0430\\u0448\\u0435\\u0439 \\u0434\\u0435\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438 \\u044f\\u0432\\u043b\\u044f\\u044e\\u0442\\u0441\\u044f: \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430, \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439, \\u043e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f \\u0443\\u043b\\u0438\\u0446, \\u0432\\u044b\\u0432\\u043e\\u0437 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432 \\u0438 \\u043c\\u043d\\u043e\\u0433\\u043e\\u0435 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0435.<\\/p>\\r\\n<a style=\\\"display: inline-block; background: #ec430f; color: white; padding: 12px 30px; border-radius: 30px; text-decoration: none; font-weight: 600; transition: all 0.3s ease; box-shadow: 0 4px 6px rgba(0,0,0,0.1); margin-top: 20px;\\\" href=\\\"#services\\\"> \\u041d\\u0430\\u0448\\u0438 \\u0443\\u0441\\u043b\\u0443\\u0433\\u0438 <\\/a><\\/div>\\r\\n<div class=\\\"ukh-image\\\" style=\\\"flex: 1; min-width: 300px; text-align: center;\\\"><img style=\\\"max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(236,67,15,0.2);\\\" src=\\\"images\\/images\\/ukh-labinsk.jpg\\\" alt=\\\"\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a\\\">\\r\\n<p style=\\\"font-style: italic; color: #666; margin-top: 10px;\\\"><em>\\u0413\\u043e\\u0440\\u043e\\u0434 \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a - \\u0447\\u0438\\u0441\\u0442\\u044b\\u0439 \\u0438 \\u0443\\u044e\\u0442\\u043d\\u044b\\u0439<\\/em><\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div id=\\\"services\\\" class=\\\"ukh-services\\\" style=\\\"background-color: #fff5f3; padding: 60px 20px; margin-bottom: 60px; position: relative;\\\">\\r\\n<div style=\\\"position: absolute; top: 20px; left: 20px; width: 100px; height: 100px; border-radius: 50%; background: rgba(236,67,15,0.05);\\\">\\u00a0<\\/div>\\r\\n<div style=\\\"position: absolute; bottom: 20px; right: 20px; width: 80px; height: 80px; border-radius: 50%; background: rgba(236,67,15,0.05);\\\">\\u00a0<\\/div>\\r\\n<div style=\\\"max-width: 1200px; margin: 0 auto; position: relative; z-index: 2;\\\">\\r\\n<h2 style=\\\"color: #ec430f; font-size: 2em; text-align: center; margin-bottom: 40px; position: relative;\\\"><span style=\\\"background: #fff5f3; padding: 0 20px; position: relative;\\\">\\u041d\\u0430\\u0448\\u0438 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u0435 \\u0443\\u0441\\u043b\\u0443\\u0433\\u0438<\\/span><\\/h2>\\r\\n<div style=\\\"position: absolute; bottom: -10px; left: 50%; transform: translateX(-50%); width: 100px; height: 3px; background: #ec430f;\\\">\\u00a0<\\/div>\\r\\n<ul style=\\\"columns: 2; column-gap: 40px; list-style-type: none; padding: 0; max-width: 800px; margin: 0 auto;\\\">\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u0440\\u0435\\u043c\\u043e\\u043d\\u0442 \\u0434\\u043e\\u0440\\u043e\\u0436\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043a\\u0440\\u044b\\u0442\\u0438\\u044f<\\/li>\\r\\n<!-- \\u041e\\u0441\\u0442\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u043f\\u0443\\u043d\\u043a\\u0442\\u044b \\u0441\\u043f\\u0438\\u0441\\u043a\\u0430 \\u0441 \\u0430\\u043d\\u0430\\u043b\\u043e\\u0433\\u0438\\u0447\\u043d\\u044b\\u043c \\u043e\\u0444\\u043e\\u0440\\u043c\\u043b\\u0435\\u043d\\u0438\\u0435\\u043c -->\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u0423\\u0431\\u043e\\u0440\\u043a\\u0430 \\u0438 \\u0431\\u043b\\u0430\\u0433\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0439<\\/li>\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u0432\\u044b\\u0432\\u043e\\u0437\\u0430 \\u0442\\u0432\\u0435\\u0440\\u0434\\u044b\\u0445 \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u043e\\u0442\\u0445\\u043e\\u0434\\u043e\\u0432<\\/li>\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u0443\\u043b\\u0438\\u0447\\u043d\\u043e\\u0433\\u043e \\u043e\\u0441\\u0432\\u0435\\u0449\\u0435\\u043d\\u0438\\u044f<\\/li>\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u041e\\u0437\\u0435\\u043b\\u0435\\u043d\\u0435\\u043d\\u0438\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u0438 \\u0443\\u0445\\u043e\\u0434 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u043c\\u0438 \\u043d\\u0430\\u0441\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438<\\/li>\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u0421\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435 \\u043c\\u0430\\u043b\\u044b\\u0445 \\u0430\\u0440\\u0445\\u0438\\u0442\\u0435\\u043a\\u0442\\u0443\\u0440\\u043d\\u044b\\u0445 \\u0444\\u043e\\u0440\\u043c \\u0438 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u0439 \\u043c\\u0435\\u0431\\u0435\\u043b\\u0438<\\/li>\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u041e\\u0440\\u0433\\u0430\\u043d\\u0438\\u0437\\u0430\\u0446\\u0438\\u044f \\u043c\\u0435\\u0440\\u043e\\u043f\\u0440\\u0438\\u044f\\u0442\\u0438\\u0439 \\u043f\\u043e \\u0441\\u0430\\u043d\\u0438\\u0442\\u0430\\u0440\\u043d\\u043e\\u0439 \\u043e\\u0447\\u0438\\u0441\\u0442\\u043a\\u0435 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430<\\/li>\\r\\n<li style=\\\"margin-bottom: 15px; padding-left: 30px; position: relative; break-inside: avoid;\\\">\\r\\n<div style=\\\"position: absolute; left: 0; top: 5px; width: 20px; height: 20px; background: #ec430f; border-radius: 50%; display: flex; align-items: center; justify-content: center;\\\"><span style=\\\"color: white; font-size: 0.8em;\\\">\\u2713<\\/span><\\/div>\\r\\n\\u0412\\u0437\\u0430\\u0438\\u043c\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0435 \\u0441 \\u0443\\u043f\\u0440\\u0430\\u0432\\u043b\\u044f\\u044e\\u0449\\u0438\\u043c\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0438 \\u0422\\u0421\\u0416<\\/li>\\r\\n<\\/ul>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<div class=\\\"ukh-contact\\\" style=\\\"max-width: 1200px; margin: 0 auto 80px; padding: 0 20px; position: relative;\\\">\\r\\n<div style=\\\"position: absolute; top: -30px; left: 50%; transform: translateX(-50%); width: 100px; height: 100px; border-radius: 50%; background: rgba(236,67,15,0.1); z-index: -1;\\\">\\u00a0<\\/div>\\r\\n<h2 style=\\\"color: #ec430f; font-size: 2em; text-align: center; margin-bottom: 40px; position: relative;\\\"><span style=\\\"background: white; padding: 0 20px; position: relative;\\\">\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b<\\/span><\\/h2>\\r\\n<div style=\\\"position: absolute; bottom: -10px; left: 50%; transform: translateX(-50%); width: 100px; height: 3px; background: #ec430f;\\\">\\u00a0<\\/div>\\r\\n<div style=\\\"background-color: white; border-radius: 12px; padding: 40px; box-shadow: 0 8px 20px rgba(236,67,15,0.1); max-width: 700px; margin: 0 auto; position: relative; z-index: 2;\\\">\\r\\n<div style=\\\"display: flex; flex-wrap: wrap; gap: 30px; justify-content: center;\\\">\\r\\n<div style=\\\"flex: 1; min-width: 250px;\\\">\\r\\n<h3 style=\\\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\\\">\\u0410\\u0434\\u0440\\u0435\\u0441<\\/h3>\\r\\n<p style=\\\"font-size: 1.1em; color: #333; line-height: 1.6;\\\">\\u041a\\u0440\\u0430\\u0441\\u043d\\u043e\\u0434\\u0430\\u0440\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0440\\u0430\\u0439,<br>\\u0433. \\u041b\\u0430\\u0431\\u0438\\u043d\\u0441\\u043a,<br>\\u0443\\u043b. \\u041b\\u0435\\u043d\\u0438\\u043d\\u0430, 123<\\/p>\\r\\n<\\/div>\\r\\n<div style=\\\"flex: 1; min-width: 250px;\\\">\\r\\n<h3 style=\\\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\\\">\\u042d\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d\\u043d\\u0430\\u044f \\u043f\\u043e\\u0447\\u0442\\u0430<\\/h3>\\r\\n<p style=\\\"font-size: 1.1em; color: #333; line-height: 1.6;\\\">ukhlabinsk@mail.ru<\\/p>\\r\\n<\\/div>\\r\\n<div style=\\\"flex: 1; min-width: 250px;\\\">\\r\\n<h3 style=\\\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\\\">\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d<\\/h3>\\r\\n<p style=\\\"font-size: 1.1em; color: #333; line-height: 1.6;\\\">+7 (86169) 2-34-56<\\/p>\\r\\n<\\/div>\\r\\n<div style=\\\"flex: 1; min-width: 250px;\\\">\\r\\n<h3 style=\\\"color: #ec430f; font-size: 1.3em; margin-bottom: 20px; display: flex; align-items: center;\\\">\\u0420\\u0435\\u0436\\u0438\\u043c \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b<\\/h3>\\r\\n<p style=\\\"font-size: 1.1em; color: #333; line-height: 1.6;\\\">\\u041f\\u043d-\\u041f\\u0442: 8:00 - 17:00<br>\\u041f\\u0435\\u0440\\u0435\\u0440\\u044b\\u0432: 12:00 - 13:00<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\\r\\n<p style=\\\"font-size: 1.1em; color: #333; line-height: 1.6; text-align: center; margin-top: 40px; padding-top: 20px; border-top: 1px dashed #f8c9bf;\\\">\\u041c\\u044b \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u043e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b \\u0434\\u043b\\u044f \\u0434\\u0438\\u0430\\u043b\\u043e\\u0433\\u0430 \\u0438 \\u0433\\u043e\\u0442\\u043e\\u0432\\u044b \\u0440\\u0430\\u0441\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u0432\\u0430\\u0448\\u0438 \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u044e \\u0440\\u0430\\u0431\\u043e\\u0442\\u044b \\u043a\\u043e\\u043c\\u043c\\u0443\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0445\\u043e\\u0437\\u044f\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430.<\\/p>\\r\\n<\\/div>\\r\\n<\\/div>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2025-05-12 14:09:36\",\"created_by\":\"302\",\"created_by_alias\":\"\",\"modified\":\"2025-05-13 15:31:50\",\"modified_by\":302,\"checked_out\":302,\"checked_out_time\":\"2025-05-13 15:16:22\",\"publish_up\":\"2025-05-12 14:09:36\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"0\\\",\\\"link_titles\\\":\\\"0\\\",\\\"show_tags\\\":\\\"0\\\",\\\"show_intro\\\":\\\"0\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"0\\\",\\\"show_category\\\":\\\"0\\\",\\\"link_category\\\":\\\"1\\\",\\\"show_parent_category\\\":\\\"0\\\",\\\"link_parent_category\\\":\\\"0\\\",\\\"show_author\\\":\\\"0\\\",\\\"link_author\\\":\\\"0\\\",\\\"show_create_date\\\":\\\"0\\\",\\\"show_modify_date\\\":\\\"0\\\",\\\"show_publish_date\\\":\\\"0\\\",\\\"show_item_navigation\\\":\\\"0\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"0\\\",\\\"urls_position\\\":-1,\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":9,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":445,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}',0);
/*!40000 ALTER TABLE `amtf3_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_languages`
--

DROP TABLE IF EXISTS `amtf3_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_languages` (
  `lang_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text DEFAULT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_languages`
--

LOCK TABLES `amtf3_languages` WRITE;
/*!40000 ALTER TABLE `amtf3_languages` DISABLE KEYS */;
INSERT INTO `amtf3_languages` VALUES
(1,0,'en-GB','English (en-GB)','English (United Kingdom)','en','en_gb','','','','',0,1,2),
(2,100,'ru-RU','Russian (ru-RU)','Русский (Россия)','ru','ru_ru','',NULL,'','',1,1,1);
/*!40000 ALTER TABLE `amtf3_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_mail_templates`
--

DROP TABLE IF EXISTS `amtf3_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_mail_templates` (
  `template_id` varchar(127) NOT NULL DEFAULT '',
  `extension` varchar(127) NOT NULL DEFAULT '',
  `language` char(7) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `htmlbody` mediumtext NOT NULL,
  `attachments` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`template_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_mail_templates`
--

LOCK TABLES `amtf3_mail_templates` WRITE;
/*!40000 ALTER TABLE `amtf3_mail_templates` DISABLE KEYS */;
INSERT INTO `amtf3_mail_templates` VALUES
('com_actionlogs.notification','com_actionlogs','','COM_ACTIONLOGS_EMAIL_SUBJECT','COM_ACTIONLOGS_EMAIL_BODY','COM_ACTIONLOGS_EMAIL_HTMLBODY','','{\"tags\":[\"messages\",\"message\",\"date\",\"extension\",\"username\"]}'),
('com_config.test_mail','com_config','','COM_CONFIG_SENDMAIL_SUBJECT','COM_CONFIG_SENDMAIL_BODY','','','{\"tags\":[\"sitename\",\"method\"]}'),
('com_contact.mail','com_contact','','COM_CONTACT_ENQUIRY_SUBJECT','COM_CONTACT_ENQUIRY_TEXT','','','{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\"]}'),
('com_contact.mail.copy','com_contact','','COM_CONTACT_COPYSUBJECT_OF','COM_CONTACT_COPYTEXT_OF','','','{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\",\"contactname\"]}'),
('com_messages.new_message','com_messages','','COM_MESSAGES_NEW_MESSAGE','COM_MESSAGES_NEW_MESSAGE_BODY','','','{\"tags\":[\"subject\",\"message\",\"fromname\",\"sitename\",\"siteurl\",\"fromemail\",\"toname\",\"toemail\"]}'),
('com_privacy.notification.admin.export','com_privacy','','COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_EXPORT_REQUEST','COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_EXPORT_REQUEST','','','{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.admin.remove','com_privacy','','COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_REMOVE_REQUEST','COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_REMOVE_REQUEST','','','{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.export','com_privacy','','COM_PRIVACY_EMAIL_REQUEST_SUBJECT_EXPORT_REQUEST','COM_PRIVACY_EMAIL_REQUEST_BODY_EXPORT_REQUEST','','','{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.remove','com_privacy','','COM_PRIVACY_EMAIL_REQUEST_SUBJECT_REMOVE_REQUEST','COM_PRIVACY_EMAIL_REQUEST_BODY_REMOVE_REQUEST','','','{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.userdataexport','com_privacy','','COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_SUBJECT','COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_BODY','','','{\"tags\":[\"sitename\",\"url\"]}'),
('com_users.massmail.mail','com_users','','COM_USERS_MASSMAIL_MAIL_SUBJECT','COM_USERS_MASSMAIL_MAIL_BODY','','','{\"tags\":[\"subject\",\"body\",\"subjectprefix\",\"bodysuffix\"]}'),
('com_users.password_reset','com_users','','COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT','COM_USERS_EMAIL_PASSWORD_RESET_BODY','','','{\"tags\":[\"name\",\"email\",\"sitename\",\"link_text\",\"link_html\",\"token\"]}'),
('com_users.registration.admin.new_notification','com_users','','COM_USERS_EMAIL_ACCOUNT_DETAILS','COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY','','','{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.admin.verification_request','com_users','','COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT','COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY','','','{\"tags\":[\"name\",\"sitename\",\"email\",\"username\",\"activate\"]}'),
('com_users.registration.user.admin_activated','com_users','','COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT','COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY','','','{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation','com_users','','COM_USERS_EMAIL_ACCOUNT_DETAILS','COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW','','','{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation_w_pw','com_users','','COM_USERS_EMAIL_ACCOUNT_DETAILS','COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY','','','{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.registration_mail','com_users','','COM_USERS_EMAIL_ACCOUNT_DETAILS','COM_USERS_EMAIL_REGISTERED_BODY_NOPW','','','{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.registration_mail_w_pw','com_users','','COM_USERS_EMAIL_ACCOUNT_DETAILS','COM_USERS_EMAIL_REGISTERED_BODY','','','{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.self_activation','com_users','','COM_USERS_EMAIL_ACCOUNT_DETAILS','COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW','','','{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.self_activation_w_pw','com_users','','COM_USERS_EMAIL_ACCOUNT_DETAILS','COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY','','','{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.reminder','com_users','','COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT','COM_USERS_EMAIL_USERNAME_REMINDER_BODY','','','{\"tags\":[\"name\",\"username\",\"sitename\",\"email\",\"link_text\",\"link_html\"]}'),
('plg_multifactorauth_email.mail','plg_multifactorauth_email','','PLG_MULTIFACTORAUTH_EMAIL_EMAIL_SUBJECT','PLG_MULTIFACTORAUTH_EMAIL_EMAIL_BODY','','','{\"tags\":[\"code\",\"sitename\",\"siteurl\",\"username\",\"email\",\"fullname\"]}'),
('plg_system_tasknotification.failure_mail','plg_system_tasknotification','','PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_SUBJECT','PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_BODY','','','{\"tags\": [\"task_id\", \"task_title\", \"exit_code\", \"exec_data_time\", \"task_output\"]}'),
('plg_system_tasknotification.fatal_recovery_mail','plg_system_tasknotification','','PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_SUBJECT','PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_BODY','','','{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.orphan_mail','plg_system_tasknotification','','PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_SUBJECT','PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_BODY','','','{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.success_mail','plg_system_tasknotification','','PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_SUBJECT','PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_BODY','','','{\"tags\":[\"task_id\", \"task_title\", \"exec_data_time\", \"task_output\"]}'),
('plg_task_privacyconsent.request.reminder','plg_task_privacyconsent','','PLG_TASK_PRIVACYCONSENT_EMAIL_REMIND_SUBJECT','PLG_TASK_PRIVACYCONSENT_EMAIL_REMIND_BODY','','','{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('plg_task_updatenotification.mail','plg_task_updatenotification','','PLG_TASK_UPDATENOTIFICATION_EMAIL_SUBJECT','PLG_TASK_UPDATENOTIFICATION_EMAIL_BODY','','','{\"tags\":[\"newversion\",\"curversion\",\"sitename\",\"url\",\"link\",\"releasenews\"]}'),
('plg_user_joomla.mail','plg_user_joomla','','PLG_USER_JOOMLA_NEW_USER_EMAIL_SUBJECT','PLG_USER_JOOMLA_NEW_USER_EMAIL_BODY','','','{\"tags\":[\"name\",\"sitename\",\"url\",\"username\",\"password\",\"email\"]}');
/*!40000 ALTER TABLE `amtf3_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_menu`
--

DROP TABLE IF EXISTS `amtf3_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned DEFAULT NULL COMMENT 'FK to #__users.id',
  `checked_out_time` datetime DEFAULT NULL COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_menu`
--

LOCK TABLES `amtf3_menu` WRITE;
/*!40000 ALTER TABLE `amtf3_menu` DISABLE KEYS */;
INSERT INTO `amtf3_menu` VALUES
(1,'','Menu_Item_Root','root','','','','',1,0,0,0,NULL,NULL,0,0,'',0,'',0,83,0,'*',0,NULL,NULL),
(2,'main','com_banners','Banners','','Banners','index.php?option=com_banners','component',1,1,1,3,NULL,NULL,0,0,'class:bookmark',0,'',23,32,0,'*',1,NULL,NULL),
(3,'main','com_banners','Banners','','Banners/Banners','index.php?option=com_banners&view=banners','component',1,2,2,3,NULL,NULL,0,0,'class:banners',0,'',24,25,0,'*',1,NULL,NULL),
(4,'main','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&view=categories&extension=com_banners','component',1,2,2,5,NULL,NULL,0,0,'class:banners-cat',0,'',26,27,0,'*',1,NULL,NULL),
(5,'main','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',1,2,2,3,NULL,NULL,0,0,'class:banners-clients',0,'',28,29,0,'*',1,NULL,NULL),
(6,'main','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',1,2,2,3,NULL,NULL,0,0,'class:banners-tracks',0,'',30,31,0,'*',1,NULL,NULL),
(7,'main','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',1,1,1,7,NULL,NULL,0,0,'class:address-book',0,'',33,42,0,'*',1,NULL,NULL),
(8,'main','com_contact_contacts','Contacts','','Contacts/Contacts','index.php?option=com_contact&view=contacts','component',1,7,2,7,NULL,NULL,0,0,'class:contact',0,'',34,35,0,'*',1,NULL,NULL),
(9,'main','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&view=categories&extension=com_contact','component',1,7,2,5,NULL,NULL,0,0,'class:contact-cat',0,'',36,37,0,'*',1,NULL,NULL),
(10,'main','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',1,1,1,16,NULL,NULL,0,0,'class:rss',0,'',45,50,0,'*',1,NULL,NULL),
(11,'main','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds&view=newsfeeds','component',1,10,2,16,NULL,NULL,0,0,'class:newsfeeds',0,'',46,47,0,'*',1,NULL,NULL),
(12,'main','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&view=categories&extension=com_newsfeeds','component',1,10,2,5,NULL,NULL,0,0,'class:newsfeeds-cat',0,'',48,49,0,'*',1,NULL,NULL),
(13,'main','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',1,1,1,23,NULL,NULL,0,0,'class:search-plus',0,'',51,60,0,'*',1,NULL,NULL),
(14,'main','com_tags','Tags','','Tags','index.php?option=com_tags&view=tags','component',1,1,1,25,NULL,NULL,0,1,'class:tags',0,'',61,62,0,'',1,NULL,NULL),
(15,'main','com_associations','Multilingual Associations','','Multilingual Associations','index.php?option=com_associations&view=associations','component',1,1,1,30,NULL,NULL,0,0,'class:language',0,'',43,44,0,'*',1,NULL,NULL),
(16,'main','mod_menu_fields','Contact Custom Fields','','Contacts/Contact Custom Fields','index.php?option=com_fields&context=com_contact.contact','component',1,7,2,29,NULL,NULL,0,0,'class:messages-add',0,'',38,39,0,'*',1,NULL,NULL),
(17,'main','mod_menu_fields_group','Contact Custom Fields Group','','Contacts/Contact Custom Fields Group','index.php?option=com_fields&view=groups&context=com_contact.contact','component',1,7,2,29,NULL,NULL,0,0,'class:messages-add',0,'',40,41,0,'*',1,NULL,NULL),
(18,'main','com_finder_index','Smart-Search-Index','','Smart Search/Smart-Search-Index','index.php?option=com_finder&view=index','component',1,13,2,23,NULL,NULL,0,0,'class:finder',0,'',52,53,0,'*',1,NULL,NULL),
(19,'main','com_finder_maps','Smart-Search-Maps','','Smart Search/Smart-Search-Maps','index.php?option=com_finder&view=maps','component',1,13,2,23,NULL,NULL,0,0,'class:finder-maps',0,'',54,55,0,'*',1,NULL,NULL),
(20,'main','com_finder_filters','Smart-Search-Filters','','Smart Search/Smart-Search-Filters','index.php?option=com_finder&view=filters','component',1,13,2,23,NULL,NULL,0,0,'class:finder-filters',0,'',56,57,0,'*',1,NULL,NULL),
(21,'main','com_finder_searches','Smart-Search-Searches','','Smart Search/Smart-Search-Searches','index.php?option=com_finder&view=searches','component',1,13,2,23,NULL,NULL,0,0,'class:finder-searches',0,'',58,59,0,'*',1,NULL,NULL),
(101,'mainmenu','Главная','home','','home','index.php?option=com_content&view=article&id=4','component',1,1,1,19,NULL,NULL,0,1,' ',0,'{\"show_title\":\"0\",\"link_titles\":\"0\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"info_block_show_title\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_hits\":\"0\",\"show_tags\":\"0\",\"show_noauth\":\"0\",\"urls_position\":-1,\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":0,\"menu_show\":0,\"page_title\":\"\",\"show_page_heading\":\"0\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',3,4,1,'*',0,NULL,NULL),
(105,'mainmenu','Вход','login','','login','index.php?option=com_users&view=login','component',1,1,1,22,NULL,NULL,0,5,' ',0,'{\"loginredirectchoice\":\"1\",\"login_redirect_url\":\"\",\"login_redirect_menuitem\":\"\",\"logindescription_show\":\"1\",\"login_description\":\"\",\"login_image\":\"\",\"login_image_alt\":\"\",\"logoutredirectchoice\":\"1\",\"logout_redirect_url\":\"\",\"logout_redirect_menuitem\":\"\",\"logoutdescription_show\":\"1\",\"logout_description\":\"\",\"logout_image\":\"\",\"logout_image_alt\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',15,16,0,'*',0,NULL,NULL),
(106,'mainmenu','Регистрация','register','','register','index.php?option=com_users&view=registration','component',1,1,1,22,NULL,NULL,0,5,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',17,18,0,'*',0,NULL,NULL),
(107,'mainmenu','Выход','signout','','signout','index.php?option=com_users&view=login&layout=logout&task=user.menulogout','component',1,1,1,22,NULL,NULL,0,2,' ',0,'{\"logout\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',19,20,0,'*',0,NULL,NULL),
(113,'main','ChronoForms 8','chronoforms-8','','chronoforms-8','index.php?option=com_chronoforms8&view=main','component',1,1,1,263,NULL,NULL,0,1,'class:component',0,'{}',63,64,0,'',1,NULL,NULL),
(115,'mainmenu','Пример заявления','primer-zayavleniya','','primer-zayavleniya','index.php?option=com_content&view=article&id=3','component',1,1,1,19,NULL,NULL,0,1,' ',0,'{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"0\",\"info_block_position\":\"\",\"info_block_show_title\":\"0\",\"show_category\":\"0\",\"link_category\":\"0\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"0\",\"show_hits\":\"\",\"show_tags\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',5,6,0,'*',0,NULL,NULL),
(116,'mainmenu','Типы заявок','type-zayavki','','type-zayavki','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"create-type-request-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',7,8,0,'*',0,NULL,NULL),
(118,'request','Все типы заявок','read-type-request-form','','read-type-request-form','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"read-type-request-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',65,66,0,'*',0,NULL,NULL),
(119,'request','Создать тип заявки','sozdat-type-zayavki','','sozdat-type-zayavki','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"create-type-request-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',67,68,0,'*',0,NULL,NULL),
(120,'mainmenu','Профиль','profil','','profil','index.php?option=com_users&view=profile','component',1,1,1,22,NULL,NULL,0,2,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',13,14,0,'*',0,NULL,NULL),
(122,'ne-otobrazhaetsya','Удалить тип заявки','delete-type-request','','delete-type-request','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"delete-type-request-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',21,22,0,'*',0,NULL,NULL),
(123,'zayavki','Создать заявку','sozdat-zayavku','','sozdat-zayavku','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,2,' ',0,'{\"chronoform\":\"create-request-from\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',69,70,0,'*',0,NULL,NULL),
(124,'mainmenu','Заявки','zayavki','','zayavki','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,2,' ',0,'{\"chronoform\":\"create-request-from\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',9,10,0,'*',0,NULL,NULL),
(125,'zayavki','Все заявки','vse-zayavki','','vse-zayavki','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"read-request-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',71,72,0,'*',0,NULL,NULL),
(126,'ne-otobrazhaetsya','Удалить заявку','delete-request','','delete-request','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"delete-request-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',73,74,0,'*',0,NULL,NULL),
(127,'ne-otobrazhaetsya','Обновить заявку','obnovit-zayavku','','obnovit-zayavku','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"update-request-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',75,76,0,'*',0,NULL,NULL),
(128,'rabota','Добавить работу','dobavit-rabotu','','dobavit-rabotu','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"create-work-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',77,78,0,'*',0,NULL,NULL),
(129,'mainmenu','Работа','rabota','','rabota','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"create-work-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',11,12,0,'*',0,NULL,NULL),
(130,'mainmenu','Работа организации','rabota-organizatsii','','rabota-organizatsii','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,1,' ',0,'{\"chronoform\":\"read-work-view-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',1,2,0,'*',0,NULL,NULL),
(131,'rabota','Все работы','vse-raboty','','vse-raboty','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"read-work-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',79,80,0,'*',0,NULL,NULL),
(132,'ne-otobrazhaetsya','Удалить работу','udalit-rabotu','','udalit-rabotu','index.php?option=com_chronoforms8&view=form','component',1,1,1,263,NULL,NULL,0,7,' ',0,'{\"chronoform\":\"delete-work-form\",\"form_params\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}',81,82,0,'*',0,NULL,NULL);
/*!40000 ALTER TABLE `amtf3_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_menu_types`
--

DROP TABLE IF EXISTS `amtf3_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_menu_types`
--

LOCK TABLES `amtf3_menu_types` WRITE;
/*!40000 ALTER TABLE `amtf3_menu_types` DISABLE KEYS */;
INSERT INTO `amtf3_menu_types` VALUES
(1,0,'mainmenu','Main Menu','The main menu for the site',0,1),
(3,109,'request','Типы заявок','',0,0),
(4,112,'ne-otobrazhaetsya','Не отображается','',0,0),
(5,114,'zayavki','Заявки','',0,0),
(6,116,'rabota','Работа','',0,0);
/*!40000 ALTER TABLE `amtf3_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_messages`
--

DROP TABLE IF EXISTS `amtf3_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id_to` int(10) unsigned NOT NULL DEFAULT 0,
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `date_time` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_messages`
--

LOCK TABLES `amtf3_messages` WRITE;
/*!40000 ALTER TABLE `amtf3_messages` DISABLE KEYS */;
INSERT INTO `amtf3_messages` VALUES
(1,302,302,0,'2025-05-12 08:35:35',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: useruseruser.'),
(2,302,302,0,'2025-05-12 11:50:55',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: useruseruser.'),
(3,302,302,0,'2025-05-12 15:05:03',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: qqqqqqqqqqqq.'),
(4,302,302,0,'2025-05-12 15:11:10',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: asfdfdsafdsa.'),
(5,302,302,0,'2025-05-12 15:18:48',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: asfdfdsafdsadssdf.'),
(6,302,302,0,'2025-05-12 15:20:37',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: asfdfdsafdsadssdfdfdsf.'),
(7,302,302,0,'2025-05-12 15:22:50',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: asfdfdsafdsadssdfdfdsfdfg.'),
(8,302,302,0,'2025-05-12 15:25:10',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: asfdfdsafdsadssdfdfdsfdfgfd.'),
(9,302,302,0,'2025-05-12 15:30:53',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: gfddfggfdfgdfdg.'),
(10,302,302,0,'2025-05-12 15:36:14',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: useruseruser.'),
(11,302,302,0,'2025-05-12 15:42:03',1,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: dssdgsgdgssgfd.'),
(12,302,302,0,'2025-05-12 15:55:23',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: dsfsdfsfdsfds.'),
(13,302,302,0,'2025-05-12 15:55:52',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: dsfsdfsfdsfds.'),
(14,302,302,0,'2025-05-12 16:05:15',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: useruseruser.'),
(15,302,302,0,'2025-05-12 16:12:15',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: qqqqqqqqqqqq.'),
(16,302,302,0,'2025-05-13 09:27:36',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: clientclientclient.'),
(17,302,302,0,'2025-05-13 11:08:53',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: sdfsdfdsfdsdfssd.'),
(18,302,302,0,'2025-05-13 16:06:46',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: RKPYT.'),
(19,302,302,0,'2025-05-13 16:33:32',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: dgsfsdfggsdfsgfd.'),
(20,302,302,0,'2025-05-13 16:34:32',0,0,'Не удалось отправить уведомление по электронной почте','При отправке уведомления с данными пользователя произошла ошибка. Пользователь, который пытался зарегистрироваться: dgsfsdfggsdfsgfdsdfg.');
/*!40000 ALTER TABLE `amtf3_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_messages_cfg`
--

DROP TABLE IF EXISTS `amtf3_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_messages_cfg`
--

LOCK TABLES `amtf3_messages_cfg` WRITE;
/*!40000 ALTER TABLE `amtf3_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_modules`
--

DROP TABLE IF EXISTS `amtf3_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_modules`
--

LOCK TABLES `amtf3_modules` WRITE;
/*!40000 ALTER TABLE `amtf3_modules` DISABLE KEYS */;
INSERT INTO `amtf3_modules` VALUES
(1,39,'Main Menu','','',1,'sidebar-right',NULL,NULL,NULL,NULL,1,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"base\":101,\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),
(2,40,'Login','','',1,'login',NULL,NULL,NULL,NULL,1,'mod_login',1,1,'',1,'*'),
(3,41,'Popular Articles','','',6,'cpanel',NULL,NULL,NULL,NULL,1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(4,42,'Recently Added Articles','','',4,'cpanel',NULL,NULL,NULL,NULL,1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(8,43,'Toolbar','','',1,'toolbar',NULL,NULL,NULL,NULL,1,'mod_toolbar',3,1,'',1,'*'),
(9,44,'Notifications','','',3,'icon',NULL,NULL,NULL,NULL,1,'mod_quickicon',3,1,'{\"context\":\"update_quickicon\",\"header_icon\":\"icon-sync\",\"show_jupdate\":\"1\",\"show_eupdate\":\"1\",\"show_oupdate\":\"1\",\"show_privacy\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}',1,'*'),
(10,45,'Logged-in Users','','',2,'cpanel',NULL,NULL,NULL,NULL,1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(12,46,'Admin Menu','','',1,'menu',NULL,NULL,NULL,NULL,1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),
(15,49,'Title','','',1,'title',NULL,NULL,NULL,NULL,1,'mod_title',3,1,'',1,'*'),
(79,52,'Multilanguage status','','',2,'status',NULL,NULL,NULL,NULL,1,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),
(86,53,'Joomla Version','','',1,'status',NULL,NULL,NULL,NULL,1,'mod_version',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),
(87,55,'Sample Data','','',1,'cpanel',NULL,NULL,NULL,NULL,1,'mod_sampledata',6,1,'{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(88,67,'Latest Actions','','',3,'cpanel',NULL,NULL,NULL,NULL,1,'mod_latestactions',6,1,'{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(89,68,'Privacy Dashboard','','',5,'cpanel',NULL,NULL,NULL,NULL,1,'mod_privacy_dashboard',6,1,'{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(90,89,'Login Support','','',1,'sidebar',NULL,NULL,NULL,NULL,1,'mod_loginsupport',1,1,'{\"forum_url\":\"https://forum.joomla.org/\",\"documentation_url\":\"https://docs.joomla.org/\",\"news_url\":\"https://www.joomla.org/announcements.html\",\"automatic_title\":1,\"prepare_content\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',1,'*'),
(91,72,'System Dashboard','','',1,'cpanel-system',NULL,NULL,NULL,NULL,1,'mod_submenu',1,0,'{\"menutype\":\"*\",\"preset\":\"system\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}',1,'*'),
(92,73,'Content Dashboard','','',1,'cpanel-content',NULL,NULL,NULL,NULL,1,'mod_submenu',1,0,'{\"menutype\":\"*\",\"preset\":\"content\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}',1,'*'),
(93,74,'Menus Dashboard','','',1,'cpanel-menus',NULL,NULL,NULL,NULL,1,'mod_submenu',1,0,'{\"menutype\":\"*\",\"preset\":\"menus\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}',1,'*'),
(94,75,'Components Dashboard','','',1,'cpanel-components',NULL,NULL,NULL,NULL,1,'mod_submenu',1,0,'{\"menutype\":\"*\",\"preset\":\"components\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}',1,'*'),
(95,76,'Users Dashboard','','',1,'cpanel-users',NULL,NULL,NULL,NULL,1,'mod_submenu',1,0,'{\"menutype\":\"*\",\"preset\":\"users\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}',1,'*'),
(96,86,'Popular Articles','','',3,'cpanel-content',NULL,NULL,NULL,NULL,1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(97,87,'Recently Added Articles','','',4,'cpanel-content',NULL,NULL,NULL,NULL,1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(98,88,'Logged-in Users','','',2,'cpanel-users',NULL,NULL,NULL,NULL,1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}',1,'*'),
(99,77,'Frontend Link','','',5,'status',NULL,NULL,NULL,NULL,1,'mod_frontend',1,1,'',1,'*'),
(100,78,'Messages','','',4,'status',NULL,NULL,NULL,NULL,1,'mod_messages',3,1,'',1,'*'),
(101,79,'Post Install Messages','','',3,'status',NULL,NULL,NULL,NULL,1,'mod_post_installation_messages',3,1,'',1,'*'),
(102,80,'User Status','','',6,'status',NULL,NULL,NULL,NULL,1,'mod_user',3,1,'',1,'*'),
(103,70,'Site','','',1,'icon',NULL,NULL,NULL,NULL,1,'mod_quickicon',1,1,'{\"context\":\"site_quickicon\",\"header_icon\":\"icon-desktop\",\"show_users\":\"1\",\"show_articles\":\"1\",\"show_categories\":\"1\",\"show_media\":\"1\",\"show_menuItems\":\"1\",\"show_modules\":\"1\",\"show_plugins\":\"1\",\"show_templates\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}',1,'*'),
(104,71,'System','','',2,'icon',NULL,NULL,NULL,NULL,1,'mod_quickicon',1,1,'{\"context\":\"system_quickicon\",\"header_icon\":\"icon-wrench\",\"show_global\":\"1\",\"show_checkin\":\"1\",\"show_cache\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}',1,'*'),
(105,82,'3rd Party','','',4,'icon',NULL,NULL,NULL,NULL,1,'mod_quickicon',1,1,'{\"context\":\"mod_quickicon\",\"header_icon\":\"icon-boxes\",\"load_plugins\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}',1,'*'),
(106,83,'Help Dashboard','','',1,'cpanel-help',NULL,NULL,NULL,NULL,1,'mod_submenu',1,0,'{\"menutype\":\"*\",\"preset\":\"help\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"style\":\"System-none\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}',1,'*'),
(107,84,'Privacy Requests','','',1,'cpanel-privacy',NULL,NULL,NULL,NULL,1,'mod_privacy_dashboard',1,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}',1,'*'),
(108,85,'Privacy Status','','',1,'cpanel-privacy',NULL,NULL,NULL,NULL,1,'mod_privacy_status',1,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}',1,'*'),
(109,96,'Guided Tours','','',1,'status',NULL,NULL,NULL,NULL,1,'mod_guidedtours',1,1,'',1,'*'),
(110,110,'Типы заявок','',NULL,1,'left',NULL,NULL,NULL,NULL,1,'mod_menu',7,1,'{\"menutype\":\"request\",\"base\":119,\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),
(111,113,'Не отображается','',NULL,1,'',NULL,NULL,NULL,NULL,1,'mod_menu',1,1,'{\"menutype\":\"ne-otobrazhaetsya\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),
(112,115,'Заявки','',NULL,1,'left',NULL,NULL,NULL,NULL,1,'mod_menu',7,1,'{\"menutype\":\"zayavki\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),
(113,117,'Работа','',NULL,1,'left',NULL,NULL,NULL,NULL,1,'mod_menu',7,1,'{\"menutype\":\"rabota\",\"base\":\"\",\"startLevel\":1,\"endLevel\":0,\"showAllChildren\":1,\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*');
/*!40000 ALTER TABLE `amtf3_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_modules_menu`
--

DROP TABLE IF EXISTS `amtf3_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT 0,
  `menuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_modules_menu`
--

LOCK TABLES `amtf3_modules_menu` WRITE;
/*!40000 ALTER TABLE `amtf3_modules_menu` DISABLE KEYS */;
INSERT INTO `amtf3_modules_menu` VALUES
(1,0),
(2,0),
(3,0),
(4,0),
(6,0),
(7,0),
(8,0),
(9,0),
(10,0),
(12,0),
(14,0),
(15,0),
(79,0),
(86,0),
(87,0),
(88,0),
(89,0),
(90,0),
(91,0),
(92,0),
(93,0),
(94,0),
(95,0),
(96,0),
(97,0),
(98,0),
(99,0),
(100,0),
(101,0),
(102,0),
(103,0),
(104,0),
(105,0),
(106,0),
(107,0),
(108,0),
(109,0),
(110,116),
(110,118),
(110,119),
(110,122),
(111,0),
(112,107),
(112,123),
(112,124),
(112,125),
(112,126),
(112,127),
(113,128),
(113,129),
(113,131),
(113,132);
/*!40000 ALTER TABLE `amtf3_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_newsfeeds`
--

DROP TABLE IF EXISTS `amtf3_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT 0,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) NOT NULL DEFAULT '',
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `numarticles` int(10) unsigned NOT NULL DEFAULT 1,
  `cache_time` int(10) unsigned NOT NULL DEFAULT 3600,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `metakey` text DEFAULT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_newsfeeds`
--

LOCK TABLES `amtf3_newsfeeds` WRITE;
/*!40000 ALTER TABLE `amtf3_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_overrider`
--

DROP TABLE IF EXISTS `amtf3_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_overrider` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_overrider`
--

LOCK TABLES `amtf3_overrider` WRITE;
/*!40000 ALTER TABLE `amtf3_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_postinstall_messages`
--

DROP TABLE IF EXISTS `amtf3_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT 700 COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(4) NOT NULL DEFAULT 1,
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_postinstall_messages`
--

LOCK TABLES `amtf3_postinstall_messages` WRITE;
/*!40000 ALTER TABLE `amtf3_postinstall_messages` DISABLE KEYS */;
INSERT INTO `amtf3_postinstall_messages` VALUES
(1,241,'COM_CPANEL_WELCOME_BEGINNERS_TITLE','COM_CPANEL_WELCOME_BEGINNERS_MESSAGE','','com_cpanel',1,'message','','','','','3.2.0',2),
(2,241,'COM_CPANEL_MSG_STATS_COLLECTION_TITLE','COM_CPANEL_MSG_STATS_COLLECTION_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/statscollection.php','admin_postinstall_statscollection_condition','3.5.0',2),
(3,241,'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_TITLE','PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_BODY','PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_ACTION','plg_system_httpheaders',1,'action','site://plugins/system/httpheaders/postinstall/introduction.php','httpheaders_postinstall_action','site://plugins/system/httpheaders/postinstall/introduction.php','httpheaders_postinstall_condition','4.0.0',1),
(4,241,'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_TITLE','COM_USERS_POSTINSTALL_MULTIFACTORAUTH_BODY','COM_USERS_POSTINSTALL_MULTIFACTORAUTH_ACTION','com_users',1,'action','admin://components/com_users/postinstall/multifactorauth.php','com_users_postinstall_mfa_action','admin://components/com_users/postinstall/multifactorauth.php','com_users_postinstall_mfa_condition','4.2.0',1);
/*!40000 ALTER TABLE `amtf3_postinstall_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_privacy_consents`
--

DROP TABLE IF EXISTS `amtf3_privacy_consents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_privacy_consents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `remind` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_privacy_consents`
--

LOCK TABLES `amtf3_privacy_consents` WRITE;
/*!40000 ALTER TABLE `amtf3_privacy_consents` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_privacy_consents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_privacy_requests`
--

DROP TABLE IF EXISTS `amtf3_privacy_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_privacy_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `request_type` varchar(25) NOT NULL DEFAULT '',
  `confirm_token` varchar(100) NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_privacy_requests`
--

LOCK TABLES `amtf3_privacy_requests` WRITE;
/*!40000 ALTER TABLE `amtf3_privacy_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_privacy_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_redirect_links`
--

DROP TABLE IF EXISTS `amtf3_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) NOT NULL,
  `new_url` varchar(2048) DEFAULT NULL,
  `referer` varchar(2048) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `header` smallint(6) NOT NULL DEFAULT 301,
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modified` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_redirect_links`
--

LOCK TABLES `amtf3_redirect_links` WRITE;
/*!40000 ALTER TABLE `amtf3_redirect_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_scheduler_logs`
--

DROP TABLE IF EXISTS `amtf3_scheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_scheduler_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) NOT NULL DEFAULT '',
  `tasktype` varchar(128) NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `duration` decimal(5,3) NOT NULL,
  `jobid` int(10) unsigned NOT NULL,
  `taskid` int(10) unsigned NOT NULL,
  `exitcode` int(11) NOT NULL,
  `lastdate` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `nextdate` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  PRIMARY KEY (`id`),
  KEY `idx_taskname` (`taskname`),
  KEY `idx_tasktype` (`tasktype`),
  KEY `idx_lastdate` (`lastdate`),
  KEY `idx_nextdate` (`nextdate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_scheduler_logs`
--

LOCK TABLES `amtf3_scheduler_logs` WRITE;
/*!40000 ALTER TABLE `amtf3_scheduler_logs` DISABLE KEYS */;
INSERT INTO `amtf3_scheduler_logs` VALUES
(1,'Session GC','Удаление данных сессии',0.000,2,1,0,'2025-05-13 08:00:47','2025-05-14 08:00:47'),
(2,'Update Notification','Отправка уведомления об обновлении Joomla',0.318,3,1,0,'2025-05-13 08:00:49','2025-05-14 08:00:50'),
(3,'Session GC','Удаление данных сессии',0.000,2,2,0,'2025-05-14 08:07:37','2025-05-15 08:07:37'),
(4,'Update Notification','Отправка уведомления об обновлении Joomla',0.662,3,2,0,'2025-05-14 08:08:15','2025-05-15 08:08:16');
/*!40000 ALTER TABLE `amtf3_scheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_scheduler_tasks`
--

DROP TABLE IF EXISTS `amtf3_scheduler_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_scheduler_tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(128) NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `execution_rules` text DEFAULT NULL COMMENT 'Execution Rules, Unprocessed',
  `cron_rules` text DEFAULT NULL COMMENT 'Processed execution rules, crontab-like JSON form',
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `last_exit_code` int(11) NOT NULL DEFAULT 0 COMMENT 'Exit code when job was last run',
  `last_execution` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `next_execution` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  `times_executed` int(11) DEFAULT 0 COMMENT 'Count of successful triggers',
  `times_failed` int(11) DEFAULT 0 COMMENT 'Count of failures',
  `locked` datetime DEFAULT NULL,
  `priority` smallint(6) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0 COMMENT 'Configurable list ordering',
  `cli_exclusive` smallint(6) NOT NULL DEFAULT 0 COMMENT 'If 1, the task is only accessible via CLI',
  `params` text NOT NULL,
  `note` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_state` (`state`),
  KEY `idx_last_exit` (`last_exit_code`),
  KEY `idx_next_exec` (`next_execution`),
  KEY `idx_locked` (`locked`),
  KEY `idx_priority` (`priority`),
  KEY `idx_cli_exclusive` (`cli_exclusive`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_scheduler_tasks`
--

LOCK TABLES `amtf3_scheduler_tasks` WRITE;
/*!40000 ALTER TABLE `amtf3_scheduler_tasks` DISABLE KEYS */;
INSERT INTO `amtf3_scheduler_tasks` VALUES
(1,97,'Rotate Logs','rotation.logs','{\"rule-type\":\"interval-days\",\"interval-days\":\"30\",\"exec-day\":\"12\",\"exec-time\":\"08:00\"}','{\"type\":\"interval\",\"exp\":\"P30D\"}',1,0,NULL,'2025-06-11 08:00:00',0,0,NULL,0,0,0,'{\"individual_log\":false,\"log_file\":\"\",\"notifications\":{\"success_mail\":\"0\",\"failure_mail\":\"1\",\"fatal_failure_mail\":\"1\",\"orphan_mail\":\"1\"},\"logstokeep\":1}',NULL,'2025-05-12 08:25:18',302,NULL,NULL),
(2,98,'Session GC','session.gc','{\"rule-type\":\"interval-hours\",\"interval-hours\":\"24\",\"exec-day\":\"01\",\"exec-time\":\"08:00\"}','{\"type\":\"interval\",\"exp\":\"PT24H\"}',1,0,'2025-05-14 08:07:37','2025-05-15 08:07:37',2,0,NULL,0,0,0,'{\"individual_log\":false,\"log_file\":\"\",\"notifications\":{\"success_mail\":\"0\",\"failure_mail\":\"1\",\"fatal_failure_mail\":\"1\",\"orphan_mail\":\"1\"},\"enable_session_gc\":1,\"enable_session_metadata_gc\":1}',NULL,'2025-05-12 08:25:18',302,NULL,NULL),
(3,99,'Update Notification','update.notification','{\"rule-type\":\"interval-hours\",\"interval-hours\":\"24\",\"exec-day\":\"01\",\"exec-time\":\"08:00\"}','{\"type\":\"interval\",\"exp\":\"PT24H\"}',1,0,'2025-05-14 08:08:15','2025-05-15 08:08:16',2,0,NULL,0,0,0,'{\"individual_log\":false,\"log_file\":\"\",\"notifications\":{\"success_mail\":\"0\",\"failure_mail\":\"1\",\"fatal_failure_mail\":\"1\",\"orphan_mail\":\"1\"},\"email\":\"\",\"language_override\":\"\"}',NULL,'2025-05-12 08:25:18',302,NULL,NULL);
/*!40000 ALTER TABLE `amtf3_scheduler_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_schemaorg`
--

DROP TABLE IF EXISTS `amtf3_schemaorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_schemaorg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemId` int(10) unsigned DEFAULT NULL,
  `context` varchar(100) DEFAULT NULL,
  `schemaType` varchar(100) DEFAULT NULL,
  `schema` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_schemaorg`
--

LOCK TABLES `amtf3_schemaorg` WRITE;
/*!40000 ALTER TABLE `amtf3_schemaorg` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_schemaorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_schemas`
--

DROP TABLE IF EXISTS `amtf3_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_schemas`
--

LOCK TABLES `amtf3_schemas` WRITE;
/*!40000 ALTER TABLE `amtf3_schemas` DISABLE KEYS */;
INSERT INTO `amtf3_schemas` VALUES
(241,'5.3.0-2025-03-14');
/*!40000 ALTER TABLE `amtf3_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_session`
--

DROP TABLE IF EXISTS `amtf3_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint(3) unsigned DEFAULT NULL,
  `guest` tinyint(3) unsigned DEFAULT 1,
  `time` int(11) NOT NULL DEFAULT 0,
  `data` mediumtext DEFAULT NULL,
  `userid` int(11) DEFAULT 0,
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`),
  KEY `client_id_guest` (`client_id`,`guest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_session`
--

LOCK TABLES `amtf3_session` WRITE;
/*!40000 ALTER TABLE `amtf3_session` DISABLE KEYS */;
INSERT INTO `amtf3_session` VALUES
('3as1j56he4es7ort302t9dh7pn',0,1,1747211846,'joomla|s:8508:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjg6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzQ3MjExODE2O3M6NDoibGFzdCI7aToxNzQ3MjExODM2O3M6Mzoibm93IjtpOjE3NDcyMTE4NDY7fXM6NzoiY291bnRlciI7aTo3O3M6NToidG9rZW4iO3M6MzI6ImI5MGM0NzMzNDc3YjM3ZjBkZDRkNThhYzJmZGI3ZDcxIjt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MDp7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fXM6MjA6ImNocm9ub2Zvcm1zOF92YXJzXzExIjthOjI6e3M6MTU6ImFwcF9hY3RpdmVfcGFnZSI7czoxOiIxIjtzOjQ6InBocDciO047fXM6MjQ6ImNocm9ub2Zvcm1zOF9lbGVtZW50c18xMSI7YToyOntpOjk7YTo4OntzOjI6ImlkIjtzOjE6IjkiO3M6NjoicGFyZW50IjtzOjE6IjEiO3M6Nzoic2VjdGlvbiI7czo0OiJsb2FkIjtzOjQ6Im5hbWUiO3M6NDoiaHRtbCI7czo0OiJ0eXBlIjtzOjU6InZpZXdzIjtzOjQ6ImNvZGUiO3M6MjYyNDoiPGRpdiBjbGFzcz0id29yay1oZWFkZXIiIHN0eWxlPSJ3aWR0aDogMTAwJTsgYmFja2dyb3VuZDogbGluZWFyLWdyYWRpZW50KDEzNWRlZywgIzFhMWExYSAwJSwgIzJhMmEyYSAxMDAlKTsgY29sb3I6IHdoaXRlOyBwYWRkaW5nOiA4MHB4IDIwcHg7IHRleHQtYWxpZ246IGNlbnRlcjsgbWFyZ2luLWJvdHRvbTogNTBweDsgcG9zaXRpb246IHJlbGF0aXZlOyBvdmVyZmxvdzogaGlkZGVuOyI+DQogICAgDQogICAgPCEtLSDQlNC10LrQvtGA0LDRgtC40LLQvdGL0LUg0Y3Qu9C10LzQtdC90YLRiyAtLT4NCiAgICA8ZGl2IHN0eWxlPSJwb3NpdGlvbjogYWJzb2x1dGU7IHRvcDogLTUwcHg7IGxlZnQ6IC01MHB4OyB3aWR0aDogMjAwcHg7IGhlaWdodDogMjAwcHg7IGJvcmRlci1yYWRpdXM6IDUwJTsgYmFja2dyb3VuZDogcmdiYSgyMzYsNjcsMTUsMC4xKTsiPjwvZGl2Pg0KICAgIDxkaXYgc3R5bGU9InBvc2l0aW9uOiBhYnNvbHV0ZTsgYm90dG9tOiAtMzBweDsgcmlnaHQ6IC0zMHB4OyB3aWR0aDogMTUwcHg7IGhlaWdodDogMTUwcHg7IGJvcmRlci1yYWRpdXM6IDUwJTsgYmFja2dyb3VuZDogcmdiYSgyMzYsNjcsMTUsMC4xKTsiPjwvZGl2Pg0KICAgIA0KICAgIDwhLS0g0J7RgdC90L7QstC90L7QuSDQutC+0L3RgtC10L3RgiAtLT4NCiAgICA8ZGl2IHN0eWxlPSJwb3NpdGlvbjogcmVsYXRpdmU7IHotaW5kZXg6IDI7IG1heC13aWR0aDogMTAwMHB4OyBtYXJnaW46IDAgYXV0bzsiPg0KICAgICAgICA8aDEgc3R5bGU9ImZvbnQtc2l6ZTogMy4yZW07IG1hcmdpbjogMCAwIDIwcHggMDsgZm9udC13ZWlnaHQ6IDcwMDsgdGV4dC1zaGFkb3c6IDAgMnB4IDRweCByZ2JhKDAsMCwwLDAuMyk7Ij4NCiAgICAgICAgICAgINCd0LDRiNCwINGA0LDQsdC+0YLQsA0KICAgICAgICA8L2gxPg0KICAgICAgICANCiAgICAgICAgPGRpdiBzdHlsZT0id2lkdGg6IDgwcHg7IGhlaWdodDogNHB4OyBiYWNrZ3JvdW5kOiAjRUM0MzBGOyBtYXJnaW46IDAgYXV0byAyNXB4OyI+PC9kaXY+DQogICAgICAgIA0KICAgICAgICA8cCBzdHlsZT0iZm9udC1zaXplOiAxLjNlbTsgbGluZS1oZWlnaHQ6IDEuNjsgbWFyZ2luLWJvdHRvbTogMzBweDsgbWF4LXdpZHRoOiA4MDBweDsgbWFyZ2luLWxlZnQ6IGF1dG87IG1hcmdpbi1yaWdodDogYXV0bzsiPg0KICAgICAgICAgICAg0JfQtNC10YHRjCDQvNGLINC00LXQvNC+0L3RgdGC0YDQuNGA0YPQtdC8INC90LDRiNC4INC70YPRh9GI0LjQtSDQv9GA0L7QtdC60YLRiyDQuCDQtNC+0YHRgtC40LbQtdC90LjRjy4g0JrQsNC20LTQsNGPINGA0LDQsdC+0YLQsCAtINGN0YLQviDRgNC10LfRg9C70YzRgtCw0YIgDQogICAgICAgICAgICDQv9GA0L7RhNC10YHRgdC40L7QvdCw0LvRjNC90L7Qs9C+INC/0L7QtNGF0L7QtNCwLg0KICAgICAgICA8L3A+DQogICAgICAgIA0KICAgICAgICA8YSBocmVmPSIjd29yay1saXN0IiBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyBiYWNrZ3JvdW5kOiAjRUM0MzBGOyBjb2xvcjogd2hpdGU7IHBhZGRpbmc6IDEycHggMzBweDsgYm9yZGVyLXJhZGl1czogMzBweDsgdGV4dC1kZWNvcmF0aW9uOiBub25lOyBmb250LXdlaWdodDogNjAwOyB0cmFuc2l0aW9uOiBhbGwgMC4zcyBlYXNlOyBib3gtc2hhZG93OiAwIDRweCA2cHggcmdiYSgwLDAsMCwwLjEpOyIgDQogICAgICAgICAgIG9ubW91c2VvdmVyPSJ0aGlzLnN0eWxlLnRyYW5zZm9ybT0ndHJhbnNsYXRlWSgtM3B4KSc7IHRoaXMuc3R5bGUuYm94U2hhZG93PScwIDZweCAxMHB4IHJnYmEoMjM2LDY3LDE1LDAuMyknOyB0aGlzLnN0eWxlLmJhY2tncm91bmQ9JyNGRjUyMUYnOyIgDQogICAgICAgICAgIG9ubW91c2VvdXQ9InRoaXMuc3R5bGUudHJhbnNmb3JtPSd0cmFuc2xhdGVZKDApJzsgdGhpcy5zdHlsZS5ib3hTaGFkb3c9JzAgNHB4IDZweCByZ2JhKDAsMCwwLDAuMSknOyB0aGlzLnN0eWxlLmJhY2tncm91bmQ9JyNFQzQzMEYnOyI+DQogICAgICAgICAgICDQodC80L7RgtGA0LXRgtGMINGA0LDQsdC+0YLRiw0KICAgICAgICA8L2E+DQogICAgPC9kaXY+DQo8L2Rpdj4NCg0KPCEtLSDQlNC+0L/QvtC70L3QuNGC0LXQu9GM0L3QsNGPINC40L3RhNC+0YDQvNCw0YbQuNGPIC0tPg0KPGRpdiBzdHlsZT0ibWF4LXdpZHRoOiAxMDAwcHg7IG1hcmdpbjogMCBhdXRvIDYwcHg7IHBhZGRpbmc6IDAgMjBweDsgdGV4dC1hbGlnbjogY2VudGVyOyI+DQogICAgPHAgc3R5bGU9ImZvbnQtc2l6ZTogMS4xZW07IGNvbG9yOiAjNTU1OyBsaW5lLWhlaWdodDogMS43OyI+DQogICAgICAgINCc0Ysg0LPQvtGA0LTQuNC80YHRjyDQutCw0LbQtNGL0Lwg0LfQsNCy0LXRgNGI0LXQvdC90YvQvCDQv9GA0L7QtdC60YLQvtC8INC4INGBINGA0LDQtNC+0YHRgtGM0Y4g0LTQtdC70LjQvNGB0Y8g0L3QsNGI0LjQvCDQvtC/0YvRgtC+0LwuIA0KICAgICAgICDQn9GA0L7QutGA0YPRgtC40YLQtSDQstC90LjQtywg0YfRgtC+0LHRiyDRg9Cy0LjQtNC10YLRjCDQv9GA0LjQvNC10YDRiyDQvdCw0YjQtdC5INGA0LDQsdC+0YLRiyENCiAgICA8L3A+DQo8L2Rpdj4NCg0KPCEtLSDQl9C00LXRgdGMINC90LDRh9C40L3QsNC10YLRgdGPINGB0L/QuNGB0L7QuiDRgNCw0LHQvtGCIC0tPg0KPGRpdiBpZD0id29yay1saXN0Ij48L2Rpdj4iO3M6NzoicGFnZV9pZCI7czoxOiIxIjtzOjEyOiJwYWdlX3NlY3Rpb24iO3M6NDoibG9hZCI7fWk6NzthOjk6e3M6MjoiaWQiO3M6MToiNyI7czo2OiJwYXJlbnQiO3M6MToiMSI7czo3OiJzZWN0aW9uIjtzOjQ6ImxvYWQiO3M6NDoibmFtZSI7czozOiJwaHAiO3M6NDoidHlwZSI7czo3OiJhY3Rpb25zIjtzOjg6InNldHRpbmdzIjthOjI6e3M6ODoiZGlzYWJsZWQiO3M6MDoiIjtzOjQ6Im5hbWUiO3M6MDoiIjt9czo0OiJjb2RlIjtzOjI0NjY6Ii8vINCf0L7Qu9GD0YfQsNC10Lwg0LTQsNC90L3Ri9C1INC40Lcg0LHQsNC30Ysg0LTQsNC90L3Ri9GFDQokZGIgPSBKRmFjdG9yeTo6Z2V0RGJvKCk7DQokcXVlcnkgPSAkZGItPmdldFF1ZXJ5KHRydWUpDQogICAgLT5zZWxlY3QoJyonKQ0KICAgIC0+ZnJvbSgkZGItPnF1b3RlTmFtZSgnd29yaycpKQ0KICAgIC0+b3JkZXIoJGRiLT5xdW90ZU5hbWUoJ2lkJykgLiAnIERFU0MnKTsNCg0KJGRiLT5zZXRRdWVyeSgkcXVlcnkpOw0KJHdvcmtzID0gJGRiLT5sb2FkT2JqZWN0TGlzdCgpOw0KDQovLyDQkdCw0LfQvtCy0YvQuSBVUkwg0LTQu9GPINC/0YDQvtCy0LXRgNC60Lgg0LjQt9C+0LHRgNCw0LbQtdC90LjQuQ0KJGJhc2VVcGxvYWRVcmwgPSAnaHR0cDovL21jdS11a2gtbGFiaW5zay50dzEucnUvY29tcG9uZW50cy9jb21fY2hyb25vZm9ybXM4L3VwbG9hZHMvJzsNCg0KLy8g0J/RgNC+0LLQtdGA0Y/QtdC8LCDQtdGB0YLRjCDQu9C4INGA0LXQt9GD0LvRjNGC0LDRgtGLDQppZiAoIWVtcHR5KCR3b3JrcykpIHsNCiAgICBlY2hvICc8ZGl2IGNsYXNzPSJ3b3JrLXBvc3RzLWNvbnRhaW5lciIgc3R5bGU9IndpZHRoOiAxMDAlOyBtYXgtd2lkdGg6IDEwMCU7IG1hcmdpbjogMDsgcGFkZGluZzogMDsgYm94LXNpemluZzogYm9yZGVyLWJveDsiPic7DQogICAgDQogICAgZm9yZWFjaCAoJHdvcmtzIGFzICR3b3JrKSB7DQogICAgICAgIGVjaG8gJzxkaXYgY2xhc3M9IndvcmstcG9zdCIgc3R5bGU9IndpZHRoOiAxMDAlOyBtYXgtd2lkdGg6IDEwMCU7IG1hcmdpbjogMCBhdXRvIDMwcHg7IGJhY2tncm91bmQ6ICNmZmY7IGJvcmRlci1yYWRpdXM6IDA7IGJveC1zaGFkb3c6IDAgMnB4IDE1cHggcmdiYSgwLDAsMCwwLjEpOyBvdmVyZmxvdzogaGlkZGVuOyBib3gtc2l6aW5nOiBib3JkZXItYm94OyI+JzsNCiAgICAgICAgDQogICAgICAgIC8vINCf0YDQvtCy0LXRgNGP0LXQvCDQvdCw0LvQuNGH0LjQtSDQuNC30L7QsdGA0LDQttC10L3QuNGPDQogICAgICAgICRoYXNJbWFnZSA9ICFlbXB0eSgkd29yay0+aW1hZ2VfdXJsKSAmJiAkd29yay0+aW1hZ2VfdXJsICE9ICRiYXNlVXBsb2FkVXJsICYmIGZpbHRlcl92YXIoJHdvcmstPmltYWdlX3VybCwgRklMVEVSX1ZBTElEQVRFX1VSTCk7DQogICAgICAgIA0KICAgICAgICBpZiAoJGhhc0ltYWdlKSB7DQogICAgICAgICAgICBlY2hvICc8ZGl2IGNsYXNzPSJ3b3JrLWltYWdlIiBzdHlsZT0id2lkdGg6IDEwMCU7IG92ZXJmbG93OiBoaWRkZW47IGRpc3BsYXk6IGZsZXg7IGp1c3RpZnktY29udGVudDogY2VudGVyOyBhbGlnbi1pdGVtczogY2VudGVyOyBiYWNrZ3JvdW5kOiAjZjVmNWY1OyI+JzsNCiAgICAgICAgICAgIGVjaG8gJzxpbWcgc3JjPSInIC4gaHRtbHNwZWNpYWxjaGFycygkd29yay0+aW1hZ2VfdXJsKSAuICciIGFsdD0iJyAuIGh0bWxzcGVjaWFsY2hhcnMoJHdvcmstPnRpdGxlKSAuICciIHN0eWxlPSJtYXgtd2lkdGg6IDEwMCU7IGhlaWdodDogYXV0bzsgZGlzcGxheTogYmxvY2s7Ij4nOw0KICAgICAgICAgICAgZWNobyAnPC9kaXY+JzsNCiAgICAgICAgfQ0KICAgICAgICANCiAgICAgICAgZWNobyAnPGRpdiBjbGFzcz0id29yay1jb250ZW50IiBzdHlsZT0icGFkZGluZzogMjBweDsgbWF4LXdpZHRoOiAxMjAwcHg7IG1hcmdpbjogMCBhdXRvOyBib3gtc2l6aW5nOiBib3JkZXItYm94OyI+JzsNCiAgICAgICAgDQogICAgICAgIC8vINCS0YvQstC+0LQg0LfQsNCz0L7Qu9C+0LLQutCwDQogICAgICAgIGVjaG8gJzxoMSBjbGFzcz0id29yay10aXRsZSIgc3R5bGU9Im1hcmdpbjogMCAwIDIwcHggMDsgY29sb3I6ICMyMjI7IGZvbnQtc2l6ZTogY2xhbXAoMS41ZW0sIDV2dywgMi4yZW0pOyI+JyAuIGh0bWxzcGVjaWFsY2hhcnMoJHdvcmstPnRpdGxlKSAuICc8L2gxPic7DQogICAgICAgIA0KICAgICAgICAvLyDQktGL0LLQvtC0INGC0LXQutGB0YLQsA0KICAgICAgICBlY2hvICc8ZGl2IGNsYXNzPSJ3b3JrLXRleHQiIHN0eWxlPSJjb2xvcjogIzQ0NDsgbGluZS1oZWlnaHQ6IDEuNjsgZm9udC1zaXplOiAxZW07Ij4nIC4gJHdvcmstPnRleHQgLiAnPC9kaXY+JzsNCiAgICAgICAgDQogICAgICAgIGVjaG8gJzwvZGl2Pic7IC8vINCX0LDQutGA0YvQstCw0LXQvCB3b3JrLWNvbnRlbnQNCiAgICAgICAgZWNobyAnPC9kaXY+JzsgLy8g0JfQsNC60YDRi9Cy0LDQtdC8IHdvcmstcG9zdA0KICAgIH0NCiAgICANCiAgICBlY2hvICc8L2Rpdj4nOyAvLyDQl9Cw0LrRgNGL0LLQsNC10Lwgd29yay1wb3N0cy1jb250YWluZXINCn0gZWxzZSB7DQogICAgZWNobyAnPHAgc3R5bGU9InRleHQtYWxpZ246IGNlbnRlcjsgcGFkZGluZzogNDBweDsgY29sb3I6ICM2NjY7IHdpZHRoOiAxMDAlOyBmb250LXNpemU6IDEuMmVtOyBib3gtc2l6aW5nOiBib3JkZXItYm94OyI+0J3QtdGCINC00LDQvdC90YvRhSDQviDRgNCw0LHQvtGC0LUg0L7RgNCz0LDQvdC40LfQsNGG0LjQuDwvcD4nOw0KfSI7czo3OiJwYWdlX2lkIjtzOjE6IjEiO3M6MTI6InBhZ2Vfc2VjdGlvbiI7czo0OiJsb2FkIjt9fXM6MjA6ImNocm9ub2Zvcm1zOF9kYXRhXzExIjthOjI6e3M6NDoidmlldyI7czo0OiJmb3JtIjtzOjEwOiJjaHJvbm9mb3JtIjtzOjE5OiJyZWFkLXdvcmstdmlldy1mb3JtIjt9czoxMDoic2VjdG9rZW4xMSI7czoyMzoiNjgyNDU2M2NlNGQ4NTIuMzAzNzM0ODEiO31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9\";',0,''),
('40vq24eeavhf2olb86oa2909vn',0,1,1747211278,'joomla|s:1104:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjQ6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzQ3MjExMjc4O3M6NDoibGFzdCI7aToxNzQ3MjExMjc4O3M6Mzoibm93IjtpOjE3NDcyMTEyNzg7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ1c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJsb2dpbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJmb3JtIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO2E6MTp7czo2OiJyZXR1cm4iO3M6NjE6Imh0dHA6Ly9tY3UtdWtoLWxhYmluc2sudHcxLnJ1L2luZGV4LnBocC92c2UtemF5YXZraT92aWV3PWZvcm0iO319fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO2E6MTp7aTowO2E6Mjp7czo3OiJtZXNzYWdlIjtzOjU1OiLQn9C+0LbQsNC70YPQudGB0YLQsCwg0LLQvtC50LTQuNGC0LUg0LIg0YHQuNGB0YLQtdC80YMuIjtzOjQ6InR5cGUiO3M6NToiZXJyb3IiO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9\";',0,''),
('av39nnrsiaa3cv6aqmvm5tbl82',1,0,1747211708,'joomla|s:2644:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjY6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjEzNjtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE3NDcyMTAxMjk7czo0OiJsYXN0IjtpOjE3NDcyMTE2ODY7czozOiJub3ciO2k6MTc0NzIxMTcwODt9czo1OiJ0b2tlbiI7czozMjoiZWE1ZWJjYjI2ZjRmY2QyMmI1YzkzMjU4MWM2OWU4MzEiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6NDp7czo5OiJjb21fbWVudXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NToiaXRlbXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoibWVudXR5cGUiO3M6MTc6Im5lLW90b2JyYXpoYWV0c3lhIjtzOjk6ImNsaWVudF9pZCI7aTowO3M6MTA6ImxpbWl0c3RhcnQiO2k6MDtzOjQ6Imxpc3QiO2E6NDp7czo5OiJkaXJlY3Rpb24iO3M6MzoiYXNjIjtzOjU6ImxpbWl0IjtpOjIwO3M6ODoib3JkZXJpbmciO3M6NToiYS5sZnQiO3M6NToic3RhcnQiO2Q6MDt9fXM6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJpdGVtIjtPOjg6InN0ZENsYXNzIjo0OntzOjQ6ImRhdGEiO047czo0OiJ0eXBlIjtOO3M6NDoibGluayI7TjtzOjI6ImlkIjthOjA6e319fX1zOjExOiJjb21fbW9kdWxlcyI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjY6Im1vZHVsZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoyOiJpZCI7YTowOnt9czo0OiJkYXRhIjtOO319czozOiJhZGQiO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibW9kdWxlIjtPOjg6InN0ZENsYXNzIjoyOntzOjEyOiJleHRlbnNpb25faWQiO047czo2OiJwYXJhbXMiO047fX1zOjc6Im1vZHVsZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MToiMCI7Tzo4OiJzdGRDbGFzcyI6NDp7czo5OiJjbGllbnRfaWQiO2k6MDtzOjQ6Imxpc3QiO2E6Mjp7czoxMjoiZnVsbG9yZGVyaW5nIjtzOjE0OiJhLnBvc2l0aW9uIEFTQyI7czo1OiJsaW1pdCI7czoyOiIyMCI7fXM6NjoiZmlsdGVyIjthOjY6e3M6Njoic2VhcmNoIjtzOjA6IiI7czo1OiJzdGF0ZSI7czoxOiIqIjtzOjg6InBvc2l0aW9uIjtzOjA6IiI7czo2OiJtb2R1bGUiO3M6MDoiIjtzOjg6Im1lbnVpdGVtIjtzOjA6IiI7czo2OiJhY2Nlc3MiO3M6MDoiIjt9czoxMDoibGltaXRzdGFydCI7aTowO31zOjE6IjEiO086ODoic3RkQ2xhc3MiOjM6e3M6OToiY2xpZW50X2lkIjtpOjE7czoxMDoibGltaXRzdGFydCI7aTowO3M6NDoibGlzdCI7YTo0OntzOjk6ImRpcmVjdGlvbiI7czozOiJhc2MiO3M6NToibGltaXQiO2k6MjA7czo4OiJvcmRlcmluZyI7czoxMDoiYS5wb3NpdGlvbiI7czo1OiJzdGFydCI7ZDowO319fX1zOjEzOiJjb21faW5zdGFsbGVyIjtPOjg6InN0ZENsYXNzIjoyOntzOjc6Im1lc3NhZ2UiO3M6MDoiIjtzOjE3OiJleHRlbnNpb25fbWVzc2FnZSI7czowOiIiO31zOjk6ImNvbV91c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJlZGl0IjtPOjg6InN0ZENsYXNzIjoxOntzOjU6ImxldmVsIjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjA6e31zOjQ6ImRhdGEiO047fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjMwMjt9czo5OiJjb21fdXNlcnMiO086ODoic3RkQ2xhc3MiOjE6e3M6MTE6Im1mYV9jaGVja2VkIjtpOjE7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjA6e319czo1OiJmbGFzaCI7Tzo4OiJzdGRDbGFzcyI6MDp7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9\";',302,'Admin'),
('f9gfvupg73pd86r9s513cuv80h',0,1,1747210289,'joomla|s:700:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzQ3MjEwMjg5O3M6NDoibGFzdCI7aToxNzQ3MjEwMjg5O3M6Mzoibm93IjtpOjE3NDcyMTAyODk7fXM6NToidG9rZW4iO3M6MzI6IjJjMjkxZmUxNmI1OWU2YTk4MDg0ZjFlZjhmMjg5Mzk1Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";',0,''),
('ilqlakj7difjfoo941omh4e4di',0,1,1747211238,'joomla|s:844:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzQ3MjExMjM4O3M6NDoibGFzdCI7aToxNzQ3MjExMjM4O3M6Mzoibm93IjtpOjE3NDcyMTEyMzg7fXM6NToidG9rZW4iO3M6MzI6IjIxMGU3MzViMDY3ZGYwZjYxZjE1NWFjNGM3OWEwZjYxIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidXNlcnMiO086ODoic3RkQ2xhc3MiOjE6e3M6NToibG9naW4iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZm9ybSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJkYXRhIjthOjA6e319fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7TzoyMDoiSm9vbWxhXENNU1xVc2VyXFVzZXIiOjE6e3M6MjoiaWQiO2k6MDt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),
('lkmp7n34ae7f3g7q4kn05av1t8',0,1,1747209423,'joomla|s:700:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzQ3MjA5NDIzO3M6NDoibGFzdCI7aToxNzQ3MjA5NDIzO3M6Mzoibm93IjtpOjE3NDcyMDk0MjM7fXM6NToidG9rZW4iO3M6MzI6Ijc0OTgxMjgxNGJjZGQ5ZGIwY2Y2ZmNjMmZhMzE4ODhkIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";',0,''),
('rchtnvijtqbusjk9mbri6147m4',0,1,1747211238,'joomla|s:1140:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjQ6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzQ3MjExMjM4O3M6NDoibGFzdCI7aToxNzQ3MjExMjM4O3M6Mzoibm93IjtpOjE3NDcyMTEyMzg7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ1c2VycyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJsb2dpbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJmb3JtIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO2E6MTp7czo2OiJyZXR1cm4iO3M6ODY6Imh0dHA6Ly9tY3UtdWtoLWxhYmluc2sudHcxLnJ1L2luZGV4LnBocC92c2UtemF5YXZraT92aWV3PWZvcm0mb3JkZXJfYnk9Y3JlYXRlZF9hdDpkZXNjIjt9fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czoxMjoiACoAc2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjthOjE6e2k6MDthOjI6e3M6NzoibWVzc2FnZSI7czo1NToi0J/QvtC20LDQu9GD0LnRgdGC0LAsINCy0L7QudC00LjRgtC1INCyINGB0LjRgdGC0LXQvNGDLiI7czo0OiJ0eXBlIjtzOjU6ImVycm9yIjt9fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";',0,''),
('rt87b6oc482ghgeehvbhtapnvh',0,1,1747211964,'joomla|s:700:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJjb3VudGVyIjtpOjE7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNzQ3MjExOTYzO3M6NDoibGFzdCI7aToxNzQ3MjExOTYzO3M6Mzoibm93IjtpOjE3NDcyMTE5NjM7fXM6NToidG9rZW4iO3M6MzI6IjJmYWZlOThhNzdhM2VjZjk4MDUzMWUwN2I2YmI5MTViIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6MTI6IgAqAHNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjIwOiJKb29tbGFcQ01TXFVzZXJcVXNlciI6MTp7czoyOiJpZCI7aTowO319czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjEyOiIAKgBzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";',0,'');
/*!40000 ALTER TABLE `amtf3_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_tags`
--

DROP TABLE IF EXISTS `amtf3_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(400) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_tags`
--

LOCK TABLES `amtf3_tags` WRITE;
/*!40000 ALTER TABLE `amtf3_tags` DISABLE KEYS */;
INSERT INTO `amtf3_tags` VALUES
(1,0,0,1,0,'','ROOT','root','','',1,NULL,NULL,1,'','','','',302,'2025-05-12 08:25:18','',302,'2025-05-12 08:25:18','','',0,'*',1,NULL,NULL);
/*!40000 ALTER TABLE `amtf3_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_template_overrides`
--

DROP TABLE IF EXISTS `amtf3_template_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_template_overrides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `hash_id` varchar(255) NOT NULL DEFAULT '',
  `extension_id` int(11) DEFAULT 0,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `action` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_extension_id` (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_template_overrides`
--

LOCK TABLES `amtf3_template_overrides` WRITE;
/*!40000 ALTER TABLE `amtf3_template_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_template_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_template_styles`
--

DROP TABLE IF EXISTS `amtf3_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `inheritable` tinyint(4) NOT NULL DEFAULT 0,
  `parent` varchar(50) DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_client_id` (`client_id`),
  KEY `idx_client_id_home` (`client_id`,`home`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_template_styles`
--

LOCK TABLES `amtf3_template_styles` WRITE;
/*!40000 ALTER TABLE `amtf3_template_styles` DISABLE KEYS */;
INSERT INTO `amtf3_template_styles` VALUES
(10,'atum',1,'1','Atum - Default',1,'','{\"hue\":\"hsl(214, 63%, 20%)\",\"bg-light\":\"#f0f4fb\",\"text-dark\":\"#495057\",\"text-light\":\"#ffffff\",\"link-color\":\"#2a69b8\",\"special-color\":\"#001b4c\",\"colorScheme\":\"os\",\"monochrome\":\"0\",\"loginLogo\":\"\",\"loginLogoAlt\":\"\",\"logoBrandLarge\":\"\",\"logoBrandLargeAlt\":\"\",\"logoBrandSmall\":\"\",\"logoBrandSmallAlt\":\"\"}'),
(11,'cassiopeia',0,'0','Cassiopeia - Default',1,'','{\"brand\":\"1\",\"logoFile\":\"\",\"siteTitle\":\"\",\"siteDescription\":\"\",\"useFontScheme\":\"0\",\"colorName\":\"colors_standard\",\"fluidContainer\":\"0\",\"stickyHeader\":0,\"backTop\":0}'),
(12,'shaper_helixultimate',0,'1','shaper_helixultimate - Default',0,'','{\"logo_type\":\"text\",\"logo_image\":\"\",\"retina_logo\":\"\",\"mobile_logo\":\"\",\"logo_alt\":\"\",\"logo_custom_link\":\"\",\"logo_height\":\"36px\",\"logo_height_sm\":\"36px\",\"logo_height_xs\":\"36px\",\"logo_text\":\"\",\"logo_slogan\":\"\",\"favicon\":\"\",\"predefined_header\":\"1\",\"header_style\":\"3-MinimalLayout\",\"header_height\":\"60px\",\"header_height_sm\":\"\",\"header_height_xs\":\"50px\",\"sticky_header\":\"1\",\"sticky_offset\":\"10\",\"loader_type\":\"circle\",\"container_max_width\":\"\",\"body_bg_image\":\"\",\"body_bg_repeat\":\"inherit\",\"body_bg_position\":\"0 0\",\"body_bg_size\":\"inherit\",\"body_bg_attachment\":\"inherit\",\"copyright_position\":\"footer1\",\"copyright_load_pos\":\"default\",\"copyright\":\"\\u00a9 {year} Your Company. Designed By JoomShaper\",\"social_position\":\"top1\",\"social_load_pos\":\"default\",\"facebook\":\"#\",\"twitter\":\"#\",\"pinterest\":\"#\",\"linkedin\":\"#\",\"dribbble\":\"#\",\"instagram\":\"#\",\"behance\":\"#\",\"youtube\":\"#\",\"flickr\":\"#\",\"skype\":\"pq.softs\",\"whatsapp\":\"#\",\"vk\":\"#\",\"custom\":\"\",\"contact_position\":\"top2\",\"contact_load_pos\":\"default\",\"contact_phone\":\"+228 872 4444\",\"contact_mobile\":\"+775 872 4444\",\"contact_email\":\"contact@email.com\",\"contact_time\":\"\",\"comingsoon_title\":\"Coming Soon Title\",\"comingsoon_content\":\"Coming soon content\",\"comingsoon_date\":\"2025-01-01 00:00:00\",\"comingsoon_logo\":\"\",\"comingsoon_bg_image\":\"\",\"error_logo\":\"\",\"error_bg\":\"\",\"presets-data\":\"{\\\"preset1\\\":{\\\"label\\\":\\\"Preset 1\\\",\\\"default\\\":\\\"#0345BF\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#0345BF\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"logo_text_color\\\":\\\"#0345BF\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#0345BF\\\",\\\"menu_text_active_color\\\":\\\"#0345BF\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#0345BF\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#0345BF\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\",\\\"preset\\\":\\\"preset1\\\"}},\\\"preset2\\\":{\\\"label\\\":\\\"Preset 2\\\",\\\"default\\\":\\\"#ec430f\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#ec430f\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"logo_text_color\\\":\\\"#ec430f\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#ec430f\\\",\\\"menu_text_active_color\\\":\\\"#ec430f\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#ec430f\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#ec430f\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\"}},\\\"preset3\\\":{\\\"label\\\":\\\"Preset 3\\\",\\\"default\\\":\\\"#0fa89d\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#ffffff\\\",\\\"link_color\\\":\\\"#2C5F2D\\\",\\\"link_hover_color\\\":\\\"#fff\\\",\\\"header_bg_color\\\":\\\"#ffffff\\\",\\\"topbar_bg_color\\\":\\\"#03a83a\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#2C5F2D\\\",\\\"menu_text_color\\\":\\\"#03a83a\\\",\\\"menu_text_hover_color\\\":\\\"#030000\\\",\\\"menu_text_active_color\\\":\\\"#063803\\\",\\\"menu_dropdown_bg_color\\\":\\\"#2C5F2D\\\",\\\"menu_dropdown_text_color\\\":\\\"#2C5F2D\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#2C5F2D\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#2C5F2D\\\",\\\"footer_bg_color\\\":\\\"#2C5F2D\\\",\\\"footer_text_color\\\":\\\"#2C5F2D\\\",\\\"footer_link_color\\\":\\\"#2C5F2D\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\"}},\\\"preset4\\\":{\\\"label\\\":\\\"Preset 4\\\",\\\"default\\\":\\\"#4943ac\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset4\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#4943ac\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"logo_text_color\\\":\\\"#4943ac\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#4943ac\\\",\\\"menu_text_active_color\\\":\\\"#4943ac\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#4943ac\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#4943ac\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\"}},\\\"preset5\\\":{\\\"label\\\":\\\"Preset 5\\\",\\\"default\\\":\\\"#00aeef\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset5\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#00aeef\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"logo_text_color\\\":\\\"#00aeef\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#00aeef\\\",\\\"menu_text_active_color\\\":\\\"#00aeef\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#00aeef\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#00aeef\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\"}},\\\"preset6\\\":{\\\"label\\\":\\\"Preset 6\\\",\\\"default\\\":\\\"#f68e13\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset6\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#f68e13\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"logo_text_color\\\":\\\"#f68e13\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#f68e13\\\",\\\"menu_text_active_color\\\":\\\"#f68e13\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#f68e13\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#f68e13\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\"}},\\\"preset7\\\":{\\\"label\\\":\\\"Preset 7\\\",\\\"default\\\":\\\"#2ba84a\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset7\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#2ba84a\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"logo_text_color\\\":\\\"#2ba84a\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#2ba84a\\\",\\\"menu_text_active_color\\\":\\\"#2ba84a\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#2ba84a\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#2ba84a\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\"}},\\\"preset8\\\":{\\\"label\\\":\\\"Preset 8\\\",\\\"default\\\":\\\"#ed145b\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset8\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#ed145b\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"logo_text_color\\\":\\\"#ed145b\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#ed145b\\\",\\\"menu_text_active_color\\\":\\\"#ed145b\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#ed145b\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#ed145b\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\"}}}\",\"preset\":\"{\\\"footer_link_hover_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#A2A2A2\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_bg_color\\\":\\\"#171717\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#ec430f\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#ec430f\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_text_active_color\\\":\\\"#ec430f\\\",\\\"menu_text_hover_color\\\":\\\"#ec430f\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"logo_text_color\\\":\\\"#ec430f\\\",\\\"topbar_text_color\\\":\\\"#AAAAAA\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"link_color\\\":\\\"#ec430f\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset2\\\"}\",\"topbar_bg_color\":\"#333333\",\"topbar_text_color\":\"#aaaaaa\",\"header_bg_color\":\"#ffffff\",\"logo_text_color\":\"#2b2b2b\",\"menu_text_color\":\"#252525\",\"menu_text_hover_color\":\"#0345bf\",\"menu_text_active_color\":\"#0345bf\",\"menu_dropdown_bg_color\":\"#ffffff\",\"menu_dropdown_text_color\":\"#252525\",\"menu_dropdown_text_hover_color\":\"#0345bf\",\"menu_dropdown_text_active_color\":\"#0345bf\",\"offcanvas_menu_icon_color\":\"#000000\",\"offcanvas_menu_bg_color\":\"#ffffff\",\"offcanvas_menu_items_and_items_color\":\"#252525\",\"offcanvas_menu_active_menu_item_color\":\"#252525\",\"text_color\":\"#252525\",\"bg_color\":\"#ffffff\",\"link_color\":\"#0345bf\",\"link_hover_color\":\"#044cd0\",\"footer_bg_color\":\"#171717\",\"footer_text_color\":\"#ffffff\",\"footer_link_color\":\"#a2a2a2\",\"footer_link_hover_color\":\"#ffffff\",\"name\":\"\",\"custom_class\":\"\",\"padding\":\"\",\"margin\":\"\",\"layout\":\"[{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"name\\\":\\\"\\\",\\\"fluidrow\\\":1,\\\"custom_class\\\":\\\"@media (max-width: 768px) {     .sp-mobile-menu .sp-sign-in {         display: block !important;         padding: 10px 15px;         color: #fff;         background: #1976D2;         margin: 5px;         border-radius: 4px;         text-align: center;     } }\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_position\\\":\\\"\\\",\\\"hide_on_phone\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_desktop\\\":0,\\\"hide_on_ex_large_desktop\\\":0,\\\"hide_desktop\\\":0,\\\"hide_small_desktop\\\":0,\\\"hide_tablet\\\":0,\\\"hide_large_mobile\\\":1,\\\"hide_mobile\\\":1,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"column_type\\\":0,\\\"name\\\":\\\"title\\\",\\\"custom_class\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"grid_size\\\":12,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"4+4+4\\\",\\\"settings\\\":{\\\"custom_class\\\":\\\"\\\",\\\"fluidrow\\\":0,\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"link_hover_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"name\\\":\\\"Main Body\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"column_type\\\":0,\\\"name\\\":\\\"left\\\",\\\"custom_class\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"grid_size\\\":4,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"column_type\\\":1,\\\"custom_class\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"grid_size\\\":4}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"column_type\\\":0,\\\"name\\\":\\\"right\\\",\\\"custom_class\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"grid_size\\\":4,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"3+3+3+3\\\",\\\"settings\\\":{\\\"name\\\":\\\"Bottom\\\",\\\"fluidrow\\\":0,\\\"custom_class\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_position\\\":\\\"\\\",\\\"hide_on_phone\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_desktop\\\":0,\\\"hide_on_ex_large_desktop\\\":0,\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"column_type\\\":0,\\\"name\\\":\\\"bottom1\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"sm_col\\\":\\\"col-sm-6\\\",\\\"xs_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"grid_size\\\":3}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"custom_class\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"col-sm-6\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"name\\\":\\\"bottom2\\\",\\\"column_type\\\":0,\\\"grid_size\\\":3}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"grid_size\\\":3,\\\"hide_on_ex_large_desktop\\\":0,\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"xxl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"bottom3\\\",\\\"column_type\\\":0}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"grid_size\\\":3,\\\"hide_on_ex_large_desktop\\\":0,\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"xxl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"bottom4\\\",\\\"column_type\\\":0}}]}]\",\"menu\":\"mainmenu\",\"menu_type\":\"offcanvas\",\"dropdown_width\":\"\",\"menu_animation\":\"menu-animation-fade-up\",\"offcanvas_position\":\"right\",\"offcanvas_style\":\"3-CenterAlign\",\"offcanvas_menu\":\"mainmenu\",\"offcanvas_max_level\":\"0\",\"hu-webfont-size-field\":\"\",\"hu-webfont-size-field-sm\":\"\",\"hu-webfont-size-field-xs\":\"\",\"hu-font-letter-spacing-input\":\"\",\"body_font\":\"{\\\"fontFamily\\\":\\\"Helvetica\\\",\\\"fontSize\\\":\\\"36px\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h1_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h2_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h3_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h4_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h5_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h6_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_navigation_font\":\"1\",\"navigation_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"custom_font\":\"{\\\"fontFamily\\\":\\\"Arial\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"custom_font_selectors\":\"\",\"image_thumbnail_size\":\"600X340\",\"image_small_size\":\"100X100\",\"image_medium_size\":\"300X300\",\"image_large_size\":\"600X600\",\"image_crop_quality\":\"100\",\"blog_list_image\":\"thumbnail\",\"leading_blog_list_image\":\"large\",\"blog_list_type\":\"default\",\"blog_details_image\":\"default\",\"social_share\":\"1\",\"social_share_lists\":[\"facebook\",\"twitter\",\"linkedin\"],\"og_fb_id\":\"\",\"og_twitter_site\":\"\",\"reading_timeline_bg\":\"#0345bf\",\"reading_timeline_height\":\"5px\",\"reading_timeline_position\":\"top\",\"related_article_title\":\"Related Articles\",\"related_article_column\":\"3\",\"related_article_limit\":\"3\",\"related_article_view_type\":\"thumb\",\"comment\":\"disabled\",\"comment_disqus_subdomain\":\"\",\"comment_intensedebate_acc\":\"\",\"comment_facebook_app_id\":\"\",\"comment_facebook_width\":\"100\",\"comment_facebook_number\":\"10\",\"before_head\":\"\",\"after_body\":\"\",\"before_body\":\"\",\"custom_css\":\"body {\\r\\n    min-height: 100vh; \\r\\n    height: auto;\\r\\n}\\r\\n.social-share-block {\\r\\ndisplay: none;\\r\\n}\\r\\n        .ukh-header {\\r\\n            background-color: #EE4412;\\r\\n            color: white;\\r\\n            padding: 20px;\\r\\n            text-align: center;\\r\\n            border-radius: 5px;\\r\\n            margin-bottom: 20px;\\r\\n        }\\r\\n        .ukh-content {\\r\\n            display: flex;\\r\\n            flex-wrap: wrap;\\r\\n            gap: 20px;\\r\\n            margin-bottom: 30px;\\r\\n        }\\r\\n        .ukh-main-text {\\r\\n            flex: 2;\\r\\n            min-width: 300px;\\r\\n            text-align: justify;\\r\\n            line-height: 1.6;\\r\\n        }\\r\\n        .ukh-image {\\r\\n            flex: 1;\\r\\n            min-width: 250px;\\r\\n            text-align: center;\\r\\n        }\\r\\n        .ukh-image img {\\r\\n            max-width: 100%;\\r\\n            height: auto;\\r\\n            border-radius: 5px;\\r\\n            box-shadow: 0 4px 8px rgba(0,0,0,0.1);\\r\\n        }\\r\\n        .ukh-services {\\r\\n            background-color: #f5f5f5;\\r\\n            padding: 20px;\\r\\n            border-radius: 5px;\\r\\n            margin-bottom: 20px;\\r\\n        }\\r\\n        .ukh-services h2 {\\r\\n            color: #EE4412;\\r\\n            border-bottom: 2px solid #EE4412;\\r\\n            padding-bottom: 10px;\\r\\n        }\\r\\n        .ukh-services ul {\\r\\n            list-style-type: none;\\r\\n            padding: 0;\\r\\n        }\\r\\n        .ukh-services li {\\r\\n            padding: 8px 0;\\r\\n            border-bottom: 1px dotted #ccc;\\r\\n        }\\r\\n        .ukh-contact {\\r\\n            background-color: rgba(238, 68, 18, 0.1);;\\r\\n            padding: 20px;\\r\\n            border-radius: 5px;\\r\\n        }\\r\\n        .ukh-contact h2 {\\r\\n            color: #EE4412;\\r\\n        }\\r\\n        .application-form {\\r\\n            max-width: 800px;\\r\\n            margin: 0 auto;\\r\\n            padding: 40px;\\r\\n            background-color: white;\\r\\n            box-shadow: 0 0 20px rgba(0,0,0,0.1);\\r\\n            position: relative;\\r\\n            border: 1px solid #ddd;\\r\\n        }\\r\\n        \\r\\n        .application-form::before {\\r\\n            content: \\\"\\\";\\r\\n            position: absolute;\\r\\n            top: 0;\\r\\n            left: 0;\\r\\n            right: 0;\\r\\n            bottom: 0;\\r\\n            background-image: url(\'images\\/watermark.png\');\\r\\n            background-repeat: no-repeat;\\r\\n            background-position: center;\\r\\n            background-size: 300px;\\r\\n            opacity: 0.1;\\r\\n            z-index: 0;\\r\\n        }\\r\\n        \\r\\n        .form-content {\\r\\n            position: relative;\\r\\n            z-index: 1;\\r\\n        }\\r\\n        \\r\\n        .form-header {\\r\\n            text-align: center;\\r\\n            margin-bottom: 30px;\\r\\n            border-bottom: 2px solid #EE4412;\\r\\n            padding-bottom: 15px;\\r\\n        }\\r\\n        \\r\\n        .form-header h2 {\\r\\n            color: #EE4412;\\r\\n            margin-bottom: 5px;\\r\\n            font-size: 22px;\\r\\n        }\\r\\n        \\r\\n        .form-header p {\\r\\n            font-size: 16px;\\r\\n            margin: 5px 0;\\r\\n        }\\r\\n        \\r\\n        .applicant-info {\\r\\n            margin-bottom: 20px;\\r\\n        }\\r\\n        \\r\\n        .applicant-info p {\\r\\n            margin: 5px 0;\\r\\n        }\\r\\n        \\r\\n        .application-title {\\r\\n            text-align: center;\\r\\n            font-weight: bold;\\r\\n            font-size: 18px;\\r\\n            margin: 25px 0;\\r\\n            text-decoration: underline;\\r\\n        }\\r\\n        \\r\\n        .application-text {\\r\\n            margin-bottom: 30px;\\r\\n            text-align: justify;\\r\\n        }\\r\\n        \\r\\n        .documents-list {\\r\\n            margin: 25px 0 25px 20px;\\r\\n        }\\r\\n        \\r\\n        .documents-list li {\\r\\n            margin-bottom: 8px;\\r\\n        }\\r\\n        \\r\\n        .form-footer {\\r\\n            display: flex;\\r\\n            justify-content: space-between;\\r\\n            margin-top: 50px;\\r\\n        }\\r\\n        \\r\\n        .date-field, .signature-field {\\r\\n            width: 200px;\\r\\n            border-top: 1px solid #333;\\r\\n            padding-top: 5px;\\r\\n            text-align: center;\\r\\n        }\\r\\n        \\r\\n        .stamp-place {\\r\\n            width: 150px;\\r\\n            height: 100px;\\r\\n            border: 1px dashed #999;\\r\\n            margin: 0 auto;\\r\\n            display: flex;\\r\\n            align-items: center;\\r\\n            justify-content: center;\\r\\n            color: #999;\\r\\n            font-size: 14px;\\r\\n        }\\r\\n        \\r\\n        @media print {\\r\\n            body {\\r\\n                background-color: white;\\r\\n                padding: 0;\\r\\n            }\\r\\n            \\r\\n            .application-form {\\r\\n                box-shadow: none;\\r\\n                border: none;\\r\\n                padding: 20px;\\r\\n            }\\r\\n        }\\r\\n\\r\\njoomla-alert {\\r\\n\\r\\n}\\r\\n#sp-main-body {\\r\\npadding: 30px 0;\\r\\nheight: 100%;\\r\\n}\\r\\n.body-wrapper {\\r\\n    min-height: 100vh; \\r\\n    height: auto;\\r\\n}\\r\\n.body-innerwrapper {\\r\\n    min-height: 100vh; \\r\\n    height: auto;\\r\\n}\",\"custom_js\":\"\",\"exclude_js\":\"\",\"scssoption\":\"1\",\"enable_fontawesome\":\"1\",\"gfont_api\":\"\",\"ga_code\":\"\",\"ga_tracking_method\":\"\",\"id\":\"12\",\"template\":\"shaper_helixultimate\",\"client_id\":\"0\",\"home\":\"1\",\"title\":\"shaper_helixultimate - Default\"}');
/*!40000 ALTER TABLE `amtf3_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_tuf_metadata`
--

DROP TABLE IF EXISTS `amtf3_tuf_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_tuf_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT 0,
  `root` text DEFAULT NULL,
  `targets` text DEFAULT NULL,
  `snapshot` text DEFAULT NULL,
  `timestamp` text DEFAULT NULL,
  `mirrors` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Secure TUF Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_tuf_metadata`
--

LOCK TABLES `amtf3_tuf_metadata` WRITE;
/*!40000 ALTER TABLE `amtf3_tuf_metadata` DISABLE KEYS */;
INSERT INTO `amtf3_tuf_metadata` VALUES
(1,1,'{\"signed\":{\"_type\":\"root\",\"spec_version\":\"1.0\",\"version\":6,\"expires\":\"2026-01-04T10:59:13Z\",\"keys\":{\"07eb082f367c034a95878687f6648aa76d93652b6ee73e58817053d89af6c44f\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"9b2af2d9b9727227735253d795bd27ea8f0e294a5f3603e822dc5052b44802b9\"}},\"1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"a18e5ebabc19d5d5984b601a292ece61ba3662ab2d071dc520da5bd4f8948799\"}},\"2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"cb0a7a131961a20edea051d6dc2b091fb650bd399bd8514adb67b3c60db9f8f9\"}},\"31dd7c7290d664c9b88c0dead2697175293ea7df81b7f24153a37370fd3901c3\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"589d029a68b470deff1ca16dbf3eea6b5b3fcba0ae7bb52c468abc7fb058b2a2\"}},\"9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"6043c8bacc76ac5c9750f45454dd865c6ca1fc57d69e14cc192cfd420f6a66a9\"}},\"9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"a4b8509488f1c29ab0b1f610e7452fbec78b4f33f1fba5a418d6ff087c567429\"}},\"bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"6eb44460e5914e8e0df726ddb90bd1f3771b8ce5af19b40fb01ac5a85b023a6f\"}},\"e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"ad1950e117b29ebe7a38635a2e574123e07571e4f9a011783e053b5f15d2562a\"}},\"ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e\":{\"keytype\":\"ed25519\",\"scheme\":\"ed25519\",\"keyid_hash_algorithms\":[\"sha256\",\"sha512\"],\"keyval\":{\"public\":\"5d451915bc2b93a0e4e4745bc6a8b292d58996d50e0fb66c78c7827152a65879\"}}},\"roles\":{\"root\":{\"keyids\":[\"1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669\",\"2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e\"],\"threshold\":1},\"snapshot\":{\"keyids\":[\"07eb082f367c034a95878687f6648aa76d93652b6ee73e58817053d89af6c44f\",\"2dcaf3d0e552f150792f7c636d45429246dcfa34ac35b46a44f5c87cd17d457e\",\"ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e\",\"e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b\",\"bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9\",\"9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe\"],\"threshold\":1},\"targets\":{\"keyids\":[\"31dd7c7290d664c9b88c0dead2697175293ea7df81b7f24153a37370fd3901c3\",\"ecc851a051c8d6439331ff0a37c7727321fc39896a34f950f73638b8a7cb472e\",\"e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b\",\"bfee044dd4574a281c9b7c0b6829913ef292c66c0512d1091a298cfca8493da9\",\"9eabc37383b243cd236375c66693db385911914b52556e1ec05fc70ed45e1bfe\"],\"threshold\":1},\"timestamp\":{\"keyids\":[\"9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc\"],\"threshold\":1}},\"consistent_snapshot\":true},\"signatures\":[{\"keyid\":\"1b1b1dd55b2c1c7258714cf1c1ae06f23e4607b28c762d016a9d81c48ffe5669\",\"sig\":\"ba9fc6e7ff7a8b85d8c60eb0319e6be7a501aba26898ed1ad64db6726b5315f3f426fcf29e632f2cbdb83a888324a1a0963d3145e0a0b34803be4c6e20732d0d\"}]}','{\"signed\":{\"_type\":\"targets\",\"spec_version\":\"1.0\",\"version\":45,\"expires\":\"2025-07-15T15:52:29Z\",\"targets\":{\"Joomla_5.1.2-Stable-Upgrade_Package.zip\":{\"length\":28134889,\"hashes\":{\"sha512\":\"d6b46cdedb9b31d01a607fe4c2f3a830a3265ed6ae5c0cb7b0f836b1b016ee7c639bd8948df00baf1b61a87f2fc71368a80b39e67ef9ec2b8842ee0ab09a620f\"},\"custom\":{\"client\":\"site\",\"description\":\"Joomla! 5.1.2 Release\",\"downloads\":[{\"url\":\"https://downloads.joomla.org/cms/joomla5/5-1-2/Joomla_5.1.2-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"},{\"url\":\"https://github.com/joomla/joomla-cms/releases/download/5.1.2/Joomla_5.1.2-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"},{\"url\":\"https://update.joomla.org/releases/5.1.2/Joomla_5.1.2-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"}],\"element\":\"joomla\",\"infourl\":{\"url\":\"https://www.joomla.org/announcements/release-news/5909-joomla-5-1-2-and-joomla-4-4-6-security-and-bug-fix-release.html\",\"title\":\"Joomla! 5.1.2 Release\"},\"maintainer\":\"Joomla! Production Department\",\"maintainerurl\":\"https://www.joomla.org\",\"name\":\"Joomla! 5.1.2\",\"php_minimum\":\"8.1.0\",\"channel\":\"6.x\",\"stability\":\"Stable\",\"supported_databases\":{\"mariadb\":\"10.4\",\"mysql\":\"8.0.13\",\"postgresql\":\"11.0\"},\"targetplatform\":{\"name\":\"joomla\",\"version\":\"(5\\\\.[0-4])|^(4\\\\.4)\"},\"type\":\"file\",\"version\":\"5.1.2\"}},\"Joomla_5.2.6-Stable-Update_Package.zip\":{\"length\":28858320,\"hashes\":{\"sha512\":\"6a3d43d074e52d700c9c979f48707ac1cbcffb4a10a93b5b719250b131a0951a2202db6cc47875b702012a63db6a7df71d358b49d034b0bb28954ebdb009145c\"},\"custom\":{\"client\":\"site\",\"description\":\"Joomla! 5.2.6 Release\",\"downloads\":[{\"url\":\"https://downloads.joomla.org/cms/joomla5/5-2-6/Joomla_5.2.6-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"},{\"url\":\"https://github.com/joomla/joomla-cms/releases/download/5.2.6/Joomla_5.2.6-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"},{\"url\":\"https://update.joomla.org/releases/5.2.6/Joomla_5.2.6-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"}],\"element\":\"joomla\",\"infourl\":{\"url\":\"https://www.joomla.org/announcements/release-news/5925-joomla-5-2-6-security-release.html\",\"title\":\"Joomla! 5.2.6 Release\"},\"maintainer\":\"Joomla! Production Department\",\"maintainerurl\":\"https://www.joomla.org\",\"name\":\"Joomla! 5.2.6\",\"php_minimum\":\"8.1.0\",\"channel\":\"5.x\",\"stability\":\"Stable\",\"supported_databases\":{\"mariadb\":\"10.4\",\"mysql\":\"8.0.13\",\"postgresql\":\"11.0\"},\"targetplatform\":{\"name\":\"joomla\",\"version\":\"(5\\\\.[0-4])|^(4\\\\.4)\"},\"type\":\"file\",\"version\":\"5.2.6\"}},\"Joomla_5.3.0-Stable-Update_Package.zip\":{\"length\":29094600,\"hashes\":{\"sha512\":\"6c97969b1d4c18cd64db20f49d82e4a5b8a32c563422a2b5608a5707d5425d1b7d9d3a344b2dc15f3b505e3bf198fabbbb1137cc93ced74c1de632139384efb0\"},\"custom\":{\"client\":\"site\",\"description\":\"Joomla! 5.3.0 Release\",\"downloads\":[{\"url\":\"https://downloads.joomla.org/cms/joomla5/5-3-0/Joomla_5.3.0-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"},{\"url\":\"https://github.com/joomla/joomla-cms/releases/download/5.3.0/Joomla_5.3.0-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"},{\"url\":\"https://update.joomla.org/releases/5.3.0/Joomla_5.3.0-Stable-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"}],\"element\":\"joomla\",\"infourl\":{\"url\":\"https://www.joomla.org/announcements/release-news/5927-joomla-5-3-is-here.html\",\"title\":\"Joomla! 5.3.0 Release\"},\"maintainer\":\"Joomla! Production Department\",\"maintainerurl\":\"https://www.joomla.org\",\"name\":\"Joomla! 5.3.0\",\"php_minimum\":\"8.1.0\",\"channel\":\"5.x\",\"stability\":\"Stable\",\"supported_databases\":{\"mariadb\":\"10.4\",\"mysql\":\"8.0.13\",\"postgresql\":\"11.0\"},\"targetplatform\":{\"name\":\"joomla\",\"version\":\"(5\\\\.[0-4])|^(4\\\\.4)\"},\"type\":\"file\",\"version\":\"5.3.0\"}},\"Joomla_5.3.0-rc1-Release_Candidate-Update_Package.zip\":{\"length\":29060802,\"hashes\":{\"sha512\":\"498b052058fc0d4a28c8466d9db7fe8d97cbe4cf491d78cbab78d3aa66b888f30fb1fa71de1dfe26c0fd244c51dc8c7be6ba80750100ab6132eb57df444f2f53\"},\"custom\":{\"client\":\"site\",\"description\":\"Joomla! 5.3.0-rc1 Release\",\"downloads\":[{\"url\":\"https://github.com/joomla/joomla-cms/releases/download/5.3.0-rc1/Joomla_5.3.0-rc1-Release_Candidate-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"}],\"element\":\"joomla\",\"infourl\":{\"url\":\"https://www.joomla.org/announcements/release-news/5923-joomla-5-3-0-release-candidate.html\",\"title\":\"Joomla! 5.3.0-rc1 Release\"},\"maintainer\":\"Joomla! Production Department\",\"maintainerurl\":\"https://www.joomla.org\",\"name\":\"Joomla! 5.3.0-rc1\",\"php_minimum\":\"8.1.0\",\"channel\":\"5.x\",\"stability\":\"RC\",\"supported_databases\":{\"mariadb\":\"10.4\",\"mysql\":\"8.0.13\",\"postgresql\":\"11.0\"},\"targetplatform\":{\"name\":\"joomla\",\"version\":\"(5\\\\.[0-4])|^(4\\\\.4)\"},\"type\":\"file\",\"version\":\"5.3.0-rc1\"}},\"Joomla_5.3.0-rc2-Release_Candidate-Update_Package.zip\":{\"length\":29075074,\"hashes\":{\"sha512\":\"9ecebc56f171d16ce65f9199393093201c2a34b02447dfed5703549821b21eec311da7cfdde899dd6dd9a3b823624901f351dd3c70ea7215e1b190480f30fbdb\"},\"custom\":{\"client\":\"site\",\"description\":\"Joomla! 5.3.0-rc2 Release Candidate\",\"downloads\":[{\"url\":\"https://github.com/joomla/joomla-cms/releases/download/5.3.0-rc2/Joomla_5.3.0-rc2-Release_Candidate-Update_Package.zip\",\"format\":\"zip\",\"type\":\"full\"}],\"element\":\"joomla\",\"infourl\":{\"url\":\"https://www.joomla.org/announcements/release-news/5924-joomla-5-3-0-release-candidate-2.html\",\"title\":\"Joomla! 5.3.0-rc2 Release Candidate\"},\"maintainer\":\"Joomla! Production Department\",\"maintainerurl\":\"https://www.joomla.org\",\"name\":\"Joomla! 5.3.0-rc2\",\"php_minimum\":\"8.1.0\",\"channel\":\"5.x\",\"stability\":\"RC\",\"supported_databases\":{\"mariadb\":\"10.4\",\"mysql\":\"8.0.13\",\"postgresql\":\"11.0\"},\"targetplatform\":{\"name\":\"joomla\",\"version\":\"(5\\\\.[0-4])|^(4\\\\.4)\"},\"type\":\"file\",\"version\":\"5.3.0-rc2\"}}}},\"signatures\":[{\"keyid\":\"e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b\",\"sig\":\"95d8905d3cd5b4159fe71f8b8442abb7f9aad4914c9efca4dbd5d61cf1be4bf53274e4e5f1482762c317bd448bc5787dc3a3b138331dad1fce9e7f9393e0ae06\"},{\"keyid\":\"31dd7c7290d664c9b88c0dead2697175293ea7df81b7f24153a37370fd3901c3\",\"sig\":\"98909c1a4e5997749d303c22450119738b13c2e7ae797837fe8d675a6b31b0751773f96f0cb09f3c45a887d3ce976f9565dabe612bf821843867bf000bb48c09\"}]}','{\"signed\":{\"_type\":\"snapshot\",\"spec_version\":\"1.0\",\"version\":50,\"expires\":\"2025-11-11T15:57:56Z\",\"meta\":{\"targets.json\":{\"length\":6104,\"hashes\":{\"sha512\":\"28f0c208b4ebadbdbf8809fc847fe4e5b59965567e40362b1b9c7ca0b3df4130cf6dbf9524c8a0ae7e65c98ed4c6ede23874f5eaff1e0b20ae7b7144efbb01a9\"},\"version\":45}}},\"signatures\":[{\"keyid\":\"e2229942b0fc1e6d7f82adf258e5bdadac10046d1470b7ec459c9eb4e076026b\",\"sig\":\"918c5d8a068c91f4e51303b1c56326db01f8025ee7b30c113ba7e47eee614ea78657e6d8f8e0f730c6efd965a558062d43bc38069dfe5929470859982449a304\"}]}','{\"signed\":{\"_type\":\"timestamp\",\"spec_version\":\"1.0\",\"version\":578,\"expires\":\"2025-05-16T01:37:02Z\",\"meta\":{\"snapshot.json\":{\"length\":531,\"hashes\":{\"sha512\":\"1346dde0dbd5e8fcc7760ffd68e3346f5b9a9ce4f9f0a398abb6d1bca68ce3803645172bf54aa1af52859a2ad1e73b027ea788f88058cc897e9952e3db2670b6\"},\"version\":50}}},\"signatures\":[{\"keyid\":\"9e41a9d62d94c6a1c8a304f62c5bd72d84a9f286f27e8327cedeacb09e5156cc\",\"sig\":\"c0d1599153ea62ae1b34913878555bcb6cbe257fd8b180de88aea84091db9aff9f4d33f7717e561e662f130c03bc12524605efbb504efda4b5896766cfe48201\"}]}',NULL);
/*!40000 ALTER TABLE `amtf3_tuf_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_ucm_base`
--

DROP TABLE IF EXISTS `amtf3_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(11) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_ucm_base`
--

LOCK TABLES `amtf3_ucm_base` WRITE;
/*!40000 ALTER TABLE `amtf3_ucm_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_ucm_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_ucm_content`
--

DROP TABLE IF EXISTS `amtf3_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext DEFAULT NULL,
  `core_state` tinyint(4) NOT NULL DEFAULT 0,
  `core_checked_out_time` datetime DEFAULT NULL,
  `core_checked_out_user_id` int(10) unsigned DEFAULT NULL,
  `core_access` int(10) unsigned NOT NULL DEFAULT 0,
  `core_params` text DEFAULT NULL,
  `core_featured` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `core_metadata` varchar(2048) NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL,
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL,
  `core_language` char(7) NOT NULL DEFAULT '',
  `core_publish_up` datetime DEFAULT NULL,
  `core_publish_down` datetime DEFAULT NULL,
  `core_content_item_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `core_images` text DEFAULT NULL,
  `core_urls` text DEFAULT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `core_version` int(10) unsigned NOT NULL DEFAULT 1,
  `core_ordering` int(11) NOT NULL DEFAULT 0,
  `core_metakey` text DEFAULT NULL,
  `core_metadesc` text DEFAULT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT 0,
  `core_type_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_ucm_content`
--

LOCK TABLES `amtf3_ucm_content` WRITE;
/*!40000 ALTER TABLE `amtf3_ucm_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_ucm_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_update_sites`
--

DROP TABLE IF EXISTS `amtf3_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT 0,
  `last_check_timestamp` bigint(20) DEFAULT 0,
  `extra_query` varchar(1000) DEFAULT '',
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_update_sites`
--

LOCK TABLES `amtf3_update_sites` WRITE;
/*!40000 ALTER TABLE `amtf3_update_sites` DISABLE KEYS */;
INSERT INTO `amtf3_update_sites` VALUES
(1,'Joomla! Core','tuf','https://update.joomla.org/cms/',1,1747210096,'',NULL,NULL),
(2,'Accredited Joomla! Translations','collection','https://update.joomla.org/language/translationlist_5.xml',1,1747210147,'',NULL,NULL),
(3,'Joomla! Update Component','extension','https://update.joomla.org/core/extensions/com_joomlaupdate.xml',1,1747210147,'',NULL,NULL),
(4,'System - Helix Ultimate Framework','extension','http://www.joomshaper.com/updates/plg-system-helixultimate.xml',1,1747210148,'',NULL,NULL),
(5,'shaper_helixultimate','extension','https://www.joomshaper.com/updates/shaper-helixultimate.xml',1,1747210148,'',NULL,NULL),
(13,'Chrono library update server','library','https://www.chronoengine.com/chrono_joomla_updates/chrono_lib.xml',1,1747210148,'',NULL,NULL),
(14,'ChronoForms v8 update server','extension','https://www.chronoengine.com/chrono_joomla_updates/chronoforms8.xml',1,1747210148,'',NULL,NULL);
/*!40000 ALTER TABLE `amtf3_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_update_sites_extensions`
--

DROP TABLE IF EXISTS `amtf3_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT 0,
  `extension_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_update_sites_extensions`
--

LOCK TABLES `amtf3_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `amtf3_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `amtf3_update_sites_extensions` VALUES
(1,241),
(2,242),
(2,249),
(3,24),
(4,251),
(5,252),
(13,262),
(14,263);
/*!40000 ALTER TABLE `amtf3_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_updates`
--

DROP TABLE IF EXISTS `amtf3_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT 0,
  `extension_id` int(11) DEFAULT 0,
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(4) DEFAULT 0,
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `changelogurl` text DEFAULT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=840 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_updates`
--

LOCK TABLES `amtf3_updates` WRITE;
/*!40000 ALTER TABLE `amtf3_updates` DISABLE KEYS */;
INSERT INTO `amtf3_updates` VALUES
(788,2,0,'Afrikaans','','pkg_af-ZA','package','',0,'5.0.2.1','','https://update.joomla.org/language/details5/af-ZA_details.xml','','',''),
(789,2,0,'Belarusian','','pkg_be-BY','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/be-BY_details.xml','','',''),
(790,2,0,'Bulgarian','','pkg_bg-BG','package','',0,'5.3.1.2','','https://update.joomla.org/language/details5/bg-BG_details.xml','','',''),
(791,2,0,'Catalan','','pkg_ca-ES','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/ca-ES_details.xml','','',''),
(792,2,0,'Chinese, Simplified','','pkg_zh-CN','package','',0,'5.1.2.1','','https://update.joomla.org/language/details5/zh-CN_details.xml','','',''),
(793,2,0,'Chinese, Traditional','','pkg_zh-TW','package','',0,'5.0.3.1','','https://update.joomla.org/language/details5/zh-TW_details.xml','','',''),
(794,2,0,'Croatian','','pkg_hr-HR','package','',0,'5.2.1.1','','https://update.joomla.org/language/details5/hr-HR_details.xml','','',''),
(795,2,0,'Czech','','pkg_cs-CZ','package','',0,'5.3.1.1','','https://update.joomla.org/language/details5/cs-CZ_details.xml','','',''),
(796,2,0,'Danish','','pkg_da-DK','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/da-DK_details.xml','','',''),
(797,2,0,'Dutch','','pkg_nl-NL','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/nl-NL_details.xml','','',''),
(798,2,0,'English, Australia','','pkg_en-AU','package','',0,'5.0.3.1','','https://update.joomla.org/language/details5/en-AU_details.xml','','',''),
(799,2,0,'English, Canada','','pkg_en-CA','package','',0,'5.2.4.1','','https://update.joomla.org/language/details5/en-CA_details.xml','','',''),
(800,2,0,'English, New Zealand','','pkg_en-NZ','package','',0,'5.2.4.1','','https://update.joomla.org/language/details5/en-NZ_details.xml','','',''),
(801,2,0,'English, USA','','pkg_en-US','package','',0,'5.2.4.1','','https://update.joomla.org/language/details5/en-US_details.xml','','',''),
(802,2,0,'Estonian','','pkg_et-EE','package','',0,'5.2.5.1','','https://update.joomla.org/language/details5/et-EE_details.xml','','',''),
(803,2,0,'Finnish','','pkg_fi-FI','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/fi-FI_details.xml','','',''),
(804,2,0,'Flemish','','pkg_nl-BE','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/nl-BE_details.xml','','',''),
(805,2,0,'French','','pkg_fr-FR','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/fr-FR_details.xml','','',''),
(806,2,0,'French, Canada','','pkg_fr-CA','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/fr-CA_details.xml','','',''),
(807,2,0,'Georgian','','pkg_ka-GE','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/ka-GE_details.xml','','',''),
(808,2,0,'German','','pkg_de-DE','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/de-DE_details.xml','','',''),
(809,2,0,'German, Austria','','pkg_de-AT','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/de-AT_details.xml','','',''),
(810,2,0,'German, Liechtenstein','','pkg_de-LI','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/de-LI_details.xml','','',''),
(811,2,0,'German, Luxembourg','','pkg_de-LU','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/de-LU_details.xml','','',''),
(812,2,0,'German, Switzerland','','pkg_de-CH','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/de-CH_details.xml','','',''),
(813,2,0,'Greek','','pkg_el-GR','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/el-GR_details.xml','','',''),
(814,2,0,'Hungarian','','pkg_hu-HU','package','',0,'5.2.4.1','','https://update.joomla.org/language/details5/hu-HU_details.xml','','',''),
(815,2,0,'Italian','','pkg_it-IT','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/it-IT_details.xml','','',''),
(816,2,0,'Japanese','','pkg_ja-JP','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/ja-JP_details.xml','','',''),
(817,2,0,'Kazakh','','pkg_kk-KZ','package','',0,'5.0.0.4','','https://update.joomla.org/language/details5/kk-KZ_details.xml','','',''),
(818,2,0,'Korean','','pkg_ko-KR','package','',0,'5.0.2.1','','https://update.joomla.org/language/details5/ko-KR_details.xml','','',''),
(819,2,0,'Latvian','','pkg_lv-LV','package','',0,'5.2.4.1','','https://update.joomla.org/language/details5/lv-LV_details.xml','','',''),
(820,2,0,'Lithuanian','','pkg_lt-LT','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/lt-LT_details.xml','','',''),
(821,2,0,'Norwegian Bokmål','','pkg_nb-NO','package','',0,'5.2.3.1','','https://update.joomla.org/language/details5/nb-NO_details.xml','','',''),
(822,2,0,'Pashto Afghanistan','','pkg_ps-AF','package','',0,'5.0.1.1','','https://update.joomla.org/language/details5/ps-AF_details.xml','','',''),
(823,2,0,'Persian Farsi','','pkg_fa-IR','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/fa-IR_details.xml','','',''),
(824,2,0,'Polish','','pkg_pl-PL','package','',0,'5.2.4.1','','https://update.joomla.org/language/details5/pl-PL_details.xml','','',''),
(825,2,0,'Portuguese, Brazil','','pkg_pt-BR','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/pt-BR_details.xml','','',''),
(826,2,0,'Portuguese, Portugal','','pkg_pt-PT','package','',0,'5.2.2.1','','https://update.joomla.org/language/details5/pt-PT_details.xml','','',''),
(827,2,0,'Romanian','','pkg_ro-RO','package','',0,'5.2.0.2','','https://update.joomla.org/language/details5/ro-RO_details.xml','','',''),
(828,2,0,'Serbian, Cyrillic','','pkg_sr-RS','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/sr-RS_details.xml','','',''),
(829,2,0,'Serbian, Latin','','pkg_sr-YU','package','',0,'5.2.3.1','','https://update.joomla.org/language/details5/sr-YU_details.xml','','',''),
(830,2,0,'Slovak','','pkg_sk-SK','package','',0,'5.2.6.1','','https://update.joomla.org/language/details5/sk-SK_details.xml','','',''),
(831,2,0,'Slovenian','','pkg_sl-SI','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/sl-SI_details.xml','','',''),
(832,2,0,'Spanish','','pkg_es-ES','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/es-ES_details.xml','','',''),
(833,2,0,'Swedish','','pkg_sv-SE','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/sv-SE_details.xml','','',''),
(834,2,0,'Tamil, India','','pkg_ta-IN','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/ta-IN_details.xml','','',''),
(835,2,0,'Thai','','pkg_th-TH','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/th-TH_details.xml','','',''),
(836,2,0,'Turkish','','pkg_tr-TR','package','',0,'5.3.0.1','','https://update.joomla.org/language/details5/tr-TR_details.xml','','',''),
(837,2,0,'Ukrainian','','pkg_uk-UA','package','',0,'5.1.3.1','','https://update.joomla.org/language/details5/uk-UA_details.xml','','',''),
(838,2,0,'Urdu, Pakistan','','pkg_ur-PK','package','',0,'5.1.2.1','','https://update.joomla.org/language/details5/ur-PK_details.xml','','',''),
(839,2,0,'Welsh','','pkg_cy-GB','package','',0,'5.3.0.2','','https://update.joomla.org/language/details5/cy-GB_details.xml','','','');
/*!40000 ALTER TABLE `amtf3_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_user_keys`
--

DROP TABLE IF EXISTS `amtf3_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(191) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_user_keys`
--

LOCK TABLES `amtf3_user_keys` WRITE;
/*!40000 ALTER TABLE `amtf3_user_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_user_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_user_mfa`
--

DROP TABLE IF EXISTS `amtf3_user_mfa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_user_mfa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `method` varchar(100) NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `options` mediumtext NOT NULL,
  `created_on` datetime NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `tries` int(11) NOT NULL DEFAULT 0,
  `last_try` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Multi-factor Authentication settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_user_mfa`
--

LOCK TABLES `amtf3_user_mfa` WRITE;
/*!40000 ALTER TABLE `amtf3_user_mfa` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_user_mfa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_user_notes`
--

DROP TABLE IF EXISTS `amtf3_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `review_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_user_notes`
--

LOCK TABLES `amtf3_user_notes` WRITE;
/*!40000 ALTER TABLE `amtf3_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_user_profiles`
--

DROP TABLE IF EXISTS `amtf3_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_user_profiles`
--

LOCK TABLES `amtf3_user_profiles` WRITE;
/*!40000 ALTER TABLE `amtf3_user_profiles` DISABLE KEYS */;
INSERT INTO `amtf3_user_profiles` VALUES
(302,'guidedtour.id.12','{\"state\":\"skipped\"}',0),
(302,'joomlatoken.enabled','1',2),
(302,'joomlatoken.token','s6Hcq/LW96f9tSfW/NLIk1P3WEvQ7BngNDUAEbvUALM=',1);
/*!40000 ALTER TABLE `amtf3_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_user_usergroup_map`
--

DROP TABLE IF EXISTS `amtf3_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_user_usergroup_map`
--

LOCK TABLES `amtf3_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `amtf3_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `amtf3_user_usergroup_map` VALUES
(302,8),
(318,3),
(320,10),
(322,3),
(329,10);
/*!40000 ALTER TABLE `amtf3_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_usergroups`
--

DROP TABLE IF EXISTS `amtf3_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_usergroups`
--

LOCK TABLES `amtf3_usergroups` WRITE;
/*!40000 ALTER TABLE `amtf3_usergroups` DISABLE KEYS */;
INSERT INTO `amtf3_usergroups` VALUES
(1,0,1,12,'Public'),
(2,1,4,9,'Registered'),
(3,2,7,8,'Operator'),
(8,1,10,11,'Super Users'),
(9,1,2,3,'Guest'),
(10,2,5,6,'Client');
/*!40000 ALTER TABLE `amtf3_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_users`
--

DROP TABLE IF EXISTS `amtf3_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `sendEmail` tinyint(4) DEFAULT 0,
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT 0 COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Backup Codes',
  `requireReset` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_users`
--

LOCK TABLES `amtf3_users` WRITE;
/*!40000 ALTER TABLE `amtf3_users` DISABLE KEYS */;
INSERT INTO `amtf3_users` VALUES
(302,'Admin','Admin','fa6248122@gmail.com','$2y$10$/3I5eXZQmJPB2w7r9dwO4uMbukCdiWrNDdXbz1kgWDdaW16RyosK6',0,1,'2025-05-12 08:25:19','2025-05-14 08:09:05','0','{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"ru-RU\",\"language\":\"ru-RU\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}',NULL,0,'','',0,''),
(318,'useruseruser','useruseruser','useruseruser@fddf','$2y$10$9wxI/nO1kaAjgKFZhTRA8.yMgMPCFSp3m6ZoAKRP0ZcXYCN1P.Kaq',0,0,'2025-05-12 16:05:15','2025-05-14 08:36:56','','{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}',NULL,0,'','',0,''),
(320,'clientclientclient','clientclientclient','clientclientclient@clientclientclient','$2y$10$wp/fabqG61zhF8yG81wOG.sCd0HJZq8fMo7xpCEOD0jTSQMUA8C.S',0,0,'2025-05-13 09:27:36','2025-05-13 15:51:19','','{}',NULL,0,'','',0,''),
(322,'Глеб Подолянов','RKPYT','zachemtebepochta@a.ru','$2y$10$6O54OP8GvBNDmYD0AIrjh.HqfauWFax52hRoGIoTNASyMlDzwrzfq',0,0,'2025-05-13 16:06:45','2025-05-13 16:09:30','','{\"admin_style\":\"\",\"colorScheme\":\"\",\"allowTourAutoStart\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"timezone\":\"\",\"a11y_mono\":\"0\",\"a11y_contrast\":\"0\",\"a11y_highlight\":\"0\",\"a11y_font\":\"0\"}',NULL,0,'','',0,''),
(329,'dfgdgsfsgdfsgdf','dfgdgsfsgdfsgdf','dfgdgsfsgdfsgdf@fd','$2y$10$uY8yvKt4vOt/Vjcc5d7O.emLeZgfDcgZKjwy0E9mf9AIfrThzRNmC',0,0,'2025-05-14 08:18:05','2025-05-14 08:18:45','','{}',NULL,0,'','',0,'');
/*!40000 ALTER TABLE `amtf3_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_viewlevels`
--

DROP TABLE IF EXISTS `amtf3_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_viewlevels`
--

LOCK TABLES `amtf3_viewlevels` WRITE;
/*!40000 ALTER TABLE `amtf3_viewlevels` DISABLE KEYS */;
INSERT INTO `amtf3_viewlevels` VALUES
(1,'Public',1,'[1]'),
(2,'Client',3,'[2,8]'),
(3,'Special',5,'[8]'),
(5,'Guest',2,'[9]'),
(6,'Super Users',6,'[8]'),
(7,'Operator',4,'[3,8]');
/*!40000 ALTER TABLE `amtf3_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_webauthn_credentials`
--

DROP TABLE IF EXISTS `amtf3_webauthn_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_webauthn_credentials` (
  `id` varchar(1000) NOT NULL COMMENT 'Credential ID',
  `user_id` varchar(128) NOT NULL COMMENT 'User handle',
  `label` varchar(190) NOT NULL COMMENT 'Human readable label',
  `credential` mediumtext NOT NULL COMMENT 'Credential source data, JSON format',
  PRIMARY KEY (`id`(100)),
  KEY `user_id` (`user_id`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_webauthn_credentials`
--

LOCK TABLES `amtf3_webauthn_credentials` WRITE;
/*!40000 ALTER TABLE `amtf3_webauthn_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `amtf3_webauthn_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_workflow_associations`
--

DROP TABLE IF EXISTS `amtf3_workflow_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_workflow_associations` (
  `item_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Extension table id value',
  `stage_id` int(11) NOT NULL COMMENT 'Foreign Key to #__workflow_stages.id',
  `extension` varchar(50) NOT NULL,
  PRIMARY KEY (`item_id`,`extension`),
  KEY `idx_item_stage_extension` (`item_id`,`stage_id`,`extension`),
  KEY `idx_item_id` (`item_id`),
  KEY `idx_stage_id` (`stage_id`),
  KEY `idx_extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_workflow_associations`
--

LOCK TABLES `amtf3_workflow_associations` WRITE;
/*!40000 ALTER TABLE `amtf3_workflow_associations` DISABLE KEYS */;
INSERT INTO `amtf3_workflow_associations` VALUES
(3,1,'com_content.article'),
(4,1,'com_content.article');
/*!40000 ALTER TABLE `amtf3_workflow_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_workflow_stages`
--

DROP TABLE IF EXISTS `amtf3_workflow_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_workflow_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `workflow_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_id` (`workflow_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_default` (`default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_workflow_stages`
--

LOCK TABLES `amtf3_workflow_stages` WRITE;
/*!40000 ALTER TABLE `amtf3_workflow_stages` DISABLE KEYS */;
INSERT INTO `amtf3_workflow_stages` VALUES
(1,57,1,1,1,'COM_WORKFLOW_BASIC_STAGE','',1,NULL,NULL);
/*!40000 ALTER TABLE `amtf3_workflow_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_workflow_transitions`
--

DROP TABLE IF EXISTS `amtf3_workflow_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_workflow_transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `workflow_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `from_stage_id` int(11) NOT NULL,
  `to_stage_id` int(11) NOT NULL,
  `options` text NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_from_stage_id` (`from_stage_id`),
  KEY `idx_to_stage_id` (`to_stage_id`),
  KEY `idx_workflow_id` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_workflow_transitions`
--

LOCK TABLES `amtf3_workflow_transitions` WRITE;
/*!40000 ALTER TABLE `amtf3_workflow_transitions` DISABLE KEYS */;
INSERT INTO `amtf3_workflow_transitions` VALUES
(1,58,1,1,1,'UNPUBLISH','',-1,1,'{\"publishing\":\"0\"}',NULL,NULL),
(2,59,2,1,1,'PUBLISH','',-1,1,'{\"publishing\":\"1\"}',NULL,NULL),
(3,60,3,1,1,'TRASH','',-1,1,'{\"publishing\":\"-2\"}',NULL,NULL),
(4,61,4,1,1,'ARCHIVE','',-1,1,'{\"publishing\":\"2\"}',NULL,NULL),
(5,62,5,1,1,'FEATURE','',-1,1,'{\"featuring\":\"1\"}',NULL,NULL),
(6,63,6,1,1,'UNFEATURE','',-1,1,'{\"featuring\":\"0\"}',NULL,NULL),
(7,64,7,1,1,'PUBLISH_AND_FEATURE','',-1,1,'{\"publishing\":\"1\",\"featuring\":\"1\"}',NULL,NULL);
/*!40000 ALTER TABLE `amtf3_workflow_transitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amtf3_workflows`
--

DROP TABLE IF EXISTS `amtf3_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amtf3_workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `extension` varchar(50) NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_asset_id` (`asset_id`),
  KEY `idx_title` (`title`(191)),
  KEY `idx_extension` (`extension`),
  KEY `idx_default` (`default`),
  KEY `idx_created` (`created`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified` (`modified`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `idx_checked_out` (`checked_out`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amtf3_workflows`
--

LOCK TABLES `amtf3_workflows` WRITE;
/*!40000 ALTER TABLE `amtf3_workflows` DISABLE KEYS */;
INSERT INTO `amtf3_workflows` VALUES
(1,56,1,'COM_WORKFLOW_BASIC_WORKFLOW','','com_content.article',1,1,'2025-05-12 08:25:18',302,'2025-05-12 08:25:18',302,NULL,NULL);
/*!40000 ALTER TABLE `amtf3_workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_types`
--

DROP TABLE IF EXISTS `request_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_types`
--

LOCK TABLES `request_types` WRITE;
/*!40000 ALTER TABLE `request_types` DISABLE KEYS */;
INSERT INTO `request_types` VALUES
(6,'Класс'),
(7,'Vety'),
(8,'Good'),
(9,'VV');
/*!40000 ALTER TABLE `request_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `text` text NOT NULL,
  `street` text NOT NULL,
  `full_name` text NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `types` (`type_id`),
  CONSTRAINT `types` FOREIGN KEY (`type_id`) REFERENCES `request_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES
(1,'2025-05-13 09:23:41','ТЕКСТ','Стрит','ФИО2',7),
(6,'2025-05-13 09:46:59','ывпа','ывап','аыпф',6),
(7,'2025-05-13 09:54:22','sdgfsgfdgsfdgfsddgfsfgd','gsfdgfds','sdggasgafdagfgfafga',6),
(8,'2025-05-13 09:54:30','sdgf','dgfs','dgfssdgf',6),
(9,'2025-05-13 09:54:34','sgfd','sgfdsfdg','sdgfsgfd',6),
(10,'2025-05-13 09:54:38','sdgf','sdgf','sdgffsgd',6),
(11,'2025-05-13 09:54:41','sfgd','gfsd','sdfgsgfd',6),
(12,'2025-05-13 09:54:47','sdgf','sdgf','sgdf',6),
(14,'2025-05-13 09:54:55','sgdf','sdgfsgd','sdgf',6),
(15,'2025-05-13 09:54:58','sgfd','sdgf','sdgf',6),
(16,'2025-05-13 09:55:03','sfdg','sfdg','sdgf',6),
(17,'2025-05-13 09:55:07','sdgf','sgfd','sdgf',6),
(18,'2025-05-13 09:55:10','sgfd','sfgd','sfgd',6),
(19,'2025-05-13 09:55:13','sdgf','sgfd','sgfd',6),
(20,'2025-05-13 09:55:16','sgdf','sgfd','sdfg',6),
(21,'2025-05-13 09:55:19','sgfd','sdfg','sdfg',7),
(22,'2025-05-13 09:55:22','sgdf','sgdf','Good',8),
(24,'2025-05-13 11:06:16','1','1','1',8),
(25,'2025-05-13 11:07:37','2','2','2',8),
(26,'2025-05-13 11:10:48','56','156','566',9),
(27,'2025-05-14 08:27:04','АФВВЫаыавфафывафвы фвыафваыафввфаы, аывфаываывфывфа, ыавпыавпаывыапвпаывпаывпаывпаыв, паывпаывпаывпавыапвыпавыпаыв','Ул. Ленина, дом 3','Алексей Алексеевич Алекс',9);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `text` text NOT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES
(4,'Благоустройство городских территорий','В рамках программы благоустройства в городе Лабинске ведутся работы по озеленению и ремонту дворовых территорий. Ждем ваших предложений по улучшению городской среды!','http://mcu-ukh-labinsk.tw1.ru/components/com_chronoforms8/uploads/ozelenenie-territorii-01_20250513_155455.jpg'),
(5,'Субботник: Сделаем город чище!','Приглашаем всех желающих принять участие в общегородском субботнике. Вместе мы сможем сделать Лабинск еще чище и уютнее! Дата и место уточняются','http://mcu-ukh-labinsk.tw1.ru/components/com_chronoforms8/uploads/be9cbb10-f50a-5421-beb5-67b17b1c5a51_20250513_155604.jpg');
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-14 11:39:44
