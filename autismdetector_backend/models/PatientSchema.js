const mongoose = require('mongoose');

const Schema = mongoose.Schema({
    PhoneNo : {
        type : String,
        required : true,
    },
    doctor : {
        type : mongoose.Schema.Types.ObjectId,
        ref: 'DoctorDetails'
    },
    name : {
        type: String,
        required: true,
    },
    gender : {
        type: String,
    },
    
});
//Created Schema for PatientDetails

const CollectionReference = mongoose.model('PatientDetails',Schema);
//Named the collection as PatientDetails

module.exports = CollectionReference;