const mongoose = require('mongoose');


const Schema = mongoose.Schema({
    status : {
        type : String,
        required : true,
    },
    date : {
        type : String,
        required : true,
    },
    patient : {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'PatientDetails',
    },
});
//Created schema for report

const CollectionSchema = mongoose.model('Report',Schema);
//Named the collection as Report

module.exports = CollectionSchema;