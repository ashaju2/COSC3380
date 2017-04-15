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
        console.log(this.state.docCalendar);
    })
}

loopCalendar(){
      let calendar = this.state.docCalendar;
      if (!calendar) {
        return null
      }
      let calendarLoop = calendar.map((ncalendar) => <tr key={ncalendar.AppointmentID}>
                                  <td className="text-center">{ncalendar.Date}</td>
                                  <td className="text-center">{ncalendar.Fname}</td>
                                  <td className="text-center">{ncalendar.Lname}</td>
                                  <td className="text-center">{ncalendar.StartTime}</td>
                                </tr>);
      console.log(calendarLoop);
      return <h4>{calendarLoop}</h4>

}

  render() {
      if(!this.state.docCalendar){
          return <div><h5>Loading.......</h5><h5>Thank you for your patience</h5></div>
      }

    return (
      <div className="DocCalendar">
        <div className="PatientPrescriptionsList">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">Patient Prescriptions List</h3>
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
                      <th className="col-xs-2 text-center">First Name</th>
                      <th className="col-xs-2 text-center">Last Name</th>
                      <th className="col-xs-2 text-center">Start Time</th>
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

