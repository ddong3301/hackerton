const Photo = require('../models/Photo');

const getSingleImageFromDB = (req, res) => {
    Photo.display_Photo().then((path) => {
        res.render('display', { photo: path[0].filePath });
    })
}

const getImagesFromDB = (req, res) => {
    Photo.display_Gallery().then((data) => {
            res.render('gallery', { photo: data.allImages, photoDate: data.ImagesDate })
    });
}

module.exports = {
    getImagesFromDB,
    getSingleImageFromDB
}