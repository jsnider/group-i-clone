import React, { Component } from 'react';
import {NavLink} from 'react-router-dom';
import {ReactDOM, BrowserRouter as Router, Route, Link} from 'react-router-dom';
import Cookies from "universal-cookie";
import {withRouter} from "react-router-dom";
import qs from "query-string";

import Reviews from './Reviews.js';
import Footer from './Footer';
import Home from './Home.js';
import Course from './Course.js';
import Teacher from './Teacher.js'

import '../Style/Button.css';
import '../Style/Portal.css';
import 'typeface-roboto';

class PortalReview extends React.Component {
  constructor(props) {
    super(props);

     this.handleSingOut = this.handleSingOut.bind(this);
  }

  state = { 
    review: undefined
  }

  handleSingOut(e) {
    e.preventDefault();
    //TODO add so we remove the cookie
    this.props.history.push('/');
    console.log("TRY TO SIGN OUT")
  }

  componentWillMount() {
    const review_id = qs.parse(this.props.location.search).review_id;

    let fetchURL = `/api/reviews?review_id=${review_id}`;
    fetch( fetchURL )
      .then((res) => {
        if(res.status !== 200) {
          console.log('Looks like there was a problem. Status Code: ' +
            res.status);
          return;
        }
        console.log(res)
        res.json()
          .then(review => {
            const data = review[0]
            this.setState({ review: data })
          });
           
      })
    document.body.classList.remove('home');
    document.body.classList.add('portal'); //adding the correct background by setting the class of the body
  }

  render() {
    console.log(this.state.review);
    return (
      <div className="portal">
        <div className = 'header'>
          <h1>Back</h1>
          <div className = "signOutContainer">
            <button className="signOut" onClick={this.handleSingOut}>SIGN OUT</button>
          </div>
        </div>
        <div className="blueStripe"/>
        <Footer/> 
      </div>
    );
  };
}

export default withRouter(PortalReview);