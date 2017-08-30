CREATE DATABASE  IF NOT EXISTS `recruiter` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `recruiter`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: recruiter
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES ('admin','2',1503905490),('user','3',1504013744);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES ('admin',1,NULL,NULL,NULL,1503905253,1503905253),('author',1,NULL,NULL,NULL,1503905253,1503905253),('createJob',2,'User can create a job',NULL,NULL,1503905253,1503905253),('updateJob',2,'User can update job',NULL,NULL,1503905253,1503905253),('updateOwnJob',2,'Update own job','isAuthor',NULL,1503905371,1503905371),('user',1,NULL,NULL,NULL,1503905253,1503905253);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` (`parent`, `child`) VALUES ('admin','author'),('author','createJob'),('admin','updateJob'),('updateOwnJob','updateJob'),('author','updateOwnJob');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES ('isAuthor','O:23:\"console\\rbac\\AuthorRule\":3:{s:4:\"name\";s:8:\"isAuthor\";s:9:\"createdAt\";i:1503905371;s:9:\"updatedAt\";i:1503905371;}',1503905371,1503905371);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `slug` varchar(64) NOT NULL,
  `meta_description` varchar(160) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `slug`, `meta_description`, `created_at`, `updated_at`) VALUES (1,'Accounting & Auditing','Accounting & Auditing','Accounting & Auditing','2017-08-29 00:08:35',NULL),(2,'Banking & Micro-Finance','Banking & Micro-Finance','Banking & Micro-Finance','2017-08-29 00:33:29',NULL),(3,'Executive / Top-Management','Executive / Top-Management','Executive / Top-Management','2017-08-29 00:33:29',NULL),(4,'Creatives (Art, Design, Fashion)','Creatives (Art, Design, Fashion)','Creatives (Art, Design, Fashion)','2017-08-29 00:33:29',NULL),(5,'Customer Service & Customer Support','Customer Service & Customer Support','Customer Service & Customer Support','2017-08-29 00:33:29',NULL),(6,'Education & Training','Education & Training','Education & Training','2017-08-29 00:33:29',NULL),(7,'Engineering / Mechanics / Construction','Engineering / Mechanics / Construction','Engineering / Mechanics / Construction','2017-08-29 00:33:29',NULL),(8,'Farming & Angriculture','Farming & Angriculture','Farming & Angriculture','2017-08-29 00:33:29',NULL),(9,'Government','Government','Government','2017-08-29 00:33:29',NULL),(10,'Healthcare & Pharmaceuticals','Healthcare & Pharmaceuticals','Healthcare & Pharmaceuticals','2017-08-29 00:33:29',NULL),(11,'Human Resources & Recruitment','Human Resources & Recruitment','Human Resources & Recruitment','2017-08-29 00:33:30',NULL),(12,'Insurance','Insurance','Insurance','2017-08-29 00:33:30',NULL),(13,'IT & Telecoms','IT & Telecoms','IT & Telecoms','2017-08-29 00:33:30',NULL),(14,'Legal','Legal','Legal','2017-08-29 00:33:30',NULL),(15,'Manufacturing & Production','Manufacturing & Production','Manufacturing & Production','2017-08-29 00:33:30',NULL),(16,'Marketing, Communications & PR','Marketing, Communications & PR','Marketing, Communications & PR','2017-08-29 00:33:30',NULL),(17,'NGO, Community & Social Development','NGO, Community & Social Development','NGO, Community & Social Development','2017-08-29 00:33:30',NULL),(18,'Administration & Office Support','Administration & Office Support','Administration & Office Support','2017-08-29 00:33:30',NULL),(19,'Project & Programme Management','Project & Programme Management','Project & Programme Management','2017-08-29 00:33:30',NULL),(20,'Research / Quality Control / Quality Assurance','Research / Quality Control / Quality Assurance','Research / Quality Control / Quality Assurance','2017-08-29 00:33:30',NULL),(21,'Retail','Retail','Retail','2017-08-29 00:33:30',NULL),(22,'Sales / Business Development','Sales / Business Development','Sales / Business Development','2017-08-29 00:33:30',NULL),(23,'Security','Security','Security','2017-08-29 00:33:30',NULL),(24,'Strategy & Consultancy','Strategy & Consultancy','Strategy & Consultancy','2017-08-29 00:33:30',NULL),(25,'Tourism & Travel','Tourism & Travel','Tourism & Travel','2017-08-29 00:33:30',NULL),(26,'Other','Other','Other','2017-08-29 00:33:30',NULL),(27,'Internships & Volunteering','Internships & Volunteering','Internships & Volunteering','2017-08-29 00:33:30',NULL),(28,'Real Estate','Real Estate','Real Estate','2017-08-29 00:33:30',NULL),(29,'Hospitality / Leisure / Travel','Hospitality / Leisure / Travel','Hospitality / Leisure / Travel','2017-08-29 00:33:30',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL,
  `country_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES (1,'AF','Afghanistan'),(2,'AL','Albania'),(3,'DZ','Algeria'),(4,'DS','American Samoa'),(5,'AD','Andorra'),(6,'AO','Angola'),(7,'AI','Anguilla'),(8,'AQ','Antarctica'),(9,'AG','Antigua and Barbuda'),(10,'AR','Argentina'),(11,'AM','Armenia'),(12,'AW','Aruba'),(13,'AU','Australia'),(14,'AT','Austria'),(15,'AZ','Azerbaijan'),(16,'BS','Bahamas'),(17,'BH','Bahrain'),(18,'BD','Bangladesh'),(19,'BB','Barbados'),(20,'BY','Belarus'),(21,'BE','Belgium'),(22,'BZ','Belize'),(23,'BJ','Benin'),(24,'BM','Bermuda'),(25,'BT','Bhutan'),(26,'BO','Bolivia'),(27,'BA','Bosnia and Herzegovina'),(28,'BW','Botswana'),(29,'BV','Bouvet Island'),(30,'BR','Brazil'),(31,'IO','British Indian Ocean Territory'),(32,'BN','Brunei Darussalam'),(33,'BG','Bulgaria'),(34,'BF','Burkina Faso'),(35,'BI','Burundi'),(36,'KH','Cambodia'),(37,'CM','Cameroon'),(38,'CA','Canada'),(39,'CV','Cape Verde'),(40,'KY','Cayman Islands'),(41,'CF','Central African Republic'),(42,'TD','Chad'),(43,'CL','Chile'),(44,'CN','China'),(45,'CX','Christmas Island'),(46,'CC','Cocos (Keeling) Islands'),(47,'CO','Colombia'),(48,'KM','Comoros'),(49,'CG','Congo'),(50,'CK','Cook Islands'),(51,'CR','Costa Rica'),(52,'HR','Croatia (Hrvatska)'),(53,'CU','Cuba'),(54,'CY','Cyprus'),(55,'CZ','Czech Republic'),(56,'DK','Denmark'),(57,'DJ','Djibouti'),(58,'DM','Dominica'),(59,'DO','Dominican Republic'),(60,'TP','East Timor'),(61,'EC','Ecuador'),(62,'EG','Egypt'),(63,'SV','El Salvador'),(64,'GQ','Equatorial Guinea'),(65,'ER','Eritrea'),(66,'EE','Estonia'),(67,'ET','Ethiopia'),(68,'FK','Falkland Islands (Malvinas)'),(69,'FO','Faroe Islands'),(70,'FJ','Fiji'),(71,'FI','Finland'),(72,'FR','France'),(73,'FX','France, Metropolitan'),(74,'GF','French Guiana'),(75,'PF','French Polynesia'),(76,'TF','French Southern Territories'),(77,'GA','Gabon'),(78,'GM','Gambia'),(79,'GE','Georgia'),(80,'DE','Germany'),(81,'GH','Ghana'),(82,'GI','Gibraltar'),(83,'GK','Guernsey'),(84,'GR','Greece'),(85,'GL','Greenland'),(86,'GD','Grenada'),(87,'GP','Guadeloupe'),(88,'GU','Guam'),(89,'GT','Guatemala'),(90,'GN','Guinea'),(91,'GW','Guinea-Bissau'),(92,'GY','Guyana'),(93,'HT','Haiti'),(94,'HM','Heard and Mc Donald Islands'),(95,'HN','Honduras'),(96,'HK','Hong Kong'),(97,'HU','Hungary'),(98,'IS','Iceland'),(99,'IN','India'),(100,'IM','Isle of Man'),(101,'ID','Indonesia'),(102,'IR','Iran (Islamic Republic of)'),(103,'IQ','Iraq'),(104,'IE','Ireland'),(105,'IL','Israel'),(106,'IT','Italy'),(107,'CI','Ivory Coast'),(108,'JE','Jersey'),(109,'JM','Jamaica'),(110,'JP','Japan'),(111,'JO','Jordan'),(112,'KZ','Kazakhstan'),(113,'KE','Kenya'),(114,'KI','Kiribati'),(115,'KP','Korea, Democratic People\'s Republic of'),(116,'KR','Korea, Republic of'),(117,'XK','Kosovo'),(118,'KW','Kuwait'),(119,'KG','Kyrgyzstan'),(120,'LA','Lao People\'s Democratic Republic'),(121,'LV','Latvia'),(122,'LB','Lebanon'),(123,'LS','Lesotho'),(124,'LR','Liberia'),(125,'LY','Libyan Arab Jamahiriya'),(126,'LI','Liechtenstein'),(127,'LT','Lithuania'),(128,'LU','Luxembourg'),(129,'MO','Macau'),(130,'MK','Macedonia'),(131,'MG','Madagascar'),(132,'MW','Malawi'),(133,'MY','Malaysia'),(134,'MV','Maldives'),(135,'ML','Mali'),(136,'MT','Malta'),(137,'MH','Marshall Islands'),(138,'MQ','Martinique'),(139,'MR','Mauritania'),(140,'MU','Mauritius'),(141,'TY','Mayotte'),(142,'MX','Mexico'),(143,'FM','Micronesia, Federated States of'),(144,'MD','Moldova, Republic of'),(145,'MC','Monaco'),(146,'MN','Mongolia'),(147,'ME','Montenegro'),(148,'MS','Montserrat'),(149,'MA','Morocco'),(150,'MZ','Mozambique'),(151,'MM','Myanmar'),(152,'NA','Namibia'),(153,'NR','Nauru'),(154,'NP','Nepal'),(155,'NL','Netherlands'),(156,'AN','Netherlands Antilles'),(157,'NC','New Caledonia'),(158,'NZ','New Zealand'),(159,'NI','Nicaragua'),(160,'NE','Niger'),(161,'NG','Nigeria'),(162,'NU','Niue'),(163,'NF','Norfolk Island'),(164,'MP','Northern Mariana Islands'),(165,'NO','Norway'),(166,'OM','Oman'),(167,'PK','Pakistan'),(168,'PW','Palau'),(169,'PS','Palestine'),(170,'PA','Panama'),(171,'PG','Papua New Guinea'),(172,'PY','Paraguay'),(173,'PE','Peru'),(174,'PH','Philippines'),(175,'PN','Pitcairn'),(176,'PL','Poland'),(177,'PT','Portugal'),(178,'PR','Puerto Rico'),(179,'QA','Qatar'),(180,'RE','Reunion'),(181,'RO','Romania'),(182,'RU','Russian Federation'),(183,'RW','Rwanda'),(184,'KN','Saint Kitts and Nevis'),(185,'LC','Saint Lucia'),(186,'VC','Saint Vincent and the Grenadines'),(187,'WS','Samoa'),(188,'SM','San Marino'),(189,'ST','Sao Tome and Principe'),(190,'SA','Saudi Arabia'),(191,'SN','Senegal'),(192,'RS','Serbia'),(193,'SC','Seychelles'),(194,'SL','Sierra Leone'),(195,'SG','Singapore'),(196,'SK','Slovakia'),(197,'SI','Slovenia'),(198,'SB','Solomon Islands'),(199,'SO','Somalia'),(200,'ZA','South Africa'),(201,'GS','South Georgia South Sandwich Islands'),(202,'ES','Spain'),(203,'LK','Sri Lanka'),(204,'SH','St. Helena'),(205,'PM','St. Pierre and Miquelon'),(206,'SD','Sudan'),(207,'SR','Suriname'),(208,'SJ','Svalbard and Jan Mayen Islands'),(209,'SZ','Swaziland'),(210,'SE','Sweden'),(211,'CH','Switzerland'),(212,'SY','Syrian Arab Republic'),(213,'TW','Taiwan'),(214,'TJ','Tajikistan'),(215,'TZ','Tanzania, United Republic of'),(216,'TH','Thailand'),(217,'TG','Togo'),(218,'TK','Tokelau'),(219,'TO','Tonga'),(220,'TT','Trinidad and Tobago'),(221,'TN','Tunisia'),(222,'TR','Turkey'),(223,'TM','Turkmenistan'),(224,'TC','Turks and Caicos Islands'),(225,'TV','Tuvalu'),(226,'UG','Uganda'),(227,'UA','Ukraine'),(228,'AE','United Arab Emirates'),(229,'GB','United Kingdom'),(230,'US','United States'),(231,'UM','United States minor outlying islands'),(232,'UY','Uruguay'),(233,'UZ','Uzbekistan'),(234,'VU','Vanuatu'),(235,'VA','Vatican City State'),(236,'VE','Venezuela'),(237,'VN','Vietnam'),(238,'VG','Virgin Islands (British)'),(239,'VI','Virgin Islands (U.S.)'),(240,'WF','Wallis and Futuna Islands'),(241,'EH','Western Sahara'),(242,'YE','Yemen'),(243,'ZR','Zaire'),(244,'ZM','Zambia'),(245,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `company` varchar(128) NOT NULL,
  `salary` varchar(128) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `location` varchar(128) NOT NULL,
  `disabled` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_index` (`created_by`,`updated_by`),
  KEY `fk_job_category` (`category_id`),
  KEY `fk_job_user_updated_by` (`updated_by`),
  CONSTRAINT `fk_job_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_user_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `category_id`, `company`, `salary`, `expires_at`, `location`, `disabled`) VALUES (1,'ICT Officer','ict-officer','Job Summary \r\nApplications are invited from qualified persons for the above vacant position. \r\n\r\nJob Description \r\n\r\nTourism Regulatory Authority (TRA) is a state corporation established under Tourism Act No. 28 of 2011 to regulate, manage and provide strategic direction to the tourism industry in Kenya. As part of its establishment and in its course to deliver its mandate, the Authority now invites applications from qualified, innovative and experienced individuals to fill the following vacant positions. \r\n\r\nS/NO POSITION POSTS REFERENCE \r\n5 ICT OFFICER-TRA 6 1 TRA /ICTO/6/2017 \r\n\r\na) Job Descriptions \r\nDuties and responsibilities at this level will include: - \r\ni. Analyzing, designing, coding, testing and implementing computer programs. \r\nii. Providing user support, maintaining support systems and training of users. \r\niii. Repairing and maintaining Information Communication Technology equipment and associated peripherals. \r\niv. Receiving, installing and certifying of Information Communication Technology equipment. and \r\nv. Configuring new Information Communication Technology equipment. \r\n\r\nb) Job Specifications \r\nFor appointment to this grade, a candidate must:- \r\ni. Have a Bachelor’s degree in any of the following: Computer Science, Information Technology or related field from a recognized Institution. and \r\nii. Have a recognized professional certification in the field of ICT. \r\n\r\nNOTES \r\n1. Kindly visit the Authority’s website http://www.tourismauthority.go.ke for detailed information on the qualification requirements for each of the positions. \r\n2. Interested and qualified persons are required to submit their application letter, detailed Curriculum Vitae, certified copies of relevant academic certificates, National Identity card/Passport, testimonials and other relevant supporting documents. \r\n3. Applicants should give details of their e-mail address, day time telephone contact and three referees. \r\n4. Applicants MUST quote the Job reference number on the envelope. \r\n5. The application letter to be addressed to undersigned and to reach on or before 6th September, 2017. \r\n\r\nThe Director General \r\nTourism Regulatory Authority \r\nUtalii House, 5th Floor, Off Utalii Lane \r\nP.O. Box 30027 -00100 Nairobi \r\nEmail: info@tourismauthority.go.ke \r\n\r\n6. All positions are on permanent and pensionable terms. \r\n7. Tourism Regulatory Authority is an equal opportunity employer and women, minorities, marginalized and persons living with disabilities are encouraged to apply. Only shortlisted candidates will be contacted. \r\n\r\nDirector General, \r\nTourism Regulatory Authority.\r\n','2017-08-29 00:35:11','2017-08-29 00:35:11',2,2,13,'Nation Media','10000','2017-12-29 00:35:11','Nairobi',0),(2,'FINANCE AND ADMINISTRATION MANAGER','finance-and-administration-manager','Job Summary \r\n\r\nResponsible for financial management and accountability at the distributor \r\n\r\nJob Description \r\n\r\nPRIMARY RESPONSIBILITIES \r\n- To manage the Company’s working capital and other operations, including management and statutory accounts together with longer term financial projections and to ensure that the most efficient and effective financial control systems and reporting mechanisms are in place. \r\n- To prepare monthly management accounts and projections and other relevant reports, in consultation with the Head Office Finance Manager and other departments, for presentation to the Board of Directors. \r\n- To prepare the year-end financial accounts for audit and to liaise with the Head office Finance manager and Auditors prior to sign-off. \r\n- To ensure the overall smooth running of the Company’s internal administration and its cost-effectiveness \r\n- To manage, in conjunction with the Head Office finance Manager, staff contracts and HR matters. \r\n- To manage personnel procedures in relation to recruitment, training, holidays and appraisals, ensuring these are properly documented, and advise on relevant policies. \r\n- To be responsible for the Company’s IT resources, maintaining and implementation. \r\n- Oversee other departments which include; Sales and operation departments. \r\n- To ensure effective policies and procedures implementation within the organization. \r\n\r\nPersonal Specification \r\n- Excellent problem-solving skills \r\n- Excellent planner and strategic thinker. \r\n- Ability to deliver timely results despite obstacles and limited resources. \r\n- Self-motivation, a strong work ethic and enthusiasm for change. \r\n- A keen interest in satisfying internal and external customers. \r\n- Good communication, organisational skills and ability to work under pressure \r\n\r\nQualifications \r\n- Holder of Bachelor of Commerce /Bachelor of Business Management degree from recognized university \r\n- Atleast C.P.A Part II \r\n- 5 years’ experience in accounting, finance and administration from a reputable organization \r\n- At least 2 years’ experience at management level, preferably in FMCG\r\n\r\n','2017-08-29 00:37:08','2017-08-29 00:37:08',2,2,1,'Standard Media','14000','2017-12-29 00:35:11','Nairobi',0),(3,'Agronomist','agronomist','Job Summary \r\n\r\nAgronomist required immediately for a farm in Naivasha. \r\n\r\nJob Description \r\n\r\nQualification: \r\n\r\nCertificate, Diploma or Degree in Horticulture or related field. \r\nMust have hands on experience minimum 3 years in growing of fruits, vegetables etc under irrigation scheme and be well versed with insect and pests management. \r\n\r\nHow to Apply: \r\n\r\nPlease send your resume/CV','2017-08-29 00:38:23','2017-08-29 00:38:23',2,2,8,'Citizen Media','22000','2017-12-29 00:35:11','Kisumu',0),(4,'Actuarial Function Senior Officer','actuarial-function-senior-officer','Job Summary \r\n\r\nApplications are invited from qualified persons for the above vacant position. \r\n\r\nJob Description \r\n\r\nJob Summary: The incumbent shall be responsible for evaluation of, and the provision of advice to GA Insurance Ltd concerning: \r\n\r\n- The technical provisions; \r\n- Premium and pricing; \r\n- Scenario and sensitivity testing; \r\n- and Compliance with the statutory obligations of the line business \r\n\r\nMain Responsibilities \r\n\r\nThe incumbent shall be responsible for evaluation and advising on the following: \r\n\r\n- Valuation of liabilities and technical provisions. \r\n- Solvency position, including calculation of minimum capital required for regulatory purposes and liability and loss provisions; \r\n- Prospective solvency position and distribution of benefits; Reinsurance arrangements; \r\n- Actuarial and financial risks; Risk assessment and management policies and controls relevant to actuarial matters or financial condition; \r\n- Product development and design, including the terms and conditions of insurance contracts; \r\n- Sufficiency and quality of data used in the calculation of technical provisions; \r\n- Investment policies and the valuation of assets; \r\n- Underwriting policies, risk modeling and use of internal models. \r\n\r\nAcademic Qualifications: \r\n\r\n- Graduate with a degree in Actuarial Science / Statistics \r\n- Professional actuarial exams (minimum 12/15 exams) \r\n\r\nFunctional Skills \r\n\r\n- Analytical Skills \r\n- Exploitation and application of Information Technology \r\n- Actuarial modelling \r\n- Risk Management \r\n- Visionary Leadership \r\n- Market Awareness \r\n- Customer Focus \r\n- Continuous Innovation \r\n- Ownership & Commitment \r\n- Team Spirit \r\n- The candidate must have at least 4 year of relevant experience: \r\n\r\nHow to Apply \r\nIf you meet the above minimum requirements, send your c.v. Indicate the position applied for on the email subject line so as to be received on or before 1st September, 2017. Only short listed candidates will be contacted.\r\n\r\n','2017-08-29 00:40:28','2017-08-29 00:40:28',2,2,12,'KCB Bank','7000','2017-12-29 00:35:11','Kakamega',0),(5,'Chief Security Officer','chief-security-officer','Job Summary\r\n\r\nApplications are invited from qualified persons for the above vacant position. \r\n\r\nJob Description \r\n\r\nAfrica International University (formerly Nairobi Evangelical Graduate School of Theology – NEGST) is a private Chartered International Christian University with its main Campus located in Karen, Nairobi. Our Mission is to educate Christ centred leaders for the transformation of God’s people and the world through innovative programs, research and community engagement. We are seeking highly motivated professionals to fill the following positions: \r\n\r\nChief Security and Safety Officer \r\n\r\nApplicants must be a former police Officer having served in the position of Officer Commanding Station (OCS) for 5 years or Officer Commanding Police Division (OCPD) for 5 years, have a secondary school education certificate supplemented by courses/diploma in security training and/or certified graduation from police academy or related field. S/he must have excellent investigation skills, Administrative skills, computer skills, knowledge of associated electronic security devices, First aid and fire-fighting skills are desirable, and must be a committed Christian. \r\n\r\nMain Responsibilities: \r\n\r\nThe job holder will be in charge of Overseeing the security and safety of students, employees and facilities, developing and enforcing safety rules and regulations aimed at reducing risk, supervising all the activities of the contracted service provider and will be the main point of contact in the event of any emergency or security incidents that occur on site with the task of Investigating and preparing reports on those incidents/accidents. Having worked in a University will be an added advantage. Applications should be emailed ensuring vacancy code is in the subject. Attach a cover letter, detailed resume and duly filled job application form. Deadline for application is Wednesday, 30th August 2017 at 5.00pm. Only shortlisted applicants will be contacted. Academic and non-academic staff of AIU are required to be faithful to the evangelical faith and practice and to the Christian ethos and code of conduct of the University.\r\n','2017-08-29 00:41:22','2017-08-29 00:41:22',2,2,23,'StanChat Bank','20000','2017-12-29 00:35:11','Nakuru',0),(6,'Real Estate Property Manager','real-estate-property-manager','Job Summary\r\n\r\nOur client seeks to hire an experienced Property Manager to oversee planning, coordination and implementation of all property management activities. \r\n\r\nJob Description \r\n\r\nOur client is a locally owned property consultancy firm that provides valuation, property management, facilities management, estate agency and property development consultancy services. \r\n\r\nLocation: Nairobi \r\nSalary: 80k -100k \r\n\r\nProperty Manager Job Responsibilities \r\n\r\n- Daily Management, supervision and communication with building supervisors, maintenance and security teams to ensure premises are always operating insatiable and safe conditions \r\n- Enforce terms of rental agreements and ensures compliance with relevant laws and regulations \r\n- Schedule property viewings and organize marketing efforts in order to maximize occupancy of premises under management \r\n- Manage relationships with suppliers, vendors and partners and provide regular recommendations and advice to management to optimize operations \r\n- Responsible for timely rent collection and proper reporting to ensure arrears and bad debts are minimized \r\n- Liaise and communicate regularly with finance department \r\n- Interact and communicate regularly with tenants to resolve any queries in a timely and satisfactory manner \r\n- Assist in drafting and implementing procedures, processes and controls in conjunction with staff under supervision and other departments \r\n- Train, manage, supervise and evaluate staff including building supervisors, maintenance and security personnel \r\n- Responsible for compliance with all regulatory requirements including: fire safety, construction permits, certificate of occupation, business permits and timely land rates and rents \r\n- Direct and control all personnel and resources to ensure properties are properly maintained and management company objectives are met \r\n- Carry out regular weekly detailed routine property inspections of each property in conjunction with other departments and review maintenance and security issues, safety processes and other operational issues \r\n- Update and organize all information relating to properties and tenants including building plans, regulatory certificates, statutory documents and tenancy agreements \r\n- Maintain an updated database of suppliers, authorized contractors and service providers \r\n- Draft and present weekly, monthly and quarterly reports for management including reporting on tenancy matters, maintenance, repairs, security and other suggested improvements \r\n- Be able to optimize efficient operations \r\n- In charge of setting up processes /procedures for building management \r\n\r\nQualifications for the Property Manager Job \r\n\r\n- Must have Degree in Land Economics \r\n- 3 years of experience in Property Management \r\n- Must have handled at least 2 construction Projects (Refurbishment) \r\n- Must have managed at least 6 properties \r\n- Should have a Finance exposure \r\n- Proficient in the use of IT skills in reporting \r\n- A track record of successful Project Management \r\n- Proven track record of completing projects successfully within stipulated timeline \r\n- Proven Managerial and Leadership skills\r\n\r\n','2017-08-29 00:41:59','2017-08-29 00:41:59',2,2,28,'Nairobi Hospital','5600','2017-12-29 00:35:11','Nyeri',0),(7,'Mentor / Caseworker','mentor-caseworker',' Job Summary\r\n\r\nKGGA is seeking a qualified mentor / caseworker to be based in Nairobi.\r\nJob Description\r\nKenya Girl Guides Association (KGGA) is a national organization committed to enabling and empowering girls and young women to develop their fullest potential as leaders and responsible citizens of the world.\r\nThe mission is “To Raise girls and young women to be beacons of integrity nurturing and championing social values”\r\nKGGA is seeking a qualified mentor / caseworker to be based in Nairobi.\r\nThe mentor / caseworker will report to the Programme officer and will provide assistance in ensuring effective implementation of the DREAMS Programme by mentoring the girls between the ages of 10-24 years in school and out of school and thereby supporting KGGA to achieve quality service to its esteemed clientele.\r\nEssential Duties and Responsibilities\r\n\r\n    Participate in Community Mobilization and Sensitization on DREAMS Program\r\n    Recruit and enroll the most at risk AGYW in schools& out of school into the DREAMS program.\r\n    Establish DREAMS Safe Space Groups for Adolescent Girls and Young Women in Schools& Out of schools\r\n    Case management of AGYW. Assessing risk factors of each Adolescent girl and young woman, making case treatment plans and executing them promptly\r\n    Deliver Evidence Based Interventions in health education, financial education and GBV Prevention training content to AGYW in safe space groups\r\n    Work with DREAMS Program staff to refer and link AGYW to appropriate services including post GBV care, reproductive health and other services.\r\n    Deliver sustainability through building a cascading leadership model, in safe space groups\r\n    Initiate and strengthening guiding units within the communities.\r\n    Identify and report success stories and most significant change.\r\n    Participate in QA meetings with KGGA DREAMS staff and Case workers.\r\n\r\nEducation and Qualifications\r\n\r\n    Diploma in Development studies / sociology / Education / Counselling / Social Work.\r\n    A member of Kenya Girl Guides Association is an added advantage.\r\n\r\nSkills and Experience\r\n\r\n    2 Years’ experience implementing community based HIV programs. Working experience in Nairobi informal urban settlements will be an added advantage\r\n    Previous working experience with young people especially Adolescent Girls and Young Women\r\n    Ability to work with a team and independently\r\n    Initiative, dependability and organizational ability\r\n    Excellent software expertise in Microsoft Excel, Word and PowerPoint.\r\n\r\nHow to Apply\r\n\r\nIf you believe you can clearly demonstrate your abilities to meet the criteria given above, please submit your application with a detailed CV with the subject of the email as MENTOR / CASEWORKER POSITION. \r\n\r\nThe closing date for applications is Friday, 31st  August 2017 at 5.00pm.\r\nOnly shortlisted candidates will be contacted for interview.','2017-08-29 03:06:09','2017-08-29 03:06:09',2,2,17,'The Kenya Girl Guides Association (KGGA)','35000','2017-12-16 00:00:00','Nairobi',0),(11,'Interview Invitation','interview-invitation','Interview Invitation','2017-08-30 19:37:28','2017-08-30 19:37:28',3,3,1,'interview','0','2017-08-30 00:00:00','interview',1),(12,'Interview Invitation','interview-invitation','Interview Invitation','2017-08-30 19:39:02','2017-08-30 19:39:02',3,3,1,'interview','0','2017-08-30 00:00:00','interview',1),(13,'CHIEF STRATEGY & LIAISON OFFICER','chief-strategy-liaison-officer',' Job Summary\r\n\r\nApplications are invited from qualified persons for the above vacant position.\r\nJob Description\r\n\r\nTourism Regulatory Authority (TRA) is a state corporation established under Tourism Act No. 28 of 2011 to regulate, manage and provide strategic direction to the tourism industry in Kenya. As part of its establishment and in its course to deliver its mandate, the Authority now invites applications from qualified, innovative and experienced individuals to fill the following vacant positions.\r\n\r\nS/NO POSITION POSTS REFERENCE\r\n\r\n2. CHIEF STRATEGY & LIAISON OFFICER-TRA 4 1 TRA /CSLO/4/2017\r\nJob Descriptions\r\nAn officer at this level will be responsible for:\r\n\r\ni. Generation of strategic plan and development of guidelines\r\nii. Preparation of staff briefing, sensitization and educate on strategic planning\r\niii. Development and review of strategic plan, work plans and the respective tools for monitoring.\r\niv. Analyzing and moderating strategic plan, performance contract documents and reports.\r\nv. Provide advice on strategy positions and issues.\r\nvi. Moderate stakeholder’s liaison outreach programmes aimed at realization of the Authority’s goals.\r\nvii. Analysis of reports on the organization’s environment analysis and information influencing strategies.\r\nviii. Coordination of strategic change management processes aimed at improving attaining organization’s goals.\r\nix. Monitoring performance quality against set targets, timelines compliance.\r\nx. Evaluate and provide briefs on assessment/ research reports on the impact of the strategic positions of the organization in regard to organizational goal.\r\nxi. Plan and moderate sensitization, education and advocacy on organization’s strategy and strategic positions.\r\nxii. Liaison and coordination of strategic priorities to budgets and financial control through participation in the processes and periodic performance audits.\r\nxiii. Any other duties that can be assigned from time to time.\r\n\r\nb) Job specification\r\nFor appointment to this grade, a candidate must have:\r\n\r\ni. Served as a Senior Corporate Strategy and Liaison Officer for a period of three (3) years or in a relevant and comparable position for the same period.\r\nii. Bachelor of Arts or Economics or Tourism and Hospitality or recognized degrees with a leaning on management and strategy from a recognized institution.\r\niii. A Management Course lasting not less than four (4) weeks.\r\niv. Have demonstrated outstanding professional competence in administration work as reflected in work performance and results.\r\nv. Be a member of relevant professional body/association.\r\n\r\nNOTES\r\n\r\n1. Kindly visit the Authority’s website http://www.tourismauthority.go.ke for detailed information on the qualification requirements for each of the positions.\r\n2. Interested and qualified persons are required to submit their application letter, detailed Curriculum\r\nVitae, certified copies of relevant academic certificates, National Identity card/Passport, testimonials and other relevant supporting documents.\r\n3. Applicants should give details of their e-mail address, day time telephone contact and three referees.\r\n4. Applicants MUST quote the Job reference number on the envelope.\r\n5. The application letter to be addressed to undersigned and to reach on or before 6th September, 2017.\r\n\r\nThe Director General\r\nTourism Regulatory Authority\r\nUtalii House, 5th Floor, Off Utalii Lane\r\nP.O. Box 30027 -00100 Nairobi\r\nEmail: info@tourismauthority.go.ke\r\n\r\n6. All positions are on permanent and pensionable terms.\r\n7. Tourism Regulatory Authority is an equal opportunity employer and women, minorities, marginalized and persons living with disabilities are encouraged to apply. Only shortlisted candidates will be contacted.\r\n\r\nDirector General,\r\nTourism Regulatory Authority.','2017-08-30 19:47:08','2017-08-30 19:47:08',3,3,29,'Tourism Regulatory Authority (TRA) ','350000','2017-10-31 00:00:00','Nairobi',0),(14,'Hotel General Manager','hotel-general-manager',' Job Summary\r\n\r\nOur client, a fast growing hotel in Nairobi, is looking to fill the position of General Manager with a great track record in the hospitality industry\r\nJob Description\r\n\r\nIndustry: Hospitality\r\n\r\nLocation: Nairobi\r\nSalary: 150k – 200K\r\n\r\nGeneral Manager Job Responsibilities\r\n\r\n    Oversee the operations functions of the hotel, as per the Organizational policy and procedures.\r\n    Hold regular briefings and meetings with all head of departments.\r\n    Ensure full compliance to Hotel operating controls, SOP’s, policies, procedures and service standards.\r\n    Lead all key property issues including capital projects, customer service and refurbishment.\r\n    Handling complaints, and oversee the service recovery procedures.\r\n    Responsible for the preparation, presentation and subsequent achievement of the hotel’s annual Operating Budget, Marketing & Sales Plan and Capital Budget.\r\n    Manage on-going profitability of the hotel, ensuring revenue and guest satisfaction targets are met and exceeded.\r\n    Ensure all decisions are made in the best interest of the hotel and management.\r\n    Deliver hotel budget goals and set other short and long term strategic goals.\r\n    Developing improvement actions, carry out costs savings and have the ability to react with impactful strategies\r\n    Closely monitor the hotel business report on a daily basis and take decisions accordingly.\r\n    Ensure that monthly financial outlooks for Rooms, Food & Beverage, General Admin and target are accurate.\r\n    Maximizing room yield and hotels / resort revenue through innovative sales practices and yield management programs.\r\n    Prepare a monthly financial reporting for the owners and stake holders.\r\n    Helping in the procurement of operating supplies and equipment, and contracting with third-party vendors for essential equipment and services.\r\n    Coordination with HOD’s for the execution of all activities and functions.\r\n    Lead in all aspects of business planning and provide effective leadership to hotel team members.\r\n    Responsible for safeguarding the quality of operations both (internal & external audits) and respond to audits to ensure continual improvement is achieved.\r\n    Responsible for legalization, Occupational Health & Safety Act, fire regulations and other legal requirements.\r\n\r\nQualifications for the General Manager Job\r\n\r\n    Bachelor’s Degree in Business Administration or related field of study\r\n    Consistent track record of employment with at least 5 years of senior operations leadership experience in positions of increasing responsibility\r\n    Expertise in service excellence and seasonal business operations\r\n    Refined skill set in human resource management (training, performance management and development, employee engagement.)\r\n    Leadership skills with the ability to motivate a veteran staff and earn their respect.\r\n    An outgoing and friendly personality and hands-on.\r\n    Excellent communication skills at all levels.\r\n    A strong sense of service with proven training skills.\r\n    The ability to see the “big picture” but also to have a critical eye for detail.\r\n    Overall operating budget (P & L) responsibility.\r\n\r\nCompetencies:\r\n\r\n    Operations management\r\n    Financial analysis and cost-based management\r\n    Budgeting\r\n    Vision and Strategic planning\r\n    Vendor relationship management\r\n    Human resources talent management','2017-08-30 19:53:41','2017-08-30 19:53:41',3,3,29,'Hilton Hotel','52000','2017-12-15 00:00:00','Kisumu',0),(15,'Monitoring and Evaluation Technical Consultant','monitoring-and-evaluation-technical-consultant',' Job Summary\r\n\r\nApplications are invited from qualified persons for the above vacant position.\r\nJob Description\r\n\r\nThe Association of Public Health Laboratories (APHL) through a cooperative agreement with the U.S. Centers for Disease Control and Prevention (CDC), Division of Global HIV/AIDS and TB Program (DGHT) is supporting the Presidents Emergency Plan for AIDS Relief (PEPFAR). APHL is supporting the National Public Health Laboratories (NPHL) in implementation of laboratory strengthening activities. The Monitoring and Evaluation (M&E) Technical Consultant will support the development of organizational performance management frameworks, as well as specific program M&E needs to ensure the quality, and effectiveness of program implementation. This individual will provide assistance to the program staff in developing performance monitoring plans during program design and implementation, creating M&E system, processes and tools, designing evaluation studies and contributing to measuring, analyzing, and reporting results.\r\n\r\nM&E Responsibilities\r\n\r\n• Work with project leads in the design, planning, and implementation of project M&E tools and strategies, and development and monitoring of project indicators\r\n• Work with funder and technical teams to determine the scope and nature of required evaluation studies (baseline, mid-term or end-term evaluations)\r\n• Develop protocols, instruments (e.g. questionnaires, checklists, discussion guides and interview forms) for data collection\r\n• Conduct and/or provide oversight of data collection, analysis, and reporting\r\n• Assist technical teams in tracking and reporting performance against project timelines and deliverables in each of the project areas\r\n• Train data collectors on quality data collection methods\r\n• Oversee evaluation impact studies to include establishment of evaluation protocols and analysis plans, management of the hiring of contractors, and overseeing the implementation of studies Develop program quality improvement plans with project and technical team Attend program performance review meetings organized by funding agency and other stakeholders\r\n• In collaboration with team lead and program manager provide technical input in submission of quarterly required data indicators to funding agency as required Develop transition plan of projects to the Ministry and establish monitoring systems to track progress. Regularly develop and submit post training/meeting report Additional Responsibilities\r\n• Participate in development of project work plans and monitor their implementation\r\n• Seek HQ approval and oversee response to logistical needs and requirements generated by Ministry of Health (MoH)\r\n• Provide support and coordination of technical team on progress for current country projects.\r\n• Establish and maintain strong working relationship with partners and government departments\r\n\r\nRequired Experience\r\n\r\nMinimum qualifications (experience in the following areas):\r\n\r\n• Bachelors or Masters in Public Health, other Social Science Fields - Masters preferred; other relevant certification\r\n• Five to ten years of professional experience on program evaluation, data analysis and survey development required.\r\n• Experience working on applied research and project monitoring and evaluation for donor-funded projects (experience with USAID, CDC or State Department projects highly desirable)\r\n• Knowledge of monitoring and evaluation approaches and frameworks\r\n• Knowledge of social science research methods\r\n• Proficiency in data analysis and technical report writing\r\n• Demonstrated MS Excel and MS Office suite skills.\r\n• Excellent organizational, communication and management skills\r\n• Ability to work independently, with minimal supervision and in a team setting, organize work projects and complete tasks within assigned timeframes\r\n• Ability to establish working relationships with diverse groups\r\n\r\nDesired qualifications (experience or academic work in the following areas):\r\n\r\n• Experience in survey development and deployment processes\r\n• Proficiency with qualitative data collection methods (focus groups, in-depth interviews, etc.)\r\n• Proficiency in statistical analysis and qualitative analysis\r\n• Experience with statistical and qualitative analysis software\r\n\r\nAll interested parties should send their application and updated CV','2017-08-30 19:57:05','2017-08-30 19:57:05',3,3,24,'Association of Public Health Laboratories ','234000','2018-02-09 00:00:00','Mombasa',0),(16,'Managing Director','managing-director',' Job Summary\r\n\r\nApplications are invited from qualified persons for the above vacant position.\r\nJob Description\r\n\r\nNairobi City Water and Sewerage Company Ltd is mandated to provide Water and Sanitation Services within the County of Nairobi. As part of our continued growth and team strengthening, we are looking for self-motivated, qualified, competent, seasoned and talented professionals capable of operating in a fast paced and demanding environment in the following positions:-\r\n\r\nDirectorate: Managing Director\r\nPosition: Managing Director - Ref: NCWSC2017-001\r\nGrade: 1\r\nLocation: Headquarters -Kampala Road Industrial Area, Nairobi.\r\nReporting to: Board of Directors\r\n\r\nBroad Role\r\n\r\nTo lead the management team of the company and be responsible for the day to day operations in order to provide for the effective and efficient provision of water and sewerage services at optimal cost, be responsible for ordinary expenditure within approved budgets, keep the board informed on performance, prepare corporate plans and budgets and implement board resolutions. He or she shall represent the management in the board.\r\n\r\nDuties and Responsibilities\r\n\r\nEnsure shareholder and other stakeholders’ value increment through;\r\n\r\n• Provision of leadership on the operations and ensure high level of integrity in the Company\r\n• Communication to the public on the issues of water and sewerage services\r\n• Handling multiple functions and managing extensive human, financial and capital resources\r\n• Ensuring prudent management of Company assets\r\n• Strategy development and implementation\r\n• Driving change management in the Company\r\n\r\nEducation, Professional Qualifications and Work Experience\r\n\r\n• Bachelor Degree in Engineering, Finance, Economics or Law.\r\n• Master’s Degree in respective field\r\n• 15 years’ experience, three (3No.) of which must be at senior management in utility management\r\n• Must be registered with a relevant professional body.\r\n• Master of Business Administration (MBA) in strategic management is an added advantage\r\n\r\nRequired Skills and Competencies:\r\n\r\n• Strong management, leadership and negotiation skills\r\n• Computer literacy and familiarity with standard office computer applications\r\n• Excellent interpersonal and communication skills\r\n• Ability to work under pressure and meet deadlines\r\n• Able to multitask in a fast-paced environment\r\n\r\nIf you are the right person we are looking for, send your application in confidence clearly indicating the names and contacts of three referees, one of whom must be a current or former Employer. Attach copies of academic certificates and other relevant testimonials.\r\n\r\nThe envelope should be sealed and properly labeled on top with the job code of the position for which you are applying. The applications are to be sent or delivered to the address indicated below:-\r\n\r\n\r\nChairman, Board of Director,\r\nNairobi City Water and Sewerage Company Ltd,\r\nKampala Road, Off Enterprise Road, Industrial Area,\r\nP.O. Box 30656-00100,\r\nNAIROBI - KENYA.\r\n\r\nThe deadline for submission of applications is 13th September 2017 before 4.00 pm\r\n\r\nOnly shortlisted candidate will be contacted\r\nAny form of canvassing shall lead to automatic disqualification','2017-08-30 20:01:35','2017-08-30 20:01:35',3,3,3,'Nairobi Water and Sewerage Company (NWSC) ','450000','2018-10-10 00:00:00','Nairobi',0),(17,'Chief Operation Officer (COO)','chief-operation-officer-coo',' Job Summary\r\n\r\nOur client, a dynamic company that operates a mobile-based business to business supply platform for retail outlets is looking to recruit a COO\r\nJob Description\r\n\r\nThe Chief Operation Officer (COO) will be in charge of the entire operations of their quickly growing scale-up enterprise. The ideal candidate Must have over 10 years’ experience in FMCG, route-to-market and consumer goods operations management. \r\n\r\nKey Responsibilities:\r\n\r\n    Manage harvest collection, supply chain, warehousing and route to market\r\n    In-charge of the entire operations of the business to their quickly growing scale-up enterprise\r\n    Take ownership of systems roadmaps & designs, process mgt, customer experience, & implementation mgt\r\n    Prepare and review marketing plans on a regular basis.\r\n    Conduct research to identify new markets and customer needs.\r\n    Meet a set KPI within the month. \r\n\r\nQualifications: \r\n\r\n    Degree in business, engineering, logistics, or other relevant fields\r\n    Must have over 10 years’ experience in FMCG, route-to-market and consumer goods operations management\r\n    Must have 6 years in Senior Management\r\n    Must have experience working in East Africa region.\r\n    Must have an appreciation of Agriculture.\r\n    Must have proven, quick, project management skills\r\n    Proven track record of leading in a growth-target based environment\r\n    Process-focused with strong analytical and system setting skills\r\n    Great communicator\r\n    Comfortable in a tech-based environment\r\n    Extremely collaborative, and flexible, in a highly flexible and solution based environment\r\n    Has gotten big things done in an adverse environment \r\n\r\nMonthly gross salary: Ksh. 600,000 - 800,000/= (Approx. 6,000 – 8,000 USD) depending on skills and experience    \r\n\r\nDeadline: 29th September 2017    \r\n\r\nWe endeavour to make contact with all of our applicants, but unfortunately high volumes of applications make this unrealistic. If you do not hear from us within two weeks your application has not been successful on this occasion. This does not mean you will not be considered for future roles so please keep an eye on our job board and apply for positions that match your skills and experience.','2017-08-30 20:04:14','2017-08-30 20:04:14',3,3,3,'Barclays Bank','650000','2018-05-09 00:00:00','Mandera',0),(18,'Interview Invitation','interview-invitation','Interview Invitation','2017-08-30 22:33:49','2017-08-30 22:33:49',2,2,1,'interview','0','2017-08-30 00:00:00','interview',1);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_application`
--

DROP TABLE IF EXISTS `job_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `application_date` datetime NOT NULL,
  `invited` int(11) DEFAULT '0',
  `cover_letter` text NOT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `job_application_index` (`user_id`,`job_id`,`application_date`,`invited`,`type`),
  KEY `fk_job_application_job` (`job_id`),
  CONSTRAINT `fk_job_application_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_application_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_application`
