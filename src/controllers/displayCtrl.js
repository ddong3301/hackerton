const Photo = require('../models/Photo');
const jwt = require('jsonwebtoken');

const getImagesFromDB = (req, res) => {
    let token = req.cookies.x_auth;
    let decoded_token = jwt.verify(token, 'secret_key');
    Photo.display_Gallery().then((data) => {
        for (var i = 0; i < data.length; i++) {
            // if (decoded_token.region == data[i].photoRegion) {
                // console.log(data[i]);
                res.send({ data: data });
            // }
        }

    });
}

module.exports = {
    getImagesFromDB,
}