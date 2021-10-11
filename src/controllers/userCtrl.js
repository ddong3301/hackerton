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

    res.send(parameters.e_num);

    // User.findUser(parameters).then((db_data) => {
    //     const token = jwt.sign({ id : db_data.e_num}, 'secret_key');
    //     User.insert_Token(parameters, token).then(() => {
    //         console.log(token);
    //         res.cookie("x_auth", token);
    //         res.redirect('/');
    //     }).catch((err) => {
    //         console.log(err);
    //     }) 
    // }).catch((err) => {
    //     console.log(err);
    // })
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



// const login = (req, res) => {
//     User.findOne({ e_num: req.body.e_num }, (err, user) => {
//         if (err) {
//             return res.json({
//                 loginSuccess: false,
//                 message: "존재하지 않는 아이디입니다."
//             });
//         }

//         user.comparePassword(req.body.password, (err, isMatch) => {
//             if (!isMatch) {
//                 return res.json({
//                     loginSuccess: false, message: "비밀번호가 일치하지 않습니다."
//                 })
//             }

//             user.generateToken((err, user) => {
//                 if (err) { return res.status(400).send(err) }
//                 //cookie에 jwt 저장
//                 res.cookie("x_auth", user.token);
//                 res.redirect('upload');
//             });
//             console.log({ loginSuccess: true, userId: user._id });
//         });
//     });
// }

// const logout = (req, res) => {
//     User.findByIdAndUpdate({ _id: req.user._id },
//         { token: "" },
//         (err, user) => {
//             if (err) { return res.json({ success: false, err }) }
//             else {
//                 res.cookie("x_auth", "", { maxAge: 3000 });
//                 return res.status(200).send({
//                     success: true,
//                     token: user.token
//                 });
//             }
//         }
//     )
// }

// const register = (req, res) => {
//     const user = new User(req.body);

//     user.save((err) => {
//         if (err) {
//             console.log('user.save() error : ' + err.message);
//             return;
//         }
//         return res.status(200).json({ success: true });
//     })
// }



module.exports = {
    login,
    logout,
    register
}