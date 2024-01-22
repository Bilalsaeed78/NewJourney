const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const bodyParser = require('body-parser');
const cors = require('cors');
const userRoute = require('./routes/users');
const hotelRoute = require('./routes/hotels');
const roomRoutes = require('./routes/room');
const officeRoutes= require('./routes/office');
const apartmentRoutes =require('./routes/apartment')
const commonRoutes = require('./routes/commonroute');

const connectDatabase = require('./utils/database'); // Adjust the path as needed


const app = express();
const PORT = 3000;

app.use(express.json());
app.use(cors());

// Connect to the database and create the index
connectDatabase();
app.use('/user', userRoute);
app.use('/api', commonRoutes);
app.use('/hotel', hotelRoute);
app.use('/room', roomRoutes);
app.use('/office', officeRoutes);
app.use('/apartment', apartmentRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
