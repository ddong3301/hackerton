const express = require('express');
const router = express.Router();

const upload = require('../middleware/uploadImage');
const { singleFileUpload } = require('../controllers/uploadCtrl');
const displayCtrl = require('../controllers/displayCtrl');

// todo: Middleware이란?
router.get('/upload', (req, res) => {
        res.render('upload');
});

router.post('/singleFile', upload.single('upload'), singleFileUpload);


router.get('/display', displayCtrl.getSingleImageFromDB);

router.get('/gallery', displayCtrl.getImagesFromDB);

module.exports = router;