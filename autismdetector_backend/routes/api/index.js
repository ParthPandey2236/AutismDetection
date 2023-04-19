const express = require('express');

const router = express.Router();

router.use('/api/v1',require('./v1/login'));
router.use('/api/v1',require('./v1/register'));
router.use('/api/v1',require('./v1/report'));
router.use('/api/v1',require('./v1/authFailed'));
router.use('/api/v1',require('./v1/forgotPassword'));

router.use('/api/v1',require('./v1/stats'));
//added routeing for scalability
router.get('/api',async function(req,res){
    return res.send("hello");
})

module.exports=router;