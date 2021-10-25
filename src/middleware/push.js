// require('dotenv').config({ path: ".env" });

// const sendNoti = () => {
const apn = require('apn');

var options = {
    gateway: "gateway.sandbox.push.apple.com",
    cert: "./cert/cert.pem",
    key: "./cert/key.pem",
    keyId: "Subeye key",
    teamId: "JUNHYEOK GO",
};

console.log(options);

var apnConnection = new apn.Provider(options);

let deviceToken = "b42f0038bda996cb120ea3dbf3bd8e81dd43efe30b77ec04eef26b9dfebb3c5a";

var note = new apn.Notification();
note.badge = 1;
note.sound = "default";
note.alert = '무임승차 적발';
note.topic = 'Twogudak.Subeye';
note.payload = { 'message': '푸쉬테스트입니다' };

apnConnection.send(note, deviceToken).then((result) => {
    console.log(result);
}).catch(function (err) {
    console.log(err);
    throw (err);
});
// }

// module.exports = sendNoti;

