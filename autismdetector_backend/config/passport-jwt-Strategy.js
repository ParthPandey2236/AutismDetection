const passport = require('passport');

const DoctorReference = require('../models/DoctorSchema');

const JwtStrategy = require('passport-jwt').Strategy;
//Strategy imported

const ExtractJwt = require('passport-jwt').ExtractJwt;

let opt = { 
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(), 
    secretOrKey: 'EncryptionKey'
};
//object created to be passed in jwt strategy

passport.use(new JwtStrategy(opt,function(jwtPayload,done){
    DoctorReference.findById(jwtPayload._id,function(error,user){
        if(error){
            return done(error,false);
        }
        if(user){
            return done(null,user);
        }
        return done(null,false);
    })
}));
// passport-jwt authentication implemented 

module.exports = passport;