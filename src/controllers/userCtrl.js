const crypto = require('crypto');
const jwt = require('jsonwebtoken');

const User = require('../models/User');

const isDuplication = (req, res) => {
    var parameters = {
        "e_num": req.body.e_num
    }

    User.dup_UserId(parameters).then((db_data) => {
        if (db_data.length == 0) {
            res.send({ isDuplication: false });
        } else {
            res.send({ isDuplication: true });
        }

    })
}

const login = (req, res) => {
    var parameters = {
        "e_num": req.body.e_num,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64')
    }


    User.findUser(parameters).then((db_data) => {
        if (db_data == "err") {
            res.send({ loginSuccess: false });
        } else {
            const token = jwt.sign({ name: db_data[0].user_name, region: db_data[0].region, phone: db_data[0].phone }, 'secret_key');

            User.insert_Token(parameters, token).then(() => {
                res.cookie("x_auth", token, { httpOnly: true, signed: true });
                var decoded_token = jwt.verify(token, 'secret_key');
                res.send({ loginSuccess: true, name: decoded_token.name, region: decoded_token.region, phone: decoded_token.phone });
            }).catch((err) => {
                console.log(err);
            })
        }
    })
}

const read_User = (req, res) => {
    parameter = {
        "token": req.cookies.x_auth
    }
    User.read_userInfo(parameter).then((db_data) => {
        res.send(db_data);
    })
}

const user_Update = (req, res) => {
    var parameter = {
        "token": req.cookies.x_auth,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64'),
        "phone": req.body.phone,
        "region": req.body.region
    }
    User.update_userInfo(parameter).then((db_data) => {
        //admin => 0 = false, 1 = true, type = tinyInt
        res.send({ 'UpdateSuccess': true })
    })
}

const delete_User = (req, res) => {
    var parameter = {
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64'),
        "token": req.cookies.x_auth
    }
    User.delete_userInfo(parameter).then(() => {
        res.cookie("x_auth", "", { maxAge: 3000 });
        res.send({ 'DeleteSuccess': true });
    })
}

const logout = (req, res) => {
    token = ""
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
    isDuplication,
    user_Update,
    delete_User,
    read_User
}