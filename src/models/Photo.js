const mongoose = require('mongoose');

const photoSchema = mongoose.Schema({
    fileName : {
        type: String,
        required: true
    },
    filePath: {
        type: String,
        required: true
    },
    fileType: {
        type: String,
        required: true
    }
});

const Photo = mongoose.model('Photo', photoSchema);

module.exports = Photo;