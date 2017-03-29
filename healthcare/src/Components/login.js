import React, { Component } from 'react';

class Login extends Component {
  constructor(){
    
  render() {
    return (
      <div className="Login">
        <Frontview />
        {this.state.projects.title}
      </div>
    );
  }
}

export default Login;

