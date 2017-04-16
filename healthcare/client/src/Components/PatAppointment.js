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
        reason: '',
        appointDate: null,
        futureAppointment: null,
      };

  }

componentWillMount(){
  fetch('/futureAppointment')
    .then(response => response.json())
        .then((responseJson) => {
        this.setState({
            futureAppointment: responseJson
        })
        console.log(this.state.futureAppointment);

    })

}

handleSubmit(e){
      var push = this.props.history.push;
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
        push('/Submission');
        });

    e.preventDefault();
  }

  timeData(){
      let data = this.state.doctorData;
      if (!data) {
        return null
      }
      let iterator = data.map((ndata) => <div key={ndata.TimeSlotID}><input type="radio" name="options" selected={this.state.TimeSlotID == ndata.TimeSlotID} value={ndata.TimeSlotID} onChange={this.handleRadioChange.bind(this)}/>{ndata.StartTimeFormatted}</div>);
      console.log(iterator);
      return <h3>{iterator}</h3>
    }

  handleInputChange(event) {
    var property = event.target.id;
    this.setState({[property]: event.target.value});
  }

  handleRadioChange(event) {
    this.setState({ TimeSlotID: event.target.value });
  }

  handleDateChange(event){
    if (event.target.value.length !== 10) {
      console.log('not 10')
      this.setState({ doctorData: null })
      return
    }
    if (event.target.value.length === 10) {
      fetch('/DocAppointmentTimeSlot', {
      method: 'POST',
      headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        appointDate: event.target.value
      })
    })
    .then((response) => response.json())
        .then((responseJson) => {
          this.setState( {doctorData: responseJson} );
        console.log(this.state.doctorData);
    });
    }

  }

display(){
    if(!this.state.appointDate){
      return (
      <div className="form-group">
        <label className="checkbox">Pick a time slot</label>
        {this.timeData()}
      </div>
      )
    }
}

futureAppointment(){
  let futAppoint = this.state.futureAppointment;
      if (!futAppoint) {
        return null
      }
      let appointLoop = futAppoint.map((nfutAppoint) =>
                          <tr key={nfutAppoint.AppointmentID}>
                            <td className="text-center">{nfutAppoint.DateFormatted}</td>
                            <td className="text-center">{nfutAppoint.TimeFormatted}</td>
                          </tr>);
      console.log(appointLoop);
      return <tbody>{appointLoop}</tbody>
}

  render() {

    return (

      <div className="PatAppointment">
        <div className="row">
          <div className="col-xs-1 col-sm-1 col-md-1 col-lg-1">
          </div>
          <div className="col-xs-11 col-sm-11 col-md-11 col-lg-11">
            <div className="form-group">
              <h2>Health Care Appointment</h2>
            </div>
          </div>
        </div>
        <div className="row">
          <div className="col-sm-6">
            <form role="form" onSubmit={this.handleSubmit.bind(this)}>
              <div className="container-fluid">

              <div className="form-group">
                <label htmlFor="name">Reason/Notes</label>
                <textarea id='reason' type='text' className="form-control" value={this.state.reason} onChange={this.handleInputChange.bind(this)}></textarea>
                <label className="checkbox">Pick a Date</label>
                <input type='text' className="form-control" placeholder="yyyy-mm-dd"  onChange={this.handleDateChange.bind(this)}/>
              </div>
              {this.display()}
              <br></br>
              <pre>
                <button className="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
              </pre>
            </div>
          </form>
          </div>
          <div className="PatientFutureAppointments">
            <div className="col-xs-6 col-sm-6 col-md-6 col-lg-6">
              <h3>Upcoming Appointments</h3>
              <table className="table table-bordered table-striped table-hover table-bordered">
                <thead>
                  <tr>
                    <th className="col-xs-3 text-center">Date</th>
                    <th className="col-xs-3 text-center">Time</th>
                  </tr>
                </thead>
                  {this.futureAppointment()}
              </table>
          </div>
          </div>
          </div>
          </div>
          );
        }
}

export default PatAppointment;