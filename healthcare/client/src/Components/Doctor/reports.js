import React, { Component } from 'react';

class reports extends Component {
    constructor(props){
        super(props);
        this.state = {
            query: {},
            patientData: null
        };

        this.handleSubmit = this.handleSubmit.bind(this);

    }

    componentWillMount(){
      fetch('/patientsOfDoctor')
      .then(response => response.json())
        .then((responseJson) => {
          this.setState({
            patientsOfDoctor: responseJson
          });
          console.log("Listing Patients of Doctor:");
          console.log(this.state.patientsOfDoctor);
        });
    }

    handleSubmit(e){
        var push = this.props.history.push;
        if(this.refs.firstName.value){
        this.setState({query: {
            patientID: this.refs.patientID.value,
            firstName: this.refs.firstName.value,
            lastName: this.refs.lastName.value
        }
      }, function() {
        fetch('/report', {
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        patientID: this.state.query.patientID,
        firstName: this.state.query.firstName,
        lastName: this.state.query.lastName

      })
    }).then(response => response.json())
        .then((responseJson) => {
        this.setState({
            responseJson
        })
        console.log(this.state.responseJson);
    })
      });
    }
    e.preventDefault();
  }

  patientsOfDoctorIterator(){
      let data = this.state.patientsOfDoctor;
      if (!data) {
        return null
      }
      let iterator = data.map((ndata) =>
                                  <tr key={ndata.PatientID}>
                                    <td className="text-center">{ndata.Lname}, {ndata.Fname} {ndata.Minit}</td>
                                    <td className="text-center">{ndata.PatientID}</td>
                                    <td className="text-center">{ndata.HealthInsurance}</td>
                                    <td className="text-center">{ndata.Allergies}</td>
                                    <td className="text-center">{ndata.Phone}</td>
                                    <td className="text-center">{ndata.email}</td>
                                  </tr>);
      console.log(iterator);
      return <tbody>{iterator}</tbody>;
  }

  render() {
    return (
      <div className="reports">
        <div className="Patient_List">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">List of Patients for Doctor</h3>
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
                      <th className="col-xs-2 text-center">PatientID</th>
                      <th className="col-xs-2 text-center">Health Insurance</th>
                      <th className="col-xs-2 text-center">Allergies</th>
                      <th className="col-xs-2 text-center">Phone</th>
                      <th className="col-xs-2 text-center">Email</th>
                    </tr>
                  </thead>
                    {this.patientsOfDoctorIterator()}
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default reports;
