import React, { Component } from 'react';

class Signup extends Component {
    constructor(){
        super();
       this.state ={
            dataImp:{},
            doctorType: null,
            objectOfDoctor: null,
            DoctorID: null,
    }
  }

handleRadioChange(event){
  this.setState({
    doctorType: event.target.value,
  },function(){
    fetch('/getDoctor', {
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        doctorType: this.state.doctorType,
      })
    }).then(response => response.json())
        .then((responseJson) => {
        console.log("Yess, we got doctor");
        this.setState({objectOfDoctor: responseJson});
         console.log(this.state.objectOfDoctor);
     })
    });
   
  event.preventDefault();
}

handleSubmit(e){
    console.log("No");
      var replace = this.props.history.replace;
      console.log(this.refs.firstname.value);
      this.setState({ 
        dataImp: {
          firstname: this.refs.firstname.value,
          lastname: this.refs.lastname.value,
          middlename: this.refs.middlename.value,
          ssn: this.refs.ssn.value,
          phone: this.refs.phone.value,
          homeaddress: this.refs.homeaddress.value,
          dob: this.refs.dob.value,
          gender: this.refs.gender.value,
          username: this.refs.username.value,
          password: this.refs.password.value,
          }
    }, function(){
      fetch('/Signup', {
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        firstname: this.state.dataImp.firstname,
        lastname: this.state.dataImp.lastname,
        middlename: this.state.dataImp.middlename,
        ssn: this.state.dataImp.ssn,
        phone: this.state.dataImp.phone,
        homeaddress: this.state.dataImp.homeaddress,
        dob: this.state.dataImp.dob,
        DoctorID: this.state.dataImp.DoctorID,
        gender: this.state.dataImp.gender,
        username: this.state.dataImp.username,
        password: this.state.dataImp.password,
      })
    }).then(response => response.json())
        .then((responseJson) => {
        console.log("Yess, signup is complete");
//        replace('/Patient');
        })
      });

    e.preventDefault();

}

handleNewRadioChange(e){
  this.setState({ DoctorID: e.target.value });
}

selectDoctor(){
  let data = this.state.objectOfDoctor;
      if (!data) {
        return null
      }
      let iterator = data.map((ndata) => <div key={ndata.DoctorID}><input type="radio" name="options" selected={this.state.DoctorID == ndata.DoctorID} value={ndata.DoctorID} onChange={this.handleNewRadioChange.bind(this)}/>{ndata.Lname}, {ndata.Fname}</div>);
      console.log(iterator);
      return <h3>{iterator}</h3>
}


render(){
    return (

      <div className="Signup">
      <center><div className="panel panel-primary panel-resizable">
	     <div className="panel-heading">
		     <center><h3 className="panel-title">Patienet Sign Up</h3></center>

        </div>
        <div className="panel-body">
         <center><form className="form-horizontal" onSubmit={this.handleSubmit.bind(this)}>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="First Name"
              ref="firstname"
            />
          </div>
          </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Middle Name"
              ref="middlename"
            />
          </div>
          </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Last Name"
              ref="lastname"
            />
          </div>
          </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Social Security Number"
              ref="ssn"
            />
          </div>
          </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Phone Number"
              ref="phone"
            />
          </div>
          </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Home Address"
              ref="homeaddress"
            />
          </div>
          </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Date of Birth"
              ref="dob"
            />
          </div>
          </div>

          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Gender Format: M/F"
              ref="gender"
            />
            </div>
            </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="text"
              placeholder="Username"
              ref="username"
            />
            </div>
            </div>
          <div className="form-group">
          <div className="inputcontainer">
            <input className="form-control"
              type="password"
              placeholder="Password"
              ref="password"
            />
            </div>
            </div>

          <div className="form-group">
          <div className="radio">
          <div><input type="radio" name="options"  value="Cardiologist" onChange={this.handleRadioChange.bind(this)}/>Cardiologist</div>  
          <div><input type="radio" name="options"  value="surgeon" onChange={this.handleRadioChange.bind(this)}/>Surgeon</div>  
          <div><input type="radio" name="options"  value="Oncologist" onChange={this.handleRadioChange.bind(this)}/>Oncologist</div>  
          <div><input type="radio" name="options"  value="General Practitioner" onChange={this.handleRadioChange.bind(this)}/>General Practitioner</div>  
          </div>
          </div>

          <div>
            {this.selectDoctor()}
          </div>


          <br></br>
          <br></br>
          <br></br>
          <div>
          <input type="submit" className="btn btn-primary" value="Submit" />
          <br />
          </div>
        </form></center>
        </div>
      </div>
      </center>
      </div>
    );
  }
}
export default Signup;
