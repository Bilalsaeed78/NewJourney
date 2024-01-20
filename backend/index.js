const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const bodyParser = require('body-parser');
const cors = require('cors');
const userRoute = require('./routes/users');
const hotelRoute = require('./routes/hotels');
const roomRoutes =require('./routes/room');
const connectDatabase = require('./utils/database'); // Adjust the path as needed


const app = express();
const PORT = 3000;

app.use(express.json());
app.use(cors());

// Connect to the database and create the index
connectDatabase();
// app.use('/spaces', spaceRoutes);
app.use('/user', userRoute);
app.use('/hotel', hotelRoute);
app.use('/room', roomRoutes);
// app.use('/office', officeRoutes);
// app.use('/stay', stayRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
