
const StatisReference = require('../../../models/Statistics');
const norDData = require('../../../models/norD');
const { patient } = require('./register');
module.exports.sendValues = async function(req,res){
     let user = await StatisReference.findOne({patient:req.body.patient}).exec();
     if(user){
         return res.status(409).json({
                message: "The submit phone number already exists",
                data : user,
            });
     }
     let stat = await StatisReference.create(req.body);
     return res.status(200).json({
            message: "Stats Created",
           
        });
}

module.exports.norDValues = async function(req,res){
 let user = await norDData.create(req.body);
 return res.status(200).json({
    message : "NorDCreated"
 })
}

module.exports.getAllValues = async function(req,res){
    try{
        let allUserInfo = await StatisReference.find();
        return res.status(200).json({
            message: "The details are as listed",
            data : allUserInfo
        });
    }
    catch(e){
        return res.status(200).json({
                message: "Error in getting data",
                
            });
    }
}

module.exports.getValues = async function(req,res){
    let user = await StatisReference.findById({patient: req.body.patient_id});
    return res.status(200).json({
        data: user,
    });
}

module.exports.getNorDValues = async function(req,res){
    let user = await norDData.findById({patient: req.body.patient_id});
    return res.status(200).json({
        data : user,
    });
}