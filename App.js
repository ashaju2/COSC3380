/* Goals:
1 - User authentication for multiple roles|register - ✔️
2 - data entry capabilities. Each role log in and enter, need web forms - 
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
import Login from './Components/Login';
import './App.css';

class App extends Component {
  constructor(){
    super();
    this.state = {
      user: [],
      data: null
    };
  }
  
  componentDidMount() {
    this.getReddit()
  }
  getReddit = () => {
    fetch('https://www.reddit.com/r/scarystories/.json')
    .then((response) => {
      this.setState({data: 'I have loaded data'})
    })
    
  }
  render() {
    if (!this.state.data) {
      return (
        <div>
          <p><b>Loading...</b></p>
        </div>
      )
    }
    return (
      <div className="App">
        <p>{this.state.data}</p>
      </div>
    );
  }
}

export default App;

