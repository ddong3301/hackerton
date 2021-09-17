const express = require('express');
const router = express.Router();

const { upload } = require('../middleware/upload');
const { singleFileUpload } = require('../controllers/uploadCtrl');
const displayCtrl = require('../controllers/displayCtrl');

router.post('/singleFile', upload.single('file'), singleFileUpload);

router.get('/display', displayCtrl.getImagesFromDB);

module.exports = router;