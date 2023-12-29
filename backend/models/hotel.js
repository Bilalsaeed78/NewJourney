const mongoose = require('mongoose');

const hotelScheme = new mongoose.Schema({
  title: { type: String, required: true },
  description: { type: String, required: true },
  price: { type: String, required: true },
  location: { type: String },
  phoneNumber: { type: String, unique: true }
});

const Hotel = mongoose.model('Hotel', hotelScheme);

module.exports = Hotel;
