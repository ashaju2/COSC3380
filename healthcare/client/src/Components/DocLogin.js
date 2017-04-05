import React, { Component } from 'react';
import Login from './Login.js';

class DocLogin extends Component {
  render() {
    return (
      <div className="DocLogin">
         <div className="container">
            <div className="row">
                <div className="col-sm-4">
                    <h3>Login Page</h3>
                          <Login />
                        
                </div>
                <div className="col-sm-4">
                    <h3>Manage your health care online</h3>
                    <h4>Change your doctor</h4>
                    <h4>Update your contatc Infomation</h4>
                    <h4>Get health reminders</h4>
                    <h4>Schedule appointments</h4>
                    <h4>View service history</h4>
                </div>
            </div>
        </div>

      </div>
    );
  }
}

export default DocLogin;

