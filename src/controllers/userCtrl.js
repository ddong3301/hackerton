const express = require('express');
const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const app = express();

const User = require('../models/User');
const cookieParser = require('cookie-parser');

app.use(cookieParser());

// const dup = (req, res) => {
//     var parameters = {
//         "e_num" : req.body.e_num
//     }

//     User.dup_UserId(parameters).then((db_data) => {
//         console.log(db_data);
//     })
// }

const login = (req, res) => {
    var parameters = {
        "e_num": req.body.e_num,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64')
    }

    User.findUser(parameters).then((db_data) => {
        if (db_data == "err") {
            res.send({ loginSuccess: false });
        } else {
            const token = jwt.sign({ name : db_data[0].user_name, region: db_data[0].region, phone: db_data[0].phone , exp: Math.floor(Date.now() / 1000) + (60 * 60) }, 'secret_key');
            User.insert_Token(parameters, token).then(() => {
                res.cookie("x_auth", token);
                var decoded_token = jwt.verify(token, 'secret_key');
                console.log(decoded_token.name);
                res.send({ loginSuccess: true, name: decoded_token.name, region: decoded_token.region, phone: decoded_token.phone });
            }).catch((err) => {
                console.log(err);
            })
        }
    })
}

const logout = (req, res) => {
    token = ""
    console.log(req.cookies.x_auth);
    User.delete_Token(req.cookies.x_auth, token);
    res.cookie("x_auth", "", { maxAge: 3000 });
    res.redirect('/');
}

const register = (req, res) => {
    var parameters = {
        "e_num": req.body.e_num,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64'),
        "user_name": req.body.user_name,
        "phone": req.body.phone,
        "region": req.body.region
    }

    User.insert_userInfo(parameters).then(() => {
        console.log(parameters);
        res.redirect('/login');
    })
}

module.exports = {
    login,
    logout,
    register,
    //dup
}