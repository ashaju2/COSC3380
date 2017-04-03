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

app.get('/user', function (req, res) {
    
  res.sendFile(path.join(__dirname, './client/build', 'index.html'));
})

app.listen(app.get('port'), function () {
  console.log('Example app listening on port 3000!')
})

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
  var user = req.param('name');
  var job = req.param('job');
  // Do a MySQL query.
  console.log('My name is: ' + user + ' and my job is: ' + job);
  

// var sql="DELETE FROM DOCTOR WHERE Fname = ?"
// connection.query(sql,['Alen'],function(err,result){
	
// 	if(err)throw err;
// 	console.log('Data deleted \n');
// 	console.log(result);
	
// });

// var sql="DELETE FROM DOCTOR WHERE Fname = ?"
// connection.query(sql,['Matthew'],function(err,result){
	
// 	if(err)throw err;
// 	console.log('Data deleted \n');
// 	console.log(result);
	
// });
// //app.post()
// connection.query('INSERT INTO DOCTOR (Fname,Minit,Lname,Address,NPI,StateLicenseNumber,StateOfLicense,Specialty,PrimaryPhysician,Phone) VALUES(?,?,?,?,?,?,?,?,?,?)',['Matthew','M','Rodriguez','123 Fake Street','717835421','123456789','TX','Gastroenterologist','9999','123987654'],function(err, result){
// 	 if(err) throw err;
//  console.log('Inserted data \n');
// 	connection.query('SELECT * FROM DOCTOR',function(err,results){ //reading back data that i inserted 
// 	    console.log(results[0].Fname);
//         console.log(results[0].Minit);
//         console.log(results[0].Lname);
// 		console.log(results[0].Address);
//         console.log(results[0].NPI);
//         console.log(results[0].StateLicenseNumber);
//         console.log(results[0].StateOfLicense);
// 		console.log(results[0].Specialty);
//         console.log(results[0].PrimaryPhysician);
//         console.log(results[0].Phone);
        
	
	
//  })});

//   connection.query('INSERT INTO DOCTOR (Fname,Minit,Lname,Address,NPI,StateLicenseNumber,StateOfLicense,Specialty,PrimaryPhysician,Phone) VALUES(?,?,?,?,?,?,?,?,?,?)',[user,'P','Shaju','123 New Fake Street','243576809','987654321','TX','Cardiologist','1111','123987654'],function(err, result){
// 	 if(err) throw err;
//  console.log('Inserted data \n');
// 	connection.query('SELECT * FROM DOCTOR',function(err,results){ //reading back data that i inserted 
// 	    console.log(results[0].Fname);
//         console.log(results[0].Minit);
//         console.log(results[0].Lname);
// 		console.log(results[0].Address);
//         console.log(results[0].NPI);
//         console.log(results[0].StateLicenseNumber);
//         console.log(results[0].StateOfLicense);
// 		console.log(results[0].Specialty);
//         console.log(results[0].PrimaryPhysician);
//         console.log(results[0].Phone);
        
	
	
//  })});

 res.json(user);
});
