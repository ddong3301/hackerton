const jwt = require('jsonwebtoken');
const db = require('../config/dbConn');

const insert_userInfo = (parameter) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO user SET e_num = '${parameter.e_num}', user_pw = '${parameter.user_pw}', user_name = '${parameter.user_name}', phone = '${parameter.phone}', region = '${parameter.region}'`, (err, db_data) => {
            if (err) {
                console.log(err);
            } else {
                resolve(db_data);
            }
        });
    })
}

const read_userInfo = (parameter) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT e_num, user_name, admin, phone, region FROM user WHERE token = '${parameter.token}'`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const update_userInfo = (parameters) => {
    return new Promise((resolve, reject) => {
        console.log(parameters);
        db.query(`UPDATE user SET user_pw = '${parameters.user_pw}', phone = '${parameters.phone}' WHERE token = '${parameters.token}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const delete_userInfo = (parameters) => {
    return new Promise((resolve, reject) => {
        console.log(n_seq);
        db.query(`DELETE FROM user WHERE token = '${parameters.token}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        });
    })
}

const findUser = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT e_num, user_pw, user_name, phone, region FROM user WHERE e_num = '${parameters.e_num}'&& user_pw = '${parameters.user_pw}'`, (err, db_data) => {
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
    read_userInfo,
    update_userInfo,
    delete_userInfo,
    findUser,
    insert_Token,
    delete_Token,
   // dup_UserId
};