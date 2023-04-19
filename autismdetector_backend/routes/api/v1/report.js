const express = require('express');

const passport = require('passport');

const router = express.Router();

const Reports = require('../../../controllers/api/v1/report');

router.post('/patients/:id/create_report',Reports.createReport);
//route to create report of a patient

router.get('/patients/:id/all_reports',Reports.allReports);
//route to get all reports of a patient

router.get('/reports/:status',Reports.statusVise);
//route to get all reports of a specific status

module.exports = router;