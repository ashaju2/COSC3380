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
  console.log('My name is: ' + user + ' and my job is: ' + password);
  
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
    console.log("login unsuccessful");}
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
