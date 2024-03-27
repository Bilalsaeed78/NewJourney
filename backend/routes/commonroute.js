// // routes/commonRoutes.js
// const express = require('express');
// const router = express.Router();
// // const MeiliSearch = require('meilisearch');
// const { MeiliSearch } = require('meilisearch');  // <-- Updated import
// const Room = require('../models/roommodel');
// const Office = require('../models/officemodel');
// const Apartment = require('../models/apartmentmodel');

// // Initialize MeiliSearch client
// const meiliClient = new MeiliSearch({
//   host: 'http://localhost:7700', // Replace with your MeiliSearch server URL
//   apiKey: 'cd13d088-21cf-4286-ae61-0643d321dd9e', // Replace with your MeiliSearch API key
// });

// // Function to index a document in MeiliSearch
// async function indexDocument(index, document) {
//   try {
//     await index.addDocuments([document]);
//   } catch (error) {
//     console.error('MeiliSearch Indexing Error:', error);
//   }
// }

// // Function to get all documents of a specific type
// async function getAllDocuments(model) {
//   try {
//     return await model.find();
//   } catch (error) {
//     console.error('MongoDB Fetch Error:', error);
//     throw error;
//   }
// }

// // Function to handle document uploads and indexing
// async function handleDocumentUpload(req, res, model, indexName) {
//   try {
//     const { title, description, price, location, phoneNumber, wifiAvailability, generatorBackup, acAvailability, cabinsAvailability, floor, rooms, liftAvailability } = req.body;
//     const newDocument = new model({
//       title,
//       description,
//       price,
//       location,
//       phoneNumber,
//       wifiAvailability,
//       generatorBackup,
//       acAvailability,
//       cabinsAvailability,
//       floor,
//       rooms,
//       liftAvailability,
//     });

//     // Save the document to MongoDB
//     const savedDocument = await newDocument.save();

//     // Index the document in MeiliSearch
//     const documentIndex = meiliClient.index(indexName); // Replace 'rooms', 'offices', or 'apartments' with the desired index name
//     await indexDocument(documentIndex, savedDocument.toObject());

//     res.status(201).json(savedDocument);
//   } catch (error) {
//     console.error(error); // Log the error for debugging
//     res.status(500).json({ error: 'Internal Server Error' });
//   }
// }

// // Route to get all rooms
// router.get('/rooms', async (req, res) => {
//   try {
//     const rooms = await getAllDocuments(Room);
//     res.status(200).json(rooms);
//   } catch (error) {
//     res.status(500).json({ error: 'Internal Server Error' });
//   }
// });

// // Route to handle room uploads
// router.post('/rooms', async (req, res) => {
//   await handleDocumentUpload(req, res, Room, 'rooms');
// });

// // Route to get all offices
// router.get('/offices', async (req, res) => {
//   try {
//     const offices = await getAllDocuments(Office);
//     res.status(200).json(offices);
//   } catch (error) {
//     res.status(500).json({ error: 'Internal Server Error' });
//   }
// });

// // Route to handle office uploads
// router.post('/offices', async (req, res) => {
//   await handleDocumentUpload(req, res, Office, 'offices');
// });

// // Route to get all apartments
// router.get('/apartments', async (req, res) => {
//   try {
//     const apartments = await getAllDocuments(Apartment);
//     res.status(200).json(apartments);
//   } catch (error) {
//     res.status(500).json({ error: 'Internal Server Error' });
//   }
// });

// // Route to handle apartment uploads
// router.post('/apartments', async (req, res) => {
//   await handleDocumentUpload(req, res, Apartment, 'apartments');
// });

// module.exports = router;
