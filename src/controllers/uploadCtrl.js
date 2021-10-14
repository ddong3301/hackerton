const Photo = require('../models/Photo');

// const singleFileUpload = (req, res) => {
//     try {
//         path = req.file.path
//         path = path.replace(/\\/g, '/');
//         console.log(req.file);
//         const parameters = {
//             fileName: req.file.originalname,
//             filePath: path,
//             fileType: req.file.mimetype,
//         }
//         Photo.insert_Photo(parameters).then((db_data) => {
//             console.log(db_data);
//             res.sendStatus(200);
//             //res.redirect('display');
//         })
//     } catch(err) {
//         res.status(400).send(err.message);
//     }
// }

// module.exports = {
//     singleFileUpload
// }