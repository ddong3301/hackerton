const Photo = require('../models/Photo');

const getImagesFromDB = (req, res) => {
    Photo.find((err, photos) => {
        var allImages = [];
        var ImagesDate = [];
        var i = 0;
        if (err) {
            console.log('err', err);
        } else {
            photos.forEach(function (data) {
                allImages.push(data.filePath);
                ImagesDate.push(data.date);
                console.log("[" + allImages[i] + "]" + " " + "[" + i + "]");
                console.log("[" + ImagesDate[i] + "]" + "[" + i + "]");
                i++;
            });   
            res.render('display', { photo: allImages, photoDate: ImagesDate });
        }   
    });     
}           

module.exports = {
    getImagesFromDB,
}           