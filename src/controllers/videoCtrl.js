const uploadVid = require('../middleware/uploadVideo');

const uploadVideo = (req, res) => {
    try {
        console.log(req.file.filename);
        res.redirect(`/video/${req.file.filename}`);
    } catch(err) {
        res.status(400).send(err.message);
    }
}

const sendVid = (req, res) => {
    var fileName = req.params.fileName;
    fileName = fileName.replace('.mp4', "");

    res.render('video', { title: fileName, videoSource: `/src/uploadVi/${fileName}.mp4` });
}

module.exports = {
    sendVid,
    uploadVideo
}