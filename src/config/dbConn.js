// require('dotenv').config();
// const mongoose = require('mongoose');

// mongoose.connect(process.env.MONGO_URI, {
//     useNewUrlParser: true,
//     useUnifiedTopology: true,
// })
//     .then(() => { console.log('Database Connected'); })
//     .catch((err) => { console.log(err); });

// const mariadb = require('mariadb');

// const pool = mariadb.createPool({
//     host: '127.0.0.1',
//     port: 3308,
//     user: 'root',
//     password: 'Ehdguq23!',
//     database: 'hackerton'
// })

// pool.getConnection()
//     .then(() => { console.log('MariaDB Connected'); })
//     .catch((err) => { console.log(err); });

// module.exports = mariadb;

const mysql = require("mysql");
require('dotenv').config({ path : ".env" });

const db = mysql.createConnection({
  host: process.env.DB_host || '127.0.0.1',
  port: process.env.DB_port || 3308,
  user: process.env.DB_user || 'root',
  password: process.env.DB_password || 'Ehdguq23!',
  database: process.env.DB_database || 'hackerton',
  dateStrings: true
})
// const db = mysql.createConnection({
//     host: process.env.DB_LOCAL_HOST || '127.0.0.1',
//     port: process.env.DB_LOCAL_PORT || 3308,
//     user: process.env.DB_LOCAL_USER || 'root',
//     password: process.env.DB_LOCAL_PASSWORD || 'Ehdguq23!',
//     database: process.env.DB_LOCAL_DATABASE || 'hackerton',
//     dateStrings: true
//   })

handleDisconnect(db);

function handleDisconnect(client){
    client.on('error', function (error) {
       if(!error.fatal) return;
       if (error.code !== 'PROTOCOL_CONNECTION_LOST') throw err;

        console.error('> Re-connecting lost MySQL connection: ' + error.stack);

        db = mysql.createConnection(client.config);
        handleDisconnect(db);
        db.connect();
    });
};

module.exports =  db;