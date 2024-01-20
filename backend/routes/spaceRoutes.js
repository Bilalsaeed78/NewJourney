const express = require('express');
const router = express.Router();
const spaceController = require('../controller/spaceController');

router.post('/:category', spaceController.uploadSpace);

module.exports = router;
