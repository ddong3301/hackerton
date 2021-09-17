const app = require("../app");
const http = require('http');

var port = process.env.PORT || '3000';

server = http.createServer(app);

server.listen(port, () => {
    console.log('Server on ' + port);
});