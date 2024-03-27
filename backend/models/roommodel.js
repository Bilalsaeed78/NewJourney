const mongoose = require('mongoose');

const roomSchema = new mongoose.Schema({
  // userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' }, 
  title: String,
  description: String,
  price: String,
  location: String,
  phoneNumber: String,
  wifiAvailability: String,
  generatorBackup: String,
});

const Room = mongoose.model('Room', roomSchema);

module.exports = Room;
