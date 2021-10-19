const express = require('express');
const router = express.Router();

const userCtrl = require('../controllers/userCtrl');

// router.get('/login', (req, res) => {
//     res.render('login');
// });
// router.get('/', (req, res) => {
//     res.render('main');
// });

// todo: res.send vs res.json 차이점

// todo: post 변경 (조건문 로직 추가)
router.get('/logout', userCtrl.logout);
router.post('/login', userCtrl.login);
router.post('/register', userCtrl.register);
router.post('/dup', userCtrl.isDuplication);
router.post('/user_update', userCtrl.user_Update);
router.post('/deleteUser', userCtrl.delete_User);
router.get('/readUser', userCtrl.read_User);

module.exports = router;