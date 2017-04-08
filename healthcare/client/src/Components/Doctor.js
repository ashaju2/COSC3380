import React, { Component } from 'react';
import appointment from './appointment.jpg';
import calendar from './calendar.jpg';
import reportsImg from './hospitalreport.jpg';
import patientreport from './patientreport.jpg';
import { Link } from 'react-router-dom';
import DocAppointment from './DocAppointment';
import reports from './Doctor/reports';
import data from '../data'

class Doctor extends Component {
  constructor(props){
    super(props);
    this.state = {
      
    };
  }

  render() {
    console.log(data.doctorLoggedIn)
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
                <Link to='/reports'>
                <div className="thumbnail">
                    <img src={reportsImg} alt="Fjords"/>
                    <div className="caption">
                      <p>Reports</p>
                    </div>
                </div>
                </Link>
              </div>
            </div>
          </div>
        
      </div>
    );
  }
}

export default Doctor;
