import React, { Component } from 'react';

class DocLogin extends Component {
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
        fetch('/doctorLogin', {
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
        replace('/Doctor');
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
        logMessage;
      }

        })
      });
    }
    e.preventDefault();
  }
  render() {
    return (
      <div className="DocLogin">
        <center><div className="panel panel-primary panel-resizable">
          <div className="panel-heading">
          <h3 className="panel-title">Doctor Login</h3>
          </div>
          <div className="panel-body">
            <form className="form-horizontal" onSubmit={this.handleSubmit.bind(this)}>
              <div className="form-group">
              <div className="inputcontainer">
                <input
                  type="text"
                  className="form-control"
                  placeholder="UserName"
                  ref="username"
                  required="true"
                />
                </div>
              </div>
              <div className="form-group">
              <div className="inputcontainer">
              <input
                type="password"
                className="form-control"
                placeholder="Password"
                ref="password"
                required="true"
              />
              </div>
              </div>
                              <center><h5><div className="alert alert-danger">
                  <strong>{this.state.loginMessage}</strong></div></h5></center>

              <center><input type="submit" className="btn btn-primary" value="Submit"/></center>
            </form>
            </div>
            <div>
              <h4>Manage your Dashboard online</h4>
              <h4><small>Update your Appointments</small></h4>
              <h4><small>Get health reminders</small></h4>
              <h4><small>View upcoming appointments</small></h4>
              <h4><small>View service history</small></h4>
            </div>
          </div></center>
      </div>
    );
  }
}

export default DocLogin;