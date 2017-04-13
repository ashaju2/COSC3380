import React, { Component } from 'react';

class Submission extends Component {
  
  
    handleClick(){
        this.props.history.replace("/Patient");
    }

  render() {

    return (
      <div className="Submission">
        <center><h3>Your  Appointment is set!</h3></center>
        <br></br>
        <br></br>
        <button className="btn btn-primary btn-lg btn-block" type="submit" onClick={this.handleClick.bind(this)}>Return to Dashboard</button>

      </div>
    );
  }
}

export default Submission;

