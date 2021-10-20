const db = require('../config/dbConn');

const none_allowed_user_info = () => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT e_num, user_name FROM user WHERE allow = 0`, (err, user_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(user_data);
            }
        })
    })
}

const change_user_auth = (parameter) => {
    return new Promise((resolve, reject) => {
        db.query(`UPDATE user SET allow = 1 WHERE e_num = ${db.escape(parameter.e_num)}`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

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

const update_userInfo = (parameters) => {
    return new Promise((resolve, reject) => {
        console.log(parameters);
        db.query(`UPDATE user SET user_pw = '${parameters.user_pw}' WHERE token = ${db.escape(parameters.token)}`, (err, db_data) => {
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
        db.query(`DELETE FROM user WHERE token = ${db.escape(parameters.token)}`, (err, db_data) => {
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
        db.query(`SELECT e_num, user_pw, user_name, phone, region FROM user WHERE e_num = ${db.escape(parameters.e_num)}&& user_pw = ${db.escape(parameters.user_pw)}`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                if(db_data.length == 0) {
                    console.log(db_data);
                    resolve(db_data);
                } else {
                    resolve(db_data);
                }
            }
        });
    })
}

const insert_Token = (parameters, token) => {
    return new Promise((resolve, reject) => {
        db.query(`UPDATE user SET token = '${token}' WHERE e_num = ${db.escape(parameters.e_num)}`, (err, db_data) => {
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
        db.query(`UPDATE user SET token = '${token}' WHERE token = ${db.escape(x_auth)}`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    });
}

const dup_UserId = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT e_num FROM user WHERE e_num = ${db.escape(parameters.e_num)}`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                console.log(db_data);
                resolve(db_data);
            }
        })
    })
}

const check_pw = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT user_pw FROM user WHERE user_pw = ${db.escape(parameters.user_pw)} && token = ${db.escape(parameters.token)}`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const isLogged_in = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT token FROM user WHERE e_num = ${db.escape(parameters.e_num)} && user_pw = ${db.escape(parameters.user_pw)}`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

 const check_admin = (parameters) => {
     return new Promise((resolve, reject) => {
         db.query(`SELECT admin FROM user WHERE token = ${db.escape(parametrs.token)}`, (err, db_data) => {
             if(err) {
                 resolve(err);
             } else {
                 resolve(db_data);
             }
         })
     })
 }
 
module.exports = {
    insert_userInfo,
    update_userInfo,
    delete_userInfo,
    findUser,
    insert_Token,
    delete_Token,
    dup_UserId,
    check_pw,
    isLogged_in,
    none_allowed_user_info,
    change_user_auth,
    check_admin
};