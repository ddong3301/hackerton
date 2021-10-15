const multer = require('multer');
var timezoneOffset = new Date().getTimezoneOffset() * 60000;
var timezoneDate = new Date(Date.now() - timezoneOffset);
const multerS3 = require('multer-s3');
const aws = require('aws-sdk');
aws.config.loadFromPath(__dirname + '/../config/awsconfig.json');
const s3 = new aws.S3();

// const storage = multer.diskStorage({
//     destination: (req, file, cb) => {
//         cb(null, 'src/uploads/');
//     },
//     filename: (req, file, cb) => {
//         let filename = timezoneDate.toISOString().replace(/:/g, '-') + '-' + file.originalname;
//         cb(null, filename);
//     }
// });

const upload = multer({
    storage: multerS3({
        s3: s3,
        bucket: "hackerton",
        acl: 'public-read-write',
        key: (req, file, cb) => {
            let filename = timezoneDate.toISOString().replace(/:/g, '-') + '-' + file.originalname;
            cb(null, filename);
            //cb(null, Math.floor(Math.random() * 1000).toString() + Date.now() + '.' + file.originalname.split('.').pop());
        },
        limits: {
            fileSize: 1000 * 1000 * 10
        }
    })
})

// const uploadImg = multer({
//     //storage,
//     upload
// });

//module.exports = { uploadImg };
module.exports = upload;