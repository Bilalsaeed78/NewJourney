const mongoose = require('mongoose');

const staySchema = new mongoose.Schema({
  title: String,
  description: String,
  price: String,
  location: String,
  phoneNumber: String,
  floorNumber: String,
  roomCount: String,
});

const Stay = mongoose.model('Stay', staySchema);

module.exports = Stay;
