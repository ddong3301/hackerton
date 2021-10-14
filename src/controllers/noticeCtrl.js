const Notice = require('../models/Notice');

const create_board = (req, res) => {
    var parameters = {
        e_num: req.body.e_num,
        title: req.body.title,
        content: req.body.content
    };

    Notice.create_Notice(parameters).then((db_data) => {
        res.redirect('/showNoticeList');
    });
}

const read_board_List = (req, res) => {
    Notice.show_Notice_List().then((data) => {
        //res.render('show_notice_list', { n_seq: data.n_seq, title: data.titles });
        //res.send({ n_seq: data.n_seq, title: data.titles });
        res.send({ data: data });
    });
}

const read_board = (req, res) => {
    var parameters = {
        n_seq: req.params
    }
    Notice.show_one_Notice(parameters).then((data) => {
        if (data.titles == "") {
            res.send("<script>alert('글이 없습니다.'); location.href = '/showNoticeList' </script>");
        } else {
            //res.render('show_notice', { title: data.titles, content: data.contents, n_seq: data.req_n_seq });
            console.log(data[0]);
            console.log(parameters.n_seq);
            res.send({ title: data[0].title, content: data[0].content, n_seq: data[0].n_seq })
        }
    })
}

const update_board_select = (req, res) => {
    n_seq = req.params;
    Notice.update_Notice_Select(n_seq).then((data) => {
        res.render('update_notice', { title: data[0].title, content: data[0].content });
    })
}

const update_board = (req, res) => {
    var parameters = {
        title: req.body.title,
        content: req.body.content,
        n_seq: req.body.n_seq
    }
    console.log(parameters);
    Notice.update_Notice(parameters).then(() => {
        res.redirect('/showNoticeList');
    })
}

const delete_board = (req, res) => {
    var parameters = {
        n_seq: req.body.n_seq,
    }
    console.log('asd');
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
