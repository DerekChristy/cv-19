const express = require('express');
const app = express();
const mongoose = require('mongoose');
const api = require('./routes/api');
const PORT = process.env.PORT || 3000;

app.use('/api', api);

require('dotenv').config();
const db = process.env.MONGODB_URI;
const options = {
  useUnifiedTopology: true,
  useNewUrlParser: true,
};

mongoose.connect(db, options, (err) => {
  if (err) {
    console.error('Datebase ERROR!: ' + err);
  } else {
    console.log('Database connection sucessful');
  }
});

app.get('/', (req, res) => {
  res.send('Hello from server');
});

app.listen(PORT, () => {
  console.log('Server running at port', PORT);
});
