const nodemailer = require('nodemailer');
console.log('nodemailer Config File Called');
const secret = require('../secret/secret');
// let testAccount = async ()=>await nodemailer.createTestAccount();

let transporter = nodemailer.createTransport({
    service : 'gmail',
    host : 'smtp.google.com',
    port : 587,
    secure : false,
    auth : {
        user : secret.values.mail,
        pass : secret.values.pass,
    },
    tls : {
        rejectUnauthorized :false,
    }
});
// console.log('** testAccount**', testAccount.user);
    


module.exports = {
    transporter : transporter,
}