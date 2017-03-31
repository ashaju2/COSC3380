import React from 'react';
import { HashRouter as Router, Route, Link } from 'react-router-dom';
import App from './App';
import './index.css';
import Login from './Components/Login';

const Routes = props => {
    return(
    <Router>
      <div>
        <Route exact path="/" component={App} />
        <Route path="/Login" component={Login} />
        <ul role="nav">
          <li><Link to="/Login">Login</Link></li>
        </ul>
      </div>
    </Router>
)}

export default Routes