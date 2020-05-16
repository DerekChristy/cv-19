const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const responseSchema = new Schema({
  email: String,
  response: {date: Date, response: [String]}
}); 

module.exports = mongoose.model('response', userSchema, 'responseSchema');
