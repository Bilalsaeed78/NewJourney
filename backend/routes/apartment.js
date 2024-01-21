const express = require('express');
const router = express.Router();
const Apartment = require('../models/apartmentmodel');

// Route to get all apartments
router.get('/', async (req, res) => {
  try {
    const apartments = await Apartment.find();
    res.status(200).json(apartments);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to get a specific apartment by ID
router.get('/:id', async (req, res) => {
  try {
    const apartment = await Apartment.findById(req.params.id);
    if (!apartment) {
      return res.status(404).json({ error: 'Apartment not found' });
    }
    res.status(200).json(apartment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to update a specific apartment by ID
router.put('/:id', async (req, res) => {
  try {
    const updatedApartment = await Apartment.findByIdAndUpdate(
      req.params.id,
      { $set: req.body },
      { new: true }
    );
    res.status(200).json(updatedApartment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to delete a specific apartment by ID
router.delete('/:id', async (req, res) => {
  try {
    const deletedApartment = await Apartment.findByIdAndDelete(req.params.id);
    if (!deletedApartment) {
      return res.status(404).json({ error: 'Apartment not found' });
    }
    res.status(200).json(deletedApartment);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to handle apartment uploads
router.post('/', async (req, res) => {
  try {
    const { title, description, price, location, phoneNumber,generatorBackup, floor, rooms, liftAvailability } = req.body;
    const newApartment = new Apartment({
      title,
      description,
      price,
      location,
      phoneNumber,
      generatorBackup,
      floor,
      rooms,
      liftAvailability,
    });
    const savedApartment = await newApartment.save();
    res.status(201).json(savedApartment);
  } catch (error) {
    console.error(error); // Log the error for debugging
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

module.exports = router;
