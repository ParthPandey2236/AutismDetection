const jwt = require('jsonwebtoken');

const DoctorReference = require('../../../models/DoctorSchema');

module.exports.login = async function (req,res){
    try{
        let user = await DoctorReference.findOne({email : req.body.email , password : req.body.password});
        if(user){
            return res.status(200).json({
                message : "Token Created Successfully",
                data : {
                    token: jwt.sign(user.toJSON(), 'EncryptionKey', { expiresIn: 100000000 }),
                    user: user.id
                    //Created the token to be provided to the user
                }
                
            });
        }
        return res.status(422).json({
            message: "Invalid UserName/Password"
        });
    }
    catch(err){
        return res.status(500).json({
            message : err
        });

    }
}
//Controller to login the doctor