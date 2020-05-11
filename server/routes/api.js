const express = require('express');
const router = express.Router();
const User = require('../models/user');

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

router.post('/user', (req, res) => {
  const data = req.body;
  const user = new User(data);
  user.save((err, newUser) => {
    if (err) {
      console.log(err);
      res.status(401).json(err);
    } else {
      res.status(200).json(newUser);
    }
  });
});

module.exports = router;
