// routes/stayRoutes.js
const express = require('express');
const router = express.Router();
const Stay = require('../models/stayModel');
const mongoose = require('mongoose');

router.post('/stay', async (req, res) => {
  try {
    // Extract fields from the request body
    const { title, description, price, location, phoneNumber, floorNumber, roomCount } = req.body;

    // Create a new stay
    const stay = new Stay({ title, description, price, location, phoneNumber, floorNumber, roomCount });

    // Save the stay to the database
    await stay.save();

    // Respond with success message
    res.status(201).send('Stay created successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});

module.exports = router;
