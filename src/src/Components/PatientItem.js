import React, { Component } from 'react';

class PatientItem extends Component {
  deletePatient(id){
    this.props.onDelete(id);
  }

  render() {
    return (
      <li className="Patient">
        {this.props.patient.ssn},
        {this.props.patient.firstname},
        {this.props.patient.middlename},
        {this.props.patient.lastname},
        {this.props.patient.phone},
        {this.props.patient.homeaddress},
        {this.props.patient.birthdate},
        {this.props.patient.primarydoctorid},
        {this.props.patient.diganosisid},
        {this.props.patient.appointmentid},
        {this.props.patient.bloodtestid},
        {this.props.patient.prescriptionid}
        <a href="#" onClick={this.deletePatient.bind(this, this.props.patient.id)}>X</a>
      </li>
    );
  }
}

PatientItem.propTypes = {
  patient: React.PropTypes.object,
  onDelete: React.PropTypes.func
}

export default PatientItem;
