import React, { Component } from 'react';

class DocAppointment extends Component {
  constructor(props) {
    super(props)
    this.state = {
      data: []
    }

  this.handleSubmit = this.handleSubmit.bind(this);


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
        console.log(this.responseJson);
    })
      });
    }
    e.preventDefault(); 
  }


  render() {
    return (
      <div className="DocAppointment">
        <div>
          <h2>Accept/Cancel Appointments</h2>
          <h3> (Display Patients details, allergies and conditions) </h3>
          
          
          <form onSubmit={this.handleSubmit.bind(this)}>
            <div className="radio">
              <label><input type="radio" name="optradio">Accept</input></label>
            </div>
            <div className="radio">
              <label><input type="radio" name="optradio">Cancel</input></label>
            </div>
            <input type="submit" value="Submit"/>
        </form>
        </div>
        <div>
          <h2>Current Stats</h2>
          
        </div>

      </div>
    );
  }
}

export default DocAppointment;

