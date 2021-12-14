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
        build: "User - " + day + ":" + month + ":" + year + "-" + hour + ":" + min + ":" + sec,
        //platformName: "Android",
        realMobile: true,
        device: 'iPhone 12',
        os_version: "14",
        app: "bs://e243099bac6a4e7643349eb767aa0fd1ee46fd8f",
        fullReset: false,
        "browserstack.networkLogs": "true",
        "browserstack.appium_version": "1.21.0",
        "browserstack.acceptInsecureCerts": "true",
        "browserstack.networkProfile": "4g-lte-advanced-good"
    },
];

/*
  {
        project: "Loyalty",
        build: "User - "+day + ":" + month + ":" + year + "-" + hour + ":" + min + ":" + sec,
        platformName: "Android",
        deviceName: "Samsung Galaxy A51",
        version: "11.0",
        app: "bs://96e942319e5485e540fa9266d2e5fc6cf274423d",
        appPackage: "com.modanisa.debug",
        appActivity: "com.modanisa.activity.SplashActivity",
        fullReset: false,
    },
 */
exports.config = config;
