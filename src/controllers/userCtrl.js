const express = require('express');
const app = express();

const { User } = require('../models/User');
const cookieParser = require('cookie-parser');

app.use(cookieParser());

const login = (req, res) => {
    User.findOne({ e_num: req.body.e_num }, (err, user) => {
        if (err) {
            return res.json({
                loginSuccess: false,
                message: "존재하지 않는 아이디입니다."
            });
        }

        user.comparePassword(req.body.password, (err, isMatch) => {
            if (!isMatch) {
                return res.json({
                    loginSuccess: false, message: "비밀번호가 일치하지 않습니다."
                })
            }

            user.generateToken((err, user) => {
                if (err) { return res.status(400).send(err) }
                //cookie에 jwt 저장
                res.cookie("x_auth", user.token);
                res.redirect('upload');
            });
            console.log({ loginSuccess: true, userId: user._id });
        });
    });
}

const logout = (req, res) => {
    User.findByIdAndUpdate({ _id: req.user._id },
        { token: "" },
        (err, user) => {
            if (err) { return res.json({ success: false, err }) }
            else {
                res.cookie("x_auth", "", { maxAge: 3000 });
                return res.status(200).send({
                    success: true,
                    token: user.token
                });
            }
        }
    )
}

const register = (req, res) => {
    const user = new User(req.body);

    user.save((err) => {
        if (err) {
            console.log('user.save() error : ' + err.message);
            return;
        }
        return res.status(200).json({ success: true });
    })
}

module.exports = {
    login,
    logout,
    register
}