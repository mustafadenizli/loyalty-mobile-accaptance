const {config} = require("../wdio.browserStack.conf");

config.capabilities = [
    {
        project: "Loyalty",
        os_version: '10.0',
        device: 'Xiaomi Redmi Note 9',
        "app_url": "bs://377a9583d31f2bb09e5c0b9a96f08fd68c059a80",
        "browserstack.idleTimeout" : "300",
        acceptInsecureCerts: 'true',
        autoGrantPermissions: 'true',
        maxInstances: 5,
    },
];
config.services = ["browserstack"];
config.user = "eneserdoan_5ocBua";
config.key = "CXTs5aPDQsX9NMCVaj99";
exports.config = config;
