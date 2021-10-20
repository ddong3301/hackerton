var apn = require('apn');

var options = {
    gateway: "gateway.sandbox.push.apple.com",
    cert: './keys/cert.pem',
    key: './keys/key.pem'
};

var apnConnection = new apn.Connection(options);

var token = '획득한 디바이스토큰을 넣는다.';

var myDevice = new apn.Device(token);

var note = new apn.Notification();
note.badge = 3;
note.alert = 'New Photo Arrive';
note.payload = { 'message': 'New Photo Arrive' };


apnConnection.on("connected", function () {
    console.log("Connected");
});

apnConnection.on("transmitted", function (notification, device) {
    console.log("Notification transmitted to:" + device.token.toString("hex"));
});

apnConnection.on("transmissionError", function (errCode, notification, device) {
    console.error("Notification caused error: " + errCode + " for device ", device, notification);
    if (errCode === 8) {
        console.log("A error code of 8 indicates that the device token is invalid. This could be for a number of reasons - are you using the correct environment? i.e. Production vs. Sandbox");
    }
});

apnConnection.on("timeout", function () {
    console.log("Connection Timeout");
});

apnConnection.on("disconnected", function () {
    console.log("Disconnected from APNS");
});

apnConnection.on("socketError", console.error);

const sendAlert = apnConnection.pushNotification(note, myDevice);

module.exports = sendAlerts;
