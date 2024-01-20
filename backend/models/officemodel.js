const mongoose = require('mongoose');

const officeSchema = new mongoose.Schema({
  title: String,
  description: String,
  price: String,
  location: String,
  phoneNumber: String,
  centralizedAC: String,
  standbyGenerator: String,
});

const Office = mongoose.model('Office', officeSchema);

module.exports = Office;
