-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Blogdb
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1

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
-- Table structure for table `Users_customuser`
--

DROP TABLE IF EXISTS `Users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_customuser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_customuser`
--

LOCK TABLES `Users_customuser` WRITE;
/*!40000 ALTER TABLE `Users_customuser` DISABLE KEYS */;
INSERT INTO `Users_customuser` VALUES
(1,'pbkdf2_sha256$260000$ZdPEyTcJA6horV1Fww7TIp$WVSDm76T3MibFGp6+/cgLUeXAwiUKXMaw84PyoPgDpA=','2023-10-05 03:20:42.028476',1,'yousseph','1youssou.ndiaye@gmail.com',1,1,'2023-10-04 14:01:57.624627','',''),
(2,'pbkdf2_sha256$260000$TprSVA0TPp6Q9vg5NgBVv0$gVpQuQqNKfScER1U+8ZhxXm1GtNpHmx1t+GnkG/nTlw=','2023-10-04 18:46:35.162190',0,'mohameth','',0,1,'2023-10-04 18:46:34.475489','Mohameth','NDIAYE'),
(3,'pbkdf2_sha256$260000$EtiRZeE5bNbkwIxSPum8re$mMAUxEs5jTBFYmpkCzt3EJ3W5Z148a2zCel9+JrU5cg=','2023-10-05 02:42:04.318787',0,'Marie','',0,1,'2023-10-05 02:38:39.547845','Marie','NDIAYE'),
(4,'pbkdf2_sha256$260000$8DvoSeBS3LjmKUsk6R49BD$2EMvlVCKyTTfn0JfXRo5BS64gxmZvKeRxFJgvsFE1Jw=','2023-10-05 02:59:58.305165',0,'Omar','',0,1,'2023-10-05 02:55:25.343306','Omar','THIAM');
/*!40000 ALTER TABLE `Users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_customuser_groups`
--

DROP TABLE IF EXISTS `Users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Users_customuser_groups_customuser_id_group_id_5ac5fb62_uniq` (`customuser_id`,`group_id`),
  KEY `Users_customuser_groups_group_id_c15c8f40_fk_auth_group_id` (`group_id`),
  CONSTRAINT `Users_customuser_gro_customuser_id_2cb9ebc6_fk_Users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `Users_customuser` (`id`),
  CONSTRAINT `Users_customuser_groups_group_id_c15c8f40_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_customuser_groups`
--

LOCK TABLES `Users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `Users_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `Users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Users_customuser_user_pe_customuser_id_permission_12209533_uniq` (`customuser_id`,`permission_id`),
  KEY `Users_customuser_use_permission_id_ff591115_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Users_customuser_use_customuser_id_f80eaa53_fk_Users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `Users_customuser` (`id`),
  CONSTRAINT `Users_customuser_use_permission_id_ff591115_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_customuser_user_permissions`
--

LOCK TABLES `Users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `Users_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add article',1,'add_article'),
(2,'Can change article',1,'change_article'),
(3,'Can delete article',1,'delete_article'),
(4,'Can view article',1,'view_article'),
(5,'Can add commentaire',2,'add_commentaire'),
(6,'Can change commentaire',2,'change_commentaire'),
(7,'Can delete commentaire',2,'delete_commentaire'),
(8,'Can view commentaire',2,'view_commentaire'),
(9,'Can add auteur',3,'add_auteur'),
(10,'Can change auteur',3,'change_auteur'),
(11,'Can delete auteur',3,'delete_auteur'),
(12,'Can view auteur',3,'view_auteur'),
(13,'Can add custom user',4,'add_customuser'),
(14,'Can change custom user',4,'change_customuser'),
(15,'Can delete custom user',4,'delete_customuser'),
(16,'Can view custom user',4,'view_customuser'),
(17,'Peut éditer ses propres articles',4,'can_edit_own_article'),
(18,'Can add log entry',5,'add_logentry'),
(19,'Can change log entry',5,'change_logentry'),
(20,'Can delete log entry',5,'delete_logentry'),
(21,'Can view log entry',5,'view_logentry'),
(22,'Can add permission',6,'add_permission'),
(23,'Can change permission',6,'change_permission'),
(24,'Can delete permission',6,'delete_permission'),
(25,'Can view permission',6,'view_permission'),
(26,'Can add group',7,'add_group'),
(27,'Can change group',7,'change_group'),
(28,'Can delete group',7,'delete_group'),
(29,'Can view group',7,'view_group'),
(30,'Can add content type',8,'add_contenttype'),
(31,'Can change content type',8,'change_contenttype'),
(32,'Can delete content type',8,'delete_contenttype'),
(33,'Can view content type',8,'view_contenttype'),
(34,'Can add session',9,'add_session'),
(35,'Can change session',9,'change_session'),
(36,'Can delete session',9,'delete_session'),
(37,'Can view session',9,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `contenu` longtext NOT NULL,
  `date_creation` datetime(6) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `auteur_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_auteur_id_762d9f93_fk_Users_customuser_id` (`auteur_id`),
  CONSTRAINT `blog_article_auteur_id_762d9f93_fk_Users_customuser_id` FOREIGN KEY (`auteur_id`) REFERENCES `Users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES
(1,'L\'Évolution de la Cybercriminalité : Tendances et Stratégies de Défense','L’année 2022 a vu une accélération sans précédent des activités cybercriminelles, avec des attaques de plus en plus sophistiquées et ciblées. Les cybercriminels ont exploité les vulnérabilités liées à la transition vers un monde numérique plus connecté, posant ainsi des défis majeurs en matière de cybersécurité. Voici un aperçu des tendances marquantes en matière de cybercriminalité en 2022\r\nRansomware et Extorsion\r\n\r\nLes attaques de ransomware ont évolué pour devenir encore plus sophistiquées. En 2022, une tendance notable est l’utilisation de la double extorsion. Les cybercriminels volent des données sensibles avant de chiffrer les systèmes, menaçant de publier ces données si la rançon n’est pas payée. Pour lutter contre cette menace, les entreprises doivent mettre en œuvre une stratégie de sauvegarde solide, des mesures de sécurité multicouches et une sensibilisation accrue des employés.\r\nAttaques sur la Chaîne d’Approvisionnement\r\n\r\nLes cybercriminels ont de plus en plus ciblé les fournisseurs et les partenaires d’une organisation pour accéder à leurs systèmes. Les attaques sur la chaîne d’approvisionnement ont compromis plusieurs entreprises à la fois, soulignant l’importance de sécuriser l’ensemble de l’écosystème numérique.\r\nAttaques ciblées sur l’Internet des Objets (IoT)\r\n\r\nL’expansion rapide de l’Internet des objets a ouvert de nouvelles voies pour les cybercriminels. Les attaques visant les appareils IoT se multiplient, compromettant la vie privée des individus et la sécurité des infrastructures critiques. Les objets connectés, souvent mal sécurisés, ont été exploités pour mener des attaques par déni de service distribué (DDoS) et pour accéder aux réseaux domestiques et d’entreprise. En 2022, les fabricants d’appareils IoT doivent renforcer la sécurité par conception, tandis que les utilisateurs doivent changer les mots de passe par défaut, mettre à jour régulièrement les appareils et segmenter les réseaux.\r\nEscroqueries liées à la COVID-19\r\n\r\nLes cybercriminels ont capitalisé sur la pandémie en utilisant des escroqueries liées à la COVID-19 pour diffuser des logiciels malveillants et voler des informations personnelles. Les campagnes de phishing et de désinformation ont également proliféré, profitant de l’anxiété mondiale liée à la crise sanitaire.\r\nAttaques ciblant la Finance et les Cryptomonnaies\r\n\r\nLe secteur financier a été la cible d’attaques visant à voler des informations sensibles et à dérober des cryptomonnaies. Les cybercriminels ont exploité les vulnérabilités dans les plateformes d’échange de cryptomonnaies et ont ciblé les portefeuilles numériques des particuliers.\r\nUtilisation Croissante de l’IA et de la Machine Learning\r\n\r\nLes cybercriminels ont commencé à utiliser l’intelligence artificielle et l’apprentissage automatique pour automatiser leurs attaques, améliorer la sophistication des logiciels malveillants et contourner les mesures de sécurité traditionnelles. Les attaques de phishing basées sur l’IA sont devenues plus réalistes, et les deepfakes* sont utilisés pour tromper les utilisateurs et accéder à des informations sensibles. Les entreprises doivent investir dans des systèmes de détection des menaces basées sur l’IA pour contrer ces nouvelles formes d’attaques.\r\n\r\n*Modifier une image, une vidéo ou un son en vue de tromper les internautes. La réalisation de cet “hypertrucage” multimédia consiste généralement à nuire en détournant sciemment l’image ou la voix d’une personne.\r\nMenaces Étatiques et Cyber espionnage\r\n\r\nLes activités de cyber espionnage menées par des États se sont intensifiées en 2022, avec des attaques visant des infrastructures critiques, des gouvernements et des organisations stratégiques. Les tensions géopolitiques se traduisent par une augmentation des activités de cybercriminalité parrainées par des États.\r\nPénurie de Compétences en Cybersécurité\r\n\r\nL’augmentation de la cybercriminalité a exacerbé la pénurie de professionnels qualifiés en cybersécurité. Les entreprises ont eu du mal à recruter et à retenir des talents, ce qui a rendu la défense contre les cyberattaques encore plus difficile.\r\n\r\nFace à ces tendances, les organisations ont dû repenser leurs stratégies de cybersécurité, en mettant l’accent sur la prévention, la détection précoce et la réponse rapide aux incidents. L’adoption de technologies telles que l’analyse comportementale, l’authentification à deux facteurs et la segmentation réseau est devenue cruciale pour atténuer les risques. De plus, la sensibilisation des employés aux menaces potentielles et aux meilleures pratiques en matière de cybersécurité est devenue une priorité absolue.\r\nEn conclusion, l’année 2022 a été marquée par une intensification des cyberattaques sophistiquées et ciblées. Les entreprises et les individus doivent rester vigilants, adopter des mesures de sécurité robustes et s’adapter rapidement aux évolutions constantes du paysage de la cybercriminalité. La collaboration entre les secteurs public et privé, ainsi qu’une sensibilisation accrue à la cybersécurité, joueront un rôle essentiel dans la protection contre ces menaces en constante évolution.','2023-10-04 14:13:39.210030','media/000985269_896x598_c.jpg',1),
(2,'Les 10 Principales Tendances de Cybersécurité en 2023','Pour Olivier Spielmann de Kudelski Security, le temps est venu de faire le bilan des derniers mois et de tenter de prévoir ce qui attendra les entreprises en 2023 en matière de cybersécurité. Si certaines technologies s’essoufflent voire arrivent en bout de course, d’autres – comme l’informatique quantique ou la blockchain – doivent faire l’objet d’une attention particulière de la part des entreprises, afin d’en exploiter pleinement le potentiel ou, à l’inverse, se prémunir des dangers qui leurs sont inhérents. Car qui dit nouvelle tendance ou nouvelle technologie, dit également nouvelles brèches par lesquelles les hackers pourraient s’engouffrer.\r\n\r\nLes boîtes de messagerie professionnelles compromises, les attaques ciblant les identités ou les systèmes d’authentification multifactoriels (MFA), les ransomwares ou encore le phishing, figureront certainement parmi les techniques d’attaques classiques qui continueront d’être efficaces et sources de revenu pour les cybercriminels. Et pour cause, de nouvelles failles dans les systèmes de cybersécurité sont inévitables et le facteur humain continue d’intervenir dans l’équation. Le phishing et les systèmes de forçage MFA émergents sont plus sophistiqués que jamais, rendant la sensibilisation à la cybersécurité importante mais plus complexe que jamais.\r\n\r\nEn 2023, les équipes de sécurité des entreprises doivent continuer de prendre en compte l’erreur humaine. Dans cette optique, adopter une posture de sécurité davantage offensive que défensive est une bonne approche. Il se peut d’ailleurs que les clients des services MDR soient davantage enclins à demander à leurs fournisseurs des fonctionnalités axées sur la proactivité plutôt qu’uniquement sur la réaction.\r\nDes attaques plus rapides\r\n\r\nL’utilisation d’automatisation et de concepts de machine learning ou d’intelligence artificielle va continuer d’augmenter l’efficacité des attaques informatiques. Preuve en est la diminution du temps entre la première étape d’un ransomware est la demande de rançon, qui a été divisée par 15 dans les trois dernières années. Le temps de détection et le temps de réponse continuent d’être les éléments-clé du système de défense, qui doivent être réagis par les mêmes principes d’automatisation et d’intelligence artificielle. A cela devra s’ajouter la précision de la défense, qui doit s’adapter à l’environnement de menaces réelles et la mise en place de mesures de protection adaptées.\r\nLe VPN est mort\r\n\r\nA l’évidence, la tendance au télétravail n’est pas prête de s’essouffler. La sécurisation des collaborateurs, dispersés dans divers lieux, va, elle, continuer d’évoluer. En 2023, l’approche Zero Trust remplacera progressivement celle reposant sur les VPN. Et pour cause, les frontières des réseaux d’entreprise ne ressemblent plus du tout à ce qu’elles étaient : les employés accèdent désormais à la plupart des applications professionnelles via des applications Cloud (SaaS) et les équipes IT ne sont pas enclines à faire face aux risques inhérents aux réseaux privés des employés. Considérer chaque appareil et compte utilisateur comme une potentielle menace est donc la clé pour soutenir et sécuriser les collaborateurs travaillant à distance.\r\nCorrompre plutôt que forcer l’entrée\r\n\r\nEn 2023, les cybercriminels profiteront de la situation économique négative, nourrie notamment pas l’inflation, pour s’introduire dans les systèmes des entreprises. Fragilisés par cette situation, les employés des entreprises seront plus activement utilisés par les cybercriminels pour arriver à leurs fins. Les pirates mettront de côté leurs compétences en matière de piratage et cibleront plutôt les employés vulnérables travaillant pour des fournisseurs tiers, tels que les compagnies de transports, les acteurs des chaînes d’approvisionnement, les fournisseurs d’accès Internet et de solutions logicielles.\r\nLes entreprises doivent donc rester vigilantes et sécuriser non seulement leurs propres périmètres de réseau, mais aussi s’assurer que leurs fournisseurs sont sûrs.\r\n\r\nUtilisation des mots de passe\r\n\r\nLa récente brèche de sécurité qui a touché Uber met en évidence la fragilité des systèmes d’authentification dits MFA. Cependant, même si la technologie des mots de passe s’essouffle, il est peu probable que ces derniers disparaissent complètement l’année prochaine.\r\n\r\nIls devraient cependant être de moins en moins utilisés à l’avenir. Les prochains mois devraient s’inscrire sous le signe de la sécurisation des comptes par toutes les mesures possibles, y compris des mots de passe plus forts. Les gestionnaires de mots de passe seront alors particulièrement sollicités, et figureront à leur tour dans la liste des cibles d’intérêt des hackers.\r\nStratégies de sécurité face à l’inflation\r\n\r\nLes entreprises de toutes tailles et de tous secteurs seront susceptibles de réduire leur budget et leurs effectifs pour faire face à la situation économique, mais ces coupes ne devraient pas avoir d’impact direct sur les équipes dédiées à la sécurité.\r\nLes normes européennes actuelles et futures impliquent par ailleurs que les conseils d’administration et les dirigeants des entreprises devront être de plus en plus attentifs à leur conformité et à leur rigueur sécuritaire.\r\n\r\nEn outre, les initiatives telles que la mise en place de labels de sécurité – tels que le « cyberscore » en France – accentueront l’importance du rôle des équipes de sécurité au sein des entreprises. Elles devront également travailler plus intelligemment et parfois revoir leur approche pour faire face à l’évolution du paysage économique et technologique.\r\nPlus de contrôle pour la blockchain\r\n\r\nLes technologies blockchain ont connu une année 2022 difficile du point de vue de la sécurité. L’année 2023 sera également tumultueuse, à moins que la blockchain ne s’éloigne du code comme loi. Actuellement, une trop grande confiance est en effet attribuée aux développeurs et à leurs compétences en matière de codage. Les équipes chargées de la sécurité de la blockchain doivent ainsi intégrer davantage de contrôle de sécurité et avoir des compétences en matière de détection et de réponse plus solides pour dissuader les acteurs malveillants.\r\n\r\nLes multiples piratages survenus en 2022 ont fortement ébranlé la confiance des utilisateurs dans la sécurité des blockchains. Heureusement, les blockchains savent que les clients sont tout aussi préoccupés par la sécurité de ceux qu’ils ont choisi que par leurs caractéristiques. Par conséquent, les acteurs du secteur consacreront probablement les ressources appropriées pour en améliorer leur sécurité au cours des prochains mois. Outre le vol de cryptomonnaies, la disponibilité et la stabilité devraient être une priorité en 2023. Si les pannes et les ralentissements se poursuivent, certaines blockchains pourraient perdre des utilisateurs et s’effondrer.\r\nArrivée de l’informatique quantique\r\n\r\nLes mesures visant à se préparer à l’arrivée de l’informatique quantique ne seront certainement pas massivement adoptées l’année prochaine. Cependant, les professionnels devraient garder ce sujet en tête pour 2024. Le niveau de risque inhérent à l’utilisation de l’informatique quantique ne compense pas tout à fait l’investissement particulièrement important qu’elle nécessite. Cela dit, les entreprises qui auront le plus besoin de l’informatique quantique (services financiers, entreprises dédiées à la défense ou qui utilisent des données extrêmement sensibles, etc.) devraient commencer à évaluer les risques dès maintenant.\r\n\r\nEn conclusion, il est très probable que 2023 s’inscrira dans la prolongation de 2022. Les événements des derniers mois nous ont rappelé, si besoin était, que la cybersécurité est un enjeu global. La digitalisation continue de tous les acteurs augmentant considérablement le nombre de points d’entrée pour les hackers, la sensibilisation doit donc être plus intensive. Car si la technologie ne cesse d’évoluer et, avec elle, la marge de manœuvre des cyberattaquants, il faut apprendre de 2022 que le salut en matière de cybersécurité passera indubitablement par une sensibilisation exhaustive de tous les publics.','2023-10-04 14:18:26.069031','media/header-article-10-tendances.png.webp',1),
(3,'L\'impact de l\'intelligence artificielle : enjeux et applications','Les enjeux de l’intelligence artificielle en cybersécurité \r\n\r\nEn pleine expansion, l’intelligence artificielle est en passe de bouleverser les enjeux cyber des organisations.  \r\n\r\nAvec le Deep Learning, le Big Data et les nouveaux outils comme Chat GPT, les attaques sont plus précises et plus convaincantes que jamais. Le niveau de personnalisation des attaques est tel que leurs chances d’aboutir ont été décuplées. Les hackeurs ont même commencé à utiliser l’intelligence artificielle (IA) pour améliorer certains logiciels malveillants polymorphes qui, par leurs mutations permanentes, deviennent indétectables. L’IA leur permet alors de passer au travers des moteurs de détection des anomalies ou encore de déjouer les filtres de sécurité en contournant les anti-spam. \r\n\r\nL’intelligence artificielle peut également être utilisée à des fins pacifiques, comme pour améliorer la sécurité des entreprises. Elle peut alors être employée pour détecter et bloquer les attaques informatiques en temps réel, en identifiant les anomalies et les comportements qui pourraient indiquer une activité malveillante. Elle peut également être utilisée comme gestionnaire de mots de passe ou autres informations confidentielles de manière plus efficace, en utilisant des algorithmes de chiffrement. Enfin, nous pouvons tirer profit de l’IA pour prédire et prévenir les futures failles de sécurité en analysant les historiques et en identifiant les tendances qui pourraient être exploitées par les hackeurs.  \r\nLes applications de l’intelligence artificielle en cybersécurité \r\n\r\nL’utilisation de systèmes de détection de menaces basés sur l’apprentissage automatique est le rempart privilégié des organisations contre les cyberattaques. Ces systèmes de Machine Learning sont capables d’analyser en temps réel les activités de l’entreprise et de détecter les comportements suspects, pour anticiper une susceptible attaque. Ils peuvent par ailleurs s’adapter et s’améliorer au fil du temps, ce qui les rend particulièrement efficaces contre les menaces en constante transformation. De plus, l’utilisation de l’IA peut aider à automatiser certaines tâches de réponse aux incidents, ce qui permet une meilleure cyber résilience face aux attaques. Ces mécanismes peuvent être utilisés pour : \r\n\r\nDétecter des menaces en temps réel : l’IA permet de détecter des menaces en temps réel grâce à son apprentissage automatique. Cet apprentissage permet d’analyser en continu les données réseau et identifier les comportements anormaux qui pourraient indiquer une activité malintentionnée.  \r\n\r\nPrédire et prévenir des problèmes de sécurité : l’apprentissage automatique est également utilisé pour analyser les données historiques de sécurité et identifier les tendances et les motifs qui pourraient être exploités par les attaquants. Cela permet aux entreprises de mieux se préparer et de prendre des mesures pour prévenir les futurs problèmes de sécurité. \r\n\r\nGérer des mots de passe : les gestionnaires de mots de passe utilisent l’intelligence artificielle pour générer des mots de passe complexes et uniques pour chaque compte, rendant les attaques difficiles pour les hackeurs. \r\n\r\nChiffrer les données sensibles : les algorithmes de chiffrement peuvent être utilisés pour protéger les données sensibles des entreprises en les rendant illisibles pour quiconque n’a pas la clé de déchiffrement appropriée. \r\n\r\nAinsi, le Machine Learning est utilisé de différentes manières pour améliorer la sécurité des entreprises en : \r\n\r\n    Gérant les mots de passe de manière plus efficace \r\n    Prédisant et en prévenant les futurs problèmes de sécurité \r\n    Détectant et en bloquant les attaques en temps réel \r\n    Utilisant des algorithmes de chiffrement et de hachage avancés \r\n\r\nLes avantages et limites de l’intelligence artificielle en cybersécurité \r\nLes avantages de l’IA dans la détection et prévention des cyberattaques.  \r\nL’IA traite de gros volumes de données\r\n\r\nPour la plupart des organisations qui utilisent l’intelligence artificielle, son principal avantage est sa capacité à traiter d’énormes volumes de données avec efficacité. L’IA automatise la création d’algorithmes pour détecter les risques de sécurité sur une large palette d’éléments touchant au réseau informatique tels que les emails, les logiciels, les sites web visités, les logiciels, les fichiers partagés… \r\nL’IA reconnaît les nouvelles menaces de sécurité\r\n\r\nL’IA dispose d’un apprentissage automatique, dans laquelle elle apprend et s’améliore par l’expérience. Elle analyse le fonctionnement normal du réseau informatique de l’organisation et en déduit ensuite que l’activité normale n’est pas nuisible. L’IA acquiert alors la capacité de détecter les menaces potentielles en discernant les activités inhabituelles.  \r\nL’IA sécurise les réseaux 24h/24, 7j/7\r\n\r\nLa cybersécurité et l’intelligence artificielle constituent la combinaison idéale pour surveiller la sécurité des réseaux informatiques 24 heures/24, 365 jours par an. Les hackeurs n’ont pas d’horaires de prédilection et leurs attaques sont lancées depuis différents fuseaux horaires. C’est pourquoi la surveillance constante de votre système informatique est une priorité.  \r\nLes limites de l’IA et comment les surmonter \r\n\r\nLa cyber extorsion est l’une des principales cybermenaces en 2023. Les tactiques des cybercriminels continuant d’évoluer, ils privilégient cette année l’exfiltration des données personnelles plutôt que leur chiffrement. \r\n\r\nÀ ses côtés, nous pouvons compter sur les menaces d’ingénierie sociales. Ces attaques représentent un risque pour la cybersécurité puisqu’elles reposent principalement sur les vulnérabilités humaines. Par la manipulation sociale et la ruse, l’ingénierie sociale consiste à convaincre les victimes de réaliser une action qui permettra au hackeur d’accéder à des données sensibles ou à un système d’exploitation. Ces actions peuvent consister à cliquer sur un lien ou à télécharger un fichier malveillant. Grâce à l’expansion des deepfake et à l’exploitation croissante de la volatilité internationale dans les schémas de phishing, les hackeurs sont de plus en plus convaincants. En utilisant des pièges liés à des conflits internationaux, comme la guerre opposant la Russie à l’Ukraine, ou à des crises sanitaires internationales, les pirates utilisent l’instabilité internationale pour rendre leurs menaces de phishing plus crédibles et plus convaincantes.','2023-10-04 14:22:05.846278','media/le-role-cle-de-lintelligence-artificielle-dans-la-cybersecurite-1024x683.jpg.webp',1),
(4,'Cybersécurité et IoT : enjeux, menaces et solutions','L’Internet des Objets ou « IoT » désigne l’ensemble des objets physiques ayant la capacité de se connecter à Internet. On retrouve dans cette liste, qui ne cesse de s’allonger, les assistants personnels (Google Home par exemple). Les jouets pour enfants connectés. Les caméras de surveillance. Les ampoules, capteurs, volets, stores, portails, interrupteurs et prises connectées faisant partie de la Maison Intelligente. Les balances connectées, les montres connectées, et autres « Smart Watches » et « Smart Bands » pour suivre l’état de santé de son utilisateur. Les lave-vaisselle, fours, et certains réfrigérateurs dits « intelligents » (capables de commander les produits manquants automatiquement en analysant leurs contenus).\r\nQuelle est la place de la cybersécurité dans l’ensemble de ces objets ? Quels enjeux et quelles solutions ?\r\n\r\nCybersécurité et objets connectés : un monde de plus en plus connecté\r\n\r\nL’Internet des Objets ou « IoT » désigne l’ensemble des objets physiques ayant la capacité de se connecter à Internet. On retrouve dans cette liste, qui ne cesse de s’allonger, les assistants personnels (Google Home par exemple). Les jouets pour enfants connectés. Les caméras de surveillance. Les ampoules, capteurs, volets, stores, portails, interrupteurs et prises connectées faisant partie de la Maison Intelligente. Les balances connectées, les montres connectées, et autres « Smart Watches » et « Smart Bands » pour suivre l’état de santé de son utilisateur. Les lave-vaisselle, fours, et certains réfrigérateurs dits « intelligents » (capables de commander les produits manquants automatiquement en analysant leurs contenus).\r\nQuelle est la place de la cybersécurité dans l’ensemble de ces objets ? Quels enjeux et quelles solutions ?\r\n«Le marché de l’IoT…dans notre vie quotidienne, aussi bien sur le plan personnel que professionnel»\r\n\r\nL’IoT a été très médiatisé auprès du grand public avec les bracelets connectés, la voiture autonome et la maison connectée. Il touche en réalité l’ensemble des secteurs d’activité à travers le concept d’Industrie 4.0 et l’innovation. Ces objets connectés sont présents aujourd’hui dans des domaines de plus en plus sensibles. Le domaine de la distribution d’énergie par exemple. Ou celui de la santé, de la chimie et de la pharmacie, de la construction aéronautique, et du transport ne sont que des exemples.\r\n\r\n On estime aujourd’hui à environ 30 milliards le nombre d’objets connectés avec un accroissement de plus de 20% chaque année. Strategy Analytics, entreprise dédiée à l’analyse du marché industriel, a estimé à 22 milliards le nombre d’IoT dans le monde en 2019. Cela en tenant compte des smartphones, enceintes, téléviseurs, montres, tablettes, ordinateurs, etc. Quant à l’avenir, cette entreprise prévoit 38,6 milliards d’appareils connectés d’ici 2025 et 50 milliards d’ici 2030. Avec un marché qui pourrait atteindre la valeur de 1000 milliards de dollars en 2026. Ce qui laisse supposer que ces équipements vont être de plus en plus fréquents dans notre vie quotidienne.\r\nUne surface de vulnérabilité toujours plus grande\r\n\r\nCette multiplication du nombre d’objets personnels connectés et la forte concurrence entraîne les industries dans une course contre la montre. Cette course se fait souvent au détriment des aspects sécuritaires.\r\n\r\n« …une explosion des menaces aux conséquences potentiellement dévastatrices »\r\n\r\nOr, les menaces sont multiples et impactent aussi bien le grand public que les secteurs professionnels et industriels.\r\n\r\nDe nombreux fabricants utilisent un seul jeu de données de connexion par défaut pour tous leurs appareils. Au lieu de générer un jeu de connexion aléatoire par produit conçu. Ce type de méthode est visiblement favorable à la création massive à moindre coût mais fait l’impasse sur le volet sécurité. Laissant ainsi une porte d’entrée pour de potentielles attaques et surtout, permet une explosion des menaces aux conséquences potentiellement dévastatrices.\r\n\r\nEn 2019, plus de 2,4 millions de données client ont été exposées sur Internet suite à une erreur de configuration. L’entreprise américaine incriminée, Wyze, est spécialisée dans les caméras IP de surveillance et les produits pour la maison intelligente.\r\n\r\nSelon une étude récente de SonicWall, expert en solutions de cybersécurité, une augmentation de 30% du nombre d’attaque par malware visant l’IoT a été constatée en 2020 pendant la crise sanitaire du COVID-19.\r\n\r\nPar ailleurs, le risque d’indisponibilité des services Cloud devient de plus en plus critique. Il menace la sécurité de ces objets connectés. A mesure que l’IoT évolue, l’utilisation du Cloud comme solution d’hébergement, de traitement, d’échange et de stockage des données se multiplie. Une quelconque indisponibilité de ces plateformes se traduit par un arrêt ou dysfonctionnement des équipements IoT qui en dépendent.\r\nEn raison de leur exposition, les Clouds publics sont fréquemment la cible d’attaques de type Déni de Service ou « DoS ».\r\n\r\nIl s’agit d’une action malveillante qui limite fortement la capacité d’un système à fournir le service attendu. Si ladite action est lancée depuis plusieurs sources, il est fréquent de parler de Déni de Service Distribué (DDoS). Ces sources sont souvent gérées par des Botnets (réseaux de machines appelées « zombies » et contrôlées à distance par un attaquant).\r\n\r\nL’objectif de ces attaques DoS et DDoS, est d’empêcher le bon fonctionnement d’un service en le rendant indisponible. Dans notre exemple, les services Cloud. Ces attaques peuvent aussi permettre l’exploitation d’autres failles allant jusqu’à donner le contrôle du système, et donc de l’objet connecté.\r\n\r\nÀ l’automne 2016, le botnet Mirai a été utilisé l’une des plus violentes attaques DDoS jamais enregistrée, en exploitant les vulnérabilités IoT. Les victimes, l’hébergeur français de sites web OVH et la société Dyn. Cette attaque avait paralysé pendant plusieurs jours de nombreux sites et services, tels que Twitter, PayPal, Airbnb ou encore Netflix. Le fonctionnement de Mirai se fondait sur la recherche permanente d’adresses IP correspondant à des objets connectés et vulnérables. Dans le but de prendre le contrôle et diriger des requêtes DOS pour saturer d’autres serveurs, et d’autres cibles finales.\r\n\r\nDans le secteur de la santé, l’IoT est utilisé massivement pour surveiller l’état des patients et fournir de nombreuses informations. Une défaillance de ces équipements pourrait avoir des conséquences irréversibles sur la santé du patient. Et la divulgation de données médicales pourrait être catastrophique, à la fois pour l’institution médicale et le patient.\r\nCes équipements, lorsqu’ils sont mal protégés, peuvent donner accès au système informatique d’établissements de santé.\r\n\r\nFin 2020, une machine à laver connectée avait été piratée et a donné accès au système informatique d’un hôpital français. L’établissement a ensuite subit une attaque de type rançongiciel bloquant tout l’établissement.\r\n\r\nDans l’automobile, une défaillance au niveau des équipements IoT, responsables de l’identification d’obstacles sur la voie pour les voitures autonomes pourrait générer un accident et mettre en péril la vie des passagers et des usagers de la voie publique.\r\n\r\nDe nombreux problèmes de sécurité se cachent derrière les objets connectés de notre quotidien. Des jouets pour enfant piratés, des montres fitness desquelles il est possible de récupérer les mails, les SMS, etc. C’est l’utilisation de ce type de montres connectées qui a permis l’identification d’une base secrète militaire américaine. Comment ? A partir de traces GPS liées au parcours sportifs des militaires présents sur la base.\r\n\r\nPrenant conscience des menaces et des conséquences que l’IoT peut engendrer, beaucoup s’interrogent sur la nécessité de définir et d’imposer des mesures de sécurité et des normes. Elles permettraient de mieux cadrer la conception et l’utilisation des objets connectés. Ceci afin de diminuer les scénarios d’attaque tirant profit de la faiblesse des systèmes ces équipements.','2023-10-04 14:50:31.109117','media/6238629a638d1b6ec9a8ed2e_article_iot-p-1080.jpeg',1),
(5,'Cybersécurité en entreprise : enjeux, risques et bonnes pratiques','Les enjeux de la cybersécurité en entreprise restent mal connus, donc mal pris en compte. Or, les effets d’une cyberattaque, d’une défaillance technique ou d’une négligence humaine peuvent sérieusement impacter l’activité d’une organisation. Il est indispensable d’ériger des garde-fous pour se prémunir contre ces risques « cyber ».\r\n\r\n80 % des organisations ont subi au moins une cyberattaque ces douze derniers mois. Tel est le constat du baromètre de la cybersécurité des entreprises publié par le Cesin (1). Loin de faiblir, le risque cyber devient de plus en plus prégnant. La transformation numérique et ses corollaires (dépendance accrue aux outils, interconnectivité des systèmes d’information, généralisation du stockage dans le Cloud…) ont généré toute une gamme de nouveaux risques contre lesquels les entreprises ne sont pas suffisamment armées. En matière de cyberdéfense, trop d’organisations s’appuient encore sur des systèmes défaillants et des solutions individualisées, alors que la menace s’est globalisée. Il y a donc urgence à prendre conscience des risques, et à adopter les bonnes pratiques (technologiques et humaines) pour améliorer la cybersécurité en entreprise.\r\nCybersécurité en entreprise : des enjeux de plus en plus centraux\r\n\r\nLes cyber-incidents arrivent en deuxième position des risques les plus redoutés par les organisations, devant les catastrophes naturelles, d’après le baromètre annuel d’Allianz (2). L’interruption d’activité occupe la première place, mais au coude à coude avec le cyber-risque – deux préoccupations interdépendantes. Car les incidents informatiques ont souvent pour conséquence une interruption ou un ralentissement de l’activité, en raison de l’interconnexion toujours plus marquée entre celle-ci et les systèmes informatiques. En somme, plus l’entreprise dépend de son SI, plus les risques « cyber » sont élevés, et plus les enjeux de la cybersécurité deviennent centraux.\r\n\r\nLe besoin de cybersécurité en entreprise est devenu une réalité à laquelle les organisations ne peuvent plus se soustraire. Il y a cinq ans, ces risques occupaient seulement la 15e position du baromètre… Aujourd’hui, les craintes relatives aux crimes technologiques, aux défaillances informatiques ou aux violations de données, font partie du quotidien des organisations. Avec des effets (négatifs) concrets : ralentissement de la production (pour 26 % des entreprises), indisponibilité temporaire du site web professionnel (23 %), retards de livraison (12 %), perte de chiffre d’affaires (11 %), et arrêt de la production pendant une période significative (9 %). (1)\r\n\r\nPour prendre quelques exemples (tristement) célèbres : en 2015, la cyberattaque dirigée contre la chaîne TV5 Monde a nécessité une reconstruction totale du SI, sur une durée de six mois. En 2017, suite au ransomware NotPetya, Saint-Gobain a enregistré une perte de 220 millions d’euros. Touchée via un logiciel de l’administration fiscale ukrainienne, la filiale locale du groupe a été contaminée en quelques minutes. Des milliers de données ont été altérées et la direction a dû suspendre tous les réseaux. La même année, le virus WannaCry a infecté plus de 300 000 postes de travail professionnels dans 150 pays, paralysant des organisations entières…\r\nDes risques à identifier en amont\r\n\r\nL’identification des risques en amont est l’un des enjeux majeurs de la cybersécurité en entreprise. C’est qu’il est essentiel de connaître (et de comprendre) ce que l’on cherche à combattre. À ce titre, on peut distinguer trois grandes familles de menaces : les cyberattaques, les risques inhérents aux services Cloud, et les négligences humaines.\r\n\r\nLes cyberattaques résultent d’une volonté de nuire, par appât du gain ou pour mettre en difficulté une organisation (dans un but concurrentiel, pour lui soutirer des informations, etc.). On parle alors de « cybercriminalité ». Parmi les attaques les plus courantes :\r\n\r\n    L’attaque au virus informatique, qui a pour but d’accéder à un SI défaillant ou mal protégé pour détruire tout ou partie des données de l’entreprise, ou pour soustraire des informations sensibles (secrets de fabrication, droits de propriété, etc.). D’autres types d’attaques peuvent s’en prendre au site web de l’entreprise, par exemple en l’inondant d’informations inutiles pour provoquer un crash.\r\n    Le phishing (hameçonnage) consiste à utiliser un email ou un site web contrefait pour induire un individu en erreur et collecter ses données confidentielles, ou rendre sa machine vulnérable à l’injection d’un logiciel malveillant (malware).\r\n    Le ransomware (littéralement « logiciel de rançon ») infectent les postes de travail en verrouillant l’écran et/ou en chiffrant des données importantes auxquelles l’utilisateur n’a alors plus accès. Pour travailler normalement ou récupérer des informations confidentielles, celui-ci est incité à verser une rançon.\r\n    L’attaque dite « au président », méthode d’extorsion par laquelle un tiers malveillant se fait passer pour un membre de la direction, généralement pour soutirer de l’argent ou des informations.\r\n    Les techniques d’ingénierie sociale, manipulations psychologiques ayant pour objectif de soutirer à un utilisateur des informations de façon frauduleuse, afin d’obtenir l’accès à un système d’information.\r\n\r\nSe protéger contre ces attaques suppose d’ériger des barrières ad hoc, donc d’adopter une vraie démarche de cybersécurité en entreprise. Retrouvez notre article : top 10 des différents types de cyberattaques.\r\n\r\nLes risques liés aux services Cloud et les négligences humaines sont interdépendants. Le stockage des données en ligne ne génère de risque véritable qu’à partir du moment où les outils sont mal utilisés (ou mal configurés à la base), ou bien lorsque les utilisateurs font preuve de négligence au regard des consignes élémentaires de sécurité. Utilisation d’applications Cloud qui n’ont pas été approuvées, erreurs de configuration SaaS/IaaS/PaaS, partage accidentel de données sensibles… Ces risques augmentent à mesure que les outils Cloud prennent plus de place dans l’organisation. Et la principale menace pesant sur les organisations est interne : 80 % des entreprises sont confrontées au risque de voir des comptes utilisateurs compromis (3). Cette pratique, qui consiste à utiliser des applications personnelles à des fins professionnelles (avec tous les risques afférents), s’appelle le « Shadow IT », ou « informatique de l’ombre ». Le danger n’est pas négligeable : 86 % des applications Cloud utilisées au sein des organisations n’ont pas été autorisées par la DSI, selon une étude CipherCloud.\r\n\r\nLe problème ne réside pas dans le stockage sur le Cloud, qui offre plus d’avantages que d’inconvénients en matière de sécurité (ne serait-ce qu’en sauvegardant les données sur des serveurs externes, loin des menaces matérielles qui pèsent sur les locaux des entreprises), mais dans le manque de sensibilisation des collaborateurs aux risques liés à la non-maîtrise des processus de collecte et de stockage. La cybersécurité en entreprise est un enjeu humain avant d’être un enjeu technologique.\r\nUne prise de conscience progressive\r\n\r\nUn nombre croissant d’entreprises prend conscience de la nécessité de créer des cyber-garde-fous. Trop souvent, néanmoins, cette prise de conscience est le fait de victimes d’attaques. Les autres ont encore trop de freins, notamment l’opposition entre « culture du risque » et « culture de la productivité » : elles pensent, à tort, que la seconde doit primer sur la première, alors même que la sécurité est l’une des conditions de la productivité. En cas de cyberattaque, il faut bien que le système perdure.\r\n\r\nÀ ce jour, la cybersécurité en entreprise représente moins de 5 % du budget alloué aux TIC (c’est vrai pour 59 % des organisations (1)). C’est loin d’être suffisant. Pour Guillaume Poupard, patron de l’Agence nationale pour la sécurité des systèmes d’information (ANSSI), « le budget alloué à la cybersécurité des entreprises devrait représenter au moins 10 % du budget global du DSI ».\r\n\r\nIdentifier les risques, c’est une bonne chose. Mais il faut aussi se donner les moyens de s’en prémunir. Or, dans ce domaine, les investissements ne font pas tout : s’il est essentiel d’adopter les outils adéquats, le premier levier de cybersécurisation a trait aux collaborateurs eux-mêmes.\r\nLes bonnes pratiques pour renforcer la cybersécurité en entreprise\r\n\r\nAu regard des enjeux grandissants de la cybersécurité en entreprise, quelles sont les bonnes pratiques pour renforcer ses garde-fous numériques ?\r\n\r\n    Adopter les bons outils. À menace numérique, réponse technologique : il existe des outils à mettre en place en amont pour prévenir les risques (c’est le cas des solutions Oodrive pour le stockage et le partage des données, pour l’authentification par signature électronique, etc.), pour détecter les menaces, pour les analyser, et pour corriger/renforcer les éventuelles failles techniques.\r\n    Mettre à jour les logiciels existants. Les outils de l’entreprise doivent être actualisés régulièrement pour prendre en compte les menaces les plus récentes. C’est vrai des antivirus, mais pas seulement.\r\n    Identifier les données sensibles à protéger. Toutes les informations ne se valent pas, certaines sont plus précieuses que d’autres. Il est nécessaire d’identifier les données à risque et de focaliser ses efforts sur leur protection – surtout dans le cadre du RGPD, qui veille à la bonne utilisation et à la sécurisation des données utilisateurs.\r\n    Sauvegarder les données et les mettre en lieu sûr. Cela permet d’éviter que les données essentielles de l’entreprise soient altérées, dégradées ou supprimées, avec des conséquences majeures sur l’activité. Une restauration des données et/ou du système, grâce à une solution de backup, contribue à limiter les effets négatifs d’une cyberattaque.\r\n    Renforcer les droits d’accès. Avec les solutions en mode SaaS et le stockage sur le Cloud, un simple mot de passe ne suffit plus. Les accès doivent être protégés par des mécanismes d’authentification forte.\r\n    Créer un plan de continuité d’activité. C’est une précaution essentielle pour préserver l’activité d’une entreprise et lui permettre de se remettre sur les rails aussi vite que possible à la suite d’une attaque.\r\n    Sensibiliser les collaborateurs à la cybersécurité en entreprise. C’est le point clé : selon une étude publiée par l’Université de l’Alabama à Birmingham en 2015, 75 % des organisations voient la négligence des salariés comme la principale menace pesant sur les données sensibles (4).\r\n\r\nLa sensibilisation des collaborateurs, clé de voûte de la cybersécurité\r\n\r\nInsistons sur la dernière bonne pratique de notre liste. Pour les RSSI (responsables de la sécurité des systèmes d’information), l’enjeu numéro un de la cybersécurité en entreprise est celui de la sensibilisation des utilisateurs et de leur formation (1). Même sensibilisés, les salariés s’impliquent peu et tendent à négliger les recommandations qui leur sont faites. En 2017, le cabinet Deloitte a été victime d’un piratage qui a duré plusieurs mois : les hackers ont accédé au SI en passant par un compte administrateur mal protégé (par un simple mot de passe). En cause : une erreur humaine, celle d’un employé qui s’est facilité la vie en optant pour un mécanisme d’authentification aussi peu exigeant que possible.\r\n\r\nLa dimension humaine est donc primordiale. Derrière son écran d’ordinateur, de smartphone ou de tablette, le collaborateur est en première ligne face aux risques « cyber ». C’est cette position privilégiée qui en fait aussi le principal maillon faible de la chaîne de cybersécurité en entreprise, comme le prouvent les « succès » remportés par les malwares, ransomwares et autres « techniques d’ingénierie sociale » qui jouent sur la crédulité des personnes pour atteindre leur but.\r\n\r\nIl y a donc tout un travail pédagogique à mener, en amont, auprès des collaborateurs. Charte pour matérialiser les bonnes pratiques individuelles et collectives, formations en présentiel, sessions d’e-learning permettant des formations à distance et au rythme de chacun, mises en situation à travers des attaques factices… Autant de méthodes pour enseigner aux salariés les rudiments de la cybersécurité en entreprise, et le rôle que chacun d’eux peut y jouer – au-delà des outils.\r\n\r\nEn matière de cybersécurité, l’utilisateur est souvent vu comme une partie du problème. En réalité, il est surtout une grande partie de la solution. Adopter les bons outils de protection est un excellent début ; mais il faut encore sensibiliser les utilisateurs, les former aux bonnes pratiques, et leur montrer qu’ils sont les leviers les plus efficients pour garantir la sécurité numérique de leur organisation.','2023-10-04 15:10:16.960757','media/01767-RG.jpg',1),
(6,'L\'Impact de la Pandémie sur la Cybersécurité : Les Leçons Apprises','Dans le contexte de la crise pandémique, économique et sociale que nous traversons, il est important de réfléchir sur les leçons apprises et les défis pour la sécurité (nationale et internationale). Même si, malheureusement, nous avons retiré peu de conséquences des crises sanitaires des deux dernières décennies, la gravité particulière de cette pandémie nous appelle à l’urgence de traduire en actions concrètes les leçons que nous apprenons aujourd’hui, avant qu’il ne soit trop tard.\r\n\r\nNous devons toujours considérer une crise non seulement comme un moment de danger mais aussi comme une occasion de prise de décisions, en particulier dans un domaine aussi sensible comme la sécurité, dans ses différents aspects.\r\n\r\nDans cet espace, nous ferons un résumé des nombreuses leçons apprises et les défis que cette crise nous pose, du niveau local au niveau planétaire, et qu’on peut énumérer en dix points :\r\n\r\n    Prendre pleine conscience de l’extrême vulnérabilité de l’Homme, des États et des organisations internationales face à un simple virus et en retirer les conséquences. Après plusieurs épidémies qui ont touché l’Humanité au cours des dernières décennies, la pandémie actuelle est une occasion unique pour repenser sérieusement à des politiques publiques et des ressources efficaces de prévention et de réponse.\r\n    Renforcer la souveraineté et l’indépendance nationale, en assurant l’existence et/ou le renforcement des réserves stratégiques de biens essentiels, le fonctionnement efficace des infrastructures critiques (santé, sécurité, alimentation, eau, énergie, transports) et le développement de centres de recherche et développement, en particulier dans les domaines de la santé et de la technologie.\r\n    Mitiger, autant que possible, l’impact dévastateur que la crise aura aux niveaux économique et social dans les années à venir, en relançant l’économie, l’écologie et la cohésion sociale. La crise actuelle doit être l’occasion d’investir dans des secteurs stratégiques productifs, notamment écologique, technologique, numérique, énergétique, industriel, agricole et solidarité sociale, qui agissent à la fois comme facteurs de renforcement de l’indépendance nationale et de relance de l’économie, de l’emploi et de la cohésion sociale, ces dernier étant des garanties de paix et de sécurité.\r\n    Mettre à jour les modèles nationaux et internationaux de gouvernance de la sécurité, revoir le concept stratégique de défense nationale et mettre en œuvre un concept de sécurité nationale, intégrant les volets militaire et civil, et comprenant un cadre réglementaire et une structure qui assurent, au plus haut niveau, la coordination nationale des parties prenantes publiques et privées.\r\n    Renforcer le rôle des autorités locales et des réseaux locaux par une plus grande déconcentration et décentralisation des fonctions de l’État, tout en soutenant les capacités de la société civile à faire face à une crise de cette ampleur. La force de la solidarité et de la créativité de la société civile locale pour répondre à cette crise, qui est le dernier maillon de la chaîne lorsque les réponses régionales ou nationales sont insuffisantes ou tardives, ont été évidentes dans le monde entier.\r\n    Consolider l’interdépendance et l’interconnectivité, notamment la numérique, en favorisant l’autonomie, la sécurité, la résilience et la redondance de nos réseaux d’information et de communication. Nous devons considérer, sur le plan national, la recherche et le développement, l’innovation technologique, le numérique et l’intelligence artificielle comme des atouts stratégiques incontournables, en renforçant ainsi l’autonomie des nations vis-à-vis de la Chine et des États-Unis et en améliorant la sécurité et la résilience de nos réseaux et de notre information et connaissance.\r\n    Renforcer la capacité et la fiabilité des systèmes et des réseaux d’information et de communication, en particulier des réseaux sociaux, afin de prévenir la cybercriminalité et la désinformation et gérer la peur des gens en fournissant des informations opportunes et correctes. Dans ce domaine, il est important de recourir davantage à l’intelligence artificielle comme moyen de vérifier les sources d’information, en particulier lorsqu’il s’agit d’informations publiques sur la santé et la sécurité. La pandémie actuelle s’est accompagnée d’une \"infodémie\" – un excès d’information qui rend difficile la distinction entre l’information exacte et le manque d’information ou la désinformation.\r\n    Assurer un suivi sanitaire adéquat et un dépistage des populations – surveillance de masse – par le biais de logiciels disponibles sur les téléphones mobiles, visant à surveiller et à contrôler la pandémie, dans la mesure du possible grâce à des solutions technologiques nationales, tout en assurant un équilibre juste et toujours difficile entre l’intérêt public - valeurs de santé et de sécurité publiques - et l’intérêt privé - valeurs de liberté, de protection des données personnelles et de la vie privée.\r\n    Consolider le processus de transition vers un nouvel ordre mondial multipolaire, promouvoir le rééquilibre entre local et mondial, entre unilatéralisme (ou bilatéralisme) et multilatéralisme, en s’avérant urgent de renforcer et de crédibiliser le rôle de l’ONU en tant qu’organisation capable de gérer les crises planétaires. La réponse à la pandémie actuelle doit, par conséquent, être l’occasion pour le renforcement et de la consolidation du multilatéralisme, qui a permis la construction, au cours des dernières décennies, d’un ordre mondial de paix et de prospérité. L’Europe, ainsi que les puissances émergentes, ont ici une occasion unique de jouer un rôle décisif en tant que puissances d’équilibre. Cette crise a mis en lumière les graves vulnérabilités subies par l’ONU, en particulier l’OMS, et certaines grandes puissances mondiales dans la gestion efficace d’une crise mondiale qui exige des réponses coordonnées au niveau mondial. Il est donc important que l’ONU assume une fois pour toutes un véritable rôle de gendarme, axé sur la gestion des problèmes mondiaux tels que l’environnement et le changement climatique, la santé, la cybersécurité, le terrorisme, les conflits régionaux, les crises humanitaires et les migrations. Nous ne pouvons plus nous attendre à ce que les grandes puissances, per se, répondent aux problèmes mondiaux avec des solutions basées sur leurs intérêts nationaux.\r\n    Contribuer à anticiper et atténuer les conséquences économiques et sociales de la pandémie également dans les régions les plus exposées aux crises humanitaires et aux conflits, comme l’Afrique, le Moyen-Orient et l’Amérique Latine, notamment par le renforcement des programmes d’aide au développement et d’action humanitaire et par l’externalisation de la sécurité intérieure – coopération technique-policière, gestion des frontières, contrôle de flux migratoires, lutte contre la criminalité organisée et le terrorisme et renforcement des missions de maintien de la paix. Ce virus n’est pas aussi démocratique qu’on l’avait initialement proclamé, car l’épidémie et ses conséquences économiques à court et à long terme affectent en particulier les populations les plus défavorisées et exclues d’un point de vue socio-économique et culturel, et les statistiques nationales et internationales en témoignent de façon dramatique.','2023-10-04 23:41:55.071656','media/cyb3.jpg',1),
(7,'Protéger la Population en Ligne : L\'Importance Croissante de la Cybersécurité','La sécurité de la population est une préoccupation croissante à l\'ère numérique actuelle. Avec l\'expansion rapide de l\'utilisation d\'Internet, les citoyens du monde entier sont de plus en plus vulnérables aux menaces en ligne. Les cybercriminels utilisent des tactiques sophistiquées pour cibler les individus et les communautés, compromettant ainsi leur sécurité et leur confidentialité. Dans cet article, nous explorerons l\'importance croissante de la cybersécurité pour la protection de la population et fournirons des conseils sur la manière de rester en sécurité en ligne.\r\n\r\nSection 1 : Les Menaces en Ligne contre la Population\r\n\r\nÀ l\'ère numérique, la population est confrontée à une variété de menaces en ligne, allant des attaques de phishing aux logiciels malveillants en passant par le vol d\'identité. Les attaques de phishing, par exemple, trompent souvent les individus en les incitant à divulguer leurs informations personnelles ou financières. Les logiciels malveillants, quant à eux, peuvent infecter les appareils et compromettre la sécurité des données. Le vol d\'identité est une menace constante, avec des cybercriminels cherchant à usurper l\'identité d\'autres personnes. Enfin, la désinformation en ligne peut avoir un impact sur la sécurité de la population en diffusant de fausses informations ou en manipulant l\'opinion publique.\r\n\r\nSection 2 : L\'Importance de la Sensibilisation à la Cybersécurité\r\n\r\nLa sensibilisation à la cybersécurité est essentielle pour protéger la population en ligne. Beaucoup de ces menaces exploitent la méconnaissance des utilisateurs. Les individus doivent être éduqués sur les signes d\'une menace potentielle, comme les courriels suspects ou les sites web non sécurisés. Les programmes de formation en cybersécurité peuvent aider les gens à reconnaître et à éviter les pièges en ligne. En outre, une compréhension de base de la cybersécurité peut inciter les individus à prendre des mesures préventives pour protéger leurs données.\r\n\r\nSection 3 : Les Mesures de Cybersécurité pour les Individus\r\n\r\nPour renforcer leur sécurité en ligne, les individus devraient adopter plusieurs pratiques de cybersécurité, notamment :\r\n\r\n    Utiliser des mots de passe forts et uniques pour chaque compte en ligne.\r\n    Éviter de cliquer sur des liens ou de télécharger des pièces jointes provenant de sources non fiables.\r\n    Mettre à jour régulièrement les logiciels et les systèmes d\'exploitation pour bénéficier des derniers correctifs de sécurité.\r\n    Activer l\'authentification à deux facteurs (2FA) pour une couche de sécurité supplémentaire.\r\n    Utiliser des réseaux Wi-Fi sécurisés et éviter les réseaux publics non protégés.\r\n    Éviter de partager des informations personnelles sensibles en ligne, sauf si cela est absolument nécessaire.\r\n\r\nSection 4 : Les Initiatives Gouvernementales et la Cybersécurité de la Population\r\n\r\nLes gouvernements du monde entier reconnaissent l\'importance de la cybersécurité pour la population. Ils mettent en place des lois et des réglementations visant à lutter contre la cybercriminalité et à protéger les citoyens. Certains gouvernements financent également des programmes de sensibilisation à la cybersécurité pour éduquer la population. Les citoyens devraient se familiariser avec les lois locales liées à la cybersécurité et les ressources gouvernementales disponibles en cas de problème.\r\n\r\nSection 5 : Les Entreprises et la Protection des Données de la Population\r\n\r\nLes entreprises jouent un rôle essentiel dans la protection des données de la population. Elles doivent prendre des mesures pour garantir la sécurité des informations personnelles de leurs clients. Cela inclut la mise en place de mesures de sécurité robustes, la formation du personnel sur la cybersécurité et la notification rapide des violations de données. Les consommateurs devraient choisir des entreprises qui prennent la sécurité au sérieux et protègent leurs informations.\r\n\r\nEn conclusion, la sécurité de la population et la cybersécurité sont étroitement liées à l\'ère numérique actuelle. Il est essentiel que les individus, les gouvernements et les entreprises travaillent ensemble pour lutter contre les menaces en ligne et protéger la vie privée et la sécurité de tous. En suivant des pratiques de cybersécurité appropriées et en restant informés, nous pouvons contribuer à créer un environnement en ligne plus sûr pour tous. La sensibilisation et l\'éducation sont les premières lignes de défense contre les menaces en ligne, et chacun peut jouer un rôle dans la protection de la population en ligne.','2023-10-04 23:57:58.598550','media/image.jpeg',1);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_auteur`
--

DROP TABLE IF EXISTS `blog_auteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_auteur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bio` longtext NOT NULL,
  `photo_de_profil` varchar(100) DEFAULT NULL,
  `utilisateur_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `blog_auteur_utilisateur_id_a296b37f_fk_Users_customuser_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `Users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_auteur`
--

LOCK TABLES `blog_auteur` WRITE;
/*!40000 ALTER TABLE `blog_auteur` DISABLE KEYS */;
INSERT INTO `blog_auteur` VALUES
(1,'Yousseph est un développeur chevronné et un analyste en sécurité informatique passionné par la protection des données et la cybersécurité. Doté d\'une solide formation en informatique, il a consacré de nombreuses années à la création de solutions innovantes pour garantir la sécurité des systèmes et des réseaux.','auteurs/WhatsApp_Image_2023-05-08_at_15.49.16_xCcKLhR_IL4Np7E.jpeg',1),
(2,'','',3),
(3,'','',4);
/*!40000 ALTER TABLE `blog_auteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_commentaire`
--

DROP TABLE IF EXISTS `blog_commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_commentaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contenu` longtext NOT NULL,
  `date_creation` datetime(6) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `auteur_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_commentaire_article_id_ccf83989_fk_blog_article_id` (`article_id`),
  KEY `blog_commentaire_auteur_id_3ee957bb_fk_Users_customuser_id` (`auteur_id`),
  CONSTRAINT `blog_commentaire_article_id_ccf83989_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_commentaire_auteur_id_3ee957bb_fk_Users_customuser_id` FOREIGN KEY (`auteur_id`) REFERENCES `Users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_commentaire`
--

LOCK TABLES `blog_commentaire` WRITE;
/*!40000 ALTER TABLE `blog_commentaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `Users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2023-10-04 14:13:39.295592','1','L\'Évolution de la Cybercriminalité : Tendances et Stratégies de Défense',1,'[{\"added\": {}}]',1,1),
(2,'2023-10-04 14:18:26.168335','2','Les 10 Principales Menaces de Cybersécurité en 2023 : Comment se Protéger ?',1,'[{\"added\": {}}]',1,1),
(3,'2023-10-04 14:21:41.755041','1','yousseph',1,'[{\"added\": {}}]',3,1),
(4,'2023-10-04 14:46:00.662233','2','Les 10 Principales Tendances de Cybersécurité en 2023',2,'[{\"changed\": {\"fields\": [\"Titre\", \"Contenu\"]}}]',1,1),
(5,'2023-10-04 14:50:31.111327','4','Cybersécurité et IoT : enjeux, menaces et solutions',1,'[{\"added\": {}}]',1,1),
(6,'2023-10-04 15:04:29.919886','3','L\'impact de l\'intelligence artificielle : enjeux et applications',2,'[{\"changed\": {\"fields\": [\"Titre\", \"Contenu\", \"Image\"]}}]',1,1),
(7,'2023-10-04 15:10:17.074367','5','Cybersécurité en entreprise : enjeux, risques et bonnes pratiques',1,'[{\"added\": {}}]',1,1),
(8,'2023-10-04 15:10:44.250095','1','yousseph',2,'[{\"changed\": {\"fields\": [\"Photo de profil\"]}}]',3,1),
(9,'2023-10-04 15:13:48.008139','1','yousseph',2,'[{\"changed\": {\"fields\": [\"Bio\"]}}]',3,1),
(10,'2023-10-04 23:41:55.702056','6','L\'Impact de la Pandémie sur la Cybersécurité : Les Leçons Apprises',1,'[{\"added\": {}}]',1,1),
(11,'2023-10-04 23:57:58.805403','7','Protéger la Population en Ligne : L\'Importance Croissante de la Cybersécurité',1,'[{\"added\": {}}]',1,1),
(12,'2023-10-05 02:41:08.921697','2','Marie',1,'[{\"added\": {}}]',3,1),
(13,'2023-10-05 02:59:06.179272','3','Omar',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(5,'admin','logentry'),
(7,'auth','group'),
(6,'auth','permission'),
(1,'blog','article'),
(3,'blog','auteur'),
(2,'blog','commentaire'),
(8,'contenttypes','contenttype'),
(9,'sessions','session'),
(4,'Users','customuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2023-10-04 13:58:52.259666'),
(2,'contenttypes','0002_remove_content_type_name','2023-10-04 13:58:54.637672'),
(3,'auth','0001_initial','2023-10-04 13:59:01.432284'),
(4,'auth','0002_alter_permission_name_max_length','2023-10-04 13:59:02.003130'),
(5,'auth','0003_alter_user_email_max_length','2023-10-04 13:59:02.027037'),
(6,'auth','0004_alter_user_username_opts','2023-10-04 13:59:02.055866'),
(7,'auth','0005_alter_user_last_login_null','2023-10-04 13:59:02.084147'),
(8,'auth','0006_require_contenttypes_0002','2023-10-04 13:59:02.104256'),
(9,'auth','0007_alter_validators_add_error_messages','2023-10-04 13:59:02.138073'),
(10,'auth','0008_alter_user_username_max_length','2023-10-04 13:59:02.176284'),
(11,'auth','0009_alter_user_last_name_max_length','2023-10-04 13:59:02.205384'),
(12,'auth','0010_alter_group_name_max_length','2023-10-04 13:59:02.463931'),
(13,'auth','0011_update_proxy_permissions','2023-10-04 13:59:02.487500'),
(14,'auth','0012_alter_user_first_name_max_length','2023-10-04 13:59:02.513236'),
(15,'Users','0001_initial','2023-10-04 13:59:07.841404'),
(16,'Users','0002_auto_20231003_1214','2023-10-04 13:59:10.224268'),
(17,'Users','0003_alter_customuser_options','2023-10-04 13:59:10.259683'),
(18,'admin','0001_initial','2023-10-04 13:59:12.134639'),
(19,'admin','0002_logentry_remove_auto_add','2023-10-04 13:59:13.190611'),
(20,'admin','0003_logentry_add_action_flag_choices','2023-10-04 13:59:13.337615'),
(21,'blog','0001_initial','2023-10-04 13:59:18.088802'),
(22,'blog','0002_alter_article_image','2023-10-04 13:59:18.153773'),
(23,'sessions','0001_initial','2023-10-04 13:59:19.259836');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('8pbndtc20hukt8qc2mwiszdlhen33mw6','.eJxVjMEOwiAQRP-FsyEuBTZ49O43EHYXpGrapLQn479Lkx70NMm8N_NWMW1rjVvLSxxFXRSo029HiZ952oE80nSfNc_Tuoykd0UftOnbLPl1Pdy_g5pa7Ws0ORMyUHAIiD2RChthH4bBsWEPRFzEQyhIwToycralewA2iajPF_GNOGI:1qoBMj:9FraI4LkZZ8rlpMd_PsEX0M1dKvyF1NwL2vtBTCKyJ8','2023-10-18 23:33:17.366635');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-11 21:18:22
