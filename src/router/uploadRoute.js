const express = require('express');
const router = express.Router();

const upload = require('../middleware/uploadImage');
const { singleFileUpload, is_Arrest } = require('../controllers/uploadCtrl');
const displayCtrl = require('../controllers/displayCtrl');

// todo: Middleware이란?

router.post('/singleFile', upload.single('upload'), singleFileUpload);

router.get('/gallery', displayCtrl.getImagesFromDB);

router.post('/isArrest', is_Arrest)

module.exports = router;