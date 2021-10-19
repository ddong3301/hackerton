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
        "user_pw": crypto
            .createHash('sha512')
            .update(req.body.user_pw)
            .digest('base64')
    }

    // todo: status code ++
    User.findUser(parameters)
        .then((data) => {
            User.isLogged_in(parameters).then((db_data) => {
                console.log(db_data[0]);
                if (db_data[0].token != '') {
                    res.send({ isLoggedin: true });
                } else {
                    if (data == "err") {
                        res.send({ loginSuccess: false });
                    } else {
                        const token = jwt.sign({ name: data[0].user_name, region: data[0].region, phone: data[0].phone }, 'secret_key');
                        User.insert_Token(parameters, token)
                            .then(() => {
                                res.cookie("x_auth", token);
                                let decoded_token = jwt.verify(token, 'secret_key');
                                res.send({ loginSuccess: true, name: decoded_token.name, region: decoded_token.region, phone: decoded_token.phone });
                            })
                            .catch((err) => {
                                console.log(err);
                            })
                    }
                }
            });

        })
}

const checkPassword = (req, res) => {
    parameter = {
        "token": req.cookies.x_auth,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64')
    }
    User.check_pw(parameter)
        .then((db_data) => {
            if (db_data.length == 0) {
                res.send({ isDuplication: false });
            } else {
                res.send({ isDuplication: true });
            }
        })
}

const user_Update = (req, res) => {
    var parameter = {
        "token": req.cookies.x_auth,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64'),
        "phone": req.body.phone,
        "region": req.body.region
    }
    console.log(parameter);
    User.update_userInfo(parameter)
        .then(() => {
            //admin => 0 = false, 1 = true, type = tinyInt
            res.send({ 'UpdateSuccess': true });
        })
}

const delete_User = (req, res) => {
    var parameter = {
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64'),
        "token": req.cookies.x_auth
    }
    User.delete_userInfo(parameter).then((db_data) => {
        res.cookie("x_auth", "", { maxAge: 3000 });
        if (db_data[0] == undefined)
            res.send({ 'DeleteSuccess': true });
        else
            console.log(db_data[0]);
    })
}

const logout = (req, res) => {
    token = "";
    console.log(req.cookie);
    User.delete_Token(req.cookies.x_auth, token);
    res.cookie("x_auth", "", { maxAge: 3000 });
    res.redirect('/');
}

const register = (req, res) => {
    let parameters = {
        "e_num": req.body.e_num,
        "user_pw": crypto.createHash('sha512').update(req.body.user_pw).digest('base64'),
        "user_name": req.body.user_name,
        "phone": req.body.phone,
        "region": req.body.region
    }

    User.insert_userInfo(parameters)
        .then(() => {
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
    checkPassword
}