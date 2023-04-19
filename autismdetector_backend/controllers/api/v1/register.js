const DoctorReference = require('../../../models/DoctorSchema');

const PatientReference = require('../../../models/PatientSchema');

module.exports.doctor = async function (req,res){
    try{
        let user = await DoctorReference.create(req.body);
        return res.status(200).json({
            message : "User Created"
        });
    }
    catch(err){
        console.log("Error while creating the user",err);
        return res.status(500).json({
            message : err
        });
    }
}
//Controller Added to register doctor

module.exports.patient = async function(req,res){
    try{
        let verify = await PatientReference.findOne({PhoneNo : req.body.PhoneNo}).populate('doctor').exec();
        if(verify){
            return res.status(409).json({
                message: "The submit phone number already exists",
                data : verify,
            });
            //If the phoneNo already exists
        }
        console.log(req.body.doctor_id);
        let user = await PatientReference.create({PhoneNo : req.body.PhoneNo , name : req.body.name , doctor : req.body.doctor_id,gender : req.body.gender, age:Number(req.body.age)});
        return res.status(200).json({
            message: "User Created",
            data : {
                patientId : user._id
            }
        });
    }
    catch(err){
        return res.status(500).json({
            message: err
        });
    }
}
//Controller added to register patient