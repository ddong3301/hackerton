const express = require('express');
const router = express.Router();

const { uploadImg } = require('../middleware/uploadImage');
const { singleFileUpload } = require('../controllers/uploadCtrl');
const displayCtrl = require('../controllers/displayCtrl');

router.get('/upload', (req, res) => {
        res.redirect('/login');
});

//router.post('/singleFile', uploadImg.single('upload'), singleFileUpload);
router.post('/singleFile', uploadImg.single('file'));

router.get('/display', displayCtrl.getSingleImageFromDB, (req, res) => {
    res.sendStatus(200);
});

router.get('/gallery', displayCtrl.getImagesFromDB);

module.exports = router;