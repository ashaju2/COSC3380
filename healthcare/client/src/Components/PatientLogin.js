import React, { Component } from 'react';

class PatientLogin extends Component {
    constructor(props){
    super(props);
    this.state = {
      login: {}
    };
  }

  handleSubmit(e) {
    var push = this.props.history.push;
    var replace = this.props.history.replace;
    var toggle = this.props.patientToggleLogin;

    if(this.refs.username.value){
      this.setState({login: {
          username: this.refs.username.value,
          password: this.refs.password.value
        }
      }, function() {
        fetch('/patientLogin', {
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
        toggle();
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
        <center><div className="panel panel-primary panel-resizable">
            <div className="panel-heading">
              <h3 className="panel-title">Patient Login</h3>
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
                  />
                  </div>
                  </div>
                  <input type="submit" className="btn btn-primary" value="Submit"/>
                </form>
              </div>
              <div>
                  <h4>Manage your health care online</h4>
                  <h4><small>Change your doctor</small></h4>
                  <h4><small>Update your contatc Infomation</small></h4>
                  <h4><small>Get health reminders</small></h4>
                  <h4><small>Schedule appointments</small></h4>
                  <h4><small>View service history</small></h4>
              </div>
            </div></center>
      </div>
    );
  }
}

export default PatientLogin;