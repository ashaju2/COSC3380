import React, { Component } from 'react';

class reports extends Component {
    constructor(props){
        super(props);
        this.state = {
            query: {}
        };
        this.state ={
            responseJson : []
        };
        
        this.handleSubmit = this.handleSubmit.bind(this);

    }

    handleSubmit(e){
        var push = this.props.history.push;
        if(this.refs.firstName.value){
        this.setState({query: {
            patientID: this.refs.patientID.value,
            firstName: this.refs.firstName.value,
            lastName: this.refs.lastName.value
        }
      }, function() {
        fetch('/report', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        patientID: this.state.query.patientID,
        firstName: this.state.query.firstName,
        lastName: this.state.query.lastName
        
      })
    }).then(response => response.json())
        .then((responseJson) => {
        this.setState({
            responseJson
        })
        console.log(this.responseJson);
    })
      });
    }
    e.preventDefault(); 
  }
    

  render() {
    return (
      <div className="reports">
    <div>        
        <form onSubmit={this.handleSubmit.bind(this)}>
            <input 
                type="text" 
                placeholder="Patient ID" 
                ref="patientID" 
            />
            <input 
                type="text" 
                placeholder="Patient First Name" 
                ref="firstName" 
            />
            <input 
                type="text" 
                placeholder="Patient Last Name" 
                ref="lastName"
            />
            <input type="submit" value="Submit"/>
        </form>
        </div>
        <div>


        </div>
      </div>
    );
  }
}

export default reports;

