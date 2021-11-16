const {config} = require("../wdio.browserStack.conf");
config.capabilities = [
    {
        project: "Loyalty",
        build: process.env.JOB_ID_APK,
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
