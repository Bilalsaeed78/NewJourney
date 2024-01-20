// routes/officeRoutes.js
const express = require('express');
const router = express.Router();
const Office = require('../models/officeModel');

router.post('/office', async (req, res) => {
  try {
    // Extract fields from the request body
    const { title, description, price, location, phoneNumber, centralizedAC, standbyGenerator } = req.body;

    // Create a new office
    const office = new Office({ title, description, price, location, phoneNumber, centralizedAC, standbyGenerator });

    // Save the office to the database
    await office.save();

    // Respond with success message
    res.status(201).send('Office created successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});

module.exports = router;
