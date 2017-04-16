import React, { Component } from 'react';

class DocAppointment extends Component {
  constructor(props) {
    super(props)
    this.state = {
      PatientID: '',
      datatest: {},

    }
  }

  handleSubmit(e){
    this.setState({
      datatest:{
        newdiag: this.refs.newdiag.value,
        newtreat: this.refs.newtreat.value,
     
        Drugname: this.refs.Drugname.value,
        dose: this.refs.dose.value,
        numbPills: this.refs.numbPills.value,
        frequency: this.refs.frequency.value,
        route: this.refs.route.value,
        refills: this.refs.refills.value,

        type: this.refs.type.value,
        result: this.refs.result.value,

    }
  }, function(){
     fetch('/setPatientMedInfo', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        newdiag: this.state.datatest.newdiag,
        newtreat: this.state.datatest.newtreat,
     
        Drugname: this.state.datatest.Drugname,
        dose: this.state.datatest.dose,
        numbPills: this.state.datatest.numbPills,
        frequency: this.state.datatest.frequency,
        route: this.state.datatest.route,
        refills: this.state.datatest.refills,

        type: this.state.datatest.type,
        result: this.state.datatest.result,

      })
    }).then(response => response.json())
        .then((responseJson) => {
        console.log(this.state.datatest.type);
        console.log("It worked!!")
    });
  });
    e.preventDefault(); 
  }

handleChange(event){
  console.log(event.target.value);
if (event.target.value.length !== 3) {
      console.log('not 10')
      this.setState({ PatientID: null })
      return
    }
    if (event.target.value.length === 3) {
      fetch('/details', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        PatientID: event.target.value
      })
    })
    .then((response) => response.json())
        .then((responseJson) => {
          this.setState( {PatientID: responseJson} );
        console.log(this.state.PatientID);
    });
   }
}

showPatDetails(){
      let data = this.state.PatientID;
      if (!data) {
        return null
      }
      let iterator = data.map((ndata) => <tr key={ndata.PatientID}>
                                  <tr className="text-left">{ndata.Lname}, {ndata.Fname} {ndata.Minit}</tr>
                                  <tr className="text-left">{ndata.Address}</tr>
                                  <tr className="text-left">{ndata.Allergies}</tr>
                                  <tr className="text-left">{ndata.Conditions}</tr>
                                  <tr className="text-left">{ndata.HealthInsurance}</tr>
                                  <tr className="text-left">{ndata.DateOfBirth}</tr>
                                  
                                </tr>);
    console.log(iterator);
    return <tbody>{iterator}</tbody>;
}

  render() {
    return (
      <div className="DocAppointment">
        <div>Add prescription, Diagnosis and Test for patient using Patient ID </div>
        <div className="col-sm-5">
          <div className="form-group">
            <label htmlFor="usr">PatientID:</label>
            <input type="text" className="form-control"  onChange={this.handleChange.bind(this)}/>
          </div>
          <div>
            <table className="table table-bordered table-striped table-hover table-bordered">
                          {this.showPatDetails()}
            </table>
          </div>
        </div>
        <div className="col-sm-5">
        <form onSubmit={this.handleSubmit.bind(this)}>
          <div className="form-group">
            <label htmlFor="diagnosis">Add description of diagnosis:</label>
            <input 
            type="text" ref="newdiag" className="form-control" />
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add treatment for patient:</label>
            <input type="text" ref="newtreat" className="form-control" />
          </div>
          <div className="form-group">
            <label htmlFor="test">Add Drug name for patient</label>
            <input type="text" ref="Drugname" className="form-control" />
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add amount of dose for drug for patients:</label>
            <input type="text" ref="dose" className="form-control" />
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add Number of pills for patients:</label>
            <input type="text" ref="numbPills" className="form-control"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add frequency for pills for patients:</label>
            <input type="text" ref="frequency" className="form-control" />
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add route for patients:</label>
            <input type="text" ref="route" className="form-control" />
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add refills for patients:</label>
            <input type="text" ref="refills" className="form-control"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add Type of test for patients:</label>
            <input type="text" ref="type" className="form-control"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add result of test for patients:</label>
            <input type="text" ref="result" className="form-control"/>
          </div>
          <br></br>
          <button type="submit" className="btn btn-default">Submit</button>
        </form>
        </div>
      </div>
    );
  }
}

export default DocAppointment;

