import React, { Component } from 'react';
import Login from './Login.js';
import './Frontview.css';

class Frontview extends Component {
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
                <li><a href="#"><span className="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul>

          </div>
        </nav>


        <div className="container">
            <form className="navbar-form navbar-right">
                <div className="input-group">
                    <input type="text" className="form-control" placeholder="Search"/>
                    <div className="input-group-btn">
                    <button className="btn btn-default" type="submit">
                        <i className="glyphicon glyphicon-search"></i>
                    </button>
                    </div>
                </div>
            </form>
            <div className="page-header">
                <h5>THE UNIVERSITY OF HOUSTON</h5>
                <h1>Health-Care System</h1>
            </div>
        </div>

         {this.props.projects.title} 
        <Login projectx={this.props.projects}/>
    </div>
    );
  }
}

export default Frontview;
