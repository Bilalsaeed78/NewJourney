const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const Hotel = require('../models/hotel');

// get All Hotels
router.get('/', async (req, res) => {
    const hotels = await Hotel.find({});
    res.status(201).send(hotels);
});


// Get specific hotel
router.get('/:id', async(req, res) => {
    const hotel = await Hotel.findById(req.params.id);
    if(!hotel){
        res.status(404).json({message: "Hotel not found."});
    }
    res.status(201).json(hotel);
});

router.post('/', async (req, res) => {
    const { title, description, price, location, phoneNumber } = req.body;
  
    if (!title || !description || !price || !phoneNumber) {
      res.status(401).json({ message: "Title, description, price, and phone number are required." });
      return;
    }
  
    try {
      const newHotel = await Hotel.create({
        title: title,
        description: description,
        price: price,
        location: location,
        phoneNumber: phoneNumber
      });
  
      res.status(201).json(newHotel);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: "Internal Server Error" });
    }
  });
  
// update hotel
router.put('/:id', async (req, res) => {
    const { title, description, price, location, phoneNumber } = req.body;

    try {
        const hotel = await Hotel.findById(req.params.id);

        if (!hotel) {
            res.status(404).json({ message: "Hotel not found!" });
            return; // Stop execution if hotel is not found
        }

        const updatedHotel = await Hotel.findByIdAndUpdate(
            req.params.id,
            { title, description, price, location, phoneNumber },
            { new: true }
        );

        res.status(200).json(updatedHotel);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Internal Server Error" });
    }
});

// delete hotel
router.delete('/:id', async(req, res) => {
    const hotel = await Hotel.findById(req.params.id);
    if(!hotel){
        res.status(401).json({message: "Hotel not found!"});
    }
    await Hotel.deleteOne({ _id: req.params.id });
    res.status(201).json(hotel);
});

module.exports = router;