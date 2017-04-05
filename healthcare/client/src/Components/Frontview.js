import React, { Component } from 'react';
import './Frontview.css';
import DocLogin from './DocLogin.js';
import PatientLogin from './PatientLogin.js';
import SysAdminLogin from './SysAdminLogin.js';


class Frontview extends Component {
  constructor(){
    super();
        this.state = {showDocSignin: false};
        this.state = {showPatSignin: false};
        this.state = {showAdminSignin: false};
        this.OpenDocSignin = this.OpenDocSignin.bind(this);
        this.OpenPatSignin = this.OpenPatSignin.bind(this);
        this.OpenAdminSignin = this.OpenAdminSignin.bind(this);
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
                <li><a className="active" href="#home">Home</a></li>
                <li><a href="#news">News</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#about">About</a></li>
            </ul>
            <ul className="nav navbar-nav navbar-right">
                <li><a href="#"><span className="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <div className="dropdown">
                <li><button className="glyphicon glyphicon-log-in dropbtn"> Login</button></li>
                    <div className="dropdown-content">
                        <a onClick={(e) => this.OpenDocSignin()}>Doctor</a>
                        <a onClick={(e) => this.OpenPatSignin()}>Patient</a>
                        <a onClick={(e) => this.OpenAdminSignin()}>System-Admin</a>
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