--

LOCK TABLES `job_application` WRITE;
/*!40000 ALTER TABLE `job_application` DISABLE KEYS */;
INSERT INTO `job_application` (`id`, `user_id`, `job_id`, `application_date`, `invited`, `cover_letter`, `type`) VALUES (1,2,1,'2017-08-30 00:00:00',0,'Testing',0),(2,3,3,'2017-08-30 00:00:00',NULL,'Galaxies are categorized according to their visual morphology as elliptical,[4] spiral, or irregular.[5] Many galaxies are thought to have black holes at their active centers. The Milky Way\'s central black hole, known as Sagittarius A*, has a mass four million times greater than the Sun.[6] As of March 2016, GN-z11 is the oldest and most distant observed galaxy with a comoving distance of 32 billion light-years from Earth, and observed as it existed just 400 million years after the Big Bang.\r\n\r\nRecent estimates of the number of galaxies in the observable universe range from 200 billion (2×1011)[7] to 2 trillion (2×1012) or more,[8][9] containing more stars than all the grains of sand on planet Earth.[10] Most of the galaxies are 1,000 to 100,000 parsecs in diameter and separated by distances on the order of millions of parsecs (or megaparsecs).\r\n\r\nThe space between galaxies is filled with a tenuous gas having an average density of less than one atom per cubic meter. The majority of galaxies are gravitationally organized into groups, clusters, and superclusters. At the largest scale, these associations are generally arranged into sheets and filaments surrounded by immense voids.[11] The largest structure of galaxies yet recognised is a cluster of superclusters that has been named Laniakea',NULL),(3,3,5,'2017-08-30 00:00:00',0,'Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond Neptune. It was the first Kuiper belt object to be discovered.\r\n\r\nPluto was discovered by Clyde Tombaugh in 1930 and was originally considered to be the ninth planet from the Sun. After 1992, its status as a planet was questioned following the discovery of several objects of similar size in the Kuiper belt. In 2005, Eris, a dwarf planet in the scattered disc which is 27% more massive than Pluto, was discovered. This led the International Astronomical Union (IAU) to define the term \"planet\" formally in 2006, during their 26th General Assembly. That definition excluded Pluto and reclassified it as a dwarf planet.\r\n\r\nPluto is the largest and second-most-massive known dwarf planet in the Solar System and the ninth-largest and tenth-most-massive known object directly orbiting the Sun. It is the largest known trans-Neptunian object by volume but is less massive than Eris. Like other Kuiper belt objects, Pluto is primarily made of ice and rock and is relatively small—about one-sixth the mass of the Moon and one-third its volume. It has a moderately eccentric and inclined orbit during which it ranges from 30 to 49 astronomical units or AU (4.4–7.4 billion km) from the Sun. This means that Pluto periodically comes closer to the Sun than Neptune, but a stable orbital resonance with Neptune prevents them from colliding. Light from the Sun takes about 5.5 hours to reach Pluto at its average distance (39.5 AU).\r\n\r\nPluto has five known moons: Charon (the largest, with a diameter just over half that of Pluto), Styx, Nix, Kerberos, and Hydra. Pluto and Charon are sometimes considered a binary system because the barycenter of their orbits does not lie within either body.\r\n\r\nOn July 14, 2015, the New Horizons spacecraft became the first spacecraft to fly by Pluto. During its brief flyby, New Horizons made detailed measurements and observations of Pluto and its moons. In September 2016, astronomers announced that the reddish-brown cap of the north pole of Charon is composed of tholins, organic macromolecules that may be ingredients for the emergence of life, and produced from methane, nitrogen and other gases released from the atmosphere of Pluto and transferred about 19,000 km (12,000 mi) to the orbiting moon.',0),(4,2,17,'2017-08-30 00:00:00',1,'This is a test',0),(5,2,14,'2017-08-30 00:00:00',1,'This is also a test. ',0);
/*!40000 ALTER TABLE `job_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_invitation`
--

DROP TABLE IF EXISTS `job_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_invitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `invitation_date` datetime NOT NULL,
  `target_date` datetime NOT NULL,
  `target_venue` varchar(128) NOT NULL,
  `type` int(11) DEFAULT '0',
  `accepted` int(11) DEFAULT '0',
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `job_invitation_index` (`user_id`,`job_id`,`invitation_date`,`target_date`,`type`,`target_venue`,`accepted`),
  KEY `fk_job_invitation_job` (`job_id`),
  CONSTRAINT `fk_job_invitation_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_invitation_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_invitation`
--

LOCK TABLES `job_invitation` WRITE;
/*!40000 ALTER TABLE `job_invitation` DISABLE KEYS */;
INSERT INTO `job_invitation` (`id`, `user_id`, `job_id`, `invitation_date`, `target_date`, `target_venue`, `type`, `accepted`, `description`) VALUES (1,2,1,'2017-08-30 00:00:00','2017-09-10 00:00:00','Nairobi Hospital',0,0,NULL),(3,2,11,'2017-08-30 00:00:00','2017-08-31 00:00:00','Nairobi River',0,0,'This is a test'),(4,2,12,'2017-08-30 00:00:00','2017-08-31 00:00:00','Nairobi River',0,0,'This is a test'),(5,3,18,'2017-08-30 00:00:00','2017-10-06 00:00:00','Lamu East',0,1,'Our client is a fast growing, locally owned and profitable niche success story in the Real Estate sector. With a “topgrade” client-base (both locally and International), a strong brand, a quality pipeline and a highly-skilled workforce, they have an excellent platform for continued growth. Moreover, they are at the mid-point of transition to a more strategic, value-adding and market-driven business. As such, they seek the leadership and management skills of a commercial and strategic business leader to become their CEO and fulfil their potential. The ambition is to deliver continued sustainable growth for their stakeholders.'),(6,2,17,'2017-08-30 00:00:00','2018-04-05 00:00:00','Sagana',0,0,'Hi,\r\n\r\nThis is an invitation to the interview'),(7,2,14,'2017-08-30 00:00:00','2018-04-19 00:00:00','Voi',0,0,'This is a sample invitation to interview'),(8,2,17,'2017-08-30 00:00:00','2017-10-19 00:00:00','Kisumu',0,0,'Yet another invitation');
/*!40000 ALTER TABLE `job_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_tag`
--

DROP TABLE IF EXISTS `job_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `job_tag_index` (`job_id`,`tag_id`),
  KEY `fk_job_tag_tag` (`tag_id`),
  CONSTRAINT `fk_job_tag_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_tag`
--

LOCK TABLES `job_tag` WRITE;
/*!40000 ALTER TABLE `job_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES ('m000000_000000_base',1503873520),('m130524_201442_init',1503873556),('m140506_102106_rbac_init',1503905063),('m170827_083306_create_tag_table',1503873556),('m170827_083625_create_category_table',1503873556),('m170827_083850_create_job_table',1503873557),('m170827_084337_create_job_tag_table',1503873557),('m170827_150013_create_countries_table',1503873620),('m170827_150023_create_profile_table',1503873732),('m170827_150050_create_profile_education_table',1503873732),('m170827_150113_create_profile_experience_table',1503873732),('m170827_151435_create_profile_language_table',1503873732),('m170829_173202_create_job_application_table',1504029630),('m170829_173225_create_job_invitation_table',1504029631);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `dob` datetime NOT NULL,
  `expected_salary` int(11) NOT NULL,
  `description` text NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_index` (`user_id`,`country_id`,`dob`,`expected_salary`),
  KEY `fk_profile_country` (`country_id`),
  CONSTRAINT `fk_profile_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`id`, `user_id`, `country_id`, `dob`, `expected_salary`, `description`, `first_name`, `last_name`, `address`) VALUES (1,2,192,'1998-07-15 00:00:00',160000,'The Boeing 747 is an American wide-body commercial jet airliner and cargo aircraft, often referred to by its original nickname, Jumbo Jet. Its distinctive \"hump\" upper deck along the forward part of the aircraft makes it among the world\'s most recognizable aircraft,[5] and it was the first wide-body produced. Manufactured by Boeing\'s Commercial Airplane unit in the United States, the original version of the 747 was envisioned to have 150 percent greater capacity than the Boeing 707,[6] one of the common large commercial aircraft of the 1960s. First flown commercially in 1970, the 747 held the passenger capacity record for 37 years.[7]\r\n\r\nThe four-engine 747 uses a double-deck configuration for part of its length. It is available in passenger, freighter and other versions. Boeing designed the 747\'s hump-like upper deck to serve as a first class lounge or extra seating, and to allow the aircraft to be easily converted to a cargo carrier by removing seats and installing a front cargo door. Boeing did so because the company expected supersonic airliners (development of which was announced in the early 1960s) to render the 747 and other subsonic airliners obsolete, while the demand for subsonic cargo aircraft would be robust well into the future.[8] The 747 was expected to become obsolete after 400 were sold,[9] but it exceeded critics\' expectations with production passing the 1,000 mark in 1993.[10] By July 2017, 1,533 aircraft had been built, with 18 of the 747-8 variants remaining on order.[4] As of January 2017, the 747 has been involved in 60 hull losses, resulting in 3,722 fatalities.[11]','John','Green','P.O Box 66678 NY NY'),(2,3,230,'1996-07-10 00:00:00',43000,'The Supreme Court of the United States is the highest federal court of the United States. Established pursuant to Article Three of the United States Constitution in 1789, it has ultimate (and largely discretionary) appellate jurisdiction over all federal courts and state court cases involving issues of federal law plus original jurisdiction over a small range of cases. In the legal system of the United States, the Supreme Court is generally the final interpreter of federal law including the United States Constitution, but it may act only within the context of a case, in which it has jurisdiction. The Court does not have power to decide political questions, and its enforcement arm is in the executive rather than judicial branch of government.\r\n\r\nAccording to federal statute, the Court normally consists of the Chief Justice of the United States and eight associate justices who are nominated by the President and confirmed by the Senate. Once appointed, justices have lifetime tenure unless they resign, retire, or are removed after impeachment (though no justice has ever been removed).[1] In modern discourse, the justices are often categorized as having conservative, moderate, or liberal philosophies of law and of judicial interpretation. Each justice has one vote, and it is worth noting while a far greater number of cases in recent history have been decided unanimously, decisions in cases of the highest profile have come down to just one single vote, thereby exposing the justices\' ideological beliefs that track with those philosophical or political categories. The Court meets in the Supreme Court Building in Washington, D.C','Jack','Doe','P.O Box 2839928 Houston Texas');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_education`
--

DROP TABLE IF EXISTS `profile_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `institution` varchar(128) NOT NULL,
  `course` varchar(128) NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_education_index` (`profile_id`,`institution`,`course`,`date_from`,`date_to`),
  CONSTRAINT `fk_profile_education_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_education`
--

LOCK TABLES `profile_education` WRITE;
/*!40000 ALTER TABLE `profile_education` DISABLE KEYS */;
INSERT INTO `profile_education` (`id`, `profile_id`, `institution`, `course`, `date_from`, `date_to`) VALUES (2,1,'Strathmore University','Bachelor Of Arts','2007-04-04 00:00:00','2011-05-20 00:00:00'),(1,1,'University Of Nairobi','Bachelor Of Science','2000-01-01 00:00:00','2006-12-04 00:00:00'),(4,2,'Salt Lake University','Masters In Cooking','2014-04-01 00:00:00','2016-08-11 00:00:00'),(3,2,'University Of Alkansas','Bachelor Of Cooking','2016-09-01 00:00:00','2017-08-01 00:00:00');
/*!40000 ALTER TABLE `profile_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_experience`
--

DROP TABLE IF EXISTS `profile_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `company` varchar(128) NOT NULL,
  `profession` varchar(128) NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_experience_index` (`profile_id`,`company`,`profession`,`date_from`,`date_to`),
  CONSTRAINT `fk_profile_experience_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_experience`
--

LOCK TABLES `profile_experience` WRITE;
/*!40000 ALTER TABLE `profile_experience` DISABLE KEYS */;
INSERT INTO `profile_experience` (`id`, `profile_id`, `company`, `profession`, `date_from`, `date_to`) VALUES (5,1,'Citizen Media','Tea Girl','2007-12-12 00:00:00','2015-04-16 00:00:00'),(3,1,'Nation Media','Reporter','1998-05-05 00:00:00','2005-01-01 00:00:00'),(4,1,'Standard Media','Camera Man','2005-06-01 00:00:00','2007-10-08 00:00:00'),(7,2,'EABL','Wine Tester','2011-06-15 00:00:00','2015-06-11 00:00:00'),(6,2,'East African Industries','Mechanic','2013-07-09 00:00:00','2017-08-02 00:00:00');
/*!40000 ALTER TABLE `profile_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_language`
--

DROP TABLE IF EXISTS `profile_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `language_name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_language_index` (`profile_id`,`language_name`),
  CONSTRAINT `fk_profile_language_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_language`
--

LOCK TABLES `profile_language` WRITE;
/*!40000 ALTER TABLE `profile_language` DISABLE KEYS */;
INSERT INTO `profile_language` (`id`, `profile_id`, `language_name`) VALUES (1,1,'English'),(2,1,'Swahili'),(5,2,'French'),(6,2,'Spanish');
/*!40000 ALTER TABLE `profile_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES (2,'test','guRwKv4QgJyQrBZx_ARqPuZ-uXFeoxp3','$2y$13$s1sCdH3LruGdXRoRLPXxQ.O0F.JgpRYFLbPO9VWx.T6RkMfDDbEV2',NULL,'test@test.com',10,1503905490,1503905490),(3,'test1','YY1upmSnBggRsIY3KubzzhuAGuel3joG','$2y$13$5rkV2357fZ8FBg7kRZKVkeXGZChXyJRGGkr2p0nfPsFPuuYhSIedC',NULL,'test1@test.com',10,1504013744,1504013744);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'recruiter'
--

--
-- Dumping routines for database 'recruiter'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-31  0:02:23
