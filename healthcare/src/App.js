/* Goals:
1 - User authentication for multiple roles|register 
2 - data entry capabilities. Each role log in and enter, need web forms
3 - at least 1 or 2 triggers some type of checks
4 - Queries and reports      

Database:
Doctor -> (Assigns) -> Prescription -> (for) -> patients
Doctor -> Assigned_To -> patient
Doctor -> (does) -> Diagnosis -> (on) -> Patients
Doctor -> Works_At -> Office
Patient -> (sets) -> Appointment -> (at) -> Office -> (submit) -> Appointment -. Doctor
Doctor -> (does) -> Test -> (for) -> Patient
*/

import React, { Component } from 'react';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        Hello World
      </div>
    );
  }
}

export default App;
