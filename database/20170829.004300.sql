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
INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES ('admin','2',1503905490);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `slug` (`slug`),
  KEY `job_index` (`created_by`,`updated_by`),
  KEY `fk_job_category` (`category_id`),
  KEY `fk_job_user_updated_by` (`updated_by`),
  CONSTRAINT `fk_job_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_user_created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_job_user_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` (`id`, `title`, `slug`, `content`, `created_at`, `updated_at`, `created_by`, `updated_by`, `category_id`) VALUES (1,'ICT Officer','ict-officer','Job Summary \r\nApplications are invited from qualified persons for the above vacant position. \r\n\r\nJob Description \r\n\r\nTourism Regulatory Authority (TRA) is a state corporation established under Tourism Act No. 28 of 2011 to regulate, manage and provide strategic direction to the tourism industry in Kenya. As part of its establishment and in its course to deliver its mandate, the Authority now invites applications from qualified, innovative and experienced individuals to fill the following vacant positions. \r\n\r\nS/NO POSITION POSTS REFERENCE \r\n5 ICT OFFICER-TRA 6 1 TRA /ICTO/6/2017 \r\n\r\na) Job Descriptions \r\nDuties and responsibilities at this level will include: - \r\ni. Analyzing, designing, coding, testing and implementing computer programs. \r\nii. Providing user support, maintaining support systems and training of users. \r\niii. Repairing and maintaining Information Communication Technology equipment and associated peripherals. \r\niv. Receiving, installing and certifying of Information Communication Technology equipment. and \r\nv. Configuring new Information Communication Technology equipment. \r\n\r\nb) Job Specifications \r\nFor appointment to this grade, a candidate must:- \r\ni. Have a Bachelor’s degree in any of the following: Computer Science, Information Technology or related field from a recognized Institution. and \r\nii. Have a recognized professional certification in the field of ICT. \r\n\r\nNOTES \r\n1. Kindly visit the Authority’s website http://www.tourismauthority.go.ke for detailed information on the qualification requirements for each of the positions. \r\n2. Interested and qualified persons are required to submit their application letter, detailed Curriculum Vitae, certified copies of relevant academic certificates, National Identity card/Passport, testimonials and other relevant supporting documents. \r\n3. Applicants should give details of their e-mail address, day time telephone contact and three referees. \r\n4. Applicants MUST quote the Job reference number on the envelope. \r\n5. The application letter to be addressed to undersigned and to reach on or before 6th September, 2017. \r\n\r\nThe Director General \r\nTourism Regulatory Authority \r\nUtalii House, 5th Floor, Off Utalii Lane \r\nP.O. Box 30027 -00100 Nairobi \r\nEmail: info@tourismauthority.go.ke \r\n\r\n6. All positions are on permanent and pensionable terms. \r\n7. Tourism Regulatory Authority is an equal opportunity employer and women, minorities, marginalized and persons living with disabilities are encouraged to apply. Only shortlisted candidates will be contacted. \r\n\r\nDirector General, \r\nTourism Regulatory Authority.\r\n','2017-08-29 00:35:11','2017-08-29 00:35:11',2,2,13),(2,'FINANCE AND ADMINISTRATION MANAGER','finance-and-administration-manager','Job Summary \r\n\r\nResponsible for financial management and accountability at the distributor \r\n\r\nJob Description \r\n\r\nPRIMARY RESPONSIBILITIES \r\n- To manage the Company’s working capital and other operations, including management and statutory accounts together with longer term financial projections and to ensure that the most efficient and effective financial control systems and reporting mechanisms are in place. \r\n- To prepare monthly management accounts and projections and other relevant reports, in consultation with the Head Office Finance Manager and other departments, for presentation to the Board of Directors. \r\n- To prepare the year-end financial accounts for audit and to liaise with the Head office Finance manager and Auditors prior to sign-off. \r\n- To ensure the overall smooth running of the Company’s internal administration and its cost-effectiveness \r\n- To manage, in conjunction with the Head Office finance Manager, staff contracts and HR matters. \r\n- To manage personnel procedures in relation to recruitment, training, holidays and appraisals, ensuring these are properly documented, and advise on relevant policies. \r\n- To be responsible for the Company’s IT resources, maintaining and implementation. \r\n- Oversee other departments which include; Sales and operation departments. \r\n- To ensure effective policies and procedures implementation within the organization. \r\n\r\nPersonal Specification \r\n- Excellent problem-solving skills \r\n- Excellent planner and strategic thinker. \r\n- Ability to deliver timely results despite obstacles and limited resources. \r\n- Self-motivation, a strong work ethic and enthusiasm for change. \r\n- A keen interest in satisfying internal and external customers. \r\n- Good communication, organisational skills and ability to work under pressure \r\n\r\nQualifications \r\n- Holder of Bachelor of Commerce /Bachelor of Business Management degree from recognized university \r\n- Atleast C.P.A Part II \r\n- 5 years’ experience in accounting, finance and administration from a reputable organization \r\n- At least 2 years’ experience at management level, preferably in FMCG\r\n\r\n','2017-08-29 00:37:08','2017-08-29 00:37:08',2,2,1),(3,'Agronomist','agronomist','Job Summary \r\n\r\nAgronomist required immediately for a farm in Naivasha. \r\n\r\nJob Description \r\n\r\nQualification: \r\n\r\nCertificate, Diploma or Degree in Horticulture or related field. \r\nMust have hands on experience minimum 3 years in growing of fruits, vegetables etc under irrigation scheme and be well versed with insect and pests management. \r\n\r\nHow to Apply: \r\n\r\nPlease send your resume/CV','2017-08-29 00:38:23','2017-08-29 00:38:23',2,2,8),(4,'Actuarial Function Senior Officer','actuarial-function-senior-officer','Job Summary \r\n\r\nApplications are invited from qualified persons for the above vacant position. \r\n\r\nJob Description \r\n\r\nJob Summary: The incumbent shall be responsible for evaluation of, and the provision of advice to GA Insurance Ltd concerning: \r\n\r\n- The technical provisions; \r\n- Premium and pricing; \r\n- Scenario and sensitivity testing; \r\n- and Compliance with the statutory obligations of the line business \r\n\r\nMain Responsibilities \r\n\r\nThe incumbent shall be responsible for evaluation and advising on the following: \r\n\r\n- Valuation of liabilities and technical provisions. \r\n- Solvency position, including calculation of minimum capital required for regulatory purposes and liability and loss provisions; \r\n- Prospective solvency position and distribution of benefits; Reinsurance arrangements; \r\n- Actuarial and financial risks; Risk assessment and management policies and controls relevant to actuarial matters or financial condition; \r\n- Product development and design, including the terms and conditions of insurance contracts; \r\n- Sufficiency and quality of data used in the calculation of technical provisions; \r\n- Investment policies and the valuation of assets; \r\n- Underwriting policies, risk modeling and use of internal models. \r\n\r\nAcademic Qualifications: \r\n\r\n- Graduate with a degree in Actuarial Science / Statistics \r\n- Professional actuarial exams (minimum 12/15 exams) \r\n\r\nFunctional Skills \r\n\r\n- Analytical Skills \r\n- Exploitation and application of Information Technology \r\n- Actuarial modelling \r\n- Risk Management \r\n- Visionary Leadership \r\n- Market Awareness \r\n- Customer Focus \r\n- Continuous Innovation \r\n- Ownership & Commitment \r\n- Team Spirit \r\n- The candidate must have at least 4 year of relevant experience: \r\n\r\nHow to Apply \r\nIf you meet the above minimum requirements, send your c.v. Indicate the position applied for on the email subject line so as to be received on or before 1st September, 2017. Only short listed candidates will be contacted.\r\n\r\n','2017-08-29 00:40:28','2017-08-29 00:40:28',2,2,12),(5,'Chief Security Officer','chief-security-officer','Job Summary\r\n\r\nApplications are invited from qualified persons for the above vacant position. \r\n\r\nJob Description \r\n\r\nAfrica International University (formerly Nairobi Evangelical Graduate School of Theology – NEGST) is a private Chartered International Christian University with its main Campus located in Karen, Nairobi. Our Mission is to educate Christ centred leaders for the transformation of God’s people and the world through innovative programs, research and community engagement. We are seeking highly motivated professionals to fill the following positions: \r\n\r\nChief Security and Safety Officer \r\n\r\nApplicants must be a former police Officer having served in the position of Officer Commanding Station (OCS) for 5 years or Officer Commanding Police Division (OCPD) for 5 years, have a secondary school education certificate supplemented by courses/diploma in security training and/or certified graduation from police academy or related field. S/he must have excellent investigation skills, Administrative skills, computer skills, knowledge of associated electronic security devices, First aid and fire-fighting skills are desirable, and must be a committed Christian. \r\n\r\nMain Responsibilities: \r\n\r\nThe job holder will be in charge of Overseeing the security and safety of students, employees and facilities, developing and enforcing safety rules and regulations aimed at reducing risk, supervising all the activities of the contracted service provider and will be the main point of contact in the event of any emergency or security incidents that occur on site with the task of Investigating and preparing reports on those incidents/accidents. Having worked in a University will be an added advantage. Applications should be emailed ensuring vacancy code is in the subject. Attach a cover letter, detailed resume and duly filled job application form. Deadline for application is Wednesday, 30th August 2017 at 5.00pm. Only shortlisted applicants will be contacted. Academic and non-academic staff of AIU are required to be faithful to the evangelical faith and practice and to the Christian ethos and code of conduct of the University.\r\n','2017-08-29 00:41:22','2017-08-29 00:41:22',2,2,23),(6,'Real Estate Property Manager','real-estate-property-manager','Job Summary\r\n\r\nOur client seeks to hire an experienced Property Manager to oversee planning, coordination and implementation of all property management activities. \r\n\r\nJob Description \r\n\r\nOur client is a locally owned property consultancy firm that provides valuation, property management, facilities management, estate agency and property development consultancy services. \r\n\r\nLocation: Nairobi \r\nSalary: 80k -100k \r\n\r\nProperty Manager Job Responsibilities \r\n\r\n- Daily Management, supervision and communication with building supervisors, maintenance and security teams to ensure premises are always operating insatiable and safe conditions \r\n- Enforce terms of rental agreements and ensures compliance with relevant laws and regulations \r\n- Schedule property viewings and organize marketing efforts in order to maximize occupancy of premises under management \r\n- Manage relationships with suppliers, vendors and partners and provide regular recommendations and advice to management to optimize operations \r\n- Responsible for timely rent collection and proper reporting to ensure arrears and bad debts are minimized \r\n- Liaise and communicate regularly with finance department \r\n- Interact and communicate regularly with tenants to resolve any queries in a timely and satisfactory manner \r\n- Assist in drafting and implementing procedures, processes and controls in conjunction with staff under supervision and other departments \r\n- Train, manage, supervise and evaluate staff including building supervisors, maintenance and security personnel \r\n- Responsible for compliance with all regulatory requirements including: fire safety, construction permits, certificate of occupation, business permits and timely land rates and rents \r\n- Direct and control all personnel and resources to ensure properties are properly maintained and management company objectives are met \r\n- Carry out regular weekly detailed routine property inspections of each property in conjunction with other departments and review maintenance and security issues, safety processes and other operational issues \r\n- Update and organize all information relating to properties and tenants including building plans, regulatory certificates, statutory documents and tenancy agreements \r\n- Maintain an updated database of suppliers, authorized contractors and service providers \r\n- Draft and present weekly, monthly and quarterly reports for management including reporting on tenancy matters, maintenance, repairs, security and other suggested improvements \r\n- Be able to optimize efficient operations \r\n- In charge of setting up processes /procedures for building management \r\n\r\nQualifications for the Property Manager Job \r\n\r\n- Must have Degree in Land Economics \r\n- 3 years of experience in Property Management \r\n- Must have handled at least 2 construction Projects (Refurbishment) \r\n- Must have managed at least 6 properties \r\n- Should have a Finance exposure \r\n- Proficient in the use of IT skills in reporting \r\n- A track record of successful Project Management \r\n- Proven track record of completing projects successfully within stipulated timeline \r\n- Proven Managerial and Leadership skills\r\n\r\n','2017-08-29 00:41:59','2017-08-29 00:41:59',2,2,28);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
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
INSERT INTO `migration` (`version`, `apply_time`) VALUES ('m000000_000000_base',1503873520),('m130524_201442_init',1503873556),('m140506_102106_rbac_init',1503905063),('m170827_083306_create_tag_table',1503873556),('m170827_083625_create_category_table',1503873556),('m170827_083850_create_job_table',1503873557),('m170827_084337_create_job_tag_table',1503873557),('m170827_150013_create_countries_table',1503873620),('m170827_150023_create_profile_table',1503873732),('m170827_150050_create_profile_education_table',1503873732),('m170827_150113_create_profile_experience_table',1503873732),('m170827_151435_create_profile_language_table',1503873732);
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
  PRIMARY KEY (`id`),
  KEY `profile_index` (`user_id`,`country_id`,`dob`,`expected_salary`),
  KEY `fk_profile_country` (`country_id`),
  CONSTRAINT `fk_profile_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`id`, `user_id`, `country_id`, `dob`, `expected_salary`, `description`) VALUES (1,2,192,'1998-07-15 00:00:00',160000,'The Boeing 747 is an American wide-body commercial jet airliner and cargo aircraft, often referred to by its original nickname, Jumbo Jet. Its distinctive \"hump\" upper deck along the forward part of the aircraft makes it among the world\'s most recognizable aircraft,[5] and it was the first wide-body produced. Manufactured by Boeing\'s Commercial Airplane unit in the United States, the original version of the 747 was envisioned to have 150 percent greater capacity than the Boeing 707,[6] one of the common large commercial aircraft of the 1960s. First flown commercially in 1970, the 747 held the passenger capacity record for 37 years.[7]\r\n\r\nThe four-engine 747 uses a double-deck configuration for part of its length. It is available in passenger, freighter and other versions. Boeing designed the 747\'s hump-like upper deck to serve as a first class lounge or extra seating, and to allow the aircraft to be easily converted to a cargo carrier by removing seats and installing a front cargo door. Boeing did so because the company expected supersonic airliners (development of which was announced in the early 1960s) to render the 747 and other subsonic airliners obsolete, while the demand for subsonic cargo aircraft would be robust well into the future.[8] The 747 was expected to become obsolete after 400 were sold,[9] but it exceeded critics\' expectations with production passing the 1,000 mark in 1993.[10] By July 2017, 1,533 aircraft had been built, with 18 of the 747-8 variants remaining on order.[4] As of January 2017, the 747 has been involved in 60 hull losses, resulting in 3,722 fatalities.[11]');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_education`
