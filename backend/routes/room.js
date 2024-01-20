const express = require('express');
const router = express.Router();
const Room = require('../models/roommodel'); 

// Route to get all rooms
router.get('/room', async (req, res) => {
  try {
    const rooms = await Room.find();
    res.status(200).json(rooms);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to get a specific room by ID
router.get('/room/:id', async (req, res) => {
  try {
    const room = await Room.findById(req.params.id);
    if (!room) {
      return res.status(404).json({ error: 'Room not found' });
    }
    res.status(200).json(room);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to update a specific room by ID
router.put('/room/:id', async (req, res) => {
  try {
    const updatedRoom = await Room.findByIdAndUpdate(
      req.params.id,
      { $set: req.body },
      { new: true }
    );
    res.status(200).json(updatedRoom);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to delete a specific room by ID
router.delete('/room/:id', async (req, res) => {
  try {
    const deletedRoom = await Room.findByIdAndDelete(req.params.id);
    if (!deletedRoom) {
      return res.status(404).json({ error: 'Room not found' });
    }
    res.status(200).json(deletedRoom);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to handle room uploads
router.post('/', async (req, res) => {
  try {
    const { title, description, price, location, phoneNumber, wifiAvailability, generatorBackup } = req.body;
    const newRoom = new Room({
      title,
      description,
      price,
      location,
      phoneNumber,
      wifiAvailability,
      generatorBackup,
    });
    const savedRoom = await newRoom.save();
    res.status(201).json(savedRoom);
  } catch (error) {
    console.error(error); // Log the error for debugging
    res.status(500).json({ error: 'Internal Server Error' });
  }
// router.post('/', async (req, res) => {
//   try {
//     // Extracting room details from the request body
//     const {
//       title,
//       description,
//       price,
//       location,
//       phoneNumber,
//       wifiAvailability,
//       generatorBackup,
//     } = req.body;

//     // Creating a new instance of the Room model with the extracted details
//     const newRoom = new Room({
//       title,
//       description,
//       price,
//       location,
//       phoneNumber,
//       wifiAvailability,
//       generatorBackup,
//     });

//     // Saving the new room to the database
//     const savedRoom = await newRoom.save();

//     // Sending the saved room as a response
//     res.status(201).json(savedRoom);
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
});

module.exports = router;
