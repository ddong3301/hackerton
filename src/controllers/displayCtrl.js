const Photo = require('../models/Photo');

const getSingleImageFromDB = (req, res) => {
    Photo.display_Photo().then((path) => {
        console.log(path[0].filePath);
        res.render('display', { photo: path[0].filePath });
        //res.render('display', {photo : "2021-10-12T13-43-34.442Z-dog.jpg"})
        res.send({photo : path[0].filePath})
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