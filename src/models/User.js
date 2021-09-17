const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const UserSchema = mongoose.Schema({
    e_num: { type: Number, required: true, unique: true },
    password: { type: String, required: true },
    name: { type: String, required: true },
    role: { type: String, required: true },
    phone_num: { type: Number, required: true },
    token : {
        type: String
    },
    tokenExp : {
        type : Number
    }
});

UserSchema.pre('save', function (next) {
    const user = this;
    const saltRounds = 10;

    if (user.isModified('password')) {
        bcrypt.genSalt(saltRounds, function (err, salt) {
            if (err) return next(err);
            bcrypt.hash(user.password, salt, function (err, hash) {
                if (err) return next(err);
                user.password = hash;
                next();
            })
        })
    } else {
        next();
    }
});

UserSchema.methods.comparePassword = function (plainPassword, cb) {
    bcrypt.compare(plainPassword, this.password, (err, isMatch) => {
        if (err) { return cb(err.message) }
        cb(null, isMatch);
    });
};

UserSchema.methods.generateToken = function (cb) {
    var user = this;

    //jwt로 token 생성
    var token = jwt.sign(user._id.toHexString(), 'secretToken')

    user.token = token;
    user.save((err, user) => {
        if (err) { return cb(err) }
        cb(null, user);
    });
}

UserSchema.statics.findByToken = function (token, cb) {
    let user = this;

    //토큰을 복호화(decoded) 하는 코드
    jwt.verify(token, 'secretToken', function (err, decoded) {
        user.findOne({ "_id": decoded, "token": token }, function (err, user) {
            if (err) { return cb(err) }
            else {cb(null, user)}
        })
    });
}

const User = mongoose.model('User', UserSchema);

module.exports = { User };