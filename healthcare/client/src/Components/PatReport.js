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
        console.log(this.state.patientReportDetails[0]);
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

  render() {
      if(!this.state.patientReportDoctor){
          return <div><h5>Loading.......</h5><h5>Thank you for your patience</h5></div>
      }
    return (
      <div className="PatReport">
        <div>
            {this.state.patientReportDoctor[0].AssignedDoctor}
            <br></br>
            {this.state.patientReportDetails[0].Fname}
            <br></br>
            {this.state.patientReportDetails[0].Lname}
            <br></br>
            {this.state.patientReportDetails[0].HealthInsurance}
            <br></br>
            {this.state.patientReportDetails[0].Phone}
            <br></br>
            {this.state.patientReportDetails[0].email}
            <br></br>
            {this.state.patientReportDetails[0].username}
            <br></br>
            {this.state.patientReportDetails[0].Address}
            <br></br>
            {this.state.patientReportDetails[0].Conditions}
            <br></br>

        </div>
      </div>
    );
  }
}

export default PatReport;

