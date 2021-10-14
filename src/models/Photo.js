// const mongoose = require('mongoose');
const db = require('../config/dbConn');
const dayjs = require('dayjs');
const date = new Date();

const insert_Photo = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO photo SET fileName = '${parameters.fileName}', filePath = '${parameters.filePath}', fileType = '${parameters.fileType}'`, (err, db_data) => {
            if (err) {
                console.log('model err');
                reject(err);
            } else {
                console.log('model err');
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
}

const display_Gallery = () => {
    return new Promise((resolve, reject) => {
        var i = 0;
        var allImages = [];
        var ImagesDate = []
        db.query(`SELECT filePath, date FROM photo`, (err, fileData) => {
            if (err) {
                reject(err);
            } else {
                // fileData.forEach(data => {
                //     allImages.push(data.filePath);
                //     ImagesDate.push(data.date);
                //     i++;
                // });
                // var data = {
                //     allImages,
                //     ImagesDate
                // }
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