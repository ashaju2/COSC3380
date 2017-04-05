import React from 'react';
import { HashRouter as Router, IndexRoute, Route, Link } from 'react-router-dom';
import App from './App';
import './index.css';
import Login from './Components/Login';

const Routes = props => {
    return(
    <Router>
      <div>
        <Route path="/" component={App} />
        <Route path="/Login" component={Login} />
      </div>
    </Router>
)}

export default Routes