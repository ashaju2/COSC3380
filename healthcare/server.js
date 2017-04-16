var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var path = require('path');
var app = express();
var puser = '';
var duser = '';
var date = '';
var PatientID = '';
var DoctorID = '';
// const nodemailer = require('nodemailer');
// var CronJob = require('cron').CronJob;
 
// // Create a SMTP transporter object
// let transporter = nodemailer.createTransport({
//     host: 'smtp.gmail.com',
//     port: 465,
//     secure: true,
//     auth: {
//         user: 'Healthcareautoresponse',
//         pass: 'grep1671'
//     },
    
// });


app.set('port', (process.env.PORT || 3001));

app.use(express.static('./client/build'));
app.use(bodyParser.json());

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, './client/build', 'index.html'));
})

app.listen(app.get('port'), function () {
  console.log('Example app listening on port 3001!')
})

var connection = mysql.createConnection({
  host     : 'cosc3380.cxynx1tgvjja.us-west-2.rds.amazonaws.com',
  user     : 'apshaju',
  password : '12345678',
  port     : '3306',
  database : 'CLINIC',
  //debug: true
});

connection.connect(function(err) {
  if (err) return console.log(err);
  console.log('Connected to RDS!');
});

// var job = new CronJob({
//   cronTime: '00 39 20 * * 1-7',
//   onTick: function() {
//     connection.query('call CLINIC.appointment_email_alert()',[],function(err,rows,fields){
//         if(err)console.log(err);
         
         
//         for(var i=0;i<rows[0].length;i++ )
//             var email=rows[0][i].email;
//             console.log(email);
         
         
         
//         let mailOptions = {
             
     
//     from: '"Clinic 👻" <Healthcareautoresponse@gmail.com>', // sender address
//     to: email, // list of receivers
//     subject: 'Appointment ✔', // Subject line
//     text: 'You have an appointment today', // plain text body
//     html: '<b>You have an appointment today /b>' // html body
//     };
 
// // send mail with defined transport object
// transporter.sendMail(mailOptions, (error, info) => {
//     if (error) {
//         return console.log(error);
//     }
//     console.log('Message %s sent: %s', info.messageId, info.response);
// });
//     });
//   },
//   start: false,
//   timeZone: 'America/Chicago'
// });
// job.start();



/**********************************************************
      Doctor Login
**********************************************************/

// Listen to POST requests to /users.
app.post('/doctorLogin', function(req, res) {
    console.log('I have posted');
  // Get sent data.
  user = req.param('username');
  var password = req.param('password');
  // Do a MySQL query.
  console.log('My name is: ' + user + ' and my password is: ' + password);
  
//Determine if username and password exist as a combination in login table in database, This is working
//Also determine type of user: 1 = Doctor; 2 = Patient; 3 = Admin; 0 = not in database
var loginSuccessful = 0;
var userType = "does_not_exist";
var userTypeInt = 0;
connection.query('CALL loginExists(?,?)', [user, password], function(err, rows, fields){ //Does username exist already
  loginSuccessful = rows[0][0].loginSuccess;
  if (loginSuccessful === 1){ 
    console.log("login successful"); }
  else {
    console.log("login unsuccessful");
    res.json(userTypeInt);
}
  if(loginSuccessful === 1)
  {
    connection.query('CALL CLINIC.getUserType( ? )', [user], function(err, rows){
      // -- ouput fields are
    // -- type (varchar)
    userType = rows[0][0].type;
    if(err) {
      return console.log(err);
    }
    if(userType == "Doctor") {
      userTypeInt = 1;
    }
    else if (userType == "Patient") {
      userTypeInt = 2;
    }
    else if (userType == "Admin") {
      userTypeInt = 3;
    }
    console.log("Type of user: ", userType);
    console.log("The userTypeInt is ", userTypeInt);

    res.json(userTypeInt);
      });
    }
  });
  connection.query('call CLINIC.get_DoctorID_from_docUsername(?)', [user], function(err, rows){
      DoctorID = rows[0][0].DoctorID;
      console.log(DoctorID);
    });
  }); 


/*****************************************
 Patient Login
****************************************/ 


