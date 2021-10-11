const express = require('express');
const router = express.Router();

const { auth } = require('../middleware/auth');
const userCtrl = require('../controllers/userCtrl');

router.get('/login', (req, res) => {
    res.render('login');
});
router.get('/', (req, res) => {
    res.render('main');
})

// router.get('/register', (req, res) => {
//     res.render('register');
// });

router.get('/logout', userCtrl.logout);

router.post('/login', userCtrl.login);
router.post('/register', userCtrl.register);
// router.post('/dup', userCtrl.dup);

module.exports = router;