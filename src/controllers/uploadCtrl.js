const Photo = require('../models/Photo');

// const singleFileUpload = (req, res) => {
//     try {
//         // let path = 
//         //path = path.replace(/\\/g, '/');
//         // console.log(req.file);
//         const parameters = {
//             fileName: req.file.originalname,
//             filePath: req.file.location,
//             fileType: req.file.mimetype,
//             g_num: req.body.g_num
//         }
//         Photo.insert_Photo(parameters)
//         .then(() => {
//             // console.log(db_data);
//             // res.sendStatus(200);
//             res.redirect('display');
//         })
//     } catch(err) {
//         res.status(400).send(err.message);
//     }
// }

const fileUpload = (req, res) => {
    try {
        const parameters = {
            fileName: req.file.originalname,
            simplePath: req.file.location,
            fullPath: req.file.location,
            fileType: req.file.mimetype,
            g_num: req.body.g_num
        }
        Photo.insert_Photo(parameters)
        .then(() => {
            res.redirect('display');
        })
    } catch(err) {
        res.status(400).send(err.message);
    }
}


module.exports = {
    //singleFileUpload
    fileUpload
}