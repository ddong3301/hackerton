const db = require('../config/dbConn');

const insert_Photo = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO photo SET fileName = '${parameters.fileName}', filePath = '${parameters.filePath}', fileType = '${parameters.fileType}', 
        g_num = '${parameters.g_num}', c_num = '${parameters.c_num}', date = '${parameters.createAt}', photoRegion = '${parameters.photoRegion}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const isArrest = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`UPDATE photo SET arrest = 1 WHERE f_num = '${parameters.f_num}'`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const display_Gallery = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT f_num, filePath, date, g_num, c_num, arrest, photoRegion FROM photo WHERE arrest = 0 && photoRegion = '${parameters.region}' ORDER BY f_num DESC`, (err, fileData) => {
            if (err) {
                reject(err);
            } else {
                resolve(fileData);
            }
        })
    })
}

module.exports = {
    insert_Photo,
    display_Gallery,
    isArrest
};