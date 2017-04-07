import React from 'react';
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

const Routes = props => {
    return(
    <Router history={hashHistory}>
      <div>
        <Route path="/" component={App}   />
        <Route path="/Doctor" component={Doctor} /> 
        <Route path="/DocAppointment" component={DocAppointment} /> 
        <Route path="/about" component={about} /> 
        <Route path="/contacts" component={contacts} /> 
        <Route path="/DocLogin" component={DocLogin} /> 
        <Route path="/PatientLogin" component={PatientLogin} /> 
        <Route path="/Patient" component={Patient} /> 
        
      </div>
    </Router>
)}

export default Routes