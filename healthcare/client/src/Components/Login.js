import React, { Component } from 'react';

class Login extends Component {
  constructor(){
    super();
    this.state = {
      login: {}
    };
  }
  handleSubmit(e) {
    if(this.refs.username.value){
      this.setState({login: {
          username: this.refs.username.value,
          password: this.refs.password.value
        }
      }, function(){
          this.props.login(this.state.login);   
      });
    }
    e.preventDefault(); 
  }

  
  render() {
    console.log(this.state.login);
    return (
      <div className="Login">

        <form onSubmit={this.handleSubmit.bind(this)}>
          <input 
            type="text" 
            placeholder="UserName" 
            ref="username" 
          />
          <input 
            type="text" 
            placeholder="Password" 
            ref="password"
          />
          <input type="submit" value="Submit"/>
        </form>

      </div>
    );
  }
}


export default Login;

