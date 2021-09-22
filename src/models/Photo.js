const mongoose = require('mongoose');
const dayjs = require('dayjs');
const date = new Date();

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
    },
    date : {
        type: Date,
        default: dayjs(date).format('YYYY-MM-DD HH:mm:ss')
    }
});

const Photo = mongoose.model('Photo', photoSchema);

module.exports = Photo;