const {config} = require("../wdio.browserStack.conf");
let count = true
let today = new Date();
let dd = String(today.getDate()).padStart(2, '0');
let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
let yyyy = today.getFullYear();

today = dd + '/' + mm + '/' + yyyy;

config.capabilities = [
    {
        project: "Loyalty",
        build: "Loyalty",
        platformName: "Android",
        deviceName: "Samsung Galaxy A51",
        version: "10.0",
        app: process.env.APP_ID,
        appPackage: "com.modanisa.debug",
        appActivity: "com.modanisa.activity.SplashActivity",
        fullReset: false,

    },
];
exports.config = config;
