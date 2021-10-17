const Photo = require('../models/Photo');

const getSingleImageFromDB = (req, res) => {
    Photo.display_Photo()
    .then((path) => {
        //res.render('display', { photo: path[0].filePath });
        res.send({photo : path.filePath});
    })
}

const getImagesFromDB = (req, res) => {
    Photo.display_Gallery().then((data) => {
        console.log(data);
        //res.render('gallery', { photo: data.allImages, photoDate: data.ImagesDate })
        res.send({data : data});
    });
}

module.exports = {
    getImagesFromDB,
    getSingleImageFromDB
}