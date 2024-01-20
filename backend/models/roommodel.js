const mongoose = require('mongoose');

const roomSchema = new mongoose.Schema({
  title: String,
  description: String,
  price: String,
  location: String,
  phoneNumber: String,
  wifi: String,
  generatorBackup: String,
});

const Room = mongoose.model('Room', roomSchema);

module.exports = Room;
