const express = require('express');
const router = express.Router();
const User = require('../models/user');
const Response = require('../models/response');
const jwt = require('jsonwebtoken');
const KEY = 'cv-19-india';

router.get('/', (req, res) => {
  res.send('Hi from cv-19 API');
});

// ! Remove this as anyone can get ALL the reg users info, only for dev purpose
router.get('/users', (req, res) => {
  User.find((err, users) => {
    if (err) {
      console.log(err);
    } else {
      res.status(200).json(users);
    }
  });
});

router.get('/user', verifyToken, (req, res) => {
  User.findOne({ email: req.email }, (err, user) => {
    if (err) {
      console.log(err);
      res.status(401).send(err);
    } else {
      res.status(200).json(user);
    }
  });
});

router.post('/resposes', (req, res) => {
  let resp = { date: Date.now(), respnse: req.body };
  let resObj = { email: req.email, response: resp };
  const response = new Response(resObj);
  response.save((err, newRes) => {
    if (err) {
      console.log(err);
      res.status(401).send(err);
    } else {
      console.log('saved response from', newRes.email);
      res.sendStatus(200);
    }
  });
});

router.post('/addUser', (req, res) => {
  const data = req.body;
  console.log(req.body);
  const user = new User(data);
  User.findOne({ email: user.email }, (err, oldUser) => {
    if (err) {
    } else {
      if (oldUser === null) {
        user.save((err, newUser) => {
          if (err) {
            console.log(err);
            res.status(401).json(err);
          } else {
            console.log('new user added', newUser);
            res.status(200).json(newUser);
          }
        });
      } else {
        res.status(409).send({ message: 'user already exists' });
      }
    }
  });
});

router.post('/login', (req, res) => {
  let data = req.body;
  console.log(req.body);
  User.findOne({ email: data.email }, (err, user) => {
    if (err) {
      console.log(err);
      res.status(401).send(err);
    } else {
      if (user !== null) {
        if (user.passwd === data.passwd) {
          console.log('login successful');
          let payload = { subject: data.email };
          let token = jwt.sign({ payload }, KEY);
          res.status(200).send({ token, user });
        } else {
          console.log('invalid passwd');
          res.status(401).send('invalid password');
        }
      } else {
        res.status(401).send('user not found');
      }
    }
  });
});

function verifyToken(req, res, next) {
  if (!req.headers.authorization) {
    return res.status(401).send('Unauthorised request');
  }
  let token = req.headers.authorization.split(' ')[1];
  if (token === 'null') {
    return res.status(401).send('Unauthorised request');
  }
  let payload = jwt.verify(token, KEY);
  if (!payload) {
    return res.status(401).send('Unauthorised request');
  }
  // phone or email, check jwt sign
  req.email = payload.payload.subject;
  next();
}

module.exports = router;
