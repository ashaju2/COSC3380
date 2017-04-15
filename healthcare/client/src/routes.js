import React, { Component } from 'react';
import { HashRouter as Router, IndexRoute, Route, Link, hashHistory } from 'react-router-dom';
import App from './App';
import './index.css';
import Login from './Components/Login';
import Doctor from './Components/Doctor';
import Patient from './Components/Patient';
import SysAdmin from './Components/SysAdmin';
import DocAppointment from './Components/DocAppointment';
import about from './Components/NavBarComponents/about'
import contacts from './Components/NavBarComponents/contacts'
import DocLogin from './Components/DocLogin'
import PatientLogin from './Components/PatientLogin';
import reports from './Components/Doctor/reports';
import PatAppointment from './Components/PatAppointment';
import Frontview from './Components/Frontview';
import Submission from './Components/Submission';
import PatReport from './Components/PatReport';
import Signup from './Components/Signup';
import DocCalendar from './Components/DocCalendar';
import PatPrescription from './Components/PatPrescription';

class Routes extends Component {
    constructor(){
      super();
      this.state= {
        doctorLoggedIn: false,
        patientLoggedIn: false
      };
    }

  doctorToggleLoggedIn() {
    this.setState({doctorLoggedIn: !this.state.doctorLoggedIn});
  }

  patientToggleLoggedIn() {
    this.setState({patientLoggedIn: !this.state.patientLoggedIn});
  }

  render(){
    
    return(
    <Router history={hashHistory}>
      <div>
        <Route path="/" component={App}  />
        <Route path="/Doctor" render={({history}) => <Doctor history={history} doctorLoggedIn={this.state.doctorLoggedIn}/>} /> 
        <Route path="/DocAppointment" component={DocAppointment} /> 
        <Route path="/about" component={about} /> 
        <Route path="/contacts" component={contacts} /> 
        <Route path="/DocLogin" render={({history}) => <DocLogin history={history} doctorLoggedIn={this.state.doctorLoggedIn} doctorToggleLogin={this.doctorToggleLoggedIn.bind(this)}/>} /> 
        <Route path="/PatientLogin" render={({history}) => <PatientLogin history={history} patientLoggedIn={this.state.patientLoggedIn} patientToggleLogin={this.patientToggleLoggedIn.bind(this)}/>} /> 
        <Route path="/Patient" render={({history}) => <Patient history={history} patientLoggedIn={this.state.patientLoggedIn}/>}/> 
        <Route path="/reports" component={reports} /> 
        <Route path="/PatAppointment" component={PatAppointment} /> 
        <Route path="/Submission" component={Submission} />
        <Route path="/PatReport" component={PatReport} />
        <Route path="/Signup" component={Signup} />
        <Route path="/DocCalendar" component={DocCalendar} />
        <Route path="/PatPrescription" component={PatPrescription} />
        
        
      </div>
    </Router>
  )}
}

export default Routes