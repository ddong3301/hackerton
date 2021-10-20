const express = require('express');
const router = express.Router();

const userCtrl = require('../controllers/userCtrl');

router.get('/logout', userCtrl.logout);
router.post('/login', userCtrl.login);
router.post('/register', userCtrl.register);
router.post('/dup', userCtrl.isDuplication);
router.post('/user_update', userCtrl.user_Update);
router.get('/deleteUser', userCtrl.delete_User);
router.post('/checkPw', userCtrl.checkPassword);
router.get('/getUser', userCtrl.sendUnAllowedUserInfo);
router.post('/changeUserAuth', userCtrl.changeUserAuth);

module.exports = router;