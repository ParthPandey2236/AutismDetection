const mongoose = require('mongoose');

const Schema  = mongoose.Schema({
    email: {
        type : String,
        required : true,
    },
    password : {
        type : String ,
        required : true,
    },
    name : {
        type : String,
        required : true,
    },
    otp: {
        type : Number,
    },
    report: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Report',
        }
    ],
});
//created schema for doctorDetails

const CollectionReference = mongoose.model('DoctorDetails',Schema);
//named the collection as DoctorDetails

module.exports = CollectionReference;