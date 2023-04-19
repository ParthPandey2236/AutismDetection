const nodemailerOtp = require('../../../mailer/OTP');

const DoctorReference = require('../../../models/DoctorSchema');

module.exports.sendOtp = async function(req,res){
    let user = await DoctorReference.findOne({email:req.body.email});
    if(user){
        var val = Math.floor(1000 + Math.random() * 9000);
        console.log(val);
        await DoctorReference.updateOne({_id: user._id},{$set:{otp:val}});
        nodemailerOtp.sendMail(req.body.email,val);
        return res.status(200).json({
            message:"OTP send to the provided mail",
        });
    }
     res.status(500).json({
            message:"No user Detected with provided mail",
    })
}

module.exports.verify = async function(req,res){
    let user = await DoctorReference.findOne({email:req.body.email, otp : Number(req.body.otp)});
    if(user){
        return res.status(200).json({
            message:"Otp verified",
        })
    }
    return res.status(500).json({
        message:"Invalid OTP",
    })
}