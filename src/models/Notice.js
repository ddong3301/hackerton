//앱에서 요청을 하면 서버에서 전송하는형태
const dayjs = require('dayjs');
const db = require('../config/dbConn');
const date = new Date();

// todo : pending 겪어보기
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
};

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
};

const show_one_Notice = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT title, content, n_seq FROM notice_board WHERE n_seq = '${parameters.n_seq}'`, (err, noticeData) => {
            if (err) {
                reject(err)
            } else {
                resolve(noticeData);
            }
        })
    })
};

const update_Notice_Select = (parameters) => {
    return new Promise((resolve, reject) => {
        db.query(`SELECT title, content, n_seq FROM notice_board WHERE n_seq = ${db.escape(parameters.n_seq)}`, (err, data) => {
            if (err) {
                reject(err);
            } else {
                resolve(data)
            }
        })
    })
};

const update_Notice = (parameters) => {
    return new Promise((resolve, reject) => {
        console.log(parameters);
        db.query(`UPDATE notice_board SET title = '${parameters.title}', content = '${parameters.content}' WHERE n_seq = ${db.escape(parameters.n_seq)}`, (err, db_data) => {
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
        db.query(`DELETE FROM notice_board WHERE n_seq = ${db.escape(parameters.n_seq)}`, (err, db_data) => {
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