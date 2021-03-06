import React, { Component } from 'react';

class DocCalendar extends Component {
  constructor(props){
    super(props);
    this.state ={
        docCalendar: null,
    }
}

componentWillMount(){
  fetch('/newDocCalendar')
    .then(response => response.json())
        .then((responseJson) => {
        this.setState({
            docCalendar: responseJson
        })
        console.log("This is the doctor calendar in react:");
        console.log(this.state.docCalendar);
    })
}

loopCalendar(){
      let calendar = this.state.docCalendar;
      if (!calendar) {
        return null
      }
      let calendarLoop = calendar.map((ncalendar) =>
                                <tr key={ncalendar.AppointmentID}>
                                  <td className="text-center">{ncalendar.DateFormatted}</td>
                                  <td className="text-center">{ncalendar.StartTimeFormatted}</td>
                                  <td className="text-center">{ncalendar.Lname}, {ncalendar.Fname} {ncalendar.Minit}</td>
                                  <td className="text-center">{ncalendar.PurposeOfVisit}</td>
                                </tr>);
      console.log(calendarLoop);
      return <tbody>{calendarLoop}</tbody>

}

  render() {
      if(!this.state.docCalendar){
          return <div><h5>Loading.......</h5><h5>Thank you for your patience</h5></div>
      }

    return (
      <div className="DocCalendar">
        <div className="DoctorAppointmentsList">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">Doctor Appointments List for Today</h3>
              </div>
            </div>
          </div>
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table className="table table-bordered table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th className="col-xs-2 text-center">Date</th>
                      <th className="col-xs-2 text-center">Appointment Time</th>
                      <th className="col-xs-2 text-center">Patient Name</th>
                      <th className="col-xs-2 text-center">Purpose of Visit</th>
                    </tr>
                  </thead>
                    {this.loopCalendar()}
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default DocCalendar;
