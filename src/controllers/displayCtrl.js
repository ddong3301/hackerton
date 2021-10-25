const Photo = require('../models/Photo');
const jwt = require('jsonwebtoken');

const getImagesFromDB = (req, res) => {
    let token = req.cookies.x_auth;
    let decoded_token = jwt.verify(token, 'secret_key');
    let organizeData;
    Photo.display_Gallery().then((data) => {
        for (var i = 0; i < data.length; i++) {
            if (decoded_token.region == data[i].photoRegion) {
                organizeData = data;

            }
        }
        console.log(organizeData);
        res.send({data : organizeData});
    });
}

// const getImagesFromDB = (req, res) => {
//     let token = req.cookies.x_auth;
//     let decoded_token = jwt.verify(token, 'secret_key');
//     Photo.display_Gallery().then((data) => {
//         for (var i = 0; i < data.length; i++) {
//             if (decoded_token.region == data[i].photoRegion) {
//                 asd = data;

//             }
//         }
//         console.log(asd);
//         console.log(data);
//         res.send({ data: data });
//     });
// }

module.exports = {
    getImagesFromDB,
}