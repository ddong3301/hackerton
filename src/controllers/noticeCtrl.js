const { connection } = require('mongoose');
const Notice = require('../models/Notice');

const create_board = (req, res) => {
    let parameters = {
        e_num: req.body.e_num,
        title: req.body.title,
        content: req.body.content
    };
    // [중요] todo : escape 처리 : sql injection

    Notice.create_Notice(parameters).then(() => {
        res.redirect('/showNoticeList');
    });
}

// todo: 중복 되는 코드
const read_board_List = (req, res) => {
    Notice.show_Notice_List()
    .then((data) => {
        res.render('show_notice_list', {data: data});
        //res.send({ data : data });
    });
}

const read_board = (req, res) => {
    let parameters = {
        n_seq: req.params.n_seq
    }
    Notice.show_one_Notice(parameters)
    .then((data) => {
        if (data.titles == "") {
            res.send("<script>alert('글이 없습니다.'); location.href = '/showNoticeList' </script>");
        } else {
            res.render('show_notice', { data: data[0] });
            //res.send({ data: data[0] });
        }
    })
}

const update_board_select = (req, res) => {
    let parameters = {
        n_seq : req.params.n_seq
    }
    Notice.update_Notice_Select(parameters)
    .then((data) => {
        res.render('update_notice', { data: data[0] });
    })
}

const update_board = (req, res) => {
    let parameters = {
        title: req.body.title,
        content: req.body.content,
        n_seq: req.body.n_seq
    }
    Notice.update_Notice(parameters).then(() => {
        res.redirect('/showNoticeList');
    })
}

const delete_board = (req, res) => {
    let parameters = {
        n_seq: req.params.n_seq,
    }
    Notice.delete_Notice(parameters).then(() => {
        res.redirect('/showNoticeList');
    })
}

module.exports = {
    create_board,
    read_board_List,
    update_board_select,
    update_board,
    read_board,
    delete_board
}
