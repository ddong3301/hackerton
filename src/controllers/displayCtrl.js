const Photo = require('../models/Photo');

const getImagesFromDB = (req, res) => {
    Photo.find((err, photos) => {
        var allImages = [];
        var i = 0;
        if (err) {
            console.log('err', err);
        } else {
            photos.forEach(function (row) {
                allImages.push(row.filePath);
                console.log(allImages);
            });   
            res.render('display', { photo: allImages });
        }
    });
}

module.exports = {
    getImagesFromDB
}