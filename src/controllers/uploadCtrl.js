const Photo = require('../models/Photo');

const singleFileUpload = (req, res) => {
    try {
        const parameters = {
            fileName: req.file.originalname,
            filePath: req.file.location,
            fileType: req.file.mimetype,
            g_num: req.body.g_num,
            c_num: req.body.c_num,
            createAt: req.body.createAt
        }
        console.log(parameters);
        Photo.insert_Photo(parameters)
        .then(() => {
            res.redirect('display');
        })
    } catch(err) {
        res.status(400).send(err.message);
    }
}

module.exports = {
    singleFileUpload
}