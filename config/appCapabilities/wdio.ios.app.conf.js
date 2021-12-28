const {config} = require("../wdio.conf");
const path = require("path");

config.capabilities = [
    {
        platformName: "iOS",
        platformVersion: "15.0",
        deviceName: "iPhone 12 mini",
        app: path.resolve("/Users/mustafa.denizli/Downloads/Modanisa.app")
    },
];

/*
// iOS Real Device for apps
config.appCapabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.4",
        deviceName: "iPhone 12 Pro Max",
        app: path.resolve("/Users/enes.erdogan/Downloads/Modanisa.app")
    },
];

// iOS Real Device for mobile-web
config.appCapabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.5",
        deviceName: "iPhone 12 Pro Max",
        browserName: "Safari"
    },
];


// iOS Simulator Device for app
config.appCapabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.4",
        deviceName: "iPhone 12 Pro Max",
        app: "/Users/enes.erdogan/Downloads/ModanisaE.app"
    },
];

// iOS Simulator Device for mobile-web
config.appCapabilities = [
    {
        platformName: "iOS",
        platformVersion: "14.5",
        deviceName: "iPhone 12 Pro Max",
        browserName: "Safari"
    },
    ];
 */


exports.config = config;