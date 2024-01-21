const mongoose = require('mongoose');

const officeSchema = new mongoose.Schema({
  title: String,
  description: String,
  price: String,
  location: String,
  phoneNumber: String,
  wifiAvailability: String,
  acAvailability:String,
  cabinsAvailability:String,
});

module.exports = mongoose.model('Office', officeSchema);
