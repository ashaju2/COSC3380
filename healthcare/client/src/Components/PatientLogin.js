import React, { Component } from 'react';

class PatientLogin extends Component {
    constructor(){
    super();
    this.state = {
      login: {}
    };

  }

  handleSubmit(e) {
    var push = this.props.history.push;
    var replace = this.props.history.replace;
    console.log(push);
    
    if(this.refs.username.value){
      this.setState({login: {
          username: this.refs.username.value,
          password: this.refs.password.value
        }
      }, function() {
        fetch('/', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        username: this.state.login.username,
        password: this.state.login.password
      })
    }).then(function(response) {
      return response.json()
    }).then(function(responseJson){
      console.log(responseJson);
      if(responseJson === 1){
        console.log('Doctor');
//        push('/Doctor');
        console.log(responseJson);
      }
      else if(responseJson === 2){
        console.log('Patient');
        push('/Patient');
        console.log(responseJson);
      }
      else if(responseJson === 3){
        console.log('SysAdmin');
        //push('/SysAdmin');
        console.log(responseJson);
      }

        })
      });
    }
    e.preventDefault(); 
  }

  render() {
    return (
      <div className="PatientLogin">
        <div className="container">
            <div className="row">
                <div className="col-sm-4">
                    <h3>Login Page</h3>

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

export default PatientLogin;

