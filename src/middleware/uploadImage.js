const multer = require('multer');
var timezoneOffset = new Date().getTimezoneOffset() * 60000;
var timezoneDate = new Date(Date.now() - timezoneOffset);
const multerS3 = require('multer-s3');
const aws = require('aws-sdk');
require('dotenv').config({ path : ".env" });

const s3 = new aws.S3({
    "accessKeyId" : process.env.accessKeyId,
    "secretAccessKey" : process.env.secretAccessKey,
    "region" : process.env.region
})

const upload = multer({
    storage: multerS3({
        s3: s3,
        bucket: "hackerton",
        acl: 'public-read-write',
        key: (req, file, cb) => {
            let filename = timezoneDate.toISOString().replace(/:/g, '-') + '-' + file.originalname;
            cb(null, filename);
        },
        limits: {
            fileSize: 1000 * 1000 * 10
        }
    })
})

module.exports = upload;