// Listen to POST requests to /users.
app.post('/patientLogin', function(req, res) {
    console.log('I have posted');
  // Get sent data.
  puser = req.param('username');
  var password = req.param('password');
  // Do a MySQL query.
  console.log('My name is: ' + puser + ' and my password is: ' + password);
  
//Determine if username and password exist as a combination in login table in database, This is working
//Also determine type of user: 1 = Doctor; 2 = Patient; 3 = Admin; 0 = not in database
var loginSuccessful = 0;
var userType = "does_not_exist";
var userTypeInt = 0;
connection.query('CALL loginExists(?,?)', [puser, password], function(err, rows, fields){ //Does username exist already
  loginSuccessful = rows[0][0].loginSuccess;
  if (loginSuccessful === 1){ 
    console.log("login successful"); }
  else {
    console.log("login unsuccessful");
    res.json(userTypeInt);
}
  if(loginSuccessful === 1)
  {
    connection.query('CALL CLINIC.getUserType( ? )', [puser], function(err, rows){
      // -- ouput fields are
    // -- type (varchar)
    userType = rows[0][0].type;
    if(err) {
      return console.log(err);
    }
    if(userType == "Doctor") {
      userTypeInt = 1;
    }
    else if (userType == "Patient") {
      userTypeInt = 2;
    }
    else if (userType == "Admin") {
      userTypeInt = 3;
    }
    console.log("Type of user: ", userType);
    console.log("The userTypeInt is ", userTypeInt);

    res.json(userTypeInt);
      });
    }
  });
    connection.query('call CLINIC.get_PatientID_from_patUsername(?)', [puser], function(err, rows){
      PatientID = rows[0][0].PatientID;
      console.log(PatientID);  
    })
  }); 


/*******************************************
 Doctor Report Page
********************************************/

  app.post('/report', function(req, res) {
    console.log('I have new posted');
  // Get sent data.
  var firstName = req.param('firstName');
  var lastName = req.param('lastName');
  var patientID = req.param('patientID');
  // Do a MySQL query.
  console.log('Patient First name is: ' + firstName + ' and Last Name  is: ' + lastName + 'patientID is' + patientID);

  connection.query('SELECT PATIENT.* FROM PATIENT where PATIENT.PatientID = ?',[patientID],function(err,results){ //reading back data that i inserted 
        console.log(results[0].PatientID);
        console.log(results[0].Fname);
        console.log(results[0].Minit);
        console.log(results[0].Lname);
        console.log(results[0].DateOfBirth);
        console.log(results[0].Allergies);
        console.log(results[0].Conditions);
        console.log(results[0].Gender);
        
        res.json(results[0]);
  });

  });

/*******************************************
 Doctor Appointment setup 
*******************************************/


app.post('/DocAppointment', function(req, res) {
    console.log('I have new posted 2');
  // Get sent data.
  var selectedOption = req.param('selectedOption');
  // Do a MySQL query.
  console.log('Patient request accepted or not is: ' + selectedOption);
});


/*******************************************
 Doctor Appointment Time Slot 
*******************************************/


app.post('/DocAppointmentTimeSlot', function(req, res) {
    console.log('I have new posted Time Slot');
  // Get sent data.
  date = req.param('appointDate');
  console.log(date);
  connection.query('call CLINIC.list_doctors_assigned_to_patient(?)', [PatientID], function(err, rows){
  if(err)console.log(err);
  DoctorID = rows[0][0].DoctorID;    
  console.log(DoctorID);
  });

  connection.query('call unoccupied_time_slots_by_date_and_doctorID(?,?)',[DoctorID,date],function(err,rows){
  if(err)console.log(err);
  console.log(rows[0]);
  console.log(DoctorID);
  res.json(rows[0]);

  });
});


/*******************************************
 Patient Prescription Page
********************************************/

app.get('/PatPrescription', function(req, res) {
    console.log('I have Patient Prescription');
  // Get sent data.
  connection.query('call CLINIC.list_prescriptions_for_patient(?)', [PatientID], function(err, rows){
  console.log(rows[0]);
  res.json(rows[0]);

  });
});


/*******************************************
 Patient Report Page List Doctor
********************************************/
app.get('/PatReportDoctor', function(req, res) {
    console.log('I have Patient Report Doctor');
  // Get sent data.
  connection.query('call CLINIC.list_doctors_assigned_to_patient(?)', [PatientID], function(err, rows){
  console.log(rows[0]);  
  
  res.json(rows[0]);

  });
});