--

LOCK TABLES `profile_education` WRITE;
/*!40000 ALTER TABLE `profile_education` DISABLE KEYS */;
INSERT INTO `profile_education` (`id`, `profile_id`, `institution`, `course`, `date_from`, `date_to`) VALUES (2,1,'Strathmore University','Bachelor Of Arts','2007-04-04 00:00:00','2011-05-20 00:00:00'),(1,1,'University Of Nairobi','Bachelor Of Science','2000-01-01 00:00:00','2006-12-04 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_experience`
--

LOCK TABLES `profile_experience` WRITE;
/*!40000 ALTER TABLE `profile_experience` DISABLE KEYS */;
INSERT INTO `profile_experience` (`id`, `profile_id`, `company`, `profession`, `date_from`, `date_to`) VALUES (5,1,'Citizen Media','Tea Girl','2007-12-12 00:00:00','2015-04-16 00:00:00'),(3,1,'Nation Media','Reporter','1998-05-05 00:00:00','2005-01-01 00:00:00'),(4,1,'Standard Media','Camera Man','2005-06-01 00:00:00','2007-10-08 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_language`
--

LOCK TABLES `profile_language` WRITE;
/*!40000 ALTER TABLE `profile_language` DISABLE KEYS */;
INSERT INTO `profile_language` (`id`, `profile_id`, `language_name`) VALUES (1,1,'English'),(2,1,'Swahili');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES (2,'test','guRwKv4QgJyQrBZx_ARqPuZ-uXFeoxp3','$2y$13$s1sCdH3LruGdXRoRLPXxQ.O0F.JgpRYFLbPO9VWx.T6RkMfDDbEV2',NULL,'test@test.com',10,1503905490,1503905490);
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

-- Dump completed on 2017-08-29  0:43:27
