const Photo = require('../models/Photo');

const getSingleImageFromDB = (req, res) => {
    Photo.display_Photo().then((path) => {
        res.render('display', { photo: path[0].filePath });
    })
}

const getImagesFromDB = (req, res) => {
    Photo.display_Gallery().then((data) => {
            res.render('gallery', { photo: data.allImages, photoDate: data.ImagesDate })
    })
}

// const getImagesFromDB = (req, res) => {
//     if (req.cookies.x_auth) {
//         Photo.find((err, photos) => {
//             var allImages = [];
//             var ImagesDate = [];
//             var i = 0;
//             if (err) {
//                 console.log('err : ', err);
//             } else {
//                 photos.forEach(function (data) {
//                     allImages.push(data.filePath);
//                     ImagesDate.push(data.date);
//                     console.log("[" + allImages[i] + "]" + " " + "[" + i + "]");
//                     console.log("[" + ImagesDate[i] + "]" + "[" + i + "]");
//                     i++;
//                 });
//                 res.render('gallery', { photo: allImages, photoDate: ImagesDate });
//             }
//         });
//     }
//     else
//         res.redirect('/login')
// }

// const getSingleImageFromDB = (req, res) => {
//     if (req.cookies.x_auth) {
//         Photo.findOne().sort({_id:-1}).exec((err, photos) => {
//             var image;
//             var i = 0;
//             if(err) {
//                 console.log('err : ', err);
//             } else {
//                 console.log(photos.filePath);
//                 image = photos.filePath;
//             }
//             res.render('display', { photo: image});
//         })
//     } else
//         res.redirect('/login')
// }

module.exports = {
    getImagesFromDB,
    getSingleImageFromDB
}