// const { User } = require('../models/User');

// let auth = (req, res, next) => {
//     let token = req.cookies.x_auth;

//     //token 복호화, models/User.js
//     User.findByToken(token, (err, user) => {
//         if(err) throw err;
//         if(!user) return res.json({isAuth : false, error : true});

//         req.token = token;
//         req.user = user;
//         next();
//     });
// };

// module.exports = {
//     auth,
// };