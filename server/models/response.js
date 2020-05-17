const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const responseSchema = new Schema({
  email: String,
  responses: { date: Date, response: [String] },
});

module.exports = mongoose.model('response', responseSchema, 'responses');
