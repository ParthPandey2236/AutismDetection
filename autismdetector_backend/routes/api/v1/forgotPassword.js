const express = require('express');

const router = express.Router();

router.post('/sendOTP',require('../../../controllers/api/v1/forgotPassword').sendOtp);

router.post('/verifyOTP',require('../../../controllers/api/v1/forgotPassword').verify);

module.exports = router;