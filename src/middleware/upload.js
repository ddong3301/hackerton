const multer = require('multer');
var timezoneOffset = new Date().getTimezoneOffset() * 60000; 
var timezoneDate = new Date(Date.now() - timezoneOffset); 
const dayjs = require('dayjs');
const date = new Date();

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'src/uploads/');
    },
    filename: (req, file, cb) => {
        let filename = timezoneDate.toISOString().replace(/:/g, '-') + '-' + file.originalname;
        cb(null, filename);
    }
});

const upload = multer({
    storage,
});

module.exports = { upload };