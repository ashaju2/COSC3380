import React, { Component } from 'react';

class PatPrescription extends Component {
    constructor(props){
        super(props);
        this.state = {
            patientReportDoctor: null,
            patientReportDetails: null,
            patientReportTests: null,
        }
    }

componentWillMount(){
    fetch('/PatPrescriptions')
      .then(response => response.json())
        .then((responseJson) => {
        this.setState({
            patientPrescriptions: responseJson
        })
        console.log('Patient Prescriptions in react:')
        console.log(this.state.patientPrescriptions);
    });
}

patientPrescriptionIterator(){
    let data = this.state.patientPrescriptions;
    if (!data) {
      return null
    }
    let iterator = data.map((ndata) =>
                                <tr key={ndata.PrescriptionID}>
                                  <td className="text-center">{ndata.DatePrescribedFormatted}</td>
                                  <td className="text-center">{ndata.MedicineName}</td>
                                  <td className="text-center">{ndata.Amount}, {ndata.Strength}</td>
                                  <td className="text-center">{ndata.Frequency}</td>
                                  <td className="text-center">{ndata.Route}</td>
                                  <td className="text-center">{ndata.RefillsLeft}</td>
                                </tr>);
    console.log(iterator);
    return <tbody>{iterator}</tbody>;
}

  render() {
      if(!this.state.patientPrescriptions){
          return <div><h5>Loading.......</h5><h5>Thank you for your patience</h5></div>
      }
    return (
      <div className="PatPrescription">
        <div className="PatientPrescriptionsList">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">Patient Prescriptions List</h3>
              </div>
            </div>
          </div>
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table className="table table-bordered table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th className="col-xs-2 text-center">Date Prescribed</th>
                      <th className="col-xs-2 text-center">Medicine</th>
                      <th className="col-xs-2 text-center">Amount and Strength</th>
                      <th className="col-xs-2 text-center">Frequency to Take</th>
                      <th className="col-xs-2 text-center">Route</th>
                      <th className="col-xs-2 text-center">Refills</th>
                    </tr>
                  </thead>
                    {this.patientPrescriptionIterator()}
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default PatPrescription;
