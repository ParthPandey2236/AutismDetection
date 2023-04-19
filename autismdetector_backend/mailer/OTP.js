const nodeMailerConfig = require('../config/nodemailer');

module.exports.sendMail = async function(mail,otp){
    console.log('nodemailer Info File Called');
    await nodeMailerConfig.transporter.sendMail({
    from: "pp8849@srmist.edu.in",
    to: mail,
    subject: "OTP !!",
    html: `<h1 style="color: rgb(158, 53, 53);">${otp} is your otp. </h1>`
});
}
