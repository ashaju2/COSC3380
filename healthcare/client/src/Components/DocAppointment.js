import React, { Component } from 'react';

class DocAppointment extends Component {
  constructor(props) {
    super(props)
    this.state = {
      PatientID: '',
      newdiag: '',
      newtreat: '',
    
      Drugname: '',
      dose: '',
      numbPills: '',
      frequency: '',
      route: '',
      refills: '',

      type: '',
      result: '',

    }
  }

  handleSubmit(e){
    console.log(this.refs.newtreat.value);
    this.setState({
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

    })
     fetch('/setPatientMedInfo', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        newdiag: this.state.newdiag,
        newtreat: this.state.newtreat,
     
        Drugname: this.state.Drugname,
        dose: this.state.dose,
        numbPills: this.state.numbPills,
        frequency: this.state.frequency,
        route: this.state.route,
        refills: this.state.refills,

        type: this.state.type,
        result: this.state.result,

      })
    }).then(response => response.json())
        .then((responseJson) => {
        console.log(this.state.responseJson);
        console.log("It worked!!")
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

  render() {
    return (
      <div className="DocAppointment">
        <div>Add prescription, Diagnosis and Test for patient using Patient ID </div>
        <div className="col-sm-5">
          <div className="form-group">
            <label htmlFor="usr">PatientID:</label>
            <input type="text" className="form-control"  onChange={this.handleChange.bind(this)}/>
          </div>
        </div>
        <div className="col-sm-5">
        <form onSubmit={this.handleSubmit.bind(this)}>
          <div className="form-group">
            <label htmlFor="diagnosis">Add description of diagnosis:</label>
            <input type="text" ref="newdiag" className="form-control" id="newdiag"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add treatment for patient:</label>
            <input type="text" ref="newtreat" className="form-control" id="newtreat"/>
          </div>
          <div className="form-group">
            <label htmlFor="test">Add Drug name for patient</label>
            <input type="text" ref="Drugname" className="form-control" id="Drugname"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add amount of dose for drug for patients:</label>
            <input type="text" ref="dose" className="form-control" id="dose"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add Number of pills for patients:</label>
            <input type="text" ref="numbPills" className="form-control" id="numbPills"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add frequency for pills for patients:</label>
            <input type="text" ref="frequency" className="form-control" id="frequency"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add route for patients:</label>
            <input type="text" ref="route" className="form-control" id="route"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add refills for patients:</label>
            <input type="text" ref="refills" className="form-control" id="refills"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add Type of test for patients:</label>
            <input type="text" ref="type" className="form-control" id="type"/>
          </div>
          <div className="form-group">
            <label htmlFor="diagnosis">Add result of test for patients:</label>
            <input type="text" ref="result" className="form-control" id="result"/>
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

