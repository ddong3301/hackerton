const mysql = require("mysql");
require('dotenv').config({ path: ".env" });

// Todo: || vs &&
const db = mysql.createConnection({
  host: process.env.DB_host || "uyu7j8yohcwo35j3.cbetxkdyhwsb.us-east-1.rds.amazonaws.com",
  port: process.env.DB_port || 3306,
  user: process.env.DB_user || "l30l81n4fti76k02",
  password: process.env.DB_password || "sp6i6qnjclv70igo",
  database: process.env.DB_database || "fskqv498j7eqmq1r",
  dateStrings: true
})

// todo: 삼항연산자
handleDisconnect(db);

function handleDisconnect(client) {
  client.on('error', function (error) {
    if (!error.fatal) return;
    if (error.code !== 'PROTOCOL_CONNECTION_LOST') throw err;

    console.error('> Re-connecting lost MySQL connection: ' + error.stack);

    db = mysql.createConnection(client.config);
    handleDisconnect(db);
    db.connect();
  });
};

module.exports = db;