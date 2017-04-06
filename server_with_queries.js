var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var path = require('path');
var app = express();

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

// Listen to POST requests to /users.
app.post('/', function(req, res) {
    console.log('I have posted');
    // Get sent data.
    var user = req.param('username');
    var password = req.param('password');
    // Do a MySQL query.
    console.log('The usernname was: ' + user + ' and the password was: ' + password);


    //Determine if username and password exist as a combination in login table in database, This is working
    var loginSuccessful;
    connection.query('CALL loginExists(?,?)', [user, password], function(err, rows, fields){ //Does username exist already
          loginSuccessful = rows[0][0].loginSuccess;
          if (loginSuccessful === 1) console.log("login successful");
          else console.log("login unsuccessful");});
          //console.log(loginSuccessful);});

    //Get the list of patients for the doctor who has logged in, This is working
    //First Get DoctorID of Doctor with username user
    connection.query('SELECT DOCTOR.DoctorID FROM DOCTOR where DOCTOR.username = ?',[user],function(err, results){ //reading back data that i inserted
          if(err) return console.log(err);
          var loginDoctorID = parseInt(results[0].DoctorID);
          console.log("loginDoctorID type: ", typeof loginDoctorID);
          console.log(loginDoctorID);
          //Second query using DoctorID to look up patients assigned to to doctor
          connection.query('CALL CLINIC.list_patients_for_doctor( ? )', [loginDoctorID], function(err, rows){
                // -- ouput fields are
                // -- Doctor
                // -- PatientID
                // -- Lname
                // -- Minit
                // -- Fname
                // -- DateOfBirth
                // -- Allergies
                // -- Conditions
                // -- Phone
                if(err) return console.log(err);
                console.log("Listing patients for doctor ", loginDoctorID);
                //rows[0] are RowDataPackets and rows[1] is the OkPacket
                for (var i = 0; i < rows[0].length; i++) {
                  var row = rows[0][i];
                  var rowString = JSON.stringify(row);
                  console.log(rowString);
                }
          });
    });

     //Insert new doctor, works like it is
    //  connection.query('call CLINIC.new_doctor2(?, ?, ?, ?, ?, ?, ?, ?, ?)',
    //                 ['Fnam2',
    //                 'M',
    //                 'Ln2',
    //                 'Ad2',
    //                 900002,
    //                 'Spec1',
    //                 '444-44-2132',
    //                 'new2',
    //                 '12345678'],
    //                 function(err, results){
    //                if(err) return console.log(err);
    //                console.log("Creating new doctor.");});

 res.json(user);
});
