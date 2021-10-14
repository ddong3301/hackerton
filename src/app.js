const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');

require('dotenv').config();
require('./config/dbConn');

const userRouter = require('./router/userRoute');
const uploadRouter = require('./router/uploadRoute');
const noticeRouter = require('./router/noticeRoute');
const vidRouter = require('./router/vidRouter');

const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(express.json());
app.use(cookieParser());
app.use(express.urlencoded({extended: false}));
app.use(express.static(path.join(__dirname, '../')));

app.use('/', userRouter);
app.use('/', uploadRouter);
app.use('/', noticeRouter);
app.use('/', vidRouter);
module.exports = app;