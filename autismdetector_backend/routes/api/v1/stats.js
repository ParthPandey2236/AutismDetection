const express = require('express');

const passport = require('passport');

const router = express.Router();

const values = require('../../../controllers/api/v1/values');

router.post('/values',values.sendValues);

router.post('/valuesNorD',values.norDValues);

router.get("/scores",values.getValues);
router.get("/scoresNorD",values.norDValues);

router.get("/getAllValues",values.getAllValues);

module.exports = router;