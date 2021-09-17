const Photo = require('../models/Photo');

const singleFileUpload = (req, res) => {
    try { 
        const file = new Photo({
            fileName: req.file.originalname,
            filePath: req.file.path,
            fileType: req.file.mimetype,
        });
        file.save();
        console.log(file);
        res.status(200).send('file uploded');
    } catch(err) {
        res.status(400).send(err.message)
    }
}

module.exports = {
    singleFileUpload
}