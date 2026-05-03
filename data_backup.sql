-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cash_manager
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `associes`
--

DROP TABLE IF EXISTS `associes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associes` (
  `id` varchar(36) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `totalRecu` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associes`
--

LOCK TABLES `associes` WRITE;
/*!40000 ALTER TABLE `associes` DISABLE KEYS */;
INSERT INTO `associes` VALUES ('associe_1','Khalil Jafari',0.00,'2026-04-19 11:41:38'),('associe_2','Radouane Et-Tafs',0.00,'2026-04-19 11:41:38'),('associe_3','Abdessamad Laarabi',0.00,'2026-04-19 11:41:38');
/*!40000 ALTER TABLE `associes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiaires`
--

DROP TABLE IF EXISTS `beneficiaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficiaires` (
  `id` varchar(36) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `montant` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiaires`
--

LOCK TABLES `beneficiaires` WRITE;
/*!40000 ALTER TABLE `beneficiaires` DISABLE KEYS */;
INSERT INTO `beneficiaires` VALUES ('114782f7-dfa6-4557-9d47-dcbe3a8c8f3c','RACHID DAMANDIS','gesteCommercial','2026-04-19 19:45:25',NULL),('14ea1a49-370a-462f-b508-36d964306d04','FARID DANONE','gesteCommercial','2026-04-19 19:45:38',NULL),('174d9e2e-9e5e-446b-97e9-eadd19e19309','AHMED MGHINENE','freelancer','2026-04-19 12:29:39',NULL),('6d6f0fc1-df99-4fa4-8b0e-66dee093e83e','SALHI DANONE','gesteCommercial','2026-04-19 19:45:46',NULL),('788ca530-5028-4165-8ad8-e4b5a7f07263','Abderrahmane EL Kassi','livreur','2026-04-19 19:44:27',NULL),('aa712774-8238-419e-acc4-a905db954646','ABDELILAH','freelancer','2026-04-19 12:29:48',NULL),('b54b8858-03f3-4cea-a8f9-e6265b1c6030','ZAINEB ZAIM','gesteCommercial','2026-05-03 14:46:39',NULL),('ben_associe_1','Khalil Jafari','repartitionAssocie','2026-04-19 11:41:39',NULL),('ben_associe_2','Radouane Et-Tafs','repartitionAssocie','2026-04-19 11:41:39',NULL),('ben_associe_3','Abdessamad Laarabi','repartitionAssocie','2026-04-19 11:41:39',NULL),('c8a6e670-f85a-4ba2-850c-776bbf38cedc','KHALID JAADANE','gesteCommercial','2026-05-03 14:46:53',NULL),('edc68f7a-2d27-472a-899f-3daeeb0e9f94','Carte Sim Attijariwafabank pour  Imane','internet','2026-04-19 19:45:02',NULL),('f2ca9105-4e03-416c-bcb1-8bfec450e4dd','MOUHCINE DALLAJI','freelancer','2026-04-19 12:29:32',NULL),('f9a0630b-a0e7-49ea-a8ff-1fa5151ac449','MAJID JAFARI','freelancer','2026-04-19 12:29:25',NULL);
/*!40000 ALTER TABLE `beneficiaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` varchar(36) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `montantMensuel` decimal(12,2) NOT NULL,
  `dernierPaiement` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `moisPayes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`moisPayes`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` varchar(36) NOT NULL,
  `client` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `num_facture` varchar(100) NOT NULL,
  `mnt_facture` decimal(12,2) NOT NULL,
  `date_facture` date NOT NULL,
  `echeance` date NOT NULL,
  `commentaire` text DEFAULT NULL,
  `statut` varchar(20) NOT NULL DEFAULT 'en_cours',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES ('07e7dcf7-5505-43f7-9002-fc705b903e8c','JANAH FRERE','10 Licences Added JANAH FRERE','FS 285_06_2025',3700.00,'2025-05-26','2025-06-25',NULL,'paye','2026-05-03 15:17:42'),('16485745-3ab6-47d1-89f3-158431297afe','DAMNDIS-VCR-PMLD-JANAH-ANOV-DYCHEM-DAMAN_EU','Hours DAMNDIS-VCR-PMLD-JANAH-ANOV-DYCHEM-DAMAN_EU','FS 128_07_2025',2584.50,'2025-07-08','2025-08-07',NULL,'paye','2026-05-03 15:17:42'),('1683e7e6-deec-4b43-b816-b0c9a5795585','MOONY DAMANDIS JANAH FRERE','ADD WORKING','FS 231 04 2026',1813.50,'2026-03-15','2026-04-14',NULL,'en_cours','2026-05-03 15:17:43'),('22c5c1e8-b18c-4a78-8dd9-63c5220a9613','DAMANDIS/VCR/PLMD','Add Working Hours (damandis,vcr,Plmd )','FS 103/04/2025',2040.00,'2025-03-10','2025-04-09',NULL,'paye','2026-05-03 15:17:42'),('2fb7be2c-8318-4c1b-ab16-27fae4c3fe83','Moony','Deployment & integration fees moony project','FS 192 01 2026',6565.00,'2025-12-15','2026-01-14',NULL,'en_cours','2026-05-03 15:17:42'),('4144eb8e-8c68-49fc-a430-0a361a19dfeb','VCRSODALMU','Matinenance VCRSODALMU + MAPS 29 Licences Added','FS 113_08_2025',1619.07,'2025-07-07','2025-08-06',NULL,'en_cours','2026-05-03 15:17:42'),('452d0386-b1bc-45ea-b674-2d8310af8a15','DAMANDIS VCR PLMD ENOVATE DAMANE EUROPE','Additionnel working hours ( DAMANDIS,VCR,PLMD,ENOVATE,DAMANE EUROPE','FS 290_10_2025',2141.00,'2025-09-14','2025-10-14',NULL,'en_cours','2026-05-03 15:17:42'),('46452f62-5e0d-4ec1-8e1e-1284f0b4d890','Unknown','Fcture de correction refer to FS 203 01 2026','KFS 1_01_2026',253.50,'2025-12-16','2026-01-15',NULL,'en_cours','2026-05-03 15:17:42'),('48df1ba2-8e40-4392-a5fc-216dd5027d82','DAMANDIS','Matinenance DAMANDIS + MAPS 180 Licences Added','FS 292_08_2025',22680.00,'2025-07-27','2025-08-26',NULL,'en_cours','2026-05-03 15:17:42'),('52e02c6e-4877-4f53-8563-27da7c686fea','Moony','ADD WORKING','FS 228 04 2026',6214.00,'2026-03-15','2026-04-14',NULL,'en_cours','2026-05-03 15:17:43'),('57e86f50-c8c4-4c40-b91d-a61317082015','MARDIM','Maintenance 2026','FS 251_12_2025',3588.00,'2025-11-12','2025-12-12',NULL,'en_cours','2026-05-03 15:17:42'),('59c8cb5a-b5ff-4d6b-827e-c05ac68d8dce','PLMD PROJECT','PLMD PROJECT','FS 117_06_2025',18276.95,'2025-05-10','2025-06-09',NULL,'paye','2026-05-03 15:17:42'),('5b7ee79d-935e-4bdd-9831-8e6a028bbb66','PMLD PROJECTS','1er Trimestre 2025 - Licences 426 PMLD Projects','FS 183/04/2025',13644.00,'2025-03-12','2025-04-11',NULL,'paye','2026-05-03 15:17:42'),('5e107128-03af-4e87-a0a5-74a11602fcc3','SODALMU','Maintenance & maps 15 Licenes','FS 249 01 2026',2010.00,'2025-12-16','2026-01-15',NULL,'en_cours','2026-05-03 15:17:42'),('86beee85-d127-4466-beba-1712dcc6e6b7','VCRSODALMU','Maintence VCR + Maps Moudule (77 Users)','FS 216/01/2025',10318.00,'2025-01-15','2025-02-14',NULL,'paye','2026-05-03 15:17:42'),('8764bd89-51b7-4886-97d4-43e3797ee543','ENOVATE NA','ENOVATE NORTH AFRICA PROJECT','FS 116_06_2025',12590.00,'2025-05-10','2025-06-09',NULL,'paye','2026-05-03 15:17:42'),('8acd8318-6dc7-49bc-b505-076203f97250','SODALMU','Maintenance 2026','FS 247 01 2026',17420.00,'2025-12-16','2026-01-15',NULL,'en_cours','2026-05-03 15:17:42'),('a27a16d3-0769-4b0c-89e7-7be9df267623','Unknown','4671 euros ( add working hours )','FS 203 01 2026',4671.00,'2025-12-15','2026-01-14',NULL,'en_cours','2026-05-03 15:17:42'),('afe191b6-00ca-4738-ab27-861eccdf1dbe','EPISSENS - DAYCHEM','EPISSENS - DAYCHEM PROJECT','FS 115_06_2025',9156.80,'2025-05-10','2025-06-09',NULL,'paye','2026-05-03 15:17:42'),('c7209ba0-2a5f-4ff6-951a-d70672b3abf0','Moony','91 Licenes + MAPS','FS 201 01 2026',5948.40,'2026-03-01','2026-03-31',NULL,'en_cours','2026-05-03 15:17:42'),('ca357516-8922-40b1-9a0f-276bd8059c01','DAMANDIS/JANAH/DYCHEM','Add Working Hours (damandis,JANAH,DAYCHEM )','FS 220/01/2025',363.00,'2025-01-15','2025-02-14',NULL,'paye','2026-05-03 15:17:42'),('d0d54991-fd9c-4863-a5ab-8116d611c0c8','SODALMU','Add 15 Licences','FS 248 01 2026',5550.00,'2025-12-16','2026-01-15',NULL,'en_cours','2026-05-03 15:17:42'),('d269fa4b-72f8-4c22-8c2d-41a8491ef0e6','VCRSODALMU','29 Licence Added VCRSODALMU','FS 114_08_2025',10730.00,'2025-07-07','2025-08-06',NULL,'en_cours','2026-05-03 15:17:42'),('d2c77122-7c8c-49d6-9d5e-d0d0987bb3bf','MARDIM','ADD 3 LICENES','FS 252_12_2026',1170.00,'2025-11-12','2025-12-12',NULL,'en_cours','2026-05-03 15:17:42'),('f1466f6d-3543-4dc7-8fb5-8585ce08b3df','JANAH FRERE','Maitenance JANAH FRERE + Maps Module (27 Users)','FS 284_06_2025',3294.00,'2025-05-26','2025-06-25',NULL,'paye','2026-05-03 15:17:42');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recouvrements`
--

DROP TABLE IF EXISTS `recouvrements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recouvrements` (
  `id` varchar(36) NOT NULL,
  `client` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `num_facture` varchar(100) NOT NULL,
  `mnt_facture` decimal(12,2) NOT NULL,
  `date_facture` date NOT NULL,
  `echeance` date NOT NULL,
  `commentaire` text DEFAULT NULL,
  `statut` varchar(20) NOT NULL DEFAULT 'en_cours',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recouvrements`
--

LOCK TABLES `recouvrements` WRITE;
/*!40000 ALTER TABLE `recouvrements` DISABLE KEYS */;
INSERT INTO `recouvrements` VALUES ('3d0e4861-4165-4389-bf81-b58fdbe30be6','—','Client','IMP-001',0.00,'2026-05-03','2026-07-02',NULL,'en_cours','2026-05-03 15:18:48'),('411b507d-3336-4963-9568-c28c299f41b9','—','DAYCHEM','IMP-002',0.00,'2026-05-03','2026-07-02',NULL,'en_cours','2026-05-03 15:18:48');
/*!40000 ALTER TABLE `recouvrements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaries` (
  `id` varchar(36) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `poste` varchar(150) NOT NULL,
  `salaire` decimal(12,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` VALUES ('04489002-12c3-4cc6-a93b-6879811e0a09','FATIMA MAIDA','IT',5000.00,'2026-04-19 17:54:19'),('2a36afbb-26a3-4c0d-9eee-c94efd8ca656','IMANE LAARABI','IT',5000.00,'2026-04-19 17:53:58'),('974805f9-6913-4192-bee7-7799c8fdbc34','EZZOHRA SAHAB','Chef de Projet',6859.00,'2026-04-19 17:53:43'),('f77a7692-e546-4a63-b480-1ad0deef7cf8','NAJWA LAARABI','IT',5000.00,'2026-04-19 17:54:31');
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` varchar(36) NOT NULL,
  `type` varchar(10) NOT NULL,
  `category` varchar(50) NOT NULL,
  `montant` decimal(12,2) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL,
  `clientId` varchar(36) DEFAULT NULL,
  `associeId` varchar(36) DEFAULT NULL,
  `beneficiaire` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pay_par` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('00ba4752-b716-414f-bb0b-9c64c6cada9a','sortie','freelancer',5000.00,'FREELANCER','2026-04-06 00:00:00',NULL,NULL,'AHMED MGHINENE','2026-04-19 23:58:35','EZZOHRA SAHAB'),('0551bc38-92d1-46d1-acd0-2685b84b8d2f','sortie','repartitionAssocie',10000.00,'DISPATCH MNT MACAO','2026-04-06 00:00:00',NULL,NULL,'Khalil Jafari','2026-04-19 23:55:15',NULL),('0ac9ef76-7224-4c28-b3bf-24fbd34a46c2','sortie','repartitionAssocie',10000.00,'DISPATCH MNT MACAO','2026-04-06 00:00:00',NULL,NULL,'Abdessamad Laarabi','2026-04-19 23:54:01',NULL),('0b0860bf-4a2a-45ac-b740-aaa22231b4a0','sortie','fraisBancaires',28.30,'Frais bancaires Fév 2026 — FATIMA MAIDA','2026-02-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:09','FATIMA MAIDA'),('0b188247-6499-4ee9-b0af-0cfeebb8090e','entree','recouvrementCash',8000.00,'Contrat De Support — Mar 2026 (MACAO)','2026-03-01 00:00:00',NULL,NULL,NULL,'2026-04-19 18:34:36',NULL),('0b79f579-48d6-4f7f-848a-9e78cd3e5db0','sortie','fraisBancaires',41.20,'Frais bancaires Mar 2026 — NAJWA LAARABI','2026-03-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:34:50','NAJWA LAARABI'),('0cb9d8f5-5b09-4dae-837c-ce53ac9440da','sortie','autre',65.00,'OPEX — ENVOI FACTURE PDIS PAR AMANA','2026-01-16 00:00:00',NULL,NULL,NULL,'2026-04-19 23:04:24',NULL),('0dd68260-8d38-4037-bb88-e191c53b9d9a','sortie','repartitionAssocie',19300.00,'Dispatch Mnt récupé de hasan nessab','2026-05-03 15:51:07',NULL,NULL,'Khalil Jafari','2026-05-03 14:51:29',NULL),('0f4f9901-b584-4e58-891a-cfd24f37eabc','entree','salaire',5000.00,'Salaire — FATIMA MAIDA','2026-04-01 00:00:00',NULL,NULL,'FATIMA MAIDA','2026-04-19 17:56:11',NULL),('18d4dfd7-cc63-46e3-837b-75084019cb55','sortie','repartitionAssocie',25200.00,'Dispatch Mnt récupéré de hassan nessab','2026-05-03 15:48:38',NULL,NULL,'Radouane Et-Tafs','2026-05-03 14:49:18',NULL),('1ddae245-2ad1-42a5-86c1-19e5b1d958ce','sortie','freelancer',2500.00,'Freelancer','2026-01-05 00:00:00',NULL,NULL,'MAJID JAFARI','2026-04-19 22:58:34','NAJWA LAARABI'),('20390297-1007-4c89-9aee-999b55f58538','entree','salaire',7500.00,'Salaire — NAJWA LAARABI + Frais dépl. 2 500,00 DH','2026-01-01 00:00:00',NULL,NULL,'NAJWA LAARABI','2026-04-20 06:51:53',NULL),('20551ce8-25b9-47fa-8a0b-f42ddac906f7','sortie','autre',382.42,'Abonnement Claude pour application ARK CAISSE','2026-05-03 15:55:25',NULL,NULL,NULL,'2026-05-03 14:55:52',NULL),('231afb41-fbfb-48c7-a4e7-b8e112a67509','sortie','autre',825.00,'OPEX — PAIEMENT WMACHINES','2026-03-18 00:00:00',NULL,NULL,NULL,'2026-04-19 23:52:17','EZZOHRA SAHAB'),('257bd805-6940-43d0-b4d1-456c8a48954d','sortie','fraisBancaires',28.30,'Frais bancaires Mar 2026 — FATIMA MAIDA','2026-03-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:10','FATIMA MAIDA'),('2647d957-d10c-4288-8657-a1b57f3035e0','sortie','internet',50.00,'RECHATGE CARTE SIM COMPTE ATTIJARI IMANE','2026-02-04 00:00:00',NULL,NULL,'Carte Sim Attijariwafabank pour  Imane','2026-04-19 23:32:33',NULL),('27d62404-40f6-4d42-b1b7-8a89a3714b58','sortie','autre',65.00,'OPEX — ENVOI FACTURE PDIS AMANA','2026-03-12 00:00:00',NULL,NULL,NULL,'2026-04-19 23:50:55',NULL),('2c86c454-85a2-4185-b017-481cd6f5960b','entree','salaire',5000.00,'Salaire Mai 2026 — IT','2026-05-01 00:00:00',NULL,NULL,'IMANE LAARABI','2026-05-03 15:02:39',NULL),('33572b40-1910-40cd-8897-978650b51474','entree','salaire',11859.00,'Salaire — EZZOHRA SAHAB + Indem. AID 5 000,00 DH','2026-02-01 00:00:00',NULL,NULL,'EZZOHRA SAHAB','2026-04-19 17:55:40',NULL),('3ac20f4a-f834-4357-9085-a46599c8a510','sortie','fraisBancaires',9.00,'Frais bancaires Fév 2026 — NAJWA LAARABI','2026-02-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:12','NAJWA LAARABI'),('3c1a73ac-692c-4006-a3bb-2ccc8120bbb7','sortie','gesteCommercial',5000.00,'GC','2026-03-11 00:00:00',NULL,NULL,'SALHI DANONE','2026-04-19 23:49:50',NULL),('3c3091ae-e630-476b-9db2-66d938360ceb','sortie','gesteCommercial',10000.00,'MARIAGE','2026-05-03 15:46:57',NULL,NULL,'ZAINEB ZAIM','2026-05-03 14:47:19',NULL),('3cfe04a8-f632-4d04-996f-5f00f6013093','sortie','gesteCommercial',474.00,'Lunch grilladière khalil mghinene rachid damandis','2026-04-29 00:00:00',NULL,NULL,NULL,'2026-05-03 14:58:29',NULL),('3d85bba0-4720-412c-aa88-060a40b47df4','sortie','livreur',1518.00,'Livraison danone','2026-01-07 00:00:00',NULL,NULL,'Abderrahmane EL Kassi','2026-04-19 22:59:08','IMANE LAARABI'),('3eb688d6-40cc-4c53-982a-0472b6965f29','sortie','autre',2000.00,'PROJET POULET V2','2026-01-23 00:00:00',NULL,NULL,NULL,'2026-04-19 23:05:33','FATIMA MAIDA'),('4000d953-e56a-4c36-9c08-6aea01e1eba4','sortie','repartitionAssocie',50000.00,'devidende 2025','2026-02-12 00:00:00',NULL,NULL,'Abdessamad Laarabi','2026-04-19 23:37:47',NULL),('41ac1868-8ae7-419b-b70e-e288dd02c312','entree','salaire',6859.00,'Salaire — EZZOHRA SAHAB','2026-03-01 00:00:00',NULL,NULL,'EZZOHRA SAHAB','2026-04-19 17:55:58',NULL),('43254e1c-a8b4-46aa-8423-d7c6dfad6eed','entree','salaire',5000.00,'Salaire — FATIMA MAIDA','2026-03-01 00:00:00',NULL,NULL,'FATIMA MAIDA','2026-04-19 17:55:58',NULL),('43464504-4ddb-4e21-a0da-810d7badcaf1','sortie','autre',1530.00,'PROJET POULET V2 — MISE A DISPOSITION','2026-04-03 00:00:00',NULL,NULL,NULL,'2026-04-19 23:56:50','FATIMA MAIDA'),('4388f1d2-20b0-496a-91ad-c870116bd9d5','sortie','freelancer',2000.00,'DISPATCH MNT MACAO','2026-04-06 00:00:00',NULL,NULL,'MAJID JAFARI','2026-04-19 23:55:52',NULL),('458952c9-2875-44d2-8987-59d67930facd','sortie','autre',2000.00,'PROJET POULET V2','2026-04-03 00:00:00',NULL,NULL,NULL,'2026-04-19 23:57:37','FATIMA MAIDA'),('45a03315-d601-4eb0-959d-aa399eb529f3','entree','haddad',214320.00,'cash','2026-02-03 18:30:00',NULL,NULL,NULL,'2026-04-19 17:50:45',NULL),('46d7dc35-e474-498b-bb87-ed2fa9ca9f76','sortie','autre',2000.00,'PROJET IMMOBILIER — ARBOUNE A HASSAN','2026-02-06 00:00:00',NULL,NULL,NULL,'2026-04-20 07:27:34',NULL),('4eed4c6b-3e9c-4583-9636-e3ba461dadb1','sortie','gesteCommercial',5000.00,'GC','2026-02-09 00:00:00',NULL,NULL,'RACHID DAMANDIS','2026-04-19 23:36:29','EZZOHRA SAHAB'),('526ae4b5-290c-410f-8988-d35694a3e1b8','entree','salaire',5000.00,'Salaire — IMANE LAARABI','2026-03-01 00:00:00',NULL,NULL,'IMANE LAARABI','2026-04-19 17:55:58',NULL),('569ae040-9cbb-4bc1-a229-302a5597c257','entree','reliquatCash2025',21742.15,'Reliquat Cash 2025','2026-04-20 01:40:05',NULL,NULL,NULL,'2026-04-20 00:40:05',NULL),('587addf6-394b-4712-a87c-502e64d8a310','sortie','repartitionAssocie',5900.00,'dispatch Mnt récupé de hassan nesab','2026-05-03 15:50:32',NULL,NULL,'Khalil Jafari','2026-05-03 14:51:05','NAJWA LAARABI'),('5a6a0829-3ff0-4e68-ba7d-8af81eab44fb','entree','salaire',10000.00,'Salaire — FATIMA MAIDA + Indem. AID 5 000,00 DH','2026-02-01 00:00:00',NULL,NULL,'FATIMA MAIDA','2026-04-19 17:55:40',NULL),('6016e1db-1f95-48db-b639-59341d686d20','sortie','autre',1600.00,'OPEX — Paiement environement développement Oneflow','2026-01-07 00:00:00',NULL,NULL,NULL,'2026-04-19 23:00:31','EZZOHRA SAHAB'),('64797f66-eef6-4180-a0e5-2ac1bb1b6aa8','sortie','freelancer',3500.00,'FREELANCER','2026-04-15 00:00:00',NULL,NULL,'MAJID JAFARI','2026-04-19 23:59:14','EZZOHRA SAHAB'),('6644c4a1-a42a-4bf0-9008-e71c57ae83c6','entree','salaire',5000.00,'Salaire — NAJWA LAARABI','2026-03-01 00:00:00',NULL,NULL,'NAJWA LAARABI','2026-04-19 17:55:59',NULL),('669c66b1-47dd-43b5-9a7f-329a12d7c681','entree','recouvrementCash',8000.00,'Contrat De Support — Jan 2026 (MACAO)','2026-01-01 00:00:00',NULL,NULL,NULL,'2026-04-19 18:34:35',NULL),('68d72b30-0a47-42a2-989d-f2b756fbe811','sortie','gasoil',500.00,'Gasoil 2ème Trimestre','2026-04-01 00:00:00',NULL,NULL,NULL,'2026-04-26 10:38:33',NULL),('69c2a231-6f26-4024-9675-16729b668642','sortie','autre',376.00,'OPEX — PAIEMENT WMACHINES','2026-02-18 00:00:00',NULL,NULL,NULL,'2026-04-19 23:44:31','EZZOHRA SAHAB'),('69c94d98-1160-4de9-b06d-9c3dbd6e2c61','sortie','fraisBancaires',2035.33,'Frais bancaires Mar 2026 — EZZOHRA SAHAB','2026-03-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:04','EZZOHRA SAHAB'),('6c27baa7-d4ec-4580-8122-fc84b800af79','sortie','autre',920.00,'PROJET POULET V2','2026-01-08 00:00:00',NULL,NULL,NULL,'2026-04-20 00:00:47','FATIMA MAIDA'),('70a703cf-97f6-47bd-8a02-86e518934c59','sortie','fraisBancaires',24.54,'Frais bancaires Mar 2026 — IMANE LAARABI','2026-03-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:07','IMANE LAARABI'),('7155ab12-766c-4b83-aba8-778f69882086','sortie','fraisBancaires',33.20,'Frais bancaires Jan 2026 — NAJWA LAARABI','2026-01-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:11','NAJWA LAARABI'),('7785b93d-de4c-4f90-b806-87a29c98138c','sortie','gasoil',500.00,'gasoil 1ère trimestre','2026-01-01 00:00:00',NULL,NULL,NULL,'2026-04-26 10:39:44',NULL),('77ee0357-845f-4c29-9759-426f9a463846','sortie','internet',50.00,'RECHARGE','2026-02-23 00:00:00',NULL,NULL,'Carte Sim Attijariwafabank pour  Imane','2026-04-19 23:46:53','IMANE LAARABI'),('7ac4feda-00af-4a76-93b7-4bc7d264499a','sortie','autre',2000.00,'PROJET POULET V2','2026-02-18 00:00:00',NULL,NULL,NULL,'2026-04-19 23:45:27','FATIMA MAIDA'),('7b0efbae-74e9-49b5-8e9b-0ba958311f32','sortie','livreur',1818.00,'LIVRAISON','2026-03-19 00:00:00',NULL,NULL,'Abderrahmane EL Kassi','2026-04-19 23:53:16','NAJWA LAARABI'),('7e4e6b02-3329-4e77-96d4-407116cbab27','sortie','autre',136.00,'OPEX — CAFE EQUIPE','2026-02-06 00:00:00',NULL,NULL,NULL,'2026-04-19 23:34:08',NULL),('800035af-c025-4eeb-959a-fe4cc859c1db','sortie','repartitionAssocie',10000.00,'9offa RAMADAN','2026-02-04 00:00:00',NULL,'associe_1','Khalil Jafari','2026-04-19 23:11:40','EZZOHRA SAHAB'),('8321bd9e-5592-4451-a969-4f63c333b86e','sortie','repartitionAssocie',25200.00,'dispatch Mnt récupéré de hassan nessab','2026-05-03 15:49:46',NULL,NULL,'Abdessamad Laarabi','2026-05-03 14:50:10',NULL),('8368fd9a-969d-4501-ac0c-12576d166284','sortie','autre',55.00,'OPEX — ENVOI FACTURE PDIS AMANA','2026-02-04 00:00:00',NULL,NULL,NULL,'2026-04-19 23:33:30',NULL),('844fede8-48da-4d66-af06-a9529592aa78','sortie','fraisBancaires',24.54,'Frais bancaires Fév 2026 — IMANE LAARABI','2026-02-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:06','IMANE LAARABI'),('860a3fbf-62c9-496a-b728-f09731ec1d24','entree','salaire',5000.00,'Salaire Mai 2026 — IT','2026-05-01 00:00:00',NULL,NULL,'NAJWA LAARABI','2026-05-03 15:02:45',NULL),('88a4b3f5-0499-4db5-8631-2988b709908d','sortie','freelancer',10018.00,'freelancer','2026-02-02 00:00:00',NULL,NULL,'AHMED MGHINENE','2026-04-19 23:10:41','IMANE LAARABI'),('8a2ea0a0-b978-4e8a-b1fd-7c0c3d7c3f0d','sortie','repartitionAssocie',50000.00,'devidende 2025','2026-02-12 00:00:00',NULL,NULL,'Radouane Et-Tafs','2026-04-19 23:38:34',NULL),('901e0b26-0878-4614-b6c2-5b3ca4d93a4a','sortie','autre',280.00,'CAFE EQUIPE — 200 de plus pour Radouane children','2026-04-24 00:00:00',NULL,NULL,NULL,'2026-04-26 10:36:29',NULL),('92556d46-bdfc-4148-8624-36059fc9a007','sortie','freelancer',5018.00,'freelancer','2026-02-02 00:00:00',NULL,NULL,'MAJID JAFARI','2026-04-19 23:09:15','IMANE LAARABI'),('93287078-d731-4f5b-91a5-0d1771b487d1','sortie','autre',427.00,'OPEX — Paiement wmachines','2026-02-07 00:00:00',NULL,NULL,NULL,'2026-04-19 23:35:23','EZZOHRA SAHAB'),('9809aa2c-b52d-467e-bea7-bfc3ebe47e2e','sortie','repartitionAssocie',10000.00,'9OFFA RAMADAN','2026-02-04 00:00:00',NULL,'associe_3','Abdessamad Laarabi','2026-04-19 23:26:40',NULL),('988f4875-cf52-4da8-91c0-05257d2f03f1','entree','salaire',5000.00,'Salaire — NAJWA LAARABI','2026-04-01 00:00:00',NULL,NULL,'NAJWA LAARABI','2026-04-19 17:56:11',NULL),('9f44d156-b4b8-4cc1-8b21-13e7263e60a0','entree','salaire',5000.00,'Salaire — IMANE LAARABI','2026-04-01 00:00:00',NULL,NULL,'IMANE LAARABI','2026-04-19 17:56:11',NULL),('9f4a967c-9910-4975-a4d3-828da956a61d','sortie','autre',18.00,'OPEX — Commission transfert','2026-01-28 00:00:00',NULL,NULL,NULL,'2026-04-19 23:08:24',NULL),('a590c21f-fe44-4a8a-9081-3e10b6efcc1b','sortie','freelancer',5000.00,'FREELANCER','2026-03-14 00:00:00',NULL,NULL,'MAJID JAFARI','2026-04-19 23:51:35','EZZOHRA SAHAB'),('a5d8c395-5dd1-4fa5-9e9b-9791c8923092','sortie','autre',1603.00,'PROJET POULET V2','2026-02-21 00:00:00',NULL,NULL,NULL,'2026-04-19 23:46:08','FATIMA MAIDA'),('a7836910-4e70-4162-a270-e296a9a80cf9','sortie','gesteCommercial',4000.00,'récupération flous de hassan nessab','2026-05-03 15:47:20',NULL,NULL,'KHALID JAADANE','2026-05-03 14:47:53','NAJWA LAARABI'),('ab0d993a-f795-4cc2-8be5-c571aa5c0933','entree','recouvrementCash',8000.00,'Contrat De Support — Fév 2026 (MACAO)','2026-02-01 00:00:00',NULL,NULL,NULL,'2026-04-19 18:34:36',NULL),('ad9c261d-36e8-4ea6-a63c-b6f211d62e90','entree','salaire',6859.00,'Salaire — EZZOHRA SAHAB','2026-04-01 00:00:00',NULL,NULL,'EZZOHRA SAHAB','2026-04-19 17:56:11',NULL),('b08438c4-4b25-4ce9-92e8-409ea5eee94c','sortie','repartitionAssocie',10000.00,'9OFFA RAMADAN','2026-02-04 00:00:00',NULL,'associe_2','Radouane Et-Tafs','2026-04-19 23:18:00','FATIMA MAIDA'),('b5bcea2a-0ae0-4ea6-8a73-48e0b456008e','sortie','repartitionAssocie',8000.00,'difference non trouvée à appliquer sur abdou','2026-05-03 15:57:02',NULL,NULL,NULL,'2026-05-03 14:57:44','IMANE LAARABI'),('bb2c61ec-d67b-40c2-a0bf-aa54471a30ac','sortie','fraisBancaires',9.00,'Frais bancaires Avr 2026 — NAJWA LAARABI','2026-04-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:14','NAJWA LAARABI'),('bbb4b651-f370-4f15-8810-03107355f100','sortie','gesteCommercial',2500.00,'geste pour naissance bébé najwa laarabi','2026-05-03 15:58:32',NULL,NULL,NULL,'2026-05-03 14:59:18',NULL),('bcd7946a-38d1-4679-a4d6-d60f74899e52','sortie','gesteCommercial',5000.00,'GC','2026-03-11 00:00:00',NULL,NULL,'FARID DANONE','2026-04-19 23:49:10',NULL),('bce092a0-a2e0-41a4-91f0-0d129719b1e3','sortie','gasoil',100.00,'LIVRAISON COMMANDE MOONY A BOUZNIKA','2026-01-15 00:00:00',NULL,NULL,NULL,'2026-04-19 23:02:53',NULL),('bce64e1a-ea03-4f69-a480-4bff8df2906b','entree','salaire',10000.00,'Salaire — NAJWA LAARABI + Indem. AID 5 000,00 DH','2026-02-01 00:00:00',NULL,NULL,'NAJWA LAARABI','2026-04-19 17:55:40',NULL),('be11ab3b-6c1c-471f-b75a-737888af07fa','sortie','repartitionAssocie',10000.00,'DISPATCH MNT MACAO','2026-04-06 00:00:00',NULL,NULL,'Radouane Et-Tafs','2026-04-19 23:54:43',NULL),('be6668f2-749e-4f78-aef3-46dbdcdfed60','sortie','livreur',5000.00,'LIVRAISON DANONE','2026-01-28 00:00:00',NULL,NULL,'Abderrahmane EL Kassi','2026-04-19 23:06:37','IMANE LAARABI'),('c4ff7f22-671d-4f9d-b579-31f3336a0166','sortie','repartitionAssocie',15000.00,'ACHAT VAISSELLE ET REFRIGERATEUR','2026-02-14 00:00:00',NULL,NULL,'Khalil Jafari','2026-04-19 23:41:50',NULL),('c74b11d8-40aa-4ba9-960f-990df9fd291c','sortie','fraisBancaires',24.54,'Frais bancaires Jan 2026 — IMANE LAARABI','2026-01-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:05','IMANE LAARABI'),('c7c9801b-9675-4fa1-9a9c-6c2d5557f780','entree','salaire',5000.00,'Salaire Mai 2026 — IT','2026-05-01 00:00:00',NULL,NULL,'FATIMA MAIDA','2026-05-03 15:02:34',NULL),('c9c15a4b-4ef7-47c4-a411-cf6332b8c112','sortie','livreur',2018.00,'AVANCE SUR LIVRAISON','2026-02-25 00:00:00',NULL,NULL,'Abderrahmane EL Kassi','2026-04-19 23:47:35','NAJWA LAARABI'),('cea2c360-0635-4d69-87e5-9e19907b1fdf','entree','salaire',7500.00,'Salaire — IMANE LAARABI + Frais dépl. 2 500,00 DH','2026-01-01 00:00:00',NULL,NULL,'IMANE LAARABI','2026-04-20 06:51:53',NULL),('d019f8bf-5635-4290-ac47-7dce2fe915e7','entree','salaire',10000.00,'Salaire — IMANE LAARABI + Indem. AID 5 000,00 DH','2026-02-01 00:00:00',NULL,NULL,'IMANE LAARABI','2026-04-19 17:55:40',NULL),('d118da40-8ce5-4481-bbb1-724704c98ca9','sortie','fraisBancaires',72.30,'Frais bancaires Jan 2026 — FATIMA MAIDA','2026-01-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:08','FATIMA MAIDA'),('d64b4f93-3d39-4726-924f-764233dc295e','entree','cashRds',30000.00,'Récupéré du compte RDS','2026-04-20 01:12:34',NULL,NULL,NULL,'2026-04-20 00:12:34',NULL),('d890e167-2841-4d91-a76a-2ca169f39717','entree','recouvrementCash',8000.00,'Contrat De Support — Déc 2025 (MACAO)','2025-12-01 00:00:00',NULL,NULL,NULL,'2026-04-19 18:34:35',NULL),('dd1277dd-7a52-4f44-b13c-fd9bcdd771ec','entree','haddad',216576.00,'cash','2025-12-01 18:30:00',NULL,NULL,NULL,'2026-04-19 17:50:09',NULL),('de256c15-f4a7-492c-9f75-38131699cd03','sortie','autre',55.00,'Paement AMANA — ENVOI FACTURE PDIS','2026-01-09 00:00:00',NULL,NULL,NULL,'2026-04-19 23:01:49',NULL),('e18aedce-cba5-42d3-9024-f1594b93fb10','sortie','repartitionAssocie',30000.00,'RETRAIT DEPUIS COMPTE RDS','2026-02-18 00:00:00',NULL,NULL,'Radouane Et-Tafs','2026-04-19 23:42:56',NULL),('e38d24d1-cae2-4841-b7df-5bd41f01a46b','sortie','repartitionAssocie',15000.00,'POUR ABDESSAMAD','2026-02-20 00:00:00',NULL,NULL,'Abdessamad Laarabi','2026-04-19 23:43:39',NULL),('e506d46f-0477-4904-8b85-2be77191ac81','entree','salaire',6859.00,'Salaire Mai 2026 — Chef de Projet','2026-05-01 00:00:00',NULL,NULL,'EZZOHRA SAHAB','2026-05-03 15:02:26',NULL),('e52453c6-2312-4515-994e-267549100181','sortie','autre',1330.00,'PROJET POULET V2','2026-01-26 00:00:00',NULL,NULL,NULL,'2026-04-19 23:06:06','FATIMA MAIDA'),('e548f2b4-9ed8-4d16-ab6f-9739c6f22827','sortie','fraisBancaires',23.34,'Frais bancaires Avr 2026 — IMANE LAARABI','2026-04-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:07','IMANE LAARABI'),('eaf86cc5-1b73-444d-b770-3af6d818974c','sortie','repartitionAssocie',50000.00,'devidende 2025','2026-02-12 00:00:00',NULL,NULL,'Khalil Jafari','2026-04-19 23:37:13',NULL),('ecd11b0a-f382-4c54-b735-ec12a17a9627','entree','salaire',7500.00,'Salaire — FATIMA MAIDA + Frais dépl. 2 500,00 DH','2026-01-01 00:00:00',NULL,NULL,'FATIMA MAIDA','2026-04-20 06:51:52',NULL),('ecf3f71d-af3f-4d3c-9499-38b9aedd7a37','entree','salaire',9359.00,'Salaire — EZZOHRA SAHAB + Frais dépl. 2 500,00 DH','2026-01-01 00:00:00',NULL,NULL,'EZZOHRA SAHAB','2026-04-20 06:51:52',NULL),('f9819b1e-83dc-4c93-9cbe-720f1c800b48','sortie','internet',50.00,'carte sim imane compte attijari','2026-05-03 16:08:13',NULL,NULL,NULL,'2026-05-03 15:08:39','IMANE LAARABI'),('fadaa92a-de3b-4d4a-8b44-9401fb5dfe5b','sortie','autre',181.00,'OPEX — CAFE EQUIPE','2026-02-13 00:00:00',NULL,NULL,NULL,'2026-04-19 23:40:06',NULL),('fcaf635b-ce35-46ca-9603-895c2444a08f','sortie','fraisBancaires',72.30,'Frais bancaires Avr 2026 — FATIMA MAIDA','2026-04-01 00:00:00',NULL,NULL,NULL,'2026-04-20 07:18:11','FATIMA MAIDA');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventes`
--

DROP TABLE IF EXISTS `ventes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventes` (
  `id` varchar(36) NOT NULL,
  `client` varchar(150) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `montant` decimal(12,2) NOT NULL,
  `paye` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `datePaiement` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventes`
--

LOCK TABLES `ventes` WRITE;
/*!40000 ALTER TABLE `ventes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-03 17:14:54
