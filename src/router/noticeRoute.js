const express = require('express');
const router = express.Router();

const Notice = require('../controllers/noticeCtrl');

router.get('/add', (req, res) => {
    res.render('create_notice');
});

router.get('/showList', Notice.read_board_List);

router.get('/showNotice/:n_seq', Notice.read_board);

router.post('/add', Notice.create_board);

module.exports = router;