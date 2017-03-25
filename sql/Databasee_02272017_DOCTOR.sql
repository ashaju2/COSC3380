-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 107.180.0.246    Database: Databasee
-- ------------------------------------------------------
-- Server version	5.6.33-cll-lve

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
-- Table structure for table `DOCTOR`
--

DROP TABLE IF EXISTS `DOCTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOCTOR` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `DoctorID` int(9) NOT NULL,
  `Specialty` varchar(45) DEFAULT NULL,
  `PrimaryPhysician` tinyint(4) DEFAULT NULL,
  `Phone` int(9) DEFAULT NULL,
  `PRESCRIPTION_PrescriptionID` int(9) NOT NULL,
  `DIAGNOSIS_DiganosisID` int(9) NOT NULL,
  `APPOINTMENT_AppointmentId` int(11) NOT NULL,
  `OFFICE_OfficeID` int(11) NOT NULL,
  `BLOODTEST_BloodTestId` int(11) NOT NULL,
  `OFFICE_OfficeID1` int(11) NOT NULL,
  `PRESCRIPTION_PrescriptionID1` int(9) NOT NULL,
  `DIAGNOSIS_DiganosisID1` int(9) NOT NULL,
  `TEST_BloodTestId` int(11) NOT NULL,
  PRIMARY KEY (`DoctorID`,`OFFICE_OfficeID`),
  UNIQUE KEY `DoctorID_UNIQUE` (`DoctorID`),
  KEY `fk_DOCTOR_PRESCRIPTION_idx` (`PRESCRIPTION_PrescriptionID`),
  KEY `fk_DOCTOR_DIAGNOSIS1_idx` (`DIAGNOSIS_DiganosisID`),
  KEY `fk_DOCTOR_APPOINTMENT1_idx` (`APPOINTMENT_AppointmentId`),
  KEY `fk_DOCTOR_OFFICE1_idx` (`OFFICE_OfficeID`),
  KEY `fk_DOCTOR_BLOODTEST1_idx` (`BLOODTEST_BloodTestId`),
  KEY `fk_DOCTOR_OFFICE1_idx1` (`OFFICE_OfficeID1`),
  KEY `fk_DOCTOR_PRESCRIPTION1_idx` (`PRESCRIPTION_PrescriptionID1`),
  KEY `fk_DOCTOR_DIAGNOSIS1_idx1` (`DIAGNOSIS_DiganosisID1`),
  KEY `fk_DOCTOR_TEST1_idx` (`TEST_BloodTestId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR`
--

LOCK TABLES `DOCTOR` WRITE;
/*!40000 ALTER TABLE `DOCTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOCTOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-27 19:51:39
