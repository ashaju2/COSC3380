require('babel-register')({
    presets:['react']
});
var mysql = require('mysql');
var express= require('express');
var app = express();
var jsx = require('node-jsx');
var React = require('react');
var ReactDOMServer = require('react-dom/server');
var Component = require('./src/index.js');

jsx.install();

app.get('/',function(request,response){
	var html = ReactDOMServer.renderToString(
        React.createElement(Component)
    );
	response.send(html);
});

var PORT = 3001;
app.listen(PORT, function(){
    console.log('http://localhost:' + PORT);
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



var sql="DELETE FROM DOCTOR WHERE Fname = ?"
connection.query(sql,['Alen'],function(err,result){
	
	if(err)throw err;
	console.log('Data deleted \n');
	console.log(result);
	
});

var sql="DELETE FROM DOCTOR WHERE Fname = ?"
connection.query(sql,['Matthew'],function(err,result){
	
	if(err)throw err;
	console.log('Data deleted \n');
	console.log(result);
	
});
//app.post()
connection.query('INSERT INTO DOCTOR (Fname,Minit,Lname,Address,NPI,StateLicenseNumber,StateOfLicense,Specialty,PrimaryPhysician,Phone) VALUES(?,?,?,?,?,?,?,?,?,?)',['Matthew','M','Rodriguez','123 Fake Street','717835421','123456789','TX','Gastroenterologist','9999','123987654'],function(err, result){
	 if(err) throw err;
 console.log('Inserted data \n');
	connection.query('SELECT * FROM DOCTOR',function(err,results){ //reading back data that i inserted 
	    console.log(results[0].Fname);
        console.log(results[0].Minit);
        console.log(results[0].Lname);
		console.log(results[0].Address);
        console.log(results[0].NPI);
        console.log(results[0].StateLicenseNumber);
        console.log(results[0].StateOfLicense);
		console.log(results[0].Specialty);
        console.log(results[0].PrimaryPhysician);
        console.log(results[0].Phone);
        
	
	
 })});

  connection.query('INSERT INTO DOCTOR (Fname,Minit,Lname,Address,NPI,StateLicenseNumber,StateOfLicense,Specialty,PrimaryPhysician,Phone) VALUES(?,?,?,?,?,?,?,?,?,?)',['Alen','P','Shaju','123 New Fake Street','243576809','987654321','TX','Cardiologist','1111','123987654'],function(err, result){
	 if(err) throw err;
 console.log('Inserted data \n');
	connection.query('SELECT * FROM DOCTOR',function(err,results){ //reading back data that i inserted 
	    console.log(results[0].Fname);
        console.log(results[0].Minit);
        console.log(results[0].Lname);
		console.log(results[0].Address);
        console.log(results[0].NPI);
        console.log(results[0].StateLicenseNumber);
        console.log(results[0].StateOfLicense);
		console.log(results[0].Specialty);
        console.log(results[0].PrimaryPhysician);
        console.log(results[0].Phone);
        
	
	
 })});