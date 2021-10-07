const express = require('express');
const router = express.Router();

const Notice = require('../controllers/noticeCtrl');

router.get('/addNotice', (req, res) => {
    res.render('create_notice');
});

router.get('/updateNoticeSelect/:n_seq', Notice.update_board_select);

router.post('/updateNotice', Notice.update_board);

router.post('/deleteNotice', Notice.delete_board);
// router.post('/deleteNotice', () => {
//     console.log('asd')
// });

router.get('/showNoticeList', Notice.read_board_List);

router.get('/showNotice/:n_seq', Notice.read_board);

router.post('/addNotice', Notice.create_board);

module.exports = router;