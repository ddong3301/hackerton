const Photo = require('../models/Photo');
const jwt = require('jsonwebtoken');

const getImagesFromDB = (req, res) => {
    let token = req.cookies.x_auth;
    let decoded_token = jwt.verify(token, 'secret_key');
    let parameters = {
        region: decoded_token.region
    }
    Photo.display_Gallery(parameters).then((data) => {
        res.send({data : data});
    });
}

module.exports = {
    getImagesFromDB,
}