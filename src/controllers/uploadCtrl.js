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
        Photo.insert_Photo(parameters)
        .then(() => {
            res.sendStatus(200);
        })
    } catch(err) {
        res.status(400).send(err.message);
    }
}

const is_Arrest = (req, res) => {
    const parameters = {
        f_num : req.body.f_num
    }
    Photo.isArrest(parameters)
    .then(() => {
        res.sendStatus(200);
    })
}

module.exports = {
    singleFileUpload,
    is_Arrest
}