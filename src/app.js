const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');

require('dotenv').config();

const userRouter = require('./router/userRoute');
const uploadRouter = require('./router/uploadRoute');
const noticeRouter = require('./router/noticeRoute');
const vidRouter = require('./router/vidRouter');
require('./config/dbConn');

const app = express();


app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// body- parser
app.use(express.json());
app.use(express.urlencoded({extended: false, limit: '5mb'}));

app.use(cookieParser('asddsadas'));
app.use(express.static(path.join(__dirname, '../')));

// app.use(errHandler);

// todo: router 수정 
app.use('/', userRouter);
app.use('/', uploadRouter);
app.use('/', noticeRouter);
app.use('/', vidRouter);

module.exports = app;