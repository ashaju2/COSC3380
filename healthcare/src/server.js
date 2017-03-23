var mysql = require('mysql');
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
connection.query(sql,['Matthew'],function(err,result){
	
	if(err)throw err;
	console.log('Data deleted \n');
	console.log(result);
	
});
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