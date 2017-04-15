import React, { Component } from 'react';

class Signup extends Component {
    constructor(){
        super();
       this.state ={     
            firstname: '',
            lastname: '',
            middlename: '',
            ssn: '',
            phone: '',
            homeaddress: '',
            dob: '',
            doctorType: null,
            doctor: null,
    }
  }

handleDropClick(event){
  console.log(event);
  this.setState({
    doctorType: event.target.value,
  },function(){
    console.log(event.target.value);
    fetch('/getDoctor', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        doctorType: this.state.doctorType,      
      })
    }).then(function(response) {
      return response.json()
    }).then(function(responseJson){
        console.log("Yess, we got doctor");
        this.setState({doctor: responseJson});
        })
  event.preventDefault(); 
});
}

handleSubmit(e){
      var replace = this.props.history.replace;
      this.setState({
        firstname: this.refs.firstname.value,
        lastname: this.refs.lastname.value,
        middlename: this.state.middlename.value,
        ssn: this.refs.ssn.value,
        phone: this.refs.phone.value,
        homeaddress: this.refs.homeaddress.value,
        dob: this.refs.dob.value,
        doctor: this.refs.doctor.value,
      },
      fetch('/Signup', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        firstname: this.state.firstname,
        lastname: this.state.lastname,
        middlename: this.state.middlename,
        ssn: this.state.ssn,
        phone: this.state.phone,
        homeaddress: this.state.homeaddress,
        dob: this.state.dob,
        doctor: this.state.doctor,      
      })
    }).then(function(response) {
      return response.json()
    }).then(function(responseJson){
        console.log("Yess, signup is complete");
        replace('/Patient');
        }));

    e.preventDefault(); 

}

selectDoctor(){
  return
}

render(){
    return (
      <div className="Signup">
        <center><h3>Patient Sign Up</h3></center>
        <center><form className="form-horizontal" onSubmit={this.handleSubmit.bind(this)}>
          <div className="form-group">  
          <div className="inputcontainer">
            <input className="input"
              type="text"
              placeholder="First Name"
              ref="firstname"
            />
          </div>
          <div className="inputcontainer">
            <input className="input"
              type="text"
              placeholder="Middle Name"
              ref="middlename"
            />
          </div>
          <div className="inputcontainer">
            <input className="input"
              type="text"
              placeholder="Last Name"
              ref="lastname"
            />
          </div>
          <div className="inputcontainer">
            <input className="input"
              type="text"
              placeholder="Social Security Number"
              ref="ssn"
            />
          </div>
          <div className="inputcontainer">
            <input className="input"
              type="text"
              placeholder="Phone Number"
              ref="phone"
            />
          </div>
          <div className="inputcontainer">
            <input className="input"
              type="text"
              placeholder="Home Address"
              ref="homeaddress"
            />
          </div>
          <div className="inputcontainer">
            <input className="input"
              type="text"
              placeholder="Date of Birth"
              ref="dob"
            />
          </div>
          <div className="dropdown">
            <button className="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
            <span className="caret"></span></button>
            <ul className="dropdown-menu">
              <li><a value="General Practitioner" onClick={this.handleDropClick.bind(this)} >General Practitioner</a></li>
            </ul>
          </div>
          
          <div>
            {this.selectDoctor()}
          </div>
          
          
          <br></br>
          <br></br>
          <br></br>
          <input type="submit" className="btn btn-primary" value="Submit" />
          <br />
          </div>
        </form></center>
      </div>
    );
  }
}
export default Signup;

