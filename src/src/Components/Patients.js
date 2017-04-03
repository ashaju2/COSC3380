import React, { Component } from 'react';
import PatientItem from './PatientItem';

class Patients extends Component {
  deletePatient(id){
    this.props.onDelete(id);
  }

  render() {
    let patientItems;
    if(this.props.patients){
      patientItems = this.props.patients.map(patient => {
        return (
          <PatientItem onDelete={this.deletePatient.bind(this)} key={patient.firstname} patient={patient} />
        );
      });
    }
    return (
      <div className="Patients">
      <h3>Latest Records</h3>
      {patientItems}
      </div>
    );
  }
}

Patients.propTypes = {
  patients: React.PropTypes.array,
  onDelete: React.PropTypes.func
}

export default Patients;
