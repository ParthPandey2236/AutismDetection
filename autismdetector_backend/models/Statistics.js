const mongoose = require('mongoose');


const Schema = mongoose.Schema({
    MotorDevelopment : {
        type : Number,
        default : 0,
    },
    LANGUAGE_AND_COMMUNICATION  : {
        type : Number,
        default : 0,
    },
    SOCIAL_EMOTIVE_BEHAVIOR  : {
        type : Number,
        default : 0,
    },
     SELF_HELP  : {
        type : Number,
        default : 0,
    },
     ATTACHMENT  : {
        type : Number,
        default : 0,
    },
    Temperament:{
        type:Number,
        default:0
    },
    ADAPTIVE : {
        type : Number,
        default : 0,
    },
    patient : {
        type : mongoose.Schema.Types.ObjectId,
        ref: 'PatientDetails',
    },
},{ minimize: false });


const CollectionSchema = mongoose.model('Statistics',Schema);


module.exports = CollectionSchema;