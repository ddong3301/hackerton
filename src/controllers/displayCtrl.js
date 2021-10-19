const Photo = require('../models/Photo');

const getSingleImageFromDB = (req, res) => {
    Photo.display_Photo()
    .then((path) => {
        res.send({photo : path.filePath});
    })
}

const getImagesFromDB = (req, res) => {
    Photo.display_Gallery().then((data) => {
        res.send({data : data});
    });
}

module.exports = {
    getImagesFromDB,
    getSingleImageFromDB
}