/*******************************************
 Patient Report Page List Details
********************************************/
app.get('/PatReportDetails', function(req, res) {
    console.log('I have Patient Report Details');
  // Get sent data.
  connection.query('call CLINIC.patient_details_by_patientID(?)', [PatientID], function(err, rows){
  console.log(rows[0]);  
  
  res.json(rows[0]);

  });
});

/*******************************************
 Patient Report Page List Tests
********************************************/
app.get('/PatReportTests', function(req, res) {
    console.log('I have Patient Report Tests');
  // Get sent data.
  connection.query('call CLINIC.list_tests_for_patient(?)', [PatientID], function(err, rows){
  console.log(rows[0]);  
  
  res.json(rows[0]);

  });
});



/*******************************************
 Patient Appointment setup 
*******************************************/


app.post('/patappointment', function(req, res) {
    console.log('I have new posted 2');
  // Get sent data.
  var apptTimeSlot = req.param('TimeSlotID');
  var reason = req.param('reason');
  // Do a MySQL query.
  console.log('Patient request accepted or not is: ' + " " + apptTimeSlot + " " + date);

  connection.query('call new_appointment_existingPatient( ? , ? , ? , ? );',
  [date, reason, puser, apptTimeSlot],function(err, results){
  if(err) {
    return console.log(err);
  }
  else{
    console.log("Appointment Added.")
  res.json(1);
  }
});

});

/*******************************************
 Patient Signup (Still needs work)
********************************************/

app.post('/Signup', function(req, res) {
    console.log('I have Signed Up');
  // Get sent data.
  var firstname = req.param('firstname');
  var lastname = req.param('lastname');
  var middlename = req.param('middlename');
  var ssn = req.param('ssn');
  var phone = req.param('phone');
  var homeaddress = req.param('homeaddress');
  var dob = req.param('dob');
  var DoctorID = req.param('DoctorID');
  var gender = req.param('gender');
  var username = req.param('username');
  var password = req.param('password');
  
  // Do a MySQL query.
  console.log(username);
  console.log(lastname);
  console.log(password);

  connection.query('call new_signup(?,?,?,?,?,?,?,?,?,?,?);',
  [firstname, middlename, lastname, homeaddress, ssn, dob, gender, phone, username, password, DoctorID],function(err, results){
  if(err) {
    return console.log(err);
  }
  else{
    console.log("Patient Added.")
  res.json(1);
  }
});

});



/*******************************************
 Doctor based on DoctorType 
********************************************/
app.post('/getDoctor', function(req, res) {
  var doctorType = req.param('doctorType');

  connection.query('call CLINIC.list_doctors_by_specialty(?)', [doctorType], function(err, rows){
    if(err)console.log(err);
    console.log(rows[0]);
    res.json(rows[0]);
  });
});

/*******************************************
 Future appointments on Patient side 
********************************************/

app.get('/futureAppointment',function(req,res){

    connection.query('call CLINIC.future_appointment_by_patientID(?)',[PatientID],function(err,rows){
    if(err)console.log(err);
    console.log(rows[0]);
    var row=[];
    for(var i=0 ; i<rows[0].length; i++){
      row.push(rows[0][i]);
    }
    
    res.json(row);
  });


});

/*******************************************
 Future appointments on Doctor side 
********************************************/
app.get('/docCalendar',function(req,res){

    connection.query('call CLINIC.future_appointment_by_patientID(?)',[DoctorID],function(err,rows){
    if(err)console.log(err);
    console.log(rows[0]);
    
    res.json(rows[0]);
  });


});

/*******************************************
 Doctor listing all patientds
*******************************************/
app.get('/patientsOfDoctor', function(req, res){
  connection.query('call CLINIC.list_patients_for_doctor(?)', [DoctorID], function(err, rows){
    console.log("List of Patients for Doctor:");
    console.log(rows);
  res.json(rows[0]);
  });
});

/*******************************************
 Patient Prescription Page
********************************************/

app.get('/PatPrescriptions', function(req, res) {
    console.log('I have Patient Prescription');
  // Get sent data.
  connection.query('call CLINIC.list_prescriptions_for_patient(?)', [PatientID], function(err, rows){
  console.log(rows[0]);
  res.json(rows[0]);

  });
});

