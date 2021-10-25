// require('dotenv').config({ path: ".env" });

const sendNoti = () => {
    const apn = require('apn');

    var options = {
        gateway: "gateway.sandbox.push.apple.com",
        cert: "./cert/cert.pem",
        key: "./cert/key.pem",
        keyId: "Subeye key",
        teamId: "JUNHYEOK GO"
    };

    var apnConnection = new apn.Provider(options);

    let deviceToken = "1f7c29ec69bd2f9dde62bbece81b60a6453698f1e6fa7a3648aa8f79a7509c1e";

    var note = new apn.Notification();
    note.badge = 1;
    note.sound = "default";
    note.alert = '무임승차 적발';
    note.topic = 'Twogudak.Subeye';
    note.payload = { 'message': '푸쉬테스트입니다' };
    console.log('asd');

    apnConnection.send(note, deviceToken).then(function (result) {
        console.log(result);
        apnConnection.shutdown();
    }).catch(function (err) {
        throw (err);
    });
    console.log(apnConnection);
}

module.exports = sendNoti;

