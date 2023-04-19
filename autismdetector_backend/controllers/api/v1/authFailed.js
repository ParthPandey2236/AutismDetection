module.exports.authFailed = function (req,res){
    return res.status(422).json({
        message: "Invalid UserName/Password"
    });
}
//Controller created if authentication fails