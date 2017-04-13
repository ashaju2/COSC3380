var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var path = require('path');
var app = express();
var puser = '';
var duser = '';
var date = '';

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
    // console.log(79, loginSuccessful);
    // connection.query('SELECT DOCTOR.* FROM DOCTOR where DOCTOR.username = ?',[user],function(err,results){ //reading back data that i inserted 
    //       console.log(results[0].Fname);
    //       console.log(results[0].Minit);
    //       console.log(results[0].Lname);
    //       console.log(results[0].Address);
    //       console.log(results[0].Specialty);
    //       console.log(results[0].Phone);
    // });
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
  connection.query('call unoccupied_time_slots_by_date_and_patientUserName(?,?)',[puser,date],function(err,rows){
  if(err)console.log(err);
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