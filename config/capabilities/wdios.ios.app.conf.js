const { config } = require("../wdio.conf");

// iOS Real Device for apps 
config.capabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.4",
        deviceName: "iPhone 12 Pro Max",
        app: "/Users/enes.erdogan/Downloads/ModanisaE.app"
    },
];

// iOS Real Device for mobile-web 
config.capabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.5",
        deviceName: "iPhone 12 Pro Max",
        browserName: "Safari"    },
];


// iOS Simulator Device for app
config.capabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.4",
        deviceName: "iPhone 12 Pro Max",
        app: "/Users/enes.erdogan/Downloads/ModanisaE.app"
    },
];

// iOS Simulator Device for mobile-web
config.capabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.5",
        deviceName: "iPhone 12 Pro Max",
        browserName: "Safari"
    },
];

exports.config = config;