/*******************************************
 Doctor Calendar
********************************************/

app.get('/newDocCalendar', function(req, res) {
    console.log('I have Patient Prescription');
  // Get sent data.
  connection.query('call CLINIC.get_todays_Appts_Doctor(?)', [DoctorID], function(err, rows){
  console.log(rows[0]);
  res.json(rows[0]);

  });
});

/**********************************************************
      SysAdmin Login
**********************************************************/

// Listen to POST requests to /users.
app.post('/sysAdminLogin', function(req, res) {
    console.log('I have posted');
  // Get sent data.
  user = req.param('username');
  var password = req.param('password');
  // Do a MySQL query.
  console.log('My name is: ' + user + ' and my password is: ' + password);
  
//Determine if username and password exist as a combination in login table in database, This is working
//Also determine type of user: 1 = Doctor; 2 = Patient; 3 = Admin; 0 = not in database
var loginSuccessful = 0;
var userType = "does_not_exist";
var userTypeInt = 0;
connection.query('CALL loginExists(?,?)', [user, password], function(err, rows, fields){ //Does username exist already
  loginSuccessful = rows[0][0].loginSuccess;
  if (loginSuccessful === 1){ 
    console.log("login successful"); }
  else {
    console.log("login unsuccessful");
    res.json(userTypeInt);
}
  if(loginSuccessful === 1)
  {
    connection.query('CALL CLINIC.getUserType( ? )', [user], function(err, rows){
      // -- ouput fields are
    // -- type (varchar)
    userType = rows[0][0].type;
    if(err) {
      return console.log(err);
    }
    if(userType == "Doctor") {
      userTypeInt = 1;
    }
    else if (userType == "Patient") {
      userTypeInt = 2;
    }
    else if (userType == "Admin") {
      userTypeInt = 3;
    }
    console.log("Type of user: ", userType);
    console.log("The userTypeInt is ", userTypeInt);

    res.json(userTypeInt);
      });
    }
  });
  }); 

/**********************************************************
      Doctor querying patient based on patient ID
**********************************************************/

app.post('/details',function(req,res){

    PatientID = req.body.PatientID;
    connection.query('call CLINIC.patient_details_by_patientID(?)',[PatientID],function(err,rows){

    if(err)console.log(err);
    res.send(rows[0]);

  });

});

/**********************************************************
      Doctor setting patient diagnosis based on patient ID
**********************************************************/

app.post('/setPatientMedInfo',function(req,res){
     
    var newdiag = req.param('newdiag');
    var newtreat = req.param('newtreat');
     
    var Drugname = req.param('Drugname');
    var dose = req.param('dose');
    var numbPills = req.param('numbPills');
    var frequency = req.param('frequency');
    var route=req.param('route');
    var refills=req.param('refills');

    var type=req.body.NewType;
    var result=req.body.Result;
     console.log(newdiag);
    connection.query('call CLINIC.new_diagnosis(?,?,?,?) ',[DoctorID,PatientID,newdiag,newtreat],function(err,rows){
         //newDiag -> (string) description of diagnosis
         //newTreat -> (string) eg. sleep, chemo
        if(err){console.log(err); res.status(500).json({message:" Internal Server Error"});}
    });
    connection.query('call CLINIC.new_prescription(?,?,?,?,?,?,?,?)',[Drugname,dose,numbPills,frequency,route,refills,PatientID,DoctorID],function(err,rows){
        if(err){console.log(err); res.status(500).json({message:" Internal Server Error"});}
     
});
    connection.query('call CLINIC.new_test(?,?,?,?)',[DoctorID,PatientID,type,result],function(err,rows){
        //type -> blood test etc.
        //result -> result of test
        if(err){console.log(err); res.status(500).json({message:" Internal Server Error"});}
         
    });
    res.status(200).json({message:"added information"});
  });

  /*******************************************
Doctor Appointment Statistics
********************************************/
app.get('/DoctorStats', function(req, res) {
    console.log('These are the Doctor Stats');
  // Get sent data.
  connection.query('call CLINIC.list_all_doctors()', [], function(err, rows){
  console.log(rows[0]);

  res.json(rows[0]);

  });
});

