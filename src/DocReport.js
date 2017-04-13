import React, { Component } from 'react';

class DocReport extends Component {
  constructor(){
    super();
    this.state = {rows: [{}]};
    this.state = {getPatientReport: false};
    this.state = {getPrescriptionReport: false};
    this.state = {getAppointmentReport: false};
    this.OpenPatientReport = this.OpenPatientReport.bind(this);
    this.OpenPrescriptionReport = this.OpenPrescriptionReport.bind(this);
    this.OpenAppointmentReport = this.OpenAppointmentReport.bind(this);
  }
  OpenPatientReport(){
      this.setState({getPatientReport: true});
  }
  OpenPrescriptionReport(){
      this.setState({getPrescriptionReport: true});
  }
  OpenAppointmentReport(){
      this.setState({getAppointmentReport: true});
  }

  handleSubmit(e) {
     var report = document.forms[0];
     //report[0] - Patients
     //report[1] - prescription
     //report[2] - appointment
     var tabledata = [];
     var tablecounter = 0;
     for (var i = 0; i < report.length; i++){
       if (report[i].checked){
         //fetch data
         //tabledata[tablecounter] is all patient, all prescription, or all appointment
         //set tabledata[tablecounter] = the data fetched from server
         tabledata[tablecounter] = report[i].value + " fetched from database" + "\n";
         tablecounter++;
       }
     }
     this.setState({rows: tabledata});

    e.preventDefault();
  }
  render() {
    return (
      <div className="DocReport">
        <div className="container">
          <p>Hold down the Ctrl (windows) / Command (Mac) button to select multiple options.</p>
          <form onSubmit={this.handleSubmit.bind(this)}>
          <pre><input type="checkbox" value="Patient"/> Patients</pre>
          <pre><input type="checkbox" value="Prescription"/> Prescriptions</pre>
          <pre><input type="checkbox" value="Appointment"/> Appointments</pre>
          <input type="submit" />
          </form>
        </div>

        <div className="container">
            <br /><pre><strong>Information</strong>
            <table>
              <tbody>
                {this.state.rows}
              </tbody>
            </table>
            </pre>
        </div>
      </div>
    );
  }
}

export default DocReport;
