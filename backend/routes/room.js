const express = require('express');
const router = express.Router();
const Room = require('../models/roommodel'); 
const authenticateToken = require('./users'); 

// Route to get all rooms
router.get('/', async (req, res) => {
  try {
    const rooms = await Room.find();
    res.status(200).json(rooms);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Route to get a specific room by ID
router.get('/:id', async (req, res) => {
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
router.put('/:id', async (req, res) => {
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
router.delete('/:id', async (req, res) => {
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
});
// router.post('/', authenticateToken, async (req, res) => {
//   try {
//     const { userId } = req.user; // Retrieve user ID from authenticated user
//     const { title, description, price, location, phoneNumber, wifiAvailability, generatorBackup } = req.body;
    
//     const newRoom = new Room({
//       userId, // Associate user ID with the uploaded room
//       title,
//       description,
//       price,
//       location,
//       phoneNumber,
//       wifiAvailability,
//       generatorBackup,
//     });

//     const savedRoom = await newRoom.save();
//     res.status(201).json(savedRoom);
//   } catch (error) {
//     console.error(error);
//     res.status(500).json({ error: 'Internal Server Error' });
//   }
// });


module.exports = router;
