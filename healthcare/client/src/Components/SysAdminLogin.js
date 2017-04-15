import React, { Component } from 'react';

class SysAdminLogin extends Component {
  constructor(props){
    super(props);
    this.state = {
      login: {},
      loginMessage: ''
    };
    console.log(props);
  }

  handleSubmit(e) {
    var push = this.props.history.push;
    var toggle = this.props.doctorToggleLogin;
    var replace = this.props.history.replace;
    var logMessage = this.setState({loginMessage: 'Wrong user name or password!'});
    if(this.refs.username.value){
      this.setState({login: {
          username: this.refs.username.value,
          password: this.refs.password.value
        }
      }, function() {
        fetch('/sysAdminLogin', { 
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
        toggle();
//        replace('/Doctor'); 
        console.log(responseJson);
      }
      else if(responseJson === 2){
        console.log('Patient');
//        push('/Patient');
        console.log(responseJson);
      }
      else if(responseJson === 3){
        console.log('SysAdmin');
        replace('/SysAdmin');
        console.log(responseJson);
      }
      else{
        logMessage;
      }

        })
      });
    }
    e.preventDefault(); 
  }
  render() {
    return (
      <div className="SysAdminLogin">
         <div className="container">
            <div className="row">
                <div className="col-sm-6 well">
                    <h3>Login Page</h3>

                      <form className="form-horizontal" onSubmit={this.handleSubmit.bind(this)}>
                        <div className="form-group">
                        <label className="control-label col-sm-3" htmlFor="username">Username:</label>
                        <div className="col-sm-0">
                          <input 
                            type="text" 
                            placeholder="UserName" 
                            ref="username" 
                            required="true"
                          />
                          </div>
                          </div>
                        <div className="form-group">
                        <label className="control-label col-sm-3" htmlFor="username">Password:</label>
                        <div className="col-sm-0">
                        
                        <input 
                          type="password" 
                          placeholder="Password" 
                          ref="password"
                          required="true"
                        />
                        </div>
                        </div>
                        <center><h5><div className="alert alert-danger">
                          <strong>{this.state.loginMessage}</strong></div></h5></center>
                        <center><input type="submit" value="Submit"/></center>
                      </form>

                </div>
                <div className="col-sm-4">
                  <div className="well">
                    <div className="panel panel-default">
                      <div className="panel-body"><h3>Manage your Dashboard online</h3></div>
                    </div>
                    
                    <br></br>
                    <h4>Generate Reports</h4>
                    <h4>Make updates</h4>
                    </div>
                </div>
            </div>
        </div>

      </div>
    );
  }
}

export default SysAdminLogin;

