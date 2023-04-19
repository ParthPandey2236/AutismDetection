const express = require('express');

const router = express.Router();

router.get('/authFailed',require('../../../controllers/api/v1/authFailed').authFailed);
//route id auth fails

module.exports = router;