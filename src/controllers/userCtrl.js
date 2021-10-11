const express = require('express');
const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const app = express();

const User = require('../models/User');
const cookieParser = require('cookie-parser');

app.use(cookieParser());

const login = (req, res) => {
    var parameters = { 
        "e_num": req.body.e_num, 
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64')
    }  
    console.log(typeof(parameters.e_num));
    console.log(typeof(parameters.user_pw));

    User.findUser(parameters).then((db_data) => {
        if(db_data == "err") {
            console.log('아이디 혹은 비밀번호가 틀립니다');
            res.redirect('/login');
        } else {
            const token = jwt.sign({ id : db_data.e_num}, 'secret_key');
            User.insert_Token(parameters, token).then(() => {
                res.cookie("x_auth", token);
                res.redirect('/');
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
    res.cookie("x_auth", "", {maxAge : 3000});
    res.redirect('/');
}

const register = (req, res) => {
    var parameters = {
        "e_num": req.body.e_num,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64'),
        "user_name": req.body.user_name,
        "phone": req.body.phone
    }

    User.insert_userInfo(parameters).then(() => {
        console.log(parameters);
        res.redirect('/login');
    })
}

module.exports = {
    login,
    logout,
    register
}