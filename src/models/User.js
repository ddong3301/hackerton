const db = require('../config/dbConn');

const none_allowed_user_info = (parameter) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT e_num, user_name FROM user WHERE allow = 0 && region = ${db.escape(parameter)}`, (err, user_data) => {
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
        db.query(`INSERT INTO user SET e_num = ${db.escape(parameter.e_num)}, user_pw = ${db.escape(parameter.user_pw)}, user_name = ${db.escape(parameter.user_name)}, phone = ${db.escape(parameter.phone)}, region = ${db.escape(parameter.region)}, deviceToken = ${db.escape(parameter.deviceToken)}`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        });
    })
}

const update_userInfo = (parameters) => {
    return new Promise((resolve, reject) => {
        console.log(parameters);
        db.query(`UPDATE user SET user_pw = ${db.escape(parameters.user_pw)} WHERE e_num = ${db.escape(parameters.e_num)}`, (err, db_data) => {
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
        db.query(`DELETE FROM user WHERE e_num = ${db.escape(parameters.e_num)}`, (err, db_data) => {
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
        db.query(`SELECT e_num, user_pw, user_name, phone, region, admin, allow, loggedin FROM user WHERE e_num = ${db.escape(parameters.e_num)}&& user_pw = ${db.escape(parameters.user_pw)}`, (err, db_data) => {
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

const loggedIn = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`UPDATE user SET loggedin = 1 WHERE e_num = ${db.escape(parameters.e_num)}`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        });
    })
}

const delete_loggedIn = (parameter) => {
    return new Promise((resolve, reject) => {
        db.query(`UPDATE user SET loggedin = 0 WHERE e_num = ${db.escape(parameter.e_num)}`, (err, db_data) => {
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
        db.query(`SELECT user_pw FROM user WHERE user_pw = ${db.escape(parameters.user_pw)}`, (err, db_data) => {
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
        db.query(`SELECT loggedin FROM user WHERE e_num = ${db.escape(parameters.e_num)} && user_pw = ${db.escape(parameters.user_pw)}`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const getSameRegion = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT region FROM user WHERE region = ${db.escape(parameters.photoRegion)}`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const getDeviceToken = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT deviceToken FROM user WHERE region = ${db.escape(parameters.photoRegion)} && deviceToken != ""`, (err, db_data) => {
            if(err) {
                reject(err);
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
    dup_UserId,
    check_pw,
    isLogged_in,
    none_allowed_user_info,
    change_user_auth,
    loggedIn,
    delete_loggedIn,
    getSameRegion,
    getDeviceToken
};