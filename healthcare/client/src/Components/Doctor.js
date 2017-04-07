import React, { Component } from 'react';
import appointment from './appointment.jpg';
import calendar from './calendar.jpg';
import reports from './hospitalreport.jpg';
import patientreport from './patientreport.jpg';
import { Link } from 'react-router-dom';
import DocAppointment from './DocAppointment';
import data from '../data'

class Doctor extends Component {
  render() {
    console.log(this.props)
    if (!data.doctorLoggedIn) {
      return (
        <div>
          <p><b>ACCESS DENIED</b></p>
        </div>
      )
    }
    return (
      <div className="Doctor">
          <div className="container">
            <center><h2>Dashboard</h2></center>
            <br/>
            <div className="row">
              <div className="col-md-4">
                <Link to='/DocAppointment'>
                <div className="thumbnail">
                    <img src={appointment} alt="Lights" />
                    <div className="caption">
                      <p>Appointments</p>
                    </div>
                </div>
                </Link>
              </div>
              <div className="col-md-4">
                <div className="thumbnail">
                    <img src={calendar} alt="Nature" />
                    <div className="caption">
                      <p>Calendar</p>
                    </div>
                </div>
              </div>
              <div className="col-md-4">
                <div className="thumbnail">
                    <img src={reports} alt="Fjords"/>
                    <div className="caption">
                      <p>Reports</p>
                    </div>
                </div>
              </div>
            </div>
          </div>
        
      </div>
    );
  }
}

export default Doctor;

