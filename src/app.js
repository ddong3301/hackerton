const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');

require('dotenv').config();

const userRouter = require('./router/userRoute');
const uploadRouter = require('./router/uploadRoute');
const noticeRouter = require('./router/noticeRoute');
require('./config/dbConn');

const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.json());
app.use(express.urlencoded({extended: true, limit: '5mb'}));

app.use(cookieParser('asddsadas'));
app.use(express.static(path.join(__dirname, '../')));

app.use('/', userRouter);
app.use('/', uploadRouter);
app.use('/', noticeRouter);

module.exports = app;