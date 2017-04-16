import React, { Component } from 'react';
import appointment from './appointment.jpg';
import AddDoctorsImg from './AddDoctors.jpg';
import reportsImg from './hospitalreport.jpg';
import patientreport from './patientreport.jpg';
import { Link } from 'react-router-dom';
import SysAdminReports from './SysAdminReports';
import AddDoctors from './AddDoctors';

class SysAdmin extends Component {
  constructor(props){
    super(props);
    this.state = {
      
    };
  }

  render() {
    return (
      <div className="SysAdmin">
          <div className="container">
            <center><div className="alert-info"><br></br><h2>Dashboard</h2><br></br></div></center>
            <br/>
            <div className="row">
              <div className="col-md-4">
                <Link to='/SysAdminReports'>
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

export default SysAdmin;

