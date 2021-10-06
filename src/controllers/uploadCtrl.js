const Photo = require('../models/Photo');

// const singleFileUpload = (req, res) => {
//     try { 
//         const file = new Photo({
//             fileName: req.file.originalname,
//             filePath: req.file.path,
//             fileType: req.file.mimetype,
//         });
//         file.save();
//         console.log(file);
//         res.redirect('display');
//     } catch(err) {
//         res.status(400).send(err.message)
//     }
// }

const singleFileUpload = (req, res) => {
    try {
        path = req.file.path
        path = path.replace(/\\/g, '/');
        const parameters = {
            fileName: req.file.originalname,
            filePath: path,
            fileType: req.file.mimetype,
        }
        Photo.insert_Photo(parameters).then((db_data) => {
            res.redirect('display');
        })
    } catch(err) {
        res.status(400).send(err.message);
    }
}

module.exports = {
    singleFileUpload
}