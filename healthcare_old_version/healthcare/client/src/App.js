/* Goals:
1 - User authentication for multiple roles|register - ❌(Jason)
2 - data entry capabilities. Each role log in and enter, need web forms - (Working on it)
3 - at least 1 or 2 triggers some type of checks - ❌
4 - Queries and reports - ❌      
5 - Connect nodejs in RDS to react - ✔️
6 - Routing to different page - ✔️

Database:
Doctor -> (Assigns) -> Prescription -> (for) -> patients
Doctor -> Assigned_To -> patient
Doctor -> (does) -> Diagnosis -> (on) -> Patients
Doctor -> Works_At -> Office
Patient -> (sets) -> Appointment -> (at) -> Office -> (submit) -> Appointment -> Doctor
Doctor -> (does) -> Test -> (for) -> Patient
*/

import React, { Component } from 'react';
import Frontview from './Components/Frontview';
import './App.css';

class App extends Component {
  constructor(){
    super();
    this.state = {
      user: [],
      name: '',
      job: ''
    };
    this.onSubmit = this.handleSubmit.bind(this); 
  }
  handleSubmit(e) {
    e.preventDefault();
    // On submit of the form, send a POST request with the data to the server.
    fetch('/', { 
        method: 'POST',
        headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
        body: JSON.stringify({
          name: this.state.name,
          job: this.state.job
        })
      })
  }
  render() {
    console.log(this.state.name);
    return (
      <div className="App">
        <Frontview projects={this.state.user}/>
        {this.state.user}
        <form onSubmit={this.onSubmit}>
          <input 
            type="text" 
            placeholder="Name" 
            ref="name" 
            onChange={(e) => this.setState({ name: e.target.value})}
          />
          <input 
            type="text" 
            placeholder="Job" 
            ref="job"
            onChange={(e) => this.setState({ job: e.target.value })}
          />
          <input type="submit" />
        </form>
      </div>
    );
  }
}

export default App;

