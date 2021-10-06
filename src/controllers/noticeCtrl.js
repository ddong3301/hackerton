const Notice = require('../models/Notice');

const create_board = (req, res) => {
    var parameters = {
        e_num : req.body.e_num,
        title : req.body.title,
        content : req.body.content
    };
    Notice.create_Notice(parameters).then((db_data) => {
        res.redirect('/');
    });
}

const read_board_List = (req, res) => {
    Notice.show_Notice_List().then((data) => {
        res.render('show_notice_list', {n_seq : data.n_seq, title : data.titles});
    });
}

const read_board = (req, res) => {
    n_seq = req.params;
    Notice.show_one_Notice(n_seq).then((data) => {
        res.render('show_notice', {title : data.titles, content : data.contents});
    })
}

const update_board = (req, res) => {

}

const delete_board = (req, res) => {
    Notice.delete_Notice()
}

module.exports = {
    create_board,
    read_board_List,
    update_board,
    read_board
}
