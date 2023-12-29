const mongoose = require('mongoose');
const Hotel = require('../models/hotel'); // Adjust the path as needed

const connectDatabase = async () => {
  try {
    await mongoose.connect('mongodb://localhost:27017/Newjourney', {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });

    // Drop the existing index if needed
    await Hotel.collection.dropIndex('location_1');

    // Create the new index
    await Hotel.collection.createIndex(
      { location: 1 },
      { unique: false, partialFilterExpression: { location: { $exists: true } } }
    );

    console.log('Connected to the database');
  } catch (error) {
    console.error('Error connecting to the database:', error);
  }
};

module.exports = connectDatabase;
