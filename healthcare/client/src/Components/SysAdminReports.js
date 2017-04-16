import React, { Component } from 'react';

class SysAdminReports extends Component {
    constructor(props){
        super(props);
        this.state = {
            doctorStats: null
        }
    }

componentWillMount(){
    fetch('/DoctorStats')
      .then(response => response.json())
        .then((responseJson) => {
        this.setState({
            doctorStats: responseJson
        })
        console.log("These are the doctor Stats in react:");
        console.log(this.state.doctorStats);
    });
}

doctorStatsIterator(){
    let data = this.state.doctorStats;
    if (!data) {
      return null
    }
    let iterator = data.map((ndata) =>
                                <tr key={ndata.DoctorID}>
                                  <td className="text-center">{ndata.Lname}</td>
                                  <td className="text-center">{ndata.DoctorID}</td>
                                  <td className="text-center">{ndata.ApptsThisMonth}</td>
                                </tr>);
    console.log(iterator);
    return <tbody>{iterator}</tbody>;
}

  render() {
      if(!this.state.doctorStats){
          return <div><h5>Loading.......</h5><h5>Thank you for your patience</h5></div>
      }
    return (
      <div className="SysAdminReports">
        <div className="DoctorStats">
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3 className="text-left">Doctor Appointments Statistics this Month</h3>
              </div>
            </div>
          </div>
          <div className="container-fluid">
            <div className="row">
              <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table className="table table-bordered table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th className="col-xs-4 text-center">Doctor Name</th>
                      <th className="col-xs-4 text-center">DoctorID</th>
                      <th className="col-xs-4 text-center">Appointments This Month</th>
                    </tr>
                  </thead>
                  {this.doctorStatsIterator()}
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default SysAdminReports;
