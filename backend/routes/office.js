const express = require('express');
const router = express.Router();
const Office = require('../models/officemodel'); 

// Route to get all offices
router.get('/', async (req, res) => {
  try {
    const offices = await Office.find();
    res.status(200).json(offices);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to get a specific office by ID
router.get('/:id', async (req, res) => {
  try {
    const office = await Office.findById(req.params.id);
    if (!office) {
      return res.status(404).json({ error: 'Office not found' });
    }
    res.status(200).json(office);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to update a specific office by ID
router.put('/:id', async (req, res) => {
  try {
    const updatedOffice = await Office.findByIdAndUpdate(
      req.params.id,
      { $set: req.body },
      { new: true }
    );
    res.status(200).json(updatedOffice);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to delete a specific office by ID
router.delete('/:id', async (req, res) => {
  try {
    const deletedOffice = await Office.findByIdAndDelete(req.params.id);
    if (!deletedOffice) {
      return res.status(404).json({ error: 'Office not found' });
    }
    res.status(200).json(deletedOffice);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to handle office uploads
router.post('/', async (req, res) => {
  try {
    const { title, description, price, location, phoneNumber, wifiAvailability, acAvailability, cabinsAvailability } = req.body;
    const newOffice = new Office({
      title,
      description,
      price,
      location,
      phoneNumber,
      wifiAvailability,
      acAvailability,
      cabinsAvailability,
    });
    const savedOffice = await newOffice.save();
    res.status(201).json(savedOffice);
  } catch (error) {
    console.error(error); // Log the error for debugging
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
