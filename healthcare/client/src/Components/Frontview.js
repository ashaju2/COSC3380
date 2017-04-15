import React, { Component } from 'react';
import './Frontview.css';
import DocLogin from './DocLogin.js';
import PatientLogin from './PatientLogin.js';
import SysAdminLogin from './SysAdminLogin.js';
import { Link } from 'react-router-dom';
import about from './NavBarComponents/about';
import contacts from './NavBarComponents/contacts';
import Signup from './Signup';

class Frontview extends Component {
  constructor(props){
    super(props);
        this.state = {showDocSignin: false};
        this.state = {showPatSignin: false};
        this.state = {showAdminSignin: false};
        this.OpenDocSignin = this.OpenDocSignin.bind(this);
        this.OpenPatSignin = this.OpenPatSignin.bind(this);
        this.OpenAdminSignin = this.OpenAdminSignin.bind(this);

        console.log(props);
  }
  OpenDocSignin(){
      this.setState({showDocSignin: true});
      console.log("it worked");
      return(<DocLogin/>)
  }

  OpenPatSignin(){
      this.setState({showPatSignin: true});
  }

  OpenAdminSignin(){
      this.setState({showAdminSignin: true});
  }


  render() {
    return (
      <div className="Frontview">
        <nav className="navbar navbar-inverse">
          <div className="container-fluid">
              <ul className="nav navbar-nav">
                <li><Link className="active" to="/">Home</Link></li>
                <li><Link to="/contacts">Contact</Link></li>
                <li><Link to="/about">About</Link></li>
            </ul>
            <ul className="nav navbar-nav navbar-right">
                <li><Link to="/Signup"><span className="glyphicon glyphicon-user"></span> Sign Up</Link></li>
                <div className="dropdown">
                    <li><button className="glyphicon glyphicon-log-in dropbtn"> Login</button></li>
                    <div className="dropdown-content">
                        <Link to="/DocLogin">Doctor</Link>
                        <Link to="/PatientLogin">Patient</Link>
                        <Link to="/SysAdminLogin">System-Admin</Link>
                        
                    </div>
                </div>
            </ul>

          </div>
        </nav>


        <div className="container">
            <center><div className="page-header">
                <h5>THE UNIVERSITY OF HOUSTON</h5>
                <h1>Health-Care System</h1>
            </div></center>
        </div>
        {this.state.showDocSignin ? <DocLogin /> : null}        
        {this.state.showPatSignin ? <PatientLogin /> : null}        
        {this.state.showAdminSignin ? <SysAdminLogin /> : null}        
        
      
    </div>
    );
  }
}

export default Frontview;
