const multer = require('multer');
var timezoneOffset = new Date().getTimezoneOffset() * 60000; 
var timezoneDate = new Date(Date.now() - timezoneOffset); 

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'src/uploadVi/');
    },
    filename: (req, file, cb) => {
        let filename = file.originalname;
        cb(null, filename);
    }
});

const uploadVid = multer({
    storage,
});

module.exports = { uploadVid };