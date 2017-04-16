-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: cosc3380.cxynx1tgvjja.us-west-2.rds.amazonaws.com    Database: CLINIC
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
  `Date` date NOT NULL,
  `PurposeOfVisit` varchar(60) DEFAULT NULL,
  `DoctorID` int(9) NOT NULL,
  `PatientID` int(9) NOT NULL,
  `TimeSlot` int(9) NOT NULL,
  `DayLeft` int(9) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  UNIQUE KEY `doctor_appointment` (`Date`,`DoctorID`,`TimeSlot`),
  UNIQUE KEY `patient_appointment` (`Date`,`PatientID`,`TimeSlot`),
  KEY `DoctorID` (`DoctorID`),
  KEY `PatientID` (`PatientID`),
  KEY `appointment_ibfk_4` (`DoctorID`,`PatientID`),
  KEY `appointment_ibfk_5` (`DoctorID`),
  KEY `appointment_ibfk_8_idx` (`TimeSlot`),
  CONSTRAINT `appointment_ibfk_11` FOREIGN KEY (`DoctorID`, `PatientID`) REFERENCES `PATIENT` (`AssignedDoctor`, `PatientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `DOCTOR` (`DoctorID`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`),
  CONSTRAINT `appointment_ibfk_8` FOREIGN KEY (`TimeSlot`) REFERENCES `TIME_SLOTS` (`TimeSlotID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9612 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `APPOINTMENT`
--

LOCK TABLES `APPOINTMENT` WRITE;
/*!40000 ALTER TABLE `APPOINTMENT` DISABLE KEYS */;
INSERT INTO `APPOINTMENT` VALUES (1001,'2017-04-17','Headache',102,320,9,2),(1002,'2017-04-17','Check_up',102,340,10,2),(1003,'2017-04-17','Sore_Throat',102,360,11,2),(1004,'2017-04-17','Headache',102,380,12,2),(1005,'2017-04-17','Check_up',102,400,13,2),(1006,'2017-04-17','Sore_Throat',103,301,14,2),(1007,'2017-04-17','Headache',103,321,15,2),(1008,'2017-04-17','Check_up',103,341,16,2),(1009,'2017-04-17','Sore_Throat',103,361,8,2),(1010,'2017-04-17','Headache',103,381,9,2),(1011,'2017-04-17','Check_up',104,302,10,2),(1012,'2017-04-17','Sore_Throat',104,322,11,2),(1013,'2017-04-17','Headache',104,342,12,2),(1014,'2017-04-17','Check_up',104,362,13,2),(1015,'2017-04-17','Sore_Throat',104,382,14,2),(1016,'2017-04-17','Headache',105,303,15,2),(1017,'2017-04-17','Check_up',105,323,16,2),(1018,'2017-04-17','Sore_Throat',105,343,8,2),(1019,'2017-04-17','Headache',105,363,9,2),(1020,'2017-04-17','Check_up',105,383,10,2),(1021,'2017-04-17','Sore_Throat',106,304,11,2),(1022,'2017-04-17','Headache',106,324,12,2),(1023,'2017-04-17','Check_up',106,344,13,2),(1024,'2017-04-17','Sore_Throat',106,364,14,2),(1025,'2017-04-17','Headache',106,384,15,2),(1026,'2017-04-17','Check_up',107,305,16,2),(1027,'2017-04-17','Sore_Throat',107,325,8,2),(1028,'2017-04-17','Headache',107,345,9,2),(1029,'2017-04-17','Check_up',107,365,10,2),(1030,'2017-04-17','Sore_Throat',107,385,11,2),(1031,'2017-04-17','Headache',108,306,12,2),(1032,'2017-04-17','Check_up',108,326,13,2),(1033,'2017-04-17','Sore_Throat',108,346,14,2),(1034,'2017-04-17','Headache',108,366,15,2),(1035,'2017-04-17','Check_up',108,386,16,2),(1036,'2017-04-17','Sore_Throat',109,307,8,2),(1037,'2017-04-17','Headache',109,327,9,2),(1038,'2017-04-17','Check_up',109,347,10,2),(1039,'2017-04-17','Sore_Throat',109,367,11,2),(1040,'2017-04-17','Headache',109,387,12,2),(1041,'2017-04-17','Check_up',110,308,13,2),(1042,'2017-04-17','Sore_Throat',110,328,14,2),(1043,'2017-04-17','Headache',110,348,15,2),(1044,'2017-04-17','Check_up',110,368,16,2),(1045,'2017-04-17','Sore_Throat',110,388,8,2),(1046,'2017-04-17','Headache',111,309,9,2),(1047,'2017-04-17','Check_up',111,329,10,2),(1048,'2017-04-17','Sore_Throat',111,349,11,2),(1049,'2017-04-17','Headache',111,369,12,2),(1050,'2017-04-17','Check_up',111,389,13,2),(1051,'2017-04-17','Sore_Throat',112,310,14,2),(1052,'2017-04-17','Headache',112,330,15,2),(1053,'2017-04-17','Check_up',112,350,16,2),(1054,'2017-04-17','Sore_Throat',112,370,8,2),(1055,'2017-04-17','Headache',112,390,9,2),(1056,'2017-04-17','Check_up',113,311,10,2),(1057,'2017-04-17','Sore_Throat',113,331,11,2),(1058,'2017-04-17','Headache',113,351,12,2),(1059,'2017-04-17','Check_up',113,371,13,2),(1060,'2017-04-17','Sore_Throat',113,391,14,2),(1061,'2017-04-17','Headache',114,312,15,2),(1062,'2017-04-17','Check_up',114,332,16,2),(1063,'2017-04-17','Sore_Throat',114,352,8,2),(1064,'2017-04-17','Headache',114,372,9,2),(1065,'2017-04-17','Check_up',114,392,10,2),(1066,'2017-04-17','Sore_Throat',115,313,11,2),(1067,'2017-04-17','Headache',115,333,12,2),(1068,'2017-04-17','Check_up',115,353,13,2),(1069,'2017-04-17','Sore_Throat',115,373,14,2),(1070,'2017-04-17','Headache',115,393,15,2),(1071,'2017-04-17','Check_up',116,314,16,2),(1072,'2017-04-17','Sore_Throat',116,334,8,2),(1073,'2017-04-17','Headache',116,354,9,2),(1074,'2017-04-17','Check_up',116,374,10,2),(1075,'2017-04-17','Sore_Throat',116,394,11,2),(1076,'2017-04-17','Headache',117,315,12,2),(1077,'2017-04-17','Check_up',117,335,13,2),(1078,'2017-04-17','Sore_Throat',117,355,14,2),(1079,'2017-04-17','Headache',117,375,15,2),(1080,'2017-04-17','Check_up',117,395,16,2),(1081,'2017-04-17','Sore_Throat',118,316,8,2),(1082,'2017-04-17','Headache',118,336,9,2),(1083,'2017-04-17','Check_up',118,356,10,2),(1084,'2017-04-17','Sore_Throat',118,376,11,2),(1085,'2017-04-17','Headache',118,396,12,2),(1086,'2017-04-17','Check_up',119,317,13,2),(1087,'2017-04-17','Sore_Throat',119,337,14,2),(1088,'2017-04-17','Headache',119,357,15,2),(1089,'2017-04-17','Check_up',119,377,16,2),(1090,'2017-04-17','Sore_Throat',119,397,8,2),(1091,'2017-04-17','Headache',120,318,9,2),(1092,'2017-04-17','Check_up',120,338,10,2),(1093,'2017-04-17','Sore_Throat',120,358,11,2),(1094,'2017-04-17','Headache',120,378,12,2),(1095,'2017-04-17','Check_up',120,398,13,2),(1096,'2017-04-17','Sore_Throat',121,319,14,2),(1097,'2017-04-17','Headache',121,339,15,2),(1098,'2017-04-17','Check_up',121,359,16,2),(1099,'2017-04-17','Sore_Throat',121,379,8,2),(1100,'2017-04-17','Headache',121,399,9,2),(1102,'2017-04-18','Fever',112,310,14,3),(1104,'2017-04-18','Sore_Foot',112,330,15,3),(1106,'2017-04-18','Fatigue',112,350,16,3),(1108,'2017-04-18','Fever',112,370,8,3),(1110,'2017-04-18','Sore_Foot',112,390,9,3),(1112,'2017-04-18','Fatigue',113,311,10,3),(1114,'2017-04-18','Fever',113,331,11,3),(1116,'2017-04-18','Sore_Foot',113,351,12,3),(1118,'2017-04-18','Fatigue',113,371,13,3),(1120,'2017-04-18','Fever',113,391,14,3),(1122,'2017-04-18','Sore_Foot',114,312,15,3),(1124,'2017-04-18','Fatigue',114,332,16,3),(1126,'2017-04-18','Fever',114,352,8,3),(1128,'2017-04-18','Sore_Foot',114,372,9,3),(1130,'2017-04-18','Fatigue',114,392,10,3),(1132,'2017-04-18','Fever',115,313,11,3),(1134,'2017-04-18','Sore_Foot',115,333,12,3),(1136,'2017-04-18','Fatigue',115,353,13,3),(1138,'2017-04-18','Fever',115,373,14,3),(1140,'2017-04-18','Sore_Foot',115,393,15,3),(1142,'2017-04-18','Fatigue',116,314,16,3),(1144,'2017-04-18','Fever',116,334,8,3),(1146,'2017-04-18','Sore_Foot',116,354,9,3),(1148,'2017-04-18','Fatigue',116,374,10,3),(1150,'2017-04-18','Fever',116,394,11,3),(1152,'2017-04-18','Sore_Foot',117,315,12,3),(1154,'2017-04-18','Fatigue',117,335,13,3),(1156,'2017-04-18','Fever',117,355,14,3),(1158,'2017-04-18','Sore_Foot',117,375,15,3),(1160,'2017-04-18','Fatigue',117,395,16,3),(1162,'2017-04-18','Fever',118,316,8,3),(1164,'2017-04-18','Sore_Foot',118,336,9,3),(1166,'2017-04-18','Fatigue',118,356,10,3),(1168,'2017-04-18','Fever',118,376,11,3),(1170,'2017-04-18','Sore_Foot',118,396,12,3),(1172,'2017-04-18','Fatigue',119,317,13,3),(1174,'2017-04-18','Fever',119,337,14,3),(1176,'2017-04-18','Sore_Foot',119,357,15,3),(1178,'2017-04-18','Fatigue',119,377,16,3),(1180,'2017-04-18','Fever',119,397,8,3),(1182,'2017-04-18','Sore_Foot',120,318,9,3),(1184,'2017-04-18','Fatigue',120,338,10,3),(1186,'2017-04-18','Fever',120,358,11,3),(1188,'2017-04-18','Sore_Foot',120,378,12,3),(1190,'2017-04-18','Fatigue',120,398,13,3),(1192,'2017-04-18','Fever',121,319,14,3),(1194,'2017-04-18','Sore_Foot',121,339,15,3),(1196,'2017-04-18','Fatigue',121,359,16,3),(1198,'2017-04-18','Fever',121,379,8,3),(1200,'2017-04-18','Sore_Foot',121,399,9,3),(2002,'2017-04-19','Sore_Foot',102,320,9,4),(2004,'2017-04-19','Fatigue',102,340,10,4),(2006,'2017-04-19','Fever',102,360,11,4),(2008,'2017-04-19','Sore_Foot',102,380,12,4),(2010,'2017-04-19','Fatigue',102,400,13,4),(2012,'2017-04-19','Fever',103,301,14,4),(2014,'2017-04-19','Sore_Foot',103,321,15,4),(2016,'2017-04-19','Fatigue',103,341,16,4),(2018,'2017-04-19','Fever',103,361,8,4),(2020,'2017-04-19','Sore_Foot',103,381,9,4),(2022,'2017-04-19','Fatigue',104,302,10,4),(2024,'2017-04-19','Fever',104,322,11,4),(2026,'2017-04-19','Sore_Foot',104,342,12,4),(2028,'2017-04-19','Fatigue',104,362,13,4),(2030,'2017-04-19','Fever',104,382,14,4),(2032,'2017-04-19','Sore_Foot',105,303,15,4),(2034,'2017-04-19','Fatigue',105,323,16,4),(2036,'2017-04-19','Fever',105,343,8,4),(2038,'2017-04-19','Sore_Foot',105,363,9,4),(2040,'2017-04-19','Fatigue',105,383,10,4),(2042,'2017-04-19','Fever',106,304,11,4),(2044,'2017-04-19','Sore_Foot',106,324,12,4),(2046,'2017-04-19','Fatigue',106,344,13,4),(2048,'2017-04-19','Fever',106,364,14,4),(2050,'2017-04-19','Sore_Foot',106,384,15,4),(2052,'2017-04-19','Fatigue',107,305,16,4),(2054,'2017-04-19','Fever',107,325,8,4),(2056,'2017-04-19','Sore_Foot',107,345,9,4),(2058,'2017-04-19','Fatigue',107,365,10,4),(2060,'2017-04-19','Fever',107,385,11,4),(2062,'2017-04-19','Sore_Foot',108,306,12,4),(2064,'2017-04-19','Fatigue',108,326,13,4),(2066,'2017-04-19','Fever',108,346,14,4),(2068,'2017-04-19','Sore_Foot',108,366,15,4),(2070,'2017-04-19','Fatigue',108,386,16,4),(2072,'2017-04-19','Fever',109,307,8,4),(2074,'2017-04-19','Sore_Foot',109,327,9,4),(2076,'2017-04-19','Fatigue',109,347,10,4),(2078,'2017-04-19','Fever',109,367,11,4),(2080,'2017-04-19','Sore_Foot',109,387,12,4),(2082,'2017-04-19','Fatigue',110,308,13,4),(2084,'2017-04-19','Fever',110,328,14,4),(2086,'2017-04-19','Sore_Foot',110,348,15,4),(2088,'2017-04-19','Fatigue',110,368,16,4),(2090,'2017-04-19','Fever',110,388,8,4),(2092,'2017-04-19','Sore_Foot',111,309,9,4),(2094,'2017-04-19','Fatigue',111,329,10,4),(2096,'2017-04-19','Fever',111,349,11,4),(2098,'2017-04-19','Sore_Foot',111,369,12,4),(2100,'2017-04-19','Fatigue',111,389,13,4),(2102,'2017-04-19','Fever',112,310,14,4),(2104,'2017-04-19','Sore_Foot',112,330,15,4),(2106,'2017-04-19','Fatigue',112,350,16,4),(2108,'2017-04-19','Fever',112,370,8,4),(2110,'2017-04-19','Sore_Foot',112,390,9,4),(2112,'2017-04-19','Fatigue',113,311,10,4),(2114,'2017-04-19','Fever',113,331,11,4),(2116,'2017-04-19','Sore_Foot',113,351,12,4),(2118,'2017-04-19','Fatigue',113,371,13,4),(2120,'2017-04-19','Fever',113,391,14,4),(2122,'2017-04-19','Sore_Foot',114,312,15,4),(2124,'2017-04-19','Fatigue',114,332,16,4),(2126,'2017-04-19','Fever',114,352,8,4),(2128,'2017-04-19','Sore_Foot',114,372,9,4),(2130,'2017-04-19','Fatigue',114,392,10,4),(2132,'2017-04-19','Fever',115,313,11,4),(2134,'2017-04-19','Sore_Foot',115,333,12,4),(2136,'2017-04-19','Fatigue',115,353,13,4),(2138,'2017-04-19','Fever',115,373,14,4),(2140,'2017-04-19','Sore_Foot',115,393,15,4),(2142,'2017-04-19','Fatigue',116,314,16,4),(2144,'2017-04-19','Fever',116,334,8,4),(2146,'2017-04-19','Sore_Foot',116,354,9,4),(2148,'2017-04-19','Fatigue',116,374,10,4),(2150,'2017-04-19','Fever',116,394,11,4),(2152,'2017-04-19','Sore_Foot',117,315,12,4),(2154,'2017-04-19','Fatigue',117,335,13,4),(2156,'2017-04-19','Fever',117,355,14,4),(2158,'2017-04-19','Sore_Foot',117,375,15,4),(2160,'2017-04-19','Fatigue',117,395,16,4),(2162,'2017-04-19','Fever',118,316,8,4),(2164,'2017-04-19','Sore_Foot',118,336,9,4),(2166,'2017-04-19','Fatigue',118,356,10,4),(2168,'2017-04-19','Fever',118,376,11,4),(2170,'2017-04-19','Sore_Foot',118,396,12,4),(2172,'2017-04-19','Fatigue',119,317,13,4),(2174,'2017-04-19','Fever',119,337,14,4),(2176,'2017-04-19','Sore_Foot',119,357,15,4),(2178,'2017-04-19','Fatigue',119,377,16,4),(2180,'2017-04-19','Fever',119,397,8,4),(2182,'2017-04-19','Sore_Foot',120,318,9,4),(2184,'2017-04-19','Fatigue',120,338,10,4),(2186,'2017-04-19','Fever',120,358,11,4),(2188,'2017-04-19','Sore_Foot',120,378,12,4),(2190,'2017-04-19','Fatigue',120,398,13,4),(2192,'2017-04-19','Fever',121,319,14,4),(2194,'2017-04-19','Sore_Foot',121,339,15,4),(2196,'2017-04-19','Fatigue',121,359,16,4),(2198,'2017-04-19','Fever',121,379,8,4),(2200,'2017-04-19','Sore_Foot',121,399,9,4),(9517,'2017-04-20','Rabies',121,399,9,5),(9518,'2017-04-22','Sore Throat',121,399,11,7),(9519,'2017-04-22','Sore Back',121,399,13,7),(9522,'2017-04-20','Cough',121,399,14,5),(9523,'2017-04-24','Cough',121,399,14,9),(9525,'2017-04-21','Back',121,379,14,6),(9527,'2017-04-21','Back',121,379,9,6),(9529,'2017-04-21','jggvg',121,379,16,6),(9530,'2017-04-21','hvv',121,379,11,6),(9531,'2017-04-25','hgvh',121,379,11,10),(9533,'2017-04-25','Headache',121,379,15,10),(9534,'2017-04-26','Cancer',121,399,12,11),(9535,'2017-04-27','Rash',103,301,13,12),(9536,'2017-04-26','Headache',121,379,15,11),(9537,'2017-04-27','BURN',108,306,15,12),(9538,'2017-04-29','Headache',121,379,13,14),(9539,'2017-04-30','Headache',121,399,11,15),(9544,'2017-04-25','csdcsd',103,301,13,10),(9547,'2017-04-25','Ears',103,301,12,10),(9548,'2017-04-17','backpain',103,301,11,2),(9549,'2017-04-17','sds',103,301,10,2),(9550,'2017-04-17','dsd',103,301,12,2),(9551,'2017-04-17','swedqwdq',103,301,13,2),(9552,'2017-04-25','dwedwe',103,301,11,10),(9553,'2017-04-25','scsd',103,301,8,10),(9554,'2017-04-25','blah',103,301,10,10),(9555,'2017-04-25','dscds',103,301,14,10),(9556,'2017-04-25','headache',103,301,15,10),(9557,'2017-04-25','scsdccd',103,301,16,10),(9558,'2017-04-19','Broken Arm',121,399,10,4),(9559,'2017-04-19','Broken Head',121,359,11,4),(9560,'2017-04-19','Fever',121,359,12,4),(9561,'2017-04-19','Dizzyness',121,379,13,4),(9562,'2017-04-25','Flu',118,316,14,10),(9564,'2017-04-13','rfdvcdvrd',103,301,9,-2),(9565,'2017-04-13','crscse',103,301,10,-2),(9566,'2017-04-13','headace',103,301,12,-2),(9567,'2017-04-13','hello',103,301,16,-2),(9568,'2017-04-16','headace',103,301,10,1),(9569,'2017-04-15','Back Pain',103,301,11,0),(9570,'2017-04-16','Eye Pain',103,301,8,1),(9571,'2017-04-16','',103,301,11,1),(9572,'2017-04-14','Sore Back',105,303,13,-1),(9573,'2107-04-16','',103,301,10,NULL),(9574,'2017-04-16','',103,301,16,NULL),(9575,'2017-04-16','',103,301,14,NULL),(9576,'2017-05-12','Diarrhea',121,399,15,NULL),(9577,'2017-05-10','Sore Throat',121,399,15,NULL),(9578,'2017-04-27','Sore Throat',121,399,15,NULL),(9579,'2017-04-27','Sore Throat',113,311,15,NULL),(9580,'2017-04-29','Sore Throat',102,320,15,NULL),(9582,'2017-04-29','Sore Throat',104,302,15,NULL),(9583,'2017-04-29','Sore Throat',105,303,15,NULL),(9584,'2017-04-29','Sore Throat',106,304,15,NULL),(9586,'2017-04-29','Sore Throat',107,305,15,NULL),(9587,'2017-04-29','Sore Throat',108,306,15,NULL),(9588,'2017-04-29','Sore Throat',109,307,15,NULL),(9589,'2017-04-29','Sore Throat',110,308,15,NULL),(9590,'2017-04-29','Sore Throat',111,309,15,NULL),(9591,'2017-04-29','Sore Throat',112,310,15,NULL),(9592,'2017-04-29','Sore Throat',113,311,15,NULL),(9593,'2017-04-29','Sore Throat',114,312,15,NULL),(9594,'2017-04-29','Sore Throat',115,313,15,NULL),(9595,'2017-04-29','Sore Throat',116,314,15,NULL),(9596,'2017-04-29','Sore Throat',117,315,15,NULL),(9597,'2017-04-29','Sore Throat',118,316,15,NULL),(9598,'2017-04-29','Sore Throat',119,317,15,NULL),(9599,'2017-04-29','Sore Throat',120,318,15,NULL),(9600,'2017-04-29','Sore Throat',121,319,15,NULL),(9601,'2017-04-15','Skin Infection',116,314,8,NULL),(9603,'2017-04-15','Tumor',116,334,9,NULL),(9604,'2017-04-15','Epilepsy',116,354,10,NULL),(9605,'2017-04-15','Burn',116,374,13,NULL),(9606,'2017-04-15','Seizures',116,394,14,NULL),(9607,'2017-04-17','Coughing',106,324,9,NULL),(9608,'2017-04-16','Headache',121,399,11,NULL),(9610,'2017-04-17','Paranoia',118,316,16,NULL),(9611,'2017-04-22','Frog Throat',118,316,13,NULL);
/*!40000 ALTER TABLE `APPOINTMENT` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`apshaju`@`%`*/ /*!50003 TRIGGER `CLINIC`.`APPOINTMENT_BEFORE_INSERT` BEFORE INSERT ON `APPOINTMENT` FOR EACH ROW
BEGIN
	if (does_doctor_exist2(NEW.DoctorID) = 0) then
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'The Doctor does not exist anymore.';
	end if;
    if (New.Date < CURDATE()) then
 		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'The Appointment is in the past.';
	end if;
    
    update DOCTOR
	set ApptsThisMonth = (
		select count(*) from APPOINTMENT as a
		where MONTH(a.Date) = MONTH(now())
		AND DoctorID = NEW.DoctorID)
	where DoctorID = New.DoctorID;
        
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  KEY `diagnosis_ibfk_3` (`DiagnosisByID`,`PatientID`),
  CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`),
  CONSTRAINT `diagnosis_ibfk_11` FOREIGN KEY (`DiagnosisByID`, `PatientID`) REFERENCES `PATIENT` (`AssignedDoctor`, `PatientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `diagnosis_ibfk_2` FOREIGN KEY (`DiagnosisByID`) REFERENCES `DOCTOR` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=5538 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIAGNOSIS`
--

LOCK TABLES `DIAGNOSIS` WRITE;
/*!40000 ALTER TABLE `DIAGNOSIS` DISABLE KEYS */;
INSERT INTO `DIAGNOSIS` VALUES (5002,'2017-03-05','Sinus Infection','Antibiotics',107,325),(5003,'2017-03-05','Back pain','Tylenol',107,345),(5005,'2017-03-05','Sprained Ankle','Rest and Ice',107,385),(5006,'2017-03-05','Flu','Rest and Tylenol',113,311),(5008,'2017-03-05','Sinus Infection','Antibiotics',113,351),(5009,'2017-03-05','Back pain','Tylenol',113,371),(5011,'2017-03-05','Sprained Ankle','Rest and Ice',102,320),(5012,'2017-03-05','Flu','Rest and Tylenol',102,340),(5014,'2017-03-05','Sinus Infection','Antibiotics',102,380),(5015,'2017-03-05','Back pain','Tylenol',102,400),(5017,'2017-03-05','Sprained Ankle','Rest and Ice',114,332),(5018,'2017-03-05','Flu','Rest and Tylenol',114,352),(5020,'2017-03-05','Sinus Infection','Antibiotics',114,392),(5021,'2017-03-05','Back pain','Tylenol',120,318),(5023,'2017-03-05','Sprained Ankle','Rest and Ice',120,358),(5024,'2017-03-05','Flu','Rest and Tylenol',120,378),(5026,'2017-03-05','Sinus Infection','Antibiotics',103,301),(5027,'2017-03-05','Back pain','Tylenol',103,321),(5029,'2017-03-05','Sprained Ankle','Rest and Ice',103,361),(5030,'2017-03-05','Flu','Rest and Tylenol',103,381),(5032,'2017-03-05','Sinus Infection','Antibiotics',104,322),(5033,'2017-03-05','Back pain','Tylenol',104,342),(5035,'2017-03-05','Sprained Ankle','Rest and Ice',104,382),(5036,'2017-03-05','Flu','Rest and Tylenol',109,307),(5038,'2017-03-05','Sinus Infection','Antibiotics',109,347),(5039,'2017-03-05','Back pain','Tylenol',109,367),(5041,'2017-03-05','Sprained Ankle','Rest and Ice',110,308),(5042,'2017-03-05','Flu','Rest and Tylenol',110,328),(5044,'2017-03-05','Sinus Infection','Antibiotics',110,368),(5045,'2017-03-05','Back pain','Tylenol',110,388),(5047,'2017-03-05','Sprained Ankle','Rest and Ice',121,339),(5048,'2017-03-05','Flu','Rest and Tylenol',121,359),(5050,'2017-03-05','Sinus Infection','Antibiotics',121,399),(5051,'2017-03-05','Back pain','Tylenol',111,309),(5053,'2017-03-05','Sprained Ankle','Rest and Ice',111,349),(5054,'2017-03-05','Flu','Rest and Tylenol',111,369),(5056,'2017-03-05','Sinus Infection','Antibiotics',116,314),(5057,'2017-03-05','Back pain','Tylenol',116,334),(5059,'2017-03-05','Sprained Ankle','Rest and Ice',116,374),(5060,'2017-03-05','Flu','Rest and Tylenol',116,394),(5062,'2017-03-05','Sinus Infection','Antibiotics',117,335),(5063,'2017-03-05','Back pain','Tylenol',117,355),(5065,'2017-03-05','Sprained Ankle','Rest and Ice',117,395),(5066,'2017-03-05','Flu','Rest and Tylenol',106,304),(5068,'2017-03-05','Sinus Infection','Antibiotics',106,344),(5069,'2017-03-05','Back pain','Tylenol',106,364),(5071,'2017-03-05','Sprained Ankle','Rest and Ice',118,316),(5072,'2017-03-05','Flu','Rest and Tylenol',118,336),(5074,'2017-03-05','Sinus Infection','Antibiotics',118,376),(5075,'2017-03-05','Back pain','Tylenol',118,396),(5077,'2017-03-06','Sprained Ankle','Rest and Ice',107,325),(5078,'2017-03-06','Flu','Rest and Tylenol',107,345),(5080,'2017-03-06','Sinus Infection','Antibiotics',107,385),(5081,'2017-03-06','Back pain','Tylenol',113,311),(5083,'2017-03-06','Sprained Ankle','Rest and Ice',113,351),(5084,'2017-03-06','Flu','Rest and Tylenol',113,371),(5086,'2017-03-06','Sinus Infection','Antibiotics',119,317),(5087,'2017-03-06','Back pain','Tylenol',119,337),(5089,'2017-03-06','Sprained Ankle','Rest and Ice',119,377),(5090,'2017-03-06','Flu','Rest and Tylenol',119,397),(5092,'2017-03-06','Sinus Infection','Antibiotics',102,340),(5093,'2017-03-06','Back pain','Tylenol',102,360),(5095,'2017-03-06','Sprained Ankle','Rest and Ice',102,400),(5096,'2017-03-06','Flu','Rest and Tylenol',114,312),(5098,'2017-03-06','Sinus Infection','Antibiotics',114,352),(5099,'2017-03-06','Back pain','Tylenol',114,372),(5101,'2017-03-06','Sprained Ankle','Rest and Ice',120,318),(5102,'2017-03-06','Flu','Rest and Tylenol',120,338),(5104,'2017-03-06','Sinus Infection','Antibiotics',120,378),(5105,'2017-03-06','Back pain','Tylenol',120,398),(5107,'2017-03-06','Sprained Ankle','Rest and Ice',103,321),(5108,'2017-03-06','Flu','Rest and Tylenol',103,341),(5110,'2017-03-06','Sinus Infection','Antibiotics',103,381),(5111,'2017-03-06','Back pain','Tylenol',109,307),(5113,'2017-03-06','Sprained Ankle','Rest and Ice',109,347),(5114,'2017-03-06','Flu','Rest and Tylenol',109,367),(5116,'2017-03-06','Sinus Infection','Antibiotics',121,319),(5117,'2017-03-06','Back pain','Tylenol',121,339),(5119,'2017-03-06','Sprained Ankle','Rest and Ice',121,379),(5120,'2017-03-06','Flu','Rest and Tylenol',121,399),(5122,'2017-03-06','Sinus Infection','Antibiotics',105,323),(5123,'2017-03-06','Back pain','Tylenol',105,343),(5125,'2017-03-06','Sprained Ankle','Rest and Ice',105,383),(5126,'2017-03-06','Flu','Rest and Tylenol',110,308),(5128,'2017-03-06','Sinus Infection','Antibiotics',110,348),(5129,'2017-03-06','Back pain','Tylenol',110,368),(5131,'2017-03-06','Sprained Ankle','Rest and Ice',116,314),(5132,'2017-03-06','Flu','Rest and Tylenol',116,334),(5134,'2017-03-06','Sinus Infection','Antibiotics',116,374),(5135,'2017-03-06','Back pain','Tylenol',116,394),(5137,'2017-03-06','Sprained Ankle','Rest and Ice',106,324),(5138,'2017-03-06','Flu','Rest and Tylenol',106,344),(5140,'2017-03-06','Sinus Infection','Antibiotics',106,384),(5141,'2017-03-06','Back pain','Tylenol',112,310),(5143,'2017-03-06','Sprained Ankle','Rest and Ice',112,350),(5144,'2017-03-06','Flu','Rest and Tylenol',112,370),(5146,'2017-03-06','Sinus Infection','Antibiotics',117,315),(5147,'2017-03-06','Back pain','Tylenol',117,335),(5149,'2017-03-06','Sprained Ankle','Rest and Ice',117,375),(5150,'2017-03-06','Flu','Rest and Tylenol',117,395),(5152,'2017-03-07','Sinus Infection','Antibiotics',113,331),(5153,'2017-03-07','Back pain','Tylenol',113,351),(5155,'2017-03-07','Sprained Ankle','Rest and Ice',113,391),(5156,'2017-03-07','Flu','Rest and Tylenol',119,317),(5158,'2017-03-07','Sinus Infection','Antibiotics',119,357),(5159,'2017-03-07','Back pain','Tylenol',119,377),(5161,'2017-03-07','Sprained Ankle','Rest and Ice',102,320),(5162,'2017-03-07','Flu','Rest and Tylenol',102,340),(5164,'2017-03-07','Sinus Infection','Antibiotics',102,380),(5165,'2017-03-07','Back pain','Tylenol',102,400),(5167,'2017-03-07','Sprained Ankle','Rest and Ice',108,326),(5168,'2017-03-07','Flu','Rest and Tylenol',108,346),(5170,'2017-03-07','Sinus Infection','Antibiotics',108,386),(5171,'2017-03-07','Back pain','Tylenol',120,318),(5173,'2017-03-07','Sprained Ankle','Rest and Ice',120,358),(5174,'2017-03-07','Flu','Rest and Tylenol',120,378),(5176,'2017-03-07','Sinus Infection','Antibiotics',103,301),(5177,'2017-03-07','Back pain','Tylenol',103,321),(5179,'2017-03-07','Sprained Ankle','Rest and Ice',103,361),(5180,'2017-03-07','Flu','Rest and Tylenol',103,381),(5182,'2017-03-07','Sinus Infection','Antibiotics',109,327),(5183,'2017-03-07','Back pain','Tylenol',109,347),(5185,'2017-03-07','Sprained Ankle','Rest and Ice',109,387),(5186,'2017-03-07','Flu','Rest and Tylenol',115,313),(5188,'2017-03-07','Sinus Infection','Antibiotics',115,353),(5189,'2017-03-07','Back pain','Tylenol',115,373),(5191,'2017-03-07','Sprained Ankle','Rest and Ice',105,303),(5192,'2017-03-07','Flu','Rest and Tylenol',105,323),(5194,'2017-03-07','Sinus Infection','Antibiotics',105,363),(5195,'2017-03-07','Back pain','Tylenol',105,383),(5197,'2017-03-07','Sprained Ankle','Rest and Ice',110,328),(5198,'2017-03-07','Flu','Rest and Tylenol',110,348),(5200,'2017-03-07','Sinus Infection','Antibiotics',110,388),(5201,'2017-03-07','Back pain','Tylenol',116,314),(5203,'2017-03-07','Sprained Ankle','Rest and Ice',116,354),(5204,'2017-03-07','Flu','Rest and Tylenol',116,374),(5206,'2017-03-07','Sinus Infection','Antibiotics',106,304),(5207,'2017-03-07','Back pain','Tylenol',106,324),(5209,'2017-03-07','Sprained Ankle','Rest and Ice',106,364),(5210,'2017-03-07','Flu','Rest and Tylenol',106,384),(5212,'2017-03-07','Sinus Infection','Antibiotics',112,330),(5213,'2017-03-07','Back pain','Tylenol',112,350),(5215,'2017-03-07','Sprained Ankle','Rest and Ice',112,390),(5216,'2017-03-07','Flu','Rest and Tylenol',117,315),(5218,'2017-03-07','Sinus Infection','Antibiotics',117,355),(5219,'2017-03-07','Back pain','Tylenol',117,375),(5221,'2017-03-08','Sprained Ankle','Rest and Ice',106,304),(5222,'2017-03-08','Flu','Rest and Tylenol',106,324),(5224,'2017-03-08','Sinus Infection','Antibiotics',106,364),(5225,'2017-03-08','Back pain','Tylenol',106,384),(5227,'2017-03-08','Sprained Ankle','Rest and Ice',112,330),(5228,'2017-03-08','Flu','Rest and Tylenol',112,350),(5230,'2017-03-08','Sinus Infection','Antibiotics',112,390),(5231,'2017-03-08','Back pain','Tylenol',119,317),(5233,'2017-03-08','Sprained Ankle','Rest and Ice',119,357),(5234,'2017-03-08','Flu','Rest and Tylenol',119,377),(5236,'2017-03-08','Sinus Infection','Antibiotics',102,320),(5237,'2017-03-08','Back pain','Tylenol',102,340),(5239,'2017-03-08','Sprained Ankle','Rest and Ice',102,380),(5240,'2017-03-08','Flu','Rest and Tylenol',102,400),(5242,'2017-03-08','Sinus Infection','Antibiotics',108,326),(5243,'2017-03-08','Back pain','Tylenol',108,346),(5245,'2017-03-08','Sprained Ankle','Rest and Ice',108,386),(5246,'2017-03-08','Flu','Rest and Tylenol',113,311),(5248,'2017-03-08','Sinus Infection','Antibiotics',113,351),(5249,'2017-03-08','Back pain','Tylenol',113,371),(5251,'2017-03-08','Sprained Ankle','Rest and Ice',120,318),(5252,'2017-03-08','Flu','Rest and Tylenol',120,338),(5254,'2017-03-08','Sinus Infection','Antibiotics',120,378),(5255,'2017-03-08','Back pain','Tylenol',120,398),(5257,'2017-03-08','Sprained Ankle','Rest and Ice',109,327),(5258,'2017-03-08','Flu','Rest and Tylenol',109,347),(5260,'2017-03-08','Sinus Infection','Antibiotics',109,387),(5261,'2017-03-08','Back pain','Tylenol',115,313),(5263,'2017-03-08','Sprained Ankle','Rest and Ice',115,353),(5264,'2017-03-08','Flu','Rest and Tylenol',115,373),(5266,'2017-03-08','Sinus Infection','Antibiotics',104,302),(5267,'2017-03-08','Back pain','Tylenol',104,322),(5269,'2017-03-08','Sprained Ankle','Rest and Ice',104,362),(5270,'2017-03-08','Flu','Rest and Tylenol',104,382),(5272,'2017-03-08','Sinus Infection','Antibiotics',111,329),(5273,'2017-03-08','Back pain','Tylenol',111,349),(5275,'2017-03-08','Sprained Ankle','Rest and Ice',111,389),(5276,'2017-03-08','Flu','Rest and Tylenol',116,314),(5278,'2017-03-08','Sinus Infection','Antibiotics',116,354),(5279,'2017-03-08','Back pain','Tylenol',116,374),(5281,'2017-03-08','Sprained Ankle','Rest and Ice',105,303),(5282,'2017-03-08','Flu','Rest and Tylenol',105,323),(5284,'2017-03-08','Sinus Infection','Antibiotics',105,363),(5285,'2017-03-08','Back pain','Tylenol',105,383),(5287,'2017-03-08','Sprained Ankle','Rest and Ice',118,336),(5288,'2017-03-08','Flu','Rest and Tylenol',118,356),(5290,'2017-03-08','Sinus Infection','Antibiotics',118,396),(5291,'2017-03-09','Back pain','Tylenol',107,305),(5293,'2017-03-09','Sprained Ankle','Rest and Ice',107,345),(5294,'2017-03-09','Flu','Rest and Tylenol',107,365),(5296,'2017-03-09','Sinus Infection','Antibiotics',112,310),(5297,'2017-03-09','Back pain','Tylenol',112,330),(5299,'2017-03-09','Sprained Ankle','Rest and Ice',112,370),(5300,'2017-03-09','Flu','Rest and Tylenol',112,390),(5302,'2017-03-09','Sinus Infection','Antibiotics',118,336),(5303,'2017-03-09','Back pain','Tylenol',118,356),(5305,'2017-03-09','Sprained Ankle','Rest and Ice',118,396),(5306,'2017-03-09','Flu','Rest and Tylenol',102,320),(5308,'2017-03-09','Sinus Infection','Antibiotics',102,360),(5309,'2017-03-09','Back pain','Tylenol',102,380),(5311,'2017-03-09','Sprained Ankle','Rest and Ice',108,306),(5312,'2017-03-09','Flu','Rest and Tylenol',108,326),(5314,'2017-03-09','Sinus Infection','Antibiotics',108,366),(5315,'2017-03-09','Back pain','Tylenol',108,386),(5317,'2017-03-09','Sprained Ankle','Rest and Ice',114,332),(5318,'2017-03-09','Flu','Rest and Tylenol',114,352),(5320,'2017-03-09','Sinus Infection','Antibiotics',114,392),(5321,'2017-03-09','Back pain','Tylenol',119,317),(5323,'2017-03-09','Sprained Ankle','Rest and Ice',119,357),(5324,'2017-03-09','Flu','Rest and Tylenol',119,377),(5326,'2017-03-09','Sinus Infection','Antibiotics',109,307),(5327,'2017-03-09','Back pain','Tylenol',109,327),(5329,'2017-03-09','Sprained Ankle','Rest and Ice',109,367),(5330,'2017-03-09','Flu','Rest and Tylenol',109,387),(5332,'2017-03-09','Sinus Infection','Antibiotics',115,333),(5333,'2017-03-09','Back pain','Tylenol',115,353),(5335,'2017-03-09','Sprained Ankle','Rest and Ice',115,393),(5336,'2017-03-09','Flu','Rest and Tylenol',121,319),(5338,'2017-03-09','Sinus Infection','Antibiotics',121,359),(5339,'2017-03-09','Back pain','Tylenol',121,379),(5341,'2017-03-09','Sprained Ankle','Rest and Ice',104,302),(5342,'2017-03-09','Flu','Rest and Tylenol',104,322),(5344,'2017-03-09','Sinus Infection','Antibiotics',104,362),(5345,'2017-03-09','Back pain','Tylenol',104,382),(5347,'2017-03-09','Sprained Ankle','Rest and Ice',116,334),(5348,'2017-03-09','Flu','Rest and Tylenol',116,354),(5350,'2017-03-09','Sinus Infection','Antibiotics',116,394),(5351,'2017-03-09','Back pain','Tylenol',105,303),(5353,'2017-03-09','Sprained Ankle','Rest and Ice',105,343),(5354,'2017-03-09','Flu','Rest and Tylenol',105,363),(5356,'2017-03-09','Sinus Infection','Antibiotics',111,309),(5357,'2017-03-09','Back pain','Tylenol',111,329),(5359,'2017-03-09','Sprained Ankle','Rest and Ice',111,369),(5360,'2017-03-09','Flu','Rest and Tylenol',111,389),(5362,'2017-03-10','Sinus Infection','Antibiotics',107,325),(5363,'2017-03-10','Back pain','Tylenol',107,345),(5365,'2017-03-10','Sprained Ankle','Rest and Ice',107,385),(5366,'2017-03-10','Flu','Rest and Tylenol',112,310),(5368,'2017-03-10','Sinus Infection','Antibiotics',112,350),(5369,'2017-03-10','Back pain','Tylenol',112,370),(5371,'2017-03-10','Sprained Ankle','Rest and Ice',118,316),(5372,'2017-03-10','Flu','Rest and Tylenol',118,336),(5374,'2017-03-10','Sinus Infection','Antibiotics',118,376),(5375,'2017-03-10','Back pain','Tylenol',118,396),(5377,'2017-03-10','Sprained Ankle','Rest and Ice',108,326),(5378,'2017-03-10','Flu','Rest and Tylenol',108,346),(5380,'2017-03-10','Sinus Infection','Antibiotics',108,386),(5381,'2017-03-10','Back pain','Tylenol',114,312),(5383,'2017-03-10','Sprained Ankle','Rest and Ice',114,352),(5384,'2017-03-10','Flu','Rest and Tylenol',114,372),(5386,'2017-03-10','Sinus Infection','Antibiotics',119,317),(5387,'2017-03-10','Back pain','Tylenol',119,337),(5389,'2017-03-10','Sprained Ankle','Rest and Ice',119,377),(5390,'2017-03-10','Flu','Rest and Tylenol',119,397),(5392,'2017-03-10','Sinus Infection','Antibiotics',103,321),(5393,'2017-03-10','Back pain','Tylenol',103,341),(5395,'2017-03-10','Sprained Ankle','Rest and Ice',103,381),(5396,'2017-03-10','Flu','Rest and Tylenol',115,313),(5398,'2017-03-10','Sinus Infection','Antibiotics',115,353),(5399,'2017-03-10','Back pain','Tylenol',115,373),(5401,'2017-03-10','Sprained Ankle','Rest and Ice',121,319),(5402,'2017-03-10','Flu','Rest and Tylenol',121,339),(5404,'2017-03-10','Sinus Infection','Antibiotics',121,379),(5405,'2017-03-10','Back pain','Tylenol',121,399),(5407,'2017-03-10','Sprained Ankle','Rest and Ice',104,322),(5408,'2017-03-10','Flu','Rest and Tylenol',104,342),(5410,'2017-03-10','Sinus Infection','Antibiotics',104,382),(5411,'2017-03-10','Back pain','Tylenol',110,308),(5413,'2017-03-10','Sprained Ankle','Rest and Ice',110,348),(5414,'2017-03-10','Flu','Rest and Tylenol',110,368),(5416,'2017-03-10','Sinus Infection','Antibiotics',105,303),(5417,'2017-03-10','Back pain','Tylenol',105,323),(5419,'2017-03-10','Sprained Ankle','Rest and Ice',105,363),(5420,'2017-03-10','Flu','Rest and Tylenol',105,383),(5422,'2017-03-10','Sinus Infection','Antibiotics',111,329),(5423,'2017-03-10','Back pain','Tylenol',111,349),(5425,'2017-03-10','Sprained Ankle','Rest and Ice',111,389),(5426,'2017-03-10','Flu','Rest and Tylenol',117,315),(5428,'2017-03-10','Sinus Infection','Antibiotics',117,355),(5429,'2017-03-10','Back pain','Tylenol',117,375),(5431,'2017-03-11','Sprained Ankle','Rest and Ice',106,304),(5432,'2017-03-11','Flu','Rest and Tylenol',106,324),(5434,'2017-03-11','Sinus Infection','Antibiotics',106,364),(5435,'2017-03-11','Back pain','Tylenol',106,384),(5437,'2017-03-11','Sprained Ankle','Rest and Ice',118,336),(5438,'2017-03-11','Flu','Rest and Tylenol',118,356),(5440,'2017-03-11','Sinus Infection','Antibiotics',118,396),(5441,'2017-03-11','Back pain','Tylenol',107,305),(5443,'2017-03-11','Sprained Ankle','Rest and Ice',107,345),(5444,'2017-03-11','Flu','Rest and Tylenol',107,365),(5446,'2017-03-11','Sinus Infection','Antibiotics',108,306),(5447,'2017-03-11','Back pain','Tylenol',108,326),(5449,'2017-03-11','Sprained Ankle','Rest and Ice',108,366),(5450,'2017-03-11','Flu','Rest and Tylenol',108,386),(5452,'2017-03-11','Sinus Infection','Antibiotics',113,331),(5453,'2017-03-11','Back pain','Tylenol',113,351),(5455,'2017-03-11','Sprained Ankle','Rest and Ice',113,391),(5456,'2017-03-11','Flu','Rest and Tylenol',103,301),(5458,'2017-03-11','Sinus Infection','Antibiotics',103,341),(5459,'2017-03-11','Back pain','Tylenol',103,361),(5461,'2017-03-11','Sprained Ankle','Rest and Ice',114,312),(5462,'2017-03-11','Flu','Rest and Tylenol',114,332),(5464,'2017-03-11','Sinus Infection','Antibiotics',114,372),(5465,'2017-03-11','Back pain','Tylenol',114,392),(5467,'2017-03-11','Sprained Ankle','Rest and Ice',115,333),(5468,'2017-03-11','Flu','Rest and Tylenol',115,353),(5470,'2017-03-11','Sinus Infection','Antibiotics',115,393),(5471,'2017-03-11','Back pain','Tylenol',120,318),(5473,'2017-03-11','Sprained Ankle','Rest and Ice',120,358),(5474,'2017-03-11','Flu','Rest and Tylenol',120,378),(5476,'2017-03-11','Sinus Infection','Antibiotics',104,302),(5477,'2017-03-11','Back pain','Tylenol',104,322),(5479,'2017-03-11','Sprained Ankle','Rest and Ice',104,362),(5480,'2017-03-11','Flu','Rest and Tylenol',104,382),(5482,'2017-03-11','Sinus Infection','Antibiotics',110,328),(5483,'2017-03-11','Back pain','Tylenol',110,348),(5485,'2017-03-11','Sprained Ankle','Rest and Ice',110,388),(5486,'2017-03-11','Flu','Rest and Tylenol',121,319),(5488,'2017-03-11','Sinus Infection','Antibiotics',121,359),(5489,'2017-03-11','Back pain','Tylenol',121,379),(5491,'2017-03-11','Sprained Ankle','Rest and Ice',111,309),(5492,'2017-03-11','Flu','Rest and Tylenol',111,329),(5494,'2017-03-11','Sinus Infection','Antibiotics',111,369),(5495,'2017-03-11','Back pain','Tylenol',111,389),(5497,'2017-03-11','Sprained Ankle','Rest and Ice',117,335),(5498,'2017-03-11','Flu','Rest and Tylenol',117,355),(5500,'2017-03-11','Sinus Infection','Antibiotics',117,395),(5501,'2017-04-30','Common Cold','Rest and Tylenol',121,399),(5503,'2017-05-01','Common Cold','Rest and Tylenol',121,399),(5505,'2017-04-19','Flu','Tamiflu',121,399),(5506,'2017-04-30','Herpes','Rest',118,316),(5507,'2017-04-30','Brain Tumor','Surgery',118,316),(5508,'2017-04-30','Brain Tumor','Surgery',118,316),(5511,'2017-04-21','Herpes','Rest',118,316),(5512,'2017-04-13','Dengue Fever','Rest and Aspirin',115,333),(5513,'2017-04-13','H Syndrom','Chemotherapy',121,319),(5517,'2017-04-16',NULL,NULL,105,383),(5518,'2017-04-16',NULL,NULL,105,383),(5519,'2017-04-16',NULL,NULL,105,383),(5520,'2017-04-16',NULL,NULL,105,383),(5521,'2017-04-16',NULL,NULL,105,383),(5522,'2017-04-16',NULL,NULL,105,383),(5523,'2017-04-16',NULL,NULL,105,383),(5524,'2017-04-16',NULL,NULL,105,383),(5525,'2017-04-16',NULL,'',105,383),(5526,'2017-04-16',NULL,'n',105,383),(5527,'2017-04-16',NULL,'',105,383),(5528,'2017-04-16',NULL,'',105,383),(5529,'2017-04-16',NULL,'',105,383),(5530,'2017-04-16',NULL,NULL,105,383),(5531,'2017-04-16',NULL,NULL,105,383),(5532,'2017-04-16',NULL,NULL,105,383),(5533,'2017-04-16',NULL,NULL,105,383),(5534,'2017-04-16',NULL,'1',105,383),(5535,'2017-04-16',NULL,'1',105,383),(5536,'2017-04-16','1','1',105,383),(5537,'2017-04-16','1','1',105,383);
/*!40000 ALTER TABLE `DIAGNOSIS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`apshaju`@`%`*/ /*!50003 TRIGGER `CLINIC`.`DIAGNOSIS_BEFORE_INSERT` BEFORE INSERT ON `DIAGNOSIS` FOR EACH ROW
BEGIN
    if (New.DateOfDiagnosis < CURDATE()) then
 		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'The Appointment is in the past.';
	end if;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `Address` varchar(90) DEFAULT NULL,
  `DoctorID` int(9) NOT NULL AUTO_INCREMENT,
  `Specialty` enum('General Practitioner','Surgeon','Cardiologist','Oncologist') NOT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `DoctorExists` tinyint(1) DEFAULT '1',
  `ApptsThisMonth` int(9) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `doctor_ibfk_1` (`username`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=900009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DOCTOR`
--

LOCK TABLES `DOCTOR` WRITE;
/*!40000 ALTER TABLE `DOCTOR` DISABLE KEYS */;
INSERT INTO `DOCTOR` VALUES ('Daren','A','Teixeira','12345 Green St, Houston, TX, 12345',102,'General Practitioner','800-144-2335','dteixeira','uselessaccountalt@yahoo.com',1,10),('Dan','A','Stamper','12345 Green St, Houston, TX, 12345',103,'Oncologist','800-144-2336','dstamper','uselessaccountalt@yahoo.com',1,34),('Dixie','D','Bolander','12345 Green St, Houston, TX, 12345',104,'General Practitioner','800-144-2337','dbolander','uselessaccountalt@yahoo.com',1,10),('Karissa','D','Kitchin','12345 Green St, Houston, TX, 12345',105,'Oncologist','800-144-2338','kkitchin','uselessaccountalt@yahoo.com',1,11),('Marcia','D','Mease','12345 Green St, Houston, TX, 12345',106,'General Practitioner','800-144-2339','mmease','uselessaccountalt@yahoo.com',1,11),('Christina','D','Kozel','12345 Green St, Houston, TX, 12345',107,'Oncologist','800-144-2340','ckozel','uselessaccountalt@yahoo.com',1,10),('Chester','A','Bjork','12345 Green St, Houston, TX, 12345',108,'General Practitioner','800-144-2341','cbjork','uselessaccountalt@yahoo.com',1,11),('Evelynn','A','Franson','12345 Green St, Houston, TX, 12345',109,'Oncologist','800-144-2342','efranson','uselessaccountalt@yahoo.com',1,10),('Jeffrey','A','Quellette','12345 Green St, Houston, TX, 12345',110,'General Practitioner','800-144-2343','jquellette','uselessaccountalt@yahoo.com',1,10),('Candis','A','Schnabel','12345 Green St, Houston, TX, 12345',111,'Surgeon','800-144-2344','cschnabel','uselessaccountalt@yahoo.com',1,10),('Brinda','D','Kovats','12345 Scott St, Houston, TX, 12345',112,'General Practitioner','800-144-2345','bkovats','uselessaccountalt@yahoo.com',1,15),('Abbey','A','Lancon','12345 Scott St, Houston, TX, 12345',113,'Surgeon','800-144-2346','alancon','uselessaccountalt@yahoo.com',1,16),('Jasmine','D','Herbig','12345 Scott St, Houston, TX, 12345',114,'General Practitioner','800-144-2347','jherbig','uselessaccountalt@yahoo.com',1,15),('Gerard','D','Chiodo','12345 Scott St, Houston, TX, 12345',115,'Surgeon','800-144-2348','gchiodo','uselessaccountalt@yahoo.com',1,15),('Elliott','W','Tester','12345 Scott St, Houston, TX, 12345',116,'General Practitioner','800-144-2349','etester','uselessaccountalt@yahoo.com',1,20),('Nu','W','Yeomans','12345 Scott St, Houston, TX, 12345',117,'Cardiologist','800-144-2350','nyeomans','uselessaccountalt@yahoo.com',1,15),('Veronika','D','Hoyer','12345 Hall St, Houston, TX, 12345',118,'General Practitioner','800-144-2351','vhoyer','uselessaccountalt@yahoo.com',1,18),('Bunny','A','Mellish','12345 Hall St, Houston, TX, 12345',119,'Cardiologist','800-144-2352','bmellish','uselessaccountalt@yahoo.com',1,15),('Lizzette','D','Carns','12345 Hall St, Houston, TX, 12345',120,'General Practitioner','800-144-2353','lcarns','uselessaccountalt@yahoo.com',1,15),('Carli','A','Whetstone','12345 Hall St, Houston, TX, 12345',121,'Cardiologist','800-144-2354','cwhetstone','uselessaccountalt@yahoo.com',1,36),('Harold','G','Minor','2233 Great St, Houston, TX 33433',900008,'Oncologist','444-444-4523','hminor','uselessaccountalt@yahoo.com',1,NULL);
/*!40000 ALTER TABLE `DOCTOR` ENABLE KEYS */;
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
  `Address` varchar(90) DEFAULT NULL,
  `PatientID` int(9) NOT NULL AUTO_INCREMENT,
  `SSN` int(9) DEFAULT NULL,
  `DateOfBirth` date NOT NULL,
  `HealthInsurance` varchar(60) DEFAULT NULL,
  `Allergies` varchar(60) DEFAULT NULL,
  `Conditions` varchar(60) DEFAULT NULL,
  `Gender` enum('M','F') DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `AssignedDoctor` int(9) DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `SSN` (`SSN`),
  KEY `patient_ibfk_2` (`username`),
  KEY `patient_ibfk_7_idx` (`AssignedDoctor`),
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`username`) REFERENCES `login` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `patient_ibfk_7` FOREIGN KEY (`AssignedDoctor`) REFERENCES `DOCTOR` (`DoctorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATIENT`
--

LOCK TABLES `PATIENT` WRITE;
/*!40000 ALTER TABLE `PATIENT` DISABLE KEYS */;
INSERT INTO `PATIENT` VALUES ('Krystyna','T','Haglund','55532 Northfield St, Houston, TX, 23122',301,500000033,'1931-01-02','Cigna Health','Cats','Heart Disease','F','234-45-1007','khaglund','uselessaccountalt@yahoo.com',103),('Lavona','M','Hassen','34566 Guardian St, Comal, TX, 23425',302,500000066,'1932-02-02','Cigna Health','None','Diabetes','M','234-45-1014','lhassen','uselessaccountalt@yahoo.com',104),('Felicitas','G','Poythress','13332 Holman Ave, Richfield, TX, 23423',303,500000099,'1933-03-02','Cigna Health','Tylenol','None','F','234-45-1021','fpoythress','uselessaccountalt@yahoo.com',105),('Keena','T','Lawley','55532 Northfield St, Houston, TX, 23122',304,500000132,'1934-04-02','Cigna Health','Cats','Heart Disease','M','234-45-1028','klawley','uselessaccountalt@yahoo.com',106),('Kenna','M','Ballentine','34566 Guardian St, Comal, TX, 23425',305,500000165,'1935-05-02','Cigna Health','None','Diabetes','F','234-45-1035','kballentine','uselessaccountalt@yahoo.com',107),('Kasandra','G','Shelly','13332 Holman Ave, Richfield, TX, 23423',306,500000198,'1936-06-02','Cigna Health','Tylenol','None','M','234-45-1042','kshelly','uselessaccountalt@yahoo.com',108),('Ossie','T','Gowan','55532 Northfield St, Houston, TX, 23122',307,500000231,'1937-07-02','Cigna Health','Cats','Heart Disease','F','234-45-1049','ogowan','uselessaccountalt@yahoo.com',109),('Linnea','M','Czech','34566 Guardian St, Comal, TX, 23425',308,500000264,'1938-08-02','Cigna Health','None','Diabetes','M','234-45-1056','lczech','uselessaccountalt@yahoo.com',110),('Alica','G','Hollen','13332 Holman Ave, Richfield, TX, 23423',309,500000297,'1939-09-02','Cigna Health','Tylenol','None','F','234-45-1063','ahollen','uselessaccountalt@yahoo.com',111),('Nila','T','Leisinger','55532 Northfield St, Houston, TX, 23122',310,500000330,'1940-10-10','Cigna Health','Cats','Heart Disease','M','234-45-1070','nleisinger','uselessaccountalt@yahoo.com',112),('Renay','M','Rose','34566 Guardian St, Comal, TX, 23425',311,500000363,'1941-11-11','Cigna Health','None','Diabetes','F','234-45-1077','rrose','uselessaccountalt@yahoo.com',113),('Romeo','G','Frates','13332 Holman Ave, Richfield, TX, 23423',312,500000396,'1942-12-12','Cigna Health','Tylenol','None','M','234-45-1084','rfrates','uselessaccountalt@yahoo.com',114),('Roxana','T','Naber','55532 Northfield St, Houston, TX, 23122',313,500000429,'1943-01-13','Cigna Health','Cats','Heart Disease','F','234-45-1091','rnaber','uselessaccountalt@yahoo.com',115),('Thea','M','Dollar','34566 Guardian St, Comal, TX, 23425',314,500000462,'1944-01-14','Cigna Health','None','Diabetes','M','234-45-1098','tdollar','uselessaccountalt@yahoo.com',116),('Joya','G','Stinson','13332 Holman Ave, Richfield, TX, 23423',315,500000495,'1945-02-15','Cigna Health','Tylenol','None','F','234-45-1105','jstinson','uselessaccountalt@yahoo.com',117),('Damon','T','Ballard','55532 Northfield St, Houston, TX, 23122',316,500000528,'1946-03-16','Cigna Health','Cats','Heart Disease','M','234-45-1112','dballard','uselessaccountalt@yahoo.com',118),('Veronique','M','Hammer','34566 Guardian St, Comal, TX, 23425',317,500000561,'1947-04-17','Cigna Health','None','Diabetes','F','234-45-1119','vhammer','uselessaccountalt@yahoo.com',119),('Gene','G','Heber','13332 Holman Ave, Richfield, TX, 23423',318,500000594,'1948-05-18','Cigna Health','Tylenol','None','M','234-45-1126','gheber','uselessaccountalt@yahoo.com',120),('Amira','T','Quevedo','55532 Northfield St, Houston, TX, 23122',319,500000627,'1949-06-19','Cigna Health','Cats','Heart Disease','F','234-45-1133','aquevedo','uselessaccountalt@yahoo.com',121),('Joseph','M','Britten','34566 Guardian St, Comal, TX, 23425',320,500000660,'1950-07-20','Cigna Health','None','Diabetes','M','234-45-1140','jbritten','uselessaccountalt@yahoo.com',102),('Brendon','G','Baisden','13332 Holman Ave, Richfield, TX, 23423',321,500000693,'1951-08-21','Cigna Health','Tylenol','None','F','234-45-1147','bbaisden','uselessaccountalt@yahoo.com',103),('Zoe','T','Oberg','55532 Northfield St, Houston, TX, 23122',322,500000726,'1952-09-22','Cigna Health','Cats','Heart Disease','M','234-45-1154','zoberg','uselessaccountalt@yahoo.com',104),('pf','M','lf','34566 Guardian St, Comal, TX, 23425',323,500000759,'1953-10-23','Cigna Health','None','Diabetes','F','234-45-1161','ckinoshita','uselessaccountalt@yahoo.com',105),('Edward','G','Witt','13332 Holman Ave, Richfield, TX, 23423',324,500000792,'1954-11-24','Cigna Health','Tylenol','None','M','234-45-1168','ewitt','uselessaccountalt@yahoo.com',106),('Chang','T','Gildersleeve','55532 Northfield St, Houston, TX, 23122',325,500000825,'1955-12-25','Cigna Health','Cats','Heart Disease','F','234-45-1175','cgildersleeve','uselessaccountalt@yahoo.com',107),('Cassaundra','M','Baur','34566 Guardian St, Comal, TX, 23425',326,500000858,'1956-01-26','Cigna Health','None','Diabetes','M','234-45-1182','cbaur','uselessaccountalt@yahoo.com',108),('Dorla','G','Osorio','13332 Holman Ave, Richfield, TX, 23423',327,500000891,'1957-01-02','Cigna Health','Tylenol','None','F','234-45-1189','dosorio','uselessaccountalt@yahoo.com',109),('Trula','T','Fugate','55532 Northfield St, Houston, TX, 23122',328,500000924,'1958-02-02','Cigna Health','Cats','Heart Disease','M','234-45-1196','tfugate','uselessaccountalt@yahoo.com',110),('Weston','M','Pollard','34566 Guardian St, Comal, TX, 23425',329,500000957,'1959-03-02','Cigna Health','None','Diabetes','F','234-45-1203','wpollard','uselessaccountalt@yahoo.com',111),('Huong','G','Bennet','13332 Holman Ave, Richfield, TX, 23423',330,500000990,'1960-04-02','Cigna Health','Tylenol','None','M','234-45-1210','hbennet','uselessaccountalt@yahoo.com',112),('Yukiko','T','Bold','55532 Northfield St, Houston, TX, 23122',331,500001023,'1961-05-02','Cigna Health','Cats','Heart Disease','F','234-45-1217','ybold','uselessaccountalt@yahoo.com',113),('Manda','M','Mccaster','34566 Guardian St, Comal, TX, 23425',332,500001056,'1962-06-02','Cigna Health','None','Diabetes','M','234-45-1224','mmccaster','uselessaccountalt@yahoo.com',114),('Sharyl','G','Blakey','13332 Holman Ave, Richfield, TX, 23423',333,500001089,'1963-07-02','Cigna Health','Tylenol','None','F','234-45-1231','sblakey','uselessaccountalt@yahoo.com',115),('Debora','T','Leto','55532 Northfield St, Houston, TX, 23122',334,500001122,'1964-08-02','Cigna Health','Cats','Heart Disease','M','234-45-1238','dleto','uselessaccountalt@yahoo.com',116),('Jetta','M','Robichaux','34566 Guardian St, Comal, TX, 23425',335,500001155,'1965-09-02','Cigna Health','None','Diabetes','F','234-45-1245','jrobichaux','uselessaccountalt@yahoo.com',117),('Madeleine','G','Laws','13332 Holman Ave, Richfield, TX, 23423',336,500001188,'1966-10-02','Cigna Health','Tylenol','None','M','234-45-1252','mlaws','uselessaccountalt@yahoo.com',118),('Micah','T','Schecter','55532 Northfield St, Houston, TX, 23122',337,500001221,'1967-11-10','Cigna Health','Cats','Heart Disease','F','234-45-1259','mschecter','uselessaccountalt@yahoo.com',119),('Trudie','M','Huss','34566 Guardian St, Comal, TX, 23425',338,500001254,'1968-12-11','Cigna Health','None','Diabetes','M','234-45-1266','thuss','uselessaccountalt@yahoo.com',120),('Joie','G','Marchan','13332 Holman Ave, Richfield, TX, 23423',339,500001287,'1969-01-12','Cigna Health','Tylenol','None','F','234-45-1273','jmarchan','uselessaccountalt@yahoo.com',121),('Misha','T','Baden','55532 Northfield St, Houston, TX, 23122',340,500001320,'1970-01-13','Cigna Health','Cats','Heart Disease','M','234-45-1280','mbaden','uselessaccountalt@yahoo.com',102),('Doretta','M','Bott','34566 Guardian St, Comal, TX, 23425',341,500001353,'1971-02-14','Cigna Health','None','Diabetes','F','234-45-1287','dbott','uselessaccountalt@yahoo.com',103),('Numbers','G','Gwaltney','13332 Holman Ave, Richfield, TX, 23423',342,500001386,'1972-03-15','Cigna Health','Tylenol','None','M','234-45-1294','ngwaltney','uselessaccountalt@yahoo.com',104),('Elfriede','T','Hodder','55532 Northfield St, Houston, TX, 23122',343,500001419,'1973-04-16','Cigna Health','Cats','Heart Disease','F','234-45-1301','ehodder','uselessaccountalt@yahoo.com',105),('Teisha','M','Bohannon','34566 Guardian St, Comal, TX, 23425',344,500001452,'1974-05-17','Cigna Health','None','Diabetes','M','234-45-1308','tbohannon','uselessaccountalt@yahoo.com',106),('Gino','G','Lobdell','13332 Holman Ave, Richfield, TX, 23423',345,500001485,'1975-06-18','Cigna Health','Tylenol','None','F','234-45-1315','globdell','uselessaccountalt@yahoo.com',107),('Myrle','T','Henery','55532 Northfield St, Houston, TX, 23122',346,500001518,'1976-07-19','Cigna Health','Cats','Heart Disease','M','234-45-1322','mhenery','uselessaccountalt@yahoo.com',108),('Justa','M','Popovic','34566 Guardian St, Comal, TX, 23425',347,500001551,'1977-08-20','Cigna Health','None','Diabetes','F','234-45-1329','jpopovic','uselessaccountalt@yahoo.com',109),('Warren','G','Milot','13332 Holman Ave, Richfield, TX, 23423',348,500001584,'1978-09-21','Cigna Health','Tylenol','None','M','234-45-1336','wmilot','uselessaccountalt@yahoo.com',110),('Yvone','T','Zygmont','55532 Northfield St, Houston, TX, 23122',349,500001617,'1979-10-22','Cigna Health','Cats','Heart Disease','F','234-45-1343','yzygmont','uselessaccountalt@yahoo.com',111),('Marcy','M','Brewington','34566 Guardian St, Comal, TX, 23425',350,500001650,'1980-11-23','Cigna Health','None','Diabetes','M','234-45-1350','mbrewington','uselessaccountalt@yahoo.com',112),('Martin','G','Medrano','13332 Holman Ave, Richfield, TX, 23423',351,500001683,'1981-12-24','Cigna Health','Tylenol','None','F','234-45-1357','mmedrano','uselessaccountalt@yahoo.com',113),('Layne','T','Leishman','55532 Northfield St, Houston, TX, 23122',352,500001716,'1982-01-25','Cigna Health','Cats','Heart Disease','M','234-45-1364','lleishman','uselessaccountalt@yahoo.com',114),('Rigoberto','M','Sparkman','34566 Guardian St, Comal, TX, 23425',353,500001749,'1983-01-26','Cigna Health','None','Diabetes','F','234-45-1371','rsparkman','uselessaccountalt@yahoo.com',115),('Penny','G','Spink','13332 Holman Ave, Richfield, TX, 23423',354,500001782,'1984-02-02','Cigna Health','Tylenol','None','M','234-45-1378','pspink','uselessaccountalt@yahoo.com',116),('Keshia','T','Vandyke','55532 Northfield St, Houston, TX, 23122',355,500001815,'1985-03-02','Cigna Health','Cats','Heart Disease','F','234-45-1385','kvandyke','uselessaccountalt@yahoo.com',117),('Tamala','M','Tourville','34566 Guardian St, Comal, TX, 23425',356,500001848,'1986-04-02','Cigna Health','None','Diabetes','M','234-45-1392','ttourville','uselessaccountalt@yahoo.com',118),('Marion','G','Ellman','13332 Holman Ave, Richfield, TX, 23423',357,500001881,'1987-05-02','Cigna Health','Tylenol','None','F','234-45-1399','mellman','uselessaccountalt@yahoo.com',119),('Lorene','T','Simeon','55532 Northfield St, Houston, TX, 23122',358,500001914,'1988-06-02','Cigna Health','Cats','Heart Disease','M','234-45-1406','lsimeon','uselessaccountalt@yahoo.com',120),('Margurite','M','Casterline','34566 Guardian St, Comal, TX, 23425',359,500001947,'1989-07-02','Cigna Health','None','Diabetes','F','234-45-1413','mcasterline','uselessaccountalt@yahoo.com',121),('Marshall','G','Tannehill','13332 Holman Ave, Richfield, TX, 23423',360,500001980,'1990-08-02','Cigna Health','Tylenol','None','M','234-45-1420','mtannehill','uselessaccountalt@yahoo.com',102),('Titus','T','Bahr','55532 Northfield St, Houston, TX, 23122',361,500002013,'1991-09-02','Cigna Health','Cats','Heart Disease','F','234-45-1427','tbahr','uselessaccountalt@yahoo.com',103),('Gudrun','M','Walts','34566 Guardian St, Comal, TX, 23425',362,500002046,'1992-10-02','Cigna Health','None','Diabetes','M','234-45-1434','gwalts','uselessaccountalt@yahoo.com',104),('So','G','Jungers','13332 Holman Ave, Richfield, TX, 23423',363,500002079,'1993-11-02','Cigna Health','Tylenol','None','F','234-45-1441','sjungers','uselessaccountalt@yahoo.com',105),('Wesley','T','Quinto','55532 Northfield St, Houston, TX, 23122',364,500002112,'1994-12-10','Cigna Health','Cats','Heart Disease','M','234-45-1448','wquinto','uselessaccountalt@yahoo.com',106),('Linnie','M','Chaidez','34566 Guardian St, Comal, TX, 23425',365,500002145,'1995-01-11','Cigna Health','None','Diabetes','F','234-45-1455','lchaidez','uselessaccountalt@yahoo.com',107),('Allegra','G','Pittmon','13332 Holman Ave, Richfield, TX, 23423',366,500002178,'1996-01-12','Cigna Health','Tylenol','None','M','234-45-1462','apittmon','uselessaccountalt@yahoo.com',108),('Candida','T','Piggott','55532 Northfield St, Houston, TX, 23122',367,500002211,'1997-02-13','Cigna Health','Cats','Heart Disease','F','234-45-1469','cpiggott','uselessaccountalt@yahoo.com',109),('Arlyne','M','Collings','34566 Guardian St, Comal, TX, 23425',368,500002244,'1998-03-14','Cigna Health','None','Diabetes','M','234-45-1476','acollings','uselessaccountalt@yahoo.com',110),('Zoe','G','Creasey','13332 Holman Ave, Richfield, TX, 23423',369,500002277,'1999-04-15','Cigna Health','Tylenol','None','F','234-45-1483','zcreasey','uselessaccountalt@yahoo.com',111),('Sarina','T','Henn','55532 Northfield St, Houston, TX, 23122',370,500002310,'1930-05-16','Cigna Health','Cats','Heart Disease','M','234-45-1490','shenn','uselessaccountalt@yahoo.com',112),('Zachariah','M','Poulter','34566 Guardian St, Comal, TX, 23425',371,500002343,'1931-06-17','Cigna Health','None','Diabetes','F','234-45-1497','zpoulter','uselessaccountalt@yahoo.com',113),('Dalene','G','Glenn','13332 Holman Ave, Richfield, TX, 23423',372,500002376,'1932-07-18','Cigna Health','Tylenol','None','M','234-45-1504','dglenn','uselessaccountalt@yahoo.com',114),('Clair','T','Casale','55532 Northfield St, Houston, TX, 23122',373,500002409,'1933-08-19','Cigna Health','Cats','Heart Disease','F','234-45-1511','ccasale','uselessaccountalt@yahoo.com',115),('Josie','M','Braud','34566 Guardian St, Comal, TX, 23425',374,500002442,'1934-09-20','Cigna Health','None','Diabetes','M','234-45-1518','jbraud','uselessaccountalt@yahoo.com',116),('Shonna','G','Feth','13332 Holman Ave, Richfield, TX, 23423',375,500002475,'1935-10-21','Cigna Health','Tylenol','None','F','234-45-1525','sfeth','uselessaccountalt@yahoo.com',117),('Katina','T','Silas','55532 Northfield St, Houston, TX, 23122',376,500002508,'1936-11-22','Cigna Health','Cats','Heart Disease','M','234-45-1532','ksilas','uselessaccountalt@yahoo.com',118),('Louann','M','Lembo','34566 Guardian St, Comal, TX, 23425',377,500002541,'1937-12-23','Cigna Health','None','Diabetes','F','234-45-1539','llembo','uselessaccountalt@yahoo.com',119),('Aleta','G','Ballweg','13332 Holman Ave, Richfield, TX, 23423',378,500002574,'1938-01-24','Cigna Health','Tylenol','None','M','234-45-1546','aballweg','uselessaccountalt@yahoo.com',120),('Randee','T','Hiney','55532 Northfield St, Houston, TX, 23122',379,500002607,'1939-01-25','Cigna Health','Cats','Heart Disease','F','234-45-1553','rhiney','uselessaccountalt@yahoo.com',121),('Estelle','M','Kinghorn','34566 Guardian St, Comal, TX, 23425',380,500002640,'1940-02-26','Cigna Health','None','Diabetes','M','234-45-1560','ekinghorn','uselessaccountalt@yahoo.com',102),('Lillie','G','Ferranti','13332 Holman Ave, Richfield, TX, 23423',381,500002673,'1941-03-02','Cigna Health','Tylenol','None','F','234-45-1567','lferranti','uselessaccountalt@yahoo.com',103),('Annie','T','Pasternak','55532 Northfield St, Houston, TX, 23122',382,500002706,'1942-04-02','Cigna Health','Cats','Heart Disease','M','234-45-1574','apasternak','uselessaccountalt@yahoo.com',104),('Keven','M','Burrows','34566 Guardian St, Comal, TX, 23425',383,500002739,'1943-05-02','Cigna Health','None','Diabetes','F','234-45-1581','kburrows','uselessaccountalt@yahoo.com',105),('Aleshia','G','Lammert','13332 Holman Ave, Richfield, TX, 23423',384,500002772,'1944-06-02','Cigna Health','Tylenol','None','M','234-45-1588','alammert','uselessaccountalt@yahoo.com',106),('Branda','T','Turcotte','55532 Northfield St, Houston, TX, 23122',385,500002805,'1945-07-02','Cigna Health','Cats','Heart Disease','F','234-45-1595','bturcotte','uselessaccountalt@yahoo.com',107),('Latia','M','Shute','34566 Guardian St, Comal, TX, 23425',386,500002838,'1946-08-02','Cigna Health','None','Diabetes','M','234-45-1602','lshute','uselessaccountalt@yahoo.com',108),('Donnell','G','Cushenberry','13332 Holman Ave, Richfield, TX, 23423',387,500002871,'1947-09-02','Cigna Health','Tylenol','None','F','234-45-1609','dcushenberry','uselessaccountalt@yahoo.com',109),('Jonelle','T','Abrahamson','55532 Northfield St, Houston, TX, 23122',388,500002904,'1948-10-02','Cigna Health','Cats','Heart Disease','M','234-45-1616','jabrahamson','uselessaccountalt@yahoo.com',110),('Andree','M','Penix','34566 Guardian St, Comal, TX, 23425',389,500002937,'1949-11-02','Cigna Health','None','Diabetes','F','234-45-1623','apenix','uselessaccountalt@yahoo.com',111),('Ta','G','Jacox','13332 Holman Ave, Richfield, TX, 23423',390,500002970,'1950-12-02','Cigna Health','Tylenol','None','M','234-45-1630','tjacox','uselessaccountalt@yahoo.com',112),('Leatha','T','Gorski','55532 Northfield St, Houston, TX, 23122',391,500003003,'1951-01-10','Cigna Health','Cats','Heart Disease','F','234-45-1637','lgorski','uselessaccountalt@yahoo.com',113),('Min','M','Landa','34566 Guardian St, Comal, TX, 23425',392,500003036,'1952-01-11','Cigna Health','None','Diabetes','M','234-45-1644','mlanda','uselessaccountalt@yahoo.com',114),('Ivana','G','Margolin','13332 Holman Ave, Richfield, TX, 23423',393,500003069,'1953-02-12','Cigna Health','Tylenol','None','F','234-45-1651','imargolin','uselessaccountalt@yahoo.com',115),('Toya','T','Senn','55532 Northfield St, Houston, TX, 23122',394,500003102,'1954-03-13','Cigna Health','Cats','Heart Disease','M','234-45-1658','tsenn','uselessaccountalt@yahoo.com',116),('Shira','M','Siddall','34566 Guardian St, Comal, TX, 23425',395,500003135,'1955-04-14','Cigna Health','None','Diabetes','F','234-45-1665','ssiddall','uselessaccountalt@yahoo.com',117),('Nicola','G','Owen','13332 Holman Ave, Richfield, TX, 23423',396,500003168,'1956-05-15','Cigna Health','Tylenol','None','M','234-45-1672','nowen','uselessaccountalt@yahoo.com',118),('Dominique','T','Cavitt','55532 Northfield St, Houston, TX, 23122',397,500003201,'1957-06-16','Cigna Health','Cats','Heart Disease','F','234-45-1679','dcavitt','uselessaccountalt@yahoo.com',119),('Thad','M','Navarra','34566 Guardian St, Comal, TX, 23425',398,500003234,'1958-07-17','Cigna Health','None','Diabetes','M','234-45-1686','tnavarra','uselessaccountalt@yahoo.com',120),('Jeremy','G','Josephson','13332 Holman Ave, Richfield, TX, 23423',399,500003267,'1959-08-18','Cigna Health','Tylenol','None','F','234-45-1693','jjosephson','uselessaccountalt@yahoo.com',121),('Marketta','T','Depalma','55532 Northfield St, Houston, TX, 23122',400,500003300,'1960-09-19','Cigna Health','Cats','Heart Disease','M','234-45-1700','mdepalma','uselessaccountalt@yahoo.com',102),('Mars','M','Mars','13413 Hadd St',401,23421423,'1901-04-05','GreatWest','Dust','HIV','M','999-000-9999','aaaaa','uselessaccountalt@yahoo.com',114),('Betty','B','Run','111 C St, Austin, TX 33342',402,-10221,'1991-01-13','Cigna','Dust Mites','Diabetes','F','444-444-4444','brun','uselessaccountalt@yahoo.com',111),('Carlos','C','Bun','1231 N St, Austin, TX 12314',403,122222222,'1997-04-20','Great West','Grass','Diabetes','M','777-777-9999','cbun','uselessaccountalt@yahoo.com',111),('Crim','M','Butler','1123 R St, Austin, TX 23232',404,333333333,'1991-04-21','Blue Cross Blue Shield','Wood','Sinusitis','F','333-333-3333','cbutler','uselessaccountalt@yahoo.com',117),('Honor','L','Jackson','555 Wick St, Alpine, TX 12341',405,555555555,'1998-03-04','Blue Cross Blue Shield','None','None','F','444-999-9595','hjackson','uselessaccountalt@yahoo.com',NULL),('Bee','D','Cook','666 D St, Sugar Land, TX 34234',406,2147483647,'1998-04-01','Great West','Pollen','None','F','555-555-5555','bcook','uselessaccountalt@yahoo.com',109),('Cross','M','Chris','1313 F St, Houston, TX 44444',407,332423,'2000-05-21','Cigna',NULL,NULL,'M','555-555-5555','cchris',NULL,NULL),('George','C','Constanza','124 H St',408,5435343,'2017-04-19',NULL,NULL,NULL,'M','555-555-5555','gcostanza',NULL,NULL),('Heman','M','Cripe','143 H St, Houston, TX 44444',409,3213212,'2000-04-04',NULL,NULL,NULL,'M','324-423-4343','hcripe',NULL,121),('Peter','M','Torre','1231 F St',410,1324134,'2000-01-01',NULL,NULL,NULL,'M','12341','ptorre',NULL,121),('firstname','m','lastname','homeaddress',411,0,'2000-01-01',NULL,NULL,NULL,'M','phone','username',NULL,121);
/*!40000 ALTER TABLE `PATIENT` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`apshaju`@`%`*/ /*!50003 TRIGGER `CLINIC`.DateofBirthCheck

BEFORE INSERT ON PATIENT

FOR EACH ROW
BEGIN
	if (NEW.DateOfBirth < '1899-11-01') then
	  SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Date of Birth for new patient before oldest living person date of birth.';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PRESCRIPTION`
--

DROP TABLE IF EXISTS `PRESCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRESCRIPTION` (
  `PrescriptionID` int(9) NOT NULL AUTO_INCREMENT,
  `DatePrescribed` date DEFAULT NULL,
  `MedicineName` varchar(30) DEFAULT NULL,
  `Strength` varchar(30) DEFAULT NULL,
  `Amount` varchar(30) DEFAULT NULL,
  `Frequency` varchar(30) DEFAULT NULL,
  `Route` varchar(30) DEFAULT NULL,
  `RefillsLeft` int(9) DEFAULT NULL,
  `PatientID` int(9) NOT NULL,
  `PrescriberID` int(9) NOT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `PatientID` (`PatientID`),
  KEY `PrescriberID` (`PrescriberID`),
  KEY `prescription_ibfk_3` (`PrescriberID`,`PatientID`),
  CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`),
  CONSTRAINT `prescription_ibfk_11` FOREIGN KEY (`PrescriberID`, `PatientID`) REFERENCES `PATIENT` (`AssignedDoctor`, `PatientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`PrescriberID`) REFERENCES `DOCTOR` (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=3531 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRESCRIPTION`
--

LOCK TABLES `PRESCRIPTION` WRITE;
/*!40000 ALTER TABLE `PRESCRIPTION` DISABLE KEYS */;
INSERT INTO `PRESCRIPTION` VALUES (3002,'2017-03-05','Penicillin','20%','20mg','2 times a day','Oral',2,325,107),(3005,'2017-03-05','Codeine','30%','30mg','1 time a day','Oral',3,385,107),(3008,'2017-03-05','Penicillin','40%','40mg','2 times a day','Oral',1,351,113),(3011,'2017-03-05','Codeine','50%','50mg','1 time a day','Oral',2,320,102),(3014,'2017-03-05','Penicillin','60%','10mg','2 times a day','Oral',3,380,102),(3017,'2017-03-05','Codeine','70%','20mg','1 time a day','Oral',1,332,114),(3020,'2017-03-05','Penicillin','80%','30mg','2 times a day','Oral',2,392,114),(3023,'2017-03-05','Codeine','90%','40mg','1 time a day','Oral',3,358,120),(3026,'2017-03-05','Penicillin','100%','50mg','2 times a day','Oral',1,301,103),(3029,'2017-03-05','Codeine','10%','10mg','1 time a day','Oral',2,361,103),(3032,'2017-03-05','Penicillin','20%','20mg','2 times a day','Oral',3,322,104),(3035,'2017-03-05','Codeine','30%','30mg','1 time a day','Oral',1,382,104),(3038,'2017-03-05','Penicillin','40%','40mg','2 times a day','Oral',2,347,109),(3041,'2017-03-05','Codeine','50%','50mg','1 time a day','Oral',3,308,110),(3044,'2017-03-05','Penicillin','60%','10mg','2 times a day','Oral',1,368,110),(3047,'2017-03-05','Codeine','70%','20mg','1 time a day','Oral',2,339,121),(3050,'2017-03-05','Penicillin','80%','30mg','2 times a day','Oral',3,399,121),(3053,'2017-03-05','Codeine','90%','40mg','1 time a day','Oral',1,349,111),(3056,'2017-03-05','Penicillin','100%','50mg','2 times a day','Oral',2,314,116),(3059,'2017-03-05','Codeine','10%','10mg','1 time a day','Oral',3,374,116),(3062,'2017-03-05','Penicillin','20%','20mg','2 times a day','Oral',1,335,117),(3065,'2017-03-05','Codeine','30%','30mg','1 time a day','Oral',2,395,117),(3068,'2017-03-05','Penicillin','40%','40mg','2 times a day','Oral',3,344,106),(3071,'2017-03-05','Codeine','50%','50mg','1 time a day','Oral',1,316,118),(3074,'2017-03-05','Penicillin','60%','10mg','2 times a day','Oral',2,376,118),(3077,'2017-03-06','Codeine','70%','20mg','1 time a day','Oral',3,325,107),(3080,'2017-03-06','Penicillin','80%','30mg','2 times a day','Oral',1,385,107),(3083,'2017-03-06','Codeine','90%','40mg','1 time a day','Oral',2,351,113),(3086,'2017-03-06','Penicillin','100%','50mg','2 times a day','Oral',3,317,119),(3089,'2017-03-06','Codeine','10%','10mg','1 time a day','Oral',1,377,119),(3092,'2017-03-06','Penicillin','20%','20mg','2 times a day','Oral',2,340,102),(3095,'2017-03-06','Codeine','30%','30mg','1 time a day','Oral',3,400,102),(3098,'2017-03-06','Penicillin','40%','40mg','2 times a day','Oral',1,352,114),(3101,'2017-03-06','Codeine','50%','50mg','1 time a day','Oral',2,318,120),(3104,'2017-03-06','Penicillin','60%','10mg','2 times a day','Oral',3,378,120),(3107,'2017-03-06','Codeine','70%','20mg','1 time a day','Oral',1,321,103),(3110,'2017-03-06','Penicillin','80%','30mg','2 times a day','Oral',2,381,103),(3113,'2017-03-06','Codeine','90%','40mg','1 time a day','Oral',3,347,109),(3116,'2017-03-06','Penicillin','100%','50mg','2 times a day','Oral',1,319,121),(3119,'2017-03-06','Codeine','10%','10mg','1 time a day','Oral',2,379,121),(3122,'2017-03-06','Penicillin','20%','20mg','2 times a day','Oral',3,323,105),(3125,'2017-03-06','Codeine','30%','30mg','1 time a day','Oral',1,383,105),(3128,'2017-03-06','Penicillin','40%','40mg','2 times a day','Oral',2,348,110),(3131,'2017-03-06','Codeine','50%','50mg','1 time a day','Oral',3,314,116),(3134,'2017-03-06','Penicillin','60%','10mg','2 times a day','Oral',1,374,116),(3137,'2017-03-06','Codeine','70%','20mg','1 time a day','Oral',2,324,106),(3140,'2017-03-06','Penicillin','80%','30mg','2 times a day','Oral',3,384,106),(3143,'2017-03-06','Codeine','90%','40mg','1 time a day','Oral',1,350,112),(3146,'2017-03-06','Penicillin','100%','50mg','2 times a day','Oral',2,315,117),(3149,'2017-03-06','Codeine','10%','10mg','1 time a day','Oral',3,375,117),(3152,'2017-03-07','Penicillin','20%','20mg','2 times a day','Oral',1,331,113),(3155,'2017-03-07','Codeine','30%','30mg','1 time a day','Oral',2,391,113),(3158,'2017-03-07','Penicillin','40%','40mg','2 times a day','Oral',3,357,119),(3161,'2017-03-07','Codeine','50%','50mg','1 time a day','Oral',1,320,102),(3164,'2017-03-07','Penicillin','60%','10mg','2 times a day','Oral',2,380,102),(3167,'2017-03-07','Codeine','70%','20mg','1 time a day','Oral',3,326,108),(3170,'2017-03-07','Penicillin','80%','30mg','2 times a day','Oral',1,386,108),(3173,'2017-03-07','Codeine','90%','40mg','1 time a day','Oral',2,358,120),(3176,'2017-03-07','Penicillin','100%','50mg','2 times a day','Oral',3,301,103),(3179,'2017-03-07','Codeine','10%','10mg','1 time a day','Oral',1,361,103),(3182,'2017-03-07','Penicillin','20%','20mg','2 times a day','Oral',2,327,109),(3185,'2017-03-07','Codeine','30%','30mg','1 time a day','Oral',3,387,109),(3188,'2017-03-07','Penicillin','40%','40mg','2 times a day','Oral',1,353,115),(3191,'2017-03-07','Codeine','50%','50mg','1 time a day','Oral',2,303,105),(3194,'2017-03-07','Penicillin','60%','10mg','2 times a day','Oral',3,363,105),(3197,'2017-03-07','Codeine','70%','20mg','1 time a day','Oral',1,328,110),(3200,'2017-03-07','Penicillin','80%','30mg','2 times a day','Oral',2,388,110),(3203,'2017-03-07','Codeine','90%','40mg','1 time a day','Oral',3,354,116),(3206,'2017-03-07','Penicillin','100%','50mg','2 times a day','Oral',1,304,106),(3209,'2017-03-07','Codeine','10%','10mg','1 time a day','Oral',2,364,106),(3212,'2017-03-07','Penicillin','20%','20mg','2 times a day','Oral',3,330,112),(3215,'2017-03-07','Codeine','30%','30mg','1 time a day','Oral',1,390,112),(3218,'2017-03-07','Penicillin','40%','40mg','2 times a day','Oral',2,355,117),(3221,'2017-03-08','Codeine','50%','50mg','1 time a day','Oral',3,304,106),(3224,'2017-03-08','Penicillin','60%','10mg','2 times a day','Oral',1,364,106),(3227,'2017-03-08','Codeine','70%','20mg','1 time a day','Oral',2,330,112),(3230,'2017-03-08','Penicillin','80%','30mg','2 times a day','Oral',3,390,112),(3233,'2017-03-08','Codeine','90%','40mg','1 time a day','Oral',1,357,119),(3236,'2017-03-08','Penicillin','100%','50mg','2 times a day','Oral',2,320,102),(3239,'2017-03-08','Codeine','10%','10mg','1 time a day','Oral',3,380,102),(3242,'2017-03-08','Penicillin','20%','20mg','2 times a day','Oral',1,326,108),(3245,'2017-03-08','Codeine','30%','30mg','1 time a day','Oral',2,386,108),(3248,'2017-03-08','Penicillin','40%','40mg','2 times a day','Oral',3,351,113),(3251,'2017-03-08','Codeine','50%','50mg','1 time a day','Oral',1,318,120),(3254,'2017-03-08','Penicillin','60%','10mg','2 times a day','Oral',2,378,120),(3257,'2017-03-08','Codeine','70%','20mg','1 time a day','Oral',3,327,109),(3260,'2017-03-08','Penicillin','80%','30mg','2 times a day','Oral',1,387,109),(3263,'2017-03-08','Codeine','90%','40mg','1 time a day','Oral',2,353,115),(3266,'2017-03-08','Penicillin','100%','50mg','2 times a day','Oral',3,302,104),(3269,'2017-03-08','Codeine','10%','10mg','1 time a day','Oral',1,362,104),(3272,'2017-03-08','Penicillin','20%','20mg','2 times a day','Oral',2,329,111),(3275,'2017-03-08','Codeine','30%','30mg','1 time a day','Oral',3,389,111),(3278,'2017-03-08','Penicillin','40%','40mg','2 times a day','Oral',1,354,116),(3281,'2017-03-08','Codeine','50%','50mg','1 time a day','Oral',2,303,105),(3284,'2017-03-08','Penicillin','60%','10mg','2 times a day','Oral',3,363,105),(3287,'2017-03-08','Codeine','70%','20mg','1 time a day','Oral',1,336,118),(3290,'2017-03-08','Penicillin','80%','30mg','2 times a day','Oral',2,396,118),(3293,'2017-03-09','Codeine','90%','40mg','1 time a day','Oral',3,345,107),(3296,'2017-03-09','Penicillin','100%','50mg','2 times a day','Oral',1,310,112),(3299,'2017-03-09','Codeine','10%','10mg','1 time a day','Oral',2,370,112),(3302,'2017-03-09','Penicillin','20%','20mg','2 times a day','Oral',3,336,118),(3305,'2017-03-09','Codeine','30%','30mg','1 time a day','Oral',1,396,118),(3308,'2017-03-09','Penicillin','40%','40mg','2 times a day','Oral',2,360,102),(3311,'2017-03-09','Codeine','50%','50mg','1 time a day','Oral',3,306,108),(3314,'2017-03-09','Penicillin','60%','10mg','2 times a day','Oral',1,366,108),(3317,'2017-03-09','Codeine','70%','20mg','1 time a day','Oral',2,332,114),(3320,'2017-03-09','Penicillin','80%','30mg','2 times a day','Oral',3,392,114),(3323,'2017-03-09','Codeine','90%','40mg','1 time a day','Oral',1,357,119),(3326,'2017-03-09','Penicillin','100%','50mg','2 times a day','Oral',2,307,109),(3329,'2017-03-09','Codeine','10%','10mg','1 time a day','Oral',3,367,109),(3332,'2017-03-09','Penicillin','20%','20mg','2 times a day','Oral',1,333,115),(3335,'2017-03-09','Codeine','30%','30mg','1 time a day','Oral',2,393,115),(3338,'2017-03-09','Penicillin','40%','40mg','2 times a day','Oral',3,359,121),(3341,'2017-03-09','Codeine','50%','50mg','1 time a day','Oral',1,302,104),(3344,'2017-03-09','Penicillin','60%','10mg','2 times a day','Oral',2,362,104),(3347,'2017-03-09','Codeine','70%','20mg','1 time a day','Oral',3,334,116),(3350,'2017-03-09','Penicillin','80%','30mg','2 times a day','Oral',1,394,116),(3353,'2017-03-09','Codeine','90%','40mg','1 time a day','Oral',2,343,105),(3356,'2017-03-09','Penicillin','100%','50mg','2 times a day','Oral',3,309,111),(3359,'2017-03-09','Codeine','10%','10mg','1 time a day','Oral',1,369,111),(3362,'2017-03-10','Penicillin','20%','20mg','2 times a day','Oral',2,325,107),(3365,'2017-03-10','Codeine','30%','30mg','1 time a day','Oral',3,385,107),(3368,'2017-03-10','Penicillin','40%','40mg','2 times a day','Oral',1,350,112),(3371,'2017-03-10','Codeine','50%','50mg','1 time a day','Oral',2,316,118),(3374,'2017-03-10','Penicillin','60%','10mg','2 times a day','Oral',3,376,118),(3377,'2017-03-10','Codeine','70%','20mg','1 time a day','Oral',1,326,108),(3380,'2017-03-10','Penicillin','80%','30mg','2 times a day','Oral',2,386,108),(3383,'2017-03-10','Codeine','90%','40mg','1 time a day','Oral',3,352,114),(3386,'2017-03-10','Penicillin','100%','50mg','2 times a day','Oral',1,317,119),(3389,'2017-03-10','Codeine','10%','10mg','1 time a day','Oral',2,377,119),(3392,'2017-03-10','Penicillin','20%','20mg','2 times a day','Oral',3,321,103),(3395,'2017-03-10','Codeine','30%','30mg','1 time a day','Oral',1,381,103),(3398,'2017-03-10','Penicillin','40%','40mg','2 times a day','Oral',2,353,115),(3401,'2017-03-10','Codeine','50%','50mg','1 time a day','Oral',3,319,121),(3404,'2017-03-10','Penicillin','60%','10mg','2 times a day','Oral',1,379,121),(3407,'2017-03-10','Codeine','70%','20mg','1 time a day','Oral',2,322,104),(3410,'2017-03-10','Penicillin','80%','30mg','2 times a day','Oral',3,382,104),(3413,'2017-03-10','Codeine','90%','40mg','1 time a day','Oral',1,348,110),(3416,'2017-03-10','Penicillin','100%','50mg','2 times a day','Oral',2,303,105),(3419,'2017-03-10','Codeine','10%','10mg','1 time a day','Oral',3,363,105),(3422,'2017-03-10','Penicillin','20%','20mg','2 times a day','Oral',1,329,111),(3425,'2017-03-10','Codeine','30%','30mg','1 time a day','Oral',2,389,111),(3428,'2017-03-10','Penicillin','40%','40mg','2 times a day','Oral',3,355,117),(3431,'2017-03-11','Codeine','50%','50mg','1 time a day','Oral',1,304,106),(3434,'2017-03-11','Penicillin','60%','10mg','2 times a day','Oral',2,364,106),(3437,'2017-03-11','Codeine','70%','20mg','1 time a day','Oral',3,336,118),(3440,'2017-03-11','Penicillin','80%','30mg','2 times a day','Oral',1,396,118),(3443,'2017-03-11','Codeine','90%','40mg','1 time a day','Oral',2,345,107),(3446,'2017-03-11','Penicillin','100%','50mg','2 times a day','Oral',3,306,108),(3449,'2017-03-11','Codeine','10%','10mg','1 time a day','Oral',1,366,108),(3452,'2017-03-11','Penicillin','20%','20mg','2 times a day','Oral',2,331,113),(3455,'2017-03-11','Codeine','30%','30mg','1 time a day','Oral',3,391,113),(3458,'2017-03-11','Penicillin','40%','40mg','2 times a day','Oral',1,341,103),(3461,'2017-03-11','Codeine','50%','50mg','1 time a day','Oral',2,312,114),(3464,'2017-03-11','Penicillin','60%','10mg','2 times a day','Oral',3,372,114),(3467,'2017-03-11','Codeine','70%','20mg','1 time a day','Oral',1,333,115),(3470,'2017-03-11','Penicillin','80%','30mg','2 times a day','Oral',2,393,115),(3473,'2017-03-11','Codeine','90%','40mg','1 time a day','Oral',3,358,120),(3476,'2017-03-11','Penicillin','100%','50mg','2 times a day','Oral',1,302,104),(3479,'2017-03-11','Codeine','10%','10mg','1 time a day','Oral',2,362,104),(3482,'2017-03-11','Penicillin','20%','20mg','2 times a day','Oral',3,328,110),(3485,'2017-03-11','Codeine','30%','30mg','1 time a day','Oral',1,388,110),(3488,'2017-03-11','Penicillin','40%','40mg','2 times a day','Oral',2,359,121),(3491,'2017-03-11','Codeine','50%','50mg','1 time a day','Oral',3,309,111),(3494,'2017-03-11','Penicillin','60%','10mg','2 times a day','Oral',1,369,111),(3497,'2017-03-11','Codeine','70%','20mg','1 time a day','Oral',2,335,117),(3500,'2017-03-11','Penicillin','80%','30mg','2 times a day','Oral',3,395,117),(3501,'2017-04-21','Tamiflu','40mg','60','2 times a day','Oral',2,399,121),(3502,'2017-04-12','Codeine','40mg','60','2 times a day','Oral',1,316,118),(3503,'2017-04-18','Tamiflu','40mg','60','2 times a day','Oral',2,316,118),(3504,'2017-04-12','Tamiflu','40mg','60','2 times a day','Oral',2,316,118),(3506,'2017-04-19','Epefefin','45mg','60','2 times a day','Orally',1,368,110),(3507,'2017-04-13','Efedrin','50mg','40','1 time a day','Oral',2,368,110),(3508,'2017-04-16','Excefredrin','40mg','60','1 time a day','Oral',1,399,121),(3509,'2017-04-16','Gexedrin','40mg','40','1 time a day','Oral',3,399,121),(3510,'2017-04-16','Gexedrin','40mg','40','1 time a day','Oral',3,399,121),(3521,'2017-04-16','Erepepedrin','30mg','40','1 time a day','Oral',2,383,105),(3523,'2017-04-16',NULL,NULL,NULL,NULL,NULL,NULL,383,105),(3524,'2017-04-16',NULL,NULL,NULL,NULL,NULL,NULL,383,105),(3525,'2017-04-16',NULL,NULL,NULL,NULL,NULL,NULL,383,105),(3526,'2017-04-16',NULL,NULL,NULL,NULL,NULL,NULL,383,105),(3527,'2017-04-16',NULL,NULL,NULL,NULL,NULL,NULL,383,105),(3528,'2017-04-16',NULL,NULL,NULL,NULL,NULL,NULL,383,105),(3529,'2017-04-16','1','1','1','1','1',1,383,105),(3530,'2017-04-16','1','1','1','1','1',1,383,105);
/*!40000 ALTER TABLE `PRESCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`apshaju`@`%`*/ /*!50003 TRIGGER `CLINIC`.`PRESCRIPTION_BEFORE_INSERT` BEFORE INSERT ON `PRESCRIPTION` FOR EACH ROW
BEGIN
	if (does_doctor_exist2(NEW.PrescriberID) = 0) then
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'The Doctor does not exist anymore.';
	end if;
    if (New.DatePrescribed < CURDATE()) then
 		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'The Prescription Date is in the past.';
	end if;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TEST`
--

DROP TABLE IF EXISTS `TEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEST` (
  `TestID` int(9) NOT NULL AUTO_INCREMENT,
  `DateOfTest` date NOT NULL,
  `Type` varchar(60) DEFAULT NULL,
  `Results` varchar(60) DEFAULT NULL,
  `OrderedByID` int(9) NOT NULL,
  `PatientID` int(9) NOT NULL,
  PRIMARY KEY (`TestID`),
  KEY `OrderedByID` (`OrderedByID`),
  KEY `PatientID` (`PatientID`),
  KEY `test_ibfk_4` (`OrderedByID`,`PatientID`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`OrderedByID`) REFERENCES `DOCTOR` (`DoctorID`),
  CONSTRAINT `test_ibfk_11` FOREIGN KEY (`OrderedByID`, `PatientID`) REFERENCES `PATIENT` (`AssignedDoctor`, `PatientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `test_ibfk_3` FOREIGN KEY (`PatientID`) REFERENCES `PATIENT` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=109524 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST`
--

LOCK TABLES `TEST` WRITE;
/*!40000 ALTER TABLE `TEST` DISABLE KEYS */;
INSERT INTO `TEST` VALUES (109001,'2017-03-05','X-ray','2 xray images of ankle',107,305),(109003,'2017-03-05','Blood_Test','High_Glucose',107,345),(109004,'2017-03-05','X-ray','2 xray images of ankle',107,365),(109006,'2017-03-05','Blood_Test','High_Glucose',113,311),(109007,'2017-03-05','X-ray','2 xray images of ankle',113,331),(109009,'2017-03-05','Blood_Test','High_Glucose',113,371),(109010,'2017-03-05','X-ray','2 xray images of ankle',113,391),(109012,'2017-03-05','Blood_Test','High_Glucose',102,340),(109013,'2017-03-05','X-ray','2 xray images of ankle',102,360),(109015,'2017-03-05','Blood_Test','High_Glucose',102,400),(109016,'2017-03-05','X-ray','2 xray images of ankle',114,312),(109018,'2017-03-05','Blood_Test','High_Glucose',114,352),(109019,'2017-03-05','X-ray','2 xray images of ankle',114,372),(109021,'2017-03-05','Blood_Test','High_Glucose',120,318),(109022,'2017-03-05','X-ray','2 xray images of ankle',120,338),(109024,'2017-03-05','Blood_Test','High_Glucose',120,378),(109025,'2017-03-05','X-ray','2 xray images of ankle',120,398),(109027,'2017-03-05','Blood_Test','High_Glucose',103,321),(109028,'2017-03-05','X-ray','2 xray images of ankle',103,341),(109030,'2017-03-05','Blood_Test','High_Glucose',103,381),(109031,'2017-03-05','X-ray','2 xray images of ankle',104,302),(109033,'2017-03-05','Blood_Test','High_Glucose',104,342),(109034,'2017-03-05','X-ray','2 xray images of ankle',104,362),(109036,'2017-03-05','Blood_Test','High_Glucose',109,307),(109037,'2017-03-05','X-ray','2 xray images of ankle',109,327),(109039,'2017-03-05','Blood_Test','High_Glucose',109,367),(109040,'2017-03-05','X-ray','2 xray images of ankle',109,387),(109042,'2017-03-05','Blood_Test','High_Glucose',110,328),(109043,'2017-03-05','X-ray','2 xray images of ankle',110,348),(109045,'2017-03-05','Blood_Test','High_Glucose',110,388),(109046,'2017-03-05','X-ray','2 xray images of ankle',121,319),(109048,'2017-03-05','Blood_Test','High_Glucose',121,359),(109049,'2017-03-05','X-ray','2 xray images of ankle',121,379),(109051,'2017-03-05','Blood_Test','High_Glucose',111,309),(109052,'2017-03-05','X-ray','2 xray images of ankle',111,329),(109054,'2017-03-05','Blood_Test','High_Glucose',111,369),(109055,'2017-03-05','X-ray','2 xray images of ankle',111,389),(109057,'2017-03-05','Blood_Test','High_Glucose',116,334),(109058,'2017-03-05','X-ray','2 xray images of ankle',116,354),(109060,'2017-03-05','Blood_Test','High_Glucose',116,394),(109061,'2017-03-05','X-ray','2 xray images of ankle',117,315),(109063,'2017-03-05','Blood_Test','High_Glucose',117,355),(109064,'2017-03-05','X-ray','2 xray images of ankle',117,375),(109066,'2017-03-05','Blood_Test','High_Glucose',106,304),(109067,'2017-03-05','X-ray','2 xray images of ankle',106,324),(109069,'2017-03-05','Blood_Test','High_Glucose',106,364),(109070,'2017-03-05','X-ray','2 xray images of ankle',106,384),(109072,'2017-03-05','Blood_Test','High_Glucose',118,336),(109073,'2017-03-05','X-ray','2 xray images of ankle',118,356),(109075,'2017-03-05','Blood_Test','High_Glucose',118,396),(109076,'2017-03-06','X-ray','2 xray images of ankle',107,305),(109078,'2017-03-06','Blood_Test','High_Glucose',107,345),(109079,'2017-03-06','X-ray','2 xray images of ankle',107,365),(109081,'2017-03-06','Blood_Test','High_Glucose',113,311),(109082,'2017-03-06','X-ray','2 xray images of ankle',113,331),(109084,'2017-03-06','Blood_Test','High_Glucose',113,371),(109085,'2017-03-06','X-ray','2 xray images of ankle',113,391),(109087,'2017-03-06','Blood_Test','High_Glucose',119,337),(109088,'2017-03-06','X-ray','2 xray images of ankle',119,357),(109090,'2017-03-06','Blood_Test','High_Glucose',119,397),(109091,'2017-03-06','X-ray','2 xray images of ankle',102,320),(109093,'2017-03-06','Blood_Test','High_Glucose',102,360),(109094,'2017-03-06','X-ray','2 xray images of ankle',102,380),(109096,'2017-03-06','Blood_Test','High_Glucose',114,312),(109097,'2017-03-06','X-ray','2 xray images of ankle',114,332),(109099,'2017-03-06','Blood_Test','High_Glucose',114,372),(109100,'2017-03-06','X-ray','2 xray images of ankle',114,392),(109102,'2017-03-06','Blood_Test','High_Glucose',120,338),(109103,'2017-03-06','X-ray','2 xray images of ankle',120,358),(109105,'2017-03-06','Blood_Test','High_Glucose',120,398),(109106,'2017-03-06','X-ray','2 xray images of ankle',103,301),(109108,'2017-03-06','Blood_Test','High_Glucose',103,341),(109109,'2017-03-06','X-ray','2 xray images of ankle',103,361),(109111,'2017-03-06','Blood_Test','High_Glucose',109,307),(109112,'2017-03-06','X-ray','2 xray images of ankle',109,327),(109114,'2017-03-06','Blood_Test','High_Glucose',109,367),(109115,'2017-03-06','X-ray','2 xray images of ankle',109,387),(109117,'2017-03-06','Blood_Test','High_Glucose',121,339),(109118,'2017-03-06','X-ray','2 xray images of ankle',121,359),(109120,'2017-03-06','Blood_Test','High_Glucose',121,399),(109121,'2017-03-06','X-ray','2 xray images of ankle',105,303),(109123,'2017-03-06','Blood_Test','High_Glucose',105,343),(109124,'2017-03-06','X-ray','2 xray images of ankle',105,363),(109126,'2017-03-06','Blood_Test','High_Glucose',110,308),(109127,'2017-03-06','X-ray','2 xray images of ankle',110,328),(109129,'2017-03-06','Blood_Test','High_Glucose',110,368),(109130,'2017-03-06','X-ray','2 xray images of ankle',110,388),(109132,'2017-03-06','Blood_Test','High_Glucose',116,334),(109133,'2017-03-06','X-ray','2 xray images of ankle',116,354),(109135,'2017-03-06','Blood_Test','High_Glucose',116,394),(109136,'2017-03-06','X-ray','2 xray images of ankle',106,304),(109138,'2017-03-06','Blood_Test','High_Glucose',106,344),(109139,'2017-03-06','X-ray','2 xray images of ankle',106,364),(109141,'2017-03-06','Blood_Test','High_Glucose',112,310),(109142,'2017-03-06','X-ray','2 xray images of ankle',112,330),(109144,'2017-03-06','Blood_Test','High_Glucose',112,370),(109145,'2017-03-06','X-ray','2 xray images of ankle',112,390),(109147,'2017-03-06','Blood_Test','High_Glucose',117,335),(109148,'2017-03-06','X-ray','2 xray images of ankle',117,355),(109150,'2017-03-06','Blood_Test','High_Glucose',117,395),(109151,'2017-03-07','X-ray','2 xray images of ankle',113,311),(109153,'2017-03-07','Blood_Test','High_Glucose',113,351),(109154,'2017-03-07','X-ray','2 xray images of ankle',113,371),(109156,'2017-03-07','Blood_Test','High_Glucose',119,317),(109157,'2017-03-07','X-ray','2 xray images of ankle',119,337),(109159,'2017-03-07','Blood_Test','High_Glucose',119,377),(109160,'2017-03-07','X-ray','2 xray images of ankle',119,397),(109162,'2017-03-07','Blood_Test','High_Glucose',102,340),(109163,'2017-03-07','X-ray','2 xray images of ankle',102,360),(109165,'2017-03-07','Blood_Test','High_Glucose',102,400),(109166,'2017-03-07','X-ray','2 xray images of ankle',108,306),(109168,'2017-03-07','Blood_Test','High_Glucose',108,346),(109169,'2017-03-07','X-ray','2 xray images of ankle',108,366),(109171,'2017-03-07','Blood_Test','High_Glucose',120,318),(109172,'2017-03-07','X-ray','2 xray images of ankle',120,338),(109174,'2017-03-07','Blood_Test','High_Glucose',120,378),(109175,'2017-03-07','X-ray','2 xray images of ankle',120,398),(109177,'2017-03-07','Blood_Test','High_Glucose',103,321),(109178,'2017-03-07','X-ray','2 xray images of ankle',103,341),(109180,'2017-03-07','Blood_Test','High_Glucose',103,381),(109181,'2017-03-07','X-ray','2 xray images of ankle',109,307),(109183,'2017-03-07','Blood_Test','High_Glucose',109,347),(109184,'2017-03-07','X-ray','2 xray images of ankle',109,367),(109186,'2017-03-07','Blood_Test','High_Glucose',115,313),(109187,'2017-03-07','X-ray','2 xray images of ankle',115,333),(109189,'2017-03-07','Blood_Test','High_Glucose',115,373),(109190,'2017-03-07','X-ray','2 xray images of ankle',115,393),(109192,'2017-03-07','Blood_Test','High_Glucose',105,323),(109193,'2017-03-07','X-ray','2 xray images of ankle',105,343),(109195,'2017-03-07','Blood_Test','High_Glucose',105,383),(109196,'2017-03-07','X-ray','2 xray images of ankle',110,308),(109198,'2017-03-07','Blood_Test','High_Glucose',110,348),(109199,'2017-03-07','X-ray','2 xray images of ankle',110,368),(109201,'2017-03-07','Blood_Test','High_Glucose',116,314),(109202,'2017-03-07','X-ray','2 xray images of ankle',116,334),(109204,'2017-03-07','Blood_Test','High_Glucose',116,374),(109205,'2017-03-07','X-ray','2 xray images of ankle',116,394),(109207,'2017-03-07','Blood_Test','High_Glucose',106,324),(109208,'2017-03-07','X-ray','2 xray images of ankle',106,344),(109210,'2017-03-07','Blood_Test','High_Glucose',106,384),(109211,'2017-03-07','X-ray','2 xray images of ankle',112,310),(109213,'2017-03-07','Blood_Test','High_Glucose',112,350),(109214,'2017-03-07','X-ray','2 xray images of ankle',112,370),(109216,'2017-03-07','Blood_Test','High_Glucose',117,315),(109217,'2017-03-07','X-ray','2 xray images of ankle',117,335),(109219,'2017-03-07','Blood_Test','High_Glucose',117,375),(109220,'2017-03-07','X-ray','2 xray images of ankle',117,395),(109222,'2017-03-08','Blood_Test','High_Glucose',106,324),(109223,'2017-03-08','X-ray','2 xray images of ankle',106,344),(109225,'2017-03-08','Blood_Test','High_Glucose',106,384),(109226,'2017-03-08','X-ray','2 xray images of ankle',112,310),(109228,'2017-03-08','Blood_Test','High_Glucose',112,350),(109229,'2017-03-08','X-ray','2 xray images of ankle',112,370),(109231,'2017-03-08','Blood_Test','High_Glucose',119,317),(109232,'2017-03-08','X-ray','2 xray images of ankle',119,337),(109234,'2017-03-08','Blood_Test','High_Glucose',119,377),(109235,'2017-03-08','X-ray','2 xray images of ankle',119,397),(109237,'2017-03-08','Blood_Test','High_Glucose',102,340),(109238,'2017-03-08','X-ray','2 xray images of ankle',102,360),(109240,'2017-03-08','Blood_Test','High_Glucose',102,400),(109241,'2017-03-08','X-ray','2 xray images of ankle',108,306),(109243,'2017-03-08','Blood_Test','High_Glucose',108,346),(109244,'2017-03-08','X-ray','2 xray images of ankle',108,366),(109246,'2017-03-08','Blood_Test','High_Glucose',113,311),(109247,'2017-03-08','X-ray','2 xray images of ankle',113,331),(109249,'2017-03-08','Blood_Test','High_Glucose',113,371),(109250,'2017-03-08','X-ray','2 xray images of ankle',113,391),(109252,'2017-03-08','Blood_Test','High_Glucose',120,338),(109253,'2017-03-08','X-ray','2 xray images of ankle',120,358),(109255,'2017-03-08','Blood_Test','High_Glucose',120,398),(109256,'2017-03-08','X-ray','2 xray images of ankle',109,307),(109258,'2017-03-08','Blood_Test','High_Glucose',109,347),(109259,'2017-03-08','X-ray','2 xray images of ankle',109,367),(109261,'2017-03-08','Blood_Test','High_Glucose',115,313),(109262,'2017-03-08','X-ray','2 xray images of ankle',115,333),(109264,'2017-03-08','Blood_Test','High_Glucose',115,373),(109265,'2017-03-08','X-ray','2 xray images of ankle',115,393),(109267,'2017-03-08','Blood_Test','High_Glucose',104,322),(109268,'2017-03-08','X-ray','2 xray images of ankle',104,342),(109270,'2017-03-08','Blood_Test','High_Glucose',104,382),(109271,'2017-03-08','X-ray','2 xray images of ankle',111,309),(109273,'2017-03-08','Blood_Test','High_Glucose',111,349),(109274,'2017-03-08','X-ray','2 xray images of ankle',111,369),(109276,'2017-03-08','Blood_Test','High_Glucose',116,314),(109277,'2017-03-08','X-ray','2 xray images of ankle',116,334),(109279,'2017-03-08','Blood_Test','High_Glucose',116,374),(109280,'2017-03-08','X-ray','2 xray images of ankle',116,394),(109282,'2017-03-08','Blood_Test','High_Glucose',105,323),(109283,'2017-03-08','X-ray','2 xray images of ankle',105,343),(109285,'2017-03-08','Blood_Test','High_Glucose',105,383),(109286,'2017-03-08','X-ray','2 xray images of ankle',118,316),(109288,'2017-03-08','Blood_Test','High_Glucose',118,356),(109289,'2017-03-08','X-ray','2 xray images of ankle',118,376),(109291,'2017-03-09','Blood_Test','High_Glucose',107,305),(109292,'2017-03-09','X-ray','2 xray images of ankle',107,325),(109294,'2017-03-09','Blood_Test','High_Glucose',107,365),(109295,'2017-03-09','X-ray','2 xray images of ankle',107,385),(109297,'2017-03-09','Blood_Test','High_Glucose',112,330),(109298,'2017-03-09','X-ray','2 xray images of ankle',112,350),(109300,'2017-03-09','Blood_Test','High_Glucose',112,390),(109301,'2017-03-09','X-ray','2 xray images of ankle',118,316),(109303,'2017-03-09','Blood_Test','High_Glucose',118,356),(109304,'2017-03-09','X-ray','2 xray images of ankle',118,376),(109306,'2017-03-09','Blood_Test','High_Glucose',102,320),(109307,'2017-03-09','X-ray','2 xray images of ankle',102,340),(109309,'2017-03-09','Blood_Test','High_Glucose',102,380),(109310,'2017-03-09','X-ray','2 xray images of ankle',102,400),(109312,'2017-03-09','Blood_Test','High_Glucose',108,326),(109313,'2017-03-09','X-ray','2 xray images of ankle',108,346),(109315,'2017-03-09','Blood_Test','High_Glucose',108,386),(109316,'2017-03-09','X-ray','2 xray images of ankle',114,312),(109318,'2017-03-09','Blood_Test','High_Glucose',114,352),(109319,'2017-03-09','X-ray','2 xray images of ankle',114,372),(109321,'2017-03-09','Blood_Test','High_Glucose',119,317),(109322,'2017-03-09','X-ray','2 xray images of ankle',119,337),(109324,'2017-03-09','Blood_Test','High_Glucose',119,377),(109325,'2017-03-09','X-ray','2 xray images of ankle',119,397),(109327,'2017-03-09','Blood_Test','High_Glucose',109,327),(109328,'2017-03-09','X-ray','2 xray images of ankle',109,347),(109330,'2017-03-09','Blood_Test','High_Glucose',109,387),(109331,'2017-03-09','X-ray','2 xray images of ankle',115,313),(109333,'2017-03-09','Blood_Test','High_Glucose',115,353),(109334,'2017-03-09','X-ray','2 xray images of ankle',115,373),(109336,'2017-03-09','Blood_Test','High_Glucose',121,319),(109337,'2017-03-09','X-ray','2 xray images of ankle',121,339),(109339,'2017-03-09','Blood_Test','High_Glucose',121,379),(109340,'2017-03-09','X-ray','2 xray images of ankle',121,399),(109342,'2017-03-09','Blood_Test','High_Glucose',104,322),(109343,'2017-03-09','X-ray','2 xray images of ankle',104,342),(109345,'2017-03-09','Blood_Test','High_Glucose',104,382),(109346,'2017-03-09','X-ray','2 xray images of ankle',116,314),(109348,'2017-03-09','Blood_Test','High_Glucose',116,354),(109349,'2017-03-09','X-ray','2 xray images of ankle',116,374),(109351,'2017-03-09','Blood_Test','High_Glucose',105,303),(109352,'2017-03-09','X-ray','2 xray images of ankle',105,323),(109354,'2017-03-09','Blood_Test','High_Glucose',105,363),(109355,'2017-03-09','X-ray','2 xray images of ankle',105,383),(109357,'2017-03-09','Blood_Test','High_Glucose',111,329),(109358,'2017-03-09','X-ray','2 xray images of ankle',111,349),(109360,'2017-03-09','Blood_Test','High_Glucose',111,389),(109361,'2017-03-10','X-ray','2 xray images of ankle',107,305),(109363,'2017-03-10','Blood_Test','High_Glucose',107,345),(109364,'2017-03-10','X-ray','2 xray images of ankle',107,365),(109366,'2017-03-10','Blood_Test','High_Glucose',112,310),(109367,'2017-03-10','X-ray','2 xray images of ankle',112,330),(109369,'2017-03-10','Blood_Test','High_Glucose',112,370),(109370,'2017-03-10','X-ray','2 xray images of ankle',112,390),(109372,'2017-03-10','Blood_Test','High_Glucose',118,336),(109373,'2017-03-10','X-ray','2 xray images of ankle',118,356),(109375,'2017-03-10','Blood_Test','High_Glucose',118,396),(109376,'2017-03-10','X-ray','2 xray images of ankle',108,306),(109378,'2017-03-10','Blood_Test','High_Glucose',108,346),(109379,'2017-03-10','X-ray','2 xray images of ankle',108,366),(109381,'2017-03-10','Blood_Test','High_Glucose',114,312),(109382,'2017-03-10','X-ray','2 xray images of ankle',114,332),(109384,'2017-03-10','Blood_Test','High_Glucose',114,372),(109385,'2017-03-10','X-ray','2 xray images of ankle',114,392),(109387,'2017-03-10','Blood_Test','High_Glucose',119,337),(109388,'2017-03-10','X-ray','2 xray images of ankle',119,357),(109390,'2017-03-10','Blood_Test','High_Glucose',119,397),(109391,'2017-03-10','X-ray','2 xray images of ankle',103,301),(109393,'2017-03-10','Blood_Test','High_Glucose',103,341),(109394,'2017-03-10','X-ray','2 xray images of ankle',103,361),(109396,'2017-03-10','Blood_Test','High_Glucose',115,313),(109397,'2017-03-10','X-ray','2 xray images of ankle',115,333),(109399,'2017-03-10','Blood_Test','High_Glucose',115,373),(109400,'2017-03-10','X-ray','2 xray images of ankle',115,393),(109402,'2017-03-10','Blood_Test','High_Glucose',121,339),(109403,'2017-03-10','X-ray','2 xray images of ankle',121,359),(109405,'2017-03-10','Blood_Test','High_Glucose',121,399),(109406,'2017-03-10','X-ray','2 xray images of ankle',104,302),(109408,'2017-03-10','Blood_Test','High_Glucose',104,342),(109409,'2017-03-10','X-ray','2 xray images of ankle',104,362),(109411,'2017-03-10','Blood_Test','High_Glucose',110,308),(109412,'2017-03-10','X-ray','2 xray images of ankle',110,328),(109414,'2017-03-10','Blood_Test','High_Glucose',110,368),(109415,'2017-03-10','X-ray','2 xray images of ankle',110,388),(109417,'2017-03-10','Blood_Test','High_Glucose',105,323),(109418,'2017-03-10','X-ray','2 xray images of ankle',105,343),(109420,'2017-03-10','Blood_Test','High_Glucose',105,383),(109421,'2017-03-10','X-ray','2 xray images of ankle',111,309),(109423,'2017-03-10','Blood_Test','High_Glucose',111,349),(109424,'2017-03-10','X-ray','2 xray images of ankle',111,369),(109426,'2017-03-10','Blood_Test','High_Glucose',117,315),(109427,'2017-03-10','X-ray','2 xray images of ankle',117,335),(109429,'2017-03-10','Blood_Test','High_Glucose',117,375),(109430,'2017-03-10','X-ray','2 xray images of ankle',117,395),(109432,'2017-03-11','Blood_Test','High_Glucose',106,324),(109433,'2017-03-11','X-ray','2 xray images of ankle',106,344),(109435,'2017-03-11','Blood_Test','High_Glucose',106,384),(109436,'2017-03-11','X-ray','2 xray images of ankle',118,316),(109438,'2017-03-11','Blood_Test','High_Glucose',118,356),(109439,'2017-03-11','X-ray','2 xray images of ankle',118,376),(109441,'2017-03-11','Blood_Test','High_Glucose',107,305),(109442,'2017-03-11','X-ray','2 xray images of ankle',107,325),(109444,'2017-03-11','Blood_Test','High_Glucose',107,365),(109445,'2017-03-11','X-ray','2 xray images of ankle',107,385),(109447,'2017-03-11','Blood_Test','High_Glucose',108,326),(109448,'2017-03-11','X-ray','2 xray images of ankle',108,346),(109450,'2017-03-11','Blood_Test','High_Glucose',108,386),(109451,'2017-03-11','X-ray','2 xray images of ankle',113,311),(109453,'2017-03-11','Blood_Test','High_Glucose',113,351),(109454,'2017-03-11','X-ray','2 xray images of ankle',113,371),(109456,'2017-03-11','Blood_Test','High_Glucose',103,301),(109457,'2017-03-11','X-ray','2 xray images of ankle',103,321),(109459,'2017-03-11','Blood_Test','High_Glucose',103,361),(109460,'2017-03-11','X-ray','2 xray images of ankle',103,381),(109462,'2017-03-11','Blood_Test','High_Glucose',114,332),(109463,'2017-03-11','X-ray','2 xray images of ankle',114,352),(109465,'2017-03-11','Blood_Test','High_Glucose',114,392),(109466,'2017-03-11','X-ray','2 xray images of ankle',115,313),(109468,'2017-03-11','Blood_Test','High_Glucose',115,353),(109469,'2017-03-11','X-ray','2 xray images of ankle',115,373),(109471,'2017-03-11','Blood_Test','High_Glucose',120,318),(109472,'2017-03-11','X-ray','2 xray images of ankle',120,338),(109474,'2017-03-11','Blood_Test','High_Glucose',120,378),(109475,'2017-03-11','X-ray','2 xray images of ankle',120,398),(109477,'2017-03-11','Blood_Test','High_Glucose',104,322),(109478,'2017-03-11','X-ray','2 xray images of ankle',104,342),(109480,'2017-03-11','Blood_Test','High_Glucose',104,382),(109481,'2017-03-11','X-ray','2 xray images of ankle',110,308),(109483,'2017-03-11','Blood_Test','High_Glucose',110,348),(109484,'2017-03-11','X-ray','2 xray images of ankle',110,368),(109486,'2017-03-11','Blood_Test','High_Glucose',121,319),(109487,'2017-03-11','X-ray','2 xray images of ankle',121,339),(109489,'2017-03-11','Blood_Test','High_Glucose',121,379),(109490,'2017-03-11','X-ray','2 xray images of ankle',121,399),(109492,'2017-03-11','Blood_Test','High_Glucose',111,329),(109493,'2017-03-11','X-ray','2 xray images of ankle',111,349),(109495,'2017-03-11','Blood_Test','High_Glucose',111,389),(109496,'2017-03-11','X-ray','2 xray images of ankle',117,315),(109498,'2017-03-11','Blood_Test','High_Glucose',117,355),(109499,'2017-03-11','X-ray','2 xray images of ankle',117,375),(109500,'2017-04-13','Blood Test','Cholesterol = 150, BP 140/60',110,368),(109501,'2017-04-13','X_Ray','2 xray images of leg',108,366),(109502,'2017-04-16','Blood Test','45 Glucose',121,399),(109503,'2017-04-16',NULL,NULL,105,383),(109504,'2017-04-16',NULL,NULL,105,383),(109505,'2017-04-16',NULL,NULL,105,383),(109506,'2017-04-16',NULL,NULL,105,383),(109507,'2017-04-16',NULL,NULL,105,383),(109508,'2017-04-16',NULL,NULL,105,383),(109509,'2017-04-16',NULL,NULL,105,383),(109510,'2017-04-16',NULL,NULL,105,383),(109511,'2017-04-16',NULL,NULL,105,383),(109512,'2017-04-16',NULL,NULL,105,383),(109513,'2017-04-16',NULL,NULL,105,383),(109514,'2017-04-16',NULL,NULL,105,383),(109515,'2017-04-16',NULL,NULL,105,383),(109516,'2017-04-16',NULL,NULL,105,383),(109517,'2017-04-16',NULL,NULL,105,383),(109518,'2017-04-16',NULL,NULL,105,383),(109519,'2017-04-16',NULL,NULL,105,383),(109520,'2017-04-16',NULL,NULL,105,383),(109521,'2017-04-16',NULL,NULL,105,383),(109522,'2017-04-16',NULL,NULL,105,383),(109523,'2017-04-16',NULL,NULL,105,383);
/*!40000 ALTER TABLE `TEST` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`apshaju`@`%`*/ /*!50003 TRIGGER `CLINIC`.`TEST_BEFORE_INSERT` BEFORE INSERT ON `TEST` FOR EACH ROW
BEGIN
	if (does_doctor_exist2(NEW.OrderedByID) = 0) then
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'The Doctor does not exist anymore.';
	end if;
    if (New.DateOfTest < CURDATE()) then
 		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT = 'The Date of Test is in the past.';
	end if;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `TIME_SLOTS`
--

DROP TABLE IF EXISTS `TIME_SLOTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIME_SLOTS` (
  `TimeSlotID` int(9) NOT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  PRIMARY KEY (`TimeSlotID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIME_SLOTS`
--

LOCK TABLES `TIME_SLOTS` WRITE;
/*!40000 ALTER TABLE `TIME_SLOTS` DISABLE KEYS */;
INSERT INTO `TIME_SLOTS` VALUES (8,'08:00:00','08:59:59'),(9,'09:00:00','09:59:59'),(10,'10:00:00','10:59:59'),(11,'11:00:00','11:59:59'),(12,'12:00:00','12:59:59'),(13,'13:00:00','13:59:59'),(14,'14:00:00','14:59:59'),(15,'15:00:00','15:59:59'),(16,'16:00:00','16:59:59');
/*!40000 ALTER TABLE `TIME_SLOTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `loginID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` enum('Doctor','Patient','Admin') NOT NULL,
  PRIMARY KEY (`loginID`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=100026 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1001,'dteixeira','12345678','Doctor'),(1002,'dstamper','12345678','Doctor'),(1003,'dbolander','12345678','Doctor'),(1004,'kkitchin','12345678','Doctor'),(1005,'mmease','12345678','Doctor'),(1006,'ckozel','12345678','Doctor'),(1007,'cbjork','12345678','Doctor'),(1008,'efranson','12345678','Doctor'),(1009,'jquellette','12345678','Doctor'),(1010,'cschnabel','12345678','Doctor'),(1011,'bkovats','12345678','Doctor'),(1012,'alancon','12345678','Doctor'),(1013,'jherbig','12345678','Doctor'),(1014,'gchiodo','12345678','Doctor'),(1015,'etester','12345678','Doctor'),(1016,'nyeomans','12345678','Doctor'),(1017,'vhoyer','12345678','Doctor'),(1018,'bmellish','12345678','Doctor'),(1019,'lcarns','12345678','Doctor'),(1020,'cwhetstone','12345678','Doctor'),(50001,'khaglund','12345678','Patient'),(50002,'lhassen','12345678','Patient'),(50003,'fpoythress','12345678','Patient'),(50004,'klawley','12345678','Patient'),(50005,'kballentine','12345678','Patient'),(50006,'kshelly','12345678','Patient'),(50007,'ogowan','12345678','Patient'),(50008,'lczech','12345678','Patient'),(50009,'ahollen','12345678','Patient'),(50010,'nleisinger','12345678','Patient'),(50011,'rrose','12345678','Patient'),(50012,'rfrates','12345678','Patient'),(50013,'rnaber','12345678','Patient'),(50014,'tdollar','12345678','Patient'),(50015,'jstinson','12345678','Patient'),(50016,'dballard','12345678','Patient'),(50017,'vhammer','12345678','Patient'),(50018,'gheber','12345678','Patient'),(50019,'aquevedo','12345678','Patient'),(50020,'jbritten','12345678','Patient'),(50021,'bbaisden','12345678','Patient'),(50022,'zoberg','12345678','Patient'),(50023,'ckinoshita','12345678','Patient'),(50024,'ewitt','12345678','Patient'),(50025,'cgildersleeve','12345678','Patient'),(50026,'cbaur','12345678','Patient'),(50027,'dosorio','12345678','Patient'),(50028,'tfugate','12345678','Patient'),(50029,'wpollard','12345678','Patient'),(50030,'hbennet','12345678','Patient'),(50031,'ybold','12345678','Patient'),(50032,'mmccaster','12345678','Patient'),(50033,'sblakey','12345678','Patient'),(50034,'dleto','12345678','Patient'),(50035,'jrobichaux','12345678','Patient'),(50036,'mlaws','12345678','Patient'),(50037,'mschecter','12345678','Patient'),(50038,'thuss','12345678','Patient'),(50039,'jmarchan','12345678','Patient'),(50040,'mbaden','12345678','Patient'),(50041,'dbott','12345678','Patient'),(50042,'ngwaltney','12345678','Patient'),(50043,'ehodder','12345678','Patient'),(50044,'tbohannon','12345678','Patient'),(50045,'globdell','12345678','Patient'),(50046,'mhenery','12345678','Patient'),(50047,'jpopovic','12345678','Patient'),(50048,'wmilot','12345678','Patient'),(50049,'yzygmont','12345678','Patient'),(50050,'mbrewington','12345678','Patient'),(50051,'mmedrano','12345678','Patient'),(50052,'lleishman','12345678','Patient'),(50053,'rsparkman','12345678','Patient'),(50054,'pspink','12345678','Patient'),(50055,'kvandyke','12345678','Patient'),(50056,'ttourville','12345678','Patient'),(50057,'mellman','12345678','Patient'),(50058,'lsimeon','12345678','Patient'),(50059,'mcasterline','12345678','Patient'),(50060,'mtannehill','12345678','Patient'),(50061,'tbahr','12345678','Patient'),(50062,'gwalts','12345678','Patient'),(50063,'sjungers','12345678','Patient'),(50064,'wquinto','12345678','Patient'),(50065,'lchaidez','12345678','Patient'),(50066,'apittmon','12345678','Patient'),(50067,'cpiggott','12345678','Patient'),(50068,'acollings','12345678','Patient'),(50069,'zcreasey','12345678','Patient'),(50070,'shenn','12345678','Patient'),(50071,'zpoulter','12345678','Patient'),(50072,'dglenn','12345678','Patient'),(50073,'ccasale','12345678','Patient'),(50074,'jbraud','12345678','Patient'),(50075,'sfeth','12345678','Patient'),(50076,'ksilas','12345678','Patient'),(50077,'llembo','12345678','Patient'),(50078,'aballweg','12345678','Patient'),(50079,'rhiney','12345678','Patient'),(50080,'ekinghorn','12345678','Patient'),(50081,'lferranti','12345678','Patient'),(50082,'apasternak','12345678','Patient'),(50083,'kburrows','12345678','Patient'),(50084,'alammert','12345678','Patient'),(50085,'bturcotte','12345678','Patient'),(50086,'lshute','12345678','Patient'),(50087,'dcushenberry','12345678','Patient'),(50088,'jabrahamson','12345678','Patient'),(50089,'apenix','12345678','Patient'),(50090,'tjacox','12345678','Patient'),(50091,'lgorski','12345678','Patient'),(50092,'mlanda','12345678','Patient'),(50093,'imargolin','12345678','Patient'),(50094,'tsenn','12345678','Patient'),(50095,'ssiddall','12345678','Patient'),(50096,'nowen','12345678','Patient'),(50097,'dcavitt','12345678','Patient'),(50098,'tnavarra','12345678','Patient'),(50099,'jjosephson','12345678','Patient'),(50100,'mdepalma','12345678','Patient'),(50101,'tim','12345678','Admin'),(50102,'alen','12345678','Admin'),(50103,'matthew','12345678','Admin'),(50104,'thang','12345678','Admin'),(50105,'jason','12345678','Admin'),(100006,'testuser','123','Doctor'),(100007,'u4','12345678','Doctor'),(100008,'new1','12345678','Doctor'),(100009,'new2','12345678','Doctor'),(100010,'aaaaa','12345678','Patient'),(100011,'user11','12345678','Doctor'),(100012,'new44','12345678','Doctor'),(100013,'new55','12345678','Doctor'),(100014,'brun','12345678','Patient'),(100015,'clozano','12345678','Patient'),(100016,'cbun','12345678','Patient'),(100017,'cbutler','12345678','Patient'),(100018,'hjackson','12345678','Patient'),(100019,'bcook','12345678','Patient'),(100020,'hminor','12345678','Doctor'),(100021,'cchris','12345678','Patient'),(100022,'gcostanza','12345678','Patient'),(100023,'hcripe','12345678','Patient'),(100024,'ptorre','12345678','Patient'),(100025,'username','password','Patient');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'CLINIC'
--

--
-- Dumping routines for database 'CLINIC'
--
/*!50003 DROP FUNCTION IF EXISTS `does_doctor_exist2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` FUNCTION `does_doctor_exist2`(DoctorIdent int(9)) RETURNS int(9)
BEGIN
	declare existCheck int default(0);
    
    select DoctorExists into existCheck 
    from DOCTOR
    where DOCTOR.DoctorID = DoctorIdent;

	RETURN existCheck;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_doctorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` FUNCTION `get_doctorID`(
docUserName varchar(45)
) RETURNS int(9)
BEGIN
	declare doctorIdent int default(0);
    
    select DoctorID into doctorIdent 
    from DOCTOR
    where DOCTOR.username = docUserName;

	RETURN doctorIdent;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_patientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` FUNCTION `get_patientID`(
patUserName varchar(45)
) RETURNS int(9)
BEGIN
	declare patientIdent int default(0);
    
    select PatientID into patientIdent 
    from PATIENT
    where PATIENT.username = patUserName;

	RETURN patientIdent;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `update_appt_dayleft` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` FUNCTION `update_appt_dayleft`(
) RETURNS varchar(60) CHARSET latin1
BEGIN

	declare updMessage varchar(45) default('0');

		UPDATE APPOINTMENT
		SET DayLeft = Date - curDate()
        where Date >= curDate();
        
	set updMessage = 'Updated appointments days left';

	RETURN updMessage;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_by_patientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `appointment_by_patientID`(
	IN aPatientID int(9)
)
BEGIN
	select * 
	from APPOINTMENT as a INNER JOIN TIME_SLOTS as t
    on a.TimeSlot = t.TimeSlotID
	where a.PatientID = aPatientID
    order by a.date desc, a.TimeSlot;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_email_alert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `appointment_email_alert`()
BEGIN
	update APPOINTMENT as a
    SET a.DayLeft = a.Date - CURDATE();

	select p.email
    from PATIENT as p inner join APPOINTMENT as a on p.PatientID = a.PatientID
    where a.DayLeft = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_in_a_date_by_doctorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `appointment_in_a_date_by_doctorID`(
	IN aDoctorID int(9),
    IN aDate date
)
BEGIN
	select * 
	from APPOINTMENT as a
	where a.Date = aDate and a.DoctorID = aDoctorID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_set_accepted_by_APPOINTMENTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `appointment_set_accepted_by_APPOINTMENTID`(
    in aAppointmetID int(9)
)
BEGIN
	UPDATE APPOINTMENT SET DoctorAccepted = 1
    WHERE APPOINTMENT.AppointmentID = aAppointmentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `appointment_set_unaccepted_by_APPOINTMENTID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `appointment_set_unaccepted_by_APPOINTMENTID`(
    in aAppointmetID int(9)
)
BEGIN
	UPDATE APPOINTMENT SET DoctorAccepted = 0
    WHERE APPOINTMENT.AppointmentID = aAppointmentID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_doctor_to_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `assign_doctor_to_patient`(
    in thePatientID int(9), 
    in theDoctorID int(9)
)
BEGIN
	
    declare doctorExists int default(0);
    
    set doctorExists = does_doctor_exist2(theDoctorID);
	
    if doctorExists > 0 then

		UPDATE PATIENT as p
		SET p.AssignedDoctor = theDoctorID
		where p.PatientId = thePatientID;
        
		select 'Doctor Assigned Successfully.';
    
    else 
		select 'Doctor does not exist.';
    
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_assigned_to` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `check_assigned_to`(
	in appDoctorID int(9),
    in appPatientID int(9)
)
BEGIN
		select count(*) as comboExists
        from PATIENT as p
        where p.AssignedDoctor = appDoctorID and p.PatientID = appPatientID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `current_prescription_by_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `current_prescription_by_patient`(
	IN aPatientID int(9)
)
BEGIN
	select *
    from PRESCRIPTION as p
    where p.PatientID = aPatientID
    ORDER BY p.DateLastFilled ASC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `future_appointment_by_patientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `future_appointment_by_patientID`(
	IN aPatientID int(9)
)
BEGIN
	select *, DATE_FORMAT(a.Date,'%b %d %Y') as DateFormatted, DATE_FORMAT(t.StartTime,'%h:%i %p') as TimeFormatted
	from APPOINTMENT as a INNER JOIN TIME_SLOTS as t on a.TimeSlot = t.TimeSlotID
	where a.PatientID = aPatientID and a.Date >= CURDATE()
    ORDER BY a.Date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `getUserType`(
	in theUsername nvarchar(45)
)
BEGIN
		select type
        from login as l
        where l.username = theUsername;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_appointments_for_Doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `get_all_appointments_for_Doctor`(
	IN aDoctorID int(9)
)
BEGIN
	select a.*
       
	from APPOINTMENT as a INNER JOIN PATIENT as p ON a.PatientID = p.PatientID
	where a.DoctorID = aDoctorID
    
	ORDER BY a.Date DESC, a.TimeSlot DESC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_AssignedDoctor_for_Patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `get_AssignedDoctor_for_Patient`(
in patientIdent int(9)
)
BEGIN

	select AssignedDoctor
	FROM PATIENT as p
	WHERE p.PatientID = patientIdent;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_DoctorID_from_docUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `get_DoctorID_from_docUsername`(
in docUserName varchar(45)
)
BEGIN

	select DoctorID
	FROM DOCTOR as d
	WHERE d.username = docUserName;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_doctors_in_order_of_apptCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `get_doctors_in_order_of_apptCount`()
BEGIN

	select DoctorId, Lname, ApptsThisMonth
    FROM DOCTOR;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_PatientID_DoctorID_from_patUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `get_PatientID_DoctorID_from_patUsername`(
in patUserName varchar(45)
)
BEGIN

	select PatientID
	FROM PATIENT as p
	WHERE p.username = patUserName;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_PatientID_from_patUsername` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `get_PatientID_from_patUsername`(
in patUserName varchar(45)
)
BEGIN

	select PatientID
	FROM PATIENT as p
	WHERE p.username = patUserName;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_todays_Appts_Doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `get_todays_Appts_Doctor`(
	IN aDoctorID int(9)
)
BEGIN
	select *, DATE_FORMAT(a.Date,'%b %d %Y') as DateFormatted, DATE_FORMAT(t.StartTime,'%h:%i %p') as StartTimeFormatted
	
	FROM APPOINTMENT a
		INNER JOIN TIME_SLOTS t ON a.TimeSlot = t.TimeSlotID
		INNER JOIN PATIENT p ON a.PatientID  = p.PatientID
	WHERE a.Date = curdate() AND a.DoctorID = aDoctorID
    
	ORDER BY a.TimeSlot asc;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_all_appointments_for_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_all_appointments_for_doctor`(
	IN aDoctorID int(9)
)
BEGIN

	select *
	from APPOINTMENT as a INNER JOIN PATIENT as p ON a.PatientID = p.PatientID
	where a.DoctorID = aDoctorID
	ORDER BY a.Date DESC, a.TimeSlot DESC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_all_doctors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_all_doctors`()
BEGIN
	select * 
	from DOCTOR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_diagnosis_for_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_diagnosis_for_patient`(IN PatientIdent int(9))
BEGIN

 select *
 FROM DIAGNOSIS
 WHERE DIAGNOSIS.PatientID = PatientIdent
 ORDER BY DateOfDiagnosis desc;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_doctors_assigned_to_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_doctors_assigned_to_patient`(
    in patID int(9)
)
BEGIN

	select d.* 
	from PATIENT as p INNER JOIN DOCTOR as d ON p.AssignedDoctor = d.DoctorID
	where p.PatientID = patID AND d.DoctorExists = 1
    ORDER BY d.DoctorID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_doctors_by_specialty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_doctors_by_specialty`(
	in theSpecialty varchar(30)
)
BEGIN
	select * 
	from DOCTOR
    where Specialty = theSpecialty;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_four_doctors_oneEachType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_four_doctors_oneEachType`()
BEGIN
	select * 
	from DOCTOR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_patients_for_doctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_patients_for_doctor`(
	IN DoctorIdent int
)
BEGIN
		SELECT *
        
        FROM PATIENT as p
        WHERE p.AssignedDoctor = DoctorIdent
        ORDER BY p.PatientID DESC;
        
	-- from APPOINTMENT as a INNER JOIN PATIENT as p ON a.PatientID = p.PatientID
	-- where a.DoctorID = aDoctorID
                
                -- ouput fields are
                -- Doctor
                -- PatientID
                -- Lname
                -- Minit
                -- Fname
                -- DateOfBirth
                -- Allergies
                -- Conditions
                -- Phone
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_prescriptions_for_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_prescriptions_for_patient`(
in patientIdent int(9)
)
BEGIN

	select p.*, DATE_FORMAT(p.DatePrescribed,'%b %d %Y') as DatePrescribedFormatted
	FROM PRESCRIPTION as p
	WHERE p.PatientID = patientIdent
	ORDER BY DatePrescribed;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_tests_for_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `list_tests_for_patient`(
IN PatientIdent int(9)
)
BEGIN

 select *, DATE_FORMAT(TEST.DateOfTest,'%b %d %Y') as DateOfTestFormatted
 FROM TEST
 WHERE TEST.PatientID = PatientIdent
 ORDER BY DateOfTest DESC, Type Desc;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `loginExists`(
	in theUsername nvarchar(50),
    in thePassword nvarchar(50)
)
BEGIN
		select count(*) as loginSuccess
        from login as l
        where l.username = theUsername and l.password = thePassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_appointment`(
	in newDate date, 
    in newPurpose varchar(60),
    in newDoctorID int(9),
    in newPatientID int(9),
    in newTimeSlot varchar(2)
)
BEGIN

	insert into APPOINTMENT(Date, PurposeOfVisit, DoctorID, PatientID, TimeSlot)
    values (newDate, newPurpose, newDoctorID, newPatientID, newTimeSlot);

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_appointment_existingPatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_appointment_existingPatient`(
	in newDate date, 
    in newPurpose varchar(60),
    in theUserName varchar(45),
    in newTimeSlot int(9)
)
BEGIN

	declare patientUserExists int default 0;
	declare newPatientID int(9) default 0;
	declare newDoctorID int(9) default 0;

    select count(*) into patientUserExists
	from PATIENT as p
	where p.username = theUserName;
    
    if patientUserExists > 0 then 
    
		select PatientID into newPatientID
		from PATIENT
		where username = theUserName;
        
		select a.AssignedDoctor into newDoctorID
		from PATIENT as a
		where a.PatientID = newPatientID;

		insert into APPOINTMENT(Date, PurposeOfVisit, DoctorID, PatientID, TimeSlot)
		values (newDate, newPurpose, newDoctorID, newPatientID, newTimeSlot);
        
	end if;

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_appointment_userName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_appointment_userName`(
	in newDate date, 
    in newPurpose varchar(60),
    in newDoctorID int(9),
    in theUserName varchar(45),
    in newTimeSlot int(9)
)
BEGIN

	declare patientUserExists int default 0;
	declare newPatientID int(9) default 0;
    
    select count(*) into patientUserExists
	from PATIENT as p
	where p.username = theUserName;
    
    if patientUserExists > 0 then 
    
		select PatientID into newPatientID
		from PATIENT
		where username = theUserName;

		insert into APPOINTMENT(Date, PurposeOfVisit, DoctorID, PatientID, TimeSlot)
		values (newDate, newPurpose, newDoctorID, newPatientID, newTimeSlot);
        
	end if;

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_diagnosis` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_diagnosis`(
    in newDiagnosisById int(9),
    in newPatientID int(9),
    in newDiagnosis varchar(60),
    in newTreatmentPlan varchar(60)
)
BEGIN

	insert into DIAGNOSIS(DateOfDiagnosis, Diagnosis, TreatmentPlan, DiagnosisByID, PatientID)
    values (CURDATE(), newDiagnosis, newTreatmentPlan, newDiagnosisById, newPatientID);

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_doctor2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_doctor2`(
	in newFname varchar(15),
    in newMinit char(1),
    in newLname varchar(15),
    in newAddress nvarchar(90),
    in newSpecialty varchar(45),
    in newPhone varchar(12),
    in newUsername varchar(45),
    in newPassword nvarchar(20),
    in newEmail varchar(60)
)
BEGIN
	declare existCheck int default(0);
    
    select count(*) into existCheck 
    from login where login.username = newUsername;
    
    if existCheck = 0 then
	
    insert into login(username, password, type)
    values (newUsername, newPassword, 'Doctor');
    
	insert into DOCTOR(Fname, Minit, Lname, Address, Specialty, Phone, username, email)
    values (newFname, newMinit, newLname, newAddress, newSpecialty, newPhone, newUserName, newEmail);
    

        
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_patient`(
	in newFname varchar(15), -- Not NULL
    in newMinit char(1),
    in newLname varchar(15), -- Not NULL
    in newAddress nvarchar(90),
    in newSSN int(9), 
    in newDOB date,         -- Not NULL
    in newHIN varchar(60),
    in newAlle varchar(60),
    in newCondi varchar(60),
    in newGender enum('M','F'),
    in newPhone varchar(12),
    in newUsername varchar(45), -- Not NULL
    in newPassword varchar(45), -- Not NULL
    in newEmail varchar(60)
)
BEGIN
	declare existCheck int default(0);
    
    select count(*) into existCheck 
    from login where login.username = newUsername;
    
    if existCheck = 0 then
    
        insert into login(username, password, type)
		values (newUsername, newPassword, 'Patient');
        
		insert into PATIENT(Fname, Minit, Lname, Address,
                    SSN, DateOfBirth, HealthInsurance, 
                    Allergies, Conditions, Gender, Phone, username, email )
		values (newFname, newMinit, newLname, newAddress, newSSN,
                newDOB, newHIN, newAlle, newCondi, 
                newGender, newPhone, newUsername, newEmail);

    
		select 'Patient created successfully.';
    
    else 
		select 'Username exists.';
    
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_prescription`(
    in newMedicineName varchar(30),
    in newStrength varchar(30),
    in newAmount varchar(30),
    in newFrequency varchar(30),
    in newRoute varchar(30),
    in newRefillsLeft int(9),
    in newPatientID int(9),
    in newPrescriberID int(9)
)
BEGIN

	INSERT INTO PRESCRIPTION(DatePrescribed, MedicineName, Strength,
                          Amount, Frequency, Route, RefillsLeft, PatientID, PrescriberID)
	VALUES(CURDATE(), newMedicineName, 
           newStrength, newAmount, newFrequency, newRoute, newRefillsLeft, newPatientID, newPrescriberID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_signup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_signup`(
	in newFname varchar(15), -- Not NULL
    in newMinit char(1),
    in newLname varchar(15), -- Not NULL
    in newAddress nvarchar(90),
    in newSSN int(9), 
    in newDOB date,         -- Not NULL
    in newGender enum('M','F'),
    in newPhone varchar(12),
    in newUsername varchar(45), -- Not NULL
    in newPassword varchar(45), -- Not NULL
	in newDoctorID int(9) -- Not NULL

)
BEGIN
	declare existCheck int default(0);
    
    select count(*) into existCheck 
    from login where login.username = newUsername;
    
    if existCheck = 0 then
    
        insert into login(username, password, type)
		values (newUsername, newPassword, 'Patient');
        
		insert into PATIENT(Fname, Minit, Lname, Address,
                    SSN, DateOfBirth, 
                    Gender, Phone, username, AssignedDoctor)
		values (newFname, newMinit, newLname, newAddress, newSSN,
                newDOB,
                newGender, newPhone, newUsername, newDoctorID);

    
		select 'Patient created successfully.';
    
    else 
		select 'Username exists.';
    
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `new_test`(
	in newOrderedByID int(9),
    in newPatientID int(9),
    in newType varchar(60),
    in newResult varchar(60)
)
BEGIN

	insert into TEST(DateOfTest, Type, Results, OrderedByID, PatientID)
    values (CURDATE(), newType, newResult, newOrderedByID, newPatientID);

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `occupied_time_slots_by_date_and_doctorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `occupied_time_slots_by_date_and_doctorID`(
	in aDoctorID int(9),
    in aDate date
)
BEGIN
	select a.DoctorID, tl.TimeSlotID, tl.StartTime, tl.EndTime
    from APPOINTMENT as a inner join TIME_SLOTS as tl on a.TimeSlot = tl.TimeSlotID 
    where a.DoctorID = aDoctorID and a.Date = aDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `occupied_time_slots_by_date_and_doctorID2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `occupied_time_slots_by_date_and_doctorID2`(
    in theUserName varchar(45),
    in aDate date
)
BEGIN
	declare patientUserExists int default 0;
	declare newDoctorID int(9) default 0;

    select count(*) into patientUserExists
	from PATIENT as p
	where p.username = theUserName;
    
    if patientUserExists > 0 then 

		select p.AssignedDoctor into newDoctorID
		from PATIENT as p
		where p.username = theUserName;
		
        select a.DoctorID, tl.TimeSlotID, tl.StartTime, tl.EndTime
		from APPOINTMENT as a inner join TIME_SLOTS as tl on a.TimeSlot = tl.TimeSlotID 
		where a.DoctorID = newDoctorID and a.Date = aDate;

	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `past_appointment_by_patientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `past_appointment_by_patientID`(
	IN aPatientID int(9)
)
BEGIN

	select * 
	from APPOINTMENT as a INNER JOIN PATIENT as p ON a.PatientID = p.PatientID
	where a.PatientID = aPatientID and a.Date < CURDATE()
    ORDER BY a.Date;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_details_by_patientID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `patient_details_by_patientID`(
	IN aPatientID int(9)
)
BEGIN
	select *
    from PATIENT as p
    where p.PatientID = aPatientID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `patient_seen_thismonth_by_doctorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `patient_seen_thismonth_by_doctorID`(
	IN aDoctorID int(9)
)
BEGIN
	select p.Fname, p.Minit, p.Lname
	from PATIENT as p, APPOINTMENT as a
	where a.DoctorID = aDoctorID and a.Date >= (CURDATE() - INTERVAL 1 MONTH);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prescription_by_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `prescription_by_patient`(
	IN aPatientID int(9)
)
BEGIN
	select *
    from PRESCRIPTION as p
    where p.PatientID = aPatientID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `requestPatientInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `requestPatientInfo`(
	in theFname varchar(15),
    in theLname varchar(15),
    in thePatientID int(9)
)
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unoccupied_time_slots_by_date_and_doctorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `unoccupied_time_slots_by_date_and_doctorID`(
	in aDoctorID int(9),
    in aDate date
)
BEGIN

	declare openCount int default(0);
	declare validDate date;

	select DATE(aDate) into validDate;
    
    if(validDate >= CURDATE()) then

		SELECT  COUNT(*) into openCount
		FROM TIME_SLOTS
		WHERE TimeSlotID NOT IN ( 
	
			SELECT TimeSlot
			FROM APPOINTMENT as a
			WHERE a.Date = aDate AND a.DoctorID = aDoctorID
    
		);
   
   
		if (openCount > 0) then

			SELECT  TimeSlotID, StartTime, EndTime, DATE_FORMAT(StartTime,'%h:%i %p') as StartTimeFormatted
			FROM TIME_SLOTS
			WHERE TimeSlotID NOT IN ( 
	
				SELECT TimeSlot
				FROM APPOINTMENT as a
				WHERE a.Date = aDate AND a.DoctorID = aDoctorID
    
			);
	
		else
			select 'No time slots open on that date for your doctor.';
        
		end if;
	else
		select 'Date is not valid.';
        
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unoccupied_time_slots_by_date_and_patientUserName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `unoccupied_time_slots_by_date_and_patientUserName`(
    in patUserName varchar(45),
    in aDate date
)
BEGIN


	declare patientUserExists int default 0;
	declare searchDoctorID int(9) default 0;

    select count(*) into patientUserExists
	from PATIENT as p
	where p.username = patUserName;
    
    if patientUserExists > 0 then 

		select p.AssignedDoctor into searchDoctorID
		from PATIENT as p
		where p.username = patUserName;
		
        SELECT  TimeSlotID, StartTime, EndTime 
		FROM TIME_SLOTS
		WHERE TimeSlotID NOT IN ( 
	
			SELECT TimeSlot
			FROM APPOINTMENT as a
			WHERE a.Date = aDate AND a.DoctorID = searchDoctorID
    
		);


	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unoccupied_time_slots_by_date_and_patientUserName2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `unoccupied_time_slots_by_date_and_patientUserName2`(
    in patUserName varchar(45),
    in aDate date
)
BEGIN


	declare patientUserExists int default 0;
	declare searchDoctorID int default 0;
	declare openCount int default(0);
	declare validDate date;

	select DATE(aDate) into validDate;
    
    if(validDate >= CURDATE()) then

		select count(*) into patientUserExists
		from PATIENT as p
		where p.username = patUserName;
		
        if patientUserExists > 0 then
        
			select p.AssignedDoctor into searchDoctorID
			from PATIENT as p
			where p.username = patUserName;
        
			SELECT  COUNT(*) into openCount
			FROM TIME_SLOTS
			WHERE TimeSlotID NOT IN ( 
		
				SELECT TimeSlot
				FROM APPOINTMENT as a
				WHERE a.Date = aDate AND a.DoctorID = searchDoctorID
		
			);
	   
   
			if (openCount > 0) then


			
				SELECT  TimeSlotID, StartTime, EndTime 
				FROM TIME_SLOTS
				WHERE TimeSlotID NOT IN ( 
		
					SELECT TimeSlot
					FROM APPOINTMENT as a
					WHERE a.Date = aDate AND a.DoctorID = searchDoctorID
		
				);
			else
				select 'No time slots open on that date for your doctor.';
			end if;
		else
			select 'Not a valid patient user name.';
		end if;
    else
		select 'Date is not valid.';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userExist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `userExist`(
	in theUsername nvarchar(50),
    in thePassword nvarchar(50),
    out exist int
)
BEGIN
		select count(*) into exist
        from login as l
        where l.username = theUsername and l.password = thePassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userExist2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`apshaju`@`%` PROCEDURE `userExist2`(
	in theUsername nvarchar(45)
)
BEGIN
		select count(*) as userExistsAlready
        from login as l
        where l.username = theUsername;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-15 23:07:25
