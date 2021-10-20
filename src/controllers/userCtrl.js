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
            if (data.length == 0) {
                res.send({ loginSuccess: false });
            } else {
                User.isLogged_in(parameters)
                    .then((db_data) => {
                        if (db_data[0].token != '') {
                            res.send({ isLoggedin: true });
                        } else {
                            const token = jwt.sign({ name: data[0].user_name, region: data[0].region, phone: data[0].phone, admin: data[0].admin, allow : data[0].allow }, 'secret_key')
                            let decoded_token = jwt.verify(token, 'secret_key');
                            if(decoded_token.allow == 0) {
                                console.log(decoded_token);
                                res.sendStatus(401);
                            } else {
                                User.insert_Token(parameters, token).then(() => {
                                    res.cookie("x_auth", token);
                                    res.send({ loginSuccess: true, name: decoded_token.name, region: decoded_token.region, phone: decoded_token.phone });
                                })
                                    .catch((err) => {
                                        console.log(err);
                                    })
                            }   
                        }
                    });
            }
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
    }
    User.update_userInfo(parameter)
        .then(() => {
            //admin => 0 = false, 1 = true, type = tinyInt
            res.send({ 'UpdateSuccess': true });
        })
}

const delete_User = (req, res) => {
    let parameter = {
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
    User.delete_Token(req.cookies.x_auth, token);
    res.cookie("x_auth", "", { maxAge: 3000 });
    res.sendStatus(200);
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
            res.sendStatus(200);
        })
}

// const sendUnAllowedUserInfo = (req, res) => {
//     User.check_admin(parameters)
//         .then((db_data) => {
//             if (db_data[0] == 1) {
//                 User.none_allowed_user_info()
//                     .then((user_data) => {
//                         res.send({data : user_data});
//                     })
//             }
//         })
// }
const sendUnAllowedUserInfo = (req, res) => {
    let token = req.cookies.x_auth;
    let decoded_token = jwt.verify(token, 'secret_key');
    if (decoded_token.admin == 1) {
        User.none_allowed_user_info(decoded_token.region)
            .then((user_data) => {
                res.send({ data: user_data });
            })
    } else {
        res.sendStatus(403);
    }

}

// const changeUserAuth = (req, res) => {
//     let parameter = {
//         "e_num": req.body.e_num,
//         "token": req.cookies.x_auth
//     }
//     User.check_admin(parameters)
//         .then((db_data) => {
//             if (db_data[0] == 1) {
//                 User.change_user_auth(parameter)
//                     .then(() => {
//                         res.sendStatus(200);
//                     })
//             }
//         })
// }
const changeUserAuth = (req, res) => {
    let parameter = {
        "e_num": req.body.e_num,
    }
    let token = req.cookies.x_auth;
    let decoded_token = jwt.verify(token, 'secret_key');
    if (decoded_token.admin == 1) {
        User.change_user_auth(parameter)
            .then(() => {
                res.sendStatus(200);
            })
    } else {
        res.sendStatus(403);
    }
}

module.exports = {
    login,
    logout,
    register,
    isDuplication,
    user_Update,
    delete_User,
    checkPassword,
    sendUnAllowedUserInfo,
    changeUserAuth,
}