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
  
  var loginSuccessful = 0;
  connection.query('CALL loginExists(?,?)', [user, password], function(err, rows, fields){ //Does username exist already
      loginSuccessful = rows[0][0].loginSuccess;
      console.log(loginSuccessful);
       res.json(loginSuccessful);
    });
    console.log(loginSuccessful);
    connection.query('SELECT DOCTOR.* FROM DOCTOR where DOCTOR.username = ?',[user],function(err,results){ //reading back data that i inserted 
          console.log(results[0].Fname);
          console.log(results[0].Minit);
          console.log(results[0].Lname);
          console.log(results[0].Address);
          console.log(results[0].Specialty);
          console.log(results[0].Phone);
});


});
