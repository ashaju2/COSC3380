import React, { Component } from 'react';
import uuid from 'uuid';

class AddPatient extends Component {
  constructor(){
    super();
    this.state = {
      newPatient:{}
    }
  }

  handleSubmit(e){
    if(this.refs.firstname.value === ''){
      alert('First name is required.');
    }
    else {
      this.setState({newPatient:{
        //id: uuid.v4(),
        ssn: this.refs.ssn.value,
        firstname: this.refs.firstname.value,
        middlename: this.refs.middlename.value,
        lastname: this.refs.lastname.value,
        phone: this.refs.phone.value,
        homeaddress: this.refs.homeaddress.value,
        birthdate: this.refs.birthdate.value,
        primarydoctorid: this.refs.primarydoctorid.value,
        diganosisid: this.refs.diganosisid.value,
        appointmentid: this.refs.appointmentid.value,
        bloodtestid: this.refs.bloodtestid.value,
        prescriptionid: this.refs.prescriptionid.value
      }}, function(){
        this.props.addPatient(this.state.newPatient);
        this.refs.ssn.value = '';
        this.refs.firstname.value = '';
        this.refs.middlename.value = '';
        this.refs.lastname.value = '';
        this.refs.phone.value = '';
        this.refs.homeaddress.value = '';
        this.refs.birthdate.value = '';
        this.refs.primarydoctorid.value = '';
        this.refs.diganosisid.value = '';
        this.refs.appointmentid.value = '';
        this.refs.bloodtestid.value = '';
        this.refs.prescriptionid.value = '';
      });
    }
    e.preventDefault();
  }

  render() {
    return (
      <div align = "center">
        <h3>Sign up</h3>
        <form onSubmit={this.handleSubmit.bind(this)}>
        <div>
          <label>Social Security Number</label><br />
          <input type="text" ref="ssn" />
        </div>
          <div>
            <label>First Name</label><br />
            <input type="text" ref="firstname" />
          </div>
          <div>
            <label>Middle Name</label><br />
            <input type="text" ref="middlename" />
          </div>
          <div>
            <label>Last Name</label><br />
            <input type="text" ref="lastname" />
          </div>
          <div>
            <label>Phone Number</label><br />
            <input type="text" ref="phone" />
          </div>
          <div>
            <label>Home Address</label><br />
            <input type="text" ref="homeaddress" />
          </div>
          <div>
            <label>Birth Date</label><br />
            <input type="text" ref="birthdate" />
          </div>
          <div>
            <label>Primary Doctor ID</label><br />
            <input type="text" ref="primarydoctorid" />
          </div>
          <div>
            <label>Diganosis ID</label><br />
            <input type="text" ref="diganosisid" />
          </div>
          <div>
            <label>Appointment ID</label><br />
            <input type="text" ref="appointmentid" />
          </div>
          <div>
            <label>Blood Test ID</label><br />
            <input type="text" ref="bloodtestid" />
          </div>
          <div>
            <label>Prescription ID</label><br />
            <input type="text" ref="prescriptionid" />
          </div>
          <br />
          <input type="submit" value="Submit" />
          <br />
        </form>
      </div>
    );
  }
}

AddPatient.propTypes = {
  addPatient: React.PropTypes.func
}

export default AddPatient;
