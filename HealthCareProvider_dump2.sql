-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: HealthCareProvider
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
-- Table structure for table `APPOINTMENT`
--

DROP TABLE IF EXISTS `APPOINTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPOINTMENT` (
  `AppointmentID` int(9) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `PurposeOfVisit` varchar(60) DEFAULT NULL,
  `AppointmentLocation` int(9) NOT NULL,
  `DoctorID` int(9) NOT NULL,
  `PatientID` int(9) NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `AppointmentLocation` (`AppointmentLocation`),
  KEY `DoctorID` (`DoctorID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`AppointmentLocation`) REFERENCES `OFFICE` (`OfficeID`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `DOCTOR` (`DoctorID`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPOINTMENT`
--

LOCK TABLES `APPOINTMENT` WRITE;
/*!40000 ALTER TABLE `APPOINTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `APPOINTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSIGNED_TO`
--

DROP TABLE IF EXISTS `ASSIGNED_TO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSIGNED_TO` (
  `DoctorID` int(9) NOT NULL,
  `PatientID` int(9) NOT NULL,
  KEY `DoctorID` (`DoctorID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `assigned_to_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `DOCTOR` (`DoctorID`),
  CONSTRAINT `assigned_to_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSIGNED_TO`
--

LOCK TABLES `ASSIGNED_TO` WRITE;
/*!40000 ALTER TABLE `ASSIGNED_TO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSIGNED_TO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIAGNOSIS`
--

DROP TABLE IF EXISTS `DIAGNOSIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIAGNOSIS` (
  `DiagnosisID` int(9) NOT NULL AUTO_INCREMENT,
  `DateOfDiagnosis` date DEFAULT NULL,
  `Diagnosis` varchar(60) DEFAULT NULL,
  `TreatmentPlan` varchar(60) DEFAULT NULL,
  `DiagnosisByID` int(9) NOT NULL,
  `PatientID` int(9) NOT NULL,
  PRIMARY KEY (`DiagnosisID`),
  KEY `PatientID` (`PatientID`),
  KEY `DiagnosisByID` (`DiagnosisByID`),
  CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`),
  CONSTRAINT `diagnosis_ibfk_2` FOREIGN KEY (`DiagnosisByID`) REFERENCES `DOCTOR` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIAGNOSIS`
--

LOCK TABLES `DIAGNOSIS` WRITE;
/*!40000 ALTER TABLE `DIAGNOSIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DIAGNOSIS` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Address` varchar(60) DEFAULT NULL,
  `DoctorID` int(9) NOT NULL AUTO_INCREMENT,
  `NPI` int(9) NOT NULL,
  `StateLicenseNumber` int(9) DEFAULT NULL,
  `StateOfLicense` char(2) DEFAULT NULL,
  `Specialty` varchar(45) DEFAULT NULL,
  `PrimaryPhysician` tinyint(4) DEFAULT NULL,
  `Phone` int(9) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  UNIQUE KEY `NPI` (`NPI`),
  UNIQUE KEY `StateOfLicense` (`StateOfLicense`,`StateLicenseNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR`
--

LOCK TABLES `DOCTOR` WRITE;
/*!40000 ALTER TABLE `DOCTOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `DOCTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFICE`
--

DROP TABLE IF EXISTS `OFFICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFICE` (
  `OfficeID` int(9) NOT NULL AUTO_INCREMENT,
  `Phone` int(9) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`OfficeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFICE`
--

LOCK TABLES `OFFICE` WRITE;
/*!40000 ALTER TABLE `OFFICE` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATIENT`
--

DROP TABLE IF EXISTS `PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATIENT` (
  `Fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `PatientID` int(9) NOT NULL AUTO_INCREMENT,
  `HRN` int(9) DEFAULT NULL,
  `SSN` int(9) DEFAULT NULL,
  `PreviousSurgery` tinyint(4) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  `HealthInsuranceName` varchar(60) DEFAULT NULL,
  `HasInsurance` tinyint(4) DEFAULT NULL,
  `Allergies` varchar(60) DEFAULT NULL,
  `Conditions` varchar(60) DEFAULT NULL,
  `Ethnicity` varchar(15) DEFAULT NULL,
  `Race` varchar(15) DEFAULT NULL,
  `Gender` varchar(15) DEFAULT NULL,
  `Phone` int(9) DEFAULT NULL,
  `PrimaryDoctor` int(9) NOT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `HRN` (`HRN`),
  UNIQUE KEY `SSN` (`SSN`),
  KEY `PrimaryDoctor` (`PrimaryDoctor`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`PrimaryDoctor`) REFERENCES `DOCTOR` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT`
--

LOCK TABLES `PATIENT` WRITE;
/*!40000 ALTER TABLE `PATIENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PATIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRESCRIPTION`
--

DROP TABLE IF EXISTS `PRESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIPTION` (
  `PrescriptionID` int(9) NOT NULL AUTO_INCREMENT,
  `Pharmacy` varchar(30) DEFAULT NULL,
  `PharmacyPhone` int(9) DEFAULT NULL,
  `DatePrescribed` date DEFAULT NULL,
  `DateLastFilled` date DEFAULT NULL,
  `Strength` varchar(30) DEFAULT NULL,
  `Amount` varchar(30) DEFAULT NULL,
  `Frequency` varchar(30) DEFAULT NULL,
  `Route` varchar(30) DEFAULT NULL,
  `SideEffects` varchar(60) DEFAULT NULL,
  `RefillsLeft` int(9) DEFAULT NULL,
  `PatientID` int(9) NOT NULL,
  `PrescriberID` int(9) NOT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `PatientID` (`PatientID`),
  KEY `PrescriberID` (`PrescriberID`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`),
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`PrescriberID`) REFERENCES `DOCTOR` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESCRIPTION`
--

LOCK TABLES `PRESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRESCRIPTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST`
--

DROP TABLE IF EXISTS `TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEST` (
  `TestID` int(9) NOT NULL AUTO_INCREMENT,
  `DateOfTest` date NOT NULL,
  `TimeOfTest` time NOT NULL,
  `Image` varchar(60) DEFAULT NULL,
  `Type` varchar(60) DEFAULT NULL,
  `Interpretation` varchar(60) DEFAULT NULL,
  `Results` varchar(60) DEFAULT NULL,
  `OrderedByID` int(9) NOT NULL,
  `InterpretedByID` int(9) NOT NULL,
  `PatientID` int(9) NOT NULL,
  PRIMARY KEY (`TestID`),
  KEY `OrderedByID` (`OrderedByID`),
  KEY `InterpretedByID` (`InterpretedByID`),
  KEY `PatientID` (`PatientID`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`OrderedByID`) REFERENCES `DOCTOR` (`DoctorID`),
  CONSTRAINT `test_ibfk_2` FOREIGN KEY (`InterpretedByID`) REFERENCES `DOCTOR` (`DoctorID`),
  CONSTRAINT `test_ibfk_3` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST`
--

LOCK TABLES `TEST` WRITE;
/*!40000 ALTER TABLE `TEST` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_AT`
--

DROP TABLE IF EXISTS `WORKS_AT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORKS_AT` (
  `DayOfWeek` varchar(9) NOT NULL,
  `DoctorID` int(9) NOT NULL,
  `OfficeID` int(9) NOT NULL,
  KEY `DoctorID` (`DoctorID`),
  KEY `OfficeID` (`OfficeID`),
  CONSTRAINT `works_at_ibfk_1` FOREIGN KEY (`DoctorID`) REFERENCES `DOCTOR` (`DoctorID`),
  CONSTRAINT `works_at_ibfk_2` FOREIGN KEY (`OfficeID`) REFERENCES `OFFICE` (`OfficeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_AT`
--

LOCK TABLES `WORKS_AT` WRITE;
/*!40000 ALTER TABLE `WORKS_AT` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORKS_AT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-28 18:00:23
