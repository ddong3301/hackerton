//const mongoose = require('mongoose');
//const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require('../config/dbConn');

const insert_userInfo = (parameter) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO user SET e_num = '${parameter.e_num}', user_pw = '${parameter.user_pw}', user_name = '${parameter.user_name}', phone = '${parameter.phone}', region = '${parameters.region}'`, (err, db_data) => {
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
        db.query(`SELECT e_num, user_pw FROM user WHERE e_num = '${parameters.e_num}'&& user_pw = '${parameters.user_pw}'`, (err, db_data) => {
            console.log(db_data);
            if (err) {
                reject(err);
            } else {
                if(db_data.length == 0) {
                    resolve("err");
                } else {
                    resolve(db_data);
                }
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

module.exports = {
    insert_userInfo,
    findUser,
    insert_Token,
    delete_Token
};