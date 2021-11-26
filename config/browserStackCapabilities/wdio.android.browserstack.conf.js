const {config} = require("../wdio.browserStack.conf");
let date = new Date();
let hour = date.getHours();
hour = (hour < 10 ? "0" : "") + hour;
let min = date.getMinutes();
min = (min < 10 ? "0" : "") + min;
let sec = date.getSeconds();
sec = (sec < 10 ? "0" : "") + sec;
let year = date.getFullYear();
let month = date.getMonth() + 1;
month = (month < 10 ? "0" : "") + month;
let day = date.getDate();
day = (day < 10 ? "0" : "") + day;

config.capabilities = [
    {
        project: "Loyalty",
        build: day + ":" + month + ":" + year + "-" + hour + ":" + min + ":" + sec,
        platformName: "Android",
        deviceName: "Samsung Galaxy A51",
        version: "10.0",
        app: "bs://96e942319e5485e540fa9266d2e5fc6cf274423d",
        appPackage: "com.modanisa.debug",
        appActivity: "com.modanisa.activity.SplashActivity",
        fullReset: false,
    },
];
exports.config = config;
