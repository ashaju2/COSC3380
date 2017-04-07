var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var path = require('path');
var http = require('http');
var app = express();

app.use(express.static('./client/build'));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));





app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, './client/build', 'index.html'));
})
var server = http.createServer(app);
server.listen(3000, 'localhost');
server.on('listening', function() {
    console.log('Express server started on port %s at %s', server.address().port, server.address().address);
});
var connection = mysql.createConnection({
  host     : 'cosc3380.cxynx1tgvjja.us-west-2.rds.amazonaws.com',
  user     : 'apshaju',
  password : '12345678',
  port     : '3306',
  database : 'cosc3380',
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
  console.log(req.body);
  var user = req.body.username;
  var job = req.body.password;
  // Do a MySQL query.
  console.log('My name is: ' + user + ' and my job is: ' + job);
  


    // var sql="DELETE FROM DOCTOR WHERE Fname = ?"
    // connection.query(sql,[user],function(err,result){
        
    //     if(err)throw err;
    //     console.log('Data deleted \n');
    //     console.log(result);
        
    // });

    //app.post()
    // connection.query('INSERT INTO DOCTOR (Fname,Minit,Lname,Address,NPI,StateLicenseNumber,StateOfLicense,Specialty,PrimaryPhysician,Phone,username) VALUES(?,?,?,?,?,?,?,?,?,?)',['Alen','M','Rodriguez','123 Fake Street','717835421','123456789','TX','Gastroenterologist','9999','123987654',user],function(err, result){
    //     if(err) throw err;
    // console.log('Inserted data \n');
    
});



