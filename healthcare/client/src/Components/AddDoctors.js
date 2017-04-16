import React, { Component } from 'react';

class AddDoctors extends Component {
  constructor(props) {
    super(props)
    this.state = {
      PatientID: null,
    }
  }

  handleSubmit(e){
     fetch('/setPatientMedInfo', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        prescription: this.refs.prescription.value,
        diagnosis: this.refs.diagnosis.value,
        test: this.refs.test.value,
      })
    }).then(response => response.json())
        .then((responseJson) => {
        console.log(this.state.responseJson);
    })
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
      <div className="AddDoctors">
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
            <label htmlFor="prescription">Add Prescription for Patient:</label>
            <input type="text" ref="prescription" className="form-control" id="prescription"/>
          </div>
          <div class="form-group">
            <label htmlFor="diagnosis">Add Diagnosis for patients:</label>
            <input type="text" ref="diagnosis" className="form-control" id="diagnosis"/>
          </div>
          <div class="form-group">
            <label htmlFor="test">Add Tests for patients:</label>
            <input type="text" ref="test" className="form-control" id="test"/>
          </div>
          <br></br>
          <button type="submit" className="btn btn-default">Submit</button>
        </form>
        </div>
      </div>
    );
  }
}

export default AddDoctors;

