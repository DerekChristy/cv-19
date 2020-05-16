const express = require('express');
const router = express.Router();
const User = require('../models/user');
const Response = require('../models/response');
const jwt = require('jsonwebtoken');
const KEY = 'cv-19-india';

router.get('/', (req, res) => {
  res.send('Hi from cv-19 API');
});
// TODO: complete user schema
router.get('/users', (req, res) => {
  User.find((err, users) => {
    if (err) {
      console.log(err);
    } else {
      res.status(200).json(users);
    }
  });
});

router.post('/addUser', (req, res) => {
  const data = req.body;
  console.log(req.body);
  const user = new User(data);
  console.log('POST addUser');
  User.findOne({ email: user.email }, (err, oldUser) => {
    if (err) {
    } else {
      if (oldUser === null) {
        user.save((err, newUser) => {
          if (err) {
            console.log(err);
            res.status(401).json(err);
          } else {
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
      // if(user.passwd === data.passwd){
      //   res.status(200).send({user, token});
      // } else {
      //   res.status(401).send("invalid password")
      // }
      // check password then
      let payload = { subject: data.email };
      let token = jwt.sign({ payload }, KEY);
      res.status(200).send({ token, user });
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
