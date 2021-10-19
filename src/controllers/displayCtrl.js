const Photo = require('../models/Photo');

const getImagesFromDB = (req, res) => {
    Photo.display_Gallery().then((data) => {
        res.send({data : data});
    });
}

module.exports = {
    getImagesFromDB,
}