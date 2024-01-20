const mongoose = require('mongoose');

const spaceSchema = new mongoose.Schema({
  category: String,
  title: String,
  description: String,
  price: String,
  location: String,
  phoneNumber: String,
  additionalField1: String,
  additionalField2: String,
});

const Space = mongoose.model('Space', spaceSchema);

module.exports = Space;
