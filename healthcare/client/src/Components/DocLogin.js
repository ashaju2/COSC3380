import React, { Component } from 'react';
import data from '../data'

class DocLogin extends Component {
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
        data.doctorLoggedIn = true;
        if(data.doctorLoggedIn == true){
        push('/Doctor');} 
        console.log(responseJson);
      }
      else if(responseJson === 2){
        console.log('Patient');
//        push('/Patient');
        console.log(responseJson);
      }
      else if(responseJson === 3){
        console.log('SysAdmin');
//        push('/SysAdmin');
        console.log(responseJson);
      }
      else{
        console.log("Wrong username or password");
      }

        })
      });
    }
    e.preventDefault(); 
  }
  render() {
    return (
      <div className="DocLogin">
         <div className="container">
            <div className="row">
                <div className="col-sm-6 well">
                    <h3>Login Page</h3>

                      <form className="form-horizontal" onSubmit={this.handleSubmit.bind(this)}>
                        <div className="form-group">
                        <label className="control-label col-sm-3" for="username">Username:</label>
                        <div className="col-sm-0">
                          <input 
                            type="text" 
                            placeholder="UserName" 
                            ref="username" 
                          />
                          </div>
                          </div>
                        <div className="form-group">
                        <label className="control-label col-sm-3" for="username">Password:</label>
                        <div className="col-sm-0">
                        
                        <input 
                          type="text" 
                          placeholder="Password" 
                          ref="password"
                        />
                        </div>
                        </div>
                        <center><input type="submit" value="Submit"/></center>
                      </form>

                </div>
                <div className="col-sm-4">
                  <div className="well">
                    <div className="panel panel-default">
                      <div className="panel-body"><h3>Manage your Dashboard online</h3></div>
                    </div>
                    
                    <br></br>
                    <h4>Update your Appointments</h4>
                    <h4>Get health reminders</h4>
                    <h4>View upcoming appointments</h4>
                    <h4>View service history</h4>
                    </div>
                </div>
            </div>
        </div>

      </div>
    );
  }
}

export default DocLogin;

