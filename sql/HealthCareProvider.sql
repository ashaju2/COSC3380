-- ------------------------------------------------------
-- Database: HealthCareProvider
-- ------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 0;
/*
----------------------------------------------------------------------------------------------------------------------------------
Table for Doctor Relation

*/
DROP TABLE IF EXISTS  DOCTOR ;
--
CREATE TABLE  DOCTOR   (
   Fname                         varchar(15)             NOT NULL                              ,	-- First Name
   Minit                         char(1)                 DEFAULT NULL                          ,  -- Middle Initial
   Lname                        varchar(15)             NOT NULL                              ,  -- Last Name
   Address                       varchar(60)             DEFAULT NULL                          ,  -- Address
   DoctorID                      int(9)                  NOT NULL                AUTO_INCREMENT,  -- Primary Key
   NPI                           int(9)                  NOT NULL                              ,  -- National Provider ID
   StateLicenseNumber            int(9)                  DEFAULT NULL                          ,  -- State License Number
   StateOfLicense                char(2)                 DEFAULT NULL                          ,  -- State of State License Number
   Specialty                     varchar(45)             DEFAULT NULL                          ,  -- Specialty
   PrimaryPhysician              tinyint(4)              DEFAULT NULL                          ,  -- Primary Physicial Boolean
   Phone                         int(9)                  DEFAULT NULL                          ,  -- Phone Number

  PRIMARY KEY ( DoctorID ),                                    -- Primary Key is DoctorID
  UNIQUE ( StateOfLicense , StateLicenseNumber ),              -- NPI is unique
  UNIQUE ( NPI )                                               -- NPI is unique

) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*

Data for Doctor Relation

