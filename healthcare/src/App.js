/* Goals:
1 - User authentication for multiple roles|register - ❌
2 - data entry capabilities. Each role log in and enter, need web forms - (Working on it)
3 - at least 1 or 2 triggers some type of checks - ❌
4 - Queries and reports - ❌      
5 - Connect nodejs in RDS to react - ✔️
6 - Routing to different page - ❌

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
      projects: 
        {
          title: 'Website',
          category: 'Web Design'
        }
      
    } 
  }
  render() {
    return (
      <div className="App">
        <Frontview projects={this.state.projects}/>
        {this.state.projects.title}
      </div>
    );
  }
}

export default App;

