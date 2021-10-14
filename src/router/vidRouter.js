const express = require('express');
const router = express.Router();

const { uploadVid } = require('../middleware/uploadVideo');
const { uploadVideo, sendVid } = require('../controllers/videoCtrl');

// router.get('/', (req, res) => {
//     res.sendFile(__dirname, "../uploadVi");
// })
router.get('/vidUpload', (req, res) => {
    res.render('uploadVid');
})
router.post('/vidUpload', uploadVid.single('upload'), uploadVideo);
router.get('/video/:fileName', sendVid);

module.exports = router;