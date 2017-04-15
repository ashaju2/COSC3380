import React, { Component } from 'react';

class PatReport extends Component {
    constructor(props){
        super(props);
        this.state = {
            patientReportDoctor: null,
            patientReportDetails: null,
            patientReportTests: null,
        }
    }

componentWillMount(){
    fetch('/PatReportDoctor')
      .then(response => response.json())
        .then((responseJson) => {
        this.setState({
            patientReportDoctor: responseJson
        })
        console.log(this.state.patientReportDoctor);
    });

    fetch('/PatReportDetails')
      .then(response => response.json())
        .then((responseJson) => {
        this.setState({
            patientReportDetails: responseJson
        })
        console.log(this.state.patientReportDetails);
    });

    fetch('/PatReportTests')
      .then(response => response.json())
        .then((responseJson) => {
        this.setState({
            patientReportTests: responseJson
        })
        console.log(this.state.patientReportTests);
    })
}

testDataIterator(){
    let data = this.state.patientReportTests;
    if (!data) {
      return null
    }
    let iterator = data.map((ndata) =>
                                <tr key={ndata.TestID}>
                                  <td className="text-center">{ndata.DateOfTest}</td>
                                  <td className="text-center">{ndata.Type}</td>
                                  <td className="text-center">{ndata.Results}</td>
                                  <td className="text-center">{ndata.Interpretation}</td>
                                </tr>);
    console.log(iterator);
    return <tbody>{iterator}</tbody>;
}

  render() {
      if(!this.state.patientReportDoctor){
          return <div><h5>Loading.......</h5><h5>Thank you for your patience</h5></div>
      }
    return (
      <div className="PatReport">
        <div className="PatList">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">Patient Information</h3>
              </div>
            </div>
          </div>
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table className="table table-bordered table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th className="col-xs-2 text-center">Name</th>
                      <th className="col-xs-1 text-center">Health Insurance</th>
                      <th className="col-xs-2 text-center">Allergies</th>
                      <th className="col-xs-2 text-center">Phone</th>
                      <th className="col-xs-2 text-center">Address</th>
                      <th className="col-xs-2 text-center">Email</th>
                      <th className="col-xs-1 text-center">username</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td className="text-center">{this.state.patientReportDetails[0].Lname}, {this.state.patientReportDetails[0].Fname} {this.state.patientReportDetails[0].Minit}</td>
                      <td className="text-center">{this.state.patientReportDetails[0].HealthInsurance}</td>
                      <td className="text-center">{this.state.patientReportDetails[0].Allergies}</td>
                      <td className="text-center">{this.state.patientReportDetails[0].Phone}</td>
                      <td className="text-center">{this.state.patientReportDetails[0].Address}</td>
                      <td className="text-center">{this.state.patientReportDetails[0].email}</td>
                      <td className="text-center">{this.state.patientReportDetails[0].username}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div className="AssignedDoctor">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">Assigned Doctor</h3>
              </div>
            </div>
          </div>
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table className="table table-bordered table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th className="col-xs-2 text-center">Name</th>
                      <th className="col-xs-3 text-center">DoctorID</th>
                      <th className="col-xs-3 text-center">Specialty</th>
                      <th className="col-xs-2 text-center">Phone</th>
                      <th className="col-xs-3 text-center">Address</th>
                      <th className="col-xs-2 text-center">Email</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td className="text-center">{this.state.patientReportDoctor[0].Lname}, {this.state.patientReportDoctor[0].Fname} {this.state.patientReportDoctor[0].Minit}</td>
                      <td className="text-center">{this.state.patientReportDoctor[0].DoctorID}</td>
                      <td className="text-center">{this.state.patientReportDoctor[0].Specialty}</td>
                      <td className="text-center">{this.state.patientReportDoctor[0].Phone}</td>
                      <td className="text-center">{this.state.patientReportDoctor[0].Address}</td>
                      <td className="text-center">{this.state.patientReportDoctor[0].email}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div className="PatientTests">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">Patient Tests</h3>
              </div>
            </div>
          </div>
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table className="table table-bordered table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th className="col-xs-3 text-center">Date</th>
                      <th className="col-xs-3 text-center">Test Type</th>
                      <th className="col-xs-3 text-center">Results</th>
                      <th className="col-xs-3 text-center">Interpretation</th>
                    </tr>
                  </thead>
                    {this.testDataIterator()}
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default PatReport;
