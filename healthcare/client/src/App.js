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
      loginAccept: 'false'
    };
  }

  handleLogin(login){
    fetch('/', { 
        method: 'POST',
        headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          username: login.username,
          password: login.password
        })
      }).then(function(response) {
        return response.json()
      }).then(function(responseJson){
        console.log(responseJson);
        if(responseJson === 1){
          //this.setState({loginAccept: 'true'})
          console.log(responseJson);
        }
      })
      console.log(this.state.loginAccept);
  }

componentWillMount(){
  
}

  render() {
    return (
      <div className="App">
        <Frontview />
        <Login login={this.handleLogin.bind(this)}/>
      </div>
    );
  }
}

export default App;

