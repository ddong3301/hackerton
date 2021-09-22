const express = require('express');
const router = express.Router();

const { upload } = require('../middleware/upload');
const { singleFileUpload } = require('../controllers/uploadCtrl');
const displayCtrl = require('../controllers/displayCtrl');

router.get('/upload', (req, res) => {
    res.render('upload');
})
router.post('/singleFile', upload.single('upload'), singleFileUpload);

router.get('/display', displayCtrl.getImagesFromDB);

module.exports = router;