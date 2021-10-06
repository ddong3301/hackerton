// const mongoose = require('mongoose');
//앱에서 요청을 하면 서버에서 전송하는형태
const dayjs = require('dayjs');
const db = require('../config/dbConn');
const date = new Date();

const create_Notice = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`INSERT INTO notice_board SET title = '${parameters.title}', content = '${parameters.content}'`, (err, db_data) => {
            if(err) {
                reject(err);
            } else {
                resolve(db_data)
            }
        });
    })
}

const show_Notice_List = () => {
    return new Promise((resolve, reject) => {
        var titles = [];
        var n_seq = []
        db.query(`SELECT title, n_seq FROM notice_board`, (err, noticeData) => {
            if(err) {
                reject(err)
            } else {
                noticeData.forEach(data => {
                    titles.push(data.title);
                    n_seq.push(data.n_seq);
                });
                var data = {
                    titles,
                    n_seq
                }
                //console.log(titles);
                resolve(data);
            }
        })
    })
}

const show_one_Notice = (n_seq) => {
    return new Promise((resolve, reject) => {
        var titles = [];
        var contents = [];
        var req_n_seq = n_seq['n_seq'];
        db.query(`SELECT title, content FROM notice_board WHERE n_seq = '${req_n_seq}'`, (err, noticeData) => {
            if(err) {
                reject(err)
            } else {
                noticeData.forEach(data => {
                    titles.push(data.title);
                    contents.push(data.content);
                });
                var data = {
                    titles,
                    contents
                }
                resolve(data);
            }
        })
    })
}

const update_Notice = () => {
    return new Promise((resolve, reject) => {

    })
}

const delete_Notice = (n_seq) => {
    return new Promise((resolve, reject) => {
        db.query(`DELETE FROM notice_board WHERE n_seq = '${n_seq}'`)
    })
}

module.exports = {
    create_Notice,
    show_Notice_List,
    show_one_Notice,
    update_Notice,
    delete_Notice
}