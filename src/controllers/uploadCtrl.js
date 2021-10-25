const Photo = require('../models/Photo');
const User = require('../models/User');
const sendNoti = require('../middleware/push');

const singleFileUpload = (req, res) => {
    let deviceToken;
    try {
        const parameters = {
            fileName: req.file.originalname,
            filePath: req.file.location,
            fileType: req.file.mimetype,
            g_num: req.body.g_num,
            c_num: req.body.c_num,
            u_num: req.body.u_num, //1 = 어린이, 2 = 노인
            createAt: req.body.createAt,
            photoRegion: req.body.photoRegion
        }
        if (parameters.u_num == 1) {
            parameters.u_num = '어린이';
        } else if (parameters.u_num == 2) {
            parameters.u_num = '노인';
        }
        Photo.insert_Photo(parameters)
            .then(() => {
                User.getSameRegion(parameters)
                    .then((data) => {
                        if (data[0].region == parameters.photoRegion) {
                            User.getDeviceToken(parameters)
                            .then((token) => {
                                deviceToken = token;
                                // console.log(deviceToken);
                                sendNoti(deviceToken);
                            }) 
                        }
                    })
                res.sendStatus(200);
            })
    } catch (err) {
        res.status(400).send(err.message);
    }
}

const is_Arrest = (req, res) => {
    const parameters = {
        f_num: req.body.f_num
    }
    Photo.isArrest(parameters)
        .then(() => {
            res.sendStatus(200);
        })
}

module.exports = {
    singleFileUpload,
    is_Arrest
}