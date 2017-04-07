
/* Goals:
1 - User authentication for multiple roles|register - ❌
2 - data entry capabilities. Each role log in and enter, need web forms - (Working on it)
1 - User authentication for multiple roles|register - ❌(Jason)
2 - data entry capabilities. Each role log in and enter, need web forms - 
3 - at least 1 or 2 triggers some type of checks - ❌
4 - Queries and reports - ❌      
5 - Connect nodejs in RDS to react - ✔️
@@ -17,36 +17,72 @@ Doctor -> (does) -> Test -> (for) -> Patient
*/
import React, { Component } from 'react';
import Frontview from './Components/Frontview';
import Login from './Components/Login';
import './App.css';

class App extends Component {
  constructor(){
    super();
    this.state = {
      user: [{
        username: '',
        password: '',
       }],
      username: '',
      password: '',
      
    };
    this.onSubmit = this.handleSubmit.bind(this); 
  }
  handleSubmit(e) {
    e.preventDefault();
    // On submit of the form, send a POST request with the data to the server.
    
  }

  handleLogin(login){
    // let user = this.state.user;
    // user.push(login);
    // this.setState({user: user});
    this.setState({username: login.username});
    this.setState({password: login.password});

    fetch('/', { 
        method: 'POST',
        headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          username: login.username,
          password: login.password
        })
      })
  }

  render() {
    console.log(this.state.username);
    return (
      <div className="App">
        <Frontview />
        <form onSubmit={this.onSubmit}>
          <input 
            type="text" 
            placeholder="Name" 
            ref="name" 
            onChange={(e) => this.setState({ name: e.target.value})}
          />
          <input 
            type="text" 
            placeholder="Job" 
            ref="job"
            onChange={(e) => this.setState({ job: e.target.value })}
          />
          <input type="submit" />
        </form>
        <Login login={this.handleLogin.bind(this)}/>
        {this.state.username}

      </div>
    );
  }
}

export default App;
