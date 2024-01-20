const Space = require('../models/spaceModel');

exports.uploadSpace = async (req, res) => {
  try {
    const category = req.params.category;

    // Extract fields from the request body
    const { title, description, price, location, phoneNumber, additionalField1, additionalField2 } = req.body;

    // Create a new space
    const space = new Space({
      category,
      title,
      description,
      price,
      location,
      phoneNumber,
      additionalField1,
      additionalField2,
    });

    // Save the space to the database
    await space.save();

    // Respond with success message
    res.status(201).send(`${category} created successfully`);
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
};
