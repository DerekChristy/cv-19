const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  res.send('Hi from cv-19 API');
});

module.exports = router;
