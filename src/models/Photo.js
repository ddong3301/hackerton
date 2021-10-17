// const mongoose = require('mongoose');
const db = require('../config/dbConn');
const dayjs = require('dayjs');
const date = new Date();

// todo: 애들 insert into 객체형식으로 넣는 방법 기억나는지 확인하기
const insert_Photo = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO photo SET fileName = '${parameters.fileName}', filePath = '${parameters.filePath}', fileType = '${parameters.fileType}', g_num = '${parameters.g_num}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const display_Photo = () => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT filePath FROM photo ORDER BY f_num DESC LIMIT 1`, (err, path) => {
            if (err) {
                reject(err);
            } else {
                resolve(path);
            }
        })
    })
};

const display_Gallery = () => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT filePath, date, g_num FROM photo ORDER BY date DESC`, (err, fileData) => {
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
    display_Photo,
    display_Gallery
};