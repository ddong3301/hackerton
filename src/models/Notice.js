// const mongoose = require('mongoose');
//앱에서 요청을 하면 서버에서 전송하는형태
const dayjs = require('dayjs');
const db = require('../config/dbConn');
const date = new Date();

const create_Notice = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO notice_board SET title = '${parameters.title}', content = '${parameters.content}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data)
            }
        });
    })
}

const show_Notice_List = () => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT title, n_seq, content FROM notice_board ORDER BY n_seq DESC`, (err, noticeData) => {
            if (err) {
                reject(err)
            } else {
                resolve(noticeData);
            }
        })
    })
}

const show_one_Notice = (parameters) => {
    return new Promise((resolve, reject) => {
        n_seq = parameters.n_seq;
        var titles = [];
        var contents = [];
        var req_n_seq = [];
        db.query(`SELECT title, content, n_seq FROM notice_board WHERE n_seq = '${n_seq['n_seq']}'`, (err, noticeData) => {
            if (err) {
                reject(err)
            } else {
                noticeData.forEach(data => {
                    titles.push(data.title);
                    contents.push(data.content);
                    req_n_seq.push(data.n_seq);
                });
                resolve(noticeData);
            }
        })
    })
}

const update_Notice_Select = (n_seq) => {
    return new Promise((resolve, reject) => {
        var req_n_seq = n_seq['n_seq'];
        db.query(`SELECT title, content FROM notice_board WHERE n_seq = '${req_n_seq}'`, (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data)
            }
        })
    })
}

const update_Notice = (parameters) => {
    return new Promise((resolve, reject) => {
        console.log(parameters);
        db.query(`UPDATE notice_board SET title = '${parameters.title}', content = '${parameters.content}' WHERE n_seq = '${parameters.n_seq}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        })
    })
}

const delete_Notice = (parameters) => {
    return new Promise((resolve, reject) => {
        console.log(n_seq);
        db.query(`DELETE FROM notice_board WHERE n_seq = '${parameters.n_seq}'`, (err, db_data) => {
            if (err) {
                reject(err);
            } else {
                resolve(db_data);
            }
        });
    })
}

module.exports = {
    create_Notice,
    show_Notice_List,
    show_one_Notice,
    update_Notice_Select,
    update_Notice,
    delete_Notice
}