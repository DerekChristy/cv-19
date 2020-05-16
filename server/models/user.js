const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const userSchema = new Schema({
  name: String,
  email: String,
  passwd: String,
  dob: Date
});

module.exports = mongoose.model('user', userSchema, 'users');
