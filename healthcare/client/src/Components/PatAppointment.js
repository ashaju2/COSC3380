import React, { Component } from 'react';

class PatAppointment extends Component {
    constructor(){
      super();
      this.state = {
        appointmentData: {},
        doctorData: null,
        lastName: '',
        firstName: '',
        TimeSlotID: null,
        reason: ''
      };
      
  }


componentWillMount(){
     fetch('/DocAppointmentTimeSlot', { method: 'GET'})
        .then((response) => response.json())
        .then((responseJson) => {
          this.setState( {doctorData: responseJson} );
        console.log(this.state.doctorData);
    });


}

handleSubmit(e){
      fetch('/patappointment', { 
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        reason: this.state.reason,
        TimeSlotID: this.state.TimeSlotID,
      })
    }).then(function(response) {
      return response.json()
    }).then(function(responseJson){
        console.log("Yess, it worked");
        });

    e.preventDefault(); 
  }

  timeData(){
      let data = this.state.doctorData;
      let iterator = data.map((ndata) => <li key={ndata.TimeSlotID}><input type="radio" name="options" selected={this.state.TimeSlotID == ndata.TimeSlotID} value={ndata.TimeSlotID} onChange={this.handleRadioChange.bind(this)}/>{ndata.StartTime}</li>);
      console.log(iterator);
      return <h1>{iterator}</h1>
    }

  handleInputChange(event) {
    var property = event.target.id;
    this.setState({[property]: event.target.value});
  }

  handleRadioChange(event) {
    this.setState({ TimeSlotID: event.target.value });
  }
  render() {
    if(!this.state.doctorData){
      return <div><br></br>Loading............ <br></br>Thank you for your patience</div>
    }


    return (
      <div className="PatAppointment">
        {this.state.doctorData[0].TimeSlotID}
        {this.iter}
        <div className="row">
          <div className="col-sm-5">
      <form role="form" onSubmit={this.handleSubmit.bind(this)}>
        <div className="container-fluid">

        <div className="form-group">
          <h2>Health Care Appointment</h2>
          <label htmlFor="name">Last Name</label>
          <input id='lastName' type='text' className='form-control' value={this.state.lastName} onChange={this.handleInputChange.bind(this)} />
          <label htmlFor="name">First Name</label>
          <input id="firstName" type="type" className="form-control" value={this.state.firstName} onChange={this.handleInputChange.bind(this)} />
        </div>

      <div className="form-group">
        <label htmlFor="name">Reason/Notes</label>
        <textarea id='reason' type='text' className="form-control" value={this.state.reason} onChange={this.handleInputChange.bind(this)}></textarea>
        <label className="checkbox">Pick a time slot</label>
        {this.timeData()}
        {/*<TimeData data={this.state.doctorData}/>*/}
      </div>

      <br></br>
      <br></br>

      <pre>
      <button className="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
      </pre>
      </div>
      </form>
      </div>

      <div className="col-sm-3">

        
      </div>
      </div>
            </div>
          );
        }
}

export default PatAppointment;

