import React, { Component } from 'react';
import appointment from './appointment.jpg';
import calendar from './calendar.jpg';
import reports from './hospitalreport.jpg';
import patientreport from './patientreport.jpg';
import { Link } from 'react-router-dom';

class Patient extends Component {
  render() {
    return (
      <div className="Patient">
          <div className="container">
            <center><h2>Dashboard</h2></center>
            <br/>
            <div className="row">
              <div className="col-md-4">
                <Link to='/DocAppointment'>
                <div className="thumbnail">
                    <img src={appointment} alt="Lights" />
                    <div className="caption">
                      <p>Set Appointments / View Calendar</p>
                    </div>
                </div>
                </Link>
              </div>
              <div className="col-md-4">
                <div className="thumbnail">
                    <img src={calendar} alt="Nature" />
                    <div className="caption">
                      <p>Prescriptions</p>
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

export default Patient;

