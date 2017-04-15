import React, { Component } from 'react';

class contacts extends Component {
  render() {
    return (
      <div className="contacts">
        <div className="container-fluid">
          <div className="row">
            <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <h3 className="text-left">Contacts</h3>
            </div>
          </div>
        </div>
        <div className="container-fluid">
          <div className="row">
            <div className="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <table className="table table-bordered table-striped table-hover table-bordered">
                <thead>
                  <tr>
                    <th className="col-xs-3 text-center">Name</th>
                    <th className="col-xs-3 text-center">Position</th>
                    <th className="col-xs-3 text-center">Email</th>
                    <th className="col-xs-3 text-center">Phone</th>
                  </tr>
                </thead>
                <tbody>
                <tr>
                  <td className="text-center">Thang</td>
                  <td className="text-center">Admin</td>
                  <td className="text-center">ccc@gmail.com</td>
                  <td className="text-center">999-999-9999</td>
                </tr>
                  <tr>
                    <td className="text-center">Alen</td>
                    <td className="text-center">Admin</td>
                    <td className="text-center">ccc@gmail.com</td>
                    <td className="text-center">999-999-9999</td>
                  </tr>
                  <tr>
                    <td className="text-center">Jason</td>
                    <td className="text-center">Admin</td>
                    <td className="text-center">ccc@gmail.com</td>
                    <td className="text-center">999-999-9999</td>
                  </tr>
                  <tr>
                    <td className="text-center">Matthew</td>
                    <td className="text-center">Admin</td>
                    <td className="text-center">ccc@gmail.com</td>
                    <td className="text-center">999-999-9999</td>
                  </tr>
                  <tr>
                    <td className="text-center">Tim</td>
                    <td className="text-center">Admin</td>
                    <td className="text-center">ccc@gmail.com</td>
                    <td className="text-center">999-999-9999</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default contacts;
