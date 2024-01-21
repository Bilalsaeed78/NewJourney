const mongoose = require('mongoose');

const apartmentSchema = new mongoose.Schema({
  title: {
    type: String,
  },
  description: {
    type: String,
  },
  price: {
    type: String,
  },
  location: {
    type: String,
  },
  phoneNumber: {
    type: String,
  },
  generatorBackup: {
    type: String,
  },
  floor: {
    type: String,
  },
  rooms: {
    type: String,
  },
  liftAvailability: {
    type: String,
  },

});

module.exports = mongoose.model('Apartment', apartmentSchema);
