const express = require('express');
const router = express.Router();

const { upload } = require('../middleware/upload');
const { singleFileUpload } = require('../controllers/uploadCtrl');
const displayCtrl = require('../controllers/displayCtrl');

router.get('/upload', (req, res) => {
    if(req.cookies.x_auth) {
        res.render('upload');
    } else {
        res.redirect('/login');
    }
})
router.post('/singleFile', upload.single('upload'), singleFileUpload);

router.get('/display', displayCtrl.getSingleImageFromDB);

router.get('/gallery', displayCtrl.getImagesFromDB);

module.exports = router;