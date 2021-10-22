require('dotenv').config({ path: ".env" });

const sendNoti = () => {
    const apn = require('apn');

    var options = {
        gateway: "gateway.sandbox.push.apple.com",
        cert: "./cert/cert.pem",
        key: "./cert/key.pem",
        keyId : process.env.keyId,
        teamId : process.env.teamId
    };
    
    
    var apnConnection = new apn.Provider(options);
   
    let deviceToken = process.env.deviceToken;

    var note = new apn.Notification();
    note.badge = 1;
    note.sound = "default";
    note.alert = '무임승차 적발';
    note.topic = 'Twogudak.Subeye';
    note.payload = { 'message': '푸쉬테스트입니다' };
    
    apnConnection.send(note, deviceToken).then((result) => {
        console.log(result);
    }).catch(function (err) {
        throw (err);
    });
    
}

module.exports = sendNoti;