*/
--
LOCK TABLES   DOCTOR   WRITE;
UNLOCK TABLES;
--
/*
----------------------------------------------------------------------------------------------------------------------------------
Table for Patient Relation

*/
DROP TABLE IF EXISTS  PATIENT ;
--
CREATE TABLE  PATIENT   (
   Fname                         varchar(15)             NOT NULL                              ,	-- First Name
   Minit                         char(1)                 DEFAULT NULL                          ,  -- Middle Initial
   Lname                         varchar(15)             NOT NULL                              ,  -- Last Name
   Address                       varchar(60)             DEFAULT NULL                          ,  -- Address
   PatientID                     int(9)                  NOT NULL                AUTO_INCREMENT,  -- Primary Key
   HRN                           int(9)                  DEFAULT NULL                          ,  -- Health Record Number
   SSN                           int(9)                  DEFAULT NULL                          ,  -- Social Security Number
   PreviousSurgery               tinyint(4)              DEFAULT NULL                          ,  -- Previous Surgery Boolean
   DateOfBirth                   date                    NOT NULL                              ,  -- Date of Birth
   HealthInsuranceName           varchar(60)             DEFAULT NULL                          ,  -- Health Insurance Name
   HasInsurance                  tinyint(4)              DEFAULT NULL                          ,  -- Has Insurance Boolean
   Allergies                     varchar(60)             DEFAULT NULL                          ,  -- Allergies
   Conditions                    varchar(60)             DEFAULT NULL                          ,  -- Conditions
   Ethnicity                     varchar(15)             DEFAULT NULL                          ,  -- Ethnicity
   Race                          varchar(15)             DEFAULT NULL                          ,  -- Race
   Gender                        varchar(15)             DEFAULT NULL                          ,  -- Gender
   Phone                         int(9)                  DEFAULT NULL                          ,  -- Phone Number
   PrimaryDoctor                 int(9)                  NOT NULL                              ,  -- Primary Doctor ID

  PRIMARY KEY ( PatientID ),                                 -- Primary Key is PatientID
  UNIQUE ( HRN ),                                            -- HRN is unique
  UNIQUE ( SSN ),                                            -- SSN is unique
  FOREIGN KEY ( PrimaryDoctor )  REFERENCES DOCTOR( DoctorID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for Patient Relation

*/
--
LOCK TABLES   PATIENT   WRITE;
UNLOCK TABLES;
/*
----------------------------------------------------------------------------------------------------------------------------------
Table for TEST Relation

*/
DROP TABLE IF EXISTS  TEST ;
--
CREATE TABLE  TEST   (
   TestID                        int(9)                  NOT NULL                AUTO_INCREMENT,  -- Primary Key
   DateOfTest                    date                    NOT NULL                              ,  -- Date of Test
   TimeOfTest                    time                    NOT NULL                              ,  -- Time of Test
   Image                         varchar(60)             DEFAULT NULL                          ,  -- Image Path
   Type                          varchar(60)             DEFAULT NULL                          ,  -- Type of Test
   Interpretation                varchar(60)             DEFAULT NULL                          ,  -- Test Interpretation
   Results                       varchar(60)             DEFAULT NULL                          ,  -- Test Results
   OrderedByID                   int(9)                  NOT NULL                              ,  -- Doctor who ordered test
   InterpretedByID               int(9)                  NOT NULL                              ,  -- Doctor who interpreted test
   PatientID                     int(9)                  NOT NULL                              ,  -- Patient who was subject of test

  PRIMARY KEY ( TestID ),
  FOREIGN KEY ( OrderedByID )      REFERENCES DOCTOR( DoctorID ),
  FOREIGN KEY ( InterpretedByID )  REFERENCES DOCTOR( DoctorID ),
  FOREIGN KEY ( PatientID )        REFERENCES PATIENT( PatientID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for TEST Relation

*/
--
LOCK TABLES   TEST   WRITE;
UNLOCK TABLES;
/*
----------------------------------------------------------------------------------------------------------------------------------
Table for OFFICE Relation

*/
DROP TABLE IF EXISTS  OFFICE ;
--
CREATE TABLE  OFFICE   (
   OfficeID                      int(9)                  NOT NULL                AUTO_INCREMENT,  -- Primary Key
   Phone                         int(9)                  DEFAULT NULL                          ,  -- Office Phone Number
   Address                       varchar(60)             DEFAULT NULL                          ,  -- Address

  PRIMARY KEY ( OfficeID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for OFFICE Relation

*/
--
LOCK TABLES   OFFICE   WRITE;
UNLOCK TABLES;
/*
----------------------------------------------------------------------------------------------------------------------------------
Table for APPOINTMENT Relation

*/
DROP TABLE IF EXISTS  APPOINTMENT ;
--
CREATE TABLE  APPOINTMENT   (
   AppointmentID                 int(9)                  NOT NULL                AUTO_INCREMENT,  -- Primary Key
   Date                          date                    DEFAULT NULL                          ,  -- Appointment Date
   Time                          time                    DEFAULT NULL                          ,  -- Appointment Time
   PurposeOfVisit                varchar(60)             DEFAULT NULL                          ,  -- Address
   AppointmentLocation           int(9)                  NOT NULL                              ,  -- OfficeID of appointment
   DoctorID                      int(9)                  NOT NULL                              ,  -- DoctorID of appointment
   PatientID                     int(9)                  NOT NULL                              ,  -- PatientID of appointment

  PRIMARY KEY ( AppointmentID ),
  FOREIGN KEY ( AppointmentLocation )  REFERENCES OFFICE( OfficeID ),
  FOREIGN KEY ( DoctorID )             REFERENCES DOCTOR( DoctorID ),
  FOREIGN KEY ( PatientID )            REFERENCES PATIENT( PatientID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for APPOINTMENT Relation

*/
--
LOCK TABLES   APPOINTMENT   WRITE;
UNLOCK TABLES;
/*
----------------------------------------------------------------------------------------------------------------------------------
Table for WORKS_AT Relation

*/
DROP TABLE IF EXISTS  WORKS_AT ;
--
CREATE TABLE  WORKS_AT   (
   DayOfWeek                     varchar(9)              NOT NULL                              ,  -- Day of Week Doctor works at Office
   DoctorID                      int(9)                  NOT NULL                              ,  -- DoctorID
   OfficeID                      int(9)                  NOT NULL                              ,  -- OfficeID

  FOREIGN KEY ( DoctorID ) REFERENCES DOCTOR( DoctorID ),
  FOREIGN KEY ( OfficeID ) REFERENCES OFFICE( OfficeID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for WORKS_AT Relation

*/
--
LOCK TABLES   WORKS_AT   WRITE;
UNLOCK TABLES;
/*
----------------------------------------------------------------------------------------------------------------------------------
Table for ASSIGNED_TO Relation

*/
DROP TABLE IF EXISTS  ASSIGNED_TO ;
--
CREATE TABLE  ASSIGNED_TO   (
   DoctorID                      int(9)                  NOT NULL                              ,  -- DoctorID
   PatientID                     int(9)                  NOT NULL                              ,  -- PatientID

  FOREIGN KEY ( DoctorID )  REFERENCES DOCTOR( DoctorID ),
  FOREIGN KEY ( PatientID ) REFERENCES PATIENT( PatientID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for ASSIGNED_TO Relation

*/
--
LOCK TABLES   ASSIGNED_TO   WRITE;
UNLOCK TABLES;

/*
----------------------------------------------------------------------------------------------------------------------------------
Table for PRESCRIPTION Relation

*/
DROP TABLE IF EXISTS  PRESCRIPTION ;
--
CREATE TABLE  PRESCRIPTION   (
   PrescriptionID                int(9)                  NOT NULL                AUTO_INCREMENT,  -- PrescriptionID
   Pharmacy                      varchar(30)             DEFAULT NULL                          ,  -- Pharmacy Name
   PharmacyPhone                 int(9)                  DEFAULT NULL                          ,  -- Pharmacy Phone number
   DatePrescribed                date                    DEFAULT NULL                          ,  -- Date Prescribed
   DateLastFilled                date                    DEFAULT NULL                          ,  -- Date Last Filled
   Strength                      varchar(30)             DEFAULT NULL                          ,  -- Strength
   Amount                        varchar(30)             DEFAULT NULL                          ,  -- Amount
   Frequency                     varchar(30)             DEFAULT NULL                          ,  -- Frequency
   Route                         varchar(30)             DEFAULT NULL                          ,  -- Route like Oral, Topical, etc.
   SideEffects                   varchar(60)             DEFAULT NULL                          ,  -- Side Effects
   RefillsLeft                   int(9)                  DEFAULT NULL                          ,  -- Number of Refills left
   PatientID                     int(9)                  NOT NULL                              ,  -- PatientID
   PrescriberID                  int(9)                  NOT NULL                              ,  -- Doctor that Prescribed

  PRIMARY KEY ( PrescriptionID ),
  FOREIGN KEY ( PatientID )     REFERENCES PATIENT( PatientID ),
  FOREIGN KEY ( PrescriberID )  REFERENCES DOCTOR( DoctorID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for PRESCRIPTION Relation

*/
--
LOCK TABLES   PRESCRIPTION   WRITE;
UNLOCK TABLES;

/*
----------------------------------------------------------------------------------------------------------------------------------
Table for DIAGNOSIS Relation

*/
DROP TABLE IF EXISTS  DIAGNOSIS ;
--
CREATE TABLE  DIAGNOSIS   (
   DiagnosisID                   int(9)                  NOT NULL                AUTO_INCREMENT,  -- DiagnosisID
   DateOfDiagnosis               date                    DEFAULT NULL                          ,  -- Date of Diagnosis
   Diagnosis                     varchar(60)             DEFAULT NULL                          ,  -- Diagnosis in words
   TreatmentPlan                 varchar(60)             DEFAULT NULL                          ,  -- Description Of Treatment Plan
   DiagnosisByID                 int(9)                  NOT NULL                              ,  -- Diagnosed by Doctor
   PatientID                     int(9)                  NOT NULL                              ,  -- Patient Diagnosed

  PRIMARY KEY ( DiagnosisID ),
  FOREIGN KEY ( PatientID )      REFERENCES PATIENT( PatientID ),
  FOREIGN KEY ( DiagnosisByID )  REFERENCES DOCTOR( DoctorID )

) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*

Data for DIAGNOSIS Relation

*/
--
LOCK TABLES   DIAGNOSIS   WRITE;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS = 1;
/*
----------------------------------------------------------------------------------------------------------------------------------
End of Database Definition for HealthCareProvider

*/
