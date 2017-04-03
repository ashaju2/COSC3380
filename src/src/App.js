import React, { Component } from 'react';
import uuid from 'uuid';
import $ from 'jquery';
import Patients from './Components/Patients';
import AddPatient from './Components/AddPatient';
import Todos from './Components/Todos';
import './App.css';

class App extends Component {
  constructor(){
    super();
    this.state = {
      patients: []
    }
  }

  getTodos(){
    $.ajax({
      url: 'https://jsonplaceholder.typicode.com/todos',
      dataType:'json',
      cache: false,
      success: function(data){
        this.setState({todos: data}, function(){
          console.log(this.state);
        });
      }.bind(this),
      error: function(xhr, status, err){
        console.log(err);
      }
    });
  }

  getPatients(){
    this.setState({patients: []});
  }

  componentWillMount(){
    this.getPatients();
  }

  componentDidMount(){
  }

  handleAddPatient(patient){
    let patients = this.state.patients;
    patients.push(patient);
    this.setState({patients:patients});
  }

  handleDeletePatient(id){
    let patients = this.state.patients;
    let index = patients.findIndex(x => x.id === id);
    patients.splice(index, 1);
    this.setState({patients:patients});
  }

  render() {
    return (
      <div className="App">
        <AddPatient addPatient={this.handleAddPatient.bind(this)} />
        <Patients patients={this.state.patients} onDelete={this.handleDeletePatient.bind(this)} />
      </div>
    );
  }
}

export default App;
