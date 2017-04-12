import React, { Component } from 'react';

class DocAppointment extends Component {
  constructor(props) {
    super(props)
    this.state = {
      selectedOption: ""
    }

  this.handleOptionChange = this.handleOptionChange.bind(this);
  this.handleSubmit = this.handleSubmit.bind(this);
  }



  handleOptionChange(e){
        this.setState(
          {selectedOption: e.target.value}
          );
  }

  handleSubmit(e){
     fetch('/DocAppointment', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        selectedOption: this.state.selectedOption,
      })
    }).then(response => response.json())
        .then((responseJson) => {
        console.log(this.state.responseJson);
    })
    e.preventDefault(); 
  }


  render() {
    return (
      <div className="DocAppointment">
        <div>
          <h3>Accept/Cancel Appointments</h3>
          <h3> (Display Patients details, allergies and conditions) </h3>
          
          
          <form onSubmit={this.handleSubmit.bind(this)}>
            <div className="radio">
              <label><input type="radio" value="1" checked={this.state.selectedOption === '1'} 
                      onChange={this.handleOptionChange} />Accept</label>
            </div>
            <div className="radio">
              <label><input type="radio" value="0" checked={this.state.selectedOption === '0'} 
                      onChange={this.handleOptionChange} />Cancel</label>
            </div>
            <input type="submit" value="Submit"/>
        </form>
        </div>
        <div>
          <h3>Current Stats</h3>
          <h4>{this.state.selectedOption}</h4>
          
        </div>

      </div>
    );
  }
}

export default DocAppointment;

