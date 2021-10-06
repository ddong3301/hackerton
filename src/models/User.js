//const mongoose = require('mongoose');
//const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../config/dbConn');

const insert_userInfo = (parameter) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO user SET e_num = '${parameter.e_num}', user_pw = '${parameter.user_pw}', user_name = '${parameter.user_name}', phone = '${parameter.phone}'`, (err, db_data) => {
            if (err) {
                console.log(err);
            } else {
                resolve(db_data);
            }
        });
    })
}

const findUser = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT e_num, user_pw FROM user WHERE e_num = '${parameters.e_num}' && user_pw = '${parameters.user_pw}'`, (err, db_data) => {
            if (err) {
                console.log(err);
                reject(err);
            } else {
                //console.log(db_data)
                resolve(db_data);
            }
        });
    })
}

const insert_Token = (parameters, token) => {
    return new Promise((resolve, reject) => {
        db.query(`UPDATE user SET token = '${token}' WHERE e_num = '${parameters.e_num}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                //console.log(db_data)
                resolve(db_data);
            }
        });
    })
}

const delete_Token = (x_auth, token) => {
    return new Promise((resolve, reject) => {
        db.query(`UPDATE user SET token = '${token}' WHERE token = '${x_auth}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    });
}


// const UserSchema = mongoose.Schema({
//     e_num: { type: Number, required: true, unique: true },
//     password: { type: String, required: true },
//     //region: {type: String, required: true},
//     name: { type: String, required: true },
//     role: { type: String },
//     phone_num: { type: Number, required: true },
//     token : {
//         type: String
//     },
//     tokenExp : {
//         type : Number
//     }
// });

// UserSchema.pre('save', function (next) {
//     const user = this;
//     const saltRounds = 10;

//     if (user.isModified('password')) {
//         bcrypt.genSalt(saltRounds, function (err, salt) {
//             if (err) return next(err);
//             bcrypt.hash(user.password, salt, function (err, hash) {
//                 if (err) return next(err);
//                 user.password = hash;
//                 next();
//             })
//         })
//     } else {
//         next();
//     }
// });

// UserSchema.methods.comparePassword = function (plainPassword, cb) {
//     bcrypt.compare(plainPassword, this.password, (err, isMatch) => {
//         if (err) { return cb(err.message) }
//         cb(null, isMatch);
//     });
// };

// UserSchema.methods.generateToken = function (cb) {
//     var user = this;

//     //jwt로 token 생성
//     var token = jwt.sign(user._id.toHexString(), 'secretToken')

//     user.token = token;
//     user.save((err, user) => {
//         if (err) { return cb(err) }
//         cb(null, user);
//     });
// }

// UserSchema.statics.findByToken = function (token, cb) {
//     let user = this;

//     //토큰을 복호화(decoded) 하는 코드
//     jwt.verify(token, 'secretToken', function (err, decoded) {
//         user.findOne({ "_id": decoded, "token": token }, function (err, user) {
//             if (err) { return cb(err) }
//             else {cb(null, user)}
//         })
//     });
// }

// const User = mongoose.model('User', UserSchema);

module.exports = {
    insert_userInfo,
    findUser,
    insert_Token,
    delete_Token
};