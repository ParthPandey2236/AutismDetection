const express = require('express');

const router = express.Router();

const passport = require('passport');

const Register = require('../../../controllers/api/v1/register');
//Imported the controller
//passport.authenticate('jwt', { session: false, failureRedirect: '/api/v1/authFailed' })
router.post('/doctors/register',Register.doctor);
//route for doctor to register

router.post('/patients/register', Register.patient);
//route to patient to register by doctors authenticated by passport-jwt

module.exports